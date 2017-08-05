; ModuleID = 'B.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 72057837352545326, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %30, %2
  %9 = phi i64 [ 0, %2 ], [ %32, %30 ]
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  br label %12

; <label>:12:                                     ; preds = %._crit_edge, %8
  %13 = phi i64 [ 0, %8 ], [ %27, %._crit_edge ]
  %14 = mul nuw nsw i64 %13, %9
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %11, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %13
  store double %18, double* %19, align 8, !tbaa !1
  %20 = or i64 %13, 1
  %21 = mul nuw nsw i64 %20, %9
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.200000e+03
  %25 = fadd double %11, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %20
  store double %25, double* %26, align 8, !tbaa !1
  %27 = add nsw i64 %13, 2
  %28 = icmp eq i64 %27, 1200
  br i1 %28, label %30, label %._crit_edge

._crit_edge:                                      ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 0)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 0)
  br label %12

; <label>:30:                                     ; preds = %12
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 8)
  %31 = add i64 %pgocount7, 1
  store i64 %31, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 8)
  %32 = add nuw nsw i64 %9, 1
  %33 = icmp eq i64 %32, 1400
  br i1 %33, label %34, label %8

; <label>:34:                                     ; preds = %30
  tail call void (...) @polybench_timer_start() #3
  %35 = bitcast i8* %5 to double*
  br label %36

; <label>:36:                                     ; preds = %64, %34
  %37 = phi i64 [ 0, %34 ], [ %67, %64 ]
  %38 = getelementptr inbounds double, double* %35, i64 %37
  store double 0.000000e+00, double* %38, align 8, !tbaa !1
  br label %39

; <label>:39:                                     ; preds = %._crit_edge1, %36
  %40 = phi i64 [ 0, %36 ], [ %61, %._crit_edge1 ]
  %41 = phi double [ 0.000000e+00, %36 ], [ %60, %._crit_edge1 ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %40, i64 %37
  %43 = load double, double* %42, align 8, !tbaa !1
  %44 = fadd double %41, %43
  store double %44, double* %38, align 8, !tbaa !1
  %45 = add nuw nsw i64 %40, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %45, i64 %37
  %47 = load double, double* %46, align 8, !tbaa !1
  %48 = fadd double %44, %47
  store double %48, double* %38, align 8, !tbaa !1
  %49 = add nsw i64 %40, 2
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %49, i64 %37
  %51 = load double, double* %50, align 8, !tbaa !1
  %52 = fadd double %48, %51
  store double %52, double* %38, align 8, !tbaa !1
  %53 = add nsw i64 %40, 3
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %53, i64 %37
  %55 = load double, double* %54, align 8, !tbaa !1
  %56 = fadd double %52, %55
  store double %56, double* %38, align 8, !tbaa !1
  %57 = add nsw i64 %40, 4
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %57, i64 %37
  %59 = load double, double* %58, align 8, !tbaa !1
  %60 = fadd double %56, %59
  store double %60, double* %38, align 8, !tbaa !1
  %61 = add nsw i64 %40, 5
  %62 = icmp eq i64 %61, 1400
  br i1 %62, label %64, label %._crit_edge1

._crit_edge1:                                     ; preds = %39
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 1)
  %63 = add i64 %pgocount8, 1
  store i64 %63, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 1)
  br label %39

; <label>:64:                                     ; preds = %39
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 9)
  %65 = add i64 %pgocount9, 1
  store i64 %65, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 9)
  %66 = fdiv double %60, 1.400000e+03
  store double %66, double* %38, align 8, !tbaa !1
  %67 = add nuw nsw i64 %37, 1
  %68 = icmp eq i64 %67, 1200
  br i1 %68, label %69, label %36

; <label>:69:                                     ; preds = %64
  %70 = bitcast i8* %4 to [1200 x double]*
  %71 = bitcast i8* %6 to double*
  br label %72

; <label>:72:                                     ; preds = %95, %69
  %73 = phi i64 [ %103, %95 ], [ 0, %69 ]
  %74 = getelementptr inbounds double, double* %71, i64 %73
  store double 0.000000e+00, double* %74, align 8, !tbaa !1
  %75 = getelementptr inbounds double, double* %35, i64 %73
  br label %76

; <label>:76:                                     ; preds = %._crit_edge2, %72
  %77 = phi i64 [ 0, %72 ], [ %92, %._crit_edge2 ]
  %78 = phi double [ 0.000000e+00, %72 ], [ %91, %._crit_edge2 ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %77, i64 %73
  %80 = load double, double* %79, align 8, !tbaa !1
  %81 = load double, double* %75, align 8, !tbaa !1
  %82 = fsub double %80, %81
  %83 = fmul double %82, %82
  %84 = fadd double %78, %83
  store double %84, double* %74, align 8, !tbaa !1
  %85 = or i64 %77, 1
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %85, i64 %73
  %87 = load double, double* %86, align 8, !tbaa !1
  %88 = load double, double* %75, align 8, !tbaa !1
  %89 = fsub double %87, %88
  %90 = fmul double %89, %89
  %91 = fadd double %84, %90
  store double %91, double* %74, align 8, !tbaa !1
  %92 = add nsw i64 %77, 2
  %93 = icmp eq i64 %92, 1400
  br i1 %93, label %95, label %._crit_edge2

._crit_edge2:                                     ; preds = %76
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 2)
  %94 = add i64 %pgocount10, 1
  store i64 %94, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 2)
  br label %76

; <label>:95:                                     ; preds = %76
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 10)
  %96 = add i64 %pgocount11, 1
  store i64 %96, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 10)
  %97 = fdiv double %91, 1.400000e+03
  store double %97, double* %74, align 8, !tbaa !1
  %98 = tail call double @sqrt(double %97) #3
  %99 = fcmp ugt double %98, 1.000000e-01
  %100 = zext i1 %99 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 19)
  %101 = add i64 %pgocount12, %100
  store i64 %101, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 19)
  %102 = select i1 %99, double %98, double 1.000000e+00
  store double %102, double* %74, align 8, !tbaa !1
  %103 = add nuw nsw i64 %73, 1
  %104 = icmp eq i64 %103, 1200
  br i1 %104, label %105, label %72

; <label>:105:                                    ; preds = %95
  %106 = getelementptr i8, i8* %5, i64 9600
  %107 = getelementptr i8, i8* %6, i64 9600
  br label %108

; <label>:108:                                    ; preds = %185, %105
  %109 = phi i64 [ %186, %185 ], [ 0, %105 ]
  %110 = mul i64 %109, 9600
  %111 = getelementptr i8, i8* %3, i64 %110
  %112 = add i64 %110, 9600
  %113 = getelementptr i8, i8* %3, i64 %112
  %114 = icmp ult i8* %111, %106
  %115 = icmp ult i8* %5, %113
  %116 = and i1 %114, %115
  %117 = icmp ult i8* %111, %107
  %118 = icmp ult i8* %6, %113
  %119 = and i1 %117, %118
  %120 = or i1 %116, %119
  br i1 %120, label %122, label %121

; <label>:121:                                    ; preds = %108
  br label %123

; <label>:122:                                    ; preds = %108
  br label %157

; <label>:123:                                    ; preds = %._crit_edge3, %121
  %124 = phi i64 [ 0, %121 ], [ %154, %._crit_edge3 ]
  %125 = getelementptr inbounds double, double* %35, i64 %124
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %126, align 8, !tbaa !1, !alias.scope !5
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %109, i64 %124
  %129 = bitcast double* %128 to <2 x double>*
  %130 = load <2 x double>, <2 x double>* %129, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %131 = fsub <2 x double> %130, %127
  %132 = bitcast double* %128 to <2 x double>*
  store <2 x double> %131, <2 x double>* %132, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %133 = getelementptr inbounds double, double* %71, i64 %124
  %134 = bitcast double* %133 to <2 x double>*
  %135 = load <2 x double>, <2 x double>* %134, align 8, !tbaa !1, !alias.scope !12
  %136 = fmul <2 x double> %135, <double 0x4042B5524AE1278E, double 0x4042B5524AE1278E>
  %137 = fdiv <2 x double> %131, %136
  %138 = bitcast double* %128 to <2 x double>*
  store <2 x double> %137, <2 x double>* %138, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %139 = or i64 %124, 2
  %140 = getelementptr inbounds double, double* %35, i64 %139
  %141 = bitcast double* %140 to <2 x double>*
  %142 = load <2 x double>, <2 x double>* %141, align 8, !tbaa !1, !alias.scope !5
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %109, i64 %139
  %144 = bitcast double* %143 to <2 x double>*
  %145 = load <2 x double>, <2 x double>* %144, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %146 = fsub <2 x double> %145, %142
  %147 = bitcast double* %143 to <2 x double>*
  store <2 x double> %146, <2 x double>* %147, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %148 = getelementptr inbounds double, double* %71, i64 %139
  %149 = bitcast double* %148 to <2 x double>*
  %150 = load <2 x double>, <2 x double>* %149, align 8, !tbaa !1, !alias.scope !12
  %151 = fmul <2 x double> %150, <double 0x4042B5524AE1278E, double 0x4042B5524AE1278E>
  %152 = fdiv <2 x double> %146, %151
  %153 = bitcast double* %143 to <2 x double>*
  store <2 x double> %152, <2 x double>* %153, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %154 = add nsw i64 %124, 4
  %155 = icmp eq i64 %154, 1200
  br i1 %155, label %183, label %._crit_edge3, !llvm.loop !13

._crit_edge3:                                     ; preds = %123
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 3)
  %156 = add i64 %pgocount13, 1
  store i64 %156, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 3)
  br label %123

; <label>:157:                                    ; preds = %._crit_edge4, %122
  %158 = phi i64 [ 0, %122 ], [ %178, %._crit_edge4 ]
  %159 = getelementptr inbounds double, double* %35, i64 %158
  %160 = load double, double* %159, align 8, !tbaa !1
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %109, i64 %158
  %162 = load double, double* %161, align 8, !tbaa !1
  %163 = fsub double %162, %160
  store double %163, double* %161, align 8, !tbaa !1
  %164 = getelementptr inbounds double, double* %71, i64 %158
  %165 = load double, double* %164, align 8, !tbaa !1
  %166 = fmul double %165, 0x4042B5524AE1278E
  %167 = fdiv double %163, %166
  store double %167, double* %161, align 8, !tbaa !1
  %168 = or i64 %158, 1
  %169 = getelementptr inbounds double, double* %35, i64 %168
  %170 = load double, double* %169, align 8, !tbaa !1
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %109, i64 %168
  %172 = load double, double* %171, align 8, !tbaa !1
  %173 = fsub double %172, %170
  store double %173, double* %171, align 8, !tbaa !1
  %174 = getelementptr inbounds double, double* %71, i64 %168
  %175 = load double, double* %174, align 8, !tbaa !1
  %176 = fmul double %175, 0x4042B5524AE1278E
  %177 = fdiv double %173, %176
  store double %177, double* %171, align 8, !tbaa !1
  %178 = add nsw i64 %158, 2
  %179 = icmp eq i64 %178, 1200
  br i1 %179, label %181, label %._crit_edge4, !llvm.loop !16

._crit_edge4:                                     ; preds = %157
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 4)
  %180 = add i64 %pgocount14, 1
  store i64 %180, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 4)
  br label %157

; <label>:181:                                    ; preds = %157
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 12)
  %182 = add i64 %pgocount15, 1
  store i64 %182, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 12)
  br label %185

; <label>:183:                                    ; preds = %123
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 13)
  %184 = add i64 %pgocount16, 1
  store i64 %184, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 13)
  br label %185

; <label>:185:                                    ; preds = %183, %181
  %186 = add nuw nsw i64 %109, 1
  %187 = icmp eq i64 %186, 1400
  br i1 %187, label %188, label %108

; <label>:188:                                    ; preds = %185
  br label %194

; <label>:189:                                    ; preds = %220
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 11)
  %190 = add i64 %pgocount17, 1
  store i64 %190, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 11)
  %191 = add nuw nsw i64 %195, 1
  %192 = add nuw nsw i64 %196, 1
  %193 = icmp eq i64 %191, 1199
  br i1 %193, label %225, label %194

; <label>:194:                                    ; preds = %189, %188
  %195 = phi i64 [ %191, %189 ], [ 0, %188 ]
  %196 = phi i64 [ %192, %189 ], [ 1, %188 ]
  %197 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %195, i64 %195
  store double 1.000000e+00, double* %197, align 8, !tbaa !1
  br label %198

; <label>:198:                                    ; preds = %220, %194
  %199 = phi i64 [ %196, %194 ], [ %223, %220 ]
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %195, i64 %199
  store double 0.000000e+00, double* %200, align 8, !tbaa !1
  br label %201

; <label>:201:                                    ; preds = %._crit_edge5, %198
  %202 = phi i64 [ 0, %198 ], [ %217, %._crit_edge5 ]
  %203 = phi double [ 0.000000e+00, %198 ], [ %216, %._crit_edge5 ]
  %204 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %202, i64 %195
  %205 = load double, double* %204, align 8, !tbaa !1
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %202, i64 %199
  %207 = load double, double* %206, align 8, !tbaa !1
  %208 = fmul double %205, %207
  %209 = fadd double %203, %208
  store double %209, double* %200, align 8, !tbaa !1
  %210 = or i64 %202, 1
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %210, i64 %195
  %212 = load double, double* %211, align 8, !tbaa !1
  %213 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %210, i64 %199
  %214 = load double, double* %213, align 8, !tbaa !1
  %215 = fmul double %212, %214
  %216 = fadd double %209, %215
  store double %216, double* %200, align 8, !tbaa !1
  %217 = add nsw i64 %202, 2
  %218 = icmp eq i64 %217, 1400
  br i1 %218, label %220, label %._crit_edge5

._crit_edge5:                                     ; preds = %201
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 5)
  %219 = add i64 %pgocount18, 1
  store i64 %219, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 5)
  br label %201

; <label>:220:                                    ; preds = %201
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 7)
  %221 = add i64 %pgocount19, 1
  store i64 %221, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 7)
  %222 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %199, i64 %195
  store double %216, double* %222, align 8, !tbaa !1
  %223 = add nuw nsw i64 %199, 1
  %224 = icmp eq i64 %223, 1200
  br i1 %224, label %189, label %198

; <label>:225:                                    ; preds = %189
  %226 = getelementptr inbounds i8, i8* %4, i64 11519992
  %227 = bitcast i8* %226 to double*
  store double 1.000000e+00, double* %227, align 8, !tbaa !1
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %228 = icmp sgt i32 %0, 42
  br i1 %228, label %229, label %270

; <label>:229:                                    ; preds = %225
  %pgocount20 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 16)
  %230 = add i64 %pgocount20, 1
  store i64 %230, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 16)
  %231 = load i8*, i8** %1, align 8, !tbaa !17
  %232 = load i8, i8* %231, align 1, !tbaa !19
  %233 = icmp eq i8 %232, 0
  br i1 %233, label %234, label %270

; <label>:234:                                    ; preds = %229
  %235 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %236 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %235) #4
  %237 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %238 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %237, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %239

; <label>:239:                                    ; preds = %260, %234
  %240 = phi i64 [ 0, %234 ], [ %262, %260 ]
  %241 = mul nuw nsw i64 %240, 1200
  br label %242

; <label>:242:                                    ; preds = %253, %239
  %243 = phi i64 [ 0, %239 ], [ %258, %253 ]
  %244 = add nuw nsw i64 %243, %241
  %245 = trunc i64 %244 to i32
  %246 = srem i32 %245, 20
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %249, label %._crit_edge6

._crit_edge6:                                     ; preds = %242
  %pgocount21 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 6)
  %248 = add i64 %pgocount21, 1
  store i64 %248, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 6)
  br label %253

; <label>:249:                                    ; preds = %242
  %pgocount22 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 14)
  %250 = add i64 %pgocount22, 1
  store i64 %250, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 14)
  %251 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %252 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %251) #4
  br label %253

; <label>:253:                                    ; preds = %._crit_edge6, %249
  %254 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %255 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %240, i64 %243
  %256 = load double, double* %255, align 8, !tbaa !1
  %257 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %254, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %256) #4
  %258 = add nuw nsw i64 %243, 1
  %259 = icmp eq i64 %258, 1200
  br i1 %259, label %260, label %242

; <label>:260:                                    ; preds = %253
  %pgocount23 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 17)
  %261 = add i64 %pgocount23, 1
  store i64 %261, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 17)
  %262 = add nuw nsw i64 %240, 1
  %263 = icmp eq i64 %262, 1200
  br i1 %263, label %264, label %239

; <label>:264:                                    ; preds = %260
  %pgocount24 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 18)
  %265 = add i64 %pgocount24, 1
  store i64 %265, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 18)
  %266 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %267 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %266, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #4
  %268 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %269 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %268) #4
  br label %270

; <label>:270:                                    ; preds = %264, %229, %225
  %pgocount25 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 15)
  %271 = add i64 %pgocount25, 1
  store i64 %271, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 15)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* nonnull %4) #3
  tail call void @free(i8* %5) #3
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
declare double @sqrt(double) local_unnamed_addr #2

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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!6, !11}
!11 = distinct !{!11, !7}
!12 = !{!11}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !3, i64 0}
!19 = !{!3, !3, i64 0}
