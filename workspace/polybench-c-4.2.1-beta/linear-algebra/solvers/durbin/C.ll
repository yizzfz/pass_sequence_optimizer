; ModuleID = 'B.ll'
source_filename = "durbin.c"
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
@__profc_main = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 189616735234, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca [2000 x double], align 16
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %4 to double*
  br label %7

; <label>:7:                                      ; preds = %._crit_edge4, %2
  %8 = phi i64 [ 0, %2 ], [ %33, %._crit_edge4 ]
  %9 = sub nuw nsw i64 2001, %8
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %6, i64 %8
  store double %11, double* %12, align 8, !tbaa !1
  %13 = add nuw nsw i64 %8, 1
  %14 = sub i64 2000, %8
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %6, i64 %13
  store double %16, double* %17, align 8, !tbaa !1
  %18 = add nsw i64 %8, 2
  %19 = sub i64 1999, %8
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %6, i64 %18
  store double %21, double* %22, align 8, !tbaa !1
  %23 = add nsw i64 %8, 3
  %24 = sub i64 1998, %8
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %6, i64 %23
  store double %26, double* %27, align 8, !tbaa !1
  %28 = add nsw i64 %8, 4
  %29 = sub i64 1997, %8
  %30 = trunc i64 %29 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %6, i64 %28
  store double %31, double* %32, align 8, !tbaa !1
  %33 = add nsw i64 %8, 5
  %34 = icmp eq i64 %33, 2000
  br i1 %34, label %36, label %._crit_edge4

._crit_edge4:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 4)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 4)
  br label %7

; <label>:36:                                     ; preds = %7
  tail call void (...) @polybench_timer_start() #4
  %37 = bitcast i8* %5 to double*
  %38 = bitcast [2000 x double]* %3 to i8*
  call void @llvm.lifetime.start(i64 16000, i8* nonnull %38) #4
  %39 = load double, double* %6, align 8, !tbaa !1
  %40 = fsub double -0.000000e+00, %39
  store double %40, double* %37, align 8, !tbaa !1
  %41 = load double, double* %6, align 8, !tbaa !1
  %42 = fsub double -0.000000e+00, %41
  br label %43

; <label>:43:                                     ; preds = %186, %36
  %44 = phi i64 [ 1, %36 ], [ %189, %186 ]
  %45 = phi i64 [ 0, %36 ], [ %190, %186 ]
  %46 = phi double [ 1.000000e+00, %36 ], [ %121, %186 ]
  %47 = phi double [ %42, %36 ], [ %126, %186 ]
  %48 = add i64 %45, 1
  %49 = add i64 %45, 1
  %50 = shl i64 %45, 3
  %51 = fmul double %47, %47
  %52 = fsub double 1.000000e+00, %51
  %53 = add nsw i64 %44, -1
  %54 = and i64 %48, 3
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %74, label %56

; <label>:56:                                     ; preds = %43
  br label %57

; <label>:57:                                     ; preds = %._crit_edge1, %56
  %58 = phi i64 [ 0, %56 ], [ %68, %._crit_edge1 ]
  %59 = phi double [ 0.000000e+00, %56 ], [ %67, %._crit_edge1 ]
  %60 = phi i64 [ %54, %56 ], [ %69, %._crit_edge1 ]
  %61 = sub nsw i64 %53, %58
  %62 = getelementptr inbounds double, double* %6, i64 %61
  %63 = load double, double* %62, align 8, !tbaa !1
  %64 = getelementptr inbounds double, double* %37, i64 %58
  %65 = load double, double* %64, align 8, !tbaa !1
  %66 = fmul double %63, %65
  %67 = fadd double %59, %66
  %68 = add nuw nsw i64 %58, 1
  %69 = add i64 %60, -1
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %72, label %._crit_edge1, !llvm.loop !5

._crit_edge1:                                     ; preds = %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 1)
  %71 = add i64 %pgocount7, 1
  store i64 %71, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 1)
  br label %57

; <label>:72:                                     ; preds = %57
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 8)
  %73 = add i64 %pgocount8, 1
  store i64 %73, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 8)
  br label %74

; <label>:74:                                     ; preds = %72, %43
  %75 = phi double [ undef, %43 ], [ %67, %72 ]
  %76 = phi i64 [ 0, %43 ], [ %68, %72 ]
  %77 = phi double [ 0.000000e+00, %43 ], [ %67, %72 ]
  %78 = icmp ult i64 %45, 3
  br i1 %78, label %119, label %79

; <label>:79:                                     ; preds = %74
  br label %80

; <label>:80:                                     ; preds = %._crit_edge2, %79
  %81 = phi i64 [ %76, %79 ], [ %114, %._crit_edge2 ]
  %82 = phi double [ %77, %79 ], [ %113, %._crit_edge2 ]
  %83 = sub nsw i64 %53, %81
  %84 = getelementptr inbounds double, double* %6, i64 %83
  %85 = load double, double* %84, align 8, !tbaa !1
  %86 = getelementptr inbounds double, double* %37, i64 %81
  %87 = load double, double* %86, align 8, !tbaa !1
  %88 = fmul double %85, %87
  %89 = fadd double %82, %88
  %90 = add nuw nsw i64 %81, 1
  %91 = sub nsw i64 %53, %90
  %92 = getelementptr inbounds double, double* %6, i64 %91
  %93 = load double, double* %92, align 8, !tbaa !1
  %94 = getelementptr inbounds double, double* %37, i64 %90
  %95 = load double, double* %94, align 8, !tbaa !1
  %96 = fmul double %93, %95
  %97 = fadd double %89, %96
  %98 = add nsw i64 %81, 2
  %99 = sub nsw i64 %53, %98
  %100 = getelementptr inbounds double, double* %6, i64 %99
  %101 = load double, double* %100, align 8, !tbaa !1
  %102 = getelementptr inbounds double, double* %37, i64 %98
  %103 = load double, double* %102, align 8, !tbaa !1
  %104 = fmul double %101, %103
  %105 = fadd double %97, %104
  %106 = add nsw i64 %81, 3
  %107 = sub nsw i64 %53, %106
  %108 = getelementptr inbounds double, double* %6, i64 %107
  %109 = load double, double* %108, align 8, !tbaa !1
  %110 = getelementptr inbounds double, double* %37, i64 %106
  %111 = load double, double* %110, align 8, !tbaa !1
  %112 = fmul double %109, %111
  %113 = fadd double %105, %112
  %114 = add nsw i64 %81, 4
  %115 = icmp eq i64 %114, %44
  br i1 %115, label %117, label %._crit_edge2

._crit_edge2:                                     ; preds = %80
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 2)
  %116 = add i64 %pgocount9, 1
  store i64 %116, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 2)
  br label %80

; <label>:117:                                    ; preds = %80
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 9)
  %118 = add i64 %pgocount10, 1
  store i64 %118, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 9)
  br label %119

; <label>:119:                                    ; preds = %117, %74
  %120 = phi double [ %75, %74 ], [ %113, %117 ]
  %121 = fmul double %46, %52
  %122 = getelementptr inbounds double, double* %6, i64 %44
  %123 = load double, double* %122, align 8, !tbaa !1
  %124 = fadd double %120, %123
  %125 = fsub double -0.000000e+00, %124
  %126 = fdiv double %125, %121
  %127 = icmp ult i64 %49, 4
  br i1 %127, label %169, label %128

; <label>:128:                                    ; preds = %119
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 10)
  %129 = add i64 %pgocount11, 1
  store i64 %129, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 10)
  %130 = and i64 %49, -4
  %131 = icmp eq i64 %130, 0
  br i1 %131, label %169, label %132

; <label>:132:                                    ; preds = %128
  %133 = insertelement <2 x double> undef, double %126, i32 0
  %134 = shufflevector <2 x double> %133, <2 x double> undef, <2 x i32> zeroinitializer
  br label %135

; <label>:135:                                    ; preds = %._crit_edge3, %132
  %136 = phi i64 [ 0, %132 ], [ %162, %._crit_edge3 ]
  %137 = getelementptr inbounds double, double* %37, i64 %136
  %138 = bitcast double* %137 to <2 x double>*
  %139 = load <2 x double>, <2 x double>* %138, align 8, !tbaa !1
  %140 = getelementptr double, double* %137, i64 2
  %141 = bitcast double* %140 to <2 x double>*
  %142 = load <2 x double>, <2 x double>* %141, align 8, !tbaa !1
  %143 = sub nsw i64 %53, %136
  %144 = getelementptr inbounds double, double* %37, i64 %143
  %145 = getelementptr double, double* %144, i64 -1
  %146 = bitcast double* %145 to <2 x double>*
  %147 = load <2 x double>, <2 x double>* %146, align 8, !tbaa !1
  %148 = shufflevector <2 x double> %147, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %149 = getelementptr double, double* %144, i64 -2
  %150 = getelementptr double, double* %149, i64 -1
  %151 = bitcast double* %150 to <2 x double>*
  %152 = load <2 x double>, <2 x double>* %151, align 8, !tbaa !1
  %153 = shufflevector <2 x double> %152, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %154 = fmul <2 x double> %134, %148
  %155 = fmul <2 x double> %134, %153
  %156 = fadd <2 x double> %139, %154
  %157 = fadd <2 x double> %142, %155
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %136
  %159 = bitcast double* %158 to <2 x double>*
  store <2 x double> %156, <2 x double>* %159, align 16, !tbaa !1
  %160 = getelementptr double, double* %158, i64 2
  %161 = bitcast double* %160 to <2 x double>*
  store <2 x double> %157, <2 x double>* %161, align 16, !tbaa !1
  %162 = add i64 %136, 4
  %163 = icmp eq i64 %162, %130
  br i1 %163, label %165, label %._crit_edge3, !llvm.loop !7

._crit_edge3:                                     ; preds = %135
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 3)
  %164 = add i64 %pgocount12, 1
  store i64 %164, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 3)
  br label %135

; <label>:165:                                    ; preds = %135
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 11)
  %166 = add i64 %pgocount13, 1
  store i64 %166, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 11)
  %167 = icmp eq i64 %49, %130
  br i1 %167, label %186, label %._crit_edge5

._crit_edge5:                                     ; preds = %165
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 5)
  %168 = add i64 %pgocount14, 1
  store i64 %168, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 5)
  br label %169

; <label>:169:                                    ; preds = %._crit_edge5, %128, %119
  %170 = phi i64 [ 0, %128 ], [ 0, %119 ], [ %130, %._crit_edge5 ]
  br label %171

; <label>:171:                                    ; preds = %._crit_edge, %169
  %172 = phi i64 [ %181, %._crit_edge ], [ %170, %169 ]
  %173 = getelementptr inbounds double, double* %37, i64 %172
  %174 = load double, double* %173, align 8, !tbaa !1
  %175 = sub nsw i64 %53, %172
  %176 = getelementptr inbounds double, double* %37, i64 %175
  %177 = load double, double* %176, align 8, !tbaa !1
  %178 = fmul double %126, %177
  %179 = fadd double %174, %178
  %180 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %172
  store double %179, double* %180, align 8, !tbaa !1
  %181 = add nuw nsw i64 %172, 1
  %182 = icmp eq i64 %181, %44
  br i1 %182, label %184, label %._crit_edge, !llvm.loop !10

._crit_edge:                                      ; preds = %171
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 0)
  %183 = add i64 %pgocount15, 1
  store i64 %183, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 0)
  br label %171

; <label>:184:                                    ; preds = %171
  %pgocount16 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 7)
  %185 = add i64 %pgocount16, 1
  store i64 %185, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 7)
  br label %186

; <label>:186:                                    ; preds = %184, %165
  %187 = add nuw nsw i64 %50, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* nonnull %38, i64 %187, i32 8, i1 false) #4
  %188 = getelementptr inbounds double, double* %37, i64 %44
  store double %126, double* %188, align 8, !tbaa !1
  %189 = add nuw nsw i64 %44, 1
  %190 = add nuw nsw i64 %45, 1
  %191 = icmp eq i64 %190, 1999
  br i1 %191, label %192, label %43

; <label>:192:                                    ; preds = %186
  call void @llvm.lifetime.end(i64 16000, i8* nonnull %38) #4
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %193 = icmp sgt i32 %0, 42
  br i1 %193, label %194, label %227

; <label>:194:                                    ; preds = %192
  %pgocount17 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 13)
  %195 = add i64 %pgocount17, 1
  store i64 %195, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 13)
  %196 = load i8*, i8** %1, align 8, !tbaa !12
  %197 = load i8, i8* %196, align 1, !tbaa !14
  %198 = icmp eq i8 %197, 0
  br i1 %198, label %199, label %227

; <label>:199:                                    ; preds = %194
  %200 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %201 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %200) #5
  %202 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %203 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %202, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %204

; <label>:204:                                    ; preds = %214, %199
  %205 = phi i64 [ 0, %199 ], [ %219, %214 ]
  %206 = trunc i64 %205 to i32
  %207 = srem i32 %206, 20
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %210, label %._crit_edge6

._crit_edge6:                                     ; preds = %204
  %pgocount18 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 6)
  %209 = add i64 %pgocount18, 1
  store i64 %209, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 6)
  br label %214

; <label>:210:                                    ; preds = %204
  %pgocount19 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 14)
  %211 = add i64 %pgocount19, 1
  store i64 %211, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 14)
  %212 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %213 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %212) #5
  br label %214

; <label>:214:                                    ; preds = %._crit_edge6, %210
  %215 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %216 = getelementptr inbounds double, double* %37, i64 %205
  %217 = load double, double* %216, align 8, !tbaa !1
  %218 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %215, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %217) #5
  %219 = add nuw nsw i64 %205, 1
  %220 = icmp eq i64 %219, 2000
  br i1 %220, label %221, label %204

; <label>:221:                                    ; preds = %214
  %pgocount20 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 15)
  %222 = add i64 %pgocount20, 1
  store i64 %222, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 15)
  %223 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %224 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %223, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %225 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %226 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %225) #5
  br label %227

; <label>:227:                                    ; preds = %221, %194, %192
  %pgocount21 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 12)
  %228 = add i64 %pgocount21, 1
  store i64 %228, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main, i64 0, i64 12)
  tail call void @free(i8* %4) #4
  tail call void @free(i8* nonnull %5) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

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
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !3, i64 0}
!14 = !{!3, !3, i64 0}
