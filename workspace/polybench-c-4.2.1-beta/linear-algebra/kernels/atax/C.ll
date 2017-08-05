; ModuleID = 'B.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 194423298198, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #3
  %7 = bitcast i8* %4 to double*
  br label %8

; <label>:8:                                      ; preds = %._crit_edge4, %2
  %9 = phi i64 [ 0, %2 ], [ %27, %._crit_edge4 ]
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.100000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds double, double* %7, i64 %9
  store double %13, double* %14, align 8, !tbaa !1
  %15 = add nuw nsw i64 %9, 1
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.100000e+03
  %19 = fadd double %18, 1.000000e+00
  %20 = getelementptr inbounds double, double* %7, i64 %15
  store double %19, double* %20, align 8, !tbaa !1
  %21 = add nsw i64 %9, 2
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 2.100000e+03
  %25 = fadd double %24, 1.000000e+00
  %26 = getelementptr inbounds double, double* %7, i64 %21
  store double %25, double* %26, align 8, !tbaa !1
  %27 = add nsw i64 %9, 3
  %28 = icmp eq i64 %27, 2100
  br i1 %28, label %30, label %._crit_edge4

._crit_edge4:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 4)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 4)
  br label %8

; <label>:30:                                     ; preds = %8
  %31 = bitcast i8* %3 to [2100 x double]*
  br label %32

; <label>:32:                                     ; preds = %52, %30
  %33 = phi i64 [ %54, %52 ], [ 0, %30 ]
  br label %34

; <label>:34:                                     ; preds = %._crit_edge, %32
  %35 = phi i64 [ 0, %32 ], [ %49, %._crit_edge ]
  %36 = add nuw nsw i64 %35, %33
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2100
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 9.500000e+03
  %41 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %33, i64 %35
  store double %40, double* %41, align 8, !tbaa !1
  %42 = or i64 %35, 1
  %43 = add nuw nsw i64 %42, %33
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 2100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 9.500000e+03
  %48 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %33, i64 %42
  store double %47, double* %48, align 8, !tbaa !1
  %49 = add nsw i64 %35, 2
  %50 = icmp eq i64 %49, 2100
  br i1 %50, label %52, label %._crit_edge

._crit_edge:                                      ; preds = %34
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 0)
  %51 = add i64 %pgocount6, 1
  store i64 %51, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 0)
  br label %34

; <label>:52:                                     ; preds = %34
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 6)
  %53 = add i64 %pgocount7, 1
  store i64 %53, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 6)
  %54 = add nuw nsw i64 %33, 1
  %55 = icmp eq i64 %54, 1900
  br i1 %55, label %56, label %32

; <label>:56:                                     ; preds = %52
  tail call void (...) @polybench_timer_start() #3
  %57 = bitcast i8* %5 to double*
  %58 = bitcast i8* %6 to double*
  tail call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 16800, i32 8, i1 false) #3
  %59 = getelementptr i8, i8* %5, i64 8
  %60 = getelementptr i8, i8* %5, i64 16800
  br label %61

; <label>:61:                                     ; preds = %182, %56
  %62 = phi i64 [ 0, %56 ], [ %183, %182 ]
  %63 = mul i64 %62, 16800
  %64 = or i64 %63, 8
  %65 = getelementptr i8, i8* %3, i64 %64
  %66 = add i64 %63, 16800
  %67 = getelementptr i8, i8* %3, i64 %66
  %68 = getelementptr inbounds double, double* %58, i64 %62
  store double 0.000000e+00, double* %68, align 8, !tbaa !1
  br label %69

; <label>:69:                                     ; preds = %._crit_edge1, %61
  %70 = phi double [ 0.000000e+00, %61 ], [ %91, %._crit_edge1 ]
  %71 = phi i64 [ 0, %61 ], [ %92, %._crit_edge1 ]
  %72 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 %71
  %73 = load double, double* %72, align 8, !tbaa !1
  %74 = getelementptr inbounds double, double* %7, i64 %71
  %75 = load double, double* %74, align 8, !tbaa !1
  %76 = fmul double %73, %75
  %77 = fadd double %70, %76
  store double %77, double* %68, align 8, !tbaa !1
  %78 = add nuw nsw i64 %71, 1
  %79 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 %78
  %80 = load double, double* %79, align 8, !tbaa !1
  %81 = getelementptr inbounds double, double* %7, i64 %78
  %82 = load double, double* %81, align 8, !tbaa !1
  %83 = fmul double %80, %82
  %84 = fadd double %77, %83
  store double %84, double* %68, align 8, !tbaa !1
  %85 = add nsw i64 %71, 2
  %86 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 %85
  %87 = load double, double* %86, align 8, !tbaa !1
  %88 = getelementptr inbounds double, double* %7, i64 %85
  %89 = load double, double* %88, align 8, !tbaa !1
  %90 = fmul double %87, %89
  %91 = fadd double %84, %90
  store double %91, double* %68, align 8, !tbaa !1
  %92 = add nsw i64 %71, 3
  %93 = icmp eq i64 %92, 2100
  br i1 %93, label %95, label %._crit_edge1

._crit_edge1:                                     ; preds = %69
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 1)
  %94 = add i64 %pgocount8, 1
  store i64 %94, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 1)
  br label %69

; <label>:95:                                     ; preds = %69
  %96 = load double, double* %57, align 8, !tbaa !1
  %97 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 0
  %98 = load double, double* %97, align 8, !tbaa !1
  %99 = fmul double %91, %98
  %100 = fadd double %96, %99
  store double %100, double* %57, align 8, !tbaa !1
  %101 = bitcast double* %68 to i8*
  %102 = bitcast double* %68 to i8*
  %103 = icmp ult i8* %59, %102
  %104 = icmp ult i8* %101, %60
  %105 = and i1 %103, %104
  %106 = icmp ult i8* %59, %67
  %107 = icmp ult i8* %65, %60
  %108 = and i1 %106, %107
  %109 = or i1 %105, %108
  br i1 %109, label %142, label %110

; <label>:110:                                    ; preds = %95
  %111 = load double, double* %68, align 8, !tbaa !1, !alias.scope !5
  %112 = insertelement <2 x double> undef, double %111, i32 0
  %113 = insertelement <2 x double> %112, double %111, i32 1
  %114 = insertelement <2 x double> undef, double %111, i32 0
  %115 = insertelement <2 x double> %114, double %111, i32 1
  br label %116

; <label>:116:                                    ; preds = %._crit_edge2, %110
  %117 = phi i64 [ %137, %._crit_edge2 ], [ 0, %110 ]
  %118 = or i64 %117, 1
  %119 = getelementptr inbounds double, double* %57, i64 %118
  %120 = bitcast double* %119 to <2 x double>*
  %121 = load <2 x double>, <2 x double>* %120, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %122 = getelementptr double, double* %119, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %124 = load <2 x double>, <2 x double>* %123, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %125 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 %118
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %126, align 8, !tbaa !1, !alias.scope !12
  %128 = getelementptr double, double* %125, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %130 = load <2 x double>, <2 x double>* %129, align 8, !tbaa !1, !alias.scope !12
  %131 = fmul <2 x double> %113, %127
  %132 = fmul <2 x double> %115, %130
  %133 = fadd <2 x double> %121, %131
  %134 = fadd <2 x double> %124, %132
  %135 = bitcast double* %119 to <2 x double>*
  store <2 x double> %133, <2 x double>* %135, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %136 = bitcast double* %122 to <2 x double>*
  store <2 x double> %134, <2 x double>* %136, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %137 = add i64 %117, 4
  %138 = icmp eq i64 %137, 2096
  br i1 %138, label %140, label %._crit_edge2, !llvm.loop !13

._crit_edge2:                                     ; preds = %116
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 2)
  %139 = add i64 %pgocount9, 1
  store i64 %139, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 2)
  br label %116

; <label>:140:                                    ; preds = %116
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 8)
  %141 = add i64 %pgocount10, 1
  store i64 %141, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 8)
  br label %142

; <label>:142:                                    ; preds = %140, %95
  %143 = phi i64 [ 1, %95 ], [ 2097, %140 ]
  br i1 true, label %144, label %155

; <label>:144:                                    ; preds = %142
  br label %145

; <label>:145:                                    ; preds = %144
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 9)
  %146 = add i64 %pgocount11, 1
  store i64 %146, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 9)
  %147 = load double, double* %68, align 8, !tbaa !1
  %148 = getelementptr inbounds double, double* %57, i64 %143
  %149 = load double, double* %148, align 8, !tbaa !1
  %150 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 %143
  %151 = load double, double* %150, align 8, !tbaa !1
  %152 = fmul double %147, %151
  %153 = fadd double %149, %152
  store double %153, double* %148, align 8, !tbaa !1
  %154 = add nuw nsw i64 %143, 1
  br label %155

; <label>:155:                                    ; preds = %145, %142
  %156 = phi i64 [ %154, %145 ], [ %143, %142 ]
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 7)
  %157 = add i64 %pgocount12, 1
  store i64 %157, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 7)
  br label %158

; <label>:158:                                    ; preds = %155
  br i1 false, label %182, label %159

; <label>:159:                                    ; preds = %158
  br label %160

; <label>:160:                                    ; preds = %._crit_edge3, %159
  %161 = phi i64 [ %156, %159 ], [ %177, %._crit_edge3 ]
  %162 = load double, double* %68, align 8, !tbaa !1
  %163 = getelementptr inbounds double, double* %57, i64 %161
  %164 = load double, double* %163, align 8, !tbaa !1
  %165 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 %161
  %166 = load double, double* %165, align 8, !tbaa !1
  %167 = fmul double %162, %166
  %168 = fadd double %164, %167
  store double %168, double* %163, align 8, !tbaa !1
  %169 = add nuw nsw i64 %161, 1
  %170 = load double, double* %68, align 8, !tbaa !1
  %171 = getelementptr inbounds double, double* %57, i64 %169
  %172 = load double, double* %171, align 8, !tbaa !1
  %173 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %62, i64 %169
  %174 = load double, double* %173, align 8, !tbaa !1
  %175 = fmul double %170, %174
  %176 = fadd double %172, %175
  store double %176, double* %171, align 8, !tbaa !1
  %177 = add nsw i64 %161, 2
  %178 = icmp eq i64 %177, 2100
  br i1 %178, label %180, label %._crit_edge3, !llvm.loop !16

._crit_edge3:                                     ; preds = %160
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 3)
  %179 = add i64 %pgocount13, 1
  store i64 %179, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 3)
  br label %160

; <label>:180:                                    ; preds = %160
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 10)
  %181 = add i64 %pgocount14, 1
  store i64 %181, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 10)
  br label %182

; <label>:182:                                    ; preds = %180, %158
  %183 = add nuw nsw i64 %62, 1
  %184 = icmp eq i64 %183, 1900
  br i1 %184, label %185, label %61

; <label>:185:                                    ; preds = %182
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %186 = icmp sgt i32 %0, 42
  br i1 %186, label %187, label %220

; <label>:187:                                    ; preds = %185
  %pgocount15 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 12)
  %188 = add i64 %pgocount15, 1
  store i64 %188, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 12)
  %189 = load i8*, i8** %1, align 8, !tbaa !17
  %190 = load i8, i8* %189, align 1, !tbaa !19
  %191 = icmp eq i8 %190, 0
  br i1 %191, label %192, label %220

; <label>:192:                                    ; preds = %187
  %193 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %194 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %193) #5
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %196 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %195, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %197

; <label>:197:                                    ; preds = %207, %192
  %198 = phi i64 [ 0, %192 ], [ %212, %207 ]
  %199 = trunc i64 %198 to i32
  %200 = srem i32 %199, 20
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %203, label %._crit_edge5

._crit_edge5:                                     ; preds = %197
  %pgocount16 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 5)
  %202 = add i64 %pgocount16, 1
  store i64 %202, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 5)
  br label %207

; <label>:203:                                    ; preds = %197
  %pgocount17 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 13)
  %204 = add i64 %pgocount17, 1
  store i64 %204, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 13)
  %205 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %206 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %205) #5
  br label %207

; <label>:207:                                    ; preds = %._crit_edge5, %203
  %208 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %209 = getelementptr inbounds double, double* %57, i64 %198
  %210 = load double, double* %209, align 8, !tbaa !1
  %211 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %208, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %210) #5
  %212 = add nuw nsw i64 %198, 1
  %213 = icmp eq i64 %212, 2100
  br i1 %213, label %214, label %197

; <label>:214:                                    ; preds = %207
  %pgocount18 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 14)
  %215 = add i64 %pgocount18, 1
  store i64 %215, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 14)
  %216 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %217 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %216, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %218 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %219 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %218) #5
  br label %220

; <label>:220:                                    ; preds = %214, %187, %185
  %pgocount19 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 11)
  %221 = add i64 %pgocount19, 1
  store i64 %221, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_main, i64 0, i64 11)
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
