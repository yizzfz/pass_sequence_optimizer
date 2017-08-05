; ModuleID = 'B.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [39 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 522073433754, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 39, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  %9 = bitcast i8* %6 to double*
  br label %10

; <label>:10:                                     ; preds = %._crit_edge11, %2
  %11 = phi i64 [ 0, %2 ], [ %23, %._crit_edge11 ]
  %12 = getelementptr inbounds double, double* %8, i64 %11
  store double 0.000000e+00, double* %12, align 8, !tbaa !1
  %13 = getelementptr inbounds double, double* %9, i64 %11
  store double 0.000000e+00, double* %13, align 8, !tbaa !1
  %14 = or i64 %11, 1
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %7, i64 %11
  store double %19, double* %20, align 8, !tbaa !1
  %21 = getelementptr inbounds double, double* %8, i64 %14
  store double 0.000000e+00, double* %21, align 8, !tbaa !1
  %22 = getelementptr inbounds double, double* %9, i64 %14
  store double 0.000000e+00, double* %22, align 8, !tbaa !1
  %23 = add nsw i64 %11, 2
  %24 = trunc i64 %23 to i32
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 2.000000e+03
  %27 = fmul double %26, 5.000000e-01
  %28 = fadd double %27, 4.000000e+00
  %29 = getelementptr inbounds double, double* %7, i64 %14
  store double %28, double* %29, align 8, !tbaa !1
  %30 = icmp eq i64 %23, 2000
  br i1 %30, label %32, label %._crit_edge11

._crit_edge11:                                    ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 11)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 11)
  br label %10

; <label>:32:                                     ; preds = %10
  %33 = bitcast i8* %3 to [2000 x double]*
  br label %34

; <label>:34:                                     ; preds = %63, %32
  %35 = phi i64 [ 0, %32 ], [ %56, %63 ]
  %36 = phi i64 [ 1, %32 ], [ %64, %63 ]
  %37 = mul nuw nsw i64 %35, 2001
  %38 = add nuw nsw i64 %37, 1
  %39 = getelementptr [2000 x double], [2000 x double]* %33, i64 0, i64 %38
  %40 = sub i64 1998, %35
  %41 = shl i64 %40, 3
  %42 = and i64 %41, 34359738360
  br label %43

; <label>:43:                                     ; preds = %._crit_edge2, %34
  %44 = phi i64 [ 0, %34 ], [ %52, %._crit_edge2 ]
  %45 = sub nsw i64 0, %44
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 2000
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, 2.000000e+03
  %50 = fadd double %49, 1.000000e+00
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %35, i64 %44
  store double %50, double* %51, align 8, !tbaa !1
  %52 = add nuw nsw i64 %44, 1
  %53 = icmp eq i64 %52, %36
  br i1 %53, label %55, label %._crit_edge2

._crit_edge2:                                     ; preds = %43
  %pgocount16 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 2)
  %54 = add i64 %pgocount16, 1
  store i64 %54, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 2)
  br label %43

; <label>:55:                                     ; preds = %43
  %56 = add nuw nsw i64 %35, 1
  %57 = icmp slt i64 %56, 2000
  br i1 %57, label %58, label %65

; <label>:58:                                     ; preds = %55
  %pgocount17 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 24)
  %59 = add i64 %pgocount17, 1
  store i64 %59, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 24)
  %60 = add nuw nsw i64 %42, 8
  %61 = bitcast double* %39 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %61, i8 0, i64 %60, i32 8, i1 false) #3
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %35, i64 %35
  store double 1.000000e+00, double* %62, align 8, !tbaa !1
  br label %63

; <label>:63:                                     ; preds = %65, %58
  %64 = add nuw nsw i64 %36, 1
  br label %34

; <label>:65:                                     ; preds = %55
  %pgocount18 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 23)
  %66 = add i64 %pgocount18, 1
  store i64 %66, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 23)
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %35, i64 %35
  store double 1.000000e+00, double* %67, align 8, !tbaa !1
  %68 = icmp eq i64 %56, 2000
  br i1 %68, label %69, label %63

; <label>:69:                                     ; preds = %65
  %70 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  tail call void @llvm.memset.p0i8.i64(i8* %70, i8 0, i64 32000000, i32 8, i1 false) #3
  %71 = bitcast i8* %70 to [2000 x [2000 x double]]*
  br label %72

; <label>:72:                                     ; preds = %101, %69
  %73 = phi i64 [ 0, %69 ], [ %103, %101 ]
  br label %74

; <label>:74:                                     ; preds = %97, %72
  %75 = phi i64 [ 0, %72 ], [ %99, %97 ]
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %75, i64 %73
  br label %77

; <label>:77:                                     ; preds = %._crit_edge10, %74
  %78 = phi i64 [ 0, %74 ], [ %94, %._crit_edge10 ]
  %79 = load double, double* %76, align 8, !tbaa !1
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %78, i64 %73
  %81 = load double, double* %80, align 8, !tbaa !1
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %75, i64 %78
  %84 = load double, double* %83, align 8, !tbaa !1
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8, !tbaa !1
  %86 = or i64 %78, 1
  %87 = load double, double* %76, align 8, !tbaa !1
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %86, i64 %73
  %89 = load double, double* %88, align 8, !tbaa !1
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %75, i64 %86
  %92 = load double, double* %91, align 8, !tbaa !1
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8, !tbaa !1
  %94 = add nsw i64 %78, 2
  %95 = icmp eq i64 %94, 2000
  br i1 %95, label %97, label %._crit_edge10

._crit_edge10:                                    ; preds = %77
  %pgocount19 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 10)
  %96 = add i64 %pgocount19, 1
  store i64 %96, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 10)
  br label %77

; <label>:97:                                     ; preds = %77
  %pgocount20 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 15)
  %98 = add i64 %pgocount20, 1
  store i64 %98, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 15)
  %99 = add nuw nsw i64 %75, 1
  %100 = icmp eq i64 %99, 2000
  br i1 %100, label %101, label %74

; <label>:101:                                    ; preds = %97
  %pgocount21 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 25)
  %102 = add i64 %pgocount21, 1
  store i64 %102, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 25)
  %103 = add nuw nsw i64 %73, 1
  %104 = icmp eq i64 %103, 2000
  br i1 %104, label %105, label %72

; <label>:105:                                    ; preds = %101
  br label %106

; <label>:106:                                    ; preds = %183, %105
  %107 = phi i64 [ %184, %183 ], [ 0, %105 ]
  %108 = mul i64 %107, 16000
  %109 = getelementptr i8, i8* %3, i64 %108
  %110 = add i64 %108, 16000
  %111 = getelementptr i8, i8* %3, i64 %110
  %112 = getelementptr i8, i8* %70, i64 %108
  %113 = getelementptr i8, i8* %70, i64 %110
  %114 = icmp ult i8* %109, %113
  %115 = icmp ult i8* %112, %111
  %116 = and i1 %114, %115
  br i1 %116, label %118, label %117

; <label>:117:                                    ; preds = %106
  br label %119

; <label>:118:                                    ; preds = %106
  br label %145

; <label>:119:                                    ; preds = %._crit_edge3, %117
  %120 = phi i64 [ 0, %117 ], [ %142, %._crit_edge3 ]
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %107, i64 %120
  %122 = bitcast double* %121 to <2 x i64>*
  %123 = load <2 x i64>, <2 x i64>* %122, align 8, !tbaa !1, !alias.scope !5
  %124 = getelementptr double, double* %121, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  %126 = load <2 x i64>, <2 x i64>* %125, align 8, !tbaa !1, !alias.scope !5
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %107, i64 %120
  %128 = bitcast double* %127 to <2 x i64>*
  store <2 x i64> %123, <2 x i64>* %128, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x i64>*
  store <2 x i64> %126, <2 x i64>* %130, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %131 = or i64 %120, 4
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %107, i64 %131
  %133 = bitcast double* %132 to <2 x i64>*
  %134 = load <2 x i64>, <2 x i64>* %133, align 8, !tbaa !1, !alias.scope !5
  %135 = getelementptr double, double* %132, i64 2
  %136 = bitcast double* %135 to <2 x i64>*
  %137 = load <2 x i64>, <2 x i64>* %136, align 8, !tbaa !1, !alias.scope !5
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %107, i64 %131
  %139 = bitcast double* %138 to <2 x i64>*
  store <2 x i64> %134, <2 x i64>* %139, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x i64>*
  store <2 x i64> %137, <2 x i64>* %141, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %142 = add nsw i64 %120, 8
  %143 = icmp eq i64 %142, 2000
  br i1 %143, label %181, label %._crit_edge3, !llvm.loop !10

._crit_edge3:                                     ; preds = %119
  %pgocount22 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 3)
  %144 = add i64 %pgocount22, 1
  store i64 %144, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 3)
  br label %119

; <label>:145:                                    ; preds = %._crit_edge4, %118
  %146 = phi i64 [ 0, %118 ], [ %176, %._crit_edge4 ]
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %107, i64 %146
  %148 = bitcast double* %147 to i64*
  %149 = load i64, i64* %148, align 8, !tbaa !1
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %107, i64 %146
  %151 = bitcast double* %150 to i64*
  store i64 %149, i64* %151, align 8, !tbaa !1
  %152 = add nuw nsw i64 %146, 1
  %153 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %107, i64 %152
  %154 = bitcast double* %153 to i64*
  %155 = load i64, i64* %154, align 8, !tbaa !1
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %107, i64 %152
  %157 = bitcast double* %156 to i64*
  store i64 %155, i64* %157, align 8, !tbaa !1
  %158 = add nsw i64 %146, 2
  %159 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %107, i64 %158
  %160 = bitcast double* %159 to i64*
  %161 = load i64, i64* %160, align 8, !tbaa !1
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %107, i64 %158
  %163 = bitcast double* %162 to i64*
  store i64 %161, i64* %163, align 8, !tbaa !1
  %164 = add nsw i64 %146, 3
  %165 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %107, i64 %164
  %166 = bitcast double* %165 to i64*
  %167 = load i64, i64* %166, align 8, !tbaa !1
  %168 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %107, i64 %164
  %169 = bitcast double* %168 to i64*
  store i64 %167, i64* %169, align 8, !tbaa !1
  %170 = add nsw i64 %146, 4
  %171 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %107, i64 %170
  %172 = bitcast double* %171 to i64*
  %173 = load i64, i64* %172, align 8, !tbaa !1
  %174 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %107, i64 %170
  %175 = bitcast double* %174 to i64*
  store i64 %173, i64* %175, align 8, !tbaa !1
  %176 = add nsw i64 %146, 5
  %177 = icmp eq i64 %176, 2000
  br i1 %177, label %179, label %._crit_edge4, !llvm.loop !13

._crit_edge4:                                     ; preds = %145
  %pgocount23 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 4)
  %178 = add i64 %pgocount23, 1
  store i64 %178, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 4)
  br label %145

; <label>:179:                                    ; preds = %145
  %pgocount24 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 28)
  %180 = add i64 %pgocount24, 1
  store i64 %180, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 28)
  br label %183

; <label>:181:                                    ; preds = %119
  %pgocount25 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 29)
  %182 = add i64 %pgocount25, 1
  store i64 %182, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 29)
  br label %183

; <label>:183:                                    ; preds = %181, %179
  %184 = add nuw nsw i64 %107, 1
  %185 = icmp eq i64 %184, 2000
  br i1 %185, label %186, label %106

; <label>:186:                                    ; preds = %183
  tail call void @free(i8* nonnull %70) #3
  tail call void (...) @polybench_timer_start() #3
  br label %187

; <label>:187:                                    ; preds = %299, %186
  %188 = phi i64 [ 0, %186 ], [ %300, %299 ]
  %189 = icmp sgt i64 %188, 0
  br i1 %189, label %191, label %._crit_edge13

._crit_edge13:                                    ; preds = %187
  %pgocount26 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 13)
  %190 = add i64 %pgocount26, 1
  store i64 %190, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 13)
  br label %299

; <label>:191:                                    ; preds = %187
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 0
  br label %237

; <label>:193:                                    ; preds = %292, %233
  %194 = phi i64 [ %235, %233 ], [ %188, %292 ]
  %195 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 %194
  %196 = load double, double* %195, align 8, !tbaa !1
  br i1 %294, label %205, label %197

; <label>:197:                                    ; preds = %193
  br label %198

; <label>:198:                                    ; preds = %197
  %pgocount27 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 18)
  %199 = add i64 %pgocount27, 1
  store i64 %199, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 18)
  %200 = load double, double* %295, align 8, !tbaa !1
  %201 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 0, i64 %194
  %202 = load double, double* %201, align 8, !tbaa !1
  %203 = fmul double %200, %202
  %204 = fsub double %196, %203
  br label %205

; <label>:205:                                    ; preds = %198, %193
  %206 = phi double [ %204, %198 ], [ undef, %193 ]
  %207 = phi i64 [ 1, %198 ], [ 0, %193 ]
  %208 = phi double [ %204, %198 ], [ %196, %193 ]
  %pgocount28 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 16)
  %209 = add i64 %pgocount28, 1
  store i64 %209, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 16)
  br label %210

; <label>:210:                                    ; preds = %205
  br i1 %296, label %233, label %211

; <label>:211:                                    ; preds = %210
  br label %212

; <label>:212:                                    ; preds = %._crit_edge, %211
  %213 = phi i64 [ %207, %211 ], [ %228, %._crit_edge ]
  %214 = phi double [ %208, %211 ], [ %227, %._crit_edge ]
  %215 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 %213
  %216 = load double, double* %215, align 8, !tbaa !1
  %217 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %213, i64 %194
  %218 = load double, double* %217, align 8, !tbaa !1
  %219 = fmul double %216, %218
  %220 = fsub double %214, %219
  %221 = add nuw nsw i64 %213, 1
  %222 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 %221
  %223 = load double, double* %222, align 8, !tbaa !1
  %224 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %221, i64 %194
  %225 = load double, double* %224, align 8, !tbaa !1
  %226 = fmul double %223, %225
  %227 = fsub double %220, %226
  %228 = add nsw i64 %213, 2
  %229 = icmp eq i64 %228, %188
  br i1 %229, label %231, label %._crit_edge

._crit_edge:                                      ; preds = %212
  %pgocount29 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 0)
  %230 = add i64 %pgocount29, 1
  store i64 %230, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 0)
  br label %212

; <label>:231:                                    ; preds = %212
  %pgocount30 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 19)
  %232 = add i64 %pgocount30, 1
  store i64 %232, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 19)
  br label %233

; <label>:233:                                    ; preds = %231, %210
  %234 = phi double [ %206, %210 ], [ %227, %231 ]
  store double %234, double* %195, align 8, !tbaa !1
  %235 = add nuw nsw i64 %194, 1
  %236 = icmp eq i64 %235, 2000
  br i1 %236, label %297, label %193

; <label>:237:                                    ; preds = %285, %191
  %238 = phi i64 [ %290, %285 ], [ 0, %191 ]
  %239 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 %238
  %240 = load double, double* %239, align 8, !tbaa !1
  %241 = icmp sgt i64 %238, 0
  br i1 %241, label %243, label %._crit_edge9

._crit_edge9:                                     ; preds = %237
  %pgocount31 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 9)
  %242 = add i64 %pgocount31, 1
  store i64 %242, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 9)
  br label %285

; <label>:243:                                    ; preds = %237
  %244 = and i64 %238, 1
  %245 = icmp eq i64 %244, 0
  br i1 %245, label %254, label %246

; <label>:246:                                    ; preds = %243
  br label %247

; <label>:247:                                    ; preds = %246
  %pgocount32 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 21)
  %248 = add i64 %pgocount32, 1
  store i64 %248, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 21)
  %249 = load double, double* %192, align 8, !tbaa !1
  %250 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 0, i64 %238
  %251 = load double, double* %250, align 8, !tbaa !1
  %252 = fmul double %249, %251
  %253 = fsub double %240, %252
  br label %254

; <label>:254:                                    ; preds = %247, %243
  %255 = phi double [ %253, %247 ], [ undef, %243 ]
  %256 = phi i64 [ 1, %247 ], [ 0, %243 ]
  %257 = phi double [ %253, %247 ], [ %240, %243 ]
  br label %258

; <label>:258:                                    ; preds = %254
  %259 = icmp eq i64 %238, 1
  br i1 %259, label %282, label %260

; <label>:260:                                    ; preds = %258
  br label %261

; <label>:261:                                    ; preds = %._crit_edge1, %260
  %262 = phi i64 [ %256, %260 ], [ %277, %._crit_edge1 ]
  %263 = phi double [ %257, %260 ], [ %276, %._crit_edge1 ]
  %264 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 %262
  %265 = load double, double* %264, align 8, !tbaa !1
  %266 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %262, i64 %238
  %267 = load double, double* %266, align 8, !tbaa !1
  %268 = fmul double %265, %267
  %269 = fsub double %263, %268
  %270 = add nuw nsw i64 %262, 1
  %271 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 %270
  %272 = load double, double* %271, align 8, !tbaa !1
  %273 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %270, i64 %238
  %274 = load double, double* %273, align 8, !tbaa !1
  %275 = fmul double %272, %274
  %276 = fsub double %269, %275
  %277 = add nsw i64 %262, 2
  %278 = icmp eq i64 %277, %238
  br i1 %278, label %280, label %._crit_edge1

._crit_edge1:                                     ; preds = %261
  %pgocount33 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 1)
  %279 = add i64 %pgocount33, 1
  store i64 %279, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 1)
  br label %261

; <label>:280:                                    ; preds = %261
  %pgocount34 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 22)
  %281 = add i64 %pgocount34, 1
  store i64 %281, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 22)
  br label %282

; <label>:282:                                    ; preds = %280, %258
  %283 = phi double [ %255, %258 ], [ %276, %280 ]
  %pgocount35 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 17)
  %284 = add i64 %pgocount35, 1
  store i64 %284, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 17)
  br label %285

; <label>:285:                                    ; preds = %._crit_edge9, %282
  %286 = phi double [ %240, %._crit_edge9 ], [ %283, %282 ]
  %287 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %238, i64 %238
  %288 = load double, double* %287, align 8, !tbaa !1
  %289 = fdiv double %286, %288
  store double %289, double* %239, align 8, !tbaa !1
  %290 = add nuw nsw i64 %238, 1
  %291 = icmp eq i64 %290, %188
  br i1 %291, label %292, label %237

; <label>:292:                                    ; preds = %285
  %293 = and i64 %188, 1
  %294 = icmp eq i64 %293, 0
  %295 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %188, i64 0
  %296 = icmp eq i64 %188, 1
  br label %193

; <label>:297:                                    ; preds = %233
  %pgocount36 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 26)
  %298 = add i64 %pgocount36, 1
  store i64 %298, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 26)
  br label %299

; <label>:299:                                    ; preds = %._crit_edge13, %297
  %300 = add nuw nsw i64 %188, 1
  %301 = icmp eq i64 %300, 2000
  br i1 %301, label %302, label %187

; <label>:302:                                    ; preds = %299
  br label %303

; <label>:303:                                    ; preds = %374, %302
  %304 = phi i64 [ %377, %374 ], [ 0, %302 ]
  %305 = add i64 %304, -1
  %306 = getelementptr inbounds double, double* %7, i64 %304
  %307 = load double, double* %306, align 8, !tbaa !1
  %308 = icmp sgt i64 %304, 0
  br i1 %308, label %310, label %._crit_edge14

._crit_edge14:                                    ; preds = %303
  %pgocount37 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 14)
  %309 = add i64 %pgocount37, 1
  store i64 %309, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 14)
  br label %374

; <label>:310:                                    ; preds = %303
  %311 = and i64 %304, 3
  %312 = icmp eq i64 %311, 0
  br i1 %312, label %330, label %313

; <label>:313:                                    ; preds = %310
  br label %314

; <label>:314:                                    ; preds = %._crit_edge5, %313
  %315 = phi i64 [ %324, %._crit_edge5 ], [ 0, %313 ]
  %316 = phi double [ %323, %._crit_edge5 ], [ %307, %313 ]
  %317 = phi i64 [ %325, %._crit_edge5 ], [ %311, %313 ]
  %318 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %304, i64 %315
  %319 = load double, double* %318, align 8, !tbaa !1
  %320 = getelementptr inbounds double, double* %9, i64 %315
  %321 = load double, double* %320, align 8, !tbaa !1
  %322 = fmul double %319, %321
  %323 = fsub double %316, %322
  %324 = add nuw nsw i64 %315, 1
  %325 = add i64 %317, -1
  %326 = icmp eq i64 %325, 0
  br i1 %326, label %328, label %._crit_edge5, !llvm.loop !14

._crit_edge5:                                     ; preds = %314
  %pgocount38 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 5)
  %327 = add i64 %pgocount38, 1
  store i64 %327, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 5)
  br label %314

; <label>:328:                                    ; preds = %314
  %pgocount39 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 31)
  %329 = add i64 %pgocount39, 1
  store i64 %329, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 31)
  br label %330

; <label>:330:                                    ; preds = %328, %310
  %331 = phi double [ undef, %310 ], [ %323, %328 ]
  %332 = phi i64 [ 0, %310 ], [ %324, %328 ]
  %333 = phi double [ %307, %310 ], [ %323, %328 ]
  %334 = icmp ult i64 %305, 3
  br i1 %334, label %371, label %335

; <label>:335:                                    ; preds = %330
  br label %336

; <label>:336:                                    ; preds = %._crit_edge6, %335
  %337 = phi i64 [ %332, %335 ], [ %366, %._crit_edge6 ]
  %338 = phi double [ %333, %335 ], [ %365, %._crit_edge6 ]
  %339 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %304, i64 %337
  %340 = load double, double* %339, align 8, !tbaa !1
  %341 = getelementptr inbounds double, double* %9, i64 %337
  %342 = load double, double* %341, align 8, !tbaa !1
  %343 = fmul double %340, %342
  %344 = fsub double %338, %343
  %345 = add nuw nsw i64 %337, 1
  %346 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %304, i64 %345
  %347 = load double, double* %346, align 8, !tbaa !1
  %348 = getelementptr inbounds double, double* %9, i64 %345
  %349 = load double, double* %348, align 8, !tbaa !1
  %350 = fmul double %347, %349
  %351 = fsub double %344, %350
  %352 = add nsw i64 %337, 2
  %353 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %304, i64 %352
  %354 = load double, double* %353, align 8, !tbaa !1
  %355 = getelementptr inbounds double, double* %9, i64 %352
  %356 = load double, double* %355, align 8, !tbaa !1
  %357 = fmul double %354, %356
  %358 = fsub double %351, %357
  %359 = add nsw i64 %337, 3
  %360 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %304, i64 %359
  %361 = load double, double* %360, align 8, !tbaa !1
  %362 = getelementptr inbounds double, double* %9, i64 %359
  %363 = load double, double* %362, align 8, !tbaa !1
  %364 = fmul double %361, %363
  %365 = fsub double %358, %364
  %366 = add nsw i64 %337, 4
  %367 = icmp eq i64 %366, %304
  br i1 %367, label %369, label %._crit_edge6

._crit_edge6:                                     ; preds = %336
  %pgocount40 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 6)
  %368 = add i64 %pgocount40, 1
  store i64 %368, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 6)
  br label %336

; <label>:369:                                    ; preds = %336
  %pgocount41 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 32)
  %370 = add i64 %pgocount41, 1
  store i64 %370, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 32)
  br label %371

; <label>:371:                                    ; preds = %369, %330
  %372 = phi double [ %331, %330 ], [ %365, %369 ]
  %pgocount42 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 27)
  %373 = add i64 %pgocount42, 1
  store i64 %373, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 27)
  br label %374

; <label>:374:                                    ; preds = %._crit_edge14, %371
  %375 = phi double [ %307, %._crit_edge14 ], [ %372, %371 ]
  %376 = getelementptr inbounds double, double* %9, i64 %304
  store double %375, double* %376, align 8, !tbaa !1
  %377 = add nuw nsw i64 %304, 1
  %378 = icmp eq i64 %377, 2000
  br i1 %378, label %379, label %303

; <label>:379:                                    ; preds = %374
  br label %380

; <label>:380:                                    ; preds = %454, %379
  %381 = phi i64 [ 0, %379 ], [ %463, %454 ]
  %382 = phi i64 [ 1999, %379 ], [ %460, %454 ]
  %383 = phi i64 [ 2000, %379 ], [ %462, %454 ]
  %384 = add i64 %381, -1
  %385 = getelementptr inbounds double, double* %9, i64 %382
  %386 = load double, double* %385, align 8, !tbaa !1
  %387 = add nuw nsw i64 %382, 1
  %388 = icmp slt i64 %387, 2000
  br i1 %388, label %390, label %._crit_edge12

._crit_edge12:                                    ; preds = %380
  %pgocount43 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 12)
  %389 = add i64 %pgocount43, 1
  store i64 %389, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 12)
  br label %454

; <label>:390:                                    ; preds = %380
  %391 = and i64 %381, 3
  %392 = icmp eq i64 %391, 0
  br i1 %392, label %410, label %393

; <label>:393:                                    ; preds = %390
  br label %394

; <label>:394:                                    ; preds = %._crit_edge7, %393
  %395 = phi i64 [ %404, %._crit_edge7 ], [ %383, %393 ]
  %396 = phi double [ %403, %._crit_edge7 ], [ %386, %393 ]
  %397 = phi i64 [ %405, %._crit_edge7 ], [ %391, %393 ]
  %398 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %382, i64 %395
  %399 = load double, double* %398, align 8, !tbaa !1
  %400 = getelementptr inbounds double, double* %8, i64 %395
  %401 = load double, double* %400, align 8, !tbaa !1
  %402 = fmul double %399, %401
  %403 = fsub double %396, %402
  %404 = add nuw nsw i64 %395, 1
  %405 = add i64 %397, -1
  %406 = icmp eq i64 %405, 0
  br i1 %406, label %408, label %._crit_edge7, !llvm.loop !16

._crit_edge7:                                     ; preds = %394
  %pgocount44 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 7)
  %407 = add i64 %pgocount44, 1
  store i64 %407, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 7)
  br label %394

; <label>:408:                                    ; preds = %394
  %pgocount45 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 33)
  %409 = add i64 %pgocount45, 1
  store i64 %409, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 33)
  br label %410

; <label>:410:                                    ; preds = %408, %390
  %411 = phi double [ undef, %390 ], [ %403, %408 ]
  %412 = phi i64 [ %383, %390 ], [ %404, %408 ]
  %413 = phi double [ %386, %390 ], [ %403, %408 ]
  %414 = icmp ult i64 %384, 3
  br i1 %414, label %451, label %415

; <label>:415:                                    ; preds = %410
  br label %416

; <label>:416:                                    ; preds = %._crit_edge8, %415
  %417 = phi i64 [ %412, %415 ], [ %446, %._crit_edge8 ]
  %418 = phi double [ %413, %415 ], [ %445, %._crit_edge8 ]
  %419 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %382, i64 %417
  %420 = load double, double* %419, align 8, !tbaa !1
  %421 = getelementptr inbounds double, double* %8, i64 %417
  %422 = load double, double* %421, align 8, !tbaa !1
  %423 = fmul double %420, %422
  %424 = fsub double %418, %423
  %425 = add nuw nsw i64 %417, 1
  %426 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %382, i64 %425
  %427 = load double, double* %426, align 8, !tbaa !1
  %428 = getelementptr inbounds double, double* %8, i64 %425
  %429 = load double, double* %428, align 8, !tbaa !1
  %430 = fmul double %427, %429
  %431 = fsub double %424, %430
  %432 = add nsw i64 %417, 2
  %433 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %382, i64 %432
  %434 = load double, double* %433, align 8, !tbaa !1
  %435 = getelementptr inbounds double, double* %8, i64 %432
  %436 = load double, double* %435, align 8, !tbaa !1
  %437 = fmul double %434, %436
  %438 = fsub double %431, %437
  %439 = add nsw i64 %417, 3
  %440 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %382, i64 %439
  %441 = load double, double* %440, align 8, !tbaa !1
  %442 = getelementptr inbounds double, double* %8, i64 %439
  %443 = load double, double* %442, align 8, !tbaa !1
  %444 = fmul double %441, %443
  %445 = fsub double %438, %444
  %446 = add nsw i64 %417, 4
  %447 = icmp eq i64 %446, 2000
  br i1 %447, label %449, label %._crit_edge8

._crit_edge8:                                     ; preds = %416
  %pgocount46 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 8)
  %448 = add i64 %pgocount46, 1
  store i64 %448, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 8)
  br label %416

; <label>:449:                                    ; preds = %416
  %pgocount47 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 34)
  %450 = add i64 %pgocount47, 1
  store i64 %450, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 34)
  br label %451

; <label>:451:                                    ; preds = %449, %410
  %452 = phi double [ %411, %410 ], [ %445, %449 ]
  %pgocount48 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 30)
  %453 = add i64 %pgocount48, 1
  store i64 %453, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 30)
  br label %454

; <label>:454:                                    ; preds = %._crit_edge12, %451
  %455 = phi double [ %386, %._crit_edge12 ], [ %452, %451 ]
  %456 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %382, i64 %382
  %457 = load double, double* %456, align 8, !tbaa !1
  %458 = fdiv double %455, %457
  %459 = getelementptr inbounds double, double* %8, i64 %382
  store double %458, double* %459, align 8, !tbaa !1
  %460 = add nsw i64 %382, -1
  %461 = icmp sgt i64 %382, 0
  %462 = add nsw i64 %383, -1
  %463 = add i64 %381, 1
  br i1 %461, label %380, label %464

; <label>:464:                                    ; preds = %454
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %465 = icmp sgt i32 %0, 42
  br i1 %465, label %466, label %499

; <label>:466:                                    ; preds = %464
  %pgocount49 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 36)
  %467 = add i64 %pgocount49, 1
  store i64 %467, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 36)
  %468 = load i8*, i8** %1, align 8, !tbaa !17
  %469 = load i8, i8* %468, align 1, !tbaa !19
  %470 = icmp eq i8 %469, 0
  br i1 %470, label %471, label %499

; <label>:471:                                    ; preds = %466
  %472 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %473 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %472) #5
  %474 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %475 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %474, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %476

; <label>:476:                                    ; preds = %486, %471
  %477 = phi i64 [ 0, %471 ], [ %491, %486 ]
  %478 = trunc i64 %477 to i32
  %479 = srem i32 %478, 20
  %480 = icmp eq i32 %479, 0
  br i1 %480, label %482, label %._crit_edge15

._crit_edge15:                                    ; preds = %476
  %pgocount50 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 20)
  %481 = add i64 %pgocount50, 1
  store i64 %481, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 20)
  br label %486

; <label>:482:                                    ; preds = %476
  %pgocount51 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 37)
  %483 = add i64 %pgocount51, 1
  store i64 %483, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 37)
  %484 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %485 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %484) #5
  br label %486

; <label>:486:                                    ; preds = %._crit_edge15, %482
  %487 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %488 = getelementptr inbounds double, double* %8, i64 %477
  %489 = load double, double* %488, align 8, !tbaa !1
  %490 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %487, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %489) #5
  %491 = add nuw nsw i64 %477, 1
  %492 = icmp eq i64 %491, 2000
  br i1 %492, label %493, label %476

; <label>:493:                                    ; preds = %486
  %pgocount52 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 38)
  %494 = add i64 %pgocount52, 1
  store i64 %494, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 38)
  %495 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %496 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %495, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %497 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %498 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %497) #5
  br label %499

; <label>:499:                                    ; preds = %493, %466, %464
  %pgocount53 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 35)
  %500 = add i64 %pgocount53, 1
  store i64 %500, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_main, i64 0, i64 35)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* nonnull %5) #3
  tail call void @free(i8* %6) #3
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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !11, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !3, i64 0}
!19 = !{!3, !3, i64 0}
