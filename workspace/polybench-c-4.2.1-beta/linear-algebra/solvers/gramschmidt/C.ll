; ModuleID = 'B.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 235318792420, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %24, %2
  %9 = phi i64 [ 0, %2 ], [ %26, %24 ]
  br label %10

; <label>:10:                                     ; preds = %._crit_edge, %8
  %11 = phi i64 [ 0, %8 ], [ %21, %._crit_edge ]
  %12 = mul nuw nsw i64 %11, %9
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %9, i64 %11
  store double %18, double* %19, align 8, !tbaa !1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %11
  store double 0.000000e+00, double* %20, align 8, !tbaa !1
  %21 = add nuw nsw i64 %11, 1
  %22 = icmp eq i64 %21, 1200
  br i1 %22, label %24, label %._crit_edge

._crit_edge:                                      ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 0)
  br label %10

; <label>:24:                                     ; preds = %10
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 8)
  %25 = add i64 %pgocount5, 1
  store i64 %25, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 8)
  %26 = add nuw nsw i64 %9, 1
  %27 = icmp eq i64 %26, 1000
  br i1 %27, label %28, label %8

; <label>:28:                                     ; preds = %24
  %29 = bitcast i8* %4 to [1200 x double]*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 11520000, i32 8, i1 false) #3
  tail call void (...) @polybench_timer_start() #3
  br label %35

; <label>:30:                                     ; preds = %128
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 10)
  %31 = add i64 %pgocount6, 1
  store i64 %31, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 10)
  br label %32

; <label>:32:                                     ; preds = %84, %30
  %33 = add nuw nsw i64 %37, 1
  %34 = icmp eq i64 %86, 1200
  br i1 %34, label %132, label %35

; <label>:35:                                     ; preds = %32, %28
  %36 = phi i64 [ 0, %28 ], [ %86, %32 ]
  %37 = phi i64 [ 1, %28 ], [ %33, %32 ]
  br label %38

; <label>:38:                                     ; preds = %._crit_edge1, %35
  %39 = phi i64 [ 0, %35 ], [ %65, %._crit_edge1 ]
  %40 = phi double [ 0.000000e+00, %35 ], [ %64, %._crit_edge1 ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %39, i64 %36
  %42 = load double, double* %41, align 8, !tbaa !1
  %43 = fmul double %42, %42
  %44 = fadd double %40, %43
  %45 = add nuw nsw i64 %39, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %45, i64 %36
  %47 = load double, double* %46, align 8, !tbaa !1
  %48 = fmul double %47, %47
  %49 = fadd double %44, %48
  %50 = add nsw i64 %39, 2
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %50, i64 %36
  %52 = load double, double* %51, align 8, !tbaa !1
  %53 = fmul double %52, %52
  %54 = fadd double %49, %53
  %55 = add nsw i64 %39, 3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %55, i64 %36
  %57 = load double, double* %56, align 8, !tbaa !1
  %58 = fmul double %57, %57
  %59 = fadd double %54, %58
  %60 = add nsw i64 %39, 4
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %60, i64 %36
  %62 = load double, double* %61, align 8, !tbaa !1
  %63 = fmul double %62, %62
  %64 = fadd double %59, %63
  %65 = add nsw i64 %39, 5
  %66 = icmp eq i64 %65, 1000
  br i1 %66, label %68, label %._crit_edge1

._crit_edge1:                                     ; preds = %38
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 1)
  %67 = add i64 %pgocount7, 1
  store i64 %67, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 1)
  br label %38

; <label>:68:                                     ; preds = %38
  %69 = tail call double @sqrt(double %64) #3
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %36, i64 %36
  store double %69, double* %70, align 8, !tbaa !1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %36
  %72 = load double, double* %71, align 8, !tbaa !1
  %73 = fdiv double %72, %69
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 0, i64 %36
  store double %73, double* %74, align 8, !tbaa !1
  br label %75

; <label>:75:                                     ; preds = %207, %68
  %76 = phi i64 [ 1, %68 ], [ %214, %207 ]
  %77 = load double, double* %70, align 8, !tbaa !1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %76, i64 %36
  %79 = load double, double* %78, align 8, !tbaa !1
  %80 = fdiv double %79, %77
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %76, i64 %36
  store double %80, double* %81, align 8, !tbaa !1
  %82 = add nuw nsw i64 %76, 1
  %83 = icmp eq i64 %82, 1000
  br i1 %83, label %84, label %207

; <label>:84:                                     ; preds = %75
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 9)
  %85 = add i64 %pgocount8, 1
  store i64 %85, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 9)
  %86 = add nuw nsw i64 %36, 1
  %87 = icmp slt i64 %86, 1200
  br i1 %87, label %88, label %32

; <label>:88:                                     ; preds = %84
  br label %89

; <label>:89:                                     ; preds = %128, %88
  %90 = phi i64 [ %130, %128 ], [ %37, %88 ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %36, i64 %90
  store double 0.000000e+00, double* %91, align 8, !tbaa !1
  br label %92

; <label>:92:                                     ; preds = %._crit_edge2, %89
  %93 = phi double [ 0.000000e+00, %89 ], [ %107, %._crit_edge2 ]
  %94 = phi i64 [ 0, %89 ], [ %108, %._crit_edge2 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %94, i64 %36
  %96 = load double, double* %95, align 8, !tbaa !1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %94, i64 %90
  %98 = load double, double* %97, align 8, !tbaa !1
  %99 = fmul double %96, %98
  %100 = fadd double %93, %99
  store double %100, double* %91, align 8, !tbaa !1
  %101 = or i64 %94, 1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %101, i64 %36
  %103 = load double, double* %102, align 8, !tbaa !1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %101, i64 %90
  %105 = load double, double* %104, align 8, !tbaa !1
  %106 = fmul double %103, %105
  %107 = fadd double %100, %106
  store double %107, double* %91, align 8, !tbaa !1
  %108 = add nsw i64 %94, 2
  %109 = icmp eq i64 %108, 1000
  br i1 %109, label %111, label %._crit_edge2

._crit_edge2:                                     ; preds = %92
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 2)
  %110 = add i64 %pgocount9, 1
  store i64 %110, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 2)
  br label %92

; <label>:111:                                    ; preds = %92
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %90
  %113 = load double, double* %112, align 8, !tbaa !1
  %114 = load double, double* %74, align 8, !tbaa !1
  %115 = fmul double %107, %114
  %116 = fsub double %113, %115
  store double %116, double* %112, align 8, !tbaa !1
  br label %117

; <label>:117:                                    ; preds = %215, %111
  %118 = phi i64 [ 1, %111 ], [ %224, %215 ]
  %119 = load double, double* %91, align 8, !tbaa !1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %118, i64 %90
  %121 = load double, double* %120, align 8, !tbaa !1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %118, i64 %36
  %123 = load double, double* %122, align 8, !tbaa !1
  %124 = fmul double %119, %123
  %125 = fsub double %121, %124
  store double %125, double* %120, align 8, !tbaa !1
  %126 = add nuw nsw i64 %118, 1
  %127 = icmp eq i64 %126, 1000
  br i1 %127, label %128, label %215

; <label>:128:                                    ; preds = %117
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 7)
  %129 = add i64 %pgocount10, 1
  store i64 %129, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 7)
  %130 = add nuw nsw i64 %90, 1
  %131 = icmp eq i64 %130, 1200
  br i1 %131, label %30, label %89

; <label>:132:                                    ; preds = %32
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %133 = icmp sgt i32 %0, 42
  br i1 %133, label %134, label %205

; <label>:134:                                    ; preds = %132
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 14)
  %135 = add i64 %pgocount11, 1
  store i64 %135, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 14)
  %136 = load i8*, i8** %1, align 8, !tbaa !5
  %137 = load i8, i8* %136, align 1, !tbaa !7
  %138 = icmp eq i8 %137, 0
  br i1 %138, label %139, label %205

; <label>:139:                                    ; preds = %134
  %140 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %141 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %140) #5
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %143 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %142, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %144

; <label>:144:                                    ; preds = %165, %139
  %145 = phi i64 [ 0, %139 ], [ %167, %165 ]
  %146 = mul nuw nsw i64 %145, 1200
  br label %147

; <label>:147:                                    ; preds = %158, %144
  %148 = phi i64 [ 0, %144 ], [ %163, %158 ]
  %149 = add nuw nsw i64 %148, %146
  %150 = trunc i64 %149 to i32
  %151 = srem i32 %150, 20
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %154, label %._crit_edge3

._crit_edge3:                                     ; preds = %147
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 4)
  %153 = add i64 %pgocount12, 1
  store i64 %153, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 4)
  br label %158

; <label>:154:                                    ; preds = %147
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 11)
  %155 = add i64 %pgocount13, 1
  store i64 %155, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 11)
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %157 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %156) #5
  br label %158

; <label>:158:                                    ; preds = %._crit_edge3, %154
  %159 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %145, i64 %148
  %161 = load double, double* %160, align 8, !tbaa !1
  %162 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %159, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %161) #5
  %163 = add nuw nsw i64 %148, 1
  %164 = icmp eq i64 %163, 1200
  br i1 %164, label %165, label %147

; <label>:165:                                    ; preds = %158
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 15)
  %166 = add i64 %pgocount14, 1
  store i64 %166, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 15)
  %167 = add nuw nsw i64 %145, 1
  %168 = icmp eq i64 %167, 1200
  br i1 %168, label %169, label %144

; <label>:169:                                    ; preds = %165
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %171 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %170, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %172 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %173 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %172, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %174

; <label>:174:                                    ; preds = %195, %169
  %175 = phi i64 [ 0, %169 ], [ %197, %195 ]
  %176 = mul nuw nsw i64 %175, 1200
  br label %177

; <label>:177:                                    ; preds = %188, %174
  %178 = phi i64 [ 0, %174 ], [ %193, %188 ]
  %179 = add nuw nsw i64 %178, %176
  %180 = trunc i64 %179 to i32
  %181 = srem i32 %180, 20
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %184, label %._crit_edge4

._crit_edge4:                                     ; preds = %177
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 5)
  %183 = add i64 %pgocount15, 1
  store i64 %183, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 5)
  br label %188

; <label>:184:                                    ; preds = %177
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 12)
  %185 = add i64 %pgocount16, 1
  store i64 %185, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 12)
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %187 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %186) #5
  br label %188

; <label>:188:                                    ; preds = %._crit_edge4, %184
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %175, i64 %178
  %191 = load double, double* %190, align 8, !tbaa !1
  %192 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %189, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %191) #5
  %193 = add nuw nsw i64 %178, 1
  %194 = icmp eq i64 %193, 1200
  br i1 %194, label %195, label %177

; <label>:195:                                    ; preds = %188
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 16)
  %196 = add i64 %pgocount17, 1
  store i64 %196, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 16)
  %197 = add nuw nsw i64 %175, 1
  %198 = icmp eq i64 %197, 1000
  br i1 %198, label %199, label %174

; <label>:199:                                    ; preds = %195
  %pgocount18 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 17)
  %200 = add i64 %pgocount18, 1
  store i64 %200, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 17)
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %202 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %201, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  %203 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %204 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %203) #5
  br label %205

; <label>:205:                                    ; preds = %199, %134, %132
  %pgocount19 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 13)
  %206 = add i64 %pgocount19, 1
  store i64 %206, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 13)
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* nonnull %5) #3
  ret i32 0

; <label>:207:                                    ; preds = %75
  %pgocount20 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 6)
  %208 = add i64 %pgocount20, 1
  store i64 %208, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 6)
  %209 = load double, double* %70, align 8, !tbaa !1
  %210 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %82, i64 %36
  %211 = load double, double* %210, align 8, !tbaa !1
  %212 = fdiv double %211, %209
  %213 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %82, i64 %36
  store double %212, double* %213, align 8, !tbaa !1
  %214 = add nsw i64 %76, 2
  br label %75

; <label>:215:                                    ; preds = %117
  %pgocount21 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 3)
  %216 = add i64 %pgocount21, 1
  store i64 %216, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main, i64 0, i64 3)
  %217 = load double, double* %91, align 8, !tbaa !1
  %218 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %126, i64 %90
  %219 = load double, double* %218, align 8, !tbaa !1
  %220 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %126, i64 %36
  %221 = load double, double* %220, align 8, !tbaa !1
  %222 = fmul double %217, %221
  %223 = fsub double %219, %222
  store double %223, double* %218, align 8, !tbaa !1
  %224 = add nsw i64 %118, 2
  br label %117
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
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
