; ModuleID = 'B.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 72057755752325757, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  %11 = bitcast i8* %7 to double*
  %12 = bitcast i8* %3 to [2000 x double]*
  br label %15

; <label>:13:                                     ; preds = %42
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 5)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 5)
  br i1 %22, label %60, label %15

; <label>:15:                                     ; preds = %13, %2
  %16 = phi i64 [ 0, %2 ], [ %21, %13 ]
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.000000e+03
  %20 = getelementptr inbounds double, double* %8, i64 %16
  store double %19, double* %20, align 8, !tbaa !1
  %21 = add nuw nsw i64 %16, 1
  %22 = icmp eq i64 %21, 2000
  %23 = trunc i64 %21 to i32
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 2.000000e+03
  %26 = zext i1 %22 to i64
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 13)
  %27 = add i64 %pgocount5, %26
  store i64 %27, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 13)
  %28 = select i1 %22, double 0.000000e+00, double %25
  %29 = getelementptr inbounds double, double* %9, i64 %16
  store double %28, double* %29, align 8, !tbaa !1
  %30 = add nuw nsw i64 %16, 3
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 2.000000e+03
  %35 = getelementptr inbounds double, double* %10, i64 %16
  store double %34, double* %35, align 8, !tbaa !1
  %36 = add nuw nsw i64 %16, 4
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 2.000000e+03
  %41 = getelementptr inbounds double, double* %11, i64 %16
  store double %40, double* %41, align 8, !tbaa !1
  br label %42

; <label>:42:                                     ; preds = %._crit_edge, %15
  %43 = phi i64 [ 0, %15 ], [ %57, %._crit_edge ]
  %44 = mul nuw nsw i64 %43, %16
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, 2000
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, 2.000000e+03
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %16, i64 %43
  store double %48, double* %49, align 8, !tbaa !1
  %50 = or i64 %43, 1
  %51 = mul nuw nsw i64 %50, %16
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, 2000
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, 2.000000e+03
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %16, i64 %50
  store double %55, double* %56, align 8, !tbaa !1
  %57 = add nsw i64 %43, 2
  %58 = icmp eq i64 %57, 2000
  br i1 %58, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %42
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 0)
  %59 = add i64 %pgocount6, 1
  store i64 %59, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 0)
  br label %42

; <label>:60:                                     ; preds = %13
  tail call void (...) @polybench_timer_start() #3
  br label %61

; <label>:61:                                     ; preds = %84, %60
  %62 = phi i64 [ 0, %60 ], [ %86, %84 ]
  %63 = getelementptr inbounds double, double* %8, i64 %62
  %64 = load double, double* %63, align 8, !tbaa !1
  br label %65

; <label>:65:                                     ; preds = %._crit_edge1, %61
  %66 = phi double [ %64, %61 ], [ %80, %._crit_edge1 ]
  %67 = phi i64 [ 0, %61 ], [ %81, %._crit_edge1 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %62, i64 %67
  %69 = load double, double* %68, align 8, !tbaa !1
  %70 = getelementptr inbounds double, double* %10, i64 %67
  %71 = load double, double* %70, align 8, !tbaa !1
  %72 = fmul double %69, %71
  %73 = fadd double %66, %72
  store double %73, double* %63, align 8, !tbaa !1
  %74 = or i64 %67, 1
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %62, i64 %74
  %76 = load double, double* %75, align 8, !tbaa !1
  %77 = getelementptr inbounds double, double* %10, i64 %74
  %78 = load double, double* %77, align 8, !tbaa !1
  %79 = fmul double %76, %78
  %80 = fadd double %73, %79
  store double %80, double* %63, align 8, !tbaa !1
  %81 = add nsw i64 %67, 2
  %82 = icmp eq i64 %81, 2000
  br i1 %82, label %84, label %._crit_edge1

._crit_edge1:                                     ; preds = %65
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 1)
  %83 = add i64 %pgocount7, 1
  store i64 %83, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 1)
  br label %65

; <label>:84:                                     ; preds = %65
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 6)
  %85 = add i64 %pgocount8, 1
  store i64 %85, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 6)
  %86 = add nuw nsw i64 %62, 1
  %87 = icmp eq i64 %86, 2000
  br i1 %87, label %88, label %61

; <label>:88:                                     ; preds = %84
  br label %89

; <label>:89:                                     ; preds = %112, %88
  %90 = phi i64 [ %114, %112 ], [ 0, %88 ]
  %91 = getelementptr inbounds double, double* %9, i64 %90
  %92 = load double, double* %91, align 8, !tbaa !1
  br label %93

; <label>:93:                                     ; preds = %._crit_edge2, %89
  %94 = phi double [ %92, %89 ], [ %108, %._crit_edge2 ]
  %95 = phi i64 [ 0, %89 ], [ %109, %._crit_edge2 ]
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %95, i64 %90
  %97 = load double, double* %96, align 8, !tbaa !1
  %98 = getelementptr inbounds double, double* %11, i64 %95
  %99 = load double, double* %98, align 8, !tbaa !1
  %100 = fmul double %97, %99
  %101 = fadd double %94, %100
  store double %101, double* %91, align 8, !tbaa !1
  %102 = or i64 %95, 1
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %102, i64 %90
  %104 = load double, double* %103, align 8, !tbaa !1
  %105 = getelementptr inbounds double, double* %11, i64 %102
  %106 = load double, double* %105, align 8, !tbaa !1
  %107 = fmul double %104, %106
  %108 = fadd double %101, %107
  store double %108, double* %91, align 8, !tbaa !1
  %109 = add nsw i64 %95, 2
  %110 = icmp eq i64 %109, 2000
  br i1 %110, label %112, label %._crit_edge2

._crit_edge2:                                     ; preds = %93
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 2)
  %111 = add i64 %pgocount9, 1
  store i64 %111, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 2)
  br label %93

; <label>:112:                                    ; preds = %93
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 7)
  %113 = add i64 %pgocount10, 1
  store i64 %113, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 7)
  %114 = add nuw nsw i64 %90, 1
  %115 = icmp eq i64 %114, 2000
  br i1 %115, label %116, label %89

; <label>:116:                                    ; preds = %112
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %117 = icmp sgt i32 %0, 42
  br i1 %117, label %118, label %173

; <label>:118:                                    ; preds = %116
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 9)
  %119 = add i64 %pgocount11, 1
  store i64 %119, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 9)
  %120 = load i8*, i8** %1, align 8, !tbaa !5
  %121 = load i8, i8* %120, align 1, !tbaa !7
  %122 = icmp eq i8 %121, 0
  br i1 %122, label %123, label %173

; <label>:123:                                    ; preds = %118
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %125 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %124) #4
  %126 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %127 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %126, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %128

; <label>:128:                                    ; preds = %138, %123
  %129 = phi i64 [ 0, %123 ], [ %143, %138 ]
  %130 = trunc i64 %129 to i32
  %131 = srem i32 %130, 20
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %134, label %._crit_edge3

._crit_edge3:                                     ; preds = %128
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 3)
  %133 = add i64 %pgocount12, 1
  store i64 %133, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 3)
  br label %138

; <label>:134:                                    ; preds = %128
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 10)
  %135 = add i64 %pgocount13, 1
  store i64 %135, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 10)
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %137 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %136) #4
  br label %138

; <label>:138:                                    ; preds = %._crit_edge3, %134
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %140 = getelementptr inbounds double, double* %8, i64 %129
  %141 = load double, double* %140, align 8, !tbaa !1
  %142 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %139, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %141) #4
  %143 = add nuw nsw i64 %129, 1
  %144 = icmp eq i64 %143, 2000
  br i1 %144, label %145, label %128

; <label>:145:                                    ; preds = %138
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %147 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %146, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #4
  %148 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %149 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #4
  br label %150

; <label>:150:                                    ; preds = %160, %145
  %151 = phi i64 [ 0, %145 ], [ %165, %160 ]
  %152 = trunc i64 %151 to i32
  %153 = srem i32 %152, 20
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %156, label %._crit_edge4

._crit_edge4:                                     ; preds = %150
  %pgocount14 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 4)
  %155 = add i64 %pgocount14, 1
  store i64 %155, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 4)
  br label %160

; <label>:156:                                    ; preds = %150
  %pgocount15 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 11)
  %157 = add i64 %pgocount15, 1
  store i64 %157, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 11)
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %159 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %158) #4
  br label %160

; <label>:160:                                    ; preds = %._crit_edge4, %156
  %161 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %162 = getelementptr inbounds double, double* %9, i64 %151
  %163 = load double, double* %162, align 8, !tbaa !1
  %164 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %161, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %163) #4
  %165 = add nuw nsw i64 %151, 1
  %166 = icmp eq i64 %165, 2000
  br i1 %166, label %167, label %150

; <label>:167:                                    ; preds = %160
  %pgocount16 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 12)
  %168 = add i64 %pgocount16, 1
  store i64 %168, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 12)
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %170 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %169, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #4
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %172 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %171) #4
  br label %173

; <label>:173:                                    ; preds = %167, %118, %116
  %pgocount17 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 8)
  %174 = add i64 %pgocount17, 1
  store i64 %174, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_main, i64 0, i64 8)
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

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

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
