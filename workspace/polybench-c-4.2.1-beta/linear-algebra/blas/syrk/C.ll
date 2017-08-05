; ModuleID = 'B.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 287058212884, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = bitcast i8* %4 to [1000 x double]*
  br label %6

; <label>:6:                                      ; preds = %20, %2
  %7 = phi i64 [ 0, %2 ], [ %22, %20 ]
  br label %8

; <label>:8:                                      ; preds = %._crit_edge1, %6
  %9 = phi i64 [ 0, %6 ], [ %17, %._crit_edge1 ]
  %10 = mul nuw nsw i64 %9, %7
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 1200
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %7, i64 %9
  store double %15, double* %16, align 8, !tbaa !1
  %17 = add nuw nsw i64 %9, 1
  %18 = icmp eq i64 %17, 1000
  br i1 %18, label %20, label %._crit_edge1

._crit_edge1:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 1)
  br label %8

; <label>:20:                                     ; preds = %8
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 9)
  %21 = add i64 %pgocount6, 1
  store i64 %21, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 9)
  %22 = add nuw nsw i64 %7, 1
  %23 = icmp eq i64 %22, 1200
  br i1 %23, label %24, label %6

; <label>:24:                                     ; preds = %20
  %25 = bitcast i8* %3 to [1200 x double]*
  br label %26

; <label>:26:                                     ; preds = %40, %24
  %27 = phi i64 [ %42, %40 ], [ 0, %24 ]
  br label %28

; <label>:28:                                     ; preds = %._crit_edge2, %26
  %29 = phi i64 [ 0, %26 ], [ %37, %._crit_edge2 ]
  %30 = mul nuw nsw i64 %29, %27
  %31 = add nuw nsw i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.000000e+03
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %27, i64 %29
  store double %35, double* %36, align 8, !tbaa !1
  %37 = add nuw nsw i64 %29, 1
  %38 = icmp eq i64 %37, 1200
  br i1 %38, label %40, label %._crit_edge2

._crit_edge2:                                     ; preds = %28
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 2)
  %39 = add i64 %pgocount7, 1
  store i64 %39, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 2)
  br label %28

; <label>:40:                                     ; preds = %28
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 10)
  %41 = add i64 %pgocount8, 1
  store i64 %41, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 10)
  %42 = add nuw nsw i64 %27, 1
  %43 = icmp eq i64 %42, 1200
  br i1 %43, label %44, label %26

; <label>:44:                                     ; preds = %40
  tail call void (...) @polybench_timer_start() #3
  br label %45

; <label>:45:                                     ; preds = %170, %44
  %46 = phi i64 [ 0, %44 ], [ %172, %170 ]
  %47 = phi i64 [ 1, %44 ], [ %173, %170 ]
  %48 = add i64 %46, -3
  %49 = lshr i64 %48, 2
  %50 = add i64 %46, 1
  %51 = icmp ult i64 %50, 4
  br i1 %51, label %108, label %52

; <label>:52:                                     ; preds = %45
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 13)
  %53 = add i64 %pgocount9, 1
  store i64 %53, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 13)
  %54 = and i64 %50, -4
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %108, label %56

; <label>:56:                                     ; preds = %52
  %57 = and i64 %49, 1
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %59, label %72

; <label>:59:                                     ; preds = %56
  br label %60

; <label>:60:                                     ; preds = %59
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 17)
  %61 = add i64 %pgocount10, 1
  store i64 %61, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 17)
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %46, i64 0
  %63 = bitcast double* %62 to <2 x double>*
  %64 = load <2 x double>, <2 x double>* %63, align 8, !tbaa !1
  %65 = getelementptr [1200 x double], [1200 x double]* %25, i64 %46, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %67 = load <2 x double>, <2 x double>* %66, align 8, !tbaa !1
  %68 = fmul <2 x double> %64, <double 1.200000e+00, double 1.200000e+00>
  %69 = fmul <2 x double> %67, <double 1.200000e+00, double 1.200000e+00>
  %70 = bitcast double* %62 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !tbaa !1
  %71 = bitcast double* %65 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !tbaa !1
  br label %72

; <label>:72:                                     ; preds = %60, %56
  %73 = phi i64 [ 4, %60 ], [ 0, %56 ]
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 14)
  %74 = add i64 %pgocount11, 1
  store i64 %74, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 14)
  br label %75

; <label>:75:                                     ; preds = %72
  %76 = icmp eq i64 %49, 0
  br i1 %76, label %106, label %77

; <label>:77:                                     ; preds = %75
  br label %78

; <label>:78:                                     ; preds = %._crit_edge4, %77
  %79 = phi i64 [ %73, %77 ], [ %101, %._crit_edge4 ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %46, i64 %79
  %81 = bitcast double* %80 to <2 x double>*
  %82 = load <2 x double>, <2 x double>* %81, align 8, !tbaa !1
  %83 = getelementptr double, double* %80, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %85 = load <2 x double>, <2 x double>* %84, align 8, !tbaa !1
  %86 = fmul <2 x double> %82, <double 1.200000e+00, double 1.200000e+00>
  %87 = fmul <2 x double> %85, <double 1.200000e+00, double 1.200000e+00>
  %88 = bitcast double* %80 to <2 x double>*
  store <2 x double> %86, <2 x double>* %88, align 8, !tbaa !1
  %89 = bitcast double* %83 to <2 x double>*
  store <2 x double> %87, <2 x double>* %89, align 8, !tbaa !1
  %90 = add i64 %79, 4
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %46, i64 %90
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %92, align 8, !tbaa !1
  %94 = getelementptr double, double* %91, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %96 = load <2 x double>, <2 x double>* %95, align 8, !tbaa !1
  %97 = fmul <2 x double> %93, <double 1.200000e+00, double 1.200000e+00>
  %98 = fmul <2 x double> %96, <double 1.200000e+00, double 1.200000e+00>
  %99 = bitcast double* %91 to <2 x double>*
  store <2 x double> %97, <2 x double>* %99, align 8, !tbaa !1
  %100 = bitcast double* %94 to <2 x double>*
  store <2 x double> %98, <2 x double>* %100, align 8, !tbaa !1
  %101 = add i64 %79, 8
  %102 = icmp eq i64 %101, %54
  br i1 %102, label %104, label %._crit_edge4, !llvm.loop !5

._crit_edge4:                                     ; preds = %78
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 4)
  %103 = add i64 %pgocount12, 1
  store i64 %103, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 4)
  br label %78

; <label>:104:                                    ; preds = %78
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 16)
  %105 = add i64 %pgocount13, 1
  store i64 %105, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 16)
  br label %106

; <label>:106:                                    ; preds = %104, %75
  %107 = icmp eq i64 %50, %54
  br i1 %107, label %120, label %108

; <label>:108:                                    ; preds = %106, %52, %45
  %109 = phi i64 [ 0, %52 ], [ 0, %45 ], [ %54, %106 ]
  br label %110

; <label>:110:                                    ; preds = %._crit_edge3, %108
  %111 = phi i64 [ %115, %._crit_edge3 ], [ %109, %108 ]
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %46, i64 %111
  %113 = load double, double* %112, align 8, !tbaa !1
  %114 = fmul double %113, 1.200000e+00
  store double %114, double* %112, align 8, !tbaa !1
  %115 = add nuw nsw i64 %111, 1
  %116 = icmp eq i64 %115, %47
  br i1 %116, label %118, label %._crit_edge3, !llvm.loop !8

._crit_edge3:                                     ; preds = %110
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 3)
  %117 = add i64 %pgocount14, 1
  store i64 %117, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 3)
  br label %110

; <label>:118:                                    ; preds = %110
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 12)
  %119 = add i64 %pgocount15, 1
  store i64 %119, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 12)
  br label %120

; <label>:120:                                    ; preds = %118, %106
  %121 = and i64 %46, 1
  %122 = icmp eq i64 %121, 0
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %46, i64 0
  %124 = icmp eq i64 %46, 0
  br label %125

; <label>:125:                                    ; preds = %167, %120
  %126 = phi i64 [ %168, %167 ], [ 0, %120 ]
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %46, i64 %126
  br i1 %122, label %128, label %138

; <label>:128:                                    ; preds = %125
  br label %129

; <label>:129:                                    ; preds = %128
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 8)
  %130 = add i64 %pgocount16, 1
  store i64 %130, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 8)
  %131 = load double, double* %127, align 8, !tbaa !1
  %132 = fmul double %131, 1.500000e+00
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %126
  %134 = load double, double* %133, align 8, !tbaa !1
  %135 = fmul double %132, %134
  %136 = load double, double* %123, align 8, !tbaa !1
  %137 = fadd double %136, %135
  store double %137, double* %123, align 8, !tbaa !1
  br label %138

; <label>:138:                                    ; preds = %129, %125
  %139 = phi i64 [ 1, %129 ], [ 0, %125 ]
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 6)
  %140 = add i64 %pgocount17, 1
  store i64 %140, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 6)
  br label %141

; <label>:141:                                    ; preds = %138
  br i1 %124, label %167, label %142

; <label>:142:                                    ; preds = %141
  br label %143

; <label>:143:                                    ; preds = %._crit_edge, %142
  %144 = phi i64 [ %139, %142 ], [ %162, %._crit_edge ]
  %145 = load double, double* %127, align 8, !tbaa !1
  %146 = fmul double %145, 1.500000e+00
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %144, i64 %126
  %148 = load double, double* %147, align 8, !tbaa !1
  %149 = fmul double %146, %148
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %46, i64 %144
  %151 = load double, double* %150, align 8, !tbaa !1
  %152 = fadd double %151, %149
  store double %152, double* %150, align 8, !tbaa !1
  %153 = add nuw nsw i64 %144, 1
  %154 = load double, double* %127, align 8, !tbaa !1
  %155 = fmul double %154, 1.500000e+00
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %153, i64 %126
  %157 = load double, double* %156, align 8, !tbaa !1
  %158 = fmul double %155, %157
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %46, i64 %153
  %160 = load double, double* %159, align 8, !tbaa !1
  %161 = fadd double %160, %158
  store double %161, double* %159, align 8, !tbaa !1
  %162 = add nsw i64 %144, 2
  %163 = icmp eq i64 %162, %47
  br i1 %163, label %165, label %._crit_edge

._crit_edge:                                      ; preds = %143
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 0)
  %164 = add i64 %pgocount18, 1
  store i64 %164, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 0)
  br label %143

; <label>:165:                                    ; preds = %143
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 7)
  %166 = add i64 %pgocount19, 1
  store i64 %166, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 7)
  br label %167

; <label>:167:                                    ; preds = %165, %141
  %168 = add nuw nsw i64 %126, 1
  %169 = icmp eq i64 %168, 1000
  br i1 %169, label %170, label %125

; <label>:170:                                    ; preds = %167
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 11)
  %171 = add i64 %pgocount20, 1
  store i64 %171, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 11)
  %172 = add nuw nsw i64 %46, 1
  %173 = add nuw nsw i64 %47, 1
  %174 = icmp eq i64 %172, 1200
  br i1 %174, label %175, label %45

; <label>:175:                                    ; preds = %170
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %176 = icmp sgt i32 %0, 42
  br i1 %176, label %177, label %218

; <label>:177:                                    ; preds = %175
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 19)
  %178 = add i64 %pgocount21, 1
  store i64 %178, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 19)
  %179 = load i8*, i8** %1, align 8, !tbaa !10
  %180 = load i8, i8* %179, align 1, !tbaa !12
  %181 = icmp eq i8 %180, 0
  br i1 %181, label %182, label %218

; <label>:182:                                    ; preds = %177
  %183 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %184 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %183) #4
  %185 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %186 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %185, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %187

; <label>:187:                                    ; preds = %208, %182
  %188 = phi i64 [ 0, %182 ], [ %210, %208 ]
  %189 = mul nuw nsw i64 %188, 1200
  br label %190

; <label>:190:                                    ; preds = %201, %187
  %191 = phi i64 [ 0, %187 ], [ %206, %201 ]
  %192 = add nuw nsw i64 %191, %189
  %193 = trunc i64 %192 to i32
  %194 = srem i32 %193, 20
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %197, label %._crit_edge5

._crit_edge5:                                     ; preds = %190
  %pgocount22 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 5)
  %196 = add i64 %pgocount22, 1
  store i64 %196, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 5)
  br label %201

; <label>:197:                                    ; preds = %190
  %pgocount23 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 15)
  %198 = add i64 %pgocount23, 1
  store i64 %198, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 15)
  %199 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %200 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %199) #4
  br label %201

; <label>:201:                                    ; preds = %._crit_edge5, %197
  %202 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %188, i64 %191
  %204 = load double, double* %203, align 8, !tbaa !1
  %205 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %202, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %204) #4
  %206 = add nuw nsw i64 %191, 1
  %207 = icmp eq i64 %206, 1200
  br i1 %207, label %208, label %190

; <label>:208:                                    ; preds = %201
  %pgocount24 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 20)
  %209 = add i64 %pgocount24, 1
  store i64 %209, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 20)
  %210 = add nuw nsw i64 %188, 1
  %211 = icmp eq i64 %210, 1200
  br i1 %211, label %212, label %187

; <label>:212:                                    ; preds = %208
  %pgocount25 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 21)
  %213 = add i64 %pgocount25, 1
  store i64 %213, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 21)
  %214 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %215 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %214, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %216 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %217 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %216) #4
  br label %218

; <label>:218:                                    ; preds = %212, %177, %175
  %pgocount26 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 18)
  %219 = add i64 %pgocount26, 1
  store i64 %219, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 18)
  tail call void @free(i8* nonnull %3) #3
  tail call void @free(i8* %4) #3
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
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.width", i32 1}
!7 = !{!"llvm.loop.interleave.count", i32 1}
!8 = distinct !{!8, !9, !6, !7}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !3, i64 0}
!12 = !{!3, !3, i64 0}
