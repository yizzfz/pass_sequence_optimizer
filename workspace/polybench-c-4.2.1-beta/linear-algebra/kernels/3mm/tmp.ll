; ModuleID = 'C.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 288655910786, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %7 to [1200 x double]*
  br label %12

; <label>:12:                                     ; preds = %26, %2
  %13 = phi i64 [ 0, %2 ], [ %28, %26 ]
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %12
  %15 = phi i64 [ 0, %12 ], [ %23, %._crit_edge ]
  %16 = mul nuw nsw i64 %15, %13
  %17 = add nuw nsw i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 800
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 4.000000e+03
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %13, i64 %15
  store double %21, double* %22, align 8, !tbaa !1
  %23 = add nuw nsw i64 %15, 1
  %24 = icmp eq i64 %23, 1000
  br i1 %24, label %26, label %._crit_edge

._crit_edge:                                      ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 0)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 0)
  br label %14

; <label>:26:                                     ; preds = %14
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 11)
  %27 = add i64 %pgocount8, 1
  store i64 %27, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 11)
  %28 = add nuw nsw i64 %13, 1
  %29 = icmp eq i64 %28, 800
  br i1 %29, label %30, label %12

; <label>:30:                                     ; preds = %26
  %31 = bitcast i8* %5 to [900 x double]*
  %32 = bitcast i8* %8 to [1100 x double]*
  br label %33

; <label>:33:                                     ; preds = %47, %30
  %34 = phi i64 [ %49, %47 ], [ 0, %30 ]
  br label %35

; <label>:35:                                     ; preds = %._crit_edge1, %33
  %36 = phi i64 [ 0, %33 ], [ %37, %._crit_edge1 ]
  %37 = add nuw nsw i64 %36, 1
  %38 = mul nuw nsw i64 %37, %34
  %39 = add nuw nsw i64 %38, 2
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 900
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 4.500000e+03
  %44 = getelementptr inbounds [900 x double], [900 x double]* %31, i64 %34, i64 %36
  store double %43, double* %44, align 8, !tbaa !1
  %45 = icmp eq i64 %37, 900
  br i1 %45, label %47, label %._crit_edge1

._crit_edge1:                                     ; preds = %35
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 1)
  %46 = add i64 %pgocount9, 1
  store i64 %46, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 1)
  br label %35

; <label>:47:                                     ; preds = %35
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 12)
  %48 = add i64 %pgocount10, 1
  store i64 %48, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 12)
  %49 = add nuw nsw i64 %34, 1
  %50 = icmp eq i64 %49, 1000
  br i1 %50, label %51, label %33

; <label>:51:                                     ; preds = %47
  br label %52

; <label>:52:                                     ; preds = %66, %51
  %53 = phi i64 [ %68, %66 ], [ 0, %51 ]
  br label %54

; <label>:54:                                     ; preds = %._crit_edge2, %52
  %55 = phi i64 [ 0, %52 ], [ %63, %._crit_edge2 ]
  %56 = add nuw nsw i64 %55, 3
  %57 = mul nuw nsw i64 %56, %53
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 1100
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, 5.500000e+03
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %53, i64 %55
  store double %61, double* %62, align 8, !tbaa !1
  %63 = add nuw nsw i64 %55, 1
  %64 = icmp eq i64 %63, 1200
  br i1 %64, label %66, label %._crit_edge2

._crit_edge2:                                     ; preds = %54
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 2)
  %65 = add i64 %pgocount11, 1
  store i64 %65, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 2)
  br label %54

; <label>:66:                                     ; preds = %54
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 13)
  %67 = add i64 %pgocount12, 1
  store i64 %67, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 13)
  %68 = add nuw nsw i64 %53, 1
  %69 = icmp eq i64 %68, 900
  br i1 %69, label %70, label %52

; <label>:70:                                     ; preds = %66
  br label %71

; <label>:71:                                     ; preds = %86, %70
  %72 = phi i64 [ %88, %86 ], [ 0, %70 ]
  br label %73

; <label>:73:                                     ; preds = %._crit_edge3, %71
  %74 = phi i64 [ 0, %71 ], [ %83, %._crit_edge3 ]
  %75 = add nuw nsw i64 %74, 2
  %76 = mul nuw nsw i64 %75, %72
  %77 = add nuw nsw i64 %76, 2
  %78 = trunc i64 %77 to i32
  %79 = srem i32 %78, 1000
  %80 = sitofp i32 %79 to double
  %81 = fdiv double %80, 5.000000e+03
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %32, i64 %72, i64 %74
  store double %81, double* %82, align 8, !tbaa !1
  %83 = add nuw nsw i64 %74, 1
  %84 = icmp eq i64 %83, 1100
  br i1 %84, label %86, label %._crit_edge3

._crit_edge3:                                     ; preds = %73
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 3)
  %85 = add i64 %pgocount13, 1
  store i64 %85, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 3)
  br label %73

; <label>:86:                                     ; preds = %73
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 14)
  %87 = add i64 %pgocount14, 1
  store i64 %87, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 14)
  %88 = add nuw nsw i64 %72, 1
  %89 = icmp eq i64 %88, 1200
  br i1 %89, label %90, label %71

; <label>:90:                                     ; preds = %86
  tail call void (...) @polybench_timer_start() #3
  %91 = bitcast i8* %3 to [900 x double]*
  %92 = bitcast i8* %6 to [1100 x double]*
  br label %93

; <label>:93:                                     ; preds = %121, %90
  %94 = phi i64 [ 0, %90 ], [ %123, %121 ]
  br label %95

; <label>:95:                                     ; preds = %117, %93
  %96 = phi i64 [ 0, %93 ], [ %119, %117 ]
  %97 = getelementptr inbounds [900 x double], [900 x double]* %91, i64 %94, i64 %96
  store double 0.000000e+00, double* %97, align 8, !tbaa !1
  br label %98

; <label>:98:                                     ; preds = %._crit_edge4, %95
  %99 = phi double [ 0.000000e+00, %95 ], [ %113, %._crit_edge4 ]
  %100 = phi i64 [ 0, %95 ], [ %114, %._crit_edge4 ]
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %94, i64 %100
  %102 = load double, double* %101, align 8, !tbaa !1
  %103 = getelementptr inbounds [900 x double], [900 x double]* %31, i64 %100, i64 %96
  %104 = load double, double* %103, align 8, !tbaa !1
  %105 = fmul double %102, %104
  %106 = fadd double %99, %105
  store double %106, double* %97, align 8, !tbaa !1
  %107 = or i64 %100, 1
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %94, i64 %107
  %109 = load double, double* %108, align 8, !tbaa !1
  %110 = getelementptr inbounds [900 x double], [900 x double]* %31, i64 %107, i64 %96
  %111 = load double, double* %110, align 8, !tbaa !1
  %112 = fmul double %109, %111
  %113 = fadd double %106, %112
  store double %113, double* %97, align 8, !tbaa !1
  %114 = add nsw i64 %100, 2
  %115 = icmp eq i64 %114, 1000
  br i1 %115, label %117, label %._crit_edge4

._crit_edge4:                                     ; preds = %98
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 4)
  %116 = add i64 %pgocount15, 1
  store i64 %116, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 4)
  br label %98

; <label>:117:                                    ; preds = %98
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 8)
  %118 = add i64 %pgocount16, 1
  store i64 %118, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 8)
  %119 = add nuw nsw i64 %96, 1
  %120 = icmp eq i64 %119, 900
  br i1 %120, label %121, label %95

; <label>:121:                                    ; preds = %117
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 15)
  %122 = add i64 %pgocount17, 1
  store i64 %122, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 15)
  %123 = add nuw nsw i64 %94, 1
  %124 = icmp eq i64 %123, 800
  br i1 %124, label %125, label %93

; <label>:125:                                    ; preds = %121
  %126 = bitcast i8* %9 to [1100 x double]*
  br label %127

; <label>:127:                                    ; preds = %162, %125
  %128 = phi i64 [ %164, %162 ], [ 0, %125 ]
  br label %129

; <label>:129:                                    ; preds = %158, %127
  %130 = phi i64 [ 0, %127 ], [ %160, %158 ]
  %131 = getelementptr inbounds [1100 x double], [1100 x double]* %92, i64 %128, i64 %130
  store double 0.000000e+00, double* %131, align 8, !tbaa !1
  br label %132

; <label>:132:                                    ; preds = %._crit_edge5, %129
  %133 = phi double [ 0.000000e+00, %129 ], [ %154, %._crit_edge5 ]
  %134 = phi i64 [ 0, %129 ], [ %155, %._crit_edge5 ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %128, i64 %134
  %136 = load double, double* %135, align 8, !tbaa !1
  %137 = getelementptr inbounds [1100 x double], [1100 x double]* %32, i64 %134, i64 %130
  %138 = load double, double* %137, align 8, !tbaa !1
  %139 = fmul double %136, %138
  %140 = fadd double %133, %139
  store double %140, double* %131, align 8, !tbaa !1
  %141 = add nuw nsw i64 %134, 1
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %128, i64 %141
  %143 = load double, double* %142, align 8, !tbaa !1
  %144 = getelementptr inbounds [1100 x double], [1100 x double]* %32, i64 %141, i64 %130
  %145 = load double, double* %144, align 8, !tbaa !1
  %146 = fmul double %143, %145
  %147 = fadd double %140, %146
  store double %147, double* %131, align 8, !tbaa !1
  %148 = add nsw i64 %134, 2
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %128, i64 %148
  %150 = load double, double* %149, align 8, !tbaa !1
  %151 = getelementptr inbounds [1100 x double], [1100 x double]* %32, i64 %148, i64 %130
  %152 = load double, double* %151, align 8, !tbaa !1
  %153 = fmul double %150, %152
  %154 = fadd double %147, %153
  store double %154, double* %131, align 8, !tbaa !1
  %155 = add nsw i64 %134, 3
  %156 = icmp eq i64 %155, 1200
  br i1 %156, label %158, label %._crit_edge5

._crit_edge5:                                     ; preds = %132
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 5)
  %157 = add i64 %pgocount18, 1
  store i64 %157, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 5)
  br label %132

; <label>:158:                                    ; preds = %132
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 9)
  %159 = add i64 %pgocount19, 1
  store i64 %159, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 9)
  %160 = add nuw nsw i64 %130, 1
  %161 = icmp eq i64 %160, 1100
  br i1 %161, label %162, label %129

; <label>:162:                                    ; preds = %158
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 16)
  %163 = add i64 %pgocount20, 1
  store i64 %163, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 16)
  %164 = add nuw nsw i64 %128, 1
  %165 = icmp eq i64 %164, 900
  br i1 %165, label %166, label %127

; <label>:166:                                    ; preds = %162
  br label %167

; <label>:167:                                    ; preds = %202, %166
  %168 = phi i64 [ %204, %202 ], [ 0, %166 ]
  br label %169

; <label>:169:                                    ; preds = %198, %167
  %170 = phi i64 [ 0, %167 ], [ %200, %198 ]
  %171 = getelementptr inbounds [1100 x double], [1100 x double]* %126, i64 %168, i64 %170
  store double 0.000000e+00, double* %171, align 8, !tbaa !1
  br label %172

; <label>:172:                                    ; preds = %._crit_edge6, %169
  %173 = phi double [ 0.000000e+00, %169 ], [ %194, %._crit_edge6 ]
  %174 = phi i64 [ 0, %169 ], [ %195, %._crit_edge6 ]
  %175 = getelementptr inbounds [900 x double], [900 x double]* %91, i64 %168, i64 %174
  %176 = load double, double* %175, align 8, !tbaa !1
  %177 = getelementptr inbounds [1100 x double], [1100 x double]* %92, i64 %174, i64 %170
  %178 = load double, double* %177, align 8, !tbaa !1
  %179 = fmul double %176, %178
  %180 = fadd double %173, %179
  store double %180, double* %171, align 8, !tbaa !1
  %181 = add nuw nsw i64 %174, 1
  %182 = getelementptr inbounds [900 x double], [900 x double]* %91, i64 %168, i64 %181
  %183 = load double, double* %182, align 8, !tbaa !1
  %184 = getelementptr inbounds [1100 x double], [1100 x double]* %92, i64 %181, i64 %170
  %185 = load double, double* %184, align 8, !tbaa !1
  %186 = fmul double %183, %185
  %187 = fadd double %180, %186
  store double %187, double* %171, align 8, !tbaa !1
  %188 = add nsw i64 %174, 2
  %189 = getelementptr inbounds [900 x double], [900 x double]* %91, i64 %168, i64 %188
  %190 = load double, double* %189, align 8, !tbaa !1
  %191 = getelementptr inbounds [1100 x double], [1100 x double]* %92, i64 %188, i64 %170
  %192 = load double, double* %191, align 8, !tbaa !1
  %193 = fmul double %190, %192
  %194 = fadd double %187, %193
  store double %194, double* %171, align 8, !tbaa !1
  %195 = add nsw i64 %174, 3
  %196 = icmp eq i64 %195, 900
  br i1 %196, label %198, label %._crit_edge6

._crit_edge6:                                     ; preds = %172
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 6)
  %197 = add i64 %pgocount21, 1
  store i64 %197, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 6)
  br label %172

; <label>:198:                                    ; preds = %172
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 10)
  %199 = add i64 %pgocount22, 1
  store i64 %199, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 10)
  %200 = add nuw nsw i64 %170, 1
  %201 = icmp eq i64 %200, 1100
  br i1 %201, label %202, label %169

; <label>:202:                                    ; preds = %198
  %pgocount23 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 17)
  %203 = add i64 %pgocount23, 1
  store i64 %203, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 17)
  %204 = add nuw nsw i64 %168, 1
  %205 = icmp eq i64 %204, 800
  br i1 %205, label %206, label %167

; <label>:206:                                    ; preds = %202
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %207 = icmp sgt i32 %0, 42
  br i1 %207, label %208, label %249

; <label>:208:                                    ; preds = %206
  %pgocount24 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 20)
  %209 = add i64 %pgocount24, 1
  store i64 %209, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 20)
  %210 = load i8*, i8** %1, align 8, !tbaa !5
  %211 = load i8, i8* %210, align 1, !tbaa !7
  %212 = icmp eq i8 %211, 0
  br i1 %212, label %213, label %249

; <label>:213:                                    ; preds = %208
  %214 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %215 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %214) #4
  %216 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %217 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %216, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %218

; <label>:218:                                    ; preds = %239, %213
  %219 = phi i64 [ 0, %213 ], [ %241, %239 ]
  %220 = mul nuw nsw i64 %219, 800
  br label %221

; <label>:221:                                    ; preds = %232, %218
  %222 = phi i64 [ 0, %218 ], [ %237, %232 ]
  %223 = add nuw nsw i64 %222, %220
  %224 = trunc i64 %223 to i32
  %225 = srem i32 %224, 20
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %228, label %._crit_edge7

._crit_edge7:                                     ; preds = %221
  %pgocount25 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 7)
  %227 = add i64 %pgocount25, 1
  store i64 %227, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 7)
  br label %232

; <label>:228:                                    ; preds = %221
  %pgocount26 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 18)
  %229 = add i64 %pgocount26, 1
  store i64 %229, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 18)
  %230 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %231 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %230) #4
  br label %232

; <label>:232:                                    ; preds = %228, %._crit_edge7
  %233 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %234 = getelementptr inbounds [1100 x double], [1100 x double]* %126, i64 %219, i64 %222
  %235 = load double, double* %234, align 8, !tbaa !1
  %236 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %233, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %235) #4
  %237 = add nuw nsw i64 %222, 1
  %238 = icmp eq i64 %237, 1100
  br i1 %238, label %239, label %221

; <label>:239:                                    ; preds = %232
  %pgocount27 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 21)
  %240 = add i64 %pgocount27, 1
  store i64 %240, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 21)
  %241 = add nuw nsw i64 %219, 1
  %242 = icmp eq i64 %241, 800
  br i1 %242, label %243, label %218

; <label>:243:                                    ; preds = %239
  %pgocount28 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 22)
  %244 = add i64 %pgocount28, 1
  store i64 %244, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 22)
  %245 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %246 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %245, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %247 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %248 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %247) #4
  br label %249

; <label>:249:                                    ; preds = %243, %208, %206
  %pgocount29 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 19)
  %250 = add i64 %pgocount29, 1
  store i64 %250, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_main, i64 0, i64 19)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* %7) #3
  tail call void @free(i8* %8) #3
  tail call void @free(i8* nonnull %9) #3
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
