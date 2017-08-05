; ModuleID = 'B.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 216280065962, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  br label %7

; <label>:7:                                      ; preds = %27, %2
  %8 = phi i64 [ 0, %2 ], [ %29, %27 ]
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  br label %11

; <label>:11:                                     ; preds = %._crit_edge, %7
  %12 = phi i64 [ 0, %7 ], [ %24, %._crit_edge ]
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %10, %14
  %16 = fdiv double %15, 1.200000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %12
  store double %16, double* %17, align 8, !tbaa !1
  %18 = or i64 %12, 1
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %10, %20
  %22 = fdiv double %21, 1.200000e+03
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %18
  store double %22, double* %23, align 8, !tbaa !1
  %24 = add nsw i64 %12, 2
  %25 = icmp eq i64 %24, 1200
  br i1 %25, label %27, label %._crit_edge

._crit_edge:                                      ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 0)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 0)
  br label %11

; <label>:27:                                     ; preds = %11
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 7)
  %28 = add i64 %pgocount6, 1
  store i64 %28, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 7)
  %29 = add nuw nsw i64 %8, 1
  %30 = icmp eq i64 %29, 1400
  br i1 %30, label %31, label %7

; <label>:31:                                     ; preds = %27
  tail call void (...) @polybench_timer_start() #3
  %32 = bitcast i8* %5 to double*
  br label %33

; <label>:33:                                     ; preds = %61, %31
  %34 = phi i64 [ 0, %31 ], [ %64, %61 ]
  %35 = getelementptr inbounds double, double* %32, i64 %34
  store double 0.000000e+00, double* %35, align 8, !tbaa !1
  br label %36

; <label>:36:                                     ; preds = %._crit_edge1, %33
  %37 = phi i64 [ 0, %33 ], [ %58, %._crit_edge1 ]
  %38 = phi double [ 0.000000e+00, %33 ], [ %57, %._crit_edge1 ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %37, i64 %34
  %40 = load double, double* %39, align 8, !tbaa !1
  %41 = fadd double %38, %40
  store double %41, double* %35, align 8, !tbaa !1
  %42 = add nuw nsw i64 %37, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %42, i64 %34
  %44 = load double, double* %43, align 8, !tbaa !1
  %45 = fadd double %41, %44
  store double %45, double* %35, align 8, !tbaa !1
  %46 = add nsw i64 %37, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %46, i64 %34
  %48 = load double, double* %47, align 8, !tbaa !1
  %49 = fadd double %45, %48
  store double %49, double* %35, align 8, !tbaa !1
  %50 = add nsw i64 %37, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %50, i64 %34
  %52 = load double, double* %51, align 8, !tbaa !1
  %53 = fadd double %49, %52
  store double %53, double* %35, align 8, !tbaa !1
  %54 = add nsw i64 %37, 4
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %54, i64 %34
  %56 = load double, double* %55, align 8, !tbaa !1
  %57 = fadd double %53, %56
  store double %57, double* %35, align 8, !tbaa !1
  %58 = add nsw i64 %37, 5
  %59 = icmp eq i64 %58, 1400
  br i1 %59, label %61, label %._crit_edge1

._crit_edge1:                                     ; preds = %36
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 1)
  %60 = add i64 %pgocount7, 1
  store i64 %60, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 1)
  br label %36

; <label>:61:                                     ; preds = %36
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 8)
  %62 = add i64 %pgocount8, 1
  store i64 %62, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 8)
  %63 = fdiv double %57, 1.400000e+03
  store double %63, double* %35, align 8, !tbaa !1
  %64 = add nuw nsw i64 %34, 1
  %65 = icmp eq i64 %64, 1200
  br i1 %65, label %66, label %33

; <label>:66:                                     ; preds = %61
  %67 = bitcast i8* %4 to [1200 x double]*
  %68 = getelementptr i8, i8* %5, i64 9600
  br label %69

; <label>:69:                                     ; preds = %150, %66
  %70 = phi i64 [ %151, %150 ], [ 0, %66 ]
  %71 = mul i64 %70, 9600
  %72 = getelementptr i8, i8* %3, i64 %71
  %73 = add i64 %71, 9600
  %74 = getelementptr i8, i8* %3, i64 %73
  %75 = icmp ult i8* %72, %68
  %76 = icmp ult i8* %5, %74
  %77 = and i1 %75, %76
  br i1 %77, label %79, label %78

; <label>:78:                                     ; preds = %69
  br label %80

; <label>:79:                                     ; preds = %69
  br label %118

; <label>:80:                                     ; preds = %._crit_edge2, %78
  %81 = phi i64 [ 0, %78 ], [ %115, %._crit_edge2 ]
  %82 = getelementptr inbounds double, double* %32, i64 %81
  %83 = bitcast double* %82 to <2 x double>*
  %84 = load <2 x double>, <2 x double>* %83, align 8, !tbaa !1, !alias.scope !5
  %85 = getelementptr double, double* %82, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %87 = load <2 x double>, <2 x double>* %86, align 8, !tbaa !1, !alias.scope !5
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %70, i64 %81
  %89 = bitcast double* %88 to <2 x double>*
  %90 = load <2 x double>, <2 x double>* %89, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %91 = getelementptr double, double* %88, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %92, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %94 = fsub <2 x double> %90, %84
  %95 = fsub <2 x double> %93, %87
  %96 = bitcast double* %88 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %97 = bitcast double* %91 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %98 = or i64 %81, 4
  %99 = getelementptr inbounds double, double* %32, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %101 = load <2 x double>, <2 x double>* %100, align 8, !tbaa !1, !alias.scope !5
  %102 = getelementptr double, double* %99, i64 2
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %103, align 8, !tbaa !1, !alias.scope !5
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %70, i64 %98
  %106 = bitcast double* %105 to <2 x double>*
  %107 = load <2 x double>, <2 x double>* %106, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %108 = getelementptr double, double* %105, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %110 = load <2 x double>, <2 x double>* %109, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %111 = fsub <2 x double> %107, %101
  %112 = fsub <2 x double> %110, %104
  %113 = bitcast double* %105 to <2 x double>*
  store <2 x double> %111, <2 x double>* %113, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %114 = bitcast double* %108 to <2 x double>*
  store <2 x double> %112, <2 x double>* %114, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %115 = add nsw i64 %81, 8
  %116 = icmp eq i64 %115, 1200
  br i1 %116, label %148, label %._crit_edge2, !llvm.loop !10

._crit_edge2:                                     ; preds = %80
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 2)
  %117 = add i64 %pgocount9, 1
  store i64 %117, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 2)
  br label %80

; <label>:118:                                    ; preds = %._crit_edge3, %79
  %119 = phi i64 [ 0, %79 ], [ %143, %._crit_edge3 ]
  %120 = getelementptr inbounds double, double* %32, i64 %119
  %121 = load double, double* %120, align 8, !tbaa !1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %70, i64 %119
  %123 = load double, double* %122, align 8, !tbaa !1
  %124 = fsub double %123, %121
  store double %124, double* %122, align 8, !tbaa !1
  %125 = or i64 %119, 1
  %126 = getelementptr inbounds double, double* %32, i64 %125
  %127 = load double, double* %126, align 8, !tbaa !1
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %70, i64 %125
  %129 = load double, double* %128, align 8, !tbaa !1
  %130 = fsub double %129, %127
  store double %130, double* %128, align 8, !tbaa !1
  %131 = or i64 %119, 2
  %132 = getelementptr inbounds double, double* %32, i64 %131
  %133 = load double, double* %132, align 8, !tbaa !1
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %70, i64 %131
  %135 = load double, double* %134, align 8, !tbaa !1
  %136 = fsub double %135, %133
  store double %136, double* %134, align 8, !tbaa !1
  %137 = or i64 %119, 3
  %138 = getelementptr inbounds double, double* %32, i64 %137
  %139 = load double, double* %138, align 8, !tbaa !1
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %70, i64 %137
  %141 = load double, double* %140, align 8, !tbaa !1
  %142 = fsub double %141, %139
  store double %142, double* %140, align 8, !tbaa !1
  %143 = add nsw i64 %119, 4
  %144 = icmp eq i64 %143, 1200
  br i1 %144, label %146, label %._crit_edge3, !llvm.loop !13

._crit_edge3:                                     ; preds = %118
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 3)
  %145 = add i64 %pgocount10, 1
  store i64 %145, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 3)
  br label %118

; <label>:146:                                    ; preds = %118
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 10)
  %147 = add i64 %pgocount11, 1
  store i64 %147, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 10)
  br label %150

; <label>:148:                                    ; preds = %80
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 11)
  %149 = add i64 %pgocount12, 1
  store i64 %149, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 11)
  br label %150

; <label>:150:                                    ; preds = %148, %146
  %151 = add nuw nsw i64 %70, 1
  %152 = icmp eq i64 %151, 1400
  br i1 %152, label %153, label %69

; <label>:153:                                    ; preds = %150
  br label %154

; <label>:154:                                    ; preds = %184, %153
  %155 = phi i64 [ %186, %184 ], [ 0, %153 ]
  br label %156

; <label>:156:                                    ; preds = %178, %154
  %157 = phi i64 [ %155, %154 ], [ %182, %178 ]
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %155, i64 %157
  store double 0.000000e+00, double* %158, align 8, !tbaa !1
  br label %159

; <label>:159:                                    ; preds = %._crit_edge4, %156
  %160 = phi i64 [ 0, %156 ], [ %175, %._crit_edge4 ]
  %161 = phi double [ 0.000000e+00, %156 ], [ %174, %._crit_edge4 ]
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %160, i64 %155
  %163 = load double, double* %162, align 8, !tbaa !1
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %160, i64 %157
  %165 = load double, double* %164, align 8, !tbaa !1
  %166 = fmul double %163, %165
  %167 = fadd double %161, %166
  store double %167, double* %158, align 8, !tbaa !1
  %168 = or i64 %160, 1
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %168, i64 %155
  %170 = load double, double* %169, align 8, !tbaa !1
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %168, i64 %157
  %172 = load double, double* %171, align 8, !tbaa !1
  %173 = fmul double %170, %172
  %174 = fadd double %167, %173
  store double %174, double* %158, align 8, !tbaa !1
  %175 = add nsw i64 %160, 2
  %176 = icmp eq i64 %175, 1400
  br i1 %176, label %178, label %._crit_edge4

._crit_edge4:                                     ; preds = %159
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 4)
  %177 = add i64 %pgocount13, 1
  store i64 %177, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 4)
  br label %159

; <label>:178:                                    ; preds = %159
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 6)
  %179 = add i64 %pgocount14, 1
  store i64 %179, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 6)
  %180 = fdiv double %174, 1.399000e+03
  store double %180, double* %158, align 8, !tbaa !1
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %157, i64 %155
  store double %180, double* %181, align 8, !tbaa !1
  %182 = add nuw nsw i64 %157, 1
  %183 = icmp eq i64 %182, 1200
  br i1 %183, label %184, label %156

; <label>:184:                                    ; preds = %178
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 9)
  %185 = add i64 %pgocount15, 1
  store i64 %185, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 9)
  %186 = add nuw nsw i64 %155, 1
  %187 = icmp eq i64 %186, 1200
  br i1 %187, label %188, label %154

; <label>:188:                                    ; preds = %184
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %189 = icmp sgt i32 %0, 42
  br i1 %189, label %190, label %231

; <label>:190:                                    ; preds = %188
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 14)
  %191 = add i64 %pgocount16, 1
  store i64 %191, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 14)
  %192 = load i8*, i8** %1, align 8, !tbaa !14
  %193 = load i8, i8* %192, align 1, !tbaa !16
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %195, label %231

; <label>:195:                                    ; preds = %190
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %197 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %196) #4
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %199 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %198, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %200

; <label>:200:                                    ; preds = %221, %195
  %201 = phi i64 [ 0, %195 ], [ %223, %221 ]
  %202 = mul nuw nsw i64 %201, 1200
  br label %203

; <label>:203:                                    ; preds = %214, %200
  %204 = phi i64 [ 0, %200 ], [ %219, %214 ]
  %205 = add nuw nsw i64 %204, %202
  %206 = trunc i64 %205 to i32
  %207 = srem i32 %206, 20
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %210, label %._crit_edge5

._crit_edge5:                                     ; preds = %203
  %pgocount17 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 5)
  %209 = add i64 %pgocount17, 1
  store i64 %209, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 5)
  br label %214

; <label>:210:                                    ; preds = %203
  %pgocount18 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 12)
  %211 = add i64 %pgocount18, 1
  store i64 %211, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 12)
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %213 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %212) #4
  br label %214

; <label>:214:                                    ; preds = %._crit_edge5, %210
  %215 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %216 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %201, i64 %204
  %217 = load double, double* %216, align 8, !tbaa !1
  %218 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %215, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %217) #4
  %219 = add nuw nsw i64 %204, 1
  %220 = icmp eq i64 %219, 1200
  br i1 %220, label %221, label %203

; <label>:221:                                    ; preds = %214
  %pgocount19 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 15)
  %222 = add i64 %pgocount19, 1
  store i64 %222, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 15)
  %223 = add nuw nsw i64 %201, 1
  %224 = icmp eq i64 %223, 1200
  br i1 %224, label %225, label %200

; <label>:225:                                    ; preds = %221
  %pgocount20 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 16)
  %226 = add i64 %pgocount20, 1
  store i64 %226, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 16)
  %227 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %228 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %227, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #4
  %229 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %230 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %229) #4
  br label %231

; <label>:231:                                    ; preds = %225, %190, %188
  %pgocount21 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 13)
  %232 = add i64 %pgocount21, 1
  store i64 %232, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_main, i64 0, i64 13)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* nonnull %4) #3
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
