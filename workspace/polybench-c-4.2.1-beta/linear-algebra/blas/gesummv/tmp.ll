; ModuleID = 'C.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 108110344772, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %8 = bitcast i8* %3 to [1300 x double]*
  %9 = bitcast i8* %4 to [1300 x double]*
  %10 = bitcast i8* %6 to double*
  br label %11

; <label>:11:                                     ; preds = %35, %2
  %12 = phi i64 [ 0, %2 ], [ %37, %35 ]
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.300000e+03
  %16 = getelementptr inbounds double, double* %10, i64 %12
  store double %15, double* %16, align 8, !tbaa !1
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %11
  %18 = phi i64 [ 0, %11 ], [ %32, %._crit_edge ]
  %19 = mul nuw nsw i64 %18, %12
  %20 = add nuw nsw i64 %19, 1
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1300
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.300000e+03
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %8, i64 %12, i64 %18
  store double %24, double* %25, align 8, !tbaa !1
  %26 = add nuw nsw i64 %19, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1300
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.300000e+03
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %9, i64 %12, i64 %18
  store double %30, double* %31, align 8, !tbaa !1
  %32 = add nuw nsw i64 %18, 1
  %33 = icmp eq i64 %32, 1300
  br i1 %33, label %35, label %._crit_edge

._crit_edge:                                      ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 0)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 0)
  br label %17

; <label>:35:                                     ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 3)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 3)
  %37 = add nuw nsw i64 %12, 1
  %38 = icmp eq i64 %37, 1300
  br i1 %38, label %39, label %11

; <label>:39:                                     ; preds = %35
  tail call void (...) @polybench_timer_start() #3
  %40 = bitcast i8* %5 to double*
  %41 = bitcast i8* %7 to double*
  br label %42

; <label>:42:                                     ; preds = %66, %39
  %43 = phi i64 [ 0, %39 ], [ %71, %66 ]
  %44 = getelementptr inbounds double, double* %40, i64 %43
  store double 0.000000e+00, double* %44, align 8, !tbaa !1
  %45 = getelementptr inbounds double, double* %41, i64 %43
  store double 0.000000e+00, double* %45, align 8, !tbaa !1
  %46 = load double, double* %44, align 8, !tbaa !1
  br label %47

; <label>:47:                                     ; preds = %._crit_edge1, %42
  %48 = phi i64 [ 0, %42 ], [ %62, %._crit_edge1 ]
  %49 = phi double [ %46, %42 ], [ %63, %._crit_edge1 ]
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %8, i64 %43, i64 %48
  %51 = load double, double* %50, align 8, !tbaa !1
  %52 = getelementptr inbounds double, double* %10, i64 %48
  %53 = load double, double* %52, align 8, !tbaa !1
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %44, align 8, !tbaa !1
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %9, i64 %43, i64 %48
  %57 = load double, double* %56, align 8, !tbaa !1
  %58 = load double, double* %52, align 8, !tbaa !1
  %59 = fmul double %57, %58
  %60 = load double, double* %45, align 8, !tbaa !1
  %61 = fadd double %59, %60
  store double %61, double* %45, align 8, !tbaa !1
  %62 = add nuw nsw i64 %48, 1
  %63 = load double, double* %44, align 8, !tbaa !1
  %64 = icmp eq i64 %62, 1300
  br i1 %64, label %66, label %._crit_edge1

._crit_edge1:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 1)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 1)
  br label %47

; <label>:66:                                     ; preds = %47
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 4)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 4)
  %68 = fmul double %63, 1.500000e+00
  %69 = fmul double %61, 1.200000e+00
  %70 = fadd double %69, %68
  store double %70, double* %45, align 8, !tbaa !1
  %71 = add nuw nsw i64 %43, 1
  %72 = icmp eq i64 %71, 1300
  br i1 %72, label %73, label %42

; <label>:73:                                     ; preds = %66
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %74 = icmp sgt i32 %0, 42
  br i1 %74, label %75, label %108

; <label>:75:                                     ; preds = %73
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 6)
  %76 = add i64 %pgocount6, 1
  store i64 %76, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 6)
  %77 = load i8*, i8** %1, align 8, !tbaa !5
  %78 = load i8, i8* %77, align 1, !tbaa !7
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %80, label %108

; <label>:80:                                     ; preds = %75
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %82 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %81) #4
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %84 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %83, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %85

; <label>:85:                                     ; preds = %95, %80
  %86 = phi i64 [ 0, %80 ], [ %100, %95 ]
  %87 = trunc i64 %86 to i32
  %88 = srem i32 %87, 20
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %91, label %._crit_edge2

._crit_edge2:                                     ; preds = %85
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 2)
  %90 = add i64 %pgocount7, 1
  store i64 %90, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 2)
  br label %95

; <label>:91:                                     ; preds = %85
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 7)
  %92 = add i64 %pgocount8, 1
  store i64 %92, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 7)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %94 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %93) #4
  br label %95

; <label>:95:                                     ; preds = %91, %._crit_edge2
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %97 = getelementptr inbounds double, double* %41, i64 %86
  %98 = load double, double* %97, align 8, !tbaa !1
  %99 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %96, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %98) #4
  %100 = add nuw nsw i64 %86, 1
  %101 = icmp eq i64 %100, 1300
  br i1 %101, label %102, label %85

; <label>:102:                                    ; preds = %95
  %pgocount9 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 8)
  %103 = add i64 %pgocount9, 1
  store i64 %103, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 8)
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %105 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %104, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %107 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %106) #4
  br label %108

; <label>:108:                                    ; preds = %102, %75, %73
  %pgocount10 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 5)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_main, i64 0, i64 5)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* nonnull %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
