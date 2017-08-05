; ModuleID = 'C.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 362812565579, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  br label %5

; <label>:5:                                      ; preds = %34, %2
  %6 = phi i64 [ 0, %2 ], [ %27, %34 ]
  %7 = phi i64 [ 1, %2 ], [ %35, %34 ]
  %8 = mul nuw nsw i64 %6, 2001
  %9 = add nuw nsw i64 %8, 1
  %10 = getelementptr [2000 x double], [2000 x double]* %4, i64 0, i64 %9
  %11 = sub i64 1998, %6
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  br label %14

; <label>:14:                                     ; preds = %._crit_edge1, %5
  %15 = phi i64 [ 0, %5 ], [ %23, %._crit_edge1 ]
  %16 = sub nsw i64 0, %15
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 2000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 2.000000e+03
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %6, i64 %15
  store double %21, double* %22, align 8, !tbaa !1
  %23 = add nuw nsw i64 %15, 1
  %24 = icmp eq i64 %23, %7
  br i1 %24, label %26, label %._crit_edge1

._crit_edge1:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 1)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 1)
  br label %14

; <label>:26:                                     ; preds = %14
  %27 = add nuw nsw i64 %6, 1
  %28 = icmp slt i64 %27, 2000
  br i1 %28, label %29, label %36

; <label>:29:                                     ; preds = %26
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 14)
  %30 = add i64 %pgocount9, 1
  store i64 %30, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 14)
  %31 = add nuw nsw i64 %13, 8
  %32 = bitcast double* %10 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %32, i8 0, i64 %31, i32 8, i1 false) #3
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %6, i64 %6
  store double 1.000000e+00, double* %33, align 8, !tbaa !1
  br label %34

; <label>:34:                                     ; preds = %36, %29
  %35 = add nuw nsw i64 %7, 1
  br label %5

; <label>:36:                                     ; preds = %26
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 13)
  %37 = add i64 %pgocount10, 1
  store i64 %37, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 13)
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %6, i64 %6
  store double 1.000000e+00, double* %38, align 8, !tbaa !1
  %39 = icmp eq i64 %27, 2000
  br i1 %39, label %40, label %34

; <label>:40:                                     ; preds = %36
  %41 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  tail call void @llvm.memset.p0i8.i64(i8* %41, i8 0, i64 32000000, i32 8, i1 false) #3
  %42 = bitcast i8* %41 to [2000 x [2000 x double]]*
  br label %43

; <label>:43:                                     ; preds = %72, %40
  %44 = phi i64 [ 0, %40 ], [ %74, %72 ]
  br label %45

; <label>:45:                                     ; preds = %68, %43
  %46 = phi i64 [ 0, %43 ], [ %70, %68 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %46, i64 %44
  br label %48

; <label>:48:                                     ; preds = %._crit_edge7, %45
  %49 = phi i64 [ 0, %45 ], [ %65, %._crit_edge7 ]
  %50 = load double, double* %47, align 8, !tbaa !1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %49, i64 %44
  %52 = load double, double* %51, align 8, !tbaa !1
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %46, i64 %49
  %55 = load double, double* %54, align 8, !tbaa !1
  %56 = fadd double %55, %53
  store double %56, double* %54, align 8, !tbaa !1
  %57 = or i64 %49, 1
  %58 = load double, double* %47, align 8, !tbaa !1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %57, i64 %44
  %60 = load double, double* %59, align 8, !tbaa !1
  %61 = fmul double %58, %60
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %46, i64 %57
  %63 = load double, double* %62, align 8, !tbaa !1
  %64 = fadd double %63, %61
  store double %64, double* %62, align 8, !tbaa !1
  %65 = add nsw i64 %49, 2
  %66 = icmp eq i64 %65, 2000
  br i1 %66, label %68, label %._crit_edge7

._crit_edge7:                                     ; preds = %48
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 7)
  %67 = add i64 %pgocount11, 1
  store i64 %67, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 7)
  br label %48

; <label>:68:                                     ; preds = %48
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 9)
  %69 = add i64 %pgocount12, 1
  store i64 %69, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 9)
  %70 = add nuw nsw i64 %46, 1
  %71 = icmp eq i64 %70, 2000
  br i1 %71, label %72, label %45

; <label>:72:                                     ; preds = %68
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 15)
  %73 = add i64 %pgocount13, 1
  store i64 %73, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 15)
  %74 = add nuw nsw i64 %44, 1
  %75 = icmp eq i64 %74, 2000
  br i1 %75, label %76, label %43

; <label>:76:                                     ; preds = %72
  br label %77

; <label>:77:                                     ; preds = %154, %76
  %78 = phi i64 [ %155, %154 ], [ 0, %76 ]
  %79 = mul i64 %78, 16000
  %80 = getelementptr i8, i8* %3, i64 %79
  %81 = add i64 %79, 16000
  %82 = getelementptr i8, i8* %3, i64 %81
  %83 = getelementptr i8, i8* %41, i64 %79
  %84 = getelementptr i8, i8* %41, i64 %81
  %85 = icmp ult i8* %80, %84
  %86 = icmp ult i8* %83, %82
  %87 = and i1 %85, %86
  br i1 %87, label %89, label %88

; <label>:88:                                     ; preds = %77
  br label %90

; <label>:89:                                     ; preds = %77
  br label %116

; <label>:90:                                     ; preds = %._crit_edge2, %88
  %91 = phi i64 [ 0, %88 ], [ %113, %._crit_edge2 ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %78, i64 %91
  %93 = bitcast double* %92 to <2 x i64>*
  %94 = load <2 x i64>, <2 x i64>* %93, align 8, !tbaa !1, !alias.scope !5
  %95 = getelementptr double, double* %92, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %97 = load <2 x i64>, <2 x i64>* %96, align 8, !tbaa !1, !alias.scope !5
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %78, i64 %91
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %94, <2 x i64>* %99, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %97, <2 x i64>* %101, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %102 = or i64 %91, 4
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %78, i64 %102
  %104 = bitcast double* %103 to <2 x i64>*
  %105 = load <2 x i64>, <2 x i64>* %104, align 8, !tbaa !1, !alias.scope !5
  %106 = getelementptr double, double* %103, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  %108 = load <2 x i64>, <2 x i64>* %107, align 8, !tbaa !1, !alias.scope !5
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %78, i64 %102
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %105, <2 x i64>* %110, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %108, <2 x i64>* %112, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %113 = add nsw i64 %91, 8
  %114 = icmp eq i64 %113, 2000
  br i1 %114, label %152, label %._crit_edge2, !llvm.loop !10

._crit_edge2:                                     ; preds = %90
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 2)
  %115 = add i64 %pgocount14, 1
  store i64 %115, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 2)
  br label %90

; <label>:116:                                    ; preds = %._crit_edge3, %89
  %117 = phi i64 [ 0, %89 ], [ %147, %._crit_edge3 ]
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %78, i64 %117
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8, !tbaa !1
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %78, i64 %117
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8, !tbaa !1
  %123 = add nuw nsw i64 %117, 1
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %78, i64 %123
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8, !tbaa !1
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %78, i64 %123
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8, !tbaa !1
  %129 = add nsw i64 %117, 2
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %78, i64 %129
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8, !tbaa !1
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %78, i64 %129
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8, !tbaa !1
  %135 = add nsw i64 %117, 3
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %78, i64 %135
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8, !tbaa !1
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %78, i64 %135
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8, !tbaa !1
  %141 = add nsw i64 %117, 4
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %78, i64 %141
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8, !tbaa !1
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %78, i64 %141
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8, !tbaa !1
  %147 = add nsw i64 %117, 5
  %148 = icmp eq i64 %147, 2000
  br i1 %148, label %150, label %._crit_edge3, !llvm.loop !13

._crit_edge3:                                     ; preds = %116
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 3)
  %149 = add i64 %pgocount15, 1
  store i64 %149, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 3)
  br label %116

; <label>:150:                                    ; preds = %116
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 17)
  %151 = add i64 %pgocount16, 1
  store i64 %151, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 17)
  br label %154

; <label>:152:                                    ; preds = %90
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 18)
  %153 = add i64 %pgocount17, 1
  store i64 %153, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 18)
  br label %154

; <label>:154:                                    ; preds = %152, %150
  %155 = add nuw nsw i64 %78, 1
  %156 = icmp eq i64 %155, 2000
  br i1 %156, label %157, label %77

; <label>:157:                                    ; preds = %154
  tail call void @free(i8* nonnull %41) #3
  tail call void (...) @polybench_timer_start() #3
  br label %158

; <label>:158:                                    ; preds = %279, %157
  %159 = phi i64 [ 0, %157 ], [ %283, %279 ]
  %160 = add i64 %159, -1
  %161 = icmp sgt i64 %159, 0
  br i1 %161, label %162, label %164

; <label>:162:                                    ; preds = %158
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 0
  br label %194

; <label>:164:                                    ; preds = %158
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 20)
  %165 = add i64 %pgocount18, 1
  store i64 %165, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 20)
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %159
  %167 = load double, double* %166, align 8, !tbaa !1
  br label %279

; <label>:168:                                    ; preds = %242
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %159
  %170 = load double, double* %169, align 8, !tbaa !1
  %171 = and i64 %159, 3
  %172 = icmp eq i64 %171, 0
  br i1 %172, label %188, label %173

; <label>:173:                                    ; preds = %168
  br label %174

; <label>:174:                                    ; preds = %._crit_edge4, %173
  %175 = phi i64 [ %182, %._crit_edge4 ], [ 0, %173 ]
  %176 = phi double [ %181, %._crit_edge4 ], [ %170, %173 ]
  %177 = phi i64 [ %183, %._crit_edge4 ], [ %171, %173 ]
  %178 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %175
  %179 = load double, double* %178, align 8, !tbaa !1
  %180 = fmul double %179, %179
  %181 = fsub double %176, %180
  store double %181, double* %169, align 8, !tbaa !1
  %182 = add nuw nsw i64 %175, 1
  %183 = add i64 %177, -1
  %184 = icmp eq i64 %183, 0
  br i1 %184, label %186, label %._crit_edge4, !llvm.loop !14

._crit_edge4:                                     ; preds = %174
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 4)
  %185 = add i64 %pgocount19, 1
  store i64 %185, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 4)
  br label %174

; <label>:186:                                    ; preds = %174
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 19)
  %187 = add i64 %pgocount20, 1
  store i64 %187, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 19)
  br label %188

; <label>:188:                                    ; preds = %186, %168
  %189 = phi double [ undef, %168 ], [ %181, %186 ]
  %190 = phi i64 [ 0, %168 ], [ %182, %186 ]
  %191 = phi double [ %170, %168 ], [ %181, %186 ]
  %192 = icmp ult i64 %160, 3
  br i1 %192, label %276, label %193

; <label>:193:                                    ; preds = %188
  br label %249

; <label>:194:                                    ; preds = %242, %162
  %195 = phi i64 [ %247, %242 ], [ 0, %162 ]
  %196 = icmp sgt i64 %195, 0
  %197 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %195
  %198 = load double, double* %197, align 8, !tbaa !1
  br i1 %196, label %200, label %._crit_edge6

._crit_edge6:                                     ; preds = %194
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 6)
  %199 = add i64 %pgocount21, 1
  store i64 %199, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 6)
  br label %242

; <label>:200:                                    ; preds = %194
  %201 = and i64 %195, 1
  %202 = icmp eq i64 %201, 0
  br i1 %202, label %211, label %203

; <label>:203:                                    ; preds = %200
  br label %204

; <label>:204:                                    ; preds = %203
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 11)
  %205 = add i64 %pgocount22, 1
  store i64 %205, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 11)
  %206 = load double, double* %163, align 8, !tbaa !1
  %207 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %195, i64 0
  %208 = load double, double* %207, align 8, !tbaa !1
  %209 = fmul double %206, %208
  %210 = fsub double %198, %209
  store double %210, double* %197, align 8, !tbaa !1
  br label %211

; <label>:211:                                    ; preds = %204, %200
  %212 = phi double [ %210, %204 ], [ undef, %200 ]
  %213 = phi i64 [ 1, %204 ], [ 0, %200 ]
  %214 = phi double [ %210, %204 ], [ %198, %200 ]
  br label %215

; <label>:215:                                    ; preds = %211
  %216 = icmp eq i64 %195, 1
  br i1 %216, label %239, label %217

; <label>:217:                                    ; preds = %215
  br label %218

; <label>:218:                                    ; preds = %._crit_edge, %217
  %219 = phi i64 [ %213, %217 ], [ %234, %._crit_edge ]
  %220 = phi double [ %214, %217 ], [ %233, %._crit_edge ]
  %221 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %219
  %222 = load double, double* %221, align 8, !tbaa !1
  %223 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %195, i64 %219
  %224 = load double, double* %223, align 8, !tbaa !1
  %225 = fmul double %222, %224
  %226 = fsub double %220, %225
  store double %226, double* %197, align 8, !tbaa !1
  %227 = add nuw nsw i64 %219, 1
  %228 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %227
  %229 = load double, double* %228, align 8, !tbaa !1
  %230 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %195, i64 %227
  %231 = load double, double* %230, align 8, !tbaa !1
  %232 = fmul double %229, %231
  %233 = fsub double %226, %232
  store double %233, double* %197, align 8, !tbaa !1
  %234 = add nsw i64 %219, 2
  %235 = icmp eq i64 %234, %195
  br i1 %235, label %237, label %._crit_edge

._crit_edge:                                      ; preds = %218
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 0)
  %236 = add i64 %pgocount23, 1
  store i64 %236, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 0)
  br label %218

; <label>:237:                                    ; preds = %218
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 12)
  %238 = add i64 %pgocount24, 1
  store i64 %238, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 12)
  br label %239

; <label>:239:                                    ; preds = %237, %215
  %240 = phi double [ %212, %215 ], [ %233, %237 ]
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 10)
  %241 = add i64 %pgocount25, 1
  store i64 %241, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 10)
  br label %242

; <label>:242:                                    ; preds = %239, %._crit_edge6
  %243 = phi double [ %198, %._crit_edge6 ], [ %240, %239 ]
  %244 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %195, i64 %195
  %245 = load double, double* %244, align 8, !tbaa !1
  %246 = fdiv double %243, %245
  store double %246, double* %197, align 8, !tbaa !1
  %247 = add nuw nsw i64 %195, 1
  %248 = icmp eq i64 %247, %159
  br i1 %248, label %168, label %194

; <label>:249:                                    ; preds = %._crit_edge5, %193
  %250 = phi i64 [ %190, %193 ], [ %271, %._crit_edge5 ]
  %251 = phi double [ %191, %193 ], [ %270, %._crit_edge5 ]
  %252 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %250
  %253 = load double, double* %252, align 8, !tbaa !1
  %254 = fmul double %253, %253
  %255 = fsub double %251, %254
  store double %255, double* %169, align 8, !tbaa !1
  %256 = add nuw nsw i64 %250, 1
  %257 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %256
  %258 = load double, double* %257, align 8, !tbaa !1
  %259 = fmul double %258, %258
  %260 = fsub double %255, %259
  store double %260, double* %169, align 8, !tbaa !1
  %261 = add nsw i64 %250, 2
  %262 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %261
  %263 = load double, double* %262, align 8, !tbaa !1
  %264 = fmul double %263, %263
  %265 = fsub double %260, %264
  store double %265, double* %169, align 8, !tbaa !1
  %266 = add nsw i64 %250, 3
  %267 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %266
  %268 = load double, double* %267, align 8, !tbaa !1
  %269 = fmul double %268, %268
  %270 = fsub double %265, %269
  store double %270, double* %169, align 8, !tbaa !1
  %271 = add nsw i64 %250, 4
  %272 = icmp eq i64 %271, %159
  br i1 %272, label %274, label %._crit_edge5

._crit_edge5:                                     ; preds = %249
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 5)
  %273 = add i64 %pgocount26, 1
  store i64 %273, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 5)
  br label %249

; <label>:274:                                    ; preds = %249
  %pgocount27 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 21)
  %275 = add i64 %pgocount27, 1
  store i64 %275, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 21)
  br label %276

; <label>:276:                                    ; preds = %274, %188
  %277 = phi double [ %189, %188 ], [ %270, %274 ]
  %pgocount28 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 16)
  %278 = add i64 %pgocount28, 1
  store i64 %278, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 16)
  br label %279

; <label>:279:                                    ; preds = %276, %164
  %280 = phi double* [ %166, %164 ], [ %169, %276 ]
  %281 = phi double [ %167, %164 ], [ %277, %276 ]
  %282 = tail call double @sqrt(double %281) #3
  store double %282, double* %280, align 8, !tbaa !1
  %283 = add nuw nsw i64 %159, 1
  %284 = icmp eq i64 %283, 2000
  br i1 %284, label %285, label %158

; <label>:285:                                    ; preds = %279
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %286 = icmp sgt i32 %0, 42
  br i1 %286, label %287, label %330

; <label>:287:                                    ; preds = %285
  %pgocount29 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 24)
  %288 = add i64 %pgocount29, 1
  store i64 %288, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 24)
  %289 = load i8*, i8** %1, align 8, !tbaa !16
  %290 = load i8, i8* %289, align 1, !tbaa !18
  %291 = icmp eq i8 %290, 0
  br i1 %291, label %292, label %330

; <label>:292:                                    ; preds = %287
  %293 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %294 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %293) #5
  %295 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %296 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %295, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %297

; <label>:297:                                    ; preds = %319, %292
  %298 = phi i64 [ 0, %292 ], [ %321, %319 ]
  %299 = phi i64 [ 1, %292 ], [ %322, %319 ]
  %300 = mul nuw nsw i64 %298, 2000
  br label %301

; <label>:301:                                    ; preds = %312, %297
  %302 = phi i64 [ %317, %312 ], [ 0, %297 ]
  %303 = add nuw nsw i64 %302, %300
  %304 = trunc i64 %303 to i32
  %305 = srem i32 %304, 20
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %308, label %._crit_edge8

._crit_edge8:                                     ; preds = %301
  %pgocount30 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 8)
  %307 = add i64 %pgocount30, 1
  store i64 %307, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 8)
  br label %312

; <label>:308:                                    ; preds = %301
  %pgocount31 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 22)
  %309 = add i64 %pgocount31, 1
  store i64 %309, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 22)
  %310 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %311 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %310) #5
  br label %312

; <label>:312:                                    ; preds = %308, %._crit_edge8
  %313 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %314 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %298, i64 %302
  %315 = load double, double* %314, align 8, !tbaa !1
  %316 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %313, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %315) #5
  %317 = add nuw nsw i64 %302, 1
  %318 = icmp eq i64 %317, %299
  br i1 %318, label %319, label %301

; <label>:319:                                    ; preds = %312
  %pgocount32 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 25)
  %320 = add i64 %pgocount32, 1
  store i64 %320, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 25)
  %321 = add nuw nsw i64 %298, 1
  %322 = add nuw nsw i64 %299, 1
  %323 = icmp eq i64 %321, 2000
  br i1 %323, label %324, label %297

; <label>:324:                                    ; preds = %319
  %pgocount33 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 26)
  %325 = add i64 %pgocount33, 1
  store i64 %325, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 26)
  %326 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %327 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %326, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %328 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %329 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %328) #5
  br label %330

; <label>:330:                                    ; preds = %324, %287, %285
  %pgocount34 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 23)
  %331 = add i64 %pgocount34, 1
  store i64 %331, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 23)
  tail call void @free(i8* nonnull %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

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
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !3, i64 0}
!18 = !{!3, !3, i64 0}
