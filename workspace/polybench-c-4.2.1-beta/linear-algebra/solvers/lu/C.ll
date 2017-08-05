; ModuleID = 'B.ll'
source_filename = "lu.c"
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
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 367587878727, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
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

; <label>:14:                                     ; preds = %._crit_edge2, %5
  %15 = phi i64 [ 0, %5 ], [ %23, %._crit_edge2 ]
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
  br i1 %24, label %26, label %._crit_edge2

._crit_edge2:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 2)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 2)
  br label %14

; <label>:26:                                     ; preds = %14
  %27 = add nuw nsw i64 %6, 1
  %28 = icmp slt i64 %27, 2000
  br i1 %28, label %29, label %36

; <label>:29:                                     ; preds = %26
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 17)
  %30 = add i64 %pgocount9, 1
  store i64 %30, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 17)
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
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 16)
  %37 = add i64 %pgocount10, 1
  store i64 %37, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 16)
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

; <label>:48:                                     ; preds = %._crit_edge6, %45
  %49 = phi i64 [ 0, %45 ], [ %65, %._crit_edge6 ]
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
  br i1 %66, label %68, label %._crit_edge6

._crit_edge6:                                     ; preds = %48
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 6)
  %67 = add i64 %pgocount11, 1
  store i64 %67, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 6)
  br label %48

; <label>:68:                                     ; preds = %48
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 9)
  %69 = add i64 %pgocount12, 1
  store i64 %69, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 9)
  %70 = add nuw nsw i64 %46, 1
  %71 = icmp eq i64 %70, 2000
  br i1 %71, label %72, label %45

; <label>:72:                                     ; preds = %68
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 18)
  %73 = add i64 %pgocount13, 1
  store i64 %73, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 18)
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

; <label>:90:                                     ; preds = %._crit_edge3, %88
  %91 = phi i64 [ 0, %88 ], [ %113, %._crit_edge3 ]
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
  br i1 %114, label %152, label %._crit_edge3, !llvm.loop !10

._crit_edge3:                                     ; preds = %90
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 3)
  %115 = add i64 %pgocount14, 1
  store i64 %115, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 3)
  br label %90

; <label>:116:                                    ; preds = %._crit_edge4, %89
  %117 = phi i64 [ 0, %89 ], [ %147, %._crit_edge4 ]
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
  br i1 %148, label %150, label %._crit_edge4, !llvm.loop !13

._crit_edge4:                                     ; preds = %116
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 4)
  %149 = add i64 %pgocount15, 1
  store i64 %149, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 4)
  br label %116

; <label>:150:                                    ; preds = %116
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 20)
  %151 = add i64 %pgocount16, 1
  store i64 %151, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 20)
  br label %154

; <label>:152:                                    ; preds = %90
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 21)
  %153 = add i64 %pgocount17, 1
  store i64 %153, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 21)
  br label %154

; <label>:154:                                    ; preds = %152, %150
  %155 = add nuw nsw i64 %78, 1
  %156 = icmp eq i64 %155, 2000
  br i1 %156, label %157, label %77

; <label>:157:                                    ; preds = %154
  tail call void @free(i8* nonnull %41) #3
  tail call void (...) @polybench_timer_start() #3
  br label %158

; <label>:158:                                    ; preds = %268, %157
  %159 = phi i64 [ 0, %157 ], [ %269, %268 ]
  %160 = icmp sgt i64 %159, 0
  br i1 %160, label %162, label %._crit_edge7

._crit_edge7:                                     ; preds = %158
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 7)
  %161 = add i64 %pgocount18, 1
  store i64 %161, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 7)
  br label %268

; <label>:162:                                    ; preds = %158
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 0
  br label %206

; <label>:164:                                    ; preds = %261, %203
  %165 = phi i64 [ %204, %203 ], [ %159, %261 ]
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %165
  %167 = load double, double* %166, align 8, !tbaa !1
  br i1 %263, label %176, label %168

; <label>:168:                                    ; preds = %164
  br label %169

; <label>:169:                                    ; preds = %168
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 12)
  %170 = add i64 %pgocount19, 1
  store i64 %170, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 12)
  %171 = load double, double* %264, align 8, !tbaa !1
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %165
  %173 = load double, double* %172, align 8, !tbaa !1
  %174 = fmul double %171, %173
  %175 = fsub double %167, %174
  store double %175, double* %166, align 8, !tbaa !1
  br label %176

; <label>:176:                                    ; preds = %169, %164
  %177 = phi double [ %175, %169 ], [ %167, %164 ]
  %178 = phi i64 [ 1, %169 ], [ 0, %164 ]
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 10)
  %179 = add i64 %pgocount20, 1
  store i64 %179, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 10)
  br label %180

; <label>:180:                                    ; preds = %176
  br i1 %265, label %203, label %181

; <label>:181:                                    ; preds = %180
  br label %182

; <label>:182:                                    ; preds = %._crit_edge, %181
  %183 = phi double [ %177, %181 ], [ %197, %._crit_edge ]
  %184 = phi i64 [ %178, %181 ], [ %198, %._crit_edge ]
  %185 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %184
  %186 = load double, double* %185, align 8, !tbaa !1
  %187 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %184, i64 %165
  %188 = load double, double* %187, align 8, !tbaa !1
  %189 = fmul double %186, %188
  %190 = fsub double %183, %189
  store double %190, double* %166, align 8, !tbaa !1
  %191 = add nuw nsw i64 %184, 1
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %191
  %193 = load double, double* %192, align 8, !tbaa !1
  %194 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %191, i64 %165
  %195 = load double, double* %194, align 8, !tbaa !1
  %196 = fmul double %193, %195
  %197 = fsub double %190, %196
  store double %197, double* %166, align 8, !tbaa !1
  %198 = add nsw i64 %184, 2
  %199 = icmp eq i64 %198, %159
  br i1 %199, label %201, label %._crit_edge

._crit_edge:                                      ; preds = %182
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 0)
  %200 = add i64 %pgocount21, 1
  store i64 %200, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 0)
  br label %182

; <label>:201:                                    ; preds = %182
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 13)
  %202 = add i64 %pgocount22, 1
  store i64 %202, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 13)
  br label %203

; <label>:203:                                    ; preds = %201, %180
  %204 = add nuw nsw i64 %165, 1
  %205 = icmp eq i64 %204, 2000
  br i1 %205, label %266, label %164

; <label>:206:                                    ; preds = %254, %162
  %207 = phi i64 [ %259, %254 ], [ 0, %162 ]
  %208 = icmp sgt i64 %207, 0
  %209 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %207
  %210 = load double, double* %209, align 8, !tbaa !1
  br i1 %208, label %212, label %._crit_edge5

._crit_edge5:                                     ; preds = %206
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 5)
  %211 = add i64 %pgocount23, 1
  store i64 %211, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 5)
  br label %254

; <label>:212:                                    ; preds = %206
  %213 = and i64 %207, 1
  %214 = icmp eq i64 %213, 0
  br i1 %214, label %223, label %215

; <label>:215:                                    ; preds = %212
  br label %216

; <label>:216:                                    ; preds = %215
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 14)
  %217 = add i64 %pgocount24, 1
  store i64 %217, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 14)
  %218 = load double, double* %163, align 8, !tbaa !1
  %219 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %207
  %220 = load double, double* %219, align 8, !tbaa !1
  %221 = fmul double %218, %220
  %222 = fsub double %210, %221
  store double %222, double* %209, align 8, !tbaa !1
  br label %223

; <label>:223:                                    ; preds = %216, %212
  %224 = phi double [ %222, %216 ], [ undef, %212 ]
  %225 = phi i64 [ 1, %216 ], [ 0, %212 ]
  %226 = phi double [ %222, %216 ], [ %210, %212 ]
  br label %227

; <label>:227:                                    ; preds = %223
  %228 = icmp eq i64 %207, 1
  br i1 %228, label %251, label %229

; <label>:229:                                    ; preds = %227
  br label %230

; <label>:230:                                    ; preds = %._crit_edge1, %229
  %231 = phi i64 [ %225, %229 ], [ %246, %._crit_edge1 ]
  %232 = phi double [ %226, %229 ], [ %245, %._crit_edge1 ]
  %233 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %231
  %234 = load double, double* %233, align 8, !tbaa !1
  %235 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %231, i64 %207
  %236 = load double, double* %235, align 8, !tbaa !1
  %237 = fmul double %234, %236
  %238 = fsub double %232, %237
  store double %238, double* %209, align 8, !tbaa !1
  %239 = add nuw nsw i64 %231, 1
  %240 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 %239
  %241 = load double, double* %240, align 8, !tbaa !1
  %242 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %239, i64 %207
  %243 = load double, double* %242, align 8, !tbaa !1
  %244 = fmul double %241, %243
  %245 = fsub double %238, %244
  store double %245, double* %209, align 8, !tbaa !1
  %246 = add nsw i64 %231, 2
  %247 = icmp eq i64 %246, %207
  br i1 %247, label %249, label %._crit_edge1

._crit_edge1:                                     ; preds = %230
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 1)
  %248 = add i64 %pgocount25, 1
  store i64 %248, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 1)
  br label %230

; <label>:249:                                    ; preds = %230
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 15)
  %250 = add i64 %pgocount26, 1
  store i64 %250, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 15)
  br label %251

; <label>:251:                                    ; preds = %249, %227
  %252 = phi double [ %224, %227 ], [ %245, %249 ]
  %pgocount27 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 11)
  %253 = add i64 %pgocount27, 1
  store i64 %253, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 11)
  br label %254

; <label>:254:                                    ; preds = %._crit_edge5, %251
  %255 = phi double [ %210, %._crit_edge5 ], [ %252, %251 ]
  %256 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %207, i64 %207
  %257 = load double, double* %256, align 8, !tbaa !1
  %258 = fdiv double %255, %257
  store double %258, double* %209, align 8, !tbaa !1
  %259 = add nuw nsw i64 %207, 1
  %260 = icmp eq i64 %259, %159
  br i1 %260, label %261, label %206

; <label>:261:                                    ; preds = %254
  %262 = and i64 %159, 1
  %263 = icmp eq i64 %262, 0
  %264 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %159, i64 0
  %265 = icmp eq i64 %159, 1
  br label %164

; <label>:266:                                    ; preds = %203
  %pgocount28 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 19)
  %267 = add i64 %pgocount28, 1
  store i64 %267, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 19)
  br label %268

; <label>:268:                                    ; preds = %._crit_edge7, %266
  %269 = add nuw nsw i64 %159, 1
  %270 = icmp eq i64 %269, 2000
  br i1 %270, label %271, label %158

; <label>:271:                                    ; preds = %268
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %272 = icmp sgt i32 %0, 42
  br i1 %272, label %273, label %314

; <label>:273:                                    ; preds = %271
  %pgocount29 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 24)
  %274 = add i64 %pgocount29, 1
  store i64 %274, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 24)
  %275 = load i8*, i8** %1, align 8, !tbaa !14
  %276 = load i8, i8* %275, align 1, !tbaa !16
  %277 = icmp eq i8 %276, 0
  br i1 %277, label %278, label %314

; <label>:278:                                    ; preds = %273
  %279 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %280 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %279) #5
  %281 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %282 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %281, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %283

; <label>:283:                                    ; preds = %304, %278
  %284 = phi i64 [ 0, %278 ], [ %306, %304 ]
  %285 = mul nuw nsw i64 %284, 2000
  br label %286

; <label>:286:                                    ; preds = %297, %283
  %287 = phi i64 [ 0, %283 ], [ %302, %297 ]
  %288 = add nuw nsw i64 %287, %285
  %289 = trunc i64 %288 to i32
  %290 = srem i32 %289, 20
  %291 = icmp eq i32 %290, 0
  br i1 %291, label %293, label %._crit_edge8

._crit_edge8:                                     ; preds = %286
  %pgocount30 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 8)
  %292 = add i64 %pgocount30, 1
  store i64 %292, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 8)
  br label %297

; <label>:293:                                    ; preds = %286
  %pgocount31 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 22)
  %294 = add i64 %pgocount31, 1
  store i64 %294, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 22)
  %295 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %296 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %295) #5
  br label %297

; <label>:297:                                    ; preds = %._crit_edge8, %293
  %298 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %299 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %284, i64 %287
  %300 = load double, double* %299, align 8, !tbaa !1
  %301 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %298, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %300) #5
  %302 = add nuw nsw i64 %287, 1
  %303 = icmp eq i64 %302, 2000
  br i1 %303, label %304, label %286

; <label>:304:                                    ; preds = %297
  %pgocount32 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 25)
  %305 = add i64 %pgocount32, 1
  store i64 %305, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 25)
  %306 = add nuw nsw i64 %284, 1
  %307 = icmp eq i64 %306, 2000
  br i1 %307, label %308, label %283

; <label>:308:                                    ; preds = %304
  %pgocount33 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 26)
  %309 = add i64 %pgocount33, 1
  store i64 %309, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 26)
  %310 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %311 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %310, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %312 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %313 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %312) #5
  br label %314

; <label>:314:                                    ; preds = %308, %273, %271
  %pgocount34 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 23)
  %315 = add i64 %pgocount34, 1
  store i64 %315, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main, i64 0, i64 23)
  tail call void @free(i8* %3) #3
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
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !3, i64 0}
!16 = !{!3, !3, i64 0}
