; ModuleID = 'B.ll'
source_filename = "symm.c"
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
@__profc_main = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 352838518701, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %28, %2
  %9 = phi i64 [ 0, %2 ], [ %30, %28 ]
  %10 = add nuw nsw i64 %9, 1200
  br label %11

; <label>:11:                                     ; preds = %._crit_edge1, %8
  %12 = phi i64 [ 0, %8 ], [ %25, %._crit_edge1 ]
  %13 = add nuw nsw i64 %12, %9
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 100
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+03
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %9, i64 %12
  store double %17, double* %18, align 8, !tbaa !1
  %19 = sub nuw nsw i64 %10, %12
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.000000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %12
  store double %23, double* %24, align 8, !tbaa !1
  %25 = add nuw nsw i64 %12, 1
  %26 = icmp eq i64 %25, 1200
  br i1 %26, label %28, label %._crit_edge1

._crit_edge1:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 1)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 1)
  br label %11

; <label>:28:                                     ; preds = %11
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 10)
  %29 = add i64 %pgocount9, 1
  store i64 %29, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 10)
  %30 = add nuw nsw i64 %9, 1
  %31 = icmp eq i64 %30, 1000
  br i1 %31, label %32, label %8

; <label>:32:                                     ; preds = %28
  %33 = bitcast i8* %4 to [1000 x double]*
  br label %39

; <label>:34:                                     ; preds = %151
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 16)
  %35 = add i64 %pgocount10, 1
  store i64 %35, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 16)
  br label %36

; <label>:36:                                     ; preds = %147, %83, %34
  %37 = add nuw nsw i64 %41, 1
  %38 = icmp eq i64 %84, 1000
  br i1 %38, label %157, label %39

; <label>:39:                                     ; preds = %36, %32
  %40 = phi i64 [ %84, %36 ], [ 0, %32 ]
  %41 = phi i64 [ %37, %36 ], [ 1, %32 ]
  %42 = sub i64 999, %40
  %43 = add i64 %42, -4
  %44 = lshr i64 %43, 2
  %45 = add nuw nsw i64 %44, 1
  %46 = sub i64 999, %40
  %47 = and i64 %40, 1
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %57

; <label>:49:                                     ; preds = %39
  br label %50

; <label>:50:                                     ; preds = %49
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 14)
  %51 = add i64 %pgocount11, 1
  store i64 %51, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 14)
  %52 = trunc i64 %40 to i32
  %53 = srem i32 %52, 100
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, 1.000000e+03
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 0
  store double %55, double* %56, align 8, !tbaa !1
  br label %57

; <label>:57:                                     ; preds = %50, %39
  %58 = phi i64 [ 1, %50 ], [ 0, %39 ]
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 11)
  %59 = add i64 %pgocount12, 1
  store i64 %59, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 11)
  br label %60

; <label>:60:                                     ; preds = %57
  %61 = icmp eq i64 %40, 0
  br i1 %61, label %83, label %62

; <label>:62:                                     ; preds = %60
  br label %63

; <label>:63:                                     ; preds = %._crit_edge2, %62
  %64 = phi i64 [ %58, %62 ], [ %78, %._crit_edge2 ]
  %65 = add nuw nsw i64 %64, %40
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, 100
  %68 = sitofp i32 %67 to double
  %69 = fdiv double %68, 1.000000e+03
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %64
  store double %69, double* %70, align 8, !tbaa !1
  %71 = add nuw nsw i64 %64, 1
  %72 = add nuw nsw i64 %71, %40
  %73 = trunc i64 %72 to i32
  %74 = srem i32 %73, 100
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %75, 1.000000e+03
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %71
  store double %76, double* %77, align 8, !tbaa !1
  %78 = add nsw i64 %64, 2
  %79 = icmp eq i64 %78, %41
  br i1 %79, label %81, label %._crit_edge2

._crit_edge2:                                     ; preds = %63
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 2)
  %80 = add i64 %pgocount13, 1
  store i64 %80, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 2)
  br label %63

; <label>:81:                                     ; preds = %63
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 12)
  %82 = add i64 %pgocount14, 1
  store i64 %82, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 12)
  br label %83

; <label>:83:                                     ; preds = %81, %60
  %84 = add nuw nsw i64 %40, 1
  %85 = icmp slt i64 %84, 1000
  br i1 %85, label %86, label %36

; <label>:86:                                     ; preds = %83
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 15)
  %87 = add i64 %pgocount15, 1
  store i64 %87, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 15)
  %88 = icmp ult i64 %46, 4
  br i1 %88, label %149, label %89

; <label>:89:                                     ; preds = %86
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 17)
  %90 = add i64 %pgocount16, 1
  store i64 %90, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 17)
  %91 = and i64 %46, -4
  %92 = icmp eq i64 %91, 0
  %93 = add i64 %41, %91
  br i1 %92, label %149, label %94

; <label>:94:                                     ; preds = %89
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 21)
  %95 = add i64 %pgocount17, 1
  store i64 %95, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 21)
  %96 = and i64 %45, 3
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %113, label %98

; <label>:98:                                     ; preds = %94
  br label %99

; <label>:99:                                     ; preds = %._crit_edge6, %98
  %100 = phi i64 [ %107, %._crit_edge6 ], [ 0, %98 ]
  %101 = phi i64 [ %108, %._crit_edge6 ], [ %96, %98 ]
  %102 = add i64 %41, %100
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %102
  %104 = bitcast double* %103 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %104, align 8, !tbaa !1
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %106, align 8, !tbaa !1
  %107 = add i64 %100, 4
  %108 = add i64 %101, -1
  %109 = icmp eq i64 %108, 0
  br i1 %109, label %111, label %._crit_edge6, !llvm.loop !5

._crit_edge6:                                     ; preds = %99
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 6)
  %110 = add i64 %pgocount18, 1
  store i64 %110, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 6)
  br label %99

; <label>:111:                                    ; preds = %99
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 22)
  %112 = add i64 %pgocount19, 1
  store i64 %112, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 22)
  br label %113

; <label>:113:                                    ; preds = %111, %94
  %114 = phi i64 [ 0, %94 ], [ %107, %111 ]
  %115 = icmp ult i64 %43, 12
  br i1 %115, label %147, label %116

; <label>:116:                                    ; preds = %113
  br label %117

; <label>:117:                                    ; preds = %._crit_edge7, %116
  %118 = phi i64 [ %114, %116 ], [ %142, %._crit_edge7 ]
  %119 = add i64 %41, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %119
  %121 = bitcast double* %120 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %121, align 8, !tbaa !1
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %123, align 8, !tbaa !1
  %124 = add i64 %118, 4
  %125 = add i64 %41, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %125
  %127 = bitcast double* %126 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %127, align 8, !tbaa !1
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %129, align 8, !tbaa !1
  %130 = add i64 %118, 8
  %131 = add i64 %41, %130
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %131
  %133 = bitcast double* %132 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %133, align 8, !tbaa !1
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %135, align 8, !tbaa !1
  %136 = add i64 %118, 12
  %137 = add i64 %41, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %137
  %139 = bitcast double* %138 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %139, align 8, !tbaa !1
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %141, align 8, !tbaa !1
  %142 = add i64 %118, 16
  %143 = icmp eq i64 %142, %91
  br i1 %143, label %145, label %._crit_edge7, !llvm.loop !7

._crit_edge7:                                     ; preds = %117
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 7)
  %144 = add i64 %pgocount20, 1
  store i64 %144, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 7)
  br label %117

; <label>:145:                                    ; preds = %117
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 23)
  %146 = add i64 %pgocount21, 1
  store i64 %146, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 23)
  br label %147

; <label>:147:                                    ; preds = %145, %113
  %148 = icmp eq i64 %46, %91
  br i1 %148, label %36, label %149

; <label>:149:                                    ; preds = %147, %89, %86
  %150 = phi i64 [ %41, %89 ], [ %41, %86 ], [ %93, %147 ]
  br label %151

; <label>:151:                                    ; preds = %._crit_edge3, %149
  %152 = phi i64 [ %154, %._crit_edge3 ], [ %150, %149 ]
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %40, i64 %152
  store double -9.990000e+02, double* %153, align 8, !tbaa !1
  %154 = add nuw nsw i64 %152, 1
  %155 = icmp eq i64 %154, 1000
  br i1 %155, label %34, label %._crit_edge3, !llvm.loop !10

._crit_edge3:                                     ; preds = %151
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 3)
  %156 = add i64 %pgocount22, 1
  store i64 %156, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 3)
  br label %151

; <label>:157:                                    ; preds = %36
  tail call void (...) @polybench_timer_start() #3
  br label %158

; <label>:158:                                    ; preds = %284, %157
  %159 = phi i64 [ 0, %157 ], [ %285, %284 ]
  %160 = mul i64 %159, 9600
  %161 = getelementptr i8, i8* %3, i64 %160
  %162 = add i64 %160, 9600
  %163 = getelementptr i8, i8* %3, i64 %162
  %164 = icmp sgt i64 %159, 0
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %159, i64 %159
  br i1 %164, label %166, label %167

; <label>:166:                                    ; preds = %158
  br label %215

; <label>:167:                                    ; preds = %158
  %168 = getelementptr i8, i8* %5, i64 %162
  %169 = getelementptr i8, i8* %5, i64 %160
  %170 = icmp ult i8* %161, %168
  %171 = icmp ult i8* %169, %163
  %172 = and i1 %170, %171
  %173 = bitcast double* %165 to i8*
  %174 = bitcast double* %165 to i8*
  %175 = icmp ult i8* %161, %174
  %176 = icmp ult i8* %173, %163
  %177 = and i1 %175, %176
  %178 = or i1 %172, %177
  br i1 %178, label %185, label %179

; <label>:179:                                    ; preds = %167
  %180 = load double, double* %165, align 8, !tbaa !1, !alias.scope !12
  %181 = insertelement <2 x double> undef, double %180, i32 0
  %182 = insertelement <2 x double> %181, double %180, i32 1
  %183 = insertelement <2 x double> undef, double %180, i32 0
  %184 = insertelement <2 x double> %183, double %180, i32 1
  br label %186

; <label>:185:                                    ; preds = %167
  br label %252

; <label>:186:                                    ; preds = %._crit_edge4, %179
  %187 = phi i64 [ %212, %._crit_edge4 ], [ 0, %179 ]
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %159, i64 %187
  %189 = bitcast double* %188 to <2 x double>*
  %190 = load <2 x double>, <2 x double>* %189, align 8, !tbaa !1, !alias.scope !15
  %191 = getelementptr double, double* %188, i64 2
  %192 = bitcast double* %191 to <2 x double>*
  %193 = load <2 x double>, <2 x double>* %192, align 8, !tbaa !1, !alias.scope !15
  %194 = fmul <2 x double> %190, <double 1.500000e+00, double 1.500000e+00>
  %195 = fmul <2 x double> %193, <double 1.500000e+00, double 1.500000e+00>
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %159, i64 %187
  %197 = bitcast double* %196 to <2 x double>*
  %198 = load <2 x double>, <2 x double>* %197, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %199 = getelementptr double, double* %196, i64 2
  %200 = bitcast double* %199 to <2 x double>*
  %201 = load <2 x double>, <2 x double>* %200, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %202 = fmul <2 x double> %198, <double 1.200000e+00, double 1.200000e+00>
  %203 = fmul <2 x double> %201, <double 1.200000e+00, double 1.200000e+00>
  %204 = fmul <2 x double> %194, %182
  %205 = fmul <2 x double> %195, %184
  %206 = fadd <2 x double> %202, %204
  %207 = fadd <2 x double> %203, %205
  %208 = fadd <2 x double> %206, zeroinitializer
  %209 = fadd <2 x double> %207, zeroinitializer
  %210 = bitcast double* %196 to <2 x double>*
  store <2 x double> %208, <2 x double>* %210, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %211 = bitcast double* %199 to <2 x double>*
  store <2 x double> %209, <2 x double>* %211, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %212 = add i64 %187, 4
  %213 = icmp eq i64 %212, 1200
  br i1 %213, label %282, label %._crit_edge4, !llvm.loop !20

._crit_edge4:                                     ; preds = %186
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 4)
  %214 = add i64 %pgocount23, 1
  store i64 %214, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 4)
  br label %186

; <label>:215:                                    ; preds = %240, %166
  %216 = phi i64 [ %250, %240 ], [ 0, %166 ]
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %159, i64 %216
  %218 = load double, double* %217, align 8, !tbaa !1
  %219 = fmul double %218, 1.500000e+00
  br label %220

; <label>:220:                                    ; preds = %._crit_edge, %215
  %221 = phi i64 [ 0, %215 ], [ %235, %._crit_edge ]
  %222 = phi double [ %219, %215 ], [ %237, %._crit_edge ]
  %223 = phi double [ 0.000000e+00, %215 ], [ %234, %._crit_edge ]
  %224 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %159, i64 %221
  %225 = load double, double* %224, align 8, !tbaa !1
  %226 = fmul double %222, %225
  %227 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %221, i64 %216
  %228 = load double, double* %227, align 8, !tbaa !1
  %229 = fadd double %228, %226
  store double %229, double* %227, align 8, !tbaa !1
  %230 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %221, i64 %216
  %231 = load double, double* %230, align 8, !tbaa !1
  %232 = load double, double* %224, align 8, !tbaa !1
  %233 = fmul double %231, %232
  %234 = fadd double %223, %233
  %235 = add nuw nsw i64 %221, 1
  %236 = load double, double* %217, align 8, !tbaa !1
  %237 = fmul double %236, 1.500000e+00
  %238 = icmp eq i64 %235, %159
  br i1 %238, label %240, label %._crit_edge

._crit_edge:                                      ; preds = %220
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 0)
  %239 = add i64 %pgocount24, 1
  store i64 %239, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 0)
  br label %220

; <label>:240:                                    ; preds = %220
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 9)
  %241 = add i64 %pgocount25, 1
  store i64 %241, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 9)
  %242 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %159, i64 %216
  %243 = load double, double* %242, align 8, !tbaa !1
  %244 = fmul double %243, 1.200000e+00
  %245 = load double, double* %165, align 8, !tbaa !1
  %246 = fmul double %237, %245
  %247 = fadd double %244, %246
  %248 = fmul double %234, 1.500000e+00
  %249 = fadd double %248, %247
  store double %249, double* %242, align 8, !tbaa !1
  %250 = add nuw nsw i64 %216, 1
  %251 = icmp eq i64 %250, 1200
  br i1 %251, label %278, label %215

; <label>:252:                                    ; preds = %._crit_edge5, %185
  %253 = phi i64 [ 0, %185 ], [ %275, %._crit_edge5 ]
  %254 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %159, i64 %253
  %255 = load double, double* %254, align 8, !tbaa !1
  %256 = fmul double %255, 1.500000e+00
  %257 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %159, i64 %253
  %258 = load double, double* %257, align 8, !tbaa !1
  %259 = fmul double %258, 1.200000e+00
  %260 = load double, double* %165, align 8, !tbaa !1
  %261 = fmul double %256, %260
  %262 = fadd double %259, %261
  %263 = fadd double %262, 0.000000e+00
  store double %263, double* %257, align 8, !tbaa !1
  %264 = or i64 %253, 1
  %265 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %159, i64 %264
  %266 = load double, double* %265, align 8, !tbaa !1
  %267 = fmul double %266, 1.500000e+00
  %268 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %159, i64 %264
  %269 = load double, double* %268, align 8, !tbaa !1
  %270 = fmul double %269, 1.200000e+00
  %271 = load double, double* %165, align 8, !tbaa !1
  %272 = fmul double %267, %271
  %273 = fadd double %270, %272
  %274 = fadd double %273, 0.000000e+00
  store double %274, double* %268, align 8, !tbaa !1
  %275 = add nsw i64 %253, 2
  %276 = icmp eq i64 %275, 1200
  br i1 %276, label %280, label %._crit_edge5, !llvm.loop !21

._crit_edge5:                                     ; preds = %252
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 5)
  %277 = add i64 %pgocount26, 1
  store i64 %277, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 5)
  br label %252

; <label>:278:                                    ; preds = %240
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 13)
  %279 = add i64 %pgocount27, 1
  store i64 %279, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 13)
  br label %284

; <label>:280:                                    ; preds = %252
  %pgocount28 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 19)
  %281 = add i64 %pgocount28, 1
  store i64 %281, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 19)
  br label %284

; <label>:282:                                    ; preds = %186
  %pgocount29 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 20)
  %283 = add i64 %pgocount29, 1
  store i64 %283, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 20)
  br label %284

; <label>:284:                                    ; preds = %282, %280, %278
  %285 = add nuw nsw i64 %159, 1
  %286 = icmp eq i64 %285, 1000
  br i1 %286, label %287, label %158

; <label>:287:                                    ; preds = %284
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %288 = icmp sgt i32 %0, 42
  br i1 %288, label %289, label %330

; <label>:289:                                    ; preds = %287
  %pgocount30 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 25)
  %290 = add i64 %pgocount30, 1
  store i64 %290, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 25)
  %291 = load i8*, i8** %1, align 8, !tbaa !22
  %292 = load i8, i8* %291, align 1, !tbaa !24
  %293 = icmp eq i8 %292, 0
  br i1 %293, label %294, label %330

; <label>:294:                                    ; preds = %289
  %295 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %296 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %295) #4
  %297 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %298 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %297, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %299

; <label>:299:                                    ; preds = %320, %294
  %300 = phi i64 [ 0, %294 ], [ %322, %320 ]
  %301 = mul nuw nsw i64 %300, 1000
  br label %302

; <label>:302:                                    ; preds = %313, %299
  %303 = phi i64 [ 0, %299 ], [ %318, %313 ]
  %304 = add nuw nsw i64 %303, %301
  %305 = trunc i64 %304 to i32
  %306 = srem i32 %305, 20
  %307 = icmp eq i32 %306, 0
  br i1 %307, label %309, label %._crit_edge8

._crit_edge8:                                     ; preds = %302
  %pgocount31 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 8)
  %308 = add i64 %pgocount31, 1
  store i64 %308, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 8)
  br label %313

; <label>:309:                                    ; preds = %302
  %pgocount32 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 18)
  %310 = add i64 %pgocount32, 1
  store i64 %310, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 18)
  %311 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %312 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %311) #4
  br label %313

; <label>:313:                                    ; preds = %._crit_edge8, %309
  %314 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %315 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %300, i64 %303
  %316 = load double, double* %315, align 8, !tbaa !1
  %317 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %314, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %316) #4
  %318 = add nuw nsw i64 %303, 1
  %319 = icmp eq i64 %318, 1200
  br i1 %319, label %320, label %302

; <label>:320:                                    ; preds = %313
  %pgocount33 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 26)
  %321 = add i64 %pgocount33, 1
  store i64 %321, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 26)
  %322 = add nuw nsw i64 %300, 1
  %323 = icmp eq i64 %322, 1000
  br i1 %323, label %324, label %299

; <label>:324:                                    ; preds = %320
  %pgocount34 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 27)
  %325 = add i64 %pgocount34, 1
  store i64 %325, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 27)
  %326 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %327 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %326, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %328 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %329 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %328) #4
  br label %330

; <label>:330:                                    ; preds = %324, %289, %287
  %pgocount35 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 24)
  %331 = add i64 %pgocount35, 1
  store i64 %331, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_main, i64 0, i64 24)
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !11, !8, !9}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = !{!18}
!18 = distinct !{!18, !14}
!19 = !{!16, !13}
!20 = distinct !{!20, !8, !9}
!21 = distinct !{!21, !8, !9}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !3, i64 0}
!24 = !{!3, !3, i64 0}
