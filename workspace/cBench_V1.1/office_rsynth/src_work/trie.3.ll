; ModuleID = 'trie.2.ll'
source_filename = "trie.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.trie_s = type { %struct.trie_s*, %struct.trie_s*, i8*, i8 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [61 x i8] c"$Id: trie.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@trie_id = global i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str, i32 0, i32 0), align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_trie_insert = private constant [11 x i8] c"trie_insert"
@__profn_trie_lookup = private constant [11 x i8] c"trie_lookup"
@__profc_trie_insert = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trie_insert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5205257793687519513, i64 76438336479, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i32 0, i32 0), i8* bitcast (void (%struct.trie_s**, i8*, i8*)* @trie_insert to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_trie_lookup = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_trie_lookup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9115756938934710631, i64 77706248932, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i32 0, i32 0), i8* bitcast (i8* (%struct.trie_s**, i8**)* @trie_lookup to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [25 x i8] c"\17\00trie_insert\01trie_lookup", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trie_insert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_trie_lookup to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @trie_insert(%struct.trie_s**, i8*, i8*) #0 {
  %4 = alloca %struct.trie_s**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.trie_s*, align 8
  %8 = alloca i8, align 1
  store %struct.trie_s** %0, %struct.trie_s*** %4, align 8
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  store %struct.trie_s* null, %struct.trie_s** %7, align 8
  br label %9

; <label>:9:                                      ; preds = %48, %3
  %10 = load i8*, i8** %5, align 8
  %11 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %11, i8** %5, align 8
  %12 = load i8, i8* %10, align 1
  store i8 %12, i8* %8, align 1
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %52

; <label>:14:                                     ; preds = %9
  br label %15

; <label>:15:                                     ; preds = %32, %14
  %16 = load %struct.trie_s**, %struct.trie_s*** %4, align 8
  %17 = load %struct.trie_s*, %struct.trie_s** %16, align 8
  store %struct.trie_s* %17, %struct.trie_s** %7, align 8
  %18 = icmp ne %struct.trie_s* %17, null
  br i1 %18, label %19, label %34

; <label>:19:                                     ; preds = %15
  %20 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %21 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %20, i32 0, i32 3
  %22 = load i8, i8* %21, align 8
  %23 = sext i8 %22 to i32
  %24 = load i8, i8* %8, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %23, %25
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 2)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 2)
  br label %34

; <label>:29:                                     ; preds = %19
  %30 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %31 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %30, i32 0, i32 0
  store %struct.trie_s** %31, %struct.trie_s*** %4, align 8
  br label %32

; <label>:32:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 0)
  br label %15

; <label>:34:                                     ; preds = %27, %15
  %35 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %36 = icmp ne %struct.trie_s* %35, null
  br i1 %36, label %48, label %37

; <label>:37:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 3)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 3)
  %39 = call noalias i8* @malloc(i64 32) #3
  %40 = bitcast i8* %39 to %struct.trie_s*
  store %struct.trie_s* %40, %struct.trie_s** %7, align 8
  %41 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %42 = bitcast %struct.trie_s* %41 to i8*
  call void @llvm.memset.p0i8.i64(i8* %42, i8 0, i64 32, i32 8, i1 false)
  %43 = load i8, i8* %8, align 1
  %44 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %45 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %44, i32 0, i32 3
  store i8 %43, i8* %45, align 8
  %46 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %47 = load %struct.trie_s**, %struct.trie_s*** %4, align 8
  store %struct.trie_s* %46, %struct.trie_s** %47, align 8
  br label %48

; <label>:48:                                     ; preds = %37, %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 1)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 1)
  %50 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %51 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %50, i32 0, i32 1
  store %struct.trie_s** %51, %struct.trie_s*** %4, align 8
  br label %9

; <label>:52:                                     ; preds = %9
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 4)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_insert, i64 0, i64 4)
  %54 = load i8*, i8** %6, align 8
  %55 = load %struct.trie_s*, %struct.trie_s** %7, align 8
  %56 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %55, i32 0, i32 2
  store i8* %54, i8** %56, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define i8* @trie_lookup(%struct.trie_s**, i8**) #0 {
  %3 = alloca %struct.trie_s**, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8, align 1
  %8 = alloca %struct.trie_s**, align 8
  %9 = alloca %struct.trie_s*, align 8
  store %struct.trie_s** %0, %struct.trie_s*** %3, align 8
  store i8** %1, i8*** %4, align 8
  %10 = load i8**, i8*** %4, align 8
  %11 = load i8*, i8** %10, align 8
  store i8* %11, i8** %5, align 8
  store i8* null, i8** %6, align 8
  br label %12

; <label>:12:                                     ; preds = %60, %2
  %13 = load i8*, i8** %5, align 8
  %14 = load i8, i8* %13, align 1
  store i8 %14, i8* %7, align 1
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %16, label %62

; <label>:16:                                     ; preds = %12
  %17 = load %struct.trie_s**, %struct.trie_s*** %3, align 8
  store %struct.trie_s** %17, %struct.trie_s*** %8, align 8
  br label %18

; <label>:18:                                     ; preds = %36, %16
  %19 = load %struct.trie_s**, %struct.trie_s*** %8, align 8
  %20 = load %struct.trie_s*, %struct.trie_s** %19, align 8
  store %struct.trie_s* %20, %struct.trie_s** %9, align 8
  %21 = icmp ne %struct.trie_s* %20, null
  br i1 %21, label %22, label %37

; <label>:22:                                     ; preds = %18
  %23 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %24 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %23, i32 0, i32 3
  %25 = load i8, i8* %24, align 8
  %26 = sext i8 %25 to i32
  %27 = load i8, i8* %7, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %26, %28
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 2)
  br label %37

; <label>:32:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 0)
  %34 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %35 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %34, i32 0, i32 0
  store %struct.trie_s** %35, %struct.trie_s*** %8, align 8
  br label %36

; <label>:36:                                     ; preds = %32
  br label %18

; <label>:37:                                     ; preds = %30, %18
  %38 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %39 = icmp ne %struct.trie_s* %38, null
  br i1 %39, label %40, label %58

; <label>:40:                                     ; preds = %37
  %41 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %42 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %41, i32 0, i32 0
  %43 = load %struct.trie_s*, %struct.trie_s** %42, align 8
  %44 = load %struct.trie_s**, %struct.trie_s*** %8, align 8
  store %struct.trie_s* %43, %struct.trie_s** %44, align 8
  %45 = load %struct.trie_s**, %struct.trie_s*** %3, align 8
  %46 = load %struct.trie_s*, %struct.trie_s** %45, align 8
  %47 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %48 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %47, i32 0, i32 0
  store %struct.trie_s* %46, %struct.trie_s** %48, align 8
  %49 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %50 = load %struct.trie_s**, %struct.trie_s*** %3, align 8
  store %struct.trie_s* %49, %struct.trie_s** %50, align 8
  %51 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %52 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %51, i32 0, i32 1
  store %struct.trie_s** %52, %struct.trie_s*** %3, align 8
  %53 = load %struct.trie_s*, %struct.trie_s** %9, align 8
  %54 = getelementptr inbounds %struct.trie_s, %struct.trie_s* %53, i32 0, i32 2
  %55 = load i8*, i8** %54, align 8
  store i8* %55, i8** %6, align 8
  %56 = load i8*, i8** %5, align 8
  %57 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %57, i8** %5, align 8
  br label %60

; <label>:58:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 4)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 4)
  br label %62

; <label>:60:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 1)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 1)
  br label %12

; <label>:62:                                     ; preds = %58, %12
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 3)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_trie_lookup, i64 0, i64 3)
  %64 = load i8*, i8** %5, align 8
  %65 = load i8**, i8*** %4, align 8
  store i8* %64, i8** %65, align 8
  %66 = load i8*, i8** %6, align 8
  ret i8* %66
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
