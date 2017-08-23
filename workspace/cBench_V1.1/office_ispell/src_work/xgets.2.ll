; ModuleID = 'tmp1.ll'
source_filename = "xgets.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@xgets.Include_File = internal global i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), align 8
@.str = private unnamed_addr constant [15 x i8] c"&Include_File&\00", align 1
@xgets.Include_Len = internal global i32 0, align 4
@xgets.F = internal global [6 x %struct._IO_FILE*] zeroinitializer, align 16
@xgets.current_F = internal global %struct._IO_FILE** getelementptr inbounds ([6 x %struct._IO_FILE*], [6 x %struct._IO_FILE*]* @xgets.F, i32 0, i32 0), align 8
@.str.1 = private unnamed_addr constant [15 x i8] c"INCLUDE_STRING\00", align 1
@incfileflag = external global i32, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_xgets = private constant [5 x i8] c"xgets"
@__profc_xgets = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_xgets = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6514075761237726638, i64 197287565300, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i32 0, i32 0), i8* bitcast (i8* (i8*, i32, %struct._IO_FILE*)* @xgets to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [15 x i8] c"\05\0Dx\DA\ABHO-)\06\00\06\83\02,", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_xgets to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i8* @xgets(i8*, i32, %struct._IO_FILE*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct._IO_FILE* %2, %struct._IO_FILE** %7, align 8
  %13 = load i8*, i8** %5, align 8
  store i8* %13, i8** %8, align 8
  %14 = load i32, i32* @xgets.Include_Len, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %29

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 12)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 12)
  %18 = call i8* @getenv(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0)) #4
  store i8* %18, i8** %10, align 8
  %19 = icmp ne i8* %18, null
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 13)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 13)
  %22 = load i8*, i8** %10, align 8
  store i8* %22, i8** @xgets.Include_File, align 8
  br label %23

; <label>:23:                                     ; preds = %20, %16
  %24 = load i8*, i8** @xgets.Include_File, align 8
  %25 = call i64 @strlen(i8* %24) #5
  %26 = trunc i64 %25 to i32
  store i32 %26, i32* @xgets.Include_Len, align 4
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %28 = load %struct._IO_FILE**, %struct._IO_FILE*** @xgets.current_F, align 8
  store %struct._IO_FILE* %27, %struct._IO_FILE** %28, align 8
  br label %29

; <label>:29:                                     ; preds = %23, %3
  br label %30

; <label>:30:                                     ; preds = %122, %80, %53, %29
  store i32 0, i32* %9, align 4
  %31 = load i8*, i8** %8, align 8
  %32 = load i8*, i8** %5, align 8
  %33 = ptrtoint i8* %31 to i64
  %34 = ptrtoint i8* %32 to i64
  %35 = sub i64 %33, %34
  %36 = add nsw i64 %35, 1
  %37 = load i32, i32* %6, align 4
  %38 = sext i32 %37 to i64
  %39 = icmp slt i64 %36, %38
  br i1 %39, label %40, label %57

; <label>:40:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 2)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 2)
  %42 = load %struct._IO_FILE**, %struct._IO_FILE*** @xgets.current_F, align 8
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %42, align 8
  %44 = call i32 @_IO_getc(%struct._IO_FILE* %43)
  store i32 %44, i32* %9, align 4
  %45 = icmp ne i32 %44, -1
  br i1 %45, label %46, label %57

; <label>:46:                                     ; preds = %40
  %47 = load i32, i32* %9, align 4
  %48 = trunc i32 %47 to i8
  %49 = load i8*, i8** %8, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %8, align 8
  store i8 %48, i8* %49, align 1
  %51 = load i32, i32* %9, align 4
  %52 = icmp ne i32 %51, 10
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 5)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 5)
  br label %30

; <label>:55:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 6)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 6)
  br label %57

; <label>:57:                                     ; preds = %55, %40, %30
  %58 = load i8*, i8** %8, align 8
  store i8 0, i8* %58, align 1
  %59 = load i32, i32* %9, align 4
  %60 = icmp eq i32 %59, -1
  br i1 %60, label %61, label %85

; <label>:61:                                     ; preds = %57
  %62 = load %struct._IO_FILE**, %struct._IO_FILE*** @xgets.current_F, align 8
  %63 = icmp eq %struct._IO_FILE** %62, getelementptr inbounds ([6 x %struct._IO_FILE*], [6 x %struct._IO_FILE*]* @xgets.F, i32 0, i32 0)
  br i1 %63, label %64, label %72

; <label>:64:                                     ; preds = %61
  %65 = load i8*, i8** %8, align 8
  %66 = load i8*, i8** %5, align 8
  %67 = icmp eq i8* %65, %66
  br i1 %67, label %68, label %70

; <label>:68:                                     ; preds = %64
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 14)
  %69 = add i64 %pgocount5, 1
  store i64 %69, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 14)
  store i8* null, i8** %4, align 8
  br label %129

; <label>:70:                                     ; preds = %64
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 9)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 9)
  br label %84

; <label>:72:                                     ; preds = %61
  %73 = load %struct._IO_FILE**, %struct._IO_FILE*** @xgets.current_F, align 8
  %74 = getelementptr inbounds %struct._IO_FILE*, %struct._IO_FILE** %73, i32 -1
  store %struct._IO_FILE** %74, %struct._IO_FILE*** @xgets.current_F, align 8
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %73, align 8
  %76 = call i32 @fclose(%struct._IO_FILE* %75)
  %77 = load i8*, i8** %8, align 8
  %78 = load i8*, i8** %5, align 8
  %79 = icmp eq i8* %77, %78
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %72
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 10)
  %81 = add i64 %pgocount7, 1
  store i64 %81, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 10)
  br label %30

; <label>:82:                                     ; preds = %72
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 8)
  %83 = add i64 %pgocount8, 1
  store i64 %83, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 8)
  br label %84

; <label>:84:                                     ; preds = %82, %70
  br label %85

; <label>:85:                                     ; preds = %84, %57
  %86 = load i32, i32* @incfileflag, align 4
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %125

; <label>:88:                                     ; preds = %85
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 0)
  %89 = add i64 %pgocount9, 1
  store i64 %89, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 0)
  %90 = load i8*, i8** %5, align 8
  %91 = load i8*, i8** @xgets.Include_File, align 8
  %92 = load i32, i32* @xgets.Include_Len, align 4
  %93 = zext i32 %92 to i64
  %94 = call i32 @strncmp(i8* %90, i8* %91, i64 %93) #5
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %125

; <label>:96:                                     ; preds = %88
  %97 = load i8*, i8** %5, align 8
  %98 = load i32, i32* @xgets.Include_Len, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8, i8* %97, i64 %99
  store i8* %100, i8** %11, align 8
  %101 = load %struct._IO_FILE**, %struct._IO_FILE*** @xgets.current_F, align 8
  %102 = ptrtoint %struct._IO_FILE** %101 to i64
  %103 = sub i64 %102, ptrtoint ([6 x %struct._IO_FILE*]* @xgets.F to i64)
  %104 = sdiv exact i64 %103, 8
  %105 = icmp slt i64 %104, 5
  br i1 %105, label %106, label %122

; <label>:106:                                    ; preds = %96
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 3)
  %107 = add i64 %pgocount10, 1
  store i64 %107, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 3)
  %108 = load i8*, i8** %11, align 8
  %109 = call i64 @strlen(i8* %108) #5
  %110 = icmp ne i64 %109, 0
  br i1 %110, label %111, label %122

; <label>:111:                                    ; preds = %106
  %112 = load i8*, i8** %11, align 8
  %113 = call %struct._IO_FILE* @fopen(i8* %112, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %113, %struct._IO_FILE** %12, align 8
  %114 = icmp ne %struct._IO_FILE* %113, null
  br i1 %114, label %115, label %120

; <label>:115:                                    ; preds = %111
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 7)
  %116 = add i64 %pgocount11, 1
  store i64 %116, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 7)
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %118 = load %struct._IO_FILE**, %struct._IO_FILE*** @xgets.current_F, align 8
  %119 = getelementptr inbounds %struct._IO_FILE*, %struct._IO_FILE** %118, i32 1
  store %struct._IO_FILE** %119, %struct._IO_FILE*** @xgets.current_F, align 8
  store %struct._IO_FILE* %117, %struct._IO_FILE** %119, align 8
  br label %120

; <label>:120:                                    ; preds = %115, %111
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 4)
  %121 = add i64 %pgocount12, 1
  store i64 %121, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 4)
  br label %122

; <label>:122:                                    ; preds = %120, %106, %96
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 1)
  %123 = add i64 %pgocount13, 1
  store i64 %123, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 1)
  %124 = load i8*, i8** %5, align 8
  store i8* %124, i8** %8, align 8
  br label %30

; <label>:125:                                    ; preds = %88, %85
  br label %126

; <label>:126:                                    ; preds = %125
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 11)
  %127 = add i64 %pgocount14, 1
  store i64 %127, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_xgets, i64 0, i64 11)
  %128 = load i8*, i8** %5, align 8
  store i8* %128, i8** %4, align 8
  br label %129

; <label>:129:                                    ; preds = %126, %68
  %130 = load i8*, i8** %4, align 8
  ret i8* %130
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

declare i32 @_IO_getc(%struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
