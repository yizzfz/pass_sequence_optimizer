; ModuleID = 'C.ll'
source_filename = "syr2k.c"
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
@__profc_main = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 251247162174, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1000 x double]*
  br label %8

; <label>:8:                                      ; preds = %28, %2
  %9 = phi i64 [ 0, %2 ], [ %30, %28 ]
  br label %10

; <label>:10:                                     ; preds = %._crit_edge, %8
  %11 = phi i64 [ 0, %8 ], [ %25, %._crit_edge ]
  %12 = mul nuw nsw i64 %11, %9
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1200
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %9, i64 %11
  store double %17, double* %18, align 8, !tbaa !1
  %19 = add nuw nsw i64 %12, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1000
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.000000e+03
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %7, i64 %9, i64 %11
  store double %23, double* %24, align 8, !tbaa !1
  %25 = add nuw nsw i64 %11, 1
  %26 = icmp eq i64 %25, 1000
  br i1 %26, label %28, label %._crit_edge

._crit_edge:                                      ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 0)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 0)
  br label %10

; <label>:28:                                     ; preds = %10
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 7)
  %29 = add i64 %pgocount6, 1
  store i64 %29, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 7)
  %30 = add nuw nsw i64 %9, 1
  %31 = icmp eq i64 %30, 1200
  br i1 %31, label %32, label %8

; <label>:32:                                     ; preds = %28
  %33 = bitcast i8* %3 to [1200 x double]*
  br label %34

; <label>:34:                                     ; preds = %48, %32
  %35 = phi i64 [ %50, %48 ], [ 0, %32 ]
  br label %36

; <label>:36:                                     ; preds = %._crit_edge1, %34
  %37 = phi i64 [ 0, %34 ], [ %45, %._crit_edge1 ]
  %38 = mul nuw nsw i64 %37, %35
  %39 = add nuw nsw i64 %38, 3
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 1200
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.000000e+03
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %35, i64 %37
  store double %43, double* %44, align 8, !tbaa !1
  %45 = add nuw nsw i64 %37, 1
  %46 = icmp eq i64 %45, 1200
  br i1 %46, label %48, label %._crit_edge1

._crit_edge1:                                     ; preds = %36
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 1)
  %47 = add i64 %pgocount7, 1
  store i64 %47, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 1)
  br label %36

; <label>:48:                                     ; preds = %36
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 8)
  %49 = add i64 %pgocount8, 1
  store i64 %49, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 8)
  %50 = add nuw nsw i64 %35, 1
  %51 = icmp eq i64 %50, 1200
  br i1 %51, label %52, label %34

; <label>:52:                                     ; preds = %48
  tail call void (...) @polybench_timer_start() #3
  br label %53

; <label>:53:                                     ; preds = %156, %52
  %54 = phi i64 [ 0, %52 ], [ %158, %156 ]
  %55 = phi i64 [ 1, %52 ], [ %159, %156 ]
  %56 = add i64 %54, -3
  %57 = lshr i64 %56, 2
  %58 = add i64 %54, 1
  %59 = icmp ult i64 %58, 4
  br i1 %59, label %116, label %60

; <label>:60:                                     ; preds = %53
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 11)
  %61 = add i64 %pgocount9, 1
  store i64 %61, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 11)
  %62 = and i64 %58, -4
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %116, label %64

; <label>:64:                                     ; preds = %60
  %65 = and i64 %57, 1
  %66 = icmp eq i64 %65, 0
  br i1 %66, label %67, label %80

; <label>:67:                                     ; preds = %64
  br label %68

; <label>:68:                                     ; preds = %67
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 15)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 15)
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %54, i64 0
  %71 = bitcast double* %70 to <2 x double>*
  %72 = load <2 x double>, <2 x double>* %71, align 8, !tbaa !1
  %73 = getelementptr [1200 x double], [1200 x double]* %33, i64 %54, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %75 = load <2 x double>, <2 x double>* %74, align 8, !tbaa !1
  %76 = fmul <2 x double> %72, <double 1.200000e+00, double 1.200000e+00>
  %77 = fmul <2 x double> %75, <double 1.200000e+00, double 1.200000e+00>
  %78 = bitcast double* %70 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !tbaa !1
  %79 = bitcast double* %73 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8, !tbaa !1
  br label %80

; <label>:80:                                     ; preds = %68, %64
  %81 = phi i64 [ 4, %68 ], [ 0, %64 ]
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 12)
  %82 = add i64 %pgocount11, 1
  store i64 %82, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 12)
  br label %83

; <label>:83:                                     ; preds = %80
  %84 = icmp eq i64 %57, 0
  br i1 %84, label %114, label %85

; <label>:85:                                     ; preds = %83
  br label %86

; <label>:86:                                     ; preds = %._crit_edge3, %85
  %87 = phi i64 [ %81, %85 ], [ %109, %._crit_edge3 ]
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %54, i64 %87
  %89 = bitcast double* %88 to <2 x double>*
  %90 = load <2 x double>, <2 x double>* %89, align 8, !tbaa !1
  %91 = getelementptr double, double* %88, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %92, align 8, !tbaa !1
  %94 = fmul <2 x double> %90, <double 1.200000e+00, double 1.200000e+00>
  %95 = fmul <2 x double> %93, <double 1.200000e+00, double 1.200000e+00>
  %96 = bitcast double* %88 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8, !tbaa !1
  %97 = bitcast double* %91 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !tbaa !1
  %98 = add i64 %87, 4
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %54, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %101 = load <2 x double>, <2 x double>* %100, align 8, !tbaa !1
  %102 = getelementptr double, double* %99, i64 2
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %103, align 8, !tbaa !1
  %105 = fmul <2 x double> %101, <double 1.200000e+00, double 1.200000e+00>
  %106 = fmul <2 x double> %104, <double 1.200000e+00, double 1.200000e+00>
  %107 = bitcast double* %99 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !tbaa !1
  %108 = bitcast double* %102 to <2 x double>*
  store <2 x double> %106, <2 x double>* %108, align 8, !tbaa !1
  %109 = add i64 %87, 8
  %110 = icmp eq i64 %109, %62
  br i1 %110, label %112, label %._crit_edge3, !llvm.loop !5

._crit_edge3:                                     ; preds = %86
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 3)
  %111 = add i64 %pgocount12, 1
  store i64 %111, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 3)
  br label %86

; <label>:112:                                    ; preds = %86
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 14)
  %113 = add i64 %pgocount13, 1
  store i64 %113, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 14)
  br label %114

; <label>:114:                                    ; preds = %112, %83
  %115 = icmp eq i64 %58, %62
  br i1 %115, label %128, label %116

; <label>:116:                                    ; preds = %114, %60, %53
  %117 = phi i64 [ 0, %60 ], [ 0, %53 ], [ %62, %114 ]
  br label %118

; <label>:118:                                    ; preds = %._crit_edge2, %116
  %119 = phi i64 [ %123, %._crit_edge2 ], [ %117, %116 ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %54, i64 %119
  %121 = load double, double* %120, align 8, !tbaa !1
  %122 = fmul double %121, 1.200000e+00
  store double %122, double* %120, align 8, !tbaa !1
  %123 = add nuw nsw i64 %119, 1
  %124 = icmp eq i64 %123, %55
  br i1 %124, label %126, label %._crit_edge2, !llvm.loop !8

._crit_edge2:                                     ; preds = %118
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 2)
  %125 = add i64 %pgocount14, 1
  store i64 %125, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 2)
  br label %118

; <label>:126:                                    ; preds = %118
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 10)
  %127 = add i64 %pgocount15, 1
  store i64 %127, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 10)
  br label %128

; <label>:128:                                    ; preds = %126, %114
  br label %129

; <label>:129:                                    ; preds = %152, %128
  %130 = phi i64 [ %154, %152 ], [ 0, %128 ]
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %7, i64 %54, i64 %130
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %54, i64 %130
  br label %133

; <label>:133:                                    ; preds = %._crit_edge4, %129
  %134 = phi i64 [ %149, %._crit_edge4 ], [ 0, %129 ]
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %134, i64 %130
  %136 = load double, double* %135, align 8, !tbaa !1
  %137 = fmul double %136, 1.500000e+00
  %138 = load double, double* %131, align 8, !tbaa !1
  %139 = fmul double %137, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %7, i64 %134, i64 %130
  %141 = load double, double* %140, align 8, !tbaa !1
  %142 = fmul double %141, 1.500000e+00
  %143 = load double, double* %132, align 8, !tbaa !1
  %144 = fmul double %142, %143
  %145 = fadd double %139, %144
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %54, i64 %134
  %147 = load double, double* %146, align 8, !tbaa !1
  %148 = fadd double %147, %145
  store double %148, double* %146, align 8, !tbaa !1
  %149 = add nuw nsw i64 %134, 1
  %150 = icmp eq i64 %149, %55
  br i1 %150, label %152, label %._crit_edge4

._crit_edge4:                                     ; preds = %133
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 4)
  %151 = add i64 %pgocount16, 1
  store i64 %151, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 4)
  br label %133

; <label>:152:                                    ; preds = %133
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 6)
  %153 = add i64 %pgocount17, 1
  store i64 %153, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 6)
  %154 = add nuw nsw i64 %130, 1
  %155 = icmp eq i64 %154, 1000
  br i1 %155, label %156, label %129

; <label>:156:                                    ; preds = %152
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 9)
  %157 = add i64 %pgocount18, 1
  store i64 %157, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 9)
  %158 = add nuw nsw i64 %54, 1
  %159 = add nuw nsw i64 %55, 1
  %160 = icmp eq i64 %158, 1200
  br i1 %160, label %161, label %53

; <label>:161:                                    ; preds = %156
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %162 = icmp sgt i32 %0, 42
  br i1 %162, label %163, label %204

; <label>:163:                                    ; preds = %161
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 17)
  %164 = add i64 %pgocount19, 1
  store i64 %164, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 17)
  %165 = load i8*, i8** %1, align 8, !tbaa !10
  %166 = load i8, i8* %165, align 1, !tbaa !12
  %167 = icmp eq i8 %166, 0
  br i1 %167, label %168, label %204

; <label>:168:                                    ; preds = %163
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %170 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %169) #4
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %172 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %171, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %173

; <label>:173:                                    ; preds = %194, %168
  %174 = phi i64 [ 0, %168 ], [ %196, %194 ]
  %175 = mul nuw nsw i64 %174, 1200
  br label %176

; <label>:176:                                    ; preds = %187, %173
  %177 = phi i64 [ 0, %173 ], [ %192, %187 ]
  %178 = add nuw nsw i64 %177, %175
  %179 = trunc i64 %178 to i32
  %180 = srem i32 %179, 20
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %183, label %._crit_edge5

._crit_edge5:                                     ; preds = %176
  %pgocount20 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 5)
  %182 = add i64 %pgocount20, 1
  store i64 %182, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 5)
  br label %187

; <label>:183:                                    ; preds = %176
  %pgocount21 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 13)
  %184 = add i64 %pgocount21, 1
  store i64 %184, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 13)
  %185 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %186 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %185) #4
  br label %187

; <label>:187:                                    ; preds = %183, %._crit_edge5
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %174, i64 %177
  %190 = load double, double* %189, align 8, !tbaa !1
  %191 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %188, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %190) #4
  %192 = add nuw nsw i64 %177, 1
  %193 = icmp eq i64 %192, 1200
  br i1 %193, label %194, label %176

; <label>:194:                                    ; preds = %187
  %pgocount22 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 18)
  %195 = add i64 %pgocount22, 1
  store i64 %195, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 18)
  %196 = add nuw nsw i64 %174, 1
  %197 = icmp eq i64 %196, 1200
  br i1 %197, label %198, label %173

; <label>:198:                                    ; preds = %194
  %pgocount23 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 19)
  %199 = add i64 %pgocount23, 1
  store i64 %199, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 19)
  %200 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %201 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %200, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %202 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %203 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %202) #4
  br label %204

; <label>:204:                                    ; preds = %198, %163, %161
  %pgocount24 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 16)
  %205 = add i64 %pgocount24, 1
  store i64 %205, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 16)
  tail call void @free(i8* nonnull %3) #3
  tail call void @free(i8* %4) #3
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
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.width", i32 1}
!7 = !{!"llvm.loop.interleave.count", i32 1}
!8 = distinct !{!8, !9, !6, !7}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !3, i64 0}
!12 = !{!3, !3, i64 0}
