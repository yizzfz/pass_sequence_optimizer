; ModuleID = 'tmp1.ll'
source_filename = "main.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [2 x i8] c"-\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [24 x i8] c"Could not create \22%s\22.\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"mp3 buffer is not big enough... \0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Error writing mp3 output\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profc_main1 = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 109005526804, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [15 x i8] c"\05\0Dx\DA\CBM\CC\CC3\04\00\05\F2\01\D7", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca [16384 x i8], align 16
  %6 = alloca [2 x [1152 x i16]], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.lame_global_flags, align 8
  %10 = alloca %struct._IO_FILE*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %10, align 8
  call void @lame_init(%struct.lame_global_flags* %9)
  %11 = load i32, i32* %3, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 2)
  %15 = load i8**, i8*** %4, align 8
  %16 = getelementptr inbounds i8*, i8** %15, i64 0
  %17 = load i8*, i8** %16, align 8
  call void @lame_usage(%struct.lame_global_flags* %9, i8* %17)
  br label %18

; <label>:18:                                     ; preds = %13, %2
  %19 = load i32, i32* %3, align 4
  %20 = load i8**, i8*** %4, align 8
  call void @lame_parse_args(%struct.lame_global_flags* %9, i32 %19, i8** %20)
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %9, i32 0, i32 4
  %22 = load i32, i32* %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %46, label %24

; <label>:24:                                     ; preds = %18
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %9, i32 0, i32 32
  %26 = load i8*, i8** %25, align 8
  %27 = call i32 @strcmp(i8* %26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)) #5
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %32, label %29

; <label>:29:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 4)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 4)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %31, %struct._IO_FILE** %10, align 8
  br label %45

; <label>:32:                                     ; preds = %24
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %9, i32 0, i32 32
  %34 = load i8*, i8** %33, align 8
  %35 = call %struct._IO_FILE* @fopen(i8* %34, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %35, %struct._IO_FILE** %10, align 8
  %36 = icmp eq %struct._IO_FILE* %35, null
  br i1 %36, label %37, label %43

; <label>:37:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 7)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 7)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %9, i32 0, i32 32
  %41 = load i8*, i8** %40, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i32 0, i32 0), i8* %41)
  call void @exit(i32 1) #6
  unreachable

; <label>:43:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 3)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 3)
  br label %45

; <label>:45:                                     ; preds = %43, %29
  br label %46

; <label>:46:                                     ; preds = %45, %18
  call void @lame_init_infile(%struct.lame_global_flags* %9)
  call void @lame_init_params(%struct.lame_global_flags* %9)
  call void @lame_print_config(%struct.lame_global_flags* %9)
  br label %47

; <label>:47:                                     ; preds = %78, %46
  %48 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %6, i32 0, i32 0
  %49 = call i32 @lame_readframe(%struct.lame_global_flags* %9, [1152 x i16]* %48)
  store i32 %49, i32* %7, align 4
  %50 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %6, i64 0, i64 0
  %51 = getelementptr inbounds [1152 x i16], [1152 x i16]* %50, i32 0, i32 0
  %52 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %6, i64 0, i64 1
  %53 = getelementptr inbounds [1152 x i16], [1152 x i16]* %52, i32 0, i32 0
  %54 = load i32, i32* %7, align 4
  %55 = getelementptr inbounds [16384 x i8], [16384 x i8]* %5, i32 0, i32 0
  %56 = call i32 @lame_encode_buffer(%struct.lame_global_flags* %9, i16* %51, i16* %53, i32 %54, i8* %55, i32 16384)
  store i32 %56, i32* %8, align 4
  %57 = load i32, i32* %8, align 4
  %58 = icmp eq i32 %57, -1
  br i1 %58, label %59, label %63

; <label>:59:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 5)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 5)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:63:                                     ; preds = %47
  %64 = getelementptr inbounds [16384 x i8], [16384 x i8]* %5, i32 0, i32 0
  %65 = load i32, i32* %8, align 4
  %66 = sext i32 %65 to i64
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %68 = call i64 @fwrite(i8* %64, i64 1, i64 %66, %struct._IO_FILE* %67)
  %69 = load i32, i32* %8, align 4
  %70 = sext i32 %69 to i64
  %71 = icmp ne i64 %68, %70
  br i1 %71, label %72, label %76

; <label>:72:                                     ; preds = %63
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 6)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 6)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:76:                                     ; preds = %63
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 0)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 0)
  br label %78

; <label>:78:                                     ; preds = %76
  %79 = load i32, i32* %7, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %47, label %81

; <label>:81:                                     ; preds = %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 1)
  %82 = add i64 %pgocount7, 1
  store i64 %82, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_main1, i64 0, i64 1)
  %83 = getelementptr inbounds [16384 x i8], [16384 x i8]* %5, i32 0, i32 0
  %84 = call i32 @lame_encode_finish(%struct.lame_global_flags* %9, i8* %83, i32 16384)
  store i32 %84, i32* %8, align 4
  %85 = getelementptr inbounds [16384 x i8], [16384 x i8]* %5, i32 0, i32 0
  %86 = load i32, i32* %8, align 4
  %87 = sext i32 %86 to i64
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %89 = call i64 @fwrite(i8* %85, i64 1, i64 %87, %struct._IO_FILE* %88)
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %91 = call i32 @fclose(%struct._IO_FILE* %90)
  call void @lame_close_infile(%struct.lame_global_flags* %9)
  call void @lame_mp3_tags(%struct.lame_global_flags* %9)
  ret i32 0
}

declare void @lame_init(%struct.lame_global_flags*) #1

declare void @lame_usage(%struct.lame_global_flags*, i8*) #1

declare void @lame_parse_args(%struct.lame_global_flags*, i32, i8**) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare void @lame_init_infile(%struct.lame_global_flags*) #1

declare void @lame_init_params(%struct.lame_global_flags*) #1

declare void @lame_print_config(%struct.lame_global_flags*) #1

declare i32 @lame_readframe(%struct.lame_global_flags*, [1152 x i16]*) #1

declare i32 @lame_encode_buffer(%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32) #1

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @lame_encode_finish(%struct.lame_global_flags*, i8*, i32) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare void @lame_close_infile(%struct.lame_global_flags*) #1

declare void @lame_mp3_tags(%struct.lame_global_flags*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
