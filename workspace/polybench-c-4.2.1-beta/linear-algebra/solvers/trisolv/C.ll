; ModuleID = 'B.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 193131335446, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  br label %9

; <label>:9:                                      ; preds = %53, %2
  %10 = phi i64 [ 0, %2 ], [ %54, %53 ]
  %11 = phi i64 [ 1, %2 ], [ %55, %53 ]
  %12 = getelementptr inbounds double, double* %7, i64 %10
  store double -9.990000e+02, double* %12, align 8, !tbaa !1
  %13 = trunc i64 %10 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %8, i64 %10
  store double %14, double* %15, align 8, !tbaa !1
  %16 = add nuw nsw i64 %10, 2001
  %17 = and i64 %10, 1
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %9
  br label %20

; <label>:20:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 7)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 7)
  %22 = trunc i64 %16 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %23, 2.000000e+00
  %25 = fdiv double %24, 2.000000e+03
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %10, i64 0
  store double %25, double* %26, align 8, !tbaa !1
  br label %27

; <label>:27:                                     ; preds = %20, %9
  %28 = phi i64 [ 1, %20 ], [ 0, %9 ]
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 4)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 4)
  br label %30

; <label>:30:                                     ; preds = %27
  %31 = icmp eq i64 %10, 0
  br i1 %31, label %53, label %32

; <label>:32:                                     ; preds = %30
  br label %33

; <label>:33:                                     ; preds = %._crit_edge, %32
  %34 = phi i64 [ %28, %32 ], [ %48, %._crit_edge ]
  %35 = sub i64 %16, %34
  %36 = trunc i64 %35 to i32
  %37 = sitofp i32 %36 to double
  %38 = fmul double %37, 2.000000e+00
  %39 = fdiv double %38, 2.000000e+03
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %10, i64 %34
  store double %39, double* %40, align 8, !tbaa !1
  %41 = add nuw nsw i64 %34, 1
  %42 = sub i64 %16, %41
  %43 = trunc i64 %42 to i32
  %44 = sitofp i32 %43 to double
  %45 = fmul double %44, 2.000000e+00
  %46 = fdiv double %45, 2.000000e+03
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %10, i64 %41
  store double %46, double* %47, align 8, !tbaa !1
  %48 = add nsw i64 %34, 2
  %49 = icmp eq i64 %48, %11
  br i1 %49, label %51, label %._crit_edge

._crit_edge:                                      ; preds = %33
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 0)
  %50 = add i64 %pgocount5, 1
  store i64 %50, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 0)
  br label %33

; <label>:51:                                     ; preds = %33
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 5)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 5)
  br label %53

; <label>:53:                                     ; preds = %51, %30
  %54 = add nuw nsw i64 %10, 1
  %55 = add nuw nsw i64 %11, 1
  %56 = icmp eq i64 %54, 2000
  br i1 %56, label %57, label %9

; <label>:57:                                     ; preds = %53
  tail call void (...) @polybench_timer_start() #3
  br label %58

; <label>:58:                                     ; preds = %110, %57
  %59 = phi i64 [ 0, %57 ], [ %115, %110 ]
  %60 = getelementptr inbounds double, double* %8, i64 %59
  %61 = bitcast double* %60 to i64*
  %62 = load i64, i64* %61, align 8, !tbaa !1
  %63 = getelementptr inbounds double, double* %7, i64 %59
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8, !tbaa !1
  %65 = icmp sgt i64 %59, 0
  %66 = bitcast i64 %62 to double
  br i1 %65, label %68, label %._crit_edge2

._crit_edge2:                                     ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 2)
  %67 = add i64 %pgocount7, 1
  store i64 %67, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 2)
  br label %110

; <label>:68:                                     ; preds = %58
  %69 = and i64 %59, 1
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %79, label %71

; <label>:71:                                     ; preds = %68
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 8)
  %73 = add i64 %pgocount8, 1
  store i64 %73, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 8)
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %59, i64 0
  %75 = load double, double* %74, align 8, !tbaa !1
  %76 = load double, double* %7, align 8, !tbaa !1
  %77 = fmul double %75, %76
  %78 = fsub double %66, %77
  store double %78, double* %63, align 8, !tbaa !1
  br label %79

; <label>:79:                                     ; preds = %72, %68
  %80 = phi double [ %78, %72 ], [ undef, %68 ]
  %81 = phi i64 [ 1, %72 ], [ 0, %68 ]
  %82 = phi double [ %78, %72 ], [ %66, %68 ]
  br label %83

; <label>:83:                                     ; preds = %79
  %84 = icmp eq i64 %59, 1
  br i1 %84, label %107, label %85

; <label>:85:                                     ; preds = %83
  br label %86

; <label>:86:                                     ; preds = %._crit_edge1, %85
  %87 = phi i64 [ %81, %85 ], [ %102, %._crit_edge1 ]
  %88 = phi double [ %82, %85 ], [ %101, %._crit_edge1 ]
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %59, i64 %87
  %90 = load double, double* %89, align 8, !tbaa !1
  %91 = getelementptr inbounds double, double* %7, i64 %87
  %92 = load double, double* %91, align 8, !tbaa !1
  %93 = fmul double %90, %92
  %94 = fsub double %88, %93
  store double %94, double* %63, align 8, !tbaa !1
  %95 = add nuw nsw i64 %87, 1
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %59, i64 %95
  %97 = load double, double* %96, align 8, !tbaa !1
  %98 = getelementptr inbounds double, double* %7, i64 %95
  %99 = load double, double* %98, align 8, !tbaa !1
  %100 = fmul double %97, %99
  %101 = fsub double %94, %100
  store double %101, double* %63, align 8, !tbaa !1
  %102 = add nsw i64 %87, 2
  %103 = icmp eq i64 %102, %59
  br i1 %103, label %105, label %._crit_edge1

._crit_edge1:                                     ; preds = %86
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 1)
  %104 = add i64 %pgocount9, 1
  store i64 %104, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 1)
  br label %86

; <label>:105:                                    ; preds = %86
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 9)
  %106 = add i64 %pgocount10, 1
  store i64 %106, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 9)
  br label %107

; <label>:107:                                    ; preds = %105, %83
  %108 = phi double [ %80, %83 ], [ %101, %105 ]
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 6)
  %109 = add i64 %pgocount11, 1
  store i64 %109, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 6)
  br label %110

; <label>:110:                                    ; preds = %._crit_edge2, %107
  %111 = phi double [ %66, %._crit_edge2 ], [ %108, %107 ]
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %59, i64 %59
  %113 = load double, double* %112, align 8, !tbaa !1
  %114 = fdiv double %111, %113
  store double %114, double* %63, align 8, !tbaa !1
  %115 = add nuw nsw i64 %59, 1
  %116 = icmp eq i64 %115, 2000
  br i1 %116, label %117, label %58

; <label>:117:                                    ; preds = %110
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %118 = icmp sgt i32 %0, 42
  br i1 %118, label %119, label %153

; <label>:119:                                    ; preds = %117
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 11)
  %120 = add i64 %pgocount12, 1
  store i64 %120, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 11)
  %121 = load i8*, i8** %1, align 8, !tbaa !5
  %122 = load i8, i8* %121, align 1, !tbaa !7
  %123 = icmp eq i8 %122, 0
  br i1 %123, label %124, label %153

; <label>:124:                                    ; preds = %119
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %126 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %125) #4
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %128 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %127, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  br label %130

; <label>:130:                                    ; preds = %._crit_edge3, %124
  %131 = phi i64 [ 0, %124 ], [ %144, %._crit_edge3 ]
  %132 = phi %struct._IO_FILE* [ %129, %124 ], [ %145, %._crit_edge3 ]
  %133 = getelementptr inbounds double, double* %7, i64 %131
  %134 = load double, double* %133, align 8, !tbaa !1
  %135 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %132, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %134) #4
  %136 = trunc i64 %131 to i32
  %137 = srem i32 %136, 20
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %143

; <label>:139:                                    ; preds = %130
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 12)
  %140 = add i64 %pgocount13, 1
  store i64 %140, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 12)
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %142 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %141) #4
  br label %143

; <label>:143:                                    ; preds = %139, %130
  %144 = add nuw nsw i64 %131, 1
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %146 = icmp eq i64 %144, 2000
  br i1 %146, label %148, label %._crit_edge3

._crit_edge3:                                     ; preds = %143
  %pgocount14 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 3)
  %147 = add i64 %pgocount14, 1
  store i64 %147, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 3)
  br label %130

; <label>:148:                                    ; preds = %143
  %pgocount15 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 13)
  %149 = add i64 %pgocount15, 1
  store i64 %149, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 13)
  %150 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %145, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %151 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %152 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %151) #4
  br label %153

; <label>:153:                                    ; preds = %148, %119, %117
  %pgocount16 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 10)
  %154 = add i64 %pgocount16, 1
  store i64 %154, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 10)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* nonnull %4) #3
  tail call void @free(i8* %5) #3
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
