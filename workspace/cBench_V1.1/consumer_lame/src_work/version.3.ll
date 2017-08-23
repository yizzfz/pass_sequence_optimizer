; ModuleID = 'version.2.ll'
source_filename = "version.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [39 x i8] c"LAME version %s (www.sulaco.org/mp3) \0A\00", align 1
@.str.1 = private unnamed_addr constant [67 x i8] c"GPSYCHO: GPL psycho-acoustic and noise shaping model version %s. \0A\00", align 1
@lpszVersion = internal global [80 x i8] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [8 x i8] c"%d.%02d\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"%d:%02d\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_lame_print_version = private constant [18 x i8] c"lame_print_version"
@__profn_get_lame_version = private constant [16 x i8] c"get_lame_version"
@__profn_get_psy_version = private constant [15 x i8] c"get_psy_version"
@__profn_get_mp3x_version = private constant [16 x i8] c"get_mp3x_version"
@__profc_lame_print_version = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_print_version = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3056181235922142691, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_print_version, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*)* @lame_print_version to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_lame_version = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_lame_version = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 317755111641998373, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_lame_version, i32 0, i32 0), i8* bitcast (i8* ()* @get_lame_version to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_psy_version = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_psy_version = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 189529670652459137, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_psy_version, i32 0, i32 0), i8* bitcast (i8* ()* @get_psy_version to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_mp3x_version = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_mp3x_version = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6954332450409994236, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_mp3x_version, i32 0, i32 0), i8* bitcast (i8* ()* @get_mp3x_version to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [48 x i8] c"D.x\DA\CBI\CCM\8D/(\CA\CC+\89/K-*\CE\CC\CFcLO-\89\CF\01\09#\0B\14\14W\A2\F0s\0B\8C+`\02\00\AA[\1B#", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_print_version to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_lame_version to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_psy_version to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_mp3x_version to i8*), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @lame_print_version(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_print_version, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_print_version, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = call i8* @get_lame_version()
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str, i32 0, i32 0), i8* %5)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i8* @get_psy_version()
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.1, i32 0, i32 0), i8* %8)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i8* @get_lame_version() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_lame_version, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_lame_version, i64 0, i64 0)
  %2 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([80 x i8], [80 x i8]* @lpszVersion, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i32 3, i32 70) #3
  ret i8* getelementptr inbounds ([80 x i8], [80 x i8]* @lpszVersion, i32 0, i32 0)
}

; Function Attrs: nounwind uwtable
define i8* @get_psy_version() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_psy_version, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_psy_version, i64 0, i64 0)
  %2 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([80 x i8], [80 x i8]* @lpszVersion, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i32 0, i32 77) #3
  ret i8* getelementptr inbounds ([80 x i8], [80 x i8]* @lpszVersion, i32 0, i32 0)
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i8* @get_mp3x_version() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_mp3x_version, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_get_mp3x_version, i64 0, i64 0)
  %2 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([80 x i8], [80 x i8]* @lpszVersion, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 0, i32 82) #3
  ret i8* getelementptr inbounds ([80 x i8], [80 x i8]* @lpszVersion, i32 0, i32 0)
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
