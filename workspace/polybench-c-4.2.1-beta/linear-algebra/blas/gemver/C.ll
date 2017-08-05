; ModuleID = 'B.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 234617307935, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %12 = bitcast i8* %3 to [2000 x double]*
  %13 = bitcast i8* %4 to double*
  %14 = bitcast i8* %5 to double*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  br label %24

; <label>:21:                                     ; preds = %45
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 8)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 8)
  %23 = icmp eq i64 %29, 2000
  br i1 %23, label %63, label %24

; <label>:24:                                     ; preds = %21, %2
  %25 = phi i64 [ 0, %2 ], [ %29, %21 ]
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds double, double* %13, i64 %25
  store double %27, double* %28, align 8, !tbaa !1
  %29 = add nuw nsw i64 %25, 1
  %30 = trunc i64 %29 to i32
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fmul double %32, 5.000000e-01
  %34 = getelementptr inbounds double, double* %15, i64 %25
  store double %33, double* %34, align 8, !tbaa !1
  %35 = fmul double %32, 2.500000e-01
  %36 = getelementptr inbounds double, double* %14, i64 %25
  store double %35, double* %36, align 8, !tbaa !1
  %37 = fdiv double %32, 6.000000e+00
  %38 = getelementptr inbounds double, double* %16, i64 %25
  store double %37, double* %38, align 8, !tbaa !1
  %39 = fmul double %32, 1.250000e-01
  %40 = getelementptr inbounds double, double* %19, i64 %25
  store double %39, double* %40, align 8, !tbaa !1
  %41 = fdiv double %32, 9.000000e+00
  %42 = getelementptr inbounds double, double* %20, i64 %25
  store double %41, double* %42, align 8, !tbaa !1
  %43 = getelementptr inbounds double, double* %18, i64 %25
  store double 0.000000e+00, double* %43, align 8, !tbaa !1
  %44 = getelementptr inbounds double, double* %17, i64 %25
  store double 0.000000e+00, double* %44, align 8, !tbaa !1
  br label %45

; <label>:45:                                     ; preds = %._crit_edge, %24
  %46 = phi i64 [ 0, %24 ], [ %60, %._crit_edge ]
  %47 = mul nuw nsw i64 %46, %25
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 2000
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, 2.000000e+03
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %25, i64 %46
  store double %51, double* %52, align 8, !tbaa !1
  %53 = or i64 %46, 1
  %54 = mul nuw nsw i64 %53, %25
  %55 = trunc i64 %54 to i32
  %56 = srem i32 %55, 2000
  %57 = sitofp i32 %56 to double
  %58 = fdiv double %57, 2.000000e+03
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %25, i64 %53
  store double %58, double* %59, align 8, !tbaa !1
  %60 = add nsw i64 %46, 2
  %61 = icmp eq i64 %60, 2000
  br i1 %61, label %21, label %._crit_edge

._crit_edge:                                      ; preds = %45
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 0)
  %62 = add i64 %pgocount8, 1
  store i64 %62, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 0)
  br label %45

; <label>:63:                                     ; preds = %21
  tail call void (...) @polybench_timer_start() #3
  %64 = getelementptr i8, i8* %5, i64 16000
  %65 = getelementptr i8, i8* %7, i64 16000
  br label %66

; <label>:66:                                     ; preds = %172, %63
  %67 = phi i64 [ 0, %63 ], [ %173, %172 ]
  %68 = mul i64 %67, 16000
  %69 = getelementptr i8, i8* %3, i64 %68
  %70 = add i64 %68, 16000
  %71 = getelementptr i8, i8* %3, i64 %70
  %72 = getelementptr inbounds double, double* %13, i64 %67
  %73 = getelementptr inbounds double, double* %15, i64 %67
  %74 = bitcast double* %72 to i8*
  %75 = bitcast double* %72 to i8*
  %76 = icmp ult i8* %69, %75
  %77 = icmp ult i8* %74, %71
  %78 = and i1 %76, %77
  %79 = icmp ult i8* %69, %64
  %80 = icmp ult i8* %5, %71
  %81 = and i1 %79, %80
  %82 = or i1 %78, %81
  %83 = bitcast double* %73 to i8*
  %84 = bitcast double* %73 to i8*
  %85 = icmp ult i8* %69, %84
  %86 = icmp ult i8* %83, %71
  %87 = and i1 %85, %86
  %88 = or i1 %82, %87
  %89 = icmp ult i8* %69, %65
  %90 = icmp ult i8* %7, %71
  %91 = and i1 %89, %90
  %92 = or i1 %88, %91
  br i1 %92, label %104, label %93

; <label>:93:                                     ; preds = %66
  %94 = load double, double* %72, align 8, !tbaa !1, !alias.scope !5
  %95 = insertelement <2 x double> undef, double %94, i32 0
  %96 = insertelement <2 x double> %95, double %94, i32 1
  %97 = insertelement <2 x double> undef, double %94, i32 0
  %98 = insertelement <2 x double> %97, double %94, i32 1
  %99 = load double, double* %73, align 8, !tbaa !1, !alias.scope !8
  %100 = insertelement <2 x double> undef, double %99, i32 0
  %101 = insertelement <2 x double> %100, double %99, i32 1
  %102 = insertelement <2 x double> undef, double %99, i32 0
  %103 = insertelement <2 x double> %102, double %99, i32 1
  br label %105

; <label>:104:                                    ; preds = %66
  br label %138

; <label>:105:                                    ; preds = %._crit_edge3, %93
  %106 = phi i64 [ %135, %._crit_edge3 ], [ 0, %93 ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %67, i64 %106
  %108 = bitcast double* %107 to <2 x double>*
  %109 = load <2 x double>, <2 x double>* %108, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %110 = getelementptr double, double* %107, i64 2
  %111 = bitcast double* %110 to <2 x double>*
  %112 = load <2 x double>, <2 x double>* %111, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %113 = getelementptr inbounds double, double* %14, i64 %106
  %114 = bitcast double* %113 to <2 x double>*
  %115 = load <2 x double>, <2 x double>* %114, align 8, !tbaa !1, !alias.scope !15
  %116 = getelementptr double, double* %113, i64 2
  %117 = bitcast double* %116 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %117, align 8, !tbaa !1, !alias.scope !15
  %119 = fmul <2 x double> %96, %115
  %120 = fmul <2 x double> %98, %118
  %121 = fadd <2 x double> %109, %119
  %122 = fadd <2 x double> %112, %120
  %123 = getelementptr inbounds double, double* %16, i64 %106
  %124 = bitcast double* %123 to <2 x double>*
  %125 = load <2 x double>, <2 x double>* %124, align 8, !tbaa !1, !alias.scope !16
  %126 = getelementptr double, double* %123, i64 2
  %127 = bitcast double* %126 to <2 x double>*
  %128 = load <2 x double>, <2 x double>* %127, align 8, !tbaa !1, !alias.scope !16
  %129 = fmul <2 x double> %101, %125
  %130 = fmul <2 x double> %103, %128
  %131 = fadd <2 x double> %121, %129
  %132 = fadd <2 x double> %122, %130
  %133 = bitcast double* %107 to <2 x double>*
  store <2 x double> %131, <2 x double>* %133, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %134 = bitcast double* %110 to <2 x double>*
  store <2 x double> %132, <2 x double>* %134, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %135 = add i64 %106, 4
  %136 = icmp eq i64 %135, 2000
  br i1 %136, label %170, label %._crit_edge3, !llvm.loop !17

._crit_edge3:                                     ; preds = %105
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 3)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 3)
  br label %105

; <label>:138:                                    ; preds = %._crit_edge4, %104
  %139 = phi i64 [ 0, %104 ], [ %165, %._crit_edge4 ]
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %67, i64 %139
  %141 = load double, double* %140, align 8, !tbaa !1
  %142 = load double, double* %72, align 8, !tbaa !1
  %143 = getelementptr inbounds double, double* %14, i64 %139
  %144 = load double, double* %143, align 8, !tbaa !1
  %145 = fmul double %142, %144
  %146 = fadd double %141, %145
  %147 = load double, double* %73, align 8, !tbaa !1
  %148 = getelementptr inbounds double, double* %16, i64 %139
  %149 = load double, double* %148, align 8, !tbaa !1
  %150 = fmul double %147, %149
  %151 = fadd double %146, %150
  store double %151, double* %140, align 8, !tbaa !1
  %152 = or i64 %139, 1
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %67, i64 %152
  %154 = load double, double* %153, align 8, !tbaa !1
  %155 = load double, double* %72, align 8, !tbaa !1
  %156 = getelementptr inbounds double, double* %14, i64 %152
  %157 = load double, double* %156, align 8, !tbaa !1
  %158 = fmul double %155, %157
  %159 = fadd double %154, %158
  %160 = load double, double* %73, align 8, !tbaa !1
  %161 = getelementptr inbounds double, double* %16, i64 %152
  %162 = load double, double* %161, align 8, !tbaa !1
  %163 = fmul double %160, %162
  %164 = fadd double %159, %163
  store double %164, double* %153, align 8, !tbaa !1
  %165 = add nsw i64 %139, 2
  %166 = icmp eq i64 %165, 2000
  br i1 %166, label %168, label %._crit_edge4, !llvm.loop !20

._crit_edge4:                                     ; preds = %138
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 4)
  %167 = add i64 %pgocount10, 1
  store i64 %167, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 4)
  br label %138

; <label>:168:                                    ; preds = %138
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 11)
  %169 = add i64 %pgocount11, 1
  store i64 %169, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 11)
  br label %172

; <label>:170:                                    ; preds = %105
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 12)
  %171 = add i64 %pgocount12, 1
  store i64 %171, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 12)
  br label %172

; <label>:172:                                    ; preds = %170, %168
  %173 = add nuw nsw i64 %67, 1
  %174 = icmp eq i64 %173, 2000
  br i1 %174, label %175, label %66

; <label>:175:                                    ; preds = %172
  br label %176

; <label>:176:                                    ; preds = %201, %175
  %177 = phi i64 [ %203, %201 ], [ 0, %175 ]
  %178 = getelementptr inbounds double, double* %18, i64 %177
  %179 = load double, double* %178, align 8, !tbaa !1
  br label %180

; <label>:180:                                    ; preds = %._crit_edge1, %176
  %181 = phi double [ %179, %176 ], [ %197, %._crit_edge1 ]
  %182 = phi i64 [ 0, %176 ], [ %198, %._crit_edge1 ]
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %182, i64 %177
  %184 = load double, double* %183, align 8, !tbaa !1
  %185 = fmul double %184, 1.200000e+00
  %186 = getelementptr inbounds double, double* %19, i64 %182
  %187 = load double, double* %186, align 8, !tbaa !1
  %188 = fmul double %185, %187
  %189 = fadd double %181, %188
  store double %189, double* %178, align 8, !tbaa !1
  %190 = or i64 %182, 1
  %191 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %190, i64 %177
  %192 = load double, double* %191, align 8, !tbaa !1
  %193 = fmul double %192, 1.200000e+00
  %194 = getelementptr inbounds double, double* %19, i64 %190
  %195 = load double, double* %194, align 8, !tbaa !1
  %196 = fmul double %193, %195
  %197 = fadd double %189, %196
  store double %197, double* %178, align 8, !tbaa !1
  %198 = add nsw i64 %182, 2
  %199 = icmp eq i64 %198, 2000
  br i1 %199, label %201, label %._crit_edge1

._crit_edge1:                                     ; preds = %180
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 1)
  %200 = add i64 %pgocount13, 1
  store i64 %200, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 1)
  br label %180

; <label>:201:                                    ; preds = %180
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 9)
  %202 = add i64 %pgocount14, 1
  store i64 %202, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 9)
  %203 = add nuw nsw i64 %177, 1
  %204 = icmp eq i64 %203, 2000
  br i1 %204, label %205, label %176

; <label>:205:                                    ; preds = %201
  %206 = getelementptr i8, i8* %9, i64 16000
  %207 = getelementptr i8, i8* %11, i64 16000
  %208 = icmp ult i8* %9, %207
  %209 = icmp ult i8* %11, %206
  %210 = and i1 %208, %209
  br i1 %210, label %212, label %211

; <label>:211:                                    ; preds = %205
  br label %213

; <label>:212:                                    ; preds = %205
  br label %251

; <label>:213:                                    ; preds = %._crit_edge5, %211
  %214 = phi i64 [ 0, %211 ], [ %248, %._crit_edge5 ]
  %215 = getelementptr inbounds double, double* %18, i64 %214
  %216 = bitcast double* %215 to <2 x double>*
  %217 = load <2 x double>, <2 x double>* %216, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %218 = getelementptr double, double* %215, i64 2
  %219 = bitcast double* %218 to <2 x double>*
  %220 = load <2 x double>, <2 x double>* %219, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %221 = getelementptr inbounds double, double* %20, i64 %214
  %222 = bitcast double* %221 to <2 x double>*
  %223 = load <2 x double>, <2 x double>* %222, align 8, !tbaa !1, !alias.scope !24
  %224 = getelementptr double, double* %221, i64 2
  %225 = bitcast double* %224 to <2 x double>*
  %226 = load <2 x double>, <2 x double>* %225, align 8, !tbaa !1, !alias.scope !24
  %227 = fadd <2 x double> %217, %223
  %228 = fadd <2 x double> %220, %226
  %229 = bitcast double* %215 to <2 x double>*
  store <2 x double> %227, <2 x double>* %229, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %230 = bitcast double* %218 to <2 x double>*
  store <2 x double> %228, <2 x double>* %230, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %231 = or i64 %214, 4
  %232 = getelementptr inbounds double, double* %18, i64 %231
  %233 = bitcast double* %232 to <2 x double>*
  %234 = load <2 x double>, <2 x double>* %233, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %235 = getelementptr double, double* %232, i64 2
  %236 = bitcast double* %235 to <2 x double>*
  %237 = load <2 x double>, <2 x double>* %236, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %238 = getelementptr inbounds double, double* %20, i64 %231
  %239 = bitcast double* %238 to <2 x double>*
  %240 = load <2 x double>, <2 x double>* %239, align 8, !tbaa !1, !alias.scope !24
  %241 = getelementptr double, double* %238, i64 2
  %242 = bitcast double* %241 to <2 x double>*
  %243 = load <2 x double>, <2 x double>* %242, align 8, !tbaa !1, !alias.scope !24
  %244 = fadd <2 x double> %234, %240
  %245 = fadd <2 x double> %237, %243
  %246 = bitcast double* %232 to <2 x double>*
  store <2 x double> %244, <2 x double>* %246, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %247 = bitcast double* %235 to <2 x double>*
  store <2 x double> %245, <2 x double>* %247, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %248 = add nsw i64 %214, 8
  %249 = icmp eq i64 %248, 2000
  br i1 %249, label %287, label %._crit_edge5, !llvm.loop !26

._crit_edge5:                                     ; preds = %213
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 5)
  %250 = add i64 %pgocount15, 1
  store i64 %250, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 5)
  br label %213

; <label>:251:                                    ; preds = %._crit_edge6, %212
  %252 = phi i64 [ 0, %212 ], [ %282, %._crit_edge6 ]
  %253 = getelementptr inbounds double, double* %18, i64 %252
  %254 = load double, double* %253, align 8, !tbaa !1
  %255 = getelementptr inbounds double, double* %20, i64 %252
  %256 = load double, double* %255, align 8, !tbaa !1
  %257 = fadd double %254, %256
  store double %257, double* %253, align 8, !tbaa !1
  %258 = add nuw nsw i64 %252, 1
  %259 = getelementptr inbounds double, double* %18, i64 %258
  %260 = load double, double* %259, align 8, !tbaa !1
  %261 = getelementptr inbounds double, double* %20, i64 %258
  %262 = load double, double* %261, align 8, !tbaa !1
  %263 = fadd double %260, %262
  store double %263, double* %259, align 8, !tbaa !1
  %264 = add nsw i64 %252, 2
  %265 = getelementptr inbounds double, double* %18, i64 %264
  %266 = load double, double* %265, align 8, !tbaa !1
  %267 = getelementptr inbounds double, double* %20, i64 %264
  %268 = load double, double* %267, align 8, !tbaa !1
  %269 = fadd double %266, %268
  store double %269, double* %265, align 8, !tbaa !1
  %270 = add nsw i64 %252, 3
  %271 = getelementptr inbounds double, double* %18, i64 %270
  %272 = load double, double* %271, align 8, !tbaa !1
  %273 = getelementptr inbounds double, double* %20, i64 %270
  %274 = load double, double* %273, align 8, !tbaa !1
  %275 = fadd double %272, %274
  store double %275, double* %271, align 8, !tbaa !1
  %276 = add nsw i64 %252, 4
  %277 = getelementptr inbounds double, double* %18, i64 %276
  %278 = load double, double* %277, align 8, !tbaa !1
  %279 = getelementptr inbounds double, double* %20, i64 %276
  %280 = load double, double* %279, align 8, !tbaa !1
  %281 = fadd double %278, %280
  store double %281, double* %277, align 8, !tbaa !1
  %282 = add nsw i64 %252, 5
  %283 = icmp eq i64 %282, 2000
  br i1 %283, label %285, label %._crit_edge6, !llvm.loop !27

._crit_edge6:                                     ; preds = %251
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 6)
  %284 = add i64 %pgocount16, 1
  store i64 %284, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 6)
  br label %251

; <label>:285:                                    ; preds = %251
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 13)
  %286 = add i64 %pgocount17, 1
  store i64 %286, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 13)
  br label %289

; <label>:287:                                    ; preds = %213
  %pgocount18 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 14)
  %288 = add i64 %pgocount18, 1
  store i64 %288, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 14)
  br label %289

; <label>:289:                                    ; preds = %287, %285
  br label %290

; <label>:290:                                    ; preds = %315, %289
  %291 = phi i64 [ %317, %315 ], [ 0, %289 ]
  %292 = getelementptr inbounds double, double* %17, i64 %291
  %293 = load double, double* %292, align 8, !tbaa !1
  br label %294

; <label>:294:                                    ; preds = %._crit_edge2, %290
  %295 = phi double [ %293, %290 ], [ %311, %._crit_edge2 ]
  %296 = phi i64 [ 0, %290 ], [ %312, %._crit_edge2 ]
  %297 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %291, i64 %296
  %298 = load double, double* %297, align 8, !tbaa !1
  %299 = fmul double %298, 1.500000e+00
  %300 = getelementptr inbounds double, double* %18, i64 %296
  %301 = load double, double* %300, align 8, !tbaa !1
  %302 = fmul double %299, %301
  %303 = fadd double %295, %302
  store double %303, double* %292, align 8, !tbaa !1
  %304 = or i64 %296, 1
  %305 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %291, i64 %304
  %306 = load double, double* %305, align 8, !tbaa !1
  %307 = fmul double %306, 1.500000e+00
  %308 = getelementptr inbounds double, double* %18, i64 %304
  %309 = load double, double* %308, align 8, !tbaa !1
  %310 = fmul double %307, %309
  %311 = fadd double %303, %310
  store double %311, double* %292, align 8, !tbaa !1
  %312 = add nsw i64 %296, 2
  %313 = icmp eq i64 %312, 2000
  br i1 %313, label %315, label %._crit_edge2

._crit_edge2:                                     ; preds = %294
  %pgocount19 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 2)
  %314 = add i64 %pgocount19, 1
  store i64 %314, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 2)
  br label %294

; <label>:315:                                    ; preds = %294
  %pgocount20 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 10)
  %316 = add i64 %pgocount20, 1
  store i64 %316, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 10)
  %317 = add nuw nsw i64 %291, 1
  %318 = icmp eq i64 %317, 2000
  br i1 %318, label %319, label %290

; <label>:319:                                    ; preds = %315
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %320 = icmp sgt i32 %0, 42
  br i1 %320, label %321, label %354

; <label>:321:                                    ; preds = %319
  %pgocount21 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 15)
  %322 = add i64 %pgocount21, 1
  store i64 %322, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 15)
  %323 = load i8*, i8** %1, align 8, !tbaa !28
  %324 = load i8, i8* %323, align 1, !tbaa !30
  %325 = icmp eq i8 %324, 0
  br i1 %325, label %326, label %354

; <label>:326:                                    ; preds = %321
  %327 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %328 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %327) #4
  %329 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %330 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %329, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %331

; <label>:331:                                    ; preds = %341, %326
  %332 = phi i64 [ 0, %326 ], [ %346, %341 ]
  %333 = trunc i64 %332 to i32
  %334 = srem i32 %333, 20
  %335 = icmp eq i32 %334, 0
  br i1 %335, label %337, label %._crit_edge7

._crit_edge7:                                     ; preds = %331
  %pgocount22 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 7)
  %336 = add i64 %pgocount22, 1
  store i64 %336, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 7)
  br label %341

; <label>:337:                                    ; preds = %331
  %pgocount23 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 16)
  %338 = add i64 %pgocount23, 1
  store i64 %338, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 16)
  %339 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %340 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %339) #4
  br label %341

; <label>:341:                                    ; preds = %._crit_edge7, %337
  %342 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %343 = getelementptr inbounds double, double* %17, i64 %332
  %344 = load double, double* %343, align 8, !tbaa !1
  %345 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %342, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %344) #4
  %346 = add nuw nsw i64 %332, 1
  %347 = icmp eq i64 %346, 2000
  br i1 %347, label %348, label %331

; <label>:348:                                    ; preds = %341
  %pgocount24 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 17)
  %349 = add i64 %pgocount24, 1
  store i64 %349, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 17)
  %350 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %351 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %350, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %352 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %353 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %352) #4
  br label %354

; <label>:354:                                    ; preds = %348, %321, %319
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* %7) #3
  tail call void @free(i8* nonnull %8) #3
  tail call void @free(i8* %9) #3
  tail call void @free(i8* %10) #3
  tail call void @free(i8* %11) #3
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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!6, !13, !9, !14}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = !{!13}
!16 = !{!14}
!17 = distinct !{!17, !18, !19}
!18 = !{!"llvm.loop.vectorize.width", i32 1}
!19 = !{!"llvm.loop.interleave.count", i32 1}
!20 = distinct !{!20, !18, !19}
!21 = !{!22}
!22 = distinct !{!22, !23}
!23 = distinct !{!23, !"LVerDomain"}
!24 = !{!25}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !18, !19}
!27 = distinct !{!27, !18, !19}
!28 = !{!29, !29, i64 0}
!29 = !{!"any pointer", !3, i64 0}
!30 = !{!3, !3, i64 0}
