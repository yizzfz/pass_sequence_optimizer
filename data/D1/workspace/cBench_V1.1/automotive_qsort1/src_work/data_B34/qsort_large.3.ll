; ModuleID = 'qsort_large.2.ll'
source_filename = "qsort_large.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.my3DVertexStruct = type { i32, i32, i32, double }

$__llvm_profile_raw_version = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"sorted_output.dat\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"wt\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\0AError: Can't open output file\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_compare = private constant [7 x i8] c"compare"
@__profn_main1 = private constant [5 x i8] c"main1"
@__profc_compare = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_compare = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8201330618367245537, i64 72057623705475732, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_compare, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @compare to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main1 = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 133278101103, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**, i32)* @main1 to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [15 x i8] c"\0D\00compare\01main1", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_compare to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @compare(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to %struct.my3DVertexStruct*
  %9 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %8, i32 0, i32 3
  %10 = load double, double* %9, align 8
  store double %10, double* %5, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = bitcast i8* %11 to %struct.my3DVertexStruct*
  %13 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %12, i32 0, i32 3
  %14 = load double, double* %13, align 8
  store double %14, double* %6, align 8
  %15 = load double, double* %5, align 8
  %16 = load double, double* %6, align 8
  %17 = fcmp ogt double %15, %16
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_compare, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_compare, i64 0, i64 0)
  br label %28

; <label>:20:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_compare, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_compare, i64 0, i64 1)
  %22 = load double, double* %5, align 8
  %23 = load double, double* %6, align 8
  %24 = fcmp oeq double %22, %23
  %25 = zext i1 %24 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_compare, i64 0, i64 2)
  %26 = add i64 %pgocount2, %25
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_compare, i64 0, i64 2)
  %27 = select i1 %24, i32 0, i32 -1
  br label %28

; <label>:28:                                     ; preds = %20, %18
  %29 = phi i32 [ 1, %18 ], [ %27, %20 ]
  ret i32 %29
}

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca [60000 x %struct.my3DVertexStruct], align 16
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** %7, align 8
  store i32 0, i32* %11, align 4
  %15 = load i32, i32* %4, align 4
  %16 = icmp slt i32 %15, 2
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 8)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 8)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:21:                                     ; preds = %3
  %22 = load i8**, i8*** %5, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 1
  %24 = load i8*, i8** %23, align 8
  %25 = call %struct._IO_FILE* @fopen(i8* %24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %25, %struct._IO_FILE** %9, align 8
  br label %26

; <label>:26:                                     ; preds = %46, %21
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %12)
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %44

; <label>:30:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 2)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 2)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %13)
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %44

; <label>:35:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 3)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 3)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %14)
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 4)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 4)
  %42 = load i32, i32* %11, align 4
  %43 = icmp slt i32 %42, 60000
  br label %44

; <label>:44:                                     ; preds = %40, %35, %30, %26
  %45 = phi i1 [ false, %35 ], [ false, %30 ], [ false, %26 ], [ %43, %40 ]
  br i1 %45, label %46, label %81

; <label>:46:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 0)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 0)
  %48 = load i32, i32* %12, align 4
  %49 = load i32, i32* %11, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i64 0, i64 %50
  %52 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %51, i32 0, i32 0
  store i32 %48, i32* %52, align 8
  %53 = load i32, i32* %13, align 4
  %54 = load i32, i32* %11, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i64 0, i64 %55
  %57 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %56, i32 0, i32 1
  store i32 %53, i32* %57, align 4
  %58 = load i32, i32* %14, align 4
  %59 = load i32, i32* %11, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %61, i32 0, i32 2
  store i32 %58, i32* %62, align 8
  %63 = load i32, i32* %12, align 4
  %64 = sitofp i32 %63 to double
  %65 = call double @pow(double %64, double 2.000000e+00) #4
  %66 = load i32, i32* %13, align 4
  %67 = sitofp i32 %66 to double
  %68 = call double @pow(double %67, double 2.000000e+00) #4
  %69 = fadd double %65, %68
  %70 = load i32, i32* %14, align 4
  %71 = sitofp i32 %70 to double
  %72 = call double @pow(double %71, double 2.000000e+00) #4
  %73 = fadd double %69, %72
  %74 = call double @sqrt(double %73) #4
  %75 = load i32, i32* %11, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i64 0, i64 %76
  %78 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %77, i32 0, i32 3
  store double %74, double* %78, align 8
  %79 = load i32, i32* %11, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %11, align 4
  br label %26

; <label>:81:                                     ; preds = %44
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %83 = call i32 @fclose(%struct._IO_FILE* %82)
  br label %84

; <label>:84:                                     ; preds = %81
  %85 = load i32, i32* %6, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %84
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 6)
  %88 = add i64 %pgocount5, 1
  store i64 %88, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 6)
  %89 = load i32, i32* %11, align 4
  %90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.3, i32 0, i32 0), i32 %89)
  br label %91

; <label>:91:                                     ; preds = %87, %84
  %92 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i32 0, i32 0
  %93 = bitcast %struct.my3DVertexStruct* %92 to i8*
  %94 = load i32, i32* %11, align 4
  call void @qsortx(i8* %93, i32 %94, i32 24, i32 (i8*, i8*)* @compare)
  %95 = load i32, i32* %6, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %137

; <label>:97:                                     ; preds = %91
  %98 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0))
  store %struct._IO_FILE* %98, %struct._IO_FILE** %7, align 8
  %99 = icmp eq %struct._IO_FILE* %98, null
  br i1 %99, label %100, label %104

; <label>:100:                                    ; preds = %97
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 9)
  %101 = add i64 %pgocount6, 1
  store i64 %101, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 9)
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %103 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %102, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:104:                                    ; preds = %97
  store i32 0, i32* %10, align 4
  br label %105

; <label>:105:                                    ; preds = %127, %104
  %106 = load i32, i32* %10, align 4
  %107 = load i32, i32* %11, align 4
  %108 = icmp slt i32 %106, %107
  br i1 %108, label %109, label %133

; <label>:109:                                    ; preds = %105
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %111 = load i32, i32* %10, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i64 0, i64 %112
  %114 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %113, i32 0, i32 0
  %115 = load i32, i32* %114, align 8
  %116 = load i32, i32* %10, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i64 0, i64 %117
  %119 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %118, i32 0, i32 1
  %120 = load i32, i32* %119, align 4
  %121 = load i32, i32* %10, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %8, i64 0, i64 %122
  %124 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %123, i32 0, i32 2
  %125 = load i32, i32* %124, align 8
  %126 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %110, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i32 %115, i32 %120, i32 %125)
  br label %127

; <label>:127:                                    ; preds = %109
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 1)
  %128 = add i64 %pgocount7, 1
  store i64 %128, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 1)
  %129 = load i32, i32* %11, align 4
  %130 = sdiv i32 %129, 100
  %131 = load i32, i32* %10, align 4
  %132 = add nsw i32 %131, %130
  store i32 %132, i32* %10, align 4
  br label %105

; <label>:133:                                    ; preds = %105
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 7)
  %134 = add i64 %pgocount8, 1
  store i64 %134, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 7)
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %136 = call i32 @fclose(%struct._IO_FILE* %135)
  br label %137

; <label>:137:                                    ; preds = %133, %91
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 5)
  %138 = add i64 %pgocount9, 1
  store i64 %138, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_main1, i64 0, i64 5)
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare double @pow(double, double) #3

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @printf(i8*, ...) #1

declare void @qsortx(i8*, i32, i32, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
