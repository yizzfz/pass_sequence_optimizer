; ModuleID = 'B.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 233975655892, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %6 = bitcast i8* %3 to [1100 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %22, %2
  %9 = phi i64 [ 0, %2 ], [ %24, %22 ]
  br label %10

; <label>:10:                                     ; preds = %._crit_edge, %8
  %11 = phi i64 [ 0, %8 ], [ %19, %._crit_edge ]
  %12 = mul nuw nsw i64 %11, %9
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+03
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %9, i64 %11
  store double %17, double* %18, align 8, !tbaa !1
  %19 = add nuw nsw i64 %11, 1
  %20 = icmp eq i64 %19, 1100
  br i1 %20, label %22, label %._crit_edge

._crit_edge:                                      ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 0)
  br label %10

; <label>:22:                                     ; preds = %10
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 9)
  %23 = add i64 %pgocount6, 1
  store i64 %23, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 9)
  %24 = add nuw nsw i64 %9, 1
  %25 = icmp eq i64 %24, 1000
  br i1 %25, label %26, label %8

; <label>:26:                                     ; preds = %22
  %27 = bitcast i8* %5 to [1100 x double]*
  br label %28

; <label>:28:                                     ; preds = %48, %26
  %29 = phi i64 [ %50, %48 ], [ 0, %26 ]
  br label %30

; <label>:30:                                     ; preds = %._crit_edge1, %28
  %31 = phi i64 [ 0, %28 ], [ %39, %._crit_edge1 ]
  %32 = or i64 %31, 1
  %33 = mul nuw nsw i64 %32, %29
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 1200
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.200000e+03
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %29, i64 %31
  store double %37, double* %38, align 8, !tbaa !1
  %39 = add nsw i64 %31, 2
  %40 = mul nuw nsw i64 %39, %29
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 1200
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, 1.200000e+03
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %29, i64 %32
  store double %44, double* %45, align 8, !tbaa !1
  %46 = icmp eq i64 %39, 1200
  br i1 %46, label %48, label %._crit_edge1

._crit_edge1:                                     ; preds = %30
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 1)
  %47 = add i64 %pgocount7, 1
  store i64 %47, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 1)
  br label %30

; <label>:48:                                     ; preds = %30
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 10)
  %49 = add i64 %pgocount8, 1
  store i64 %49, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 10)
  %50 = add nuw nsw i64 %29, 1
  %51 = icmp eq i64 %50, 1000
  br i1 %51, label %52, label %28

; <label>:52:                                     ; preds = %48
  br label %53

; <label>:53:                                     ; preds = %67, %52
  %54 = phi i64 [ %69, %67 ], [ 0, %52 ]
  br label %55

; <label>:55:                                     ; preds = %._crit_edge2, %53
  %56 = phi i64 [ 0, %53 ], [ %64, %._crit_edge2 ]
  %57 = add nuw nsw i64 %56, 2
  %58 = mul nuw nsw i64 %57, %54
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, 1100
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, 1.100000e+03
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %27, i64 %54, i64 %56
  store double %62, double* %63, align 8, !tbaa !1
  %64 = add nuw nsw i64 %56, 1
  %65 = icmp eq i64 %64, 1100
  br i1 %65, label %67, label %._crit_edge2

._crit_edge2:                                     ; preds = %55
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 2)
  %66 = add i64 %pgocount9, 1
  store i64 %66, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 2)
  br label %55

; <label>:67:                                     ; preds = %55
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 11)
  %68 = add i64 %pgocount10, 1
  store i64 %68, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 11)
  %69 = add nuw nsw i64 %54, 1
  %70 = icmp eq i64 %69, 1200
  br i1 %70, label %71, label %53

; <label>:71:                                     ; preds = %67
  tail call void (...) @polybench_timer_start() #3
  br label %72

; <label>:72:                                     ; preds = %170, %71
  %73 = phi i64 [ 0, %71 ], [ %172, %170 ]
  %74 = mul i64 %73, 8800
  %75 = getelementptr i8, i8* %3, i64 %74
  %76 = add i64 %74, 8800
  %77 = getelementptr i8, i8* %3, i64 %76
  br label %78

; <label>:78:                                     ; preds = %219, %72
  %79 = phi i64 [ 0, %72 ], [ %231, %219 ]
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %73, i64 %79
  %81 = bitcast double* %80 to <2 x double>*
  %82 = load <2 x double>, <2 x double>* %81, align 8, !tbaa !1
  %83 = getelementptr double, double* %80, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %85 = load <2 x double>, <2 x double>* %84, align 8, !tbaa !1
  %86 = fmul <2 x double> %82, <double 1.200000e+00, double 1.200000e+00>
  %87 = fmul <2 x double> %85, <double 1.200000e+00, double 1.200000e+00>
  %88 = bitcast double* %80 to <2 x double>*
  store <2 x double> %86, <2 x double>* %88, align 8, !tbaa !1
  %89 = bitcast double* %83 to <2 x double>*
  store <2 x double> %87, <2 x double>* %89, align 8, !tbaa !1
  %90 = or i64 %79, 4
  %91 = icmp eq i64 %90, 1100
  br i1 %91, label %92, label %219, !llvm.loop !5

; <label>:92:                                     ; preds = %78
  br label %93

; <label>:93:                                     ; preds = %167, %92
  %94 = phi i64 [ %168, %167 ], [ 0, %92 ]
  %95 = mul i64 %94, 8800
  %96 = getelementptr i8, i8* %5, i64 %95
  %97 = add i64 %95, 8800
  %98 = getelementptr i8, i8* %5, i64 %97
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %73, i64 %94
  %100 = bitcast double* %99 to i8*
  %101 = bitcast double* %99 to i8*
  %102 = icmp ult i8* %75, %101
  %103 = icmp ult i8* %100, %77
  %104 = and i1 %102, %103
  %105 = icmp ult i8* %75, %98
  %106 = icmp ult i8* %96, %77
  %107 = and i1 %105, %106
  %108 = or i1 %104, %107
  br i1 %108, label %117, label %109

; <label>:109:                                    ; preds = %93
  %110 = load double, double* %99, align 8, !tbaa !1, !alias.scope !8
  %111 = insertelement <2 x double> undef, double %110, i32 0
  %112 = insertelement <2 x double> %111, double %110, i32 1
  %113 = insertelement <2 x double> undef, double %110, i32 0
  %114 = insertelement <2 x double> %113, double %110, i32 1
  %115 = fmul <2 x double> %112, <double 1.500000e+00, double 1.500000e+00>
  %116 = fmul <2 x double> %114, <double 1.500000e+00, double 1.500000e+00>
  br label %118

; <label>:117:                                    ; preds = %93
  br label %141

; <label>:118:                                    ; preds = %._crit_edge3, %109
  %119 = phi i64 [ %138, %._crit_edge3 ], [ 0, %109 ]
  %120 = getelementptr inbounds [1100 x double], [1100 x double]* %27, i64 %94, i64 %119
  %121 = bitcast double* %120 to <2 x double>*
  %122 = load <2 x double>, <2 x double>* %121, align 8, !tbaa !1, !alias.scope !11
  %123 = getelementptr double, double* %120, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %125 = load <2 x double>, <2 x double>* %124, align 8, !tbaa !1, !alias.scope !11
  %126 = fmul <2 x double> %115, %122
  %127 = fmul <2 x double> %116, %125
  %128 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %73, i64 %119
  %129 = bitcast double* %128 to <2 x double>*
  %130 = load <2 x double>, <2 x double>* %129, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %131 = getelementptr double, double* %128, i64 2
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %134 = fadd <2 x double> %130, %126
  %135 = fadd <2 x double> %133, %127
  %136 = bitcast double* %128 to <2 x double>*
  store <2 x double> %134, <2 x double>* %136, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %137 = bitcast double* %131 to <2 x double>*
  store <2 x double> %135, <2 x double>* %137, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %138 = add i64 %119, 4
  %139 = icmp eq i64 %138, 1100
  br i1 %139, label %165, label %._crit_edge3, !llvm.loop !16

._crit_edge3:                                     ; preds = %118
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 3)
  %140 = add i64 %pgocount11, 1
  store i64 %140, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 3)
  br label %118

; <label>:141:                                    ; preds = %._crit_edge4, %117
  %142 = phi i64 [ 0, %117 ], [ %160, %._crit_edge4 ]
  %143 = load double, double* %99, align 8, !tbaa !1
  %144 = fmul double %143, 1.500000e+00
  %145 = getelementptr inbounds [1100 x double], [1100 x double]* %27, i64 %94, i64 %142
  %146 = load double, double* %145, align 8, !tbaa !1
  %147 = fmul double %144, %146
  %148 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %73, i64 %142
  %149 = load double, double* %148, align 8, !tbaa !1
  %150 = fadd double %149, %147
  store double %150, double* %148, align 8, !tbaa !1
  %151 = or i64 %142, 1
  %152 = load double, double* %99, align 8, !tbaa !1
  %153 = fmul double %152, 1.500000e+00
  %154 = getelementptr inbounds [1100 x double], [1100 x double]* %27, i64 %94, i64 %151
  %155 = load double, double* %154, align 8, !tbaa !1
  %156 = fmul double %153, %155
  %157 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %73, i64 %151
  %158 = load double, double* %157, align 8, !tbaa !1
  %159 = fadd double %158, %156
  store double %159, double* %157, align 8, !tbaa !1
  %160 = add nsw i64 %142, 2
  %161 = icmp eq i64 %160, 1100
  br i1 %161, label %163, label %._crit_edge4, !llvm.loop !17

._crit_edge4:                                     ; preds = %141
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 4)
  %162 = add i64 %pgocount12, 1
  store i64 %162, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 4)
  br label %141

; <label>:163:                                    ; preds = %141
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 7)
  %164 = add i64 %pgocount13, 1
  store i64 %164, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 7)
  br label %167

; <label>:165:                                    ; preds = %118
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 8)
  %166 = add i64 %pgocount14, 1
  store i64 %166, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 8)
  br label %167

; <label>:167:                                    ; preds = %165, %163
  %168 = add nuw nsw i64 %94, 1
  %169 = icmp eq i64 %168, 1200
  br i1 %169, label %170, label %93

; <label>:170:                                    ; preds = %167
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 12)
  %171 = add i64 %pgocount15, 1
  store i64 %171, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 12)
  %172 = add nuw nsw i64 %73, 1
  %173 = icmp eq i64 %172, 1000
  br i1 %173, label %174, label %72

; <label>:174:                                    ; preds = %170
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %175 = icmp sgt i32 %0, 42
  br i1 %175, label %176, label %217

; <label>:176:                                    ; preds = %174
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 15)
  %177 = add i64 %pgocount16, 1
  store i64 %177, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 15)
  %178 = load i8*, i8** %1, align 8, !tbaa !18
  %179 = load i8, i8* %178, align 1, !tbaa !20
  %180 = icmp eq i8 %179, 0
  br i1 %180, label %181, label %217

; <label>:181:                                    ; preds = %176
  %182 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %183 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %182) #4
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %185 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %184, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %186

; <label>:186:                                    ; preds = %207, %181
  %187 = phi i64 [ 0, %181 ], [ %209, %207 ]
  %188 = mul nuw nsw i64 %187, 1000
  br label %189

; <label>:189:                                    ; preds = %200, %186
  %190 = phi i64 [ 0, %186 ], [ %205, %200 ]
  %191 = add nuw nsw i64 %190, %188
  %192 = trunc i64 %191 to i32
  %193 = srem i32 %192, 20
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %196, label %._crit_edge5

._crit_edge5:                                     ; preds = %189
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 5)
  %195 = add i64 %pgocount17, 1
  store i64 %195, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 5)
  br label %200

; <label>:196:                                    ; preds = %189
  %pgocount18 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 13)
  %197 = add i64 %pgocount18, 1
  store i64 %197, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 13)
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %199 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %198) #4
  br label %200

; <label>:200:                                    ; preds = %._crit_edge5, %196
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %202 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %187, i64 %190
  %203 = load double, double* %202, align 8, !tbaa !1
  %204 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %201, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %203) #4
  %205 = add nuw nsw i64 %190, 1
  %206 = icmp eq i64 %205, 1100
  br i1 %206, label %207, label %189

; <label>:207:                                    ; preds = %200
  %pgocount19 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 16)
  %208 = add i64 %pgocount19, 1
  store i64 %208, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 16)
  %209 = add nuw nsw i64 %187, 1
  %210 = icmp eq i64 %209, 1000
  br i1 %210, label %211, label %186

; <label>:211:                                    ; preds = %207
  %pgocount20 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 17)
  %212 = add i64 %pgocount20, 1
  store i64 %212, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 17)
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %214 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %213, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %215 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %216 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %215) #4
  br label %217

; <label>:217:                                    ; preds = %211, %176, %174
  %pgocount21 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 14)
  %218 = add i64 %pgocount21, 1
  store i64 %218, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 14)
  tail call void @free(i8* nonnull %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0

; <label>:219:                                    ; preds = %78
  %pgocount22 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 6)
  %220 = add i64 %pgocount22, 1
  store i64 %220, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 6)
  %221 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %73, i64 %90
  %222 = bitcast double* %221 to <2 x double>*
  %223 = load <2 x double>, <2 x double>* %222, align 8, !tbaa !1
  %224 = getelementptr double, double* %221, i64 2
  %225 = bitcast double* %224 to <2 x double>*
  %226 = load <2 x double>, <2 x double>* %225, align 8, !tbaa !1
  %227 = fmul <2 x double> %223, <double 1.200000e+00, double 1.200000e+00>
  %228 = fmul <2 x double> %226, <double 1.200000e+00, double 1.200000e+00>
  %229 = bitcast double* %221 to <2 x double>*
  store <2 x double> %227, <2 x double>* %229, align 8, !tbaa !1
  %230 = bitcast double* %224 to <2 x double>*
  store <2 x double> %228, <2 x double>* %230, align 8, !tbaa !1
  %231 = add nsw i64 %79, 8
  br label %78
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !6, !7}
!17 = distinct !{!17, !6, !7}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !3, i64 0}
!20 = !{!3, !3, i64 0}
