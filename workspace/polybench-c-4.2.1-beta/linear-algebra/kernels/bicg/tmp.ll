; ModuleID = 'C.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 146925511083, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %6 to double*
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2, %2
  %11 = phi i64 [ 0, %2 ], [ %21, %._crit_edge2 ]
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.900000e+03
  %15 = getelementptr inbounds double, double* %9, i64 %11
  store double %14, double* %15, align 8, !tbaa !1
  %16 = or i64 %11, 1
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.900000e+03
  %20 = getelementptr inbounds double, double* %9, i64 %16
  store double %19, double* %20, align 8, !tbaa !1
  %21 = add nsw i64 %11, 2
  %22 = icmp eq i64 %21, 1900
  br i1 %22, label %24, label %._crit_edge2

._crit_edge2:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 2)
  br label %10

; <label>:24:                                     ; preds = %10
  %25 = bitcast i8* %7 to double*
  br label %26

; <label>:26:                                     ; preds = %50, %24
  %27 = phi i64 [ %52, %50 ], [ 0, %24 ]
  %28 = trunc i64 %27 to i32
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.100000e+03
  %31 = getelementptr inbounds double, double* %25, i64 %27
  store double %30, double* %31, align 8, !tbaa !1
  br label %32

; <label>:32:                                     ; preds = %._crit_edge, %26
  %33 = phi i64 [ 0, %26 ], [ %41, %._crit_edge ]
  %34 = or i64 %33, 1
  %35 = mul nuw nsw i64 %34, %27
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 2.100000e+03
  %40 = getelementptr inbounds [1900 x double], [1900 x double]* %8, i64 %27, i64 %33
  store double %39, double* %40, align 8, !tbaa !1
  %41 = add nsw i64 %33, 2
  %42 = mul nuw nsw i64 %41, %27
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 2100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, 2.100000e+03
  %47 = getelementptr inbounds [1900 x double], [1900 x double]* %8, i64 %27, i64 %34
  store double %46, double* %47, align 8, !tbaa !1
  %48 = icmp eq i64 %41, 1900
  br i1 %48, label %50, label %._crit_edge

._crit_edge:                                      ; preds = %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 0)
  %49 = add i64 %pgocount5, 1
  store i64 %49, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 0)
  br label %32

; <label>:50:                                     ; preds = %32
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 5)
  %51 = add i64 %pgocount6, 1
  store i64 %51, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 5)
  %52 = add nuw nsw i64 %27, 1
  %53 = icmp eq i64 %52, 2100
  br i1 %53, label %54, label %26

; <label>:54:                                     ; preds = %50
  tail call void (...) @polybench_timer_start() #3
  %55 = bitcast i8* %4 to double*
  %56 = bitcast i8* %5 to double*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 15200, i32 8, i1 false) #3
  br label %57

; <label>:57:                                     ; preds = %79, %54
  %58 = phi i64 [ 0, %54 ], [ %81, %79 ]
  %59 = getelementptr inbounds double, double* %56, i64 %58
  store double 0.000000e+00, double* %59, align 8, !tbaa !1
  %60 = getelementptr inbounds double, double* %25, i64 %58
  br label %61

; <label>:61:                                     ; preds = %._crit_edge1, %57
  %62 = phi i64 [ 0, %57 ], [ %76, %._crit_edge1 ]
  %63 = getelementptr inbounds double, double* %55, i64 %62
  %64 = load double, double* %63, align 8, !tbaa !1
  %65 = load double, double* %60, align 8, !tbaa !1
  %66 = getelementptr inbounds [1900 x double], [1900 x double]* %8, i64 %58, i64 %62
  %67 = load double, double* %66, align 8, !tbaa !1
  %68 = fmul double %65, %67
  %69 = fadd double %64, %68
  store double %69, double* %63, align 8, !tbaa !1
  %70 = load double, double* %59, align 8, !tbaa !1
  %71 = load double, double* %66, align 8, !tbaa !1
  %72 = getelementptr inbounds double, double* %9, i64 %62
  %73 = load double, double* %72, align 8, !tbaa !1
  %74 = fmul double %71, %73
  %75 = fadd double %70, %74
  store double %75, double* %59, align 8, !tbaa !1
  %76 = add nuw nsw i64 %62, 1
  %77 = icmp eq i64 %76, 1900
  br i1 %77, label %79, label %._crit_edge1

._crit_edge1:                                     ; preds = %61
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 1)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 1)
  br label %61

; <label>:79:                                     ; preds = %61
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 6)
  %80 = add i64 %pgocount8, 1
  store i64 %80, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 6)
  %81 = add nuw nsw i64 %58, 1
  %82 = icmp eq i64 %81, 2100
  br i1 %82, label %83, label %57

; <label>:83:                                     ; preds = %79
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %84 = icmp sgt i32 %0, 42
  br i1 %84, label %85, label %140

; <label>:85:                                     ; preds = %83
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 8)
  %86 = add i64 %pgocount9, 1
  store i64 %86, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 8)
  %87 = load i8*, i8** %1, align 8, !tbaa !5
  %88 = load i8, i8* %87, align 1, !tbaa !7
  %89 = icmp eq i8 %88, 0
  br i1 %89, label %90, label %140

; <label>:90:                                     ; preds = %85
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %92 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %91) #5
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %94 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %95

; <label>:95:                                     ; preds = %105, %90
  %96 = phi i64 [ 0, %90 ], [ %110, %105 ]
  %97 = trunc i64 %96 to i32
  %98 = srem i32 %97, 20
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %101, label %._crit_edge3

._crit_edge3:                                     ; preds = %95
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 3)
  %100 = add i64 %pgocount10, 1
  store i64 %100, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 3)
  br label %105

; <label>:101:                                    ; preds = %95
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 9)
  %102 = add i64 %pgocount11, 1
  store i64 %102, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 9)
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %104 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %103) #5
  br label %105

; <label>:105:                                    ; preds = %101, %._crit_edge3
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %107 = getelementptr inbounds double, double* %55, i64 %96
  %108 = load double, double* %107, align 8, !tbaa !1
  %109 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %106, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %108) #5
  %110 = add nuw nsw i64 %96, 1
  %111 = icmp eq i64 %110, 1900
  br i1 %111, label %112, label %95

; <label>:112:                                    ; preds = %105
  %113 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %114 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %113, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %116 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %115, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %117

; <label>:117:                                    ; preds = %127, %112
  %118 = phi i64 [ 0, %112 ], [ %132, %127 ]
  %119 = trunc i64 %118 to i32
  %120 = srem i32 %119, 20
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %123, label %._crit_edge4

._crit_edge4:                                     ; preds = %117
  %pgocount12 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 4)
  %122 = add i64 %pgocount12, 1
  store i64 %122, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 4)
  br label %127

; <label>:123:                                    ; preds = %117
  %pgocount13 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 10)
  %124 = add i64 %pgocount13, 1
  store i64 %124, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 10)
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %126 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %125) #5
  br label %127

; <label>:127:                                    ; preds = %123, %._crit_edge4
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %129 = getelementptr inbounds double, double* %56, i64 %118
  %130 = load double, double* %129, align 8, !tbaa !1
  %131 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %128, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %130) #5
  %132 = add nuw nsw i64 %118, 1
  %133 = icmp eq i64 %132, 2100
  br i1 %133, label %134, label %117

; <label>:134:                                    ; preds = %127
  %pgocount14 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 11)
  %135 = add i64 %pgocount14, 1
  store i64 %135, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 11)
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %137 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %136, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %139 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %138) #5
  br label %140

; <label>:140:                                    ; preds = %134, %85, %83
  %pgocount15 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 7)
  %141 = add i64 %pgocount15, 1
  store i64 %141, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_main, i64 0, i64 7)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* nonnull %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* %7) #3
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
