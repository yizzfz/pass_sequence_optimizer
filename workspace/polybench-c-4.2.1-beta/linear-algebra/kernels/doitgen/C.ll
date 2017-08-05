; ModuleID = 'B.ll'
source_filename = "doitgen.c"
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
@__profn_kernel_doitgen = private constant [14 x i8] c"kernel_doitgen"
@__profn_main = private constant [4 x i8] c"main"
@__profc_kernel_doitgen = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_kernel_doitgen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7952097593059838232, i64 291138564928, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i32 0, i32 0), i8* bitcast (void (i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*)* @kernel_doitgen to i8*), i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 241983937010, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [29 x i8] c"\13\1Bx\DA\CBN-\CAK\CD\89O\C9\CF,IO\CDc\CCM\CC\CC\03\00L\84\07q", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_kernel_doitgen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %200

; <label>:8:                                      ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %11 = zext i32 %2 to i64
  %12 = zext i32 %2 to i64
  %13 = zext i32 %1 to i64
  %14 = zext i32 %1 to i64
  %15 = zext i32 %0 to i64
  %16 = getelementptr double, double* %5, i64 %12
  %17 = add nsw i64 %14, -1
  %18 = add nsw i64 %11, -1
  %19 = and i64 %11, 1
  %20 = icmp eq i64 %19, 0
  %21 = icmp eq i32 %2, 1
  %22 = icmp ult i32 %2, 4
  %23 = and i32 %2, 3
  %24 = zext i32 %23 to i64
  %25 = sub nsw i64 %12, %24
  %26 = icmp eq i64 %25, 0
  %27 = icmp eq i32 %23, 0
  %28 = and i64 %14, 7
  %29 = icmp eq i64 %28, 0
  %30 = icmp ult i64 %17, 7
  br label %31

; <label>:31:                                     ; preds = %195, %8
  %32 = phi i64 [ 0, %8 ], [ %196, %195 ]
  br i1 %9, label %34, label %._crit_edge6

._crit_edge6:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 7)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 7)
  br label %195

; <label>:34:                                     ; preds = %31
  br i1 %10, label %49, label %35

; <label>:35:                                     ; preds = %34
  br i1 %29, label %46, label %36

; <label>:36:                                     ; preds = %35
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 19)
  %37 = add i64 %pgocount7, 1
  store i64 %37, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 19)
  br label %38

; <label>:38:                                     ; preds = %._crit_edge4, %36
  %39 = phi i64 [ %41, %._crit_edge4 ], [ 0, %36 ]
  %40 = phi i64 [ %42, %._crit_edge4 ], [ %28, %36 ]
  %41 = add nuw nsw i64 %39, 1
  %42 = add i64 %40, -1
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %45, label %._crit_edge4, !llvm.loop !1

._crit_edge4:                                     ; preds = %38
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  %44 = add i64 %pgocount8, 1
  store i64 %44, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  br label %38

; <label>:45:                                     ; preds = %38
  br label %46

; <label>:46:                                     ; preds = %45, %35
  %47 = phi i64 [ 0, %35 ], [ %41, %45 ]
  br i1 %30, label %193, label %48

; <label>:48:                                     ; preds = %46
  br label %184

; <label>:49:                                     ; preds = %34
  br label %50

; <label>:50:                                     ; preds = %58, %49
  %51 = phi i64 [ %59, %58 ], [ 0, %49 ]
  %52 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 0
  %53 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %12
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 0
  br label %89

; <label>:55:                                     ; preds = %61
  br label %56

; <label>:56:                                     ; preds = %135, %55
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 11)
  %57 = add i64 %pgocount9, 1
  store i64 %57, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 11)
  br label %58

; <label>:58:                                     ; preds = %163, %56
  %59 = add nuw nsw i64 %51, 1
  %60 = icmp eq i64 %59, %13
  br i1 %60, label %189, label %50

; <label>:61:                                     ; preds = %._crit_edge2, %138
  %62 = phi i64 [ %136, %138 ], [ %86, %._crit_edge2 ]
  %63 = getelementptr inbounds double, double* %5, i64 %62
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8, !tbaa !3
  %66 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %62
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8, !tbaa !3
  %68 = add nuw nsw i64 %62, 1
  %69 = getelementptr inbounds double, double* %5, i64 %68
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8, !tbaa !3
  %72 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %68
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8, !tbaa !3
  %74 = add nsw i64 %62, 2
  %75 = getelementptr inbounds double, double* %5, i64 %74
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8, !tbaa !3
  %78 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %74
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8, !tbaa !3
  %80 = add nsw i64 %62, 3
  %81 = getelementptr inbounds double, double* %5, i64 %80
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8, !tbaa !3
  %84 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %80
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8, !tbaa !3
  %86 = add nsw i64 %62, 4
  %87 = icmp eq i64 %86, %12
  br i1 %87, label %55, label %._crit_edge2, !llvm.loop !7

._crit_edge2:                                     ; preds = %61
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  %88 = add i64 %pgocount10, 1
  store i64 %88, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  br label %61

; <label>:89:                                     ; preds = %108, %50
  %90 = phi i64 [ 0, %50 ], [ %110, %108 ]
  %91 = getelementptr inbounds double, double* %5, i64 %90
  store double 0.000000e+00, double* %91, align 8, !tbaa !3
  br i1 %20, label %100, label %92

; <label>:92:                                     ; preds = %89
  br label %93

; <label>:93:                                     ; preds = %92
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 8)
  %94 = add i64 %pgocount11, 1
  store i64 %94, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 8)
  %95 = load double, double* %54, align 8, !tbaa !3
  %96 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %90
  %97 = load double, double* %96, align 8, !tbaa !3
  %98 = fmul double %95, %97
  %99 = fadd double %98, 0.000000e+00
  store double %99, double* %91, align 8, !tbaa !3
  br label %100

; <label>:100:                                    ; preds = %93, %89
  %101 = phi double [ %99, %93 ], [ 0.000000e+00, %89 ]
  %102 = phi i64 [ 1, %93 ], [ 0, %89 ]
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 6)
  %103 = add i64 %pgocount12, 1
  store i64 %103, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 6)
  br label %104

; <label>:104:                                    ; preds = %100
  br i1 %21, label %108, label %105

; <label>:105:                                    ; preds = %104
  br label %165

; <label>:106:                                    ; preds = %165
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 9)
  %107 = add i64 %pgocount13, 1
  store i64 %107, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 9)
  br label %108

; <label>:108:                                    ; preds = %106, %104
  %109 = phi i64 [ 1, %104 ], [ %181, %106 ]
  %110 = add nuw nsw i64 %90, 1
  %111 = icmp eq i64 %110, %109
  br i1 %111, label %112, label %89

; <label>:112:                                    ; preds = %108
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 10)
  %113 = add i64 %pgocount14, 1
  store i64 %113, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 10)
  br i1 %22, label %114, label %140

; <label>:114:                                    ; preds = %163, %142, %140, %112
  %115 = phi i64 [ 0, %142 ], [ 0, %140 ], [ 0, %112 ], [ %25, %163 ]
  %116 = sub nsw i64 %11, %115
  %117 = sub nsw i64 %18, %115
  %118 = and i64 %116, 3
  %119 = icmp eq i64 %118, 0
  br i1 %119, label %135, label %120

; <label>:120:                                    ; preds = %114
  br label %121

; <label>:121:                                    ; preds = %._crit_edge1, %120
  %122 = phi i64 [ %129, %._crit_edge1 ], [ %115, %120 ]
  %123 = phi i64 [ %130, %._crit_edge1 ], [ %118, %120 ]
  %124 = getelementptr inbounds double, double* %5, i64 %122
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8, !tbaa !3
  %127 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %122
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8, !tbaa !3
  %129 = add nuw nsw i64 %122, 1
  %130 = add i64 %123, -1
  %131 = icmp eq i64 %130, 0
  br i1 %131, label %133, label %._crit_edge1, !llvm.loop !10

._crit_edge1:                                     ; preds = %121
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  %132 = add i64 %pgocount15, 1
  store i64 %132, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  br label %121

; <label>:133:                                    ; preds = %121
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 12)
  %134 = add i64 %pgocount16, 1
  store i64 %134, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 12)
  br label %135

; <label>:135:                                    ; preds = %133, %114
  %136 = phi i64 [ %115, %114 ], [ %129, %133 ]
  %137 = icmp ult i64 %117, 3
  br i1 %137, label %56, label %138

; <label>:138:                                    ; preds = %135
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 14)
  %139 = add i64 %pgocount17, 1
  store i64 %139, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 14)
  br label %61

; <label>:140:                                    ; preds = %112
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 13)
  %141 = add i64 %pgocount18, 1
  store i64 %141, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 13)
  br i1 %26, label %114, label %142

; <label>:142:                                    ; preds = %140
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 15)
  %143 = add i64 %pgocount19, 1
  store i64 %143, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 15)
  %144 = icmp ult double* %52, %16
  %145 = icmp ugt double* %53, %5
  %146 = and i1 %144, %145
  br i1 %146, label %114, label %147

; <label>:147:                                    ; preds = %142
  br label %148

; <label>:148:                                    ; preds = %._crit_edge3, %147
  %149 = phi i64 [ %160, %._crit_edge3 ], [ 0, %147 ]
  %150 = getelementptr inbounds double, double* %5, i64 %149
  %151 = bitcast double* %150 to <2 x i64>*
  %152 = load <2 x i64>, <2 x i64>* %151, align 8, !tbaa !3, !alias.scope !11
  %153 = getelementptr double, double* %150, i64 2
  %154 = bitcast double* %153 to <2 x i64>*
  %155 = load <2 x i64>, <2 x i64>* %154, align 8, !tbaa !3, !alias.scope !11
  %156 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %149
  %157 = bitcast double* %156 to <2 x i64>*
  store <2 x i64> %152, <2 x i64>* %157, align 8, !tbaa !3, !alias.scope !14, !noalias !11
  %158 = getelementptr double, double* %156, i64 2
  %159 = bitcast double* %158 to <2 x i64>*
  store <2 x i64> %155, <2 x i64>* %159, align 8, !tbaa !3, !alias.scope !14, !noalias !11
  %160 = add i64 %149, 4
  %161 = icmp eq i64 %160, %25
  br i1 %161, label %163, label %._crit_edge3, !llvm.loop !16

._crit_edge3:                                     ; preds = %148
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  %162 = add i64 %pgocount20, 1
  store i64 %162, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  br label %148

; <label>:163:                                    ; preds = %148
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 16)
  %164 = add i64 %pgocount21, 1
  store i64 %164, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 16)
  br i1 %27, label %58, label %114

; <label>:165:                                    ; preds = %._crit_edge, %105
  %166 = phi double [ %101, %105 ], [ %180, %._crit_edge ]
  %167 = phi i64 [ %102, %105 ], [ %181, %._crit_edge ]
  %168 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %167
  %169 = load double, double* %168, align 8, !tbaa !3
  %170 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %167, i64 %90
  %171 = load double, double* %170, align 8, !tbaa !3
  %172 = fmul double %169, %171
  %173 = fadd double %166, %172
  store double %173, double* %91, align 8, !tbaa !3
  %174 = add nuw nsw i64 %167, 1
  %175 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %51, i64 %174
  %176 = load double, double* %175, align 8, !tbaa !3
  %177 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %174, i64 %90
  %178 = load double, double* %177, align 8, !tbaa !3
  %179 = fmul double %176, %178
  %180 = fadd double %173, %179
  store double %180, double* %91, align 8, !tbaa !3
  %181 = add nsw i64 %167, 2
  %182 = icmp eq i64 %181, %11
  br i1 %182, label %106, label %._crit_edge

._crit_edge:                                      ; preds = %165
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  %183 = add i64 %pgocount22, 1
  store i64 %183, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  br label %165

; <label>:184:                                    ; preds = %._crit_edge5, %48
  %185 = phi i64 [ %47, %48 ], [ %186, %._crit_edge5 ]
  %186 = add nsw i64 %185, 8
  %187 = icmp eq i64 %186, %14
  br i1 %187, label %191, label %._crit_edge5

._crit_edge5:                                     ; preds = %184
  %pgocount23 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  %188 = add i64 %pgocount23, 1
  store i64 %188, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  br label %184

; <label>:189:                                    ; preds = %58
  %pgocount24 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 17)
  %190 = add i64 %pgocount24, 1
  store i64 %190, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 17)
  br label %195

; <label>:191:                                    ; preds = %184
  %pgocount25 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 20)
  %192 = add i64 %pgocount25, 1
  store i64 %192, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 20)
  br label %193

; <label>:193:                                    ; preds = %191, %46
  %pgocount26 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 18)
  %194 = add i64 %pgocount26, 1
  store i64 %194, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 18)
  br label %195

; <label>:195:                                    ; preds = %._crit_edge6, %193, %189
  %196 = add nuw nsw i64 %32, 1
  %197 = icmp eq i64 %196, %15
  br i1 %197, label %198, label %31

; <label>:198:                                    ; preds = %195
  %pgocount27 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 22)
  %199 = add i64 %pgocount27, 1
  store i64 %199, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 22)
  br label %200

; <label>:200:                                    ; preds = %198, %6
  %pgocount28 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 21)
  %201 = add i64 %pgocount28, 1
  store i64 %201, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_kernel_doitgen, i64 0, i64 21)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  br label %7

; <label>:7:                                      ; preds = %34, %2
  %8 = phi i64 [ 0, %2 ], [ %36, %34 ]
  br label %9

; <label>:9:                                      ; preds = %30, %7
  %10 = phi i64 [ 0, %7 ], [ %32, %30 ]
  %11 = mul nuw nsw i64 %10, %8
  br label %12

; <label>:12:                                     ; preds = %._crit_edge3, %9
  %13 = phi i64 [ 0, %9 ], [ %27, %._crit_edge3 ]
  %14 = add nuw nsw i64 %13, %11
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 160
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.600000e+02
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %8, i64 %10, i64 %13
  store double %18, double* %19, align 8, !tbaa !3
  %20 = or i64 %13, 1
  %21 = add nuw nsw i64 %20, %11
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.600000e+02
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %8, i64 %10, i64 %20
  store double %25, double* %26, align 8, !tbaa !3
  %27 = add nsw i64 %13, 2
  %28 = icmp eq i64 %27, 160
  br i1 %28, label %30, label %._crit_edge3

._crit_edge3:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 3)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 3)
  br label %12

; <label>:30:                                     ; preds = %12
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 7)
  %31 = add i64 %pgocount6, 1
  store i64 %31, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 7)
  %32 = add nuw nsw i64 %10, 1
  %33 = icmp eq i64 %32, 140
  br i1 %33, label %34, label %9

; <label>:34:                                     ; preds = %30
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 11)
  %35 = add i64 %pgocount7, 1
  store i64 %35, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 11)
  %36 = add nuw nsw i64 %8, 1
  %37 = icmp eq i64 %36, 150
  br i1 %37, label %38, label %7

; <label>:38:                                     ; preds = %34
  %39 = bitcast i8* %5 to [160 x double]*
  br label %40

; <label>:40:                                     ; preds = %60, %38
  %41 = phi i64 [ %62, %60 ], [ 0, %38 ]
  br label %42

; <label>:42:                                     ; preds = %._crit_edge1, %40
  %43 = phi i64 [ 0, %40 ], [ %57, %._crit_edge1 ]
  %44 = mul nuw nsw i64 %43, %41
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, 160
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, 1.600000e+02
  %49 = getelementptr inbounds [160 x double], [160 x double]* %39, i64 %41, i64 %43
  store double %48, double* %49, align 8, !tbaa !3
  %50 = or i64 %43, 1
  %51 = mul nuw nsw i64 %50, %41
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, 160
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, 1.600000e+02
  %56 = getelementptr inbounds [160 x double], [160 x double]* %39, i64 %41, i64 %50
  store double %55, double* %56, align 8, !tbaa !3
  %57 = add nsw i64 %43, 2
  %58 = icmp eq i64 %57, 160
  br i1 %58, label %60, label %._crit_edge1

._crit_edge1:                                     ; preds = %42
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 1)
  %59 = add i64 %pgocount8, 1
  store i64 %59, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 1)
  br label %42

; <label>:60:                                     ; preds = %42
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 12)
  %61 = add i64 %pgocount9, 1
  store i64 %61, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 12)
  %62 = add nuw nsw i64 %41, 1
  %63 = icmp eq i64 %62, 160
  br i1 %63, label %64, label %40

; <label>:64:                                     ; preds = %60
  tail call void (...) @polybench_timer_start() #4
  %65 = bitcast i8* %4 to double*
  %66 = getelementptr i8, i8* %4, i64 1280
  br label %67

; <label>:67:                                     ; preds = %199, %64
  %68 = phi i64 [ 0, %64 ], [ %201, %199 ]
  %69 = mul i64 %68, 179200
  %70 = add i64 %69, 1280
  br label %71

; <label>:71:                                     ; preds = %81, %67
  %72 = phi i64 [ %82, %81 ], [ 0, %67 ]
  %73 = mul i64 %72, 1280
  %74 = add i64 %69, %73
  %75 = getelementptr i8, i8* %3, i64 %74
  %76 = add i64 %70, %73
  %77 = getelementptr i8, i8* %3, i64 %76
  br label %118

; <label>:78:                                     ; preds = %84
  br label %81

; <label>:79:                                     ; preds = %132
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 9)
  %80 = add i64 %pgocount10, 1
  store i64 %80, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 9)
  br label %81

; <label>:81:                                     ; preds = %79, %78
  %82 = add nuw nsw i64 %72, 1
  %83 = icmp eq i64 %82, 140
  br i1 %83, label %199, label %71

; <label>:84:                                     ; preds = %._crit_edge4, %130
  %85 = phi i64 [ 0, %130 ], [ %115, %._crit_edge4 ]
  %86 = getelementptr inbounds double, double* %65, i64 %85
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8, !tbaa !3
  %89 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %85
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8, !tbaa !3
  %91 = add nuw nsw i64 %85, 1
  %92 = getelementptr inbounds double, double* %65, i64 %91
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8, !tbaa !3
  %95 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %91
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8, !tbaa !3
  %97 = add nsw i64 %85, 2
  %98 = getelementptr inbounds double, double* %65, i64 %97
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8, !tbaa !3
  %101 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %97
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8, !tbaa !3
  %103 = add nsw i64 %85, 3
  %104 = getelementptr inbounds double, double* %65, i64 %103
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8, !tbaa !3
  %107 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %103
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8, !tbaa !3
  %109 = add nsw i64 %85, 4
  %110 = getelementptr inbounds double, double* %65, i64 %109
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8, !tbaa !3
  %113 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %109
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8, !tbaa !3
  %115 = add nsw i64 %85, 5
  %116 = icmp eq i64 %115, 160
  br i1 %116, label %78, label %._crit_edge4, !llvm.loop !17

._crit_edge4:                                     ; preds = %84
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 4)
  %117 = add i64 %pgocount11, 1
  store i64 %117, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 4)
  br label %84

; <label>:118:                                    ; preds = %121, %71
  %119 = phi i64 [ 0, %71 ], [ %123, %121 ]
  %120 = getelementptr inbounds double, double* %65, i64 %119
  store double 0.000000e+00, double* %120, align 8, !tbaa !3
  br label %180

; <label>:121:                                    ; preds = %180
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 6)
  %122 = add i64 %pgocount12, 1
  store i64 %122, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 6)
  %123 = add nuw nsw i64 %119, 1
  %124 = icmp eq i64 %123, 160
  br i1 %124, label %125, label %118

; <label>:125:                                    ; preds = %121
  %126 = icmp ult i8* %75, %66
  %127 = icmp ult i8* %4, %77
  %128 = and i1 %126, %127
  br i1 %128, label %130, label %129

; <label>:129:                                    ; preds = %125
  br label %132

; <label>:130:                                    ; preds = %125
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 8)
  %131 = add i64 %pgocount13, 1
  store i64 %131, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 8)
  br label %84

; <label>:132:                                    ; preds = %._crit_edge5, %129
  %133 = phi i64 [ 0, %129 ], [ %177, %._crit_edge5 ]
  %134 = getelementptr inbounds double, double* %65, i64 %133
  %135 = bitcast double* %134 to <2 x i64>*
  %136 = load <2 x i64>, <2 x i64>* %135, align 8, !tbaa !3, !alias.scope !18
  %137 = getelementptr double, double* %134, i64 2
  %138 = bitcast double* %137 to <2 x i64>*
  %139 = load <2 x i64>, <2 x i64>* %138, align 8, !tbaa !3, !alias.scope !18
  %140 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %133
  %141 = bitcast double* %140 to <2 x i64>*
  store <2 x i64> %136, <2 x i64>* %141, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %142 = getelementptr double, double* %140, i64 2
  %143 = bitcast double* %142 to <2 x i64>*
  store <2 x i64> %139, <2 x i64>* %143, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %144 = or i64 %133, 4
  %145 = getelementptr inbounds double, double* %65, i64 %144
  %146 = bitcast double* %145 to <2 x i64>*
  %147 = load <2 x i64>, <2 x i64>* %146, align 8, !tbaa !3, !alias.scope !18
  %148 = getelementptr double, double* %145, i64 2
  %149 = bitcast double* %148 to <2 x i64>*
  %150 = load <2 x i64>, <2 x i64>* %149, align 8, !tbaa !3, !alias.scope !18
  %151 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %144
  %152 = bitcast double* %151 to <2 x i64>*
  store <2 x i64> %147, <2 x i64>* %152, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %153 = getelementptr double, double* %151, i64 2
  %154 = bitcast double* %153 to <2 x i64>*
  store <2 x i64> %150, <2 x i64>* %154, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %155 = or i64 %133, 8
  %156 = getelementptr inbounds double, double* %65, i64 %155
  %157 = bitcast double* %156 to <2 x i64>*
  %158 = load <2 x i64>, <2 x i64>* %157, align 8, !tbaa !3, !alias.scope !18
  %159 = getelementptr double, double* %156, i64 2
  %160 = bitcast double* %159 to <2 x i64>*
  %161 = load <2 x i64>, <2 x i64>* %160, align 8, !tbaa !3, !alias.scope !18
  %162 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %155
  %163 = bitcast double* %162 to <2 x i64>*
  store <2 x i64> %158, <2 x i64>* %163, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %164 = getelementptr double, double* %162, i64 2
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %161, <2 x i64>* %165, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %166 = or i64 %133, 12
  %167 = getelementptr inbounds double, double* %65, i64 %166
  %168 = bitcast double* %167 to <2 x i64>*
  %169 = load <2 x i64>, <2 x i64>* %168, align 8, !tbaa !3, !alias.scope !18
  %170 = getelementptr double, double* %167, i64 2
  %171 = bitcast double* %170 to <2 x i64>*
  %172 = load <2 x i64>, <2 x i64>* %171, align 8, !tbaa !3, !alias.scope !18
  %173 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %166
  %174 = bitcast double* %173 to <2 x i64>*
  store <2 x i64> %169, <2 x i64>* %174, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x i64>*
  store <2 x i64> %172, <2 x i64>* %176, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %177 = add nsw i64 %133, 16
  %178 = icmp eq i64 %177, 160
  br i1 %178, label %79, label %._crit_edge5, !llvm.loop !23

._crit_edge5:                                     ; preds = %132
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 5)
  %179 = add i64 %pgocount14, 1
  store i64 %179, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 5)
  br label %132

; <label>:180:                                    ; preds = %._crit_edge, %118
  %181 = phi double [ 0.000000e+00, %118 ], [ %195, %._crit_edge ]
  %182 = phi i64 [ 0, %118 ], [ %196, %._crit_edge ]
  %183 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %182
  %184 = load double, double* %183, align 8, !tbaa !3
  %185 = getelementptr inbounds [160 x double], [160 x double]* %39, i64 %182, i64 %119
  %186 = load double, double* %185, align 8, !tbaa !3
  %187 = fmul double %184, %186
  %188 = fadd double %181, %187
  store double %188, double* %120, align 8, !tbaa !3
  %189 = or i64 %182, 1
  %190 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %68, i64 %72, i64 %189
  %191 = load double, double* %190, align 8, !tbaa !3
  %192 = getelementptr inbounds [160 x double], [160 x double]* %39, i64 %189, i64 %119
  %193 = load double, double* %192, align 8, !tbaa !3
  %194 = fmul double %191, %193
  %195 = fadd double %188, %194
  store double %195, double* %120, align 8, !tbaa !3
  %196 = add nsw i64 %182, 2
  %197 = icmp eq i64 %196, 160
  br i1 %197, label %121, label %._crit_edge

._crit_edge:                                      ; preds = %180
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 0)
  %198 = add i64 %pgocount15, 1
  store i64 %198, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 0)
  br label %180

; <label>:199:                                    ; preds = %81
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 13)
  %200 = add i64 %pgocount16, 1
  store i64 %200, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 13)
  %201 = add nuw nsw i64 %68, 1
  %202 = icmp eq i64 %201, 150
  br i1 %202, label %203, label %67

; <label>:203:                                    ; preds = %199
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %204 = icmp sgt i32 %0, 42
  br i1 %204, label %205, label %254

; <label>:205:                                    ; preds = %203
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 16)
  %206 = add i64 %pgocount17, 1
  store i64 %206, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 16)
  %207 = load i8*, i8** %1, align 8, !tbaa !24
  %208 = load i8, i8* %207, align 1, !tbaa !26
  %209 = icmp eq i8 %208, 0
  br i1 %209, label %210, label %254

; <label>:210:                                    ; preds = %205
  %211 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %212 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %211) #5
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %214 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %213, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %215

; <label>:215:                                    ; preds = %244, %210
  %216 = phi i64 [ 0, %210 ], [ %246, %244 ]
  %217 = mul nuw nsw i64 %216, 22400
  br label %218

; <label>:218:                                    ; preds = %240, %215
  %219 = phi i64 [ 0, %215 ], [ %242, %240 ]
  %220 = mul nuw nsw i64 %219, 160
  %221 = add nuw nsw i64 %220, %217
  br label %222

; <label>:222:                                    ; preds = %233, %218
  %223 = phi i64 [ 0, %218 ], [ %238, %233 ]
  %224 = add nuw nsw i64 %221, %223
  %225 = trunc i64 %224 to i32
  %226 = srem i32 %225, 20
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %229, label %._crit_edge2

._crit_edge2:                                     ; preds = %222
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 2)
  %228 = add i64 %pgocount18, 1
  store i64 %228, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 2)
  br label %233

; <label>:229:                                    ; preds = %222
  %pgocount19 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 10)
  %230 = add i64 %pgocount19, 1
  store i64 %230, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 10)
  %231 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %232 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %231) #5
  br label %233

; <label>:233:                                    ; preds = %._crit_edge2, %229
  %234 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %235 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %216, i64 %219, i64 %223
  %236 = load double, double* %235, align 8, !tbaa !3
  %237 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %234, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %236) #5
  %238 = add nuw nsw i64 %223, 1
  %239 = icmp eq i64 %238, 160
  br i1 %239, label %240, label %222

; <label>:240:                                    ; preds = %233
  %pgocount20 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 14)
  %241 = add i64 %pgocount20, 1
  store i64 %241, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 14)
  %242 = add nuw nsw i64 %219, 1
  %243 = icmp eq i64 %242, 140
  br i1 %243, label %244, label %218

; <label>:244:                                    ; preds = %240
  %pgocount21 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 17)
  %245 = add i64 %pgocount21, 1
  store i64 %245, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 17)
  %246 = add nuw nsw i64 %216, 1
  %247 = icmp eq i64 %246, 150
  br i1 %247, label %248, label %215

; <label>:248:                                    ; preds = %244
  %pgocount22 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 18)
  %249 = add i64 %pgocount22, 1
  store i64 %249, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 18)
  %250 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %251 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %250, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %252 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %253 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %252) #5
  br label %254

; <label>:254:                                    ; preds = %248, %205, %203
  %pgocount23 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 15)
  %255 = add i64 %pgocount23, 1
  store i64 %255, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 15)
  tail call void @free(i8* nonnull %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !2}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !8, !9}
!17 = distinct !{!17, !8, !9}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !8, !9}
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !5, i64 0}
!26 = !{!5, !5, i64 0}
