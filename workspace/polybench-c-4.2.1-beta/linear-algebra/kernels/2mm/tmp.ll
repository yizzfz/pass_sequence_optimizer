; ModuleID = 'C.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 251728816735, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #3
  %8 = bitcast i8* %4 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  br label %10

; <label>:10:                                     ; preds = %24, %2
  %11 = phi i64 [ 0, %2 ], [ %26, %24 ]
  br label %12

; <label>:12:                                     ; preds = %._crit_edge, %10
  %13 = phi i64 [ 0, %10 ], [ %21, %._crit_edge ]
  %14 = mul nuw nsw i64 %13, %11
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 800
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 8.000000e+02
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %11, i64 %13
  store double %19, double* %20, align 8, !tbaa !1
  %21 = add nuw nsw i64 %13, 1
  %22 = icmp eq i64 %21, 1100
  br i1 %22, label %24, label %._crit_edge

._crit_edge:                                      ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 0)
  br label %12

; <label>:24:                                     ; preds = %12
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 9)
  %25 = add i64 %pgocount7, 1
  store i64 %25, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 9)
  %26 = add nuw nsw i64 %11, 1
  %27 = icmp eq i64 %26, 800
  br i1 %27, label %28, label %10

; <label>:28:                                     ; preds = %24
  %29 = bitcast i8* %5 to [900 x double]*
  %30 = bitcast i8* %7 to [1200 x double]*
  br label %31

; <label>:31:                                     ; preds = %51, %28
  %32 = phi i64 [ %53, %51 ], [ 0, %28 ]
  br label %33

; <label>:33:                                     ; preds = %._crit_edge1, %31
  %34 = phi i64 [ 0, %31 ], [ %42, %._crit_edge1 ]
  %35 = or i64 %34, 1
  %36 = mul nuw nsw i64 %35, %32
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 900
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 9.000000e+02
  %41 = getelementptr inbounds [900 x double], [900 x double]* %29, i64 %32, i64 %34
  store double %40, double* %41, align 8, !tbaa !1
  %42 = add nsw i64 %34, 2
  %43 = mul nuw nsw i64 %42, %32
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 900
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 9.000000e+02
  %48 = getelementptr inbounds [900 x double], [900 x double]* %29, i64 %32, i64 %35
  store double %47, double* %48, align 8, !tbaa !1
  %49 = icmp eq i64 %42, 900
  br i1 %49, label %51, label %._crit_edge1

._crit_edge1:                                     ; preds = %33
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 1)
  %50 = add i64 %pgocount8, 1
  store i64 %50, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 1)
  br label %33

; <label>:51:                                     ; preds = %33
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 10)
  %52 = add i64 %pgocount9, 1
  store i64 %52, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 10)
  %53 = add nuw nsw i64 %32, 1
  %54 = icmp eq i64 %53, 1100
  br i1 %54, label %55, label %31

; <label>:55:                                     ; preds = %51
  br label %56

; <label>:56:                                     ; preds = %71, %55
  %57 = phi i64 [ %73, %71 ], [ 0, %55 ]
  br label %58

; <label>:58:                                     ; preds = %._crit_edge2, %56
  %59 = phi i64 [ 0, %56 ], [ %68, %._crit_edge2 ]
  %60 = add nuw nsw i64 %59, 3
  %61 = mul nuw nsw i64 %60, %57
  %62 = add nuw nsw i64 %61, 1
  %63 = trunc i64 %62 to i32
  %64 = srem i32 %63, 1200
  %65 = sitofp i32 %64 to double
  %66 = fdiv double %65, 1.200000e+03
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %57, i64 %59
  store double %66, double* %67, align 8, !tbaa !1
  %68 = add nuw nsw i64 %59, 1
  %69 = icmp eq i64 %68, 1200
  br i1 %69, label %71, label %._crit_edge2

._crit_edge2:                                     ; preds = %58
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 2)
  %70 = add i64 %pgocount10, 1
  store i64 %70, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 2)
  br label %58

; <label>:71:                                     ; preds = %58
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 11)
  %72 = add i64 %pgocount11, 1
  store i64 %72, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 11)
  %73 = add nuw nsw i64 %57, 1
  %74 = icmp eq i64 %73, 900
  br i1 %74, label %75, label %56

; <label>:75:                                     ; preds = %71
  br label %76

; <label>:76:                                     ; preds = %90, %75
  %77 = phi i64 [ %92, %90 ], [ 0, %75 ]
  br label %78

; <label>:78:                                     ; preds = %._crit_edge3, %76
  %79 = phi i64 [ 0, %76 ], [ %87, %._crit_edge3 ]
  %80 = add nuw nsw i64 %79, 2
  %81 = mul nuw nsw i64 %80, %77
  %82 = trunc i64 %81 to i32
  %83 = srem i32 %82, 1100
  %84 = sitofp i32 %83 to double
  %85 = fdiv double %84, 1.100000e+03
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 %77, i64 %79
  store double %85, double* %86, align 8, !tbaa !1
  %87 = add nuw nsw i64 %79, 1
  %88 = icmp eq i64 %87, 1200
  br i1 %88, label %90, label %._crit_edge3

._crit_edge3:                                     ; preds = %78
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 3)
  %89 = add i64 %pgocount12, 1
  store i64 %89, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 3)
  br label %78

; <label>:90:                                     ; preds = %78
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 12)
  %91 = add i64 %pgocount13, 1
  store i64 %91, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 12)
  %92 = add nuw nsw i64 %77, 1
  %93 = icmp eq i64 %92, 800
  br i1 %93, label %94, label %76

; <label>:94:                                     ; preds = %90
  tail call void (...) @polybench_timer_start() #3
  %95 = bitcast i8* %3 to [900 x double]*
  br label %96

; <label>:96:                                     ; preds = %126, %94
  %97 = phi i64 [ 0, %94 ], [ %128, %126 ]
  br label %98

; <label>:98:                                     ; preds = %122, %96
  %99 = phi i64 [ 0, %96 ], [ %124, %122 ]
  %100 = getelementptr inbounds [900 x double], [900 x double]* %95, i64 %97, i64 %99
  store double 0.000000e+00, double* %100, align 8, !tbaa !1
  br label %101

; <label>:101:                                    ; preds = %._crit_edge4, %98
  %102 = phi double [ 0.000000e+00, %98 ], [ %118, %._crit_edge4 ]
  %103 = phi i64 [ 0, %98 ], [ %119, %._crit_edge4 ]
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %97, i64 %103
  %105 = load double, double* %104, align 8, !tbaa !1
  %106 = fmul double %105, 1.500000e+00
  %107 = getelementptr inbounds [900 x double], [900 x double]* %29, i64 %103, i64 %99
  %108 = load double, double* %107, align 8, !tbaa !1
  %109 = fmul double %106, %108
  %110 = fadd double %102, %109
  store double %110, double* %100, align 8, !tbaa !1
  %111 = or i64 %103, 1
  %112 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %97, i64 %111
  %113 = load double, double* %112, align 8, !tbaa !1
  %114 = fmul double %113, 1.500000e+00
  %115 = getelementptr inbounds [900 x double], [900 x double]* %29, i64 %111, i64 %99
  %116 = load double, double* %115, align 8, !tbaa !1
  %117 = fmul double %114, %116
  %118 = fadd double %110, %117
  store double %118, double* %100, align 8, !tbaa !1
  %119 = add nsw i64 %103, 2
  %120 = icmp eq i64 %119, 1100
  br i1 %120, label %122, label %._crit_edge4

._crit_edge4:                                     ; preds = %101
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 4)
  %121 = add i64 %pgocount14, 1
  store i64 %121, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 4)
  br label %101

; <label>:122:                                    ; preds = %101
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 7)
  %123 = add i64 %pgocount15, 1
  store i64 %123, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 7)
  %124 = add nuw nsw i64 %99, 1
  %125 = icmp eq i64 %124, 900
  br i1 %125, label %126, label %98

; <label>:126:                                    ; preds = %122
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 13)
  %127 = add i64 %pgocount16, 1
  store i64 %127, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 13)
  %128 = add nuw nsw i64 %97, 1
  %129 = icmp eq i64 %128, 800
  br i1 %129, label %130, label %96

; <label>:130:                                    ; preds = %126
  br label %131

; <label>:131:                                    ; preds = %168, %130
  %132 = phi i64 [ %170, %168 ], [ 0, %130 ]
  br label %133

; <label>:133:                                    ; preds = %164, %131
  %134 = phi i64 [ 0, %131 ], [ %166, %164 ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 %132, i64 %134
  %136 = load double, double* %135, align 8, !tbaa !1
  %137 = fmul double %136, 1.200000e+00
  store double %137, double* %135, align 8, !tbaa !1
  br label %138

; <label>:138:                                    ; preds = %._crit_edge5, %133
  %139 = phi double [ %137, %133 ], [ %160, %._crit_edge5 ]
  %140 = phi i64 [ 0, %133 ], [ %161, %._crit_edge5 ]
  %141 = getelementptr inbounds [900 x double], [900 x double]* %95, i64 %132, i64 %140
  %142 = load double, double* %141, align 8, !tbaa !1
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %140, i64 %134
  %144 = load double, double* %143, align 8, !tbaa !1
  %145 = fmul double %142, %144
  %146 = fadd double %139, %145
  store double %146, double* %135, align 8, !tbaa !1
  %147 = add nuw nsw i64 %140, 1
  %148 = getelementptr inbounds [900 x double], [900 x double]* %95, i64 %132, i64 %147
  %149 = load double, double* %148, align 8, !tbaa !1
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %147, i64 %134
  %151 = load double, double* %150, align 8, !tbaa !1
  %152 = fmul double %149, %151
  %153 = fadd double %146, %152
  store double %153, double* %135, align 8, !tbaa !1
  %154 = add nsw i64 %140, 2
  %155 = getelementptr inbounds [900 x double], [900 x double]* %95, i64 %132, i64 %154
  %156 = load double, double* %155, align 8, !tbaa !1
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %154, i64 %134
  %158 = load double, double* %157, align 8, !tbaa !1
  %159 = fmul double %156, %158
  %160 = fadd double %153, %159
  store double %160, double* %135, align 8, !tbaa !1
  %161 = add nsw i64 %140, 3
  %162 = icmp eq i64 %161, 900
  br i1 %162, label %164, label %._crit_edge5

._crit_edge5:                                     ; preds = %138
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 5)
  %163 = add i64 %pgocount17, 1
  store i64 %163, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 5)
  br label %138

; <label>:164:                                    ; preds = %138
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 8)
  %165 = add i64 %pgocount18, 1
  store i64 %165, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 8)
  %166 = add nuw nsw i64 %134, 1
  %167 = icmp eq i64 %166, 1200
  br i1 %167, label %168, label %133

; <label>:168:                                    ; preds = %164
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 14)
  %169 = add i64 %pgocount19, 1
  store i64 %169, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 14)
  %170 = add nuw nsw i64 %132, 1
  %171 = icmp eq i64 %170, 800
  br i1 %171, label %172, label %131

; <label>:172:                                    ; preds = %168
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %173 = icmp sgt i32 %0, 42
  br i1 %173, label %174, label %215

; <label>:174:                                    ; preds = %172
  %pgocount20 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 17)
  %175 = add i64 %pgocount20, 1
  store i64 %175, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 17)
  %176 = load i8*, i8** %1, align 8, !tbaa !5
  %177 = load i8, i8* %176, align 1, !tbaa !7
  %178 = icmp eq i8 %177, 0
  br i1 %178, label %179, label %215

; <label>:179:                                    ; preds = %174
  %180 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %181 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %180) #4
  %182 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %183 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %182, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %184

; <label>:184:                                    ; preds = %205, %179
  %185 = phi i64 [ 0, %179 ], [ %207, %205 ]
  %186 = mul nuw nsw i64 %185, 800
  br label %187

; <label>:187:                                    ; preds = %198, %184
  %188 = phi i64 [ 0, %184 ], [ %203, %198 ]
  %189 = add nuw nsw i64 %188, %186
  %190 = trunc i64 %189 to i32
  %191 = srem i32 %190, 20
  %192 = icmp eq i32 %191, 0
  br i1 %192, label %194, label %._crit_edge6

._crit_edge6:                                     ; preds = %187
  %pgocount21 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 6)
  %193 = add i64 %pgocount21, 1
  store i64 %193, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 6)
  br label %198

; <label>:194:                                    ; preds = %187
  %pgocount22 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 15)
  %195 = add i64 %pgocount22, 1
  store i64 %195, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 15)
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %197 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %196) #4
  br label %198

; <label>:198:                                    ; preds = %194, %._crit_edge6
  %199 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 %185, i64 %188
  %201 = load double, double* %200, align 8, !tbaa !1
  %202 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %199, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %201) #4
  %203 = add nuw nsw i64 %188, 1
  %204 = icmp eq i64 %203, 1200
  br i1 %204, label %205, label %187

; <label>:205:                                    ; preds = %198
  %pgocount23 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 18)
  %206 = add i64 %pgocount23, 1
  store i64 %206, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 18)
  %207 = add nuw nsw i64 %185, 1
  %208 = icmp eq i64 %207, 800
  br i1 %208, label %209, label %184

; <label>:209:                                    ; preds = %205
  %pgocount24 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 19)
  %210 = add i64 %pgocount24, 1
  store i64 %210, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 19)
  %211 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %212 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %211, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %214 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %213) #4
  br label %215

; <label>:215:                                    ; preds = %209, %174, %172
  %pgocount25 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 16)
  %216 = add i64 %pgocount25, 1
  store i64 %216, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_main, i64 0, i64 16)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* nonnull %7) #3
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
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
