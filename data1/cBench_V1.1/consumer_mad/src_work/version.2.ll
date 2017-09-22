; ModuleID = 'tmp1.ll'
source_filename = "version.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [9 x i8] c"%s %s - \00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"MPEG Audio Decoder\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"0.14.2 (beta)\00", align 1
@.str.3 = private unnamed_addr constant [782 x i8] c"This program is free software; you can redistribute it and/or modify it\0Aunder the terms of the GNU General Public License as published by the\0AFree Software Foundation; either version 2 of the License, or (at your\0Aoption) any later version.\0A\0AThis program is distributed in the hope that it will be useful, but\0AWITHOUT ANY WARRANTY; without even the implied warranty of\0AMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU\0AGeneral Public License for more details.\0A\0AYou should have received a copy of the GNU General Public License along\0Awith this program; if not, write to the Free Software Foundation, Inc.,\0A59 Temple Place, Suite 330, Boston, MA 02111-1307 USA\0A\0AIf you would like to negotiate alternate licensing terms, you may do so\0Aby contacting the author: %s <%s>\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"Robert Leslie\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"rob@mars.org\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"%s %s %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"Copyright (C)\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"2000-2001\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ver_banner = private constant [10 x i8] c"ver_banner"
@__profn_tmp1.ll_copyright = private constant [17 x i8] c"tmp1.ll:copyright"
@__profn_ver_license = private constant [11 x i8] c"ver_license"
@__profc_ver_banner = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ver_banner = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3514958166703718693, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ver_banner, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*)* @ver_banner to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_copyright = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_copyright = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7641008321593019211, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_copyright, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ver_license = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ver_license = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5633466704992172937, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ver_license, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*)* @ver_license to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [42 x i8] c"(\00ver_banner\01tmp1.ll:copyright\01ver_license", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ver_banner to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_copyright to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ver_license to i8*), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @ver_banner(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ver_banner, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ver_banner, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0))
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  call void @copyright(%struct._IO_FILE* %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @fflush(%struct._IO_FILE* %7)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @copyright(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_copyright, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_copyright, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0))
  ret void
}

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define void @ver_license(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ver_license, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ver_license, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  call void @copyright(%struct._IO_FILE* %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @fputc(i32 10, %struct._IO_FILE* %7)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([782 x i8], [782 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %12 = call i32 @fputc(i32 10, %struct._IO_FILE* %11)
  ret void
}

declare i32 @fputc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
