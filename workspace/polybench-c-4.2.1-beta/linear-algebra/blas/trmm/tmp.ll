; ModuleID = 'C.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 257963529362, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = bitcast i8* %3 to [1000 x double]*
  %6 = bitcast i8* %4 to [1200 x double]*
  br label %7

; <label>:7:                                      ; preds = %69, %2
  %8 = phi i64 [ 0, %2 ], [ %71, %69 ]
  %9 = icmp sgt i64 %8, 0
  br i1 %9, label %10, label %48

; <label>:10:                                     ; preds = %7
  %11 = and i64 %8, 1
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %21, label %13

; <label>:13:                                     ; preds = %10
  br label %14

; <label>:14:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 12)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 12)
  %16 = trunc i64 %8 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  store double %19, double* %20, align 8, !tbaa !1
  br label %21

; <label>:21:                                     ; preds = %14, %10
  %22 = phi i64 [ 1, %14 ], [ 0, %10 ]
  br label %23

; <label>:23:                                     ; preds = %21
  %24 = icmp eq i64 %8, 1
  br i1 %24, label %46, label %25

; <label>:25:                                     ; preds = %23
  br label %26

; <label>:26:                                     ; preds = %._crit_edge3, %25
  %27 = phi i64 [ %22, %25 ], [ %41, %._crit_edge3 ]
  %28 = add nuw nsw i64 %27, %8
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 %27
  store double %32, double* %33, align 8, !tbaa !1
  %34 = add nuw nsw i64 %27, 1
  %35 = add nuw nsw i64 %34, %8
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1000
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.000000e+03
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 %34
  store double %39, double* %40, align 8, !tbaa !1
  %41 = add nsw i64 %27, 2
  %42 = icmp eq i64 %41, %8
  br i1 %42, label %44, label %._crit_edge3

._crit_edge3:                                     ; preds = %26
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 3)
  %43 = add i64 %pgocount5, 1
  store i64 %43, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 3)
  br label %26

; <label>:44:                                     ; preds = %26
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 13)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 13)
  br label %46

; <label>:46:                                     ; preds = %44, %23
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 9)
  %47 = add i64 %pgocount7, 1
  store i64 %47, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 9)
  br label %48

; <label>:48:                                     ; preds = %46, %7
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 %8
  store double 1.000000e+00, double* %49, align 8, !tbaa !1
  %50 = add nuw nsw i64 %8, 1200
  br label %51

; <label>:51:                                     ; preds = %._crit_edge1, %48
  %52 = phi i64 [ 0, %48 ], [ %66, %._crit_edge1 ]
  %53 = sub nuw nsw i64 %50, %52
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 1200
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, 1.200000e+03
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %52
  store double %57, double* %58, align 8, !tbaa !1
  %59 = or i64 %52, 1
  %60 = sub nuw nsw i64 %50, %59
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 1200
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, 1.200000e+03
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %59
  store double %64, double* %65, align 8, !tbaa !1
  %66 = add nsw i64 %52, 2
  %67 = icmp eq i64 %66, 1200
  br i1 %67, label %69, label %._crit_edge1

._crit_edge1:                                     ; preds = %51
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 1)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 1)
  br label %51

; <label>:69:                                     ; preds = %51
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 8)
  %70 = add i64 %pgocount9, 1
  store i64 %70, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 8)
  %71 = add nuw nsw i64 %8, 1
  %72 = icmp eq i64 %71, 1000
  br i1 %72, label %73, label %7

; <label>:73:                                     ; preds = %69
  tail call void (...) @polybench_timer_start() #3
  br label %81

; <label>:74:                                     ; preds = %171
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 11)
  %75 = add i64 %pgocount10, 1
  store i64 %75, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 11)
  br label %78

; <label>:76:                                     ; preds = %94
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 10)
  %77 = add i64 %pgocount11, 1
  store i64 %77, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 10)
  br label %78

; <label>:78:                                     ; preds = %76, %74
  %79 = add nuw nsw i64 %83, 1
  %80 = icmp eq i64 %85, 1000
  br i1 %80, label %176, label %81

; <label>:81:                                     ; preds = %78, %73
  %82 = phi i64 [ 0, %73 ], [ %85, %78 ]
  %83 = phi i64 [ 1, %73 ], [ %79, %78 ]
  %84 = sub i64 999, %82
  %85 = add nuw nsw i64 %82, 1
  %86 = icmp slt i64 %85, 1000
  br i1 %86, label %88, label %87

; <label>:87:                                     ; preds = %81
  br label %94

; <label>:88:                                     ; preds = %81
  %89 = and i64 %84, 1
  %90 = icmp eq i64 %89, 0
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %83, i64 %82
  %92 = add nuw nsw i64 %83, 1
  %93 = icmp eq i64 %82, 998
  br label %131

; <label>:94:                                     ; preds = %._crit_edge2, %87
  %95 = phi i64 [ 0, %87 ], [ %128, %._crit_edge2 ]
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %82, i64 %95
  %97 = bitcast double* %96 to <2 x double>*
  %98 = load <2 x double>, <2 x double>* %97, align 8, !tbaa !1
  %99 = getelementptr double, double* %96, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  %101 = load <2 x double>, <2 x double>* %100, align 8, !tbaa !1
  %102 = fmul <2 x double> %98, <double 1.500000e+00, double 1.500000e+00>
  %103 = fmul <2 x double> %101, <double 1.500000e+00, double 1.500000e+00>
  %104 = bitcast double* %96 to <2 x double>*
  store <2 x double> %102, <2 x double>* %104, align 8, !tbaa !1
  %105 = bitcast double* %99 to <2 x double>*
  store <2 x double> %103, <2 x double>* %105, align 8, !tbaa !1
  %106 = add nuw nsw i64 %95, 4
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %82, i64 %106
  %108 = bitcast double* %107 to <2 x double>*
  %109 = load <2 x double>, <2 x double>* %108, align 8, !tbaa !1
  %110 = getelementptr double, double* %107, i64 2
  %111 = bitcast double* %110 to <2 x double>*
  %112 = load <2 x double>, <2 x double>* %111, align 8, !tbaa !1
  %113 = fmul <2 x double> %109, <double 1.500000e+00, double 1.500000e+00>
  %114 = fmul <2 x double> %112, <double 1.500000e+00, double 1.500000e+00>
  %115 = bitcast double* %107 to <2 x double>*
  store <2 x double> %113, <2 x double>* %115, align 8, !tbaa !1
  %116 = bitcast double* %110 to <2 x double>*
  store <2 x double> %114, <2 x double>* %116, align 8, !tbaa !1
  %117 = add nsw i64 %95, 8
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %82, i64 %117
  %119 = bitcast double* %118 to <2 x double>*
  %120 = load <2 x double>, <2 x double>* %119, align 8, !tbaa !1
  %121 = getelementptr double, double* %118, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %123 = load <2 x double>, <2 x double>* %122, align 8, !tbaa !1
  %124 = fmul <2 x double> %120, <double 1.500000e+00, double 1.500000e+00>
  %125 = fmul <2 x double> %123, <double 1.500000e+00, double 1.500000e+00>
  %126 = bitcast double* %118 to <2 x double>*
  store <2 x double> %124, <2 x double>* %126, align 8, !tbaa !1
  %127 = bitcast double* %121 to <2 x double>*
  store <2 x double> %125, <2 x double>* %127, align 8, !tbaa !1
  %128 = add nsw i64 %95, 12
  %129 = icmp eq i64 %128, 1200
  br i1 %129, label %76, label %._crit_edge2, !llvm.loop !5

._crit_edge2:                                     ; preds = %94
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 2)
  %130 = add i64 %pgocount12, 1
  store i64 %130, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 2)
  br label %94

; <label>:131:                                    ; preds = %171, %88
  %132 = phi i64 [ %174, %171 ], [ 0, %88 ]
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %82, i64 %132
  %134 = load double, double* %133, align 8, !tbaa !1
  br i1 %90, label %143, label %135

; <label>:135:                                    ; preds = %131
  br label %136

; <label>:136:                                    ; preds = %135
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 6)
  %137 = add i64 %pgocount13, 1
  store i64 %137, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 6)
  %138 = load double, double* %91, align 8, !tbaa !1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %83, i64 %132
  %140 = load double, double* %139, align 8, !tbaa !1
  %141 = fmul double %138, %140
  %142 = fadd double %134, %141
  store double %142, double* %133, align 8, !tbaa !1
  br label %143

; <label>:143:                                    ; preds = %136, %131
  %144 = phi double [ %142, %136 ], [ undef, %131 ]
  %145 = phi i64 [ %92, %136 ], [ %83, %131 ]
  %146 = phi double [ %142, %136 ], [ %134, %131 ]
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 5)
  %147 = add i64 %pgocount14, 1
  store i64 %147, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 5)
  br label %148

; <label>:148:                                    ; preds = %143
  br i1 %93, label %171, label %149

; <label>:149:                                    ; preds = %148
  br label %150

; <label>:150:                                    ; preds = %._crit_edge, %149
  %151 = phi i64 [ %145, %149 ], [ %166, %._crit_edge ]
  %152 = phi double [ %146, %149 ], [ %165, %._crit_edge ]
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %151, i64 %82
  %154 = load double, double* %153, align 8, !tbaa !1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %151, i64 %132
  %156 = load double, double* %155, align 8, !tbaa !1
  %157 = fmul double %154, %156
  %158 = fadd double %152, %157
  store double %158, double* %133, align 8, !tbaa !1
  %159 = add nuw nsw i64 %151, 1
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %159, i64 %82
  %161 = load double, double* %160, align 8, !tbaa !1
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %159, i64 %132
  %163 = load double, double* %162, align 8, !tbaa !1
  %164 = fmul double %161, %163
  %165 = fadd double %158, %164
  store double %165, double* %133, align 8, !tbaa !1
  %166 = add nsw i64 %151, 2
  %167 = icmp eq i64 %166, 1000
  br i1 %167, label %169, label %._crit_edge

._crit_edge:                                      ; preds = %150
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 0)
  %168 = add i64 %pgocount15, 1
  store i64 %168, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 0)
  br label %150

; <label>:169:                                    ; preds = %150
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 7)
  %170 = add i64 %pgocount16, 1
  store i64 %170, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 7)
  br label %171

; <label>:171:                                    ; preds = %169, %148
  %172 = phi double [ %144, %148 ], [ %165, %169 ]
  %173 = fmul double %172, 1.500000e+00
  store double %173, double* %133, align 8, !tbaa !1
  %174 = add nuw nsw i64 %132, 1
  %175 = icmp eq i64 %174, 1200
  br i1 %175, label %74, label %131

; <label>:176:                                    ; preds = %78
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %177 = icmp sgt i32 %0, 42
  br i1 %177, label %178, label %219

; <label>:178:                                    ; preds = %176
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 16)
  %179 = add i64 %pgocount17, 1
  store i64 %179, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 16)
  %180 = load i8*, i8** %1, align 8, !tbaa !8
  %181 = load i8, i8* %180, align 1, !tbaa !10
  %182 = icmp eq i8 %181, 0
  br i1 %182, label %183, label %219

; <label>:183:                                    ; preds = %178
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %185 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %184) #4
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %187 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %186, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %188

; <label>:188:                                    ; preds = %209, %183
  %189 = phi i64 [ 0, %183 ], [ %211, %209 ]
  %190 = mul nuw nsw i64 %189, 1000
  br label %191

; <label>:191:                                    ; preds = %202, %188
  %192 = phi i64 [ 0, %188 ], [ %207, %202 ]
  %193 = add nuw nsw i64 %192, %190
  %194 = trunc i64 %193 to i32
  %195 = srem i32 %194, 20
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %198, label %._crit_edge4

._crit_edge4:                                     ; preds = %191
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 4)
  %197 = add i64 %pgocount18, 1
  store i64 %197, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 4)
  br label %202

; <label>:198:                                    ; preds = %191
  %pgocount19 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 14)
  %199 = add i64 %pgocount19, 1
  store i64 %199, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 14)
  %200 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %201 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %200) #4
  br label %202

; <label>:202:                                    ; preds = %198, %._crit_edge4
  %203 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %204 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %189, i64 %192
  %205 = load double, double* %204, align 8, !tbaa !1
  %206 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %203, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %205) #4
  %207 = add nuw nsw i64 %192, 1
  %208 = icmp eq i64 %207, 1200
  br i1 %208, label %209, label %191

; <label>:209:                                    ; preds = %202
  %pgocount20 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 17)
  %210 = add i64 %pgocount20, 1
  store i64 %210, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 17)
  %211 = add nuw nsw i64 %189, 1
  %212 = icmp eq i64 %211, 1000
  br i1 %212, label %213, label %188

; <label>:213:                                    ; preds = %209
  %pgocount21 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 18)
  %214 = add i64 %pgocount21, 1
  store i64 %214, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 18)
  %215 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %216 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %215, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %217 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %218 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %217) #4
  br label %219

; <label>:219:                                    ; preds = %213, %178, %176
  %pgocount22 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 15)
  %220 = add i64 %pgocount22, 1
  store i64 %220, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main, i64 0, i64 15)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* nonnull %4) #3
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
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.width", i32 1}
!7 = !{!"llvm.loop.interleave.count", i32 1}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !3, i64 0}
!10 = !{!3, !3, i64 0}
