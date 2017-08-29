; ModuleID = 'psymodel.2.ll'
source_filename = "psymodel.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }

$__llvm_profile_raw_version = comdat any

@L3psycho_anal.minval = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.qthr_l = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.qthr_s = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.nb_1 = internal global [4 x [63 x double]] zeroinitializer, align 16
@L3psycho_anal.nb_2 = internal global [4 x [63 x double]] zeroinitializer, align 16
@L3psycho_anal.s3_s = internal global [64 x [64 x double]] zeroinitializer, align 16
@L3psycho_anal.s3_l = internal global [64 x [64 x double]] zeroinitializer, align 16
@L3psycho_anal.thm = internal global [4 x %struct.III_psy_xmin] zeroinitializer, align 16
@L3psycho_anal.en = internal global [4 x %struct.III_psy_xmin] zeroinitializer, align 16
@L3psycho_anal.cw_upper_index = internal global i32 0, align 4
@L3psycho_anal.cw_lower_index = internal global i32 0, align 4
@L3psycho_anal.ax_sav = internal global [4 x [2 x [513 x float]]] zeroinitializer, align 16
@L3psycho_anal.bx_sav = internal global [4 x [2 x [513 x float]]] zeroinitializer, align 16
@L3psycho_anal.rx_sav = internal global [4 x [2 x [513 x float]]] zeroinitializer, align 16
@L3psycho_anal.cw = internal global [513 x float] zeroinitializer, align 16
@L3psycho_anal.wsamp_L = internal global [2 x [1024 x float]] zeroinitializer, align 16
@L3psycho_anal.energy = internal global [513 x float] zeroinitializer, align 16
@L3psycho_anal.wsamp_S = internal global [2 x [3 x [256 x float]]] zeroinitializer, align 16
@L3psycho_anal.energy_s = internal global [3 x [129 x float]] zeroinitializer, align 16
@L3psycho_anal.eb = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.cb = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.thr = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.w1_l = internal global [21 x double] zeroinitializer, align 16
@L3psycho_anal.w2_l = internal global [21 x double] zeroinitializer, align 16
@L3psycho_anal.w1_s = internal global [12 x double] zeroinitializer, align 16
@L3psycho_anal.w2_s = internal global [12 x double] zeroinitializer, align 16
@L3psycho_anal.mld_l = internal global [21 x double] zeroinitializer, align 16
@L3psycho_anal.mld_s = internal global [12 x double] zeroinitializer, align 16
@L3psycho_anal.bu_l = internal global [21 x i32] zeroinitializer, align 16
@L3psycho_anal.bo_l = internal global [21 x i32] zeroinitializer, align 16
@L3psycho_anal.bu_s = internal global [12 x i32] zeroinitializer, align 16
@L3psycho_anal.bo_s = internal global [12 x i32] zeroinitializer, align 16
@L3psycho_anal.npart_l = internal global i32 0, align 4
@L3psycho_anal.npart_s = internal global i32 0, align 4
@L3psycho_anal.npart_l_orig = internal global i32 0, align 4
@L3psycho_anal.npart_s_orig = internal global i32 0, align 4
@L3psycho_anal.s3ind = internal global [63 x [2 x i32]] zeroinitializer, align 16
@L3psycho_anal.s3ind_s = internal global [63 x [2 x i32]] zeroinitializer, align 16
@L3psycho_anal.numlines_s = internal global [63 x i32] zeroinitializer, align 16
@L3psycho_anal.numlines_l = internal global [63 x i32] zeroinitializer, align 16
@L3psycho_anal.partition_l = internal global [513 x i32] zeroinitializer, align 16
@L3psycho_anal.pe = internal global [4 x double] zeroinitializer, align 16
@L3psycho_anal.ms_ratio_s_old = internal global double 0.000000e+00, align 8
@L3psycho_anal.ms_ratio_l_old = internal global double 0.000000e+00, align 8
@L3psycho_anal.ms_ener_ratio_old = internal global double 2.500000e-01, align 8
@L3psycho_anal.blocktype_old = internal global [2 x i32] zeroinitializer, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [42 x i8] c"error, invalid sampling frequency: %d Hz\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Error in block selecting\0A\00", align 1
@psy_data = external global [0 x double], align 8
@.str.2 = private unnamed_addr constant [27 x i8] c"1. please check \22psy_data\22\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"3. please check \22psy_data\22\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"30:please check \22psy_data\22\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"31l: please check \22psy_data.\22\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"w1,w2: %f %f \0A\00", align 1
@.str.7 = private unnamed_addr constant [31 x i8] c"31s: please check \22psy_data.\22\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_L3psycho_anal = private constant [13 x i8] c"L3psycho_anal"
@__profn_L3para_read = private constant [11 x i8] c"L3para_read"
@__profc_L3psycho_anal = private global [143 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_L3psycho_anal = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8924636771108313829, i64 2428719483829, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i16**, i32, double*, double*, double*, [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]*, double*, double*, i32*)* @L3psycho_anal to i8*), i8* null, i32 143, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_L3para_read = private global [36 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_L3para_read = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7490520109057614513, i64 614190739238, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i32 0, i32 0), i8* bitcast (void (double, i32*, i32*, i32*, double*, double*, [64 x double]*, [64 x double]*, double*, double*, i32*, i32*, double*, double*, i32*, i32*, double*, double*)* @L3para_read to i8*), i8* null, i32 36, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [27 x i8] c"\19\00L3psycho_anal\01L3para_read", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_L3psycho_anal to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_L3para_read to i8*), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @L3psycho_anal(%struct.lame_global_flags*, i16**, i32, double*, double*, double*, [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]*, double*, double*, i32*) #0 {
  %12 = alloca %struct.lame_global_flags*, align 8
  %13 = alloca i16**, align 8
  %14 = alloca i32, align 4
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca double*, align 8
  %18 = alloca [2 x %struct.III_psy_ratio]*, align 8
  %19 = alloca [2 x %struct.III_psy_ratio]*, align 8
  %20 = alloca double*, align 8
  %21 = alloca double*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca [1024 x float]*, align 8
  %24 = alloca [3 x [256 x float]]*, align 8
  %25 = alloca [4 x float], align 16
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca [2 x i32], align 4
  %29 = alloca [2 x i32], align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca float, align 4
  %39 = alloca [63 x double], align 16
  %40 = alloca double, align 8
  %41 = alloca double, align 8
  %42 = alloca double, align 8
  %43 = alloca double, align 8
  %44 = alloca float, align 4
  %45 = alloca float, align 4
  %46 = alloca float, align 4
  %47 = alloca float, align 4
  %48 = alloca float, align 4
  %49 = alloca float, align 4
  %50 = alloca float, align 4
  %51 = alloca float, align 4
  %52 = alloca float, align 4
  %53 = alloca float, align 4
  %54 = alloca float, align 4
  %55 = alloca float, align 4
  %56 = alloca float, align 4
  %57 = alloca float, align 4
  %58 = alloca float, align 4
  %59 = alloca float, align 4
  %60 = alloca float, align 4
  %61 = alloca float, align 4
  %62 = alloca float, align 4
  %63 = alloca float, align 4
  %64 = alloca float, align 4
  %65 = alloca float, align 4
  %66 = alloca float, align 4
  %67 = alloca float, align 4
  %68 = alloca float, align 4
  %69 = alloca float, align 4
  %70 = alloca float, align 4
  %71 = alloca float, align 4
  %72 = alloca float, align 4
  %73 = alloca float, align 4
  %74 = alloca float, align 4
  %75 = alloca float, align 4
  %76 = alloca float, align 4
  %77 = alloca float, align 4
  %78 = alloca float, align 4
  %79 = alloca float, align 4
  %80 = alloca float, align 4
  %81 = alloca float, align 4
  %82 = alloca double, align 8
  %83 = alloca double, align 8
  %84 = alloca i32, align 4
  %85 = alloca i32, align 4
  %86 = alloca double, align 8
  %87 = alloca double, align 8
  %88 = alloca double, align 8
  %89 = alloca double, align 8
  %90 = alloca double, align 8
  %91 = alloca float, align 4
  %92 = alloca float, align 4
  %93 = alloca float, align 4
  %94 = alloca float, align 4
  %95 = alloca float, align 4
  %96 = alloca double, align 8
  %97 = alloca double, align 8
  %98 = alloca i32, align 4
  %99 = alloca float, align 4
  %100 = alloca double, align 8
  %101 = alloca double, align 8
  %102 = alloca double, align 8
  %103 = alloca double, align 8
  %104 = alloca double, align 8
  %105 = alloca double, align 8
  %106 = alloca i32, align 4
  %107 = alloca i32, align 4
  %108 = alloca double, align 8
  %109 = alloca double, align 8
  %110 = alloca double, align 8
  %111 = alloca double, align 8
  %112 = alloca double, align 8
  %113 = alloca i32, align 4
  %114 = alloca float, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %12, align 8
  store i16** %1, i16*** %13, align 8
  store i32 %2, i32* %14, align 4
  store double* %3, double** %15, align 8
  store double* %4, double** %16, align 8
  store double* %5, double** %17, align 8
  store [2 x %struct.III_psy_ratio]* %6, [2 x %struct.III_psy_ratio]** %18, align 8
  store [2 x %struct.III_psy_ratio]* %7, [2 x %struct.III_psy_ratio]** %19, align 8
  store double* %8, double** %20, align 8
  store double* %9, double** %21, align 8
  store i32* %10, i32** %22, align 8
  store double 0.000000e+00, double* %26, align 8
  store double 0.000000e+00, double* %27, align 8
  %115 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %116 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %115, i32 0, i32 39
  %117 = load i64, i64* %116, align 8
  %118 = icmp eq i64 %117, 0
  br i1 %118, label %119, label %606

; <label>:119:                                    ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 114)
  %120 = add i64 %pgocount, 1
  store i64 %120, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 114)
  %121 = load i32, i32* %14, align 4
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %606

; <label>:123:                                    ; preds = %119
  store i32 3, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 0), align 4
  store i32 3, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 1), align 4
  %124 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %125 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %124, i32 0, i32 3
  %126 = load i32, i32* %125, align 8
  store i32 %126, i32* %33, align 4
  %127 = load i32, i32* %33, align 4
  switch i32 %127, label %140 [
    i32 32000, label %128
    i32 44100, label %130
    i32 48000, label %132
    i32 16000, label %134
    i32 22050, label %136
    i32 24000, label %138
  ]

; <label>:128:                                    ; preds = %123
  %pgocount6 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 135)
  %129 = add i64 %pgocount6, 1
  store i64 %129, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 135)
  br label %145

; <label>:130:                                    ; preds = %123
  %pgocount7 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 136)
  %131 = add i64 %pgocount7, 1
  store i64 %131, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 136)
  br label %145

; <label>:132:                                    ; preds = %123
  %pgocount8 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 137)
  %133 = add i64 %pgocount8, 1
  store i64 %133, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 137)
  br label %145

; <label>:134:                                    ; preds = %123
  %pgocount9 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 138)
  %135 = add i64 %pgocount9, 1
  store i64 %135, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 138)
  br label %145

; <label>:136:                                    ; preds = %123
  %pgocount10 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 139)
  %137 = add i64 %pgocount10, 1
  store i64 %137, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 139)
  br label %145

; <label>:138:                                    ; preds = %123
  %pgocount11 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 140)
  %139 = add i64 %pgocount11, 1
  store i64 %139, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 140)
  br label %145

; <label>:140:                                    ; preds = %123
  %pgocount12 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 142)
  %141 = add i64 %pgocount12, 1
  store i64 %141, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 142)
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %143 = load i32, i32* %33, align 4
  %144 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %142, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i32 %143)
  call void @exit(i32 -1) #7
  unreachable

; <label>:145:                                    ; preds = %138, %136, %134, %132, %130, %128
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav to i8*), i8 0, i64 16416, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav to i8*), i8 0, i64 16416, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav to i8*), i8 0, i64 16416, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x %struct.III_psy_xmin]* @L3psycho_anal.en to i8*), i8 0, i64 1952, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x %struct.III_psy_xmin]* @L3psycho_anal.thm to i8*), i8 0, i64 1952, i32 16, i1 false)
  store i32 6, i32* @L3psycho_anal.cw_lower_index, align 4
  %146 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %147 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %146, i32 0, i32 35
  %148 = load float, float* %147, align 8
  %149 = fcmp ogt float %148, 0.000000e+00
  br i1 %149, label %150, label %154

; <label>:150:                                    ; preds = %145
  %151 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %152 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %151, i32 0, i32 35
  %153 = load float, float* %152, align 8
  store float %153, float* %38, align 4
  br label %156

; <label>:154:                                    ; preds = %145
  %pgocount13 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 129)
  %155 = add i64 %pgocount13, 1
  store i64 %155, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 129)
  store float 0x4021BE4F80000000, float* %38, align 4
  br label %156

; <label>:156:                                    ; preds = %154, %150
  %157 = load float, float* %38, align 4
  %158 = fpext float %157 to double
  %159 = fmul double %158, 1.000000e+03
  %160 = fmul double %159, 1.024000e+03
  %161 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %162 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %161, i32 0, i32 3
  %163 = load i32, i32* %162, align 8
  %164 = sitofp i32 %163 to double
  %165 = fdiv double %160, %164
  %166 = fptosi double %165 to i32
  store i32 %166, i32* @L3psycho_anal.cw_upper_index, align 4
  %167 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  %168 = icmp slt i32 509, %167
  br i1 %168, label %169, label %170

; <label>:169:                                    ; preds = %156
  br label %173

; <label>:170:                                    ; preds = %156
  %pgocount14 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 130)
  %171 = add i64 %pgocount14, 1
  store i64 %171, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 130)
  %172 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  br label %173

; <label>:173:                                    ; preds = %170, %169
  %174 = phi i32 [ 509, %169 ], [ %172, %170 ]
  store i32 %174, i32* @L3psycho_anal.cw_upper_index, align 4
  %175 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  %176 = icmp sgt i32 6, %175
  br i1 %176, label %177, label %178

; <label>:177:                                    ; preds = %173
  br label %181

; <label>:178:                                    ; preds = %173
  %pgocount15 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 131)
  %179 = add i64 %pgocount15, 1
  store i64 %179, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 131)
  %180 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  br label %181

; <label>:181:                                    ; preds = %178, %177
  %182 = phi i32 [ 6, %177 ], [ %180, %178 ]
  store i32 %182, i32* @L3psycho_anal.cw_upper_index, align 4
  store i32 0, i32* %34, align 4
  br label %183

; <label>:183:                                    ; preds = %190, %181
  %184 = load i32, i32* %34, align 4
  %185 = icmp slt i32 %184, 513
  br i1 %185, label %186, label %194

; <label>:186:                                    ; preds = %183
  %187 = load i32, i32* %34, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %188
  store float 0x3FD99999A0000000, float* %189, align 4
  br label %190

; <label>:190:                                    ; preds = %186
  %pgocount16 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 76)
  %191 = add i64 %pgocount16, 1
  store i64 %191, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 76)
  %192 = load i32, i32* %34, align 4
  %193 = add nsw i32 %192, 1
  store i32 %193, i32* %34, align 4
  br label %183

; <label>:194:                                    ; preds = %183
  store i32 0, i32* %36, align 4
  br label %195

; <label>:195:                                    ; preds = %212, %194
  %196 = load i32, i32* %36, align 4
  %197 = icmp slt i32 %196, 12
  br i1 %197, label %198, label %216

; <label>:198:                                    ; preds = %195
  %199 = load i32, i32* %36, align 4
  %200 = sitofp i32 %199 to double
  %201 = fmul double 0x400921FB54442D18, %200
  %202 = fdiv double %201, 1.200000e+01
  %203 = call double @cos(double %202) #6
  %204 = fsub double 1.000000e+00, %203
  %205 = fmul double 1.250000e+00, %204
  %206 = fsub double %205, 2.500000e+00
  store double %206, double* %40, align 8
  %207 = load double, double* %40, align 8
  %208 = call double @pow(double 1.000000e+01, double %207) #6
  %209 = load i32, i32* %36, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.mld_s, i64 0, i64 %210
  store double %208, double* %211, align 8
  br label %212

; <label>:212:                                    ; preds = %198
  %pgocount17 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 77)
  %213 = add i64 %pgocount17, 1
  store i64 %213, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 77)
  %214 = load i32, i32* %36, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %36, align 4
  br label %195

; <label>:216:                                    ; preds = %195
  store i32 0, i32* %36, align 4
  br label %217

; <label>:217:                                    ; preds = %234, %216
  %218 = load i32, i32* %36, align 4
  %219 = icmp slt i32 %218, 21
  br i1 %219, label %220, label %238

; <label>:220:                                    ; preds = %217
  %221 = load i32, i32* %36, align 4
  %222 = sitofp i32 %221 to double
  %223 = fmul double 0x400921FB54442D18, %222
  %224 = fdiv double %223, 2.100000e+01
  %225 = call double @cos(double %224) #6
  %226 = fsub double 1.000000e+00, %225
  %227 = fmul double 1.250000e+00, %226
  %228 = fsub double %227, 2.500000e+00
  store double %228, double* %41, align 8
  %229 = load double, double* %41, align 8
  %230 = call double @pow(double 1.000000e+01, double %229) #6
  %231 = load i32, i32* %36, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.mld_l, i64 0, i64 %232
  store double %230, double* %233, align 8
  br label %234

; <label>:234:                                    ; preds = %220
  %pgocount18 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 78)
  %235 = add i64 %pgocount18, 1
  store i64 %235, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 78)
  %236 = load i32, i32* %36, align 4
  %237 = add nsw i32 %236, 1
  store i32 %237, i32* %36, align 4
  br label %217

; <label>:238:                                    ; preds = %217
  store i32 0, i32* %33, align 4
  br label %239

; <label>:239:                                    ; preds = %246, %238
  %240 = load i32, i32* %33, align 4
  %241 = icmp slt i32 %240, 513
  br i1 %241, label %242, label %250

; <label>:242:                                    ; preds = %239
  %243 = load i32, i32* %33, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i64 0, i64 %244
  store i32 -1, i32* %245, align 4
  br label %246

; <label>:246:                                    ; preds = %242
  %pgocount19 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 79)
  %247 = add i64 %pgocount19, 1
  store i64 %247, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 79)
  %248 = load i32, i32* %33, align 4
  %249 = add nsw i32 %248, 1
  store i32 %249, i32* %33, align 4
  br label %239

; <label>:250:                                    ; preds = %239
  %251 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %252 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %251, i32 0, i32 3
  %253 = load i32, i32* %252, align 8
  %254 = sitofp i32 %253 to double
  %255 = getelementptr inbounds [63 x double], [63 x double]* %39, i32 0, i32 0
  call void @L3para_read(double %254, i32* getelementptr inbounds ([63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i32 0, i32 0), i32* getelementptr inbounds ([63 x i32], [63 x i32]* @L3psycho_anal.numlines_s, i32 0, i32 0), i32* getelementptr inbounds ([513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i32 0, i32 0), double* getelementptr inbounds ([63 x double], [63 x double]* @L3psycho_anal.minval, i32 0, i32 0), double* getelementptr inbounds ([63 x double], [63 x double]* @L3psycho_anal.qthr_l, i32 0, i32 0), [64 x double]* getelementptr inbounds ([64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i32 0, i32 0), [64 x double]* getelementptr inbounds ([64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i32 0, i32 0), double* getelementptr inbounds ([63 x double], [63 x double]* @L3psycho_anal.qthr_s, i32 0, i32 0), double* %255, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bu_l, i32 0, i32 0), i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i32 0, i32 0), double* getelementptr inbounds ([21 x double], [21 x double]* @L3psycho_anal.w1_l, i32 0, i32 0), double* getelementptr inbounds ([21 x double], [21 x double]* @L3psycho_anal.w2_l, i32 0, i32 0), i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bu_s, i32 0, i32 0), i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i32 0, i32 0), double* getelementptr inbounds ([12 x double], [12 x double]* @L3psycho_anal.w1_s, i32 0, i32 0), double* getelementptr inbounds ([12 x double], [12 x double]* @L3psycho_anal.w2_s, i32 0, i32 0))
  store i32 0, i32* @L3psycho_anal.npart_l_orig, align 4
  store i32 0, i32* @L3psycho_anal.npart_s_orig, align 4
  store i32 0, i32* %33, align 4
  br label %256

; <label>:256:                                    ; preds = %273, %250
  %257 = load i32, i32* %33, align 4
  %258 = icmp slt i32 %257, 513
  br i1 %258, label %259, label %277

; <label>:259:                                    ; preds = %256
  %260 = load i32, i32* %33, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i64 0, i64 %261
  %263 = load i32, i32* %262, align 4
  %264 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %265 = icmp sgt i32 %263, %264
  br i1 %265, label %266, label %272

; <label>:266:                                    ; preds = %259
  %pgocount20 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 88)
  %267 = add i64 %pgocount20, 1
  store i64 %267, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 88)
  %268 = load i32, i32* %33, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i64 0, i64 %269
  %271 = load i32, i32* %270, align 4
  store i32 %271, i32* @L3psycho_anal.npart_l_orig, align 4
  br label %272

; <label>:272:                                    ; preds = %266, %259
  br label %273

; <label>:273:                                    ; preds = %272
  %pgocount21 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 80)
  %274 = add i64 %pgocount21, 1
  store i64 %274, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 80)
  %275 = load i32, i32* %33, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, i32* %33, align 4
  br label %256

; <label>:277:                                    ; preds = %256
  %278 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %279 = add nsw i32 %278, 1
  store i32 %279, i32* @L3psycho_anal.npart_l_orig, align 4
  store i32 0, i32* %33, align 4
  br label %280

; <label>:280:                                    ; preds = %287, %277
  %281 = load i32, i32* %33, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_s, i64 0, i64 %282
  %284 = load i32, i32* %283, align 4
  %285 = icmp sge i32 %284, 0
  br i1 %285, label %286, label %291

; <label>:286:                                    ; preds = %280
  br label %287

; <label>:287:                                    ; preds = %286
  %pgocount22 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 81)
  %288 = add i64 %pgocount22, 1
  store i64 %288, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 81)
  %289 = load i32, i32* %33, align 4
  %290 = add nsw i32 %289, 1
  store i32 %290, i32* %33, align 4
  br label %280

; <label>:291:                                    ; preds = %280
  %292 = load i32, i32* %33, align 4
  store i32 %292, i32* @L3psycho_anal.npart_s_orig, align 4
  %293 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 20), align 16
  %294 = add nsw i32 %293, 1
  store i32 %294, i32* @L3psycho_anal.npart_l, align 4
  %295 = load i32, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 11), align 4
  %296 = add nsw i32 %295, 1
  store i32 %296, i32* @L3psycho_anal.npart_s, align 4
  %297 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %298 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %299 = icmp sgt i32 %297, %298
  br i1 %299, label %300, label %305

; <label>:300:                                    ; preds = %291
  %pgocount23 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 132)
  %301 = add i64 %pgocount23, 1
  store i64 %301, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 132)
  %302 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  store i32 %302, i32* @L3psycho_anal.npart_l, align 4
  %303 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %304 = sub nsw i32 %303, 1
  store i32 %304, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 20), align 16
  store double 1.000000e+00, double* getelementptr inbounds ([21 x double], [21 x double]* @L3psycho_anal.w2_l, i64 0, i64 20), align 16
  br label %305

; <label>:305:                                    ; preds = %300, %291
  %306 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %307 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  %308 = icmp sgt i32 %306, %307
  br i1 %308, label %309, label %314

; <label>:309:                                    ; preds = %305
  %pgocount24 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 133)
  %310 = add i64 %pgocount24, 1
  store i64 %310, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 133)
  %311 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  store i32 %311, i32* @L3psycho_anal.npart_s, align 4
  %312 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %313 = sub nsw i32 %312, 1
  store i32 %313, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 11), align 4
  store double 1.000000e+00, double* getelementptr inbounds ([12 x double], [12 x double]* @L3psycho_anal.w2_s, i64 0, i64 11), align 8
  br label %314

; <label>:314:                                    ; preds = %309, %305
  store i32 0, i32* %33, align 4
  br label %315

; <label>:315:                                    ; preds = %373, %314
  %316 = load i32, i32* %33, align 4
  %317 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %318 = icmp slt i32 %316, %317
  br i1 %318, label %319, label %377

; <label>:319:                                    ; preds = %315
  store i32 0, i32* %34, align 4
  br label %320

; <label>:320:                                    ; preds = %336, %319
  %321 = load i32, i32* %34, align 4
  %322 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %323 = icmp slt i32 %321, %322
  br i1 %323, label %324, label %340

; <label>:324:                                    ; preds = %320
  %325 = load i32, i32* %33, align 4
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %326
  %328 = load i32, i32* %34, align 4
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds [64 x double], [64 x double]* %327, i64 0, i64 %329
  %331 = load double, double* %330, align 8
  %332 = fcmp une double %331, 0.000000e+00
  br i1 %332, label %333, label %335

; <label>:333:                                    ; preds = %324
  %pgocount25 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 90)
  %334 = add i64 %pgocount25, 1
  store i64 %334, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 90)
  br label %340

; <label>:335:                                    ; preds = %324
  br label %336

; <label>:336:                                    ; preds = %335
  %pgocount26 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 0)
  %337 = add i64 %pgocount26, 1
  store i64 %337, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 0)
  %338 = load i32, i32* %34, align 4
  %339 = add nsw i32 %338, 1
  store i32 %339, i32* %34, align 4
  br label %320

; <label>:340:                                    ; preds = %333, %320
  %341 = load i32, i32* %34, align 4
  %342 = load i32, i32* %33, align 4
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %343
  %345 = getelementptr inbounds [2 x i32], [2 x i32]* %344, i64 0, i64 0
  store i32 %341, i32* %345, align 8
  %346 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %347 = sub nsw i32 %346, 1
  store i32 %347, i32* %34, align 4
  br label %348

; <label>:348:                                    ; preds = %363, %340
  %349 = load i32, i32* %34, align 4
  %350 = icmp sgt i32 %349, 0
  br i1 %350, label %351, label %367

; <label>:351:                                    ; preds = %348
  %352 = load i32, i32* %33, align 4
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %353
  %355 = load i32, i32* %34, align 4
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [64 x double], [64 x double]* %354, i64 0, i64 %356
  %358 = load double, double* %357, align 8
  %359 = fcmp une double %358, 0.000000e+00
  br i1 %359, label %360, label %362

; <label>:360:                                    ; preds = %351
  %pgocount27 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 91)
  %361 = add i64 %pgocount27, 1
  store i64 %361, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 91)
  br label %367

; <label>:362:                                    ; preds = %351
  br label %363

; <label>:363:                                    ; preds = %362
  %pgocount28 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 1)
  %364 = add i64 %pgocount28, 1
  store i64 %364, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 1)
  %365 = load i32, i32* %34, align 4
  %366 = add nsw i32 %365, -1
  store i32 %366, i32* %34, align 4
  br label %348

; <label>:367:                                    ; preds = %360, %348
  %368 = load i32, i32* %34, align 4
  %369 = load i32, i32* %33, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %370
  %372 = getelementptr inbounds [2 x i32], [2 x i32]* %371, i64 0, i64 1
  store i32 %368, i32* %372, align 4
  br label %373

; <label>:373:                                    ; preds = %367
  %pgocount29 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 82)
  %374 = add i64 %pgocount29, 1
  store i64 %374, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 82)
  %375 = load i32, i32* %33, align 4
  %376 = add nsw i32 %375, 1
  store i32 %376, i32* %33, align 4
  br label %315

; <label>:377:                                    ; preds = %315
  store i32 0, i32* %33, align 4
  br label %378

; <label>:378:                                    ; preds = %436, %377
  %379 = load i32, i32* %33, align 4
  %380 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %381 = icmp slt i32 %379, %380
  br i1 %381, label %382, label %440

; <label>:382:                                    ; preds = %378
  store i32 0, i32* %34, align 4
  br label %383

; <label>:383:                                    ; preds = %399, %382
  %384 = load i32, i32* %34, align 4
  %385 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  %386 = icmp slt i32 %384, %385
  br i1 %386, label %387, label %403

; <label>:387:                                    ; preds = %383
  %388 = load i32, i32* %33, align 4
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %389
  %391 = load i32, i32* %34, align 4
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [64 x double], [64 x double]* %390, i64 0, i64 %392
  %394 = load double, double* %393, align 8
  %395 = fcmp une double %394, 0.000000e+00
  br i1 %395, label %396, label %398

; <label>:396:                                    ; preds = %387
  %pgocount30 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 92)
  %397 = add i64 %pgocount30, 1
  store i64 %397, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 92)
  br label %403

; <label>:398:                                    ; preds = %387
  br label %399

; <label>:399:                                    ; preds = %398
  %pgocount31 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 2)
  %400 = add i64 %pgocount31, 1
  store i64 %400, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 2)
  %401 = load i32, i32* %34, align 4
  %402 = add nsw i32 %401, 1
  store i32 %402, i32* %34, align 4
  br label %383

; <label>:403:                                    ; preds = %396, %383
  %404 = load i32, i32* %34, align 4
  %405 = load i32, i32* %33, align 4
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %406
  %408 = getelementptr inbounds [2 x i32], [2 x i32]* %407, i64 0, i64 0
  store i32 %404, i32* %408, align 8
  %409 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  %410 = sub nsw i32 %409, 1
  store i32 %410, i32* %34, align 4
  br label %411

; <label>:411:                                    ; preds = %426, %403
  %412 = load i32, i32* %34, align 4
  %413 = icmp sgt i32 %412, 0
  br i1 %413, label %414, label %430

; <label>:414:                                    ; preds = %411
  %415 = load i32, i32* %33, align 4
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %416
  %418 = load i32, i32* %34, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds [64 x double], [64 x double]* %417, i64 0, i64 %419
  %421 = load double, double* %420, align 8
  %422 = fcmp une double %421, 0.000000e+00
  br i1 %422, label %423, label %425

; <label>:423:                                    ; preds = %414
  %pgocount32 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 93)
  %424 = add i64 %pgocount32, 1
  store i64 %424, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 93)
  br label %430

; <label>:425:                                    ; preds = %414
  br label %426

; <label>:426:                                    ; preds = %425
  %pgocount33 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 3)
  %427 = add i64 %pgocount33, 1
  store i64 %427, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 3)
  %428 = load i32, i32* %34, align 4
  %429 = add nsw i32 %428, -1
  store i32 %429, i32* %34, align 4
  br label %411

; <label>:430:                                    ; preds = %423, %411
  %431 = load i32, i32* %34, align 4
  %432 = load i32, i32* %33, align 4
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %433
  %435 = getelementptr inbounds [2 x i32], [2 x i32]* %434, i64 0, i64 1
  store i32 %431, i32* %435, align 4
  br label %436

; <label>:436:                                    ; preds = %430
  %pgocount34 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 83)
  %437 = add i64 %pgocount34, 1
  store i64 %437, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 83)
  %438 = load i32, i32* %33, align 4
  %439 = add nsw i32 %438, 1
  store i32 %439, i32* %33, align 4
  br label %378

; <label>:440:                                    ; preds = %378
  store i32 0, i32* %32, align 4
  br label %441

; <label>:441:                                    ; preds = %504, %440
  %442 = load i32, i32* %32, align 4
  %443 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %444 = icmp slt i32 %442, %443
  br i1 %444, label %445, label %508

; <label>:445:                                    ; preds = %441
  store double 0.000000e+00, double* %42, align 8
  %446 = load i32, i32* %32, align 4
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %447
  %449 = getelementptr inbounds [2 x i32], [2 x i32]* %448, i64 0, i64 0
  %450 = load i32, i32* %449, align 8
  store i32 %450, i32* %35, align 4
  br label %451

; <label>:451:                                    ; preds = %469, %445
  %452 = load i32, i32* %35, align 4
  %453 = load i32, i32* %32, align 4
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %454
  %456 = getelementptr inbounds [2 x i32], [2 x i32]* %455, i64 0, i64 1
  %457 = load i32, i32* %456, align 4
  %458 = icmp sle i32 %452, %457
  br i1 %458, label %459, label %473

; <label>:459:                                    ; preds = %451
  %460 = load i32, i32* %32, align 4
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %461
  %463 = load i32, i32* %35, align 4
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds [64 x double], [64 x double]* %462, i64 0, i64 %464
  %466 = load double, double* %465, align 8
  %467 = load double, double* %42, align 8
  %468 = fadd double %467, %466
  store double %468, double* %42, align 8
  br label %469

; <label>:469:                                    ; preds = %459
  %pgocount35 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 5)
  %470 = add i64 %pgocount35, 1
  store i64 %470, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 5)
  %471 = load i32, i32* %35, align 4
  %472 = add nsw i32 %471, 1
  store i32 %472, i32* %35, align 4
  br label %451

; <label>:473:                                    ; preds = %451
  %474 = load i32, i32* %32, align 4
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %475
  %477 = getelementptr inbounds [2 x i32], [2 x i32]* %476, i64 0, i64 0
  %478 = load i32, i32* %477, align 8
  store i32 %478, i32* %35, align 4
  br label %479

; <label>:479:                                    ; preds = %499, %473
  %480 = load i32, i32* %35, align 4
  %481 = load i32, i32* %32, align 4
  %482 = sext i32 %481 to i64
  %483 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %482
  %484 = getelementptr inbounds [2 x i32], [2 x i32]* %483, i64 0, i64 1
  %485 = load i32, i32* %484, align 4
  %486 = icmp sle i32 %480, %485
  br i1 %486, label %487, label %503

; <label>:487:                                    ; preds = %479
  %488 = call double @exp(double 0xBFF61AD547A6661A) #6
  %489 = load double, double* %42, align 8
  %490 = fdiv double %488, %489
  %491 = load i32, i32* %32, align 4
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %492
  %494 = load i32, i32* %35, align 4
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds [64 x double], [64 x double]* %493, i64 0, i64 %495
  %497 = load double, double* %496, align 8
  %498 = fmul double %497, %490
  store double %498, double* %496, align 8
  br label %499

; <label>:499:                                    ; preds = %487
  %pgocount36 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 6)
  %500 = add i64 %pgocount36, 1
  store i64 %500, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 6)
  %501 = load i32, i32* %35, align 4
  %502 = add nsw i32 %501, 1
  store i32 %502, i32* %35, align 4
  br label %479

; <label>:503:                                    ; preds = %479
  br label %504

; <label>:504:                                    ; preds = %503
  %pgocount37 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 84)
  %505 = add i64 %pgocount37, 1
  store i64 %505, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 84)
  %506 = load i32, i32* %32, align 4
  %507 = add nsw i32 %506, 1
  store i32 %507, i32* %32, align 4
  br label %441

; <label>:508:                                    ; preds = %441
  %509 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %510 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %509, i32 0, i32 43
  %511 = load i32, i32* %510, align 8
  %512 = icmp eq i32 %511, 1
  br i1 %512, label %513, label %534

; <label>:513:                                    ; preds = %508
  store i32 0, i32* %32, align 4
  br label %514

; <label>:514:                                    ; preds = %528, %513
  %515 = load i32, i32* %32, align 4
  %516 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %517 = icmp slt i32 %515, %516
  br i1 %517, label %518, label %532

; <label>:518:                                    ; preds = %514
  %519 = load i32, i32* %32, align 4
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %520
  %522 = load double, double* %521, align 8
  %523 = fmul double %522, 0x3FCD791C5F888823
  %524 = call double @exp(double %523) #6
  %525 = load i32, i32* %32, align 4
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %526
  store double %524, double* %527, align 8
  br label %528

; <label>:528:                                    ; preds = %518
  %pgocount38 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 89)
  %529 = add i64 %pgocount38, 1
  store i64 %529, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 89)
  %530 = load i32, i32* %32, align 4
  %531 = add nsw i32 %530, 1
  store i32 %531, i32* %32, align 4
  br label %514

; <label>:532:                                    ; preds = %514
  %pgocount39 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 134)
  %533 = add i64 %pgocount39, 1
  store i64 %533, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 134)
  br label %534

; <label>:534:                                    ; preds = %532, %508
  store i32 0, i32* %32, align 4
  br label %535

; <label>:535:                                    ; preds = %601, %534
  %536 = load i32, i32* %32, align 4
  %537 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %538 = icmp slt i32 %536, %537
  br i1 %538, label %539, label %605

; <label>:539:                                    ; preds = %535
  store double 0.000000e+00, double* %43, align 8
  %540 = load i32, i32* %32, align 4
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %541
  %543 = getelementptr inbounds [2 x i32], [2 x i32]* %542, i64 0, i64 0
  %544 = load i32, i32* %543, align 8
  store i32 %544, i32* %35, align 4
  br label %545

; <label>:545:                                    ; preds = %563, %539
  %546 = load i32, i32* %35, align 4
  %547 = load i32, i32* %32, align 4
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %548
  %550 = getelementptr inbounds [2 x i32], [2 x i32]* %549, i64 0, i64 1
  %551 = load i32, i32* %550, align 4
  %552 = icmp sle i32 %546, %551
  br i1 %552, label %553, label %567

; <label>:553:                                    ; preds = %545
  %554 = load i32, i32* %32, align 4
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %555
  %557 = load i32, i32* %35, align 4
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds [64 x double], [64 x double]* %556, i64 0, i64 %558
  %560 = load double, double* %559, align 8
  %561 = load double, double* %43, align 8
  %562 = fadd double %561, %560
  store double %562, double* %43, align 8
  br label %563

; <label>:563:                                    ; preds = %553
  %pgocount40 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 7)
  %564 = add i64 %pgocount40, 1
  store i64 %564, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 7)
  %565 = load i32, i32* %35, align 4
  %566 = add nsw i32 %565, 1
  store i32 %566, i32* %35, align 4
  br label %545

; <label>:567:                                    ; preds = %545
  %568 = load i32, i32* %32, align 4
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %569
  %571 = getelementptr inbounds [2 x i32], [2 x i32]* %570, i64 0, i64 0
  %572 = load i32, i32* %571, align 8
  store i32 %572, i32* %35, align 4
  br label %573

; <label>:573:                                    ; preds = %596, %567
  %574 = load i32, i32* %35, align 4
  %575 = load i32, i32* %32, align 4
  %576 = sext i32 %575 to i64
  %577 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %576
  %578 = getelementptr inbounds [2 x i32], [2 x i32]* %577, i64 0, i64 1
  %579 = load i32, i32* %578, align 4
  %580 = icmp sle i32 %574, %579
  br i1 %580, label %581, label %600

; <label>:581:                                    ; preds = %573
  %582 = load i32, i32* %32, align 4
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %583
  %585 = load double, double* %584, align 8
  %586 = load double, double* %43, align 8
  %587 = fdiv double %585, %586
  %588 = load i32, i32* %32, align 4
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %589
  %591 = load i32, i32* %35, align 4
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds [64 x double], [64 x double]* %590, i64 0, i64 %592
  %594 = load double, double* %593, align 8
  %595 = fmul double %594, %587
  store double %595, double* %593, align 8
  br label %596

; <label>:596:                                    ; preds = %581
  %pgocount41 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 8)
  %597 = add i64 %pgocount41, 1
  store i64 %597, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 8)
  %598 = load i32, i32* %35, align 4
  %599 = add nsw i32 %598, 1
  store i32 %599, i32* %35, align 4
  br label %573

; <label>:600:                                    ; preds = %573
  br label %601

; <label>:601:                                    ; preds = %600
  %pgocount42 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 85)
  %602 = add i64 %pgocount42, 1
  store i64 %602, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 85)
  %603 = load i32, i32* %32, align 4
  %604 = add nsw i32 %603, 1
  store i32 %604, i32* %32, align 4
  br label %535

; <label>:605:                                    ; preds = %535
  call void @init_fft()
  br label %606

; <label>:606:                                    ; preds = %605, %119, %11
  %607 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %608 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %607, i32 0, i32 46
  %609 = load i32, i32* %608, align 4
  store i32 %609, i32* %30, align 4
  %610 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %611 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %610, i32 0, i32 8
  %612 = load i32, i32* %611, align 4
  %613 = icmp eq i32 %612, 1
  br i1 %613, label %614, label %616

; <label>:614:                                    ; preds = %606
  %pgocount43 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 108)
  %615 = add i64 %pgocount43, 1
  store i64 %615, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 108)
  store i32 4, i32* %30, align 4
  br label %616

; <label>:616:                                    ; preds = %614, %606
  store i32 0, i32* %31, align 4
  br label %617

; <label>:617:                                    ; preds = %2193, %616
  %618 = load i32, i32* %31, align 4
  %619 = load i32, i32* %30, align 4
  %620 = icmp slt i32 %618, %619
  br i1 %620, label %621, label %2196

; <label>:621:                                    ; preds = %617
  %622 = load i32, i32* %31, align 4
  %623 = and i32 %622, 1
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* getelementptr inbounds ([2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i32 0, i32 0), i64 %624
  store [3 x [256 x float]]* %625, [3 x [256 x float]]** %24, align 8
  %626 = load i32, i32* %31, align 4
  %627 = and i32 %626, 1
  %628 = sext i32 %627 to i64
  %629 = getelementptr inbounds [1024 x float], [1024 x float]* getelementptr inbounds ([2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i32 0, i32 0), i64 %628
  store [1024 x float]* %629, [1024 x float]** %23, align 8
  %630 = load i32, i32* %31, align 4
  %631 = icmp slt i32 %630, 2
  br i1 %631, label %632, label %676

; <label>:632:                                    ; preds = %621
  %pgocount44 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 54)
  %633 = add i64 %pgocount44, 1
  store i64 %633, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 54)
  %634 = load [1024 x float]*, [1024 x float]** %23, align 8
  %635 = getelementptr inbounds [1024 x float], [1024 x float]* %634, i32 0, i32 0
  %636 = load i32, i32* %31, align 4
  %637 = load i16**, i16*** %13, align 8
  call void @fft_long(float* %635, i32 %636, i16** %637)
  %638 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %639 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %638, i32 0, i32 0
  %640 = load i32, i32* %31, align 4
  %641 = load i16**, i16*** %13, align 8
  call void @fft_short([256 x float]* %639, i32 %640, i16** %641)
  %642 = load i32, i32* %31, align 4
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %643
  %645 = load double, double* %644, align 8
  %646 = load double*, double** %20, align 8
  %647 = load i32, i32* %31, align 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds double, double* %646, i64 %648
  store double %645, double* %649, align 8
  %650 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %18, align 8
  %651 = load i32, i32* %14, align 4
  %652 = sext i32 %651 to i64
  %653 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %650, i64 %652
  %654 = load i32, i32* %31, align 4
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %653, i64 0, i64 %655
  %657 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %656, i32 0, i32 0
  %658 = load i32, i32* %31, align 4
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %659
  %661 = bitcast %struct.III_psy_xmin* %657 to i8*
  %662 = bitcast %struct.III_psy_xmin* %660 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %661, i8* %662, i64 488, i32 8, i1 false)
  %663 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %18, align 8
  %664 = load i32, i32* %14, align 4
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %663, i64 %665
  %667 = load i32, i32* %31, align 4
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %666, i64 0, i64 %668
  %670 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %669, i32 0, i32 1
  %671 = load i32, i32* %31, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %672
  %674 = bitcast %struct.III_psy_xmin* %670 to i8*
  %675 = bitcast %struct.III_psy_xmin* %673 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %674, i8* %675, i64 488, i32 8, i1 false)
  br label %803

; <label>:676:                                    ; preds = %621
  %677 = load i32, i32* %31, align 4
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %678
  %680 = load double, double* %679, align 8
  %681 = load double*, double** %21, align 8
  %682 = load i32, i32* %31, align 4
  %683 = sub nsw i32 %682, 2
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds double, double* %681, i64 %684
  store double %680, double* %685, align 8
  %686 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %19, align 8
  %687 = load i32, i32* %14, align 4
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %686, i64 %688
  %690 = load i32, i32* %31, align 4
  %691 = sub nsw i32 %690, 2
  %692 = sext i32 %691 to i64
  %693 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %689, i64 0, i64 %692
  %694 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %693, i32 0, i32 1
  %695 = load i32, i32* %31, align 4
  %696 = sext i32 %695 to i64
  %697 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %696
  %698 = bitcast %struct.III_psy_xmin* %694 to i8*
  %699 = bitcast %struct.III_psy_xmin* %697 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %698, i8* %699, i64 488, i32 8, i1 false)
  %700 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %19, align 8
  %701 = load i32, i32* %14, align 4
  %702 = sext i32 %701 to i64
  %703 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %700, i64 %702
  %704 = load i32, i32* %31, align 4
  %705 = sub nsw i32 %704, 2
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %703, i64 0, i64 %706
  %708 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %707, i32 0, i32 0
  %709 = load i32, i32* %31, align 4
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %710
  %712 = bitcast %struct.III_psy_xmin* %708 to i8*
  %713 = bitcast %struct.III_psy_xmin* %711 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %712, i8* %713, i64 488, i32 8, i1 false)
  %714 = load i32, i32* %31, align 4
  %715 = icmp eq i32 %714, 2
  br i1 %715, label %716, label %801

; <label>:716:                                    ; preds = %676
  store i32 1023, i32* %34, align 4
  br label %717

; <label>:717:                                    ; preds = %743, %716
  %718 = load i32, i32* %34, align 4
  %719 = icmp sge i32 %718, 0
  br i1 %719, label %720, label %747

; <label>:720:                                    ; preds = %717
  %721 = load i32, i32* %34, align 4
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds [1024 x float], [1024 x float]* getelementptr inbounds ([2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 0), i64 0, i64 %722
  %724 = load float, float* %723, align 4
  store float %724, float* %44, align 4
  %725 = load i32, i32* %34, align 4
  %726 = sext i32 %725 to i64
  %727 = getelementptr inbounds [1024 x float], [1024 x float]* getelementptr inbounds ([2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 1), i64 0, i64 %726
  %728 = load float, float* %727, align 4
  store float %728, float* %45, align 4
  %729 = load float, float* %44, align 4
  %730 = load float, float* %45, align 4
  %731 = fadd float %729, %730
  %732 = fmul float %731, 0x3FE6A09E60000000
  %733 = load i32, i32* %34, align 4
  %734 = sext i32 %733 to i64
  %735 = getelementptr inbounds [1024 x float], [1024 x float]* getelementptr inbounds ([2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 0), i64 0, i64 %734
  store float %732, float* %735, align 4
  %736 = load float, float* %44, align 4
  %737 = load float, float* %45, align 4
  %738 = fsub float %736, %737
  %739 = fmul float %738, 0x3FE6A09E60000000
  %740 = load i32, i32* %34, align 4
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds [1024 x float], [1024 x float]* getelementptr inbounds ([2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 1), i64 0, i64 %741
  store float %739, float* %742, align 4
  br label %743

; <label>:743:                                    ; preds = %720
  %pgocount45 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 43)
  %744 = add i64 %pgocount45, 1
  store i64 %744, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 43)
  %745 = load i32, i32* %34, align 4
  %746 = add nsw i32 %745, -1
  store i32 %746, i32* %34, align 4
  br label %717

; <label>:747:                                    ; preds = %717
  store i32 2, i32* %32, align 4
  br label %748

; <label>:748:                                    ; preds = %795, %747
  %749 = load i32, i32* %32, align 4
  %750 = icmp sge i32 %749, 0
  br i1 %750, label %751, label %799

; <label>:751:                                    ; preds = %748
  store i32 255, i32* %34, align 4
  br label %752

; <label>:752:                                    ; preds = %790, %751
  %753 = load i32, i32* %34, align 4
  %754 = icmp sge i32 %753, 0
  br i1 %754, label %755, label %794

; <label>:755:                                    ; preds = %752
  %756 = load i32, i32* %32, align 4
  %757 = sext i32 %756 to i64
  %758 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* getelementptr inbounds ([2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0), i64 0, i64 %757
  %759 = load i32, i32* %34, align 4
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds [256 x float], [256 x float]* %758, i64 0, i64 %760
  %762 = load float, float* %761, align 4
  store float %762, float* %46, align 4
  %763 = load i32, i32* %32, align 4
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* getelementptr inbounds ([2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1), i64 0, i64 %764
  %766 = load i32, i32* %34, align 4
  %767 = sext i32 %766 to i64
  %768 = getelementptr inbounds [256 x float], [256 x float]* %765, i64 0, i64 %767
  %769 = load float, float* %768, align 4
  store float %769, float* %47, align 4
  %770 = load float, float* %46, align 4
  %771 = load float, float* %47, align 4
  %772 = fadd float %770, %771
  %773 = fmul float %772, 0x3FE6A09E60000000
  %774 = load i32, i32* %32, align 4
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* getelementptr inbounds ([2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0), i64 0, i64 %775
  %777 = load i32, i32* %34, align 4
  %778 = sext i32 %777 to i64
  %779 = getelementptr inbounds [256 x float], [256 x float]* %776, i64 0, i64 %778
  store float %773, float* %779, align 4
  %780 = load float, float* %46, align 4
  %781 = load float, float* %47, align 4
  %782 = fsub float %780, %781
  %783 = fmul float %782, 0x3FE6A09E60000000
  %784 = load i32, i32* %32, align 4
  %785 = sext i32 %784 to i64
  %786 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* getelementptr inbounds ([2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1), i64 0, i64 %785
  %787 = load i32, i32* %34, align 4
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds [256 x float], [256 x float]* %786, i64 0, i64 %788
  store float %783, float* %789, align 4
  br label %790

; <label>:790:                                    ; preds = %755
  %pgocount46 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 28)
  %791 = add i64 %pgocount46, 1
  store i64 %791, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 28)
  %792 = load i32, i32* %34, align 4
  %793 = add nsw i32 %792, -1
  store i32 %793, i32* %34, align 4
  br label %752

; <label>:794:                                    ; preds = %752
  br label %795

; <label>:795:                                    ; preds = %794
  %pgocount47 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 44)
  %796 = add i64 %pgocount47, 1
  store i64 %796, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 44)
  %797 = load i32, i32* %32, align 4
  %798 = add nsw i32 %797, -1
  store i32 %798, i32* %32, align 4
  br label %748

; <label>:799:                                    ; preds = %748
  %pgocount48 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 66)
  %800 = add i64 %pgocount48, 1
  store i64 %800, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 66)
  br label %801

; <label>:801:                                    ; preds = %799, %676
  %pgocount49 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 55)
  %802 = add i64 %pgocount49, 1
  store i64 %802, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 55)
  br label %803

; <label>:803:                                    ; preds = %801, %632
  %804 = load [1024 x float]*, [1024 x float]** %23, align 8
  %805 = getelementptr inbounds [1024 x float], [1024 x float]* %804, i64 0, i64 0
  %806 = load float, float* %805, align 4
  store float %806, float* getelementptr inbounds ([513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 0), align 16
  %807 = load float, float* getelementptr inbounds ([513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 0), align 16
  %808 = load float, float* getelementptr inbounds ([513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 0), align 16
  %809 = fmul float %808, %807
  store float %809, float* getelementptr inbounds ([513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 0), align 16
  %810 = load float, float* getelementptr inbounds ([513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 0), align 16
  %811 = load i32, i32* %31, align 4
  %812 = sext i32 %811 to i64
  %813 = getelementptr inbounds [4 x float], [4 x float]* %25, i64 0, i64 %812
  store float %810, float* %813, align 4
  store i32 511, i32* %34, align 4
  br label %814

; <label>:814:                                    ; preds = %852, %803
  %815 = load i32, i32* %34, align 4
  %816 = icmp sge i32 %815, 0
  br i1 %816, label %817, label %856

; <label>:817:                                    ; preds = %814
  %818 = load [1024 x float]*, [1024 x float]** %23, align 8
  %819 = load i32, i32* %34, align 4
  %820 = sub nsw i32 512, %819
  %821 = sext i32 %820 to i64
  %822 = getelementptr inbounds [1024 x float], [1024 x float]* %818, i64 0, i64 %821
  %823 = load float, float* %822, align 4
  store float %823, float* %48, align 4
  %824 = load [1024 x float]*, [1024 x float]** %23, align 8
  %825 = load i32, i32* %34, align 4
  %826 = add nsw i32 512, %825
  %827 = sext i32 %826 to i64
  %828 = getelementptr inbounds [1024 x float], [1024 x float]* %824, i64 0, i64 %827
  %829 = load float, float* %828, align 4
  store float %829, float* %49, align 4
  %830 = load float, float* %48, align 4
  %831 = load float, float* %48, align 4
  %832 = fmul float %830, %831
  %833 = load float, float* %49, align 4
  %834 = load float, float* %49, align 4
  %835 = fmul float %833, %834
  %836 = fadd float %832, %835
  %837 = fmul float %836, 5.000000e-01
  %838 = load i32, i32* %34, align 4
  %839 = sub nsw i32 512, %838
  %840 = sext i32 %839 to i64
  %841 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %840
  store float %837, float* %841, align 4
  %842 = load i32, i32* %34, align 4
  %843 = sub nsw i32 512, %842
  %844 = sext i32 %843 to i64
  %845 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %844
  %846 = load float, float* %845, align 4
  %847 = load i32, i32* %31, align 4
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds [4 x float], [4 x float]* %25, i64 0, i64 %848
  %850 = load float, float* %849, align 4
  %851 = fadd float %850, %846
  store float %851, float* %849, align 4
  br label %852

; <label>:852:                                    ; preds = %817
  %pgocount50 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 35)
  %853 = add i64 %pgocount50, 1
  store i64 %853, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 35)
  %854 = load i32, i32* %34, align 4
  %855 = add nsw i32 %854, -1
  store i32 %855, i32* %34, align 4
  br label %814

; <label>:856:                                    ; preds = %814
  store i32 2, i32* %32, align 4
  br label %857

; <label>:857:                                    ; preds = %924, %856
  %858 = load i32, i32* %32, align 4
  %859 = icmp sge i32 %858, 0
  br i1 %859, label %860, label %928

; <label>:860:                                    ; preds = %857
  %861 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %862 = load i32, i32* %32, align 4
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %861, i64 0, i64 %863
  %865 = getelementptr inbounds [256 x float], [256 x float]* %864, i64 0, i64 0
  %866 = load float, float* %865, align 4
  %867 = load i32, i32* %32, align 4
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %868
  %870 = getelementptr inbounds [129 x float], [129 x float]* %869, i64 0, i64 0
  store float %866, float* %870, align 4
  %871 = load i32, i32* %32, align 4
  %872 = sext i32 %871 to i64
  %873 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %872
  %874 = getelementptr inbounds [129 x float], [129 x float]* %873, i64 0, i64 0
  %875 = load float, float* %874, align 4
  %876 = load i32, i32* %32, align 4
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %877
  %879 = getelementptr inbounds [129 x float], [129 x float]* %878, i64 0, i64 0
  %880 = load float, float* %879, align 4
  %881 = fmul float %880, %875
  store float %881, float* %879, align 4
  store i32 127, i32* %34, align 4
  br label %882

; <label>:882:                                    ; preds = %920, %860
  %883 = load i32, i32* %34, align 4
  %884 = icmp sge i32 %883, 0
  br i1 %884, label %885, label %923

; <label>:885:                                    ; preds = %882
  %pgocount51 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 11)
  %886 = add i64 %pgocount51, 1
  store i64 %886, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 11)
  %887 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %888 = load i32, i32* %32, align 4
  %889 = sext i32 %888 to i64
  %890 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %887, i64 0, i64 %889
  %891 = load i32, i32* %34, align 4
  %892 = sub nsw i32 128, %891
  %893 = sext i32 %892 to i64
  %894 = getelementptr inbounds [256 x float], [256 x float]* %890, i64 0, i64 %893
  %895 = load float, float* %894, align 4
  store float %895, float* %50, align 4
  %896 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %897 = load i32, i32* %32, align 4
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %896, i64 0, i64 %898
  %900 = load i32, i32* %34, align 4
  %901 = add nsw i32 128, %900
  %902 = sext i32 %901 to i64
  %903 = getelementptr inbounds [256 x float], [256 x float]* %899, i64 0, i64 %902
  %904 = load float, float* %903, align 4
  store float %904, float* %51, align 4
  %905 = load float, float* %50, align 4
  %906 = load float, float* %50, align 4
  %907 = fmul float %905, %906
  %908 = load float, float* %51, align 4
  %909 = load float, float* %51, align 4
  %910 = fmul float %908, %909
  %911 = fadd float %907, %910
  %912 = fmul float %911, 5.000000e-01
  %913 = load i32, i32* %32, align 4
  %914 = sext i32 %913 to i64
  %915 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %914
  %916 = load i32, i32* %34, align 4
  %917 = sub nsw i32 128, %916
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds [129 x float], [129 x float]* %915, i64 0, i64 %918
  store float %912, float* %919, align 4
  br label %920

; <label>:920:                                    ; preds = %885
  %921 = load i32, i32* %34, align 4
  %922 = add nsw i32 %921, -1
  store i32 %922, i32* %34, align 4
  br label %882

; <label>:923:                                    ; preds = %882
  br label %924

; <label>:924:                                    ; preds = %923
  %pgocount52 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 36)
  %925 = add i64 %pgocount52, 1
  store i64 %925, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 36)
  %926 = load i32, i32* %32, align 4
  %927 = add nsw i32 %926, -1
  store i32 %927, i32* %32, align 4
  br label %857

; <label>:928:                                    ; preds = %857
  store i32 0, i32* %34, align 4
  br label %929

; <label>:929:                                    ; preds = %1159, %928
  %930 = load i32, i32* %34, align 4
  %931 = load i32, i32* @L3psycho_anal.cw_lower_index, align 4
  %932 = icmp slt i32 %930, %931
  br i1 %932, label %933, label %1162

; <label>:933:                                    ; preds = %929
  %934 = load i32, i32* %31, align 4
  %935 = sext i32 %934 to i64
  %936 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav, i64 0, i64 %935
  %937 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %936, i64 0, i64 1
  %938 = load i32, i32* %34, align 4
  %939 = sext i32 %938 to i64
  %940 = getelementptr inbounds [513 x float], [513 x float]* %937, i64 0, i64 %939
  %941 = load float, float* %940, align 4
  store float %941, float* %54, align 4
  %942 = load i32, i32* %31, align 4
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav, i64 0, i64 %943
  %945 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %944, i64 0, i64 1
  %946 = load i32, i32* %34, align 4
  %947 = sext i32 %946 to i64
  %948 = getelementptr inbounds [513 x float], [513 x float]* %945, i64 0, i64 %947
  %949 = load float, float* %948, align 4
  store float %949, float* %57, align 4
  %950 = load i32, i32* %31, align 4
  %951 = sext i32 %950 to i64
  %952 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav, i64 0, i64 %951
  %953 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %952, i64 0, i64 1
  %954 = load i32, i32* %34, align 4
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds [513 x float], [513 x float]* %953, i64 0, i64 %955
  %957 = load float, float* %956, align 4
  store float %957, float* %60, align 4
  %958 = load i32, i32* %31, align 4
  %959 = sext i32 %958 to i64
  %960 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav, i64 0, i64 %959
  %961 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %960, i64 0, i64 0
  %962 = load i32, i32* %34, align 4
  %963 = sext i32 %962 to i64
  %964 = getelementptr inbounds [513 x float], [513 x float]* %961, i64 0, i64 %963
  %965 = load float, float* %964, align 4
  %966 = load i32, i32* %31, align 4
  %967 = sext i32 %966 to i64
  %968 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav, i64 0, i64 %967
  %969 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %968, i64 0, i64 1
  %970 = load i32, i32* %34, align 4
  %971 = sext i32 %970 to i64
  %972 = getelementptr inbounds [513 x float], [513 x float]* %969, i64 0, i64 %971
  store float %965, float* %972, align 4
  store float %965, float* %53, align 4
  %973 = load i32, i32* %31, align 4
  %974 = sext i32 %973 to i64
  %975 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav, i64 0, i64 %974
  %976 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %975, i64 0, i64 0
  %977 = load i32, i32* %34, align 4
  %978 = sext i32 %977 to i64
  %979 = getelementptr inbounds [513 x float], [513 x float]* %976, i64 0, i64 %978
  %980 = load float, float* %979, align 4
  %981 = load i32, i32* %31, align 4
  %982 = sext i32 %981 to i64
  %983 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav, i64 0, i64 %982
  %984 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %983, i64 0, i64 1
  %985 = load i32, i32* %34, align 4
  %986 = sext i32 %985 to i64
  %987 = getelementptr inbounds [513 x float], [513 x float]* %984, i64 0, i64 %986
  store float %980, float* %987, align 4
  store float %980, float* %56, align 4
  %988 = load i32, i32* %31, align 4
  %989 = sext i32 %988 to i64
  %990 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav, i64 0, i64 %989
  %991 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %990, i64 0, i64 0
  %992 = load i32, i32* %34, align 4
  %993 = sext i32 %992 to i64
  %994 = getelementptr inbounds [513 x float], [513 x float]* %991, i64 0, i64 %993
  %995 = load float, float* %994, align 4
  %996 = load i32, i32* %31, align 4
  %997 = sext i32 %996 to i64
  %998 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav, i64 0, i64 %997
  %999 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %998, i64 0, i64 1
  %1000 = load i32, i32* %34, align 4
  %1001 = sext i32 %1000 to i64
  %1002 = getelementptr inbounds [513 x float], [513 x float]* %999, i64 0, i64 %1001
  store float %995, float* %1002, align 4
  store float %995, float* %59, align 4
  %1003 = load [1024 x float]*, [1024 x float]** %23, align 8
  %1004 = load i32, i32* %34, align 4
  %1005 = sext i32 %1004 to i64
  %1006 = getelementptr inbounds [1024 x float], [1024 x float]* %1003, i64 0, i64 %1005
  %1007 = load float, float* %1006, align 4
  %1008 = load i32, i32* %31, align 4
  %1009 = sext i32 %1008 to i64
  %1010 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav, i64 0, i64 %1009
  %1011 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %1010, i64 0, i64 0
  %1012 = load i32, i32* %34, align 4
  %1013 = sext i32 %1012 to i64
  %1014 = getelementptr inbounds [513 x float], [513 x float]* %1011, i64 0, i64 %1013
  store float %1007, float* %1014, align 4
  store float %1007, float* %52, align 4
  %1015 = load i32, i32* %34, align 4
  %1016 = icmp eq i32 %1015, 0
  br i1 %1016, label %1017, label %1022

; <label>:1017:                                   ; preds = %933
  %pgocount53 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 115)
  %1018 = add i64 %pgocount53, 1
  store i64 %1018, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 115)
  %1019 = load [1024 x float]*, [1024 x float]** %23, align 8
  %1020 = getelementptr inbounds [1024 x float], [1024 x float]* %1019, i64 0, i64 0
  %1021 = load float, float* %1020, align 4
  br label %1029

; <label>:1022:                                   ; preds = %933
  %1023 = load [1024 x float]*, [1024 x float]** %23, align 8
  %1024 = load i32, i32* %34, align 4
  %1025 = sub nsw i32 1024, %1024
  %1026 = sext i32 %1025 to i64
  %1027 = getelementptr inbounds [1024 x float], [1024 x float]* %1023, i64 0, i64 %1026
  %1028 = load float, float* %1027, align 4
  br label %1029

; <label>:1029:                                   ; preds = %1022, %1017
  %1030 = phi float [ %1021, %1017 ], [ %1028, %1022 ]
  %1031 = load i32, i32* %31, align 4
  %1032 = sext i32 %1031 to i64
  %1033 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav, i64 0, i64 %1032
  %1034 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %1033, i64 0, i64 0
  %1035 = load i32, i32* %34, align 4
  %1036 = sext i32 %1035 to i64
  %1037 = getelementptr inbounds [513 x float], [513 x float]* %1034, i64 0, i64 %1036
  store float %1030, float* %1037, align 4
  store float %1030, float* %55, align 4
  %1038 = load i32, i32* %34, align 4
  %1039 = sext i32 %1038 to i64
  %1040 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %1039
  %1041 = load float, float* %1040, align 4
  %1042 = fpext float %1041 to double
  %1043 = call double @sqrt(double %1042) #6
  %1044 = fptrunc double %1043 to float
  %1045 = load i32, i32* %31, align 4
  %1046 = sext i32 %1045 to i64
  %1047 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav, i64 0, i64 %1046
  %1048 = getelementptr inbounds [2 x [513 x float]], [2 x [513 x float]]* %1047, i64 0, i64 0
  %1049 = load i32, i32* %34, align 4
  %1050 = sext i32 %1049 to i64
  %1051 = getelementptr inbounds [513 x float], [513 x float]* %1048, i64 0, i64 %1050
  store float %1044, float* %1051, align 4
  store float %1044, float* %58, align 4
  %1052 = load float, float* %59, align 4
  %1053 = fcmp une float %1052, 0.000000e+00
  br i1 %1053, label %1054, label %1069

; <label>:1054:                                   ; preds = %1029
  %1055 = load float, float* %53, align 4
  %1056 = load float, float* %56, align 4
  %1057 = fmul float %1055, %1056
  store float %1057, float* %61, align 4
  %1058 = load float, float* %53, align 4
  %1059 = load float, float* %53, align 4
  %1060 = fmul float %1058, %1059
  %1061 = load float, float* %56, align 4
  %1062 = load float, float* %56, align 4
  %1063 = fmul float %1061, %1062
  %1064 = fsub float %1060, %1063
  %1065 = fmul float %1064, 5.000000e-01
  store float %1065, float* %62, align 4
  %1066 = load float, float* %59, align 4
  %1067 = load float, float* %59, align 4
  %1068 = fmul float %1066, %1067
  store float %1068, float* %63, align 4
  br label %1071

; <label>:1069:                                   ; preds = %1029
  %pgocount54 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 116)
  %1070 = add i64 %pgocount54, 1
  store i64 %1070, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 116)
  store float 1.000000e+00, float* %61, align 4
  store float 0.000000e+00, float* %62, align 4
  store float 1.000000e+00, float* %63, align 4
  br label %1071

; <label>:1071:                                   ; preds = %1069, %1054
  %1072 = load float, float* %60, align 4
  %1073 = fcmp une float %1072, 0.000000e+00
  br i1 %1073, label %1074, label %1099

; <label>:1074:                                   ; preds = %1071
  %1075 = load float, float* %62, align 4
  %1076 = load float, float* %61, align 4
  %1077 = fadd float %1075, %1076
  %1078 = load float, float* %54, align 4
  %1079 = load float, float* %57, align 4
  %1080 = fadd float %1078, %1079
  %1081 = fmul float %1077, %1080
  %1082 = fmul float %1081, 5.000000e-01
  store float %1082, float* %64, align 4
  %1083 = load float, float* %54, align 4
  %1084 = fsub float -0.000000e+00, %1083
  %1085 = load float, float* %61, align 4
  %1086 = fmul float %1084, %1085
  %1087 = load float, float* %64, align 4
  %1088 = fadd float %1086, %1087
  store float %1088, float* %65, align 4
  %1089 = load float, float* %57, align 4
  %1090 = fsub float -0.000000e+00, %1089
  %1091 = load float, float* %62, align 4
  %1092 = fmul float %1090, %1091
  %1093 = load float, float* %64, align 4
  %1094 = fadd float %1092, %1093
  store float %1094, float* %61, align 4
  %1095 = load float, float* %65, align 4
  store float %1095, float* %62, align 4
  %1096 = load float, float* %60, align 4
  %1097 = load float, float* %63, align 4
  %1098 = fmul float %1097, %1096
  store float %1098, float* %63, align 4
  br label %1101

; <label>:1099:                                   ; preds = %1071
  %pgocount55 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 117)
  %1100 = add i64 %pgocount55, 1
  store i64 %1100, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 117)
  br label %1101

; <label>:1101:                                   ; preds = %1099, %1074
  %1102 = load float, float* %59, align 4
  %1103 = fmul float 2.000000e+00, %1102
  %1104 = load float, float* %60, align 4
  %1105 = fsub float %1103, %1104
  %1106 = load float, float* %63, align 4
  %1107 = fdiv float %1105, %1106
  store float %1107, float* %66, align 4
  %1108 = load float, float* %66, align 4
  %1109 = load float, float* %61, align 4
  %1110 = fmul float %1109, %1108
  store float %1110, float* %61, align 4
  %1111 = load float, float* %66, align 4
  %1112 = load float, float* %62, align 4
  %1113 = fmul float %1112, %1111
  store float %1113, float* %62, align 4
  %1114 = load float, float* %58, align 4
  %1115 = fpext float %1114 to double
  %1116 = load float, float* %59, align 4
  %1117 = fmul float 2.000000e+00, %1116
  %1118 = load float, float* %60, align 4
  %1119 = fsub float %1117, %1118
  %1120 = fpext float %1119 to double
  %1121 = call double @fabs(double %1120) #8
  %1122 = fadd double %1115, %1121
  %1123 = fptrunc double %1122 to float
  store float %1123, float* %63, align 4
  %1124 = load float, float* %63, align 4
  %1125 = fcmp une float %1124, 0.000000e+00
  br i1 %1125, label %1127, label %._crit_edge3

._crit_edge3:                                     ; preds = %1101
  %pgocount56 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 59)
  %1126 = add i64 %pgocount56, 1
  store i64 %1126, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 59)
  br label %1154

; <label>:1127:                                   ; preds = %1101
  %pgocount57 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 41)
  %1128 = add i64 %pgocount57, 1
  store i64 %1128, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 41)
  %1129 = load float, float* %52, align 4
  %1130 = load float, float* %55, align 4
  %1131 = fadd float %1129, %1130
  %1132 = fmul float %1131, 5.000000e-01
  %1133 = load float, float* %61, align 4
  %1134 = fsub float %1132, %1133
  store float %1134, float* %61, align 4
  %1135 = load float, float* %52, align 4
  %1136 = load float, float* %55, align 4
  %1137 = fsub float %1135, %1136
  %1138 = fmul float %1137, 5.000000e-01
  %1139 = load float, float* %62, align 4
  %1140 = fsub float %1138, %1139
  store float %1140, float* %62, align 4
  %1141 = load float, float* %61, align 4
  %1142 = load float, float* %61, align 4
  %1143 = fmul float %1141, %1142
  %1144 = load float, float* %62, align 4
  %1145 = load float, float* %62, align 4
  %1146 = fmul float %1144, %1145
  %1147 = fadd float %1143, %1146
  %1148 = fpext float %1147 to double
  %1149 = call double @sqrt(double %1148) #6
  %1150 = load float, float* %63, align 4
  %1151 = fpext float %1150 to double
  %1152 = fdiv double %1149, %1151
  %1153 = fptrunc double %1152 to float
  store float %1153, float* %63, align 4
  br label %1154

; <label>:1154:                                   ; preds = %1127, %._crit_edge3
  %1155 = load float, float* %63, align 4
  %1156 = load i32, i32* %34, align 4
  %1157 = sext i32 %1156 to i64
  %1158 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %1157
  store float %1155, float* %1158, align 4
  br label %1159

; <label>:1159:                                   ; preds = %1154
  %1160 = load i32, i32* %34, align 4
  %1161 = add nsw i32 %1160, 1
  store i32 %1161, i32* %34, align 4
  br label %929

; <label>:1162:                                   ; preds = %929
  %1163 = load i32, i32* @L3psycho_anal.cw_lower_index, align 4
  store i32 %1163, i32* %34, align 4
  br label %1164

; <label>:1164:                                   ; preds = %1351, %1162
  %1165 = load i32, i32* %34, align 4
  %1166 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  %1167 = icmp slt i32 %1165, %1166
  br i1 %1167, label %1168, label %1354

; <label>:1168:                                   ; preds = %1164
  %1169 = load i32, i32* %34, align 4
  %1170 = add nsw i32 %1169, 2
  %1171 = sdiv i32 %1170, 4
  store i32 %1171, i32* %35, align 4
  %1172 = load i32, i32* %35, align 4
  %1173 = sext i32 %1172 to i64
  %1174 = getelementptr inbounds [129 x float], [129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0), i64 0, i64 %1173
  %1175 = load float, float* %1174, align 4
  store float %1175, float* %68, align 4
  %1176 = load float, float* %68, align 4
  %1177 = fcmp une float %1176, 0.000000e+00
  br i1 %1177, label %1178, label %1208

; <label>:1178:                                   ; preds = %1168
  %1179 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %1180 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %1179, i64 0, i64 0
  %1181 = load i32, i32* %35, align 4
  %1182 = sext i32 %1181 to i64
  %1183 = getelementptr inbounds [256 x float], [256 x float]* %1180, i64 0, i64 %1182
  %1184 = load float, float* %1183, align 4
  store float %1184, float* %73, align 4
  %1185 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %1186 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %1185, i64 0, i64 0
  %1187 = load i32, i32* %35, align 4
  %1188 = sub nsw i32 256, %1187
  %1189 = sext i32 %1188 to i64
  %1190 = getelementptr inbounds [256 x float], [256 x float]* %1186, i64 0, i64 %1189
  %1191 = load float, float* %1190, align 4
  store float %1191, float* %74, align 4
  %1192 = load float, float* %73, align 4
  %1193 = load float, float* %74, align 4
  %1194 = fmul float %1192, %1193
  store float %1194, float* %70, align 4
  %1195 = load float, float* %73, align 4
  %1196 = load float, float* %73, align 4
  %1197 = fmul float %1195, %1196
  %1198 = load float, float* %74, align 4
  %1199 = load float, float* %74, align 4
  %1200 = fmul float %1198, %1199
  %1201 = fsub float %1197, %1200
  %1202 = fmul float %1201, 5.000000e-01
  store float %1202, float* %71, align 4
  %1203 = load float, float* %68, align 4
  store float %1203, float* %72, align 4
  %1204 = load float, float* %68, align 4
  %1205 = fpext float %1204 to double
  %1206 = call double @sqrt(double %1205) #6
  %1207 = fptrunc double %1206 to float
  store float %1207, float* %68, align 4
  br label %1210

; <label>:1208:                                   ; preds = %1168
  %pgocount58 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 118)
  %1209 = add i64 %pgocount58, 1
  store i64 %1209, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 118)
  store float 1.000000e+00, float* %70, align 4
  store float 0.000000e+00, float* %71, align 4
  store float 1.000000e+00, float* %72, align 4
  br label %1210

; <label>:1210:                                   ; preds = %1208, %1178
  %1211 = load i32, i32* %35, align 4
  %1212 = sext i32 %1211 to i64
  %1213 = getelementptr inbounds [129 x float], [129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2), i64 0, i64 %1212
  %1214 = load float, float* %1213, align 4
  store float %1214, float* %69, align 4
  %1215 = load float, float* %69, align 4
  %1216 = fcmp une float %1215, 0.000000e+00
  br i1 %1216, label %1217, label %1259

; <label>:1217:                                   ; preds = %1210
  %1218 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %1219 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %1218, i64 0, i64 2
  %1220 = load i32, i32* %35, align 4
  %1221 = sext i32 %1220 to i64
  %1222 = getelementptr inbounds [256 x float], [256 x float]* %1219, i64 0, i64 %1221
  %1223 = load float, float* %1222, align 4
  store float %1223, float* %75, align 4
  %1224 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %1225 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %1224, i64 0, i64 2
  %1226 = load i32, i32* %35, align 4
  %1227 = sub nsw i32 256, %1226
  %1228 = sext i32 %1227 to i64
  %1229 = getelementptr inbounds [256 x float], [256 x float]* %1225, i64 0, i64 %1228
  %1230 = load float, float* %1229, align 4
  store float %1230, float* %76, align 4
  %1231 = load float, float* %71, align 4
  %1232 = load float, float* %70, align 4
  %1233 = fadd float %1231, %1232
  %1234 = load float, float* %75, align 4
  %1235 = load float, float* %76, align 4
  %1236 = fadd float %1234, %1235
  %1237 = fmul float %1233, %1236
  %1238 = fmul float %1237, 5.000000e-01
  store float %1238, float* %77, align 4
  %1239 = load float, float* %75, align 4
  %1240 = fsub float -0.000000e+00, %1239
  %1241 = load float, float* %70, align 4
  %1242 = fmul float %1240, %1241
  %1243 = load float, float* %77, align 4
  %1244 = fadd float %1242, %1243
  store float %1244, float* %78, align 4
  %1245 = load float, float* %76, align 4
  %1246 = fsub float -0.000000e+00, %1245
  %1247 = load float, float* %71, align 4
  %1248 = fmul float %1246, %1247
  %1249 = load float, float* %77, align 4
  %1250 = fadd float %1248, %1249
  store float %1250, float* %70, align 4
  %1251 = load float, float* %78, align 4
  store float %1251, float* %71, align 4
  %1252 = load float, float* %69, align 4
  %1253 = fpext float %1252 to double
  %1254 = call double @sqrt(double %1253) #6
  %1255 = fptrunc double %1254 to float
  store float %1255, float* %69, align 4
  %1256 = load float, float* %69, align 4
  %1257 = load float, float* %72, align 4
  %1258 = fmul float %1257, %1256
  store float %1258, float* %72, align 4
  br label %1261

; <label>:1259:                                   ; preds = %1210
  %pgocount59 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 119)
  %1260 = add i64 %pgocount59, 1
  store i64 %1260, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 119)
  br label %1261

; <label>:1261:                                   ; preds = %1259, %1217
  %1262 = load float, float* %68, align 4
  %1263 = fmul float 2.000000e+00, %1262
  %1264 = load float, float* %69, align 4
  %1265 = fsub float %1263, %1264
  %1266 = load float, float* %72, align 4
  %1267 = fdiv float %1265, %1266
  store float %1267, float* %79, align 4
  %1268 = load float, float* %79, align 4
  %1269 = load float, float* %70, align 4
  %1270 = fmul float %1269, %1268
  store float %1270, float* %70, align 4
  %1271 = load float, float* %79, align 4
  %1272 = load float, float* %71, align 4
  %1273 = fmul float %1272, %1271
  store float %1273, float* %71, align 4
  %1274 = load i32, i32* %35, align 4
  %1275 = sext i32 %1274 to i64
  %1276 = getelementptr inbounds [129 x float], [129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1), i64 0, i64 %1275
  %1277 = load float, float* %1276, align 4
  %1278 = fpext float %1277 to double
  %1279 = call double @sqrt(double %1278) #6
  %1280 = fptrunc double %1279 to float
  store float %1280, float* %67, align 4
  %1281 = load float, float* %67, align 4
  %1282 = fpext float %1281 to double
  %1283 = load float, float* %68, align 4
  %1284 = fmul float 2.000000e+00, %1283
  %1285 = load float, float* %69, align 4
  %1286 = fsub float %1284, %1285
  %1287 = fpext float %1286 to double
  %1288 = call double @fabs(double %1287) #8
  %1289 = fadd double %1282, %1288
  %1290 = fptrunc double %1289 to float
  store float %1290, float* %72, align 4
  %1291 = load float, float* %72, align 4
  %1292 = fcmp une float %1291, 0.000000e+00
  br i1 %1292, label %1294, label %._crit_edge4

._crit_edge4:                                     ; preds = %1261
  %pgocount60 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 60)
  %1293 = add i64 %pgocount60, 1
  store i64 %1293, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 60)
  br label %1334

; <label>:1294:                                   ; preds = %1261
  %pgocount61 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 42)
  %1295 = add i64 %pgocount61, 1
  store i64 %1295, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 42)
  %1296 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %1297 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %1296, i64 0, i64 1
  %1298 = load i32, i32* %35, align 4
  %1299 = sext i32 %1298 to i64
  %1300 = getelementptr inbounds [256 x float], [256 x float]* %1297, i64 0, i64 %1299
  %1301 = load float, float* %1300, align 4
  store float %1301, float* %80, align 4
  %1302 = load [3 x [256 x float]]*, [3 x [256 x float]]** %24, align 8
  %1303 = getelementptr inbounds [3 x [256 x float]], [3 x [256 x float]]* %1302, i64 0, i64 1
  %1304 = load i32, i32* %35, align 4
  %1305 = sub nsw i32 256, %1304
  %1306 = sext i32 %1305 to i64
  %1307 = getelementptr inbounds [256 x float], [256 x float]* %1303, i64 0, i64 %1306
  %1308 = load float, float* %1307, align 4
  store float %1308, float* %81, align 4
  %1309 = load float, float* %80, align 4
  %1310 = load float, float* %81, align 4
  %1311 = fadd float %1309, %1310
  %1312 = fmul float %1311, 5.000000e-01
  %1313 = load float, float* %70, align 4
  %1314 = fsub float %1312, %1313
  store float %1314, float* %70, align 4
  %1315 = load float, float* %80, align 4
  %1316 = load float, float* %81, align 4
  %1317 = fsub float %1315, %1316
  %1318 = fmul float %1317, 5.000000e-01
  %1319 = load float, float* %71, align 4
  %1320 = fsub float %1318, %1319
  store float %1320, float* %71, align 4
  %1321 = load float, float* %70, align 4
  %1322 = load float, float* %70, align 4
  %1323 = fmul float %1321, %1322
  %1324 = load float, float* %71, align 4
  %1325 = load float, float* %71, align 4
  %1326 = fmul float %1324, %1325
  %1327 = fadd float %1323, %1326
  %1328 = fpext float %1327 to double
  %1329 = call double @sqrt(double %1328) #6
  %1330 = load float, float* %72, align 4
  %1331 = fpext float %1330 to double
  %1332 = fdiv double %1329, %1331
  %1333 = fptrunc double %1332 to float
  store float %1333, float* %72, align 4
  br label %1334

; <label>:1334:                                   ; preds = %1294, %._crit_edge4
  %1335 = load float, float* %72, align 4
  %1336 = load i32, i32* %34, align 4
  %1337 = sext i32 %1336 to i64
  %1338 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %1337
  store float %1335, float* %1338, align 4
  %1339 = load i32, i32* %34, align 4
  %1340 = add nsw i32 %1339, 3
  %1341 = sext i32 %1340 to i64
  %1342 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %1341
  store float %1335, float* %1342, align 4
  %1343 = load i32, i32* %34, align 4
  %1344 = add nsw i32 %1343, 2
  %1345 = sext i32 %1344 to i64
  %1346 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %1345
  store float %1335, float* %1346, align 4
  %1347 = load i32, i32* %34, align 4
  %1348 = add nsw i32 %1347, 1
  %1349 = sext i32 %1348 to i64
  %1350 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %1349
  store float %1335, float* %1350, align 4
  br label %1351

; <label>:1351:                                   ; preds = %1334
  %1352 = load i32, i32* %34, align 4
  %1353 = add nsw i32 %1352, 4
  store i32 %1353, i32* %34, align 4
  br label %1164

; <label>:1354:                                   ; preds = %1164
  store i32 0, i32* %32, align 4
  store i32 0, i32* %34, align 4
  br label %1355

; <label>:1355:                                   ; preds = %1411, %1354
  %1356 = load i32, i32* %34, align 4
  %1357 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  %1358 = icmp slt i32 %1356, %1357
  br i1 %1358, label %1359, label %1423

; <label>:1359:                                   ; preds = %1355
  %1360 = load i32, i32* %34, align 4
  %1361 = sext i32 %1360 to i64
  %1362 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %1361
  %1363 = load float, float* %1362, align 4
  %1364 = fpext float %1363 to double
  store double %1364, double* %82, align 8
  %1365 = load i32, i32* %34, align 4
  %1366 = sext i32 %1365 to i64
  %1367 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %1366
  %1368 = load float, float* %1367, align 4
  %1369 = load i32, i32* %34, align 4
  %1370 = sext i32 %1369 to i64
  %1371 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %1370
  %1372 = load float, float* %1371, align 4
  %1373 = fmul float %1368, %1372
  %1374 = fpext float %1373 to double
  store double %1374, double* %83, align 8
  %1375 = load i32, i32* %34, align 4
  %1376 = add nsw i32 %1375, 1
  store i32 %1376, i32* %34, align 4
  %1377 = load i32, i32* %32, align 4
  %1378 = sext i32 %1377 to i64
  %1379 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i64 0, i64 %1378
  %1380 = load i32, i32* %1379, align 4
  %1381 = sub nsw i32 %1380, 1
  store i32 %1381, i32* %84, align 4
  br label %1382

; <label>:1382:                                   ; preds = %1408, %1359
  %1383 = load i32, i32* %84, align 4
  %1384 = icmp sgt i32 %1383, 0
  br i1 %1384, label %1385, label %1411

; <label>:1385:                                   ; preds = %1382
  %pgocount62 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 12)
  %1386 = add i64 %pgocount62, 1
  store i64 %1386, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 12)
  %1387 = load i32, i32* %34, align 4
  %1388 = sext i32 %1387 to i64
  %1389 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %1388
  %1390 = load float, float* %1389, align 4
  %1391 = fpext float %1390 to double
  %1392 = load double, double* %82, align 8
  %1393 = fadd double %1392, %1391
  store double %1393, double* %82, align 8
  %1394 = load i32, i32* %34, align 4
  %1395 = sext i32 %1394 to i64
  %1396 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %1395
  %1397 = load float, float* %1396, align 4
  %1398 = load i32, i32* %34, align 4
  %1399 = sext i32 %1398 to i64
  %1400 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %1399
  %1401 = load float, float* %1400, align 4
  %1402 = fmul float %1397, %1401
  %1403 = fpext float %1402 to double
  %1404 = load double, double* %83, align 8
  %1405 = fadd double %1404, %1403
  store double %1405, double* %83, align 8
  %1406 = load i32, i32* %34, align 4
  %1407 = add nsw i32 %1406, 1
  store i32 %1407, i32* %34, align 4
  br label %1408

; <label>:1408:                                   ; preds = %1385
  %1409 = load i32, i32* %84, align 4
  %1410 = add nsw i32 %1409, -1
  store i32 %1410, i32* %84, align 4
  br label %1382

; <label>:1411:                                   ; preds = %1382
  %pgocount63 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 37)
  %1412 = add i64 %pgocount63, 1
  store i64 %1412, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 37)
  %1413 = load double, double* %82, align 8
  %1414 = load i32, i32* %32, align 4
  %1415 = sext i32 %1414 to i64
  %1416 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1415
  store double %1413, double* %1416, align 8
  %1417 = load double, double* %83, align 8
  %1418 = load i32, i32* %32, align 4
  %1419 = sext i32 %1418 to i64
  %1420 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.cb, i64 0, i64 %1419
  store double %1417, double* %1420, align 8
  %1421 = load i32, i32* %32, align 4
  %1422 = add nsw i32 %1421, 1
  store i32 %1422, i32* %32, align 4
  br label %1355

; <label>:1423:                                   ; preds = %1355
  br label %1424

; <label>:1424:                                   ; preds = %1466, %1423
  %1425 = load i32, i32* %32, align 4
  %1426 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %1427 = icmp slt i32 %1425, %1426
  br i1 %1427, label %1428, label %1470

; <label>:1428:                                   ; preds = %1424
  %1429 = load i32, i32* %34, align 4
  %1430 = add nsw i32 %1429, 1
  store i32 %1430, i32* %34, align 4
  %1431 = sext i32 %1429 to i64
  %1432 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %1431
  %1433 = load float, float* %1432, align 4
  %1434 = fpext float %1433 to double
  store double %1434, double* %86, align 8
  %1435 = load i32, i32* %32, align 4
  %1436 = sext i32 %1435 to i64
  %1437 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i64 0, i64 %1436
  %1438 = load i32, i32* %1437, align 4
  %1439 = sub nsw i32 %1438, 1
  store i32 %1439, i32* %85, align 4
  br label %1440

; <label>:1440:                                   ; preds = %1453, %1428
  %1441 = load i32, i32* %85, align 4
  %1442 = icmp sgt i32 %1441, 0
  br i1 %1442, label %1443, label %1456

; <label>:1443:                                   ; preds = %1440
  %pgocount64 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 13)
  %1444 = add i64 %pgocount64, 1
  store i64 %1444, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 13)
  %1445 = load i32, i32* %34, align 4
  %1446 = add nsw i32 %1445, 1
  store i32 %1446, i32* %34, align 4
  %1447 = sext i32 %1445 to i64
  %1448 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %1447
  %1449 = load float, float* %1448, align 4
  %1450 = fpext float %1449 to double
  %1451 = load double, double* %86, align 8
  %1452 = fadd double %1451, %1450
  store double %1452, double* %86, align 8
  br label %1453

; <label>:1453:                                   ; preds = %1443
  %1454 = load i32, i32* %85, align 4
  %1455 = add nsw i32 %1454, -1
  store i32 %1455, i32* %85, align 4
  br label %1440

; <label>:1456:                                   ; preds = %1440
  %1457 = load double, double* %86, align 8
  %1458 = load i32, i32* %32, align 4
  %1459 = sext i32 %1458 to i64
  %1460 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1459
  store double %1457, double* %1460, align 8
  %1461 = load double, double* %86, align 8
  %1462 = fmul double %1461, 4.000000e-01
  %1463 = load i32, i32* %32, align 4
  %1464 = sext i32 %1463 to i64
  %1465 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.cb, i64 0, i64 %1464
  store double %1462, double* %1465, align 8
  br label %1466

; <label>:1466:                                   ; preds = %1456
  %pgocount65 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 38)
  %1467 = add i64 %pgocount65, 1
  store i64 %1467, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 38)
  %1468 = load i32, i32* %32, align 4
  %1469 = add nsw i32 %1468, 1
  store i32 %1469, i32* %32, align 4
  br label %1424

; <label>:1470:                                   ; preds = %1424
  %1471 = load i32, i32* %31, align 4
  %1472 = sext i32 %1471 to i64
  %1473 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %1472
  store double 0.000000e+00, double* %1473, align 8
  store i32 0, i32* %32, align 4
  br label %1474

; <label>:1474:                                   ; preds = %1730, %1470
  %1475 = load i32, i32* %32, align 4
  %1476 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %1477 = icmp slt i32 %1475, %1476
  br i1 %1477, label %1478, label %1733

; <label>:1478:                                   ; preds = %1474
  store double 0.000000e+00, double* %88, align 8
  store double 0.000000e+00, double* %89, align 8
  %1479 = load i32, i32* %32, align 4
  %1480 = sext i32 %1479 to i64
  %1481 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %1480
  %1482 = getelementptr inbounds [2 x i32], [2 x i32]* %1481, i64 0, i64 0
  %1483 = load i32, i32* %1482, align 8
  store i32 %1483, i32* %35, align 4
  br label %1484

; <label>:1484:                                   ; preds = %1522, %1478
  %1485 = load i32, i32* %35, align 4
  %1486 = load i32, i32* %32, align 4
  %1487 = sext i32 %1486 to i64
  %1488 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %1487
  %1489 = getelementptr inbounds [2 x i32], [2 x i32]* %1488, i64 0, i64 1
  %1490 = load i32, i32* %1489, align 4
  %1491 = icmp sle i32 %1485, %1490
  br i1 %1491, label %1492, label %1525

; <label>:1492:                                   ; preds = %1484
  %pgocount66 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 14)
  %1493 = add i64 %pgocount66, 1
  store i64 %1493, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 14)
  %1494 = load i32, i32* %32, align 4
  %1495 = sext i32 %1494 to i64
  %1496 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %1495
  %1497 = load i32, i32* %35, align 4
  %1498 = sext i32 %1497 to i64
  %1499 = getelementptr inbounds [64 x double], [64 x double]* %1496, i64 0, i64 %1498
  %1500 = load double, double* %1499, align 8
  %1501 = load i32, i32* %35, align 4
  %1502 = sext i32 %1501 to i64
  %1503 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1502
  %1504 = load double, double* %1503, align 8
  %1505 = fmul double %1500, %1504
  %1506 = load double, double* %88, align 8
  %1507 = fadd double %1506, %1505
  store double %1507, double* %88, align 8
  %1508 = load i32, i32* %32, align 4
  %1509 = sext i32 %1508 to i64
  %1510 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %1509
  %1511 = load i32, i32* %35, align 4
  %1512 = sext i32 %1511 to i64
  %1513 = getelementptr inbounds [64 x double], [64 x double]* %1510, i64 0, i64 %1512
  %1514 = load double, double* %1513, align 8
  %1515 = load i32, i32* %35, align 4
  %1516 = sext i32 %1515 to i64
  %1517 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.cb, i64 0, i64 %1516
  %1518 = load double, double* %1517, align 8
  %1519 = fmul double %1514, %1518
  %1520 = load double, double* %89, align 8
  %1521 = fadd double %1520, %1519
  store double %1521, double* %89, align 8
  br label %1522

; <label>:1522:                                   ; preds = %1492
  %1523 = load i32, i32* %35, align 4
  %1524 = add nsw i32 %1523, 1
  store i32 %1524, i32* %35, align 4
  br label %1484

; <label>:1525:                                   ; preds = %1484
  %1526 = load double, double* %88, align 8
  store double %1526, double* %87, align 8
  %1527 = load double, double* %87, align 8
  %1528 = fcmp une double %1527, 0.000000e+00
  br i1 %1528, label %1530, label %._crit_edge5

._crit_edge5:                                     ; preds = %1525
  %pgocount67 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 61)
  %1529 = add i64 %pgocount67, 1
  store i64 %1529, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 61)
  br label %1554

; <label>:1530:                                   ; preds = %1525
  %1531 = load double, double* %89, align 8
  %1532 = load double, double* %87, align 8
  %1533 = fdiv double %1531, %1532
  store double %1533, double* %87, align 8
  %1534 = load double, double* %87, align 8
  %1535 = fcmp ole double %1534, 0x3FA8F6869E6F084D
  br i1 %1535, label %1536, label %1539

; <label>:1536:                                   ; preds = %1530
  %pgocount68 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 62)
  %1537 = add i64 %pgocount68, 1
  store i64 %1537, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 62)
  %1538 = call double @exp(double 0xC0061AD547A6661A) #6
  store double %1538, double* %87, align 8
  br label %1553

; <label>:1539:                                   ; preds = %1530
  %1540 = load double, double* %87, align 8
  %1541 = fcmp ogt double %1540, 0x3FDFEDFBDEEA22F7
  br i1 %1541, label %1542, label %1544

; <label>:1542:                                   ; preds = %1539
  %pgocount69 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 72)
  %1543 = add i64 %pgocount69, 1
  store i64 %1543, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 72)
  store double 1.000000e+00, double* %87, align 8
  br label %1552

; <label>:1544:                                   ; preds = %1539
  %pgocount70 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 73)
  %1545 = add i64 %pgocount70, 1
  store i64 %1545, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 73)
  %1546 = load double, double* %87, align 8
  %1547 = call double @log(double %1546) #6
  store double %1547, double* %87, align 8
  %1548 = load double, double* %87, align 8
  %1549 = fmul double 0x3FF30298B36105E3, %1548
  %1550 = fadd double 0x3FEA6FF6E4078667, %1549
  %1551 = call double @exp(double %1550) #6
  store double %1551, double* %87, align 8
  br label %1552

; <label>:1552:                                   ; preds = %1544, %1542
  br label %1553

; <label>:1553:                                   ; preds = %1552, %1536
  br label %1554

; <label>:1554:                                   ; preds = %1553, %._crit_edge5
  %1555 = load i32, i32* %32, align 4
  %1556 = sext i32 %1555 to i64
  %1557 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.minval, i64 0, i64 %1556
  %1558 = load double, double* %1557, align 8
  %1559 = load double, double* %87, align 8
  %1560 = fcmp olt double %1558, %1559
  br i1 %1560, label %1561, label %1566

; <label>:1561:                                   ; preds = %1554
  %1562 = load i32, i32* %32, align 4
  %1563 = sext i32 %1562 to i64
  %1564 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.minval, i64 0, i64 %1563
  %1565 = load double, double* %1564, align 8
  br label %1569

; <label>:1566:                                   ; preds = %1554
  %pgocount71 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 19)
  %1567 = add i64 %pgocount71, 1
  store i64 %1567, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 19)
  %1568 = load double, double* %87, align 8
  br label %1569

; <label>:1569:                                   ; preds = %1566, %1561
  %1570 = phi double [ %1565, %1561 ], [ %1568, %1566 ]
  store double %1570, double* %87, align 8
  %1571 = load double, double* %87, align 8
  %1572 = load double, double* %88, align 8
  %1573 = fmul double %1572, %1571
  store double %1573, double* %88, align 8
  %1574 = load double, double* %88, align 8
  %1575 = load i32, i32* %31, align 4
  %1576 = sext i32 %1575 to i64
  %1577 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_1, i64 0, i64 %1576
  %1578 = load i32, i32* %32, align 4
  %1579 = sext i32 %1578 to i64
  %1580 = getelementptr inbounds [63 x double], [63 x double]* %1577, i64 0, i64 %1579
  %1581 = load double, double* %1580, align 8
  %1582 = fmul double 2.000000e+00, %1581
  %1583 = load i32, i32* %31, align 4
  %1584 = sext i32 %1583 to i64
  %1585 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_2, i64 0, i64 %1584
  %1586 = load i32, i32* %32, align 4
  %1587 = sext i32 %1586 to i64
  %1588 = getelementptr inbounds [63 x double], [63 x double]* %1585, i64 0, i64 %1587
  %1589 = load double, double* %1588, align 8
  %1590 = fmul double 1.600000e+01, %1589
  %1591 = fcmp olt double %1582, %1590
  br i1 %1591, label %1592, label %1601

; <label>:1592:                                   ; preds = %1569
  %1593 = load i32, i32* %31, align 4
  %1594 = sext i32 %1593 to i64
  %1595 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_1, i64 0, i64 %1594
  %1596 = load i32, i32* %32, align 4
  %1597 = sext i32 %1596 to i64
  %1598 = getelementptr inbounds [63 x double], [63 x double]* %1595, i64 0, i64 %1597
  %1599 = load double, double* %1598, align 8
  %1600 = fmul double 2.000000e+00, %1599
  br label %1611

; <label>:1601:                                   ; preds = %1569
  %pgocount72 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 20)
  %1602 = add i64 %pgocount72, 1
  store i64 %1602, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 20)
  %1603 = load i32, i32* %31, align 4
  %1604 = sext i32 %1603 to i64
  %1605 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_2, i64 0, i64 %1604
  %1606 = load i32, i32* %32, align 4
  %1607 = sext i32 %1606 to i64
  %1608 = getelementptr inbounds [63 x double], [63 x double]* %1605, i64 0, i64 %1607
  %1609 = load double, double* %1608, align 8
  %1610 = fmul double 1.600000e+01, %1609
  br label %1611

; <label>:1611:                                   ; preds = %1601, %1592
  %1612 = phi double [ %1600, %1592 ], [ %1610, %1601 ]
  %1613 = fcmp olt double %1574, %1612
  br i1 %1613, label %1614, label %1616

; <label>:1614:                                   ; preds = %1611
  %1615 = load double, double* %88, align 8
  br label %1656

; <label>:1616:                                   ; preds = %1611
  %1617 = load i32, i32* %31, align 4
  %1618 = sext i32 %1617 to i64
  %1619 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_1, i64 0, i64 %1618
  %1620 = load i32, i32* %32, align 4
  %1621 = sext i32 %1620 to i64
  %1622 = getelementptr inbounds [63 x double], [63 x double]* %1619, i64 0, i64 %1621
  %1623 = load double, double* %1622, align 8
  %1624 = fmul double 2.000000e+00, %1623
  %1625 = load i32, i32* %31, align 4
  %1626 = sext i32 %1625 to i64
  %1627 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_2, i64 0, i64 %1626
  %1628 = load i32, i32* %32, align 4
  %1629 = sext i32 %1628 to i64
  %1630 = getelementptr inbounds [63 x double], [63 x double]* %1627, i64 0, i64 %1629
  %1631 = load double, double* %1630, align 8
  %1632 = fmul double 1.600000e+01, %1631
  %1633 = fcmp olt double %1624, %1632
  br i1 %1633, label %1634, label %1644

; <label>:1634:                                   ; preds = %1616
  %pgocount73 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 45)
  %1635 = add i64 %pgocount73, 1
  store i64 %1635, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 45)
  %1636 = load i32, i32* %31, align 4
  %1637 = sext i32 %1636 to i64
  %1638 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_1, i64 0, i64 %1637
  %1639 = load i32, i32* %32, align 4
  %1640 = sext i32 %1639 to i64
  %1641 = getelementptr inbounds [63 x double], [63 x double]* %1638, i64 0, i64 %1640
  %1642 = load double, double* %1641, align 8
  %1643 = fmul double 2.000000e+00, %1642
  br label %1654

; <label>:1644:                                   ; preds = %1616
  %pgocount74 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 46)
  %1645 = add i64 %pgocount74, 1
  store i64 %1645, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 46)
  %1646 = load i32, i32* %31, align 4
  %1647 = sext i32 %1646 to i64
  %1648 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_2, i64 0, i64 %1647
  %1649 = load i32, i32* %32, align 4
  %1650 = sext i32 %1649 to i64
  %1651 = getelementptr inbounds [63 x double], [63 x double]* %1648, i64 0, i64 %1650
  %1652 = load double, double* %1651, align 8
  %1653 = fmul double 1.600000e+01, %1652
  br label %1654

; <label>:1654:                                   ; preds = %1644, %1634
  %1655 = phi double [ %1643, %1634 ], [ %1653, %1644 ]
  br label %1656

; <label>:1656:                                   ; preds = %1654, %1614
  %1657 = phi double [ %1615, %1614 ], [ %1655, %1654 ]
  store double %1657, double* %90, align 8
  %1658 = load i32, i32* %32, align 4
  %1659 = sext i32 %1658 to i64
  %1660 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.qthr_l, i64 0, i64 %1659
  %1661 = load double, double* %1660, align 8
  %1662 = load double, double* %90, align 8
  %1663 = fcmp ogt double %1661, %1662
  br i1 %1663, label %1664, label %1669

; <label>:1664:                                   ; preds = %1656
  %1665 = load i32, i32* %32, align 4
  %1666 = sext i32 %1665 to i64
  %1667 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.qthr_l, i64 0, i64 %1666
  %1668 = load double, double* %1667, align 8
  br label %1672

; <label>:1669:                                   ; preds = %1656
  %pgocount75 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 21)
  %1670 = add i64 %pgocount75, 1
  store i64 %1670, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 21)
  %1671 = load double, double* %90, align 8
  br label %1672

; <label>:1672:                                   ; preds = %1669, %1664
  %1673 = phi double [ %1668, %1664 ], [ %1671, %1669 ]
  %1674 = load i32, i32* %32, align 4
  %1675 = sext i32 %1674 to i64
  %1676 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1675
  store double %1673, double* %1676, align 8
  %1677 = load i32, i32* %31, align 4
  %1678 = sext i32 %1677 to i64
  %1679 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_1, i64 0, i64 %1678
  %1680 = load i32, i32* %32, align 4
  %1681 = sext i32 %1680 to i64
  %1682 = getelementptr inbounds [63 x double], [63 x double]* %1679, i64 0, i64 %1681
  %1683 = load double, double* %1682, align 8
  %1684 = load i32, i32* %31, align 4
  %1685 = sext i32 %1684 to i64
  %1686 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_2, i64 0, i64 %1685
  %1687 = load i32, i32* %32, align 4
  %1688 = sext i32 %1687 to i64
  %1689 = getelementptr inbounds [63 x double], [63 x double]* %1686, i64 0, i64 %1688
  store double %1683, double* %1689, align 8
  %1690 = load double, double* %88, align 8
  %1691 = load i32, i32* %31, align 4
  %1692 = sext i32 %1691 to i64
  %1693 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_1, i64 0, i64 %1692
  %1694 = load i32, i32* %32, align 4
  %1695 = sext i32 %1694 to i64
  %1696 = getelementptr inbounds [63 x double], [63 x double]* %1693, i64 0, i64 %1695
  store double %1690, double* %1696, align 8
  %1697 = load i32, i32* %32, align 4
  %1698 = sext i32 %1697 to i64
  %1699 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1698
  %1700 = load double, double* %1699, align 8
  %1701 = load i32, i32* %32, align 4
  %1702 = sext i32 %1701 to i64
  %1703 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1702
  %1704 = load double, double* %1703, align 8
  %1705 = fcmp olt double %1700, %1704
  br i1 %1705, label %1707, label %._crit_edge

._crit_edge:                                      ; preds = %1672
  %pgocount76 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 26)
  %1706 = add i64 %pgocount76, 1
  store i64 %1706, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 26)
  br label %1729

; <label>:1707:                                   ; preds = %1672
  %1708 = load i32, i32* %32, align 4
  %1709 = sext i32 %1708 to i64
  %1710 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i64 0, i64 %1709
  %1711 = load i32, i32* %1710, align 4
  %1712 = sitofp i32 %1711 to double
  %1713 = load i32, i32* %32, align 4
  %1714 = sext i32 %1713 to i64
  %1715 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1714
  %1716 = load double, double* %1715, align 8
  %1717 = load i32, i32* %32, align 4
  %1718 = sext i32 %1717 to i64
  %1719 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1718
  %1720 = load double, double* %1719, align 8
  %1721 = fdiv double %1716, %1720
  %1722 = call double @log(double %1721) #6
  %1723 = fmul double %1712, %1722
  %1724 = load i32, i32* %31, align 4
  %1725 = sext i32 %1724 to i64
  %1726 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %1725
  %1727 = load double, double* %1726, align 8
  %1728 = fsub double %1727, %1723
  store double %1728, double* %1726, align 8
  br label %1729

; <label>:1729:                                   ; preds = %1707, %._crit_edge
  br label %1730

; <label>:1730:                                   ; preds = %1729
  %1731 = load i32, i32* %32, align 4
  %1732 = add nsw i32 %1731, 1
  store i32 %1732, i32* %32, align 4
  br label %1474

; <label>:1733:                                   ; preds = %1474
  %1734 = load i32, i32* %31, align 4
  %1735 = icmp slt i32 %1734, 2
  br i1 %1735, label %1736, label %1859

; <label>:1736:                                   ; preds = %1733
  %1737 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %1738 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1737, i32 0, i32 37
  %1739 = load i32, i32* %1738, align 8
  %1740 = icmp ne i32 %1739, 0
  br i1 %1740, label %1741, label %1746

; <label>:1741:                                   ; preds = %1736
  %pgocount77 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 64)
  %1742 = add i64 %pgocount77, 1
  store i64 %1742, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 64)
  %1743 = load i32, i32* %31, align 4
  %1744 = sext i32 %1743 to i64
  %1745 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 %1744
  store i32 1, i32* %1745, align 4
  br label %1858

; <label>:1746:                                   ; preds = %1736
  %1747 = load i32, i32* %31, align 4
  %1748 = sext i32 %1747 to i64
  %1749 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %1748
  %1750 = load double, double* %1749, align 8
  %1751 = fcmp ogt double %1750, 3.000000e+03
  br i1 %1751, label %1752, label %1757

; <label>:1752:                                   ; preds = %1746
  %pgocount78 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 87)
  %1753 = add i64 %pgocount78, 1
  store i64 %1753, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 87)
  %1754 = load i32, i32* %31, align 4
  %1755 = sext i32 %1754 to i64
  %1756 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 %1755
  store i32 0, i32* %1756, align 4
  br label %1857

; <label>:1757:                                   ; preds = %1746
  store float 0.000000e+00, float* %93, align 4
  store float 0.000000e+00, float* %94, align 4
  store float 0.000000e+00, float* %95, align 4
  store i32 64, i32* %34, align 4
  br label %1758

; <label>:1758:                                   ; preds = %1781, %1757
  %1759 = load i32, i32* %34, align 4
  %1760 = icmp slt i32 %1759, 129
  br i1 %1760, label %1761, label %1784

; <label>:1761:                                   ; preds = %1758
  %pgocount79 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 53)
  %1762 = add i64 %pgocount79, 1
  store i64 %1762, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 53)
  %1763 = load i32, i32* %34, align 4
  %1764 = sext i32 %1763 to i64
  %1765 = getelementptr inbounds [129 x float], [129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0), i64 0, i64 %1764
  %1766 = load float, float* %1765, align 4
  %1767 = load float, float* %93, align 4
  %1768 = fadd float %1767, %1766
  store float %1768, float* %93, align 4
  %1769 = load i32, i32* %34, align 4
  %1770 = sext i32 %1769 to i64
  %1771 = getelementptr inbounds [129 x float], [129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1), i64 0, i64 %1770
  %1772 = load float, float* %1771, align 4
  %1773 = load float, float* %94, align 4
  %1774 = fadd float %1773, %1772
  store float %1774, float* %94, align 4
  %1775 = load i32, i32* %34, align 4
  %1776 = sext i32 %1775 to i64
  %1777 = getelementptr inbounds [129 x float], [129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2), i64 0, i64 %1776
  %1778 = load float, float* %1777, align 4
  %1779 = load float, float* %95, align 4
  %1780 = fadd float %1779, %1778
  store float %1780, float* %95, align 4
  br label %1781

; <label>:1781:                                   ; preds = %1761
  %1782 = load i32, i32* %34, align 4
  %1783 = add nsw i32 %1782, 1
  store i32 %1783, i32* %34, align 4
  br label %1758

; <label>:1784:                                   ; preds = %1758
  %1785 = load float, float* %93, align 4
  %1786 = load float, float* %94, align 4
  %1787 = fcmp olt float %1785, %1786
  br i1 %1787, label %1788, label %1790

; <label>:1788:                                   ; preds = %1784
  %1789 = load float, float* %93, align 4
  br label %1793

; <label>:1790:                                   ; preds = %1784
  %pgocount80 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 97)
  %1791 = add i64 %pgocount80, 1
  store i64 %1791, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 97)
  %1792 = load float, float* %94, align 4
  br label %1793

; <label>:1793:                                   ; preds = %1790, %1788
  %1794 = phi float [ %1789, %1788 ], [ %1792, %1790 ]
  store float %1794, float* %91, align 4
  %1795 = load float, float* %91, align 4
  %1796 = load float, float* %95, align 4
  %1797 = fcmp olt float %1795, %1796
  br i1 %1797, label %1798, label %1800

; <label>:1798:                                   ; preds = %1793
  %1799 = load float, float* %91, align 4
  br label %1803

; <label>:1800:                                   ; preds = %1793
  %pgocount81 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 98)
  %1801 = add i64 %pgocount81, 1
  store i64 %1801, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 98)
  %1802 = load float, float* %95, align 4
  br label %1803

; <label>:1803:                                   ; preds = %1800, %1798
  %1804 = phi float [ %1799, %1798 ], [ %1802, %1800 ]
  store float %1804, float* %91, align 4
  %1805 = load float, float* %93, align 4
  %1806 = load float, float* %94, align 4
  %1807 = fcmp ogt float %1805, %1806
  br i1 %1807, label %1808, label %1810

; <label>:1808:                                   ; preds = %1803
  %1809 = load float, float* %93, align 4
  br label %1813

; <label>:1810:                                   ; preds = %1803
  %pgocount82 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 99)
  %1811 = add i64 %pgocount82, 1
  store i64 %1811, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 99)
  %1812 = load float, float* %94, align 4
  br label %1813

; <label>:1813:                                   ; preds = %1810, %1808
  %1814 = phi float [ %1809, %1808 ], [ %1812, %1810 ]
  store float %1814, float* %92, align 4
  %1815 = load float, float* %92, align 4
  %1816 = load float, float* %95, align 4
  %1817 = fcmp ogt float %1815, %1816
  br i1 %1817, label %1818, label %1820

; <label>:1818:                                   ; preds = %1813
  %1819 = load float, float* %92, align 4
  br label %1823

; <label>:1820:                                   ; preds = %1813
  %pgocount83 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 100)
  %1821 = add i64 %pgocount83, 1
  store i64 %1821, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 100)
  %1822 = load float, float* %95, align 4
  br label %1823

; <label>:1823:                                   ; preds = %1820, %1818
  %1824 = phi float [ %1819, %1818 ], [ %1822, %1820 ]
  store float %1824, float* %92, align 4
  %1825 = load i32, i32* %31, align 4
  %1826 = sext i32 %1825 to i64
  %1827 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 %1826
  store i32 1, i32* %1827, align 4
  %1828 = load float, float* %92, align 4
  %1829 = load float, float* %91, align 4
  %1830 = fmul float 3.000000e+01, %1829
  %1831 = fcmp ogt float %1828, %1830
  br i1 %1831, label %1832, label %1837

; <label>:1832:                                   ; preds = %1823
  %pgocount84 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 101)
  %1833 = add i64 %pgocount84, 1
  store i64 %1833, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 101)
  %1834 = load i32, i32* %31, align 4
  %1835 = sext i32 %1834 to i64
  %1836 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 %1835
  store i32 0, i32* %1836, align 4
  br label %1856

; <label>:1837:                                   ; preds = %1823
  %1838 = load float, float* %92, align 4
  %1839 = load float, float* %91, align 4
  %1840 = fmul float 1.000000e+01, %1839
  %1841 = fcmp ogt float %1838, %1840
  br i1 %1841, label %1842, label %1854

; <label>:1842:                                   ; preds = %1837
  %pgocount85 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 107)
  %1843 = add i64 %pgocount85, 1
  store i64 %1843, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 107)
  %1844 = load i32, i32* %31, align 4
  %1845 = sext i32 %1844 to i64
  %1846 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %1845
  %1847 = load double, double* %1846, align 8
  %1848 = fcmp ogt double %1847, 1.000000e+03
  br i1 %1848, label %1849, label %1854

; <label>:1849:                                   ; preds = %1842
  %pgocount86 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 120)
  %1850 = add i64 %pgocount86, 1
  store i64 %1850, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 120)
  %1851 = load i32, i32* %31, align 4
  %1852 = sext i32 %1851 to i64
  %1853 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 %1852
  store i32 0, i32* %1853, align 4
  br label %1854

; <label>:1854:                                   ; preds = %1849, %1842, %1837
  %pgocount87 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 102)
  %1855 = add i64 %pgocount87, 1
  store i64 %1855, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 102)
  br label %1856

; <label>:1856:                                   ; preds = %1854, %1832
  br label %1857

; <label>:1857:                                   ; preds = %1856, %1752
  br label %1858

; <label>:1858:                                   ; preds = %1857, %1741
  br label %1859

; <label>:1859:                                   ; preds = %1858, %1733
  store i32 0, i32* %36, align 4
  br label %1860

; <label>:1860:                                   ; preds = %1960, %1859
  %1861 = load i32, i32* %36, align 4
  %1862 = icmp slt i32 %1861, 21
  br i1 %1862, label %1863, label %1964

; <label>:1863:                                   ; preds = %1860
  %1864 = load i32, i32* %36, align 4
  %1865 = sext i32 %1864 to i64
  %1866 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.w1_l, i64 0, i64 %1865
  %1867 = load double, double* %1866, align 8
  %1868 = load i32, i32* %36, align 4
  %1869 = sext i32 %1868 to i64
  %1870 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bu_l, i64 0, i64 %1869
  %1871 = load i32, i32* %1870, align 4
  %1872 = sext i32 %1871 to i64
  %1873 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1872
  %1874 = load double, double* %1873, align 8
  %1875 = fmul double %1867, %1874
  %1876 = load i32, i32* %36, align 4
  %1877 = sext i32 %1876 to i64
  %1878 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.w2_l, i64 0, i64 %1877
  %1879 = load double, double* %1878, align 8
  %1880 = load i32, i32* %36, align 4
  %1881 = sext i32 %1880 to i64
  %1882 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 %1881
  %1883 = load i32, i32* %1882, align 4
  %1884 = sext i32 %1883 to i64
  %1885 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1884
  %1886 = load double, double* %1885, align 8
  %1887 = fmul double %1879, %1886
  %1888 = fadd double %1875, %1887
  store double %1888, double* %96, align 8
  %1889 = load i32, i32* %36, align 4
  %1890 = sext i32 %1889 to i64
  %1891 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.w1_l, i64 0, i64 %1890
  %1892 = load double, double* %1891, align 8
  %1893 = load i32, i32* %36, align 4
  %1894 = sext i32 %1893 to i64
  %1895 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bu_l, i64 0, i64 %1894
  %1896 = load i32, i32* %1895, align 4
  %1897 = sext i32 %1896 to i64
  %1898 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1897
  %1899 = load double, double* %1898, align 8
  %1900 = fmul double %1892, %1899
  %1901 = load i32, i32* %36, align 4
  %1902 = sext i32 %1901 to i64
  %1903 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.w2_l, i64 0, i64 %1902
  %1904 = load double, double* %1903, align 8
  %1905 = load i32, i32* %36, align 4
  %1906 = sext i32 %1905 to i64
  %1907 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 %1906
  %1908 = load i32, i32* %1907, align 4
  %1909 = sext i32 %1908 to i64
  %1910 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1909
  %1911 = load double, double* %1910, align 8
  %1912 = fmul double %1904, %1911
  %1913 = fadd double %1900, %1912
  store double %1913, double* %97, align 8
  %1914 = load i32, i32* %36, align 4
  %1915 = sext i32 %1914 to i64
  %1916 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bu_l, i64 0, i64 %1915
  %1917 = load i32, i32* %1916, align 4
  %1918 = add nsw i32 %1917, 1
  store i32 %1918, i32* %32, align 4
  br label %1919

; <label>:1919:                                   ; preds = %1940, %1863
  %1920 = load i32, i32* %32, align 4
  %1921 = load i32, i32* %36, align 4
  %1922 = sext i32 %1921 to i64
  %1923 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 %1922
  %1924 = load i32, i32* %1923, align 4
  %1925 = icmp slt i32 %1920, %1924
  br i1 %1925, label %1926, label %1943

; <label>:1926:                                   ; preds = %1919
  %pgocount88 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 15)
  %1927 = add i64 %pgocount88, 1
  store i64 %1927, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 15)
  %1928 = load i32, i32* %32, align 4
  %1929 = sext i32 %1928 to i64
  %1930 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1929
  %1931 = load double, double* %1930, align 8
  %1932 = load double, double* %96, align 8
  %1933 = fadd double %1932, %1931
  store double %1933, double* %96, align 8
  %1934 = load i32, i32* %32, align 4
  %1935 = sext i32 %1934 to i64
  %1936 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1935
  %1937 = load double, double* %1936, align 8
  %1938 = load double, double* %97, align 8
  %1939 = fadd double %1938, %1937
  store double %1939, double* %97, align 8
  br label %1940

; <label>:1940:                                   ; preds = %1926
  %1941 = load i32, i32* %32, align 4
  %1942 = add nsw i32 %1941, 1
  store i32 %1942, i32* %32, align 4
  br label %1919

; <label>:1943:                                   ; preds = %1919
  %1944 = load double, double* %96, align 8
  %1945 = load i32, i32* %31, align 4
  %1946 = sext i32 %1945 to i64
  %1947 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %1946
  %1948 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %1947, i32 0, i32 0
  %1949 = load i32, i32* %36, align 4
  %1950 = sext i32 %1949 to i64
  %1951 = getelementptr inbounds [22 x double], [22 x double]* %1948, i64 0, i64 %1950
  store double %1944, double* %1951, align 8
  %1952 = load double, double* %97, align 8
  %1953 = load i32, i32* %31, align 4
  %1954 = sext i32 %1953 to i64
  %1955 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %1954
  %1956 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %1955, i32 0, i32 0
  %1957 = load i32, i32* %36, align 4
  %1958 = sext i32 %1957 to i64
  %1959 = getelementptr inbounds [22 x double], [22 x double]* %1956, i64 0, i64 %1958
  store double %1952, double* %1959, align 8
  br label %1960

; <label>:1960:                                   ; preds = %1943
  %pgocount89 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 39)
  %1961 = add i64 %pgocount89, 1
  store i64 %1961, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 39)
  %1962 = load i32, i32* %36, align 4
  %1963 = add nsw i32 %1962, 1
  store i32 %1963, i32* %36, align 4
  br label %1860

; <label>:1964:                                   ; preds = %1860
  store i32 0, i32* %37, align 4
  br label %1965

; <label>:1965:                                   ; preds = %2188, %1964
  %1966 = load i32, i32* %37, align 4
  %1967 = icmp slt i32 %1966, 3
  br i1 %1967, label %1968, label %2192

; <label>:1968:                                   ; preds = %1965
  store i32 0, i32* %34, align 4
  store i32 0, i32* %32, align 4
  br label %1969

; <label>:1969:                                   ; preds = %2011, %1968
  %1970 = load i32, i32* %32, align 4
  %1971 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  %1972 = icmp slt i32 %1970, %1971
  br i1 %1972, label %1973, label %2014

; <label>:1973:                                   ; preds = %1969
  %pgocount90 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 16)
  %1974 = add i64 %pgocount90, 1
  store i64 %1974, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 16)
  %1975 = load i32, i32* %37, align 4
  %1976 = sext i32 %1975 to i64
  %1977 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %1976
  %1978 = load i32, i32* %34, align 4
  %1979 = add nsw i32 %1978, 1
  store i32 %1979, i32* %34, align 4
  %1980 = sext i32 %1978 to i64
  %1981 = getelementptr inbounds [129 x float], [129 x float]* %1977, i64 0, i64 %1980
  %1982 = load float, float* %1981, align 4
  store float %1982, float* %99, align 4
  %1983 = load i32, i32* %32, align 4
  %1984 = sext i32 %1983 to i64
  %1985 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_s, i64 0, i64 %1984
  %1986 = load i32, i32* %1985, align 4
  store i32 %1986, i32* %98, align 4
  br label %1987

; <label>:1987:                                   ; preds = %2001, %1973
  %1988 = load i32, i32* %98, align 4
  %1989 = icmp sgt i32 %1988, 0
  br i1 %1989, label %1990, label %2005

; <label>:1990:                                   ; preds = %1987
  %1991 = load i32, i32* %37, align 4
  %1992 = sext i32 %1991 to i64
  %1993 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %1992
  %1994 = load i32, i32* %34, align 4
  %1995 = add nsw i32 %1994, 1
  store i32 %1995, i32* %34, align 4
  %1996 = sext i32 %1994 to i64
  %1997 = getelementptr inbounds [129 x float], [129 x float]* %1993, i64 0, i64 %1996
  %1998 = load float, float* %1997, align 4
  %1999 = load float, float* %99, align 4
  %2000 = fadd float %1999, %1998
  store float %2000, float* %99, align 4
  br label %2001

; <label>:2001:                                   ; preds = %1990
  %pgocount91 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 23)
  %2002 = add i64 %pgocount91, 1
  store i64 %2002, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 23)
  %2003 = load i32, i32* %98, align 4
  %2004 = add nsw i32 %2003, -1
  store i32 %2004, i32* %98, align 4
  br label %1987

; <label>:2005:                                   ; preds = %1987
  %2006 = load float, float* %99, align 4
  %2007 = fpext float %2006 to double
  %2008 = load i32, i32* %32, align 4
  %2009 = sext i32 %2008 to i64
  %2010 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %2009
  store double %2007, double* %2010, align 8
  br label %2011

; <label>:2011:                                   ; preds = %2005
  %2012 = load i32, i32* %32, align 4
  %2013 = add nsw i32 %2012, 1
  store i32 %2013, i32* %32, align 4
  br label %1969

; <label>:2014:                                   ; preds = %1969
  store i32 0, i32* %32, align 4
  br label %2015

; <label>:2015:                                   ; preds = %2073, %2014
  %2016 = load i32, i32* %32, align 4
  %2017 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %2018 = icmp slt i32 %2016, %2017
  br i1 %2018, label %2019, label %2076

; <label>:2019:                                   ; preds = %2015
  %pgocount92 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 17)
  %2020 = add i64 %pgocount92, 1
  store i64 %2020, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 17)
  store double 0.000000e+00, double* %100, align 8
  %2021 = load i32, i32* %32, align 4
  %2022 = sext i32 %2021 to i64
  %2023 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %2022
  %2024 = getelementptr inbounds [2 x i32], [2 x i32]* %2023, i64 0, i64 0
  %2025 = load i32, i32* %2024, align 8
  store i32 %2025, i32* %35, align 4
  br label %2026

; <label>:2026:                                   ; preds = %2049, %2019
  %2027 = load i32, i32* %35, align 4
  %2028 = load i32, i32* %32, align 4
  %2029 = sext i32 %2028 to i64
  %2030 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %2029
  %2031 = getelementptr inbounds [2 x i32], [2 x i32]* %2030, i64 0, i64 1
  %2032 = load i32, i32* %2031, align 4
  %2033 = icmp sle i32 %2027, %2032
  br i1 %2033, label %2034, label %2053

; <label>:2034:                                   ; preds = %2026
  %2035 = load i32, i32* %32, align 4
  %2036 = sext i32 %2035 to i64
  %2037 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %2036
  %2038 = load i32, i32* %35, align 4
  %2039 = sext i32 %2038 to i64
  %2040 = getelementptr inbounds [64 x double], [64 x double]* %2037, i64 0, i64 %2039
  %2041 = load double, double* %2040, align 8
  %2042 = load i32, i32* %35, align 4
  %2043 = sext i32 %2042 to i64
  %2044 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %2043
  %2045 = load double, double* %2044, align 8
  %2046 = fmul double %2041, %2045
  %2047 = load double, double* %100, align 8
  %2048 = fadd double %2047, %2046
  store double %2048, double* %100, align 8
  br label %2049

; <label>:2049:                                   ; preds = %2034
  %pgocount93 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 24)
  %2050 = add i64 %pgocount93, 1
  store i64 %2050, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 24)
  %2051 = load i32, i32* %35, align 4
  %2052 = add nsw i32 %2051, 1
  store i32 %2052, i32* %35, align 4
  br label %2026

; <label>:2053:                                   ; preds = %2026
  %2054 = load i32, i32* %32, align 4
  %2055 = sext i32 %2054 to i64
  %2056 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.qthr_s, i64 0, i64 %2055
  %2057 = load double, double* %2056, align 8
  %2058 = load double, double* %100, align 8
  %2059 = fcmp ogt double %2057, %2058
  br i1 %2059, label %2060, label %2065

; <label>:2060:                                   ; preds = %2053
  %2061 = load i32, i32* %32, align 4
  %2062 = sext i32 %2061 to i64
  %2063 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.qthr_s, i64 0, i64 %2062
  %2064 = load double, double* %2063, align 8
  br label %2068

; <label>:2065:                                   ; preds = %2053
  %pgocount94 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 4)
  %2066 = add i64 %pgocount94, 1
  store i64 %2066, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 4)
  %2067 = load double, double* %100, align 8
  br label %2068

; <label>:2068:                                   ; preds = %2065, %2060
  %2069 = phi double [ %2064, %2060 ], [ %2067, %2065 ]
  %2070 = load i32, i32* %32, align 4
  %2071 = sext i32 %2070 to i64
  %2072 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %2071
  store double %2069, double* %2072, align 8
  br label %2073

; <label>:2073:                                   ; preds = %2068
  %2074 = load i32, i32* %32, align 4
  %2075 = add nsw i32 %2074, 1
  store i32 %2075, i32* %32, align 4
  br label %2015

; <label>:2076:                                   ; preds = %2015
  store i32 0, i32* %36, align 4
  br label %2077

; <label>:2077:                                   ; preds = %2184, %2076
  %2078 = load i32, i32* %36, align 4
  %2079 = icmp slt i32 %2078, 12
  br i1 %2079, label %2080, label %2187

; <label>:2080:                                   ; preds = %2077
  %pgocount95 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 18)
  %2081 = add i64 %pgocount95, 1
  store i64 %2081, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 18)
  %2082 = load i32, i32* %36, align 4
  %2083 = sext i32 %2082 to i64
  %2084 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w1_s, i64 0, i64 %2083
  %2085 = load double, double* %2084, align 8
  %2086 = load i32, i32* %36, align 4
  %2087 = sext i32 %2086 to i64
  %2088 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bu_s, i64 0, i64 %2087
  %2089 = load i32, i32* %2088, align 4
  %2090 = sext i32 %2089 to i64
  %2091 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %2090
  %2092 = load double, double* %2091, align 8
  %2093 = fmul double %2085, %2092
  %2094 = load i32, i32* %36, align 4
  %2095 = sext i32 %2094 to i64
  %2096 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w2_s, i64 0, i64 %2095
  %2097 = load double, double* %2096, align 8
  %2098 = load i32, i32* %36, align 4
  %2099 = sext i32 %2098 to i64
  %2100 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 %2099
  %2101 = load i32, i32* %2100, align 4
  %2102 = sext i32 %2101 to i64
  %2103 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %2102
  %2104 = load double, double* %2103, align 8
  %2105 = fmul double %2097, %2104
  %2106 = fadd double %2093, %2105
  store double %2106, double* %101, align 8
  %2107 = load i32, i32* %36, align 4
  %2108 = sext i32 %2107 to i64
  %2109 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w1_s, i64 0, i64 %2108
  %2110 = load double, double* %2109, align 8
  %2111 = load i32, i32* %36, align 4
  %2112 = sext i32 %2111 to i64
  %2113 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bu_s, i64 0, i64 %2112
  %2114 = load i32, i32* %2113, align 4
  %2115 = sext i32 %2114 to i64
  %2116 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %2115
  %2117 = load double, double* %2116, align 8
  %2118 = fmul double %2110, %2117
  %2119 = load i32, i32* %36, align 4
  %2120 = sext i32 %2119 to i64
  %2121 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w2_s, i64 0, i64 %2120
  %2122 = load double, double* %2121, align 8
  %2123 = load i32, i32* %36, align 4
  %2124 = sext i32 %2123 to i64
  %2125 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 %2124
  %2126 = load i32, i32* %2125, align 4
  %2127 = sext i32 %2126 to i64
  %2128 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %2127
  %2129 = load double, double* %2128, align 8
  %2130 = fmul double %2122, %2129
  %2131 = fadd double %2118, %2130
  store double %2131, double* %102, align 8
  %2132 = load i32, i32* %36, align 4
  %2133 = sext i32 %2132 to i64
  %2134 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bu_s, i64 0, i64 %2133
  %2135 = load i32, i32* %2134, align 4
  %2136 = add nsw i32 %2135, 1
  store i32 %2136, i32* %32, align 4
  br label %2137

; <label>:2137:                                   ; preds = %2157, %2080
  %2138 = load i32, i32* %32, align 4
  %2139 = load i32, i32* %36, align 4
  %2140 = sext i32 %2139 to i64
  %2141 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 %2140
  %2142 = load i32, i32* %2141, align 4
  %2143 = icmp slt i32 %2138, %2142
  br i1 %2143, label %2144, label %2161

; <label>:2144:                                   ; preds = %2137
  %2145 = load i32, i32* %32, align 4
  %2146 = sext i32 %2145 to i64
  %2147 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %2146
  %2148 = load double, double* %2147, align 8
  %2149 = load double, double* %101, align 8
  %2150 = fadd double %2149, %2148
  store double %2150, double* %101, align 8
  %2151 = load i32, i32* %32, align 4
  %2152 = sext i32 %2151 to i64
  %2153 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %2152
  %2154 = load double, double* %2153, align 8
  %2155 = load double, double* %102, align 8
  %2156 = fadd double %2155, %2154
  store double %2156, double* %102, align 8
  br label %2157

; <label>:2157:                                   ; preds = %2144
  %pgocount96 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 25)
  %2158 = add i64 %pgocount96, 1
  store i64 %2158, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 25)
  %2159 = load i32, i32* %32, align 4
  %2160 = add nsw i32 %2159, 1
  store i32 %2160, i32* %32, align 4
  br label %2137

; <label>:2161:                                   ; preds = %2137
  %2162 = load double, double* %101, align 8
  %2163 = load i32, i32* %31, align 4
  %2164 = sext i32 %2163 to i64
  %2165 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %2164
  %2166 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2165, i32 0, i32 1
  %2167 = load i32, i32* %36, align 4
  %2168 = sext i32 %2167 to i64
  %2169 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2166, i64 0, i64 %2168
  %2170 = load i32, i32* %37, align 4
  %2171 = sext i32 %2170 to i64
  %2172 = getelementptr inbounds [3 x double], [3 x double]* %2169, i64 0, i64 %2171
  store double %2162, double* %2172, align 8
  %2173 = load double, double* %102, align 8
  %2174 = load i32, i32* %31, align 4
  %2175 = sext i32 %2174 to i64
  %2176 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2175
  %2177 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2176, i32 0, i32 1
  %2178 = load i32, i32* %36, align 4
  %2179 = sext i32 %2178 to i64
  %2180 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2177, i64 0, i64 %2179
  %2181 = load i32, i32* %37, align 4
  %2182 = sext i32 %2181 to i64
  %2183 = getelementptr inbounds [3 x double], [3 x double]* %2180, i64 0, i64 %2182
  store double %2173, double* %2183, align 8
  br label %2184

; <label>:2184:                                   ; preds = %2161
  %2185 = load i32, i32* %36, align 4
  %2186 = add nsw i32 %2185, 1
  store i32 %2186, i32* %36, align 4
  br label %2077

; <label>:2187:                                   ; preds = %2077
  br label %2188

; <label>:2188:                                   ; preds = %2187
  %pgocount97 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 40)
  %2189 = add i64 %pgocount97, 1
  store i64 %2189, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 40)
  %2190 = load i32, i32* %37, align 4
  %2191 = add nsw i32 %2190, 1
  store i32 %2191, i32* %37, align 4
  br label %1965

; <label>:2192:                                   ; preds = %1965
  br label %2193

; <label>:2193:                                   ; preds = %2192
  %2194 = load i32, i32* %31, align 4
  %2195 = add nsw i32 %2194, 1
  store i32 %2195, i32* %31, align 4
  br label %617

; <label>:2196:                                   ; preds = %617
  %2197 = load i32, i32* %30, align 4
  %2198 = icmp eq i32 %2197, 4
  br i1 %2198, label %2199, label %2702

; <label>:2199:                                   ; preds = %2196
  store i32 2, i32* %106, align 4
  store i32 3, i32* %107, align 4
  store i32 0, i32* %36, align 4
  br label %2200

; <label>:2200:                                   ; preds = %2411, %2199
  %2201 = load i32, i32* %36, align 4
  %2202 = icmp slt i32 %2201, 21
  br i1 %2202, label %2203, label %2415

; <label>:2203:                                   ; preds = %2200
  %2204 = load i32, i32* %36, align 4
  %2205 = sext i32 %2204 to i64
  %2206 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0), i64 0, i64 %2205
  %2207 = load double, double* %2206, align 8
  %2208 = load i32, i32* %36, align 4
  %2209 = sext i32 %2208 to i64
  %2210 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0), i64 0, i64 %2209
  %2211 = load double, double* %2210, align 8
  %2212 = fmul double 1.580000e+00, %2211
  %2213 = fcmp ole double %2207, %2212
  br i1 %2213, label %2214, label %2410

; <label>:2214:                                   ; preds = %2203
  %pgocount98 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 67)
  %2215 = add i64 %pgocount98, 1
  store i64 %2215, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 67)
  %2216 = load i32, i32* %36, align 4
  %2217 = sext i32 %2216 to i64
  %2218 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0), i64 0, i64 %2217
  %2219 = load double, double* %2218, align 8
  %2220 = load i32, i32* %36, align 4
  %2221 = sext i32 %2220 to i64
  %2222 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0), i64 0, i64 %2221
  %2223 = load double, double* %2222, align 8
  %2224 = fmul double 1.580000e+00, %2223
  %2225 = fcmp ole double %2219, %2224
  br i1 %2225, label %2226, label %2410

; <label>:2226:                                   ; preds = %2214
  %2227 = load i32, i32* %36, align 4
  %2228 = sext i32 %2227 to i64
  %2229 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.mld_l, i64 0, i64 %2228
  %2230 = load double, double* %2229, align 8
  %2231 = load i32, i32* %107, align 4
  %2232 = sext i32 %2231 to i64
  %2233 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %2232
  %2234 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2233, i32 0, i32 0
  %2235 = load i32, i32* %36, align 4
  %2236 = sext i32 %2235 to i64
  %2237 = getelementptr inbounds [22 x double], [22 x double]* %2234, i64 0, i64 %2236
  %2238 = load double, double* %2237, align 8
  %2239 = fmul double %2230, %2238
  store double %2239, double* %105, align 8
  %2240 = load i32, i32* %106, align 4
  %2241 = sext i32 %2240 to i64
  %2242 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2241
  %2243 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2242, i32 0, i32 0
  %2244 = load i32, i32* %36, align 4
  %2245 = sext i32 %2244 to i64
  %2246 = getelementptr inbounds [22 x double], [22 x double]* %2243, i64 0, i64 %2245
  %2247 = load double, double* %2246, align 8
  %2248 = load i32, i32* %107, align 4
  %2249 = sext i32 %2248 to i64
  %2250 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2249
  %2251 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2250, i32 0, i32 0
  %2252 = load i32, i32* %36, align 4
  %2253 = sext i32 %2252 to i64
  %2254 = getelementptr inbounds [22 x double], [22 x double]* %2251, i64 0, i64 %2253
  %2255 = load double, double* %2254, align 8
  %2256 = load double, double* %105, align 8
  %2257 = fcmp olt double %2255, %2256
  br i1 %2257, label %2258, label %2267

; <label>:2258:                                   ; preds = %2226
  %2259 = load i32, i32* %107, align 4
  %2260 = sext i32 %2259 to i64
  %2261 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2260
  %2262 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2261, i32 0, i32 0
  %2263 = load i32, i32* %36, align 4
  %2264 = sext i32 %2263 to i64
  %2265 = getelementptr inbounds [22 x double], [22 x double]* %2262, i64 0, i64 %2264
  %2266 = load double, double* %2265, align 8
  br label %2270

; <label>:2267:                                   ; preds = %2226
  %pgocount99 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 94)
  %2268 = add i64 %pgocount99, 1
  store i64 %2268, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 94)
  %2269 = load double, double* %105, align 8
  br label %2270

; <label>:2270:                                   ; preds = %2267, %2258
  %2271 = phi double [ %2266, %2258 ], [ %2269, %2267 ]
  %2272 = fcmp ogt double %2247, %2271
  br i1 %2272, label %2273, label %2282

; <label>:2273:                                   ; preds = %2270
  %2274 = load i32, i32* %106, align 4
  %2275 = sext i32 %2274 to i64
  %2276 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2275
  %2277 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2276, i32 0, i32 0
  %2278 = load i32, i32* %36, align 4
  %2279 = sext i32 %2278 to i64
  %2280 = getelementptr inbounds [22 x double], [22 x double]* %2277, i64 0, i64 %2279
  %2281 = load double, double* %2280, align 8
  br label %2308

; <label>:2282:                                   ; preds = %2270
  %2283 = load i32, i32* %107, align 4
  %2284 = sext i32 %2283 to i64
  %2285 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2284
  %2286 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2285, i32 0, i32 0
  %2287 = load i32, i32* %36, align 4
  %2288 = sext i32 %2287 to i64
  %2289 = getelementptr inbounds [22 x double], [22 x double]* %2286, i64 0, i64 %2288
  %2290 = load double, double* %2289, align 8
  %2291 = load double, double* %105, align 8
  %2292 = fcmp olt double %2290, %2291
  br i1 %2292, label %2293, label %2303

; <label>:2293:                                   ; preds = %2282
  %pgocount100 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 103)
  %2294 = add i64 %pgocount100, 1
  store i64 %2294, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 103)
  %2295 = load i32, i32* %107, align 4
  %2296 = sext i32 %2295 to i64
  %2297 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2296
  %2298 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2297, i32 0, i32 0
  %2299 = load i32, i32* %36, align 4
  %2300 = sext i32 %2299 to i64
  %2301 = getelementptr inbounds [22 x double], [22 x double]* %2298, i64 0, i64 %2300
  %2302 = load double, double* %2301, align 8
  br label %2306

; <label>:2303:                                   ; preds = %2282
  %pgocount101 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 104)
  %2304 = add i64 %pgocount101, 1
  store i64 %2304, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 104)
  %2305 = load double, double* %105, align 8
  br label %2306

; <label>:2306:                                   ; preds = %2303, %2293
  %2307 = phi double [ %2302, %2293 ], [ %2305, %2303 ]
  br label %2308

; <label>:2308:                                   ; preds = %2306, %2273
  %2309 = phi double [ %2281, %2273 ], [ %2307, %2306 ]
  store double %2309, double* %104, align 8
  %2310 = load i32, i32* %36, align 4
  %2311 = sext i32 %2310 to i64
  %2312 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.mld_l, i64 0, i64 %2311
  %2313 = load double, double* %2312, align 8
  %2314 = load i32, i32* %106, align 4
  %2315 = sext i32 %2314 to i64
  %2316 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %2315
  %2317 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2316, i32 0, i32 0
  %2318 = load i32, i32* %36, align 4
  %2319 = sext i32 %2318 to i64
  %2320 = getelementptr inbounds [22 x double], [22 x double]* %2317, i64 0, i64 %2319
  %2321 = load double, double* %2320, align 8
  %2322 = fmul double %2313, %2321
  store double %2322, double* %105, align 8
  %2323 = load i32, i32* %107, align 4
  %2324 = sext i32 %2323 to i64
  %2325 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2324
  %2326 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2325, i32 0, i32 0
  %2327 = load i32, i32* %36, align 4
  %2328 = sext i32 %2327 to i64
  %2329 = getelementptr inbounds [22 x double], [22 x double]* %2326, i64 0, i64 %2328
  %2330 = load double, double* %2329, align 8
  %2331 = load i32, i32* %106, align 4
  %2332 = sext i32 %2331 to i64
  %2333 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2332
  %2334 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2333, i32 0, i32 0
  %2335 = load i32, i32* %36, align 4
  %2336 = sext i32 %2335 to i64
  %2337 = getelementptr inbounds [22 x double], [22 x double]* %2334, i64 0, i64 %2336
  %2338 = load double, double* %2337, align 8
  %2339 = load double, double* %105, align 8
  %2340 = fcmp olt double %2338, %2339
  br i1 %2340, label %2341, label %2350

; <label>:2341:                                   ; preds = %2308
  %2342 = load i32, i32* %106, align 4
  %2343 = sext i32 %2342 to i64
  %2344 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2343
  %2345 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2344, i32 0, i32 0
  %2346 = load i32, i32* %36, align 4
  %2347 = sext i32 %2346 to i64
  %2348 = getelementptr inbounds [22 x double], [22 x double]* %2345, i64 0, i64 %2347
  %2349 = load double, double* %2348, align 8
  br label %2353

; <label>:2350:                                   ; preds = %2308
  %pgocount102 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 95)
  %2351 = add i64 %pgocount102, 1
  store i64 %2351, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 95)
  %2352 = load double, double* %105, align 8
  br label %2353

; <label>:2353:                                   ; preds = %2350, %2341
  %2354 = phi double [ %2349, %2341 ], [ %2352, %2350 ]
  %2355 = fcmp ogt double %2330, %2354
  br i1 %2355, label %2356, label %2366

; <label>:2356:                                   ; preds = %2353
  %pgocount103 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 96)
  %2357 = add i64 %pgocount103, 1
  store i64 %2357, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 96)
  %2358 = load i32, i32* %107, align 4
  %2359 = sext i32 %2358 to i64
  %2360 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2359
  %2361 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2360, i32 0, i32 0
  %2362 = load i32, i32* %36, align 4
  %2363 = sext i32 %2362 to i64
  %2364 = getelementptr inbounds [22 x double], [22 x double]* %2361, i64 0, i64 %2363
  %2365 = load double, double* %2364, align 8
  br label %2392

; <label>:2366:                                   ; preds = %2353
  %2367 = load i32, i32* %106, align 4
  %2368 = sext i32 %2367 to i64
  %2369 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2368
  %2370 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2369, i32 0, i32 0
  %2371 = load i32, i32* %36, align 4
  %2372 = sext i32 %2371 to i64
  %2373 = getelementptr inbounds [22 x double], [22 x double]* %2370, i64 0, i64 %2372
  %2374 = load double, double* %2373, align 8
  %2375 = load double, double* %105, align 8
  %2376 = fcmp olt double %2374, %2375
  br i1 %2376, label %2377, label %2387

; <label>:2377:                                   ; preds = %2366
  %pgocount104 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 105)
  %2378 = add i64 %pgocount104, 1
  store i64 %2378, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 105)
  %2379 = load i32, i32* %106, align 4
  %2380 = sext i32 %2379 to i64
  %2381 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2380
  %2382 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2381, i32 0, i32 0
  %2383 = load i32, i32* %36, align 4
  %2384 = sext i32 %2383 to i64
  %2385 = getelementptr inbounds [22 x double], [22 x double]* %2382, i64 0, i64 %2384
  %2386 = load double, double* %2385, align 8
  br label %2390

; <label>:2387:                                   ; preds = %2366
  %pgocount105 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 106)
  %2388 = add i64 %pgocount105, 1
  store i64 %2388, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 106)
  %2389 = load double, double* %105, align 8
  br label %2390

; <label>:2390:                                   ; preds = %2387, %2377
  %2391 = phi double [ %2386, %2377 ], [ %2389, %2387 ]
  br label %2392

; <label>:2392:                                   ; preds = %2390, %2356
  %2393 = phi double [ %2365, %2356 ], [ %2391, %2390 ]
  store double %2393, double* %103, align 8
  %2394 = load double, double* %104, align 8
  %2395 = load i32, i32* %106, align 4
  %2396 = sext i32 %2395 to i64
  %2397 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2396
  %2398 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2397, i32 0, i32 0
  %2399 = load i32, i32* %36, align 4
  %2400 = sext i32 %2399 to i64
  %2401 = getelementptr inbounds [22 x double], [22 x double]* %2398, i64 0, i64 %2400
  store double %2394, double* %2401, align 8
  %2402 = load double, double* %103, align 8
  %2403 = load i32, i32* %107, align 4
  %2404 = sext i32 %2403 to i64
  %2405 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2404
  %2406 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2405, i32 0, i32 0
  %2407 = load i32, i32* %36, align 4
  %2408 = sext i32 %2407 to i64
  %2409 = getelementptr inbounds [22 x double], [22 x double]* %2406, i64 0, i64 %2408
  store double %2402, double* %2409, align 8
  br label %2410

; <label>:2410:                                   ; preds = %2392, %2214, %2203
  br label %2411

; <label>:2411:                                   ; preds = %2410
  %pgocount106 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 56)
  %2412 = add i64 %pgocount106, 1
  store i64 %2412, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 56)
  %2413 = load i32, i32* %36, align 4
  %2414 = add nsw i32 %2413, 1
  store i32 %2414, i32* %36, align 4
  br label %2200

; <label>:2415:                                   ; preds = %2200
  store i32 0, i32* %36, align 4
  br label %2416

; <label>:2416:                                   ; preds = %2696, %2415
  %2417 = load i32, i32* %36, align 4
  %2418 = icmp slt i32 %2417, 12
  br i1 %2418, label %2419, label %2700

; <label>:2419:                                   ; preds = %2416
  store i32 0, i32* %37, align 4
  br label %2420

; <label>:2420:                                   ; preds = %2691, %2419
  %2421 = load i32, i32* %37, align 4
  %2422 = icmp slt i32 %2421, 3
  br i1 %2422, label %2423, label %2695

; <label>:2423:                                   ; preds = %2420
  %2424 = load i32, i32* %36, align 4
  %2425 = sext i32 %2424 to i64
  %2426 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1), i64 0, i64 %2425
  %2427 = load i32, i32* %37, align 4
  %2428 = sext i32 %2427 to i64
  %2429 = getelementptr inbounds [3 x double], [3 x double]* %2426, i64 0, i64 %2428
  %2430 = load double, double* %2429, align 8
  %2431 = load i32, i32* %36, align 4
  %2432 = sext i32 %2431 to i64
  %2433 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1), i64 0, i64 %2432
  %2434 = load i32, i32* %37, align 4
  %2435 = sext i32 %2434 to i64
  %2436 = getelementptr inbounds [3 x double], [3 x double]* %2433, i64 0, i64 %2435
  %2437 = load double, double* %2436, align 8
  %2438 = fmul double 1.580000e+00, %2437
  %2439 = fcmp ole double %2430, %2438
  br i1 %2439, label %2440, label %2690

; <label>:2440:                                   ; preds = %2423
  %pgocount107 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 47)
  %2441 = add i64 %pgocount107, 1
  store i64 %2441, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 47)
  %2442 = load i32, i32* %36, align 4
  %2443 = sext i32 %2442 to i64
  %2444 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1), i64 0, i64 %2443
  %2445 = load i32, i32* %37, align 4
  %2446 = sext i32 %2445 to i64
  %2447 = getelementptr inbounds [3 x double], [3 x double]* %2444, i64 0, i64 %2446
  %2448 = load double, double* %2447, align 8
  %2449 = load i32, i32* %36, align 4
  %2450 = sext i32 %2449 to i64
  %2451 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1), i64 0, i64 %2450
  %2452 = load i32, i32* %37, align 4
  %2453 = sext i32 %2452 to i64
  %2454 = getelementptr inbounds [3 x double], [3 x double]* %2451, i64 0, i64 %2453
  %2455 = load double, double* %2454, align 8
  %2456 = fmul double 1.580000e+00, %2455
  %2457 = fcmp ole double %2448, %2456
  br i1 %2457, label %2459, label %._crit_edge2

._crit_edge2:                                     ; preds = %2440
  %pgocount108 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 34)
  %2458 = add i64 %pgocount108, 1
  store i64 %2458, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 34)
  br label %2690

; <label>:2459:                                   ; preds = %2440
  %2460 = load i32, i32* %36, align 4
  %2461 = sext i32 %2460 to i64
  %2462 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.mld_s, i64 0, i64 %2461
  %2463 = load double, double* %2462, align 8
  %2464 = load i32, i32* %107, align 4
  %2465 = sext i32 %2464 to i64
  %2466 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %2465
  %2467 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2466, i32 0, i32 1
  %2468 = load i32, i32* %36, align 4
  %2469 = sext i32 %2468 to i64
  %2470 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2467, i64 0, i64 %2469
  %2471 = load i32, i32* %37, align 4
  %2472 = sext i32 %2471 to i64
  %2473 = getelementptr inbounds [3 x double], [3 x double]* %2470, i64 0, i64 %2472
  %2474 = load double, double* %2473, align 8
  %2475 = fmul double %2463, %2474
  store double %2475, double* %105, align 8
  %2476 = load i32, i32* %106, align 4
  %2477 = sext i32 %2476 to i64
  %2478 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2477
  %2479 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2478, i32 0, i32 1
  %2480 = load i32, i32* %36, align 4
  %2481 = sext i32 %2480 to i64
  %2482 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2479, i64 0, i64 %2481
  %2483 = load i32, i32* %37, align 4
  %2484 = sext i32 %2483 to i64
  %2485 = getelementptr inbounds [3 x double], [3 x double]* %2482, i64 0, i64 %2484
  %2486 = load double, double* %2485, align 8
  %2487 = load i32, i32* %107, align 4
  %2488 = sext i32 %2487 to i64
  %2489 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2488
  %2490 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2489, i32 0, i32 1
  %2491 = load i32, i32* %36, align 4
  %2492 = sext i32 %2491 to i64
  %2493 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2490, i64 0, i64 %2492
  %2494 = load i32, i32* %37, align 4
  %2495 = sext i32 %2494 to i64
  %2496 = getelementptr inbounds [3 x double], [3 x double]* %2493, i64 0, i64 %2495
  %2497 = load double, double* %2496, align 8
  %2498 = load double, double* %105, align 8
  %2499 = fcmp olt double %2497, %2498
  br i1 %2499, label %2500, label %2512

; <label>:2500:                                   ; preds = %2459
  %2501 = load i32, i32* %107, align 4
  %2502 = sext i32 %2501 to i64
  %2503 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2502
  %2504 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2503, i32 0, i32 1
  %2505 = load i32, i32* %36, align 4
  %2506 = sext i32 %2505 to i64
  %2507 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2504, i64 0, i64 %2506
  %2508 = load i32, i32* %37, align 4
  %2509 = sext i32 %2508 to i64
  %2510 = getelementptr inbounds [3 x double], [3 x double]* %2507, i64 0, i64 %2509
  %2511 = load double, double* %2510, align 8
  br label %2515

; <label>:2512:                                   ; preds = %2459
  %pgocount109 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 9)
  %2513 = add i64 %pgocount109, 1
  store i64 %2513, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 9)
  %2514 = load double, double* %105, align 8
  br label %2515

; <label>:2515:                                   ; preds = %2512, %2500
  %2516 = phi double [ %2511, %2500 ], [ %2514, %2512 ]
  %2517 = fcmp ogt double %2486, %2516
  br i1 %2517, label %2518, label %2530

; <label>:2518:                                   ; preds = %2515
  %2519 = load i32, i32* %106, align 4
  %2520 = sext i32 %2519 to i64
  %2521 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2520
  %2522 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2521, i32 0, i32 1
  %2523 = load i32, i32* %36, align 4
  %2524 = sext i32 %2523 to i64
  %2525 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2522, i64 0, i64 %2524
  %2526 = load i32, i32* %37, align 4
  %2527 = sext i32 %2526 to i64
  %2528 = getelementptr inbounds [3 x double], [3 x double]* %2525, i64 0, i64 %2527
  %2529 = load double, double* %2528, align 8
  br label %2562

; <label>:2530:                                   ; preds = %2515
  %2531 = load i32, i32* %107, align 4
  %2532 = sext i32 %2531 to i64
  %2533 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2532
  %2534 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2533, i32 0, i32 1
  %2535 = load i32, i32* %36, align 4
  %2536 = sext i32 %2535 to i64
  %2537 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2534, i64 0, i64 %2536
  %2538 = load i32, i32* %37, align 4
  %2539 = sext i32 %2538 to i64
  %2540 = getelementptr inbounds [3 x double], [3 x double]* %2537, i64 0, i64 %2539
  %2541 = load double, double* %2540, align 8
  %2542 = load double, double* %105, align 8
  %2543 = fcmp olt double %2541, %2542
  br i1 %2543, label %2544, label %2557

; <label>:2544:                                   ; preds = %2530
  %pgocount110 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 30)
  %2545 = add i64 %pgocount110, 1
  store i64 %2545, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 30)
  %2546 = load i32, i32* %107, align 4
  %2547 = sext i32 %2546 to i64
  %2548 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2547
  %2549 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2548, i32 0, i32 1
  %2550 = load i32, i32* %36, align 4
  %2551 = sext i32 %2550 to i64
  %2552 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2549, i64 0, i64 %2551
  %2553 = load i32, i32* %37, align 4
  %2554 = sext i32 %2553 to i64
  %2555 = getelementptr inbounds [3 x double], [3 x double]* %2552, i64 0, i64 %2554
  %2556 = load double, double* %2555, align 8
  br label %2560

; <label>:2557:                                   ; preds = %2530
  %pgocount111 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 31)
  %2558 = add i64 %pgocount111, 1
  store i64 %2558, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 31)
  %2559 = load double, double* %105, align 8
  br label %2560

; <label>:2560:                                   ; preds = %2557, %2544
  %2561 = phi double [ %2556, %2544 ], [ %2559, %2557 ]
  br label %2562

; <label>:2562:                                   ; preds = %2560, %2518
  %2563 = phi double [ %2529, %2518 ], [ %2561, %2560 ]
  store double %2563, double* %104, align 8
  %2564 = load i32, i32* %36, align 4
  %2565 = sext i32 %2564 to i64
  %2566 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.mld_s, i64 0, i64 %2565
  %2567 = load double, double* %2566, align 8
  %2568 = load i32, i32* %106, align 4
  %2569 = sext i32 %2568 to i64
  %2570 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %2569
  %2571 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2570, i32 0, i32 1
  %2572 = load i32, i32* %36, align 4
  %2573 = sext i32 %2572 to i64
  %2574 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2571, i64 0, i64 %2573
  %2575 = load i32, i32* %37, align 4
  %2576 = sext i32 %2575 to i64
  %2577 = getelementptr inbounds [3 x double], [3 x double]* %2574, i64 0, i64 %2576
  %2578 = load double, double* %2577, align 8
  %2579 = fmul double %2567, %2578
  store double %2579, double* %105, align 8
  %2580 = load i32, i32* %107, align 4
  %2581 = sext i32 %2580 to i64
  %2582 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2581
  %2583 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2582, i32 0, i32 1
  %2584 = load i32, i32* %36, align 4
  %2585 = sext i32 %2584 to i64
  %2586 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2583, i64 0, i64 %2585
  %2587 = load i32, i32* %37, align 4
  %2588 = sext i32 %2587 to i64
  %2589 = getelementptr inbounds [3 x double], [3 x double]* %2586, i64 0, i64 %2588
  %2590 = load double, double* %2589, align 8
  %2591 = load i32, i32* %106, align 4
  %2592 = sext i32 %2591 to i64
  %2593 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2592
  %2594 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2593, i32 0, i32 1
  %2595 = load i32, i32* %36, align 4
  %2596 = sext i32 %2595 to i64
  %2597 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2594, i64 0, i64 %2596
  %2598 = load i32, i32* %37, align 4
  %2599 = sext i32 %2598 to i64
  %2600 = getelementptr inbounds [3 x double], [3 x double]* %2597, i64 0, i64 %2599
  %2601 = load double, double* %2600, align 8
  %2602 = load double, double* %105, align 8
  %2603 = fcmp olt double %2601, %2602
  br i1 %2603, label %2604, label %2616

; <label>:2604:                                   ; preds = %2562
  %2605 = load i32, i32* %106, align 4
  %2606 = sext i32 %2605 to i64
  %2607 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2606
  %2608 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2607, i32 0, i32 1
  %2609 = load i32, i32* %36, align 4
  %2610 = sext i32 %2609 to i64
  %2611 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2608, i64 0, i64 %2610
  %2612 = load i32, i32* %37, align 4
  %2613 = sext i32 %2612 to i64
  %2614 = getelementptr inbounds [3 x double], [3 x double]* %2611, i64 0, i64 %2613
  %2615 = load double, double* %2614, align 8
  br label %2619

; <label>:2616:                                   ; preds = %2562
  %pgocount112 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 10)
  %2617 = add i64 %pgocount112, 1
  store i64 %2617, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 10)
  %2618 = load double, double* %105, align 8
  br label %2619

; <label>:2619:                                   ; preds = %2616, %2604
  %2620 = phi double [ %2615, %2604 ], [ %2618, %2616 ]
  %2621 = fcmp ogt double %2590, %2620
  br i1 %2621, label %2622, label %2634

; <label>:2622:                                   ; preds = %2619
  %2623 = load i32, i32* %107, align 4
  %2624 = sext i32 %2623 to i64
  %2625 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2624
  %2626 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2625, i32 0, i32 1
  %2627 = load i32, i32* %36, align 4
  %2628 = sext i32 %2627 to i64
  %2629 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2626, i64 0, i64 %2628
  %2630 = load i32, i32* %37, align 4
  %2631 = sext i32 %2630 to i64
  %2632 = getelementptr inbounds [3 x double], [3 x double]* %2629, i64 0, i64 %2631
  %2633 = load double, double* %2632, align 8
  br label %2666

; <label>:2634:                                   ; preds = %2619
  %2635 = load i32, i32* %106, align 4
  %2636 = sext i32 %2635 to i64
  %2637 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2636
  %2638 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2637, i32 0, i32 1
  %2639 = load i32, i32* %36, align 4
  %2640 = sext i32 %2639 to i64
  %2641 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2638, i64 0, i64 %2640
  %2642 = load i32, i32* %37, align 4
  %2643 = sext i32 %2642 to i64
  %2644 = getelementptr inbounds [3 x double], [3 x double]* %2641, i64 0, i64 %2643
  %2645 = load double, double* %2644, align 8
  %2646 = load double, double* %105, align 8
  %2647 = fcmp olt double %2645, %2646
  br i1 %2647, label %2648, label %2661

; <label>:2648:                                   ; preds = %2634
  %pgocount113 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 32)
  %2649 = add i64 %pgocount113, 1
  store i64 %2649, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 32)
  %2650 = load i32, i32* %106, align 4
  %2651 = sext i32 %2650 to i64
  %2652 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2651
  %2653 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2652, i32 0, i32 1
  %2654 = load i32, i32* %36, align 4
  %2655 = sext i32 %2654 to i64
  %2656 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2653, i64 0, i64 %2655
  %2657 = load i32, i32* %37, align 4
  %2658 = sext i32 %2657 to i64
  %2659 = getelementptr inbounds [3 x double], [3 x double]* %2656, i64 0, i64 %2658
  %2660 = load double, double* %2659, align 8
  br label %2664

; <label>:2661:                                   ; preds = %2634
  %pgocount114 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 33)
  %2662 = add i64 %pgocount114, 1
  store i64 %2662, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 33)
  %2663 = load double, double* %105, align 8
  br label %2664

; <label>:2664:                                   ; preds = %2661, %2648
  %2665 = phi double [ %2660, %2648 ], [ %2663, %2661 ]
  br label %2666

; <label>:2666:                                   ; preds = %2664, %2622
  %2667 = phi double [ %2633, %2622 ], [ %2665, %2664 ]
  store double %2667, double* %103, align 8
  %2668 = load double, double* %104, align 8
  %2669 = load i32, i32* %106, align 4
  %2670 = sext i32 %2669 to i64
  %2671 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2670
  %2672 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2671, i32 0, i32 1
  %2673 = load i32, i32* %36, align 4
  %2674 = sext i32 %2673 to i64
  %2675 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2672, i64 0, i64 %2674
  %2676 = load i32, i32* %37, align 4
  %2677 = sext i32 %2676 to i64
  %2678 = getelementptr inbounds [3 x double], [3 x double]* %2675, i64 0, i64 %2677
  store double %2668, double* %2678, align 8
  %2679 = load double, double* %103, align 8
  %2680 = load i32, i32* %107, align 4
  %2681 = sext i32 %2680 to i64
  %2682 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %2681
  %2683 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %2682, i32 0, i32 1
  %2684 = load i32, i32* %36, align 4
  %2685 = sext i32 %2684 to i64
  %2686 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %2683, i64 0, i64 %2685
  %2687 = load i32, i32* %37, align 4
  %2688 = sext i32 %2687 to i64
  %2689 = getelementptr inbounds [3 x double], [3 x double]* %2686, i64 0, i64 %2688
  store double %2679, double* %2689, align 8
  br label %2690

; <label>:2690:                                   ; preds = %2666, %._crit_edge2, %2423
  br label %2691

; <label>:2691:                                   ; preds = %2690
  %pgocount115 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 22)
  %2692 = add i64 %pgocount115, 1
  store i64 %2692, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 22)
  %2693 = load i32, i32* %37, align 4
  %2694 = add nsw i32 %2693, 1
  store i32 %2694, i32* %37, align 4
  br label %2420

; <label>:2695:                                   ; preds = %2420
  br label %2696

; <label>:2696:                                   ; preds = %2695
  %pgocount116 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 57)
  %2697 = add i64 %pgocount116, 1
  store i64 %2697, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 57)
  %2698 = load i32, i32* %36, align 4
  %2699 = add nsw i32 %2698, 1
  store i32 %2699, i32* %36, align 4
  br label %2416

; <label>:2700:                                   ; preds = %2416
  %pgocount117 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 109)
  %2701 = add i64 %pgocount117, 1
  store i64 %2701, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 109)
  br label %2702

; <label>:2702:                                   ; preds = %2700, %2196
  %2703 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %2704 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %2703, i32 0, i32 8
  %2705 = load i32, i32* %2704, align 4
  %2706 = icmp eq i32 %2705, 1
  br i1 %2706, label %2707, label %2906

; <label>:2707:                                   ; preds = %2702
  store double 0.000000e+00, double* %111, align 8
  store double 0.000000e+00, double* %112, align 8
  store i32 5, i32* %36, align 4
  br label %2708

; <label>:2708:                                   ; preds = %2774, %2707
  %2709 = load i32, i32* %36, align 4
  %2710 = icmp slt i32 %2709, 21
  br i1 %2710, label %2711, label %2777

; <label>:2711:                                   ; preds = %2708
  %2712 = load i32, i32* %36, align 4
  %2713 = sext i32 %2712 to i64
  %2714 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0), i64 0, i64 %2713
  %2715 = load double, double* %2714, align 8
  %2716 = load i32, i32* %36, align 4
  %2717 = sext i32 %2716 to i64
  %2718 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0), i64 0, i64 %2717
  %2719 = load double, double* %2718, align 8
  %2720 = fcmp olt double %2715, %2719
  br i1 %2720, label %2721, label %2726

; <label>:2721:                                   ; preds = %2711
  %2722 = load i32, i32* %36, align 4
  %2723 = sext i32 %2722 to i64
  %2724 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0), i64 0, i64 %2723
  %2725 = load double, double* %2724, align 8
  br label %2732

; <label>:2726:                                   ; preds = %2711
  %pgocount118 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 68)
  %2727 = add i64 %pgocount118, 1
  store i64 %2727, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 68)
  %2728 = load i32, i32* %36, align 4
  %2729 = sext i32 %2728 to i64
  %2730 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0), i64 0, i64 %2729
  %2731 = load double, double* %2730, align 8
  br label %2732

; <label>:2732:                                   ; preds = %2726, %2721
  %2733 = phi double [ %2725, %2721 ], [ %2731, %2726 ]
  store double %2733, double* %109, align 8
  %2734 = load i32, i32* %36, align 4
  %2735 = sext i32 %2734 to i64
  %2736 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0), i64 0, i64 %2735
  %2737 = load double, double* %2736, align 8
  %2738 = load i32, i32* %36, align 4
  %2739 = sext i32 %2738 to i64
  %2740 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0), i64 0, i64 %2739
  %2741 = load double, double* %2740, align 8
  %2742 = fcmp ogt double %2737, %2741
  br i1 %2742, label %2743, label %2748

; <label>:2743:                                   ; preds = %2732
  %2744 = load i32, i32* %36, align 4
  %2745 = sext i32 %2744 to i64
  %2746 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0), i64 0, i64 %2745
  %2747 = load double, double* %2746, align 8
  br label %2754

; <label>:2748:                                   ; preds = %2732
  %pgocount119 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 69)
  %2749 = add i64 %pgocount119, 1
  store i64 %2749, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 69)
  %2750 = load i32, i32* %36, align 4
  %2751 = sext i32 %2750 to i64
  %2752 = getelementptr inbounds [22 x double], [22 x double]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0), i64 0, i64 %2751
  %2753 = load double, double* %2752, align 8
  br label %2754

; <label>:2754:                                   ; preds = %2748, %2743
  %2755 = phi double [ %2747, %2743 ], [ %2753, %2748 ]
  store double %2755, double* %110, align 8
  %2756 = load double, double* %110, align 8
  %2757 = load double, double* %109, align 8
  %2758 = fmul double 1.000000e+03, %2757
  %2759 = fcmp oge double %2756, %2758
  br i1 %2759, label %2760, label %2762

; <label>:2760:                                   ; preds = %2754
  %pgocount120 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 70)
  %2761 = add i64 %pgocount120, 1
  store i64 %2761, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 70)
  store double 3.000000e+00, double* %108, align 8
  br label %2768

; <label>:2762:                                   ; preds = %2754
  %pgocount121 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 71)
  %2763 = add i64 %pgocount121, 1
  store i64 %2763, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 71)
  %2764 = load double, double* %110, align 8
  %2765 = load double, double* %109, align 8
  %2766 = fdiv double %2764, %2765
  %2767 = call double @log10(double %2766) #6
  store double %2767, double* %108, align 8
  br label %2768

; <label>:2768:                                   ; preds = %2762, %2760
  %2769 = load double, double* %108, align 8
  %2770 = load double, double* %111, align 8
  %2771 = fadd double %2770, %2769
  store double %2771, double* %111, align 8
  %2772 = load double, double* %112, align 8
  %2773 = fadd double %2772, 1.000000e+00
  store double %2773, double* %112, align 8
  br label %2774

; <label>:2774:                                   ; preds = %2768
  %2775 = load i32, i32* %36, align 4
  %2776 = add nsw i32 %2775, 1
  store i32 %2776, i32* %36, align 4
  br label %2708

; <label>:2777:                                   ; preds = %2708
  %2778 = load double, double* %111, align 8
  %2779 = load double, double* %112, align 8
  %2780 = fdiv double %2778, %2779
  %2781 = fmul double %2780, 7.000000e-01
  store double %2781, double* %26, align 8
  %2782 = load double, double* %26, align 8
  %2783 = fcmp olt double %2782, 5.000000e-01
  br i1 %2783, label %2784, label %2786

; <label>:2784:                                   ; preds = %2777
  %2785 = load double, double* %26, align 8
  br label %2788

; <label>:2786:                                   ; preds = %2777
  %pgocount122 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 123)
  %2787 = add i64 %pgocount122, 1
  store i64 %2787, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 123)
  br label %2788

; <label>:2788:                                   ; preds = %2786, %2784
  %2789 = phi double [ %2785, %2784 ], [ 5.000000e-01, %2786 ]
  store double %2789, double* %26, align 8
  store double 0.000000e+00, double* %111, align 8
  store double 0.000000e+00, double* %112, align 8
  store i32 0, i32* %37, align 4
  br label %2790

; <label>:2790:                                   ; preds = %2888, %2788
  %2791 = load i32, i32* %37, align 4
  %2792 = icmp slt i32 %2791, 3
  br i1 %2792, label %2793, label %2892

; <label>:2793:                                   ; preds = %2790
  store i32 3, i32* %36, align 4
  br label %2794

; <label>:2794:                                   ; preds = %2884, %2793
  %2795 = load i32, i32* %36, align 4
  %2796 = icmp slt i32 %2795, 12
  br i1 %2796, label %2797, label %2887

; <label>:2797:                                   ; preds = %2794
  %2798 = load i32, i32* %36, align 4
  %2799 = sext i32 %2798 to i64
  %2800 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1), i64 0, i64 %2799
  %2801 = load i32, i32* %37, align 4
  %2802 = sext i32 %2801 to i64
  %2803 = getelementptr inbounds [3 x double], [3 x double]* %2800, i64 0, i64 %2802
  %2804 = load double, double* %2803, align 8
  %2805 = load i32, i32* %36, align 4
  %2806 = sext i32 %2805 to i64
  %2807 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1), i64 0, i64 %2806
  %2808 = load i32, i32* %37, align 4
  %2809 = sext i32 %2808 to i64
  %2810 = getelementptr inbounds [3 x double], [3 x double]* %2807, i64 0, i64 %2809
  %2811 = load double, double* %2810, align 8
  %2812 = fcmp olt double %2804, %2811
  br i1 %2812, label %2813, label %2821

; <label>:2813:                                   ; preds = %2797
  %2814 = load i32, i32* %36, align 4
  %2815 = sext i32 %2814 to i64
  %2816 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1), i64 0, i64 %2815
  %2817 = load i32, i32* %37, align 4
  %2818 = sext i32 %2817 to i64
  %2819 = getelementptr inbounds [3 x double], [3 x double]* %2816, i64 0, i64 %2818
  %2820 = load double, double* %2819, align 8
  br label %2830

; <label>:2821:                                   ; preds = %2797
  %pgocount123 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 48)
  %2822 = add i64 %pgocount123, 1
  store i64 %2822, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 48)
  %2823 = load i32, i32* %36, align 4
  %2824 = sext i32 %2823 to i64
  %2825 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1), i64 0, i64 %2824
  %2826 = load i32, i32* %37, align 4
  %2827 = sext i32 %2826 to i64
  %2828 = getelementptr inbounds [3 x double], [3 x double]* %2825, i64 0, i64 %2827
  %2829 = load double, double* %2828, align 8
  br label %2830

; <label>:2830:                                   ; preds = %2821, %2813
  %2831 = phi double [ %2820, %2813 ], [ %2829, %2821 ]
  store double %2831, double* %109, align 8
  %2832 = load i32, i32* %36, align 4
  %2833 = sext i32 %2832 to i64
  %2834 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1), i64 0, i64 %2833
  %2835 = load i32, i32* %37, align 4
  %2836 = sext i32 %2835 to i64
  %2837 = getelementptr inbounds [3 x double], [3 x double]* %2834, i64 0, i64 %2836
  %2838 = load double, double* %2837, align 8
  %2839 = load i32, i32* %36, align 4
  %2840 = sext i32 %2839 to i64
  %2841 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1), i64 0, i64 %2840
  %2842 = load i32, i32* %37, align 4
  %2843 = sext i32 %2842 to i64
  %2844 = getelementptr inbounds [3 x double], [3 x double]* %2841, i64 0, i64 %2843
  %2845 = load double, double* %2844, align 8
  %2846 = fcmp ogt double %2838, %2845
  br i1 %2846, label %2847, label %2855

; <label>:2847:                                   ; preds = %2830
  %2848 = load i32, i32* %36, align 4
  %2849 = sext i32 %2848 to i64
  %2850 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1), i64 0, i64 %2849
  %2851 = load i32, i32* %37, align 4
  %2852 = sext i32 %2851 to i64
  %2853 = getelementptr inbounds [3 x double], [3 x double]* %2850, i64 0, i64 %2852
  %2854 = load double, double* %2853, align 8
  br label %2864

; <label>:2855:                                   ; preds = %2830
  %pgocount124 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 49)
  %2856 = add i64 %pgocount124, 1
  store i64 %2856, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 49)
  %2857 = load i32, i32* %36, align 4
  %2858 = sext i32 %2857 to i64
  %2859 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* getelementptr inbounds ([4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1), i64 0, i64 %2858
  %2860 = load i32, i32* %37, align 4
  %2861 = sext i32 %2860 to i64
  %2862 = getelementptr inbounds [3 x double], [3 x double]* %2859, i64 0, i64 %2861
  %2863 = load double, double* %2862, align 8
  br label %2864

; <label>:2864:                                   ; preds = %2855, %2847
  %2865 = phi double [ %2854, %2847 ], [ %2863, %2855 ]
  store double %2865, double* %110, align 8
  %2866 = load double, double* %110, align 8
  %2867 = load double, double* %109, align 8
  %2868 = fmul double 1.000000e+03, %2867
  %2869 = fcmp oge double %2866, %2868
  br i1 %2869, label %2870, label %2872

; <label>:2870:                                   ; preds = %2864
  %pgocount125 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 50)
  %2871 = add i64 %pgocount125, 1
  store i64 %2871, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 50)
  store double 3.000000e+00, double* %108, align 8
  br label %2878

; <label>:2872:                                   ; preds = %2864
  %pgocount126 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 51)
  %2873 = add i64 %pgocount126, 1
  store i64 %2873, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 51)
  %2874 = load double, double* %110, align 8
  %2875 = load double, double* %109, align 8
  %2876 = fdiv double %2874, %2875
  %2877 = call double @log10(double %2876) #6
  store double %2877, double* %108, align 8
  br label %2878

; <label>:2878:                                   ; preds = %2872, %2870
  %2879 = load double, double* %108, align 8
  %2880 = load double, double* %111, align 8
  %2881 = fadd double %2880, %2879
  store double %2881, double* %111, align 8
  %2882 = load double, double* %112, align 8
  %2883 = fadd double %2882, 1.000000e+00
  store double %2883, double* %112, align 8
  br label %2884

; <label>:2884:                                   ; preds = %2878
  %2885 = load i32, i32* %36, align 4
  %2886 = add nsw i32 %2885, 1
  store i32 %2886, i32* %36, align 4
  br label %2794

; <label>:2887:                                   ; preds = %2794
  br label %2888

; <label>:2888:                                   ; preds = %2887
  %pgocount127 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 58)
  %2889 = add i64 %pgocount127, 1
  store i64 %2889, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 58)
  %2890 = load i32, i32* %37, align 4
  %2891 = add nsw i32 %2890, 1
  store i32 %2891, i32* %37, align 4
  br label %2790

; <label>:2892:                                   ; preds = %2790
  %2893 = load double, double* %111, align 8
  %2894 = load double, double* %112, align 8
  %2895 = fdiv double %2893, %2894
  %2896 = fmul double %2895, 7.000000e-01
  store double %2896, double* %27, align 8
  %2897 = load double, double* %27, align 8
  %2898 = fcmp olt double %2897, 5.000000e-01
  br i1 %2898, label %2899, label %2902

; <label>:2899:                                   ; preds = %2892
  %pgocount128 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 124)
  %2900 = add i64 %pgocount128, 1
  store i64 %2900, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 124)
  %2901 = load double, double* %27, align 8
  br label %2904

; <label>:2902:                                   ; preds = %2892
  %pgocount129 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 125)
  %2903 = add i64 %pgocount129, 1
  store i64 %2903, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 125)
  br label %2904

; <label>:2904:                                   ; preds = %2902, %2899
  %2905 = phi double [ %2901, %2899 ], [ 5.000000e-01, %2902 ]
  store double %2905, double* %27, align 8
  br label %2906

; <label>:2906:                                   ; preds = %2904, %2702
  store i32 0, i32* %31, align 4
  br label %2907

; <label>:2907:                                   ; preds = %2917, %2906
  %2908 = load i32, i32* %31, align 4
  %2909 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %2910 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %2909, i32 0, i32 46
  %2911 = load i32, i32* %2910, align 4
  %2912 = icmp slt i32 %2908, %2911
  br i1 %2912, label %2913, label %2921

; <label>:2913:                                   ; preds = %2907
  %2914 = load i32, i32* %31, align 4
  %2915 = sext i32 %2914 to i64
  %2916 = getelementptr inbounds [2 x i32], [2 x i32]* %28, i64 0, i64 %2915
  store i32 0, i32* %2916, align 4
  br label %2917

; <label>:2917:                                   ; preds = %2913
  %pgocount130 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 29)
  %2918 = add i64 %pgocount130, 1
  store i64 %2918, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 29)
  %2919 = load i32, i32* %31, align 4
  %2920 = add nsw i32 %2919, 1
  store i32 %2920, i32* %31, align 4
  br label %2907

; <label>:2921:                                   ; preds = %2907
  %2922 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %2923 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %2922, i32 0, i32 46
  %2924 = load i32, i32* %2923, align 4
  %2925 = icmp eq i32 %2924, 2
  br i1 %2925, label %2926, label %2959

; <label>:2926:                                   ; preds = %2921
  %2927 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %2928 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %2927, i32 0, i32 36
  %2929 = load i32, i32* %2928, align 4
  %2930 = icmp ne i32 %2929, 0
  br i1 %2930, label %2931, label %2937

; <label>:2931:                                   ; preds = %2926
  %pgocount131 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 122)
  %2932 = add i64 %pgocount131, 1
  store i64 %2932, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 122)
  %2933 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %2934 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %2933, i32 0, i32 8
  %2935 = load i32, i32* %2934, align 4
  %2936 = icmp eq i32 %2935, 1
  br i1 %2936, label %2937, label %2957

; <label>:2937:                                   ; preds = %2931, %2926
  %2938 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 0
  %2939 = load i32, i32* %2938, align 4
  %2940 = icmp ne i32 %2939, 0
  br i1 %2940, label %2941, label %2946

; <label>:2941:                                   ; preds = %2937
  %pgocount132 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 127)
  %2942 = add i64 %pgocount132, 1
  store i64 %2942, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 127)
  %2943 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 1
  %2944 = load i32, i32* %2943, align 4
  %2945 = icmp ne i32 %2944, 0
  br label %2946

; <label>:2946:                                   ; preds = %2941, %2937
  %2947 = phi i1 [ false, %2937 ], [ %2945, %2941 ]
  %2948 = zext i1 %2947 to i32
  store i32 %2948, i32* %113, align 4
  %2949 = load i32, i32* %113, align 4
  %2950 = icmp ne i32 %2949, 0
  br i1 %2950, label %2955, label %2951

; <label>:2951:                                   ; preds = %2946
  %pgocount133 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 128)
  %2952 = add i64 %pgocount133, 1
  store i64 %2952, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 128)
  %2953 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 0
  store i32 0, i32* %2953, align 4
  %2954 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 1
  store i32 0, i32* %2954, align 4
  br label %2955

; <label>:2955:                                   ; preds = %2951, %2946
  %pgocount134 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 121)
  %2956 = add i64 %pgocount134, 1
  store i64 %2956, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 121)
  br label %2957

; <label>:2957:                                   ; preds = %2955, %2931
  %pgocount135 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 110)
  %2958 = add i64 %pgocount135, 1
  store i64 %2958, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 110)
  br label %2959

; <label>:2959:                                   ; preds = %2957, %2921
  store i32 0, i32* %31, align 4
  br label %2960

; <label>:2960:                                   ; preds = %3037, %2959
  %2961 = load i32, i32* %31, align 4
  %2962 = load %struct.lame_global_flags*, %struct.lame_global_flags** %12, align 8
  %2963 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %2962, i32 0, i32 46
  %2964 = load i32, i32* %2963, align 4
  %2965 = icmp slt i32 %2961, %2964
  br i1 %2965, label %2966, label %3040

; <label>:2966:                                   ; preds = %2960
  %2967 = load i32, i32* %31, align 4
  %2968 = sext i32 %2967 to i64
  %2969 = getelementptr inbounds [2 x i32], [2 x i32]* %29, i64 0, i64 %2968
  %2970 = load i32, i32* %2969, align 4
  %2971 = icmp ne i32 %2970, 0
  br i1 %2971, label %2972, label %2994

; <label>:2972:                                   ; preds = %2966
  %2973 = load i32, i32* %31, align 4
  %2974 = sext i32 %2973 to i64
  %2975 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %2974
  %2976 = load i32, i32* %2975, align 4
  switch i32 %2976, label %2992 [
    i32 0, label %._crit_edge1
    i32 3, label %2978
    i32 2, label %2983
    i32 1, label %2988
  ]

._crit_edge1:                                     ; preds = %2972
  %pgocount136 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 27)
  %2977 = add i64 %pgocount136, 1
  store i64 %2977, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 27)
  br label %2978

; <label>:2978:                                   ; preds = %._crit_edge1, %2972
  %pgocount137 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 65)
  %2979 = add i64 %pgocount137, 1
  store i64 %2979, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 65)
  %2980 = load i32, i32* %31, align 4
  %2981 = sext i32 %2980 to i64
  %2982 = getelementptr inbounds [2 x i32], [2 x i32]* %28, i64 0, i64 %2981
  store i32 0, i32* %2982, align 4
  br label %2992

; <label>:2983:                                   ; preds = %2972
  %pgocount138 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 75)
  %2984 = add i64 %pgocount138, 1
  store i64 %2984, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 75)
  %2985 = load i32, i32* %31, align 4
  %2986 = sext i32 %2985 to i64
  %2987 = getelementptr inbounds [2 x i32], [2 x i32]* %28, i64 0, i64 %2986
  store i32 3, i32* %2987, align 4
  br label %2992

; <label>:2988:                                   ; preds = %2972
  %pgocount139 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 141)
  %2989 = add i64 %pgocount139, 1
  store i64 %2989, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 141)
  %2990 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2991 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2990, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i32 0, i32 0))
  call void @abort() #7
  unreachable

; <label>:2992:                                   ; preds = %2983, %2978, %2972
  %pgocount140 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 52)
  %2993 = add i64 %pgocount140, 1
  store i64 %2993, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 52)
  br label %3021

; <label>:2994:                                   ; preds = %2966
  %2995 = load i32, i32* %31, align 4
  %2996 = sext i32 %2995 to i64
  %2997 = getelementptr inbounds [2 x i32], [2 x i32]* %28, i64 0, i64 %2996
  store i32 2, i32* %2997, align 4
  %2998 = load i32, i32* %31, align 4
  %2999 = sext i32 %2998 to i64
  %3000 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %2999
  %3001 = load i32, i32* %3000, align 4
  %3002 = icmp eq i32 %3001, 0
  br i1 %3002, label %3003, label %3008

; <label>:3003:                                   ; preds = %2994
  %pgocount141 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 86)
  %3004 = add i64 %pgocount141, 1
  store i64 %3004, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 86)
  %3005 = load i32, i32* %31, align 4
  %3006 = sext i32 %3005 to i64
  %3007 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %3006
  store i32 1, i32* %3007, align 4
  br label %3008

; <label>:3008:                                   ; preds = %3003, %2994
  %3009 = load i32, i32* %31, align 4
  %3010 = sext i32 %3009 to i64
  %3011 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %3010
  %3012 = load i32, i32* %3011, align 4
  %3013 = icmp eq i32 %3012, 3
  br i1 %3013, label %3014, label %3019

; <label>:3014:                                   ; preds = %3008
  %pgocount142 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 74)
  %3015 = add i64 %pgocount142, 1
  store i64 %3015, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 74)
  %3016 = load i32, i32* %31, align 4
  %3017 = sext i32 %3016 to i64
  %3018 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %3017
  store i32 2, i32* %3018, align 4
  br label %3019

; <label>:3019:                                   ; preds = %3014, %3008
  %pgocount143 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 63)
  %3020 = add i64 %pgocount143, 1
  store i64 %3020, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 63)
  br label %3021

; <label>:3021:                                   ; preds = %3019, %2992
  %3022 = load i32, i32* %31, align 4
  %3023 = sext i32 %3022 to i64
  %3024 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %3023
  %3025 = load i32, i32* %3024, align 4
  %3026 = load i32*, i32** %22, align 8
  %3027 = load i32, i32* %31, align 4
  %3028 = sext i32 %3027 to i64
  %3029 = getelementptr inbounds i32, i32* %3026, i64 %3028
  store i32 %3025, i32* %3029, align 4
  %3030 = load i32, i32* %31, align 4
  %3031 = sext i32 %3030 to i64
  %3032 = getelementptr inbounds [2 x i32], [2 x i32]* %28, i64 0, i64 %3031
  %3033 = load i32, i32* %3032, align 4
  %3034 = load i32, i32* %31, align 4
  %3035 = sext i32 %3034 to i64
  %3036 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %3035
  store i32 %3033, i32* %3036, align 4
  br label %3037

; <label>:3037:                                   ; preds = %3021
  %3038 = load i32, i32* %31, align 4
  %3039 = add nsw i32 %3038, 1
  store i32 %3039, i32* %31, align 4
  br label %2960

; <label>:3040:                                   ; preds = %2960
  %3041 = load i32*, i32** %22, align 8
  %3042 = getelementptr inbounds i32, i32* %3041, i64 0
  %3043 = load i32, i32* %3042, align 4
  %3044 = icmp eq i32 %3043, 2
  br i1 %3044, label %3045, label %3048

; <label>:3045:                                   ; preds = %3040
  %3046 = load double, double* @L3psycho_anal.ms_ratio_s_old, align 8
  %3047 = load double*, double** %15, align 8
  store double %3046, double* %3047, align 8
  br label %3052

; <label>:3048:                                   ; preds = %3040
  %pgocount144 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 111)
  %3049 = add i64 %pgocount144, 1
  store i64 %3049, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 111)
  %3050 = load double, double* @L3psycho_anal.ms_ratio_l_old, align 8
  %3051 = load double*, double** %15, align 8
  store double %3050, double* %3051, align 8
  br label %3052

; <label>:3052:                                   ; preds = %3048, %3045
  %3053 = load double, double* %27, align 8
  store double %3053, double* @L3psycho_anal.ms_ratio_s_old, align 8
  %3054 = load double, double* %26, align 8
  store double %3054, double* @L3psycho_anal.ms_ratio_l_old, align 8
  %3055 = load double, double* %26, align 8
  %3056 = load double*, double** %16, align 8
  store double %3055, double* %3056, align 8
  %3057 = load i32, i32* %30, align 4
  %3058 = icmp eq i32 %3057, 4
  br i1 %3058, label %3059, label %3078

; <label>:3059:                                   ; preds = %3052
  %3060 = getelementptr inbounds [4 x float], [4 x float]* %25, i64 0, i64 3
  %3061 = load float, float* %3060, align 4
  %3062 = getelementptr inbounds [4 x float], [4 x float]* %25, i64 0, i64 2
  %3063 = load float, float* %3062, align 8
  %3064 = fadd float %3061, %3063
  store float %3064, float* %114, align 4
  %3065 = load double, double* @L3psycho_anal.ms_ener_ratio_old, align 8
  %3066 = load double*, double** %17, align 8
  store double %3065, double* %3066, align 8
  store double 0.000000e+00, double* @L3psycho_anal.ms_ener_ratio_old, align 8
  %3067 = load float, float* %114, align 4
  %3068 = fcmp ogt float %3067, 0.000000e+00
  br i1 %3068, label %3069, label %3076

; <label>:3069:                                   ; preds = %3059
  %pgocount145 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 126)
  %3070 = add i64 %pgocount145, 1
  store i64 %3070, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 126)
  %3071 = getelementptr inbounds [4 x float], [4 x float]* %25, i64 0, i64 3
  %3072 = load float, float* %3071, align 4
  %3073 = load float, float* %114, align 4
  %3074 = fdiv float %3072, %3073
  %3075 = fpext float %3074 to double
  store double %3075, double* @L3psycho_anal.ms_ener_ratio_old, align 8
  br label %3076

; <label>:3076:                                   ; preds = %3069, %3059
  %pgocount146 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 112)
  %3077 = add i64 %pgocount146, 1
  store i64 %3077, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 112)
  br label %3081

; <label>:3078:                                   ; preds = %3052
  %pgocount147 = load i64, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 113)
  %3079 = add i64 %pgocount147, 1
  store i64 %3079, i64* getelementptr inbounds ([143 x i64], [143 x i64]* @__profc_L3psycho_anal, i64 0, i64 113)
  %3080 = load double*, double** %17, align 8
  store double 0.000000e+00, double* %3080, align 8
  br label %3081

; <label>:3081:                                   ; preds = %3078, %3076
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare double @cos(double) #4

; Function Attrs: nounwind
declare double @pow(double, double) #4

; Function Attrs: noinline nounwind uwtable
define void @L3para_read(double, i32*, i32*, i32*, double*, double*, [64 x double]*, [64 x double]*, double*, double*, i32*, i32*, double*, double*, i32*, i32*, double*, double*) #0 {
  %19 = alloca double, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca double*, align 8
  %24 = alloca double*, align 8
  %25 = alloca [64 x double]*, align 8
  %26 = alloca [64 x double]*, align 8
  %27 = alloca double*, align 8
  %28 = alloca double*, align 8
  %29 = alloca i32*, align 8
  %30 = alloca i32*, align 8
  %31 = alloca double*, align 8
  %32 = alloca double*, align 8
  %33 = alloca i32*, align 8
  %34 = alloca i32*, align 8
  %35 = alloca double*, align 8
  %36 = alloca double*, align 8
  %37 = alloca double, align 8
  %38 = alloca [63 x double], align 16
  %39 = alloca [63 x double], align 16
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca double*, align 8
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca double, align 8
  %52 = alloca double, align 8
  %53 = alloca double, align 8
  %54 = alloca double, align 8
  %55 = alloca double, align 8
  %56 = alloca double, align 8
  %57 = alloca double, align 8
  %58 = alloca double, align 8
  store double %0, double* %19, align 8
  store i32* %1, i32** %20, align 8
  store i32* %2, i32** %21, align 8
  store i32* %3, i32** %22, align 8
  store double* %4, double** %23, align 8
  store double* %5, double** %24, align 8
  store [64 x double]* %6, [64 x double]** %25, align 8
  store [64 x double]* %7, [64 x double]** %26, align 8
  store double* %8, double** %27, align 8
  store double* %9, double** %28, align 8
  store i32* %10, i32** %29, align 8
  store i32* %11, i32** %30, align 8
  store double* %12, double** %31, align 8
  store double* %13, double** %32, align 8
  store i32* %14, i32** %33, align 8
  store i32* %15, i32** %34, align 8
  store double* %16, double** %35, align 8
  store double* %17, double** %36, align 8
  store i32 0, i32* %40, align 4
  store double* getelementptr inbounds ([0 x double], [0 x double]* @psy_data, i32 0, i32 0), double** %42, align 8
  store i32 1, i32* %50, align 4
  store i32 0, i32* %48, align 4
  br label %59

; <label>:59:                                     ; preds = %165, %18
  %60 = load i32, i32* %48, align 4
  %61 = icmp slt i32 %60, 6
  br i1 %61, label %62, label %168

; <label>:62:                                     ; preds = %59
  %63 = load double*, double** %42, align 8
  %64 = getelementptr inbounds double, double* %63, i32 1
  store double* %64, double** %42, align 8
  %65 = load double, double* %63, align 8
  store double %65, double* %37, align 8
  %66 = load double*, double** %42, align 8
  %67 = getelementptr inbounds double, double* %66, i32 1
  store double* %67, double** %42, align 8
  %68 = load double, double* %66, align 8
  %69 = fptosi double %68 to i32
  store i32 %69, i32* %41, align 4
  %70 = load i32, i32* %41, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %41, align 4
  %72 = load double, double* %19, align 8
  %73 = load double, double* %37, align 8
  %74 = load i32, i32* %50, align 4
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %73, %75
  %77 = fcmp oeq double %72, %76
  br i1 %77, label %78, label %157

; <label>:78:                                     ; preds = %62
  %79 = load i32, i32* %41, align 4
  store i32 %79, i32* %40, align 4
  store i32 0, i32* %44, align 4
  store i32 0, i32* %47, align 4
  br label %80

; <label>:80:                                     ; preds = %152, %78
  %81 = load i32, i32* %44, align 4
  %82 = load i32, i32* %41, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %155

; <label>:84:                                     ; preds = %80
  %85 = load double*, double** %42, align 8
  %86 = getelementptr inbounds double, double* %85, i32 1
  store double* %86, double** %42, align 8
  %87 = load double, double* %85, align 8
  %88 = fptosi double %87 to i32
  store i32 %88, i32* %45, align 4
  %89 = load double*, double** %42, align 8
  %90 = getelementptr inbounds double, double* %89, i32 1
  store double* %90, double** %42, align 8
  %91 = load double, double* %89, align 8
  %92 = fptosi double %91 to i32
  %93 = load i32*, i32** %20, align 8
  %94 = load i32, i32* %44, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32* %93, i64 %95
  store i32 %92, i32* %96, align 4
  %97 = load double*, double** %42, align 8
  %98 = getelementptr inbounds double, double* %97, i32 1
  store double* %98, double** %42, align 8
  %99 = load double, double* %97, align 8
  %100 = fsub double %99, 6.000000e+00
  %101 = fsub double -0.000000e+00, %100
  %102 = fmul double %101, 0x3FCD791C5F888823
  %103 = call double @exp(double %102) #6
  %104 = load double*, double** %23, align 8
  %105 = load i32, i32* %44, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double* %104, i64 %106
  store double %103, double* %107, align 8
  %108 = load double*, double** %42, align 8
  %109 = getelementptr inbounds double, double* %108, i32 1
  store double* %109, double** %42, align 8
  %110 = load double, double* %108, align 8
  %111 = load double*, double** %24, align 8
  %112 = load i32, i32* %44, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds double, double* %111, i64 %113
  store double %110, double* %114, align 8
  %115 = load double*, double** %42, align 8
  %116 = getelementptr inbounds double, double* %115, i32 1
  store double* %116, double** %42, align 8
  %117 = load double*, double** %42, align 8
  %118 = getelementptr inbounds double, double* %117, i32 1
  store double* %118, double** %42, align 8
  %119 = load double, double* %117, align 8
  %120 = load i32, i32* %44, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %121
  store double %119, double* %122, align 8
  %123 = load i32, i32* %45, align 4
  %124 = load i32, i32* %44, align 4
  %125 = icmp ne i32 %123, %124
  br i1 %125, label %126, label %130

; <label>:126:                                    ; preds = %84
  %pgocount = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 30)
  %127 = add i64 %pgocount, 1
  store i64 %127, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 30)
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %129 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %128, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:130:                                    ; preds = %84
  %pgocount1 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 1)
  %131 = add i64 %pgocount1, 1
  store i64 %131, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 1)
  store i32 0, i32* %46, align 4
  br label %132

; <label>:132:                                    ; preds = %148, %130
  %133 = load i32, i32* %46, align 4
  %134 = load i32*, i32** %20, align 8
  %135 = load i32, i32* %44, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32* %134, i64 %136
  %138 = load i32, i32* %137, align 4
  %139 = icmp slt i32 %133, %138
  br i1 %139, label %140, label %151

; <label>:140:                                    ; preds = %132
  %pgocount2 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 0)
  %141 = add i64 %pgocount2, 1
  store i64 %141, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 0)
  %142 = load i32, i32* %44, align 4
  %143 = load i32*, i32** %22, align 8
  %144 = load i32, i32* %47, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* %47, align 4
  %146 = sext i32 %144 to i64
  %147 = getelementptr inbounds i32, i32* %143, i64 %146
  store i32 %142, i32* %147, align 4
  br label %148

; <label>:148:                                    ; preds = %140
  %149 = load i32, i32* %46, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %46, align 4
  br label %132

; <label>:151:                                    ; preds = %132
  br label %152

; <label>:152:                                    ; preds = %151
  %153 = load i32, i32* %44, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %44, align 4
  br label %80

; <label>:155:                                    ; preds = %80
  %pgocount3 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 21)
  %156 = add i64 %pgocount3, 1
  store i64 %156, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 21)
  br label %164

; <label>:157:                                    ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 25)
  %158 = add i64 %pgocount4, 1
  store i64 %158, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 25)
  %159 = load i32, i32* %41, align 4
  %160 = mul nsw i32 %159, 6
  %161 = load double*, double** %42, align 8
  %162 = sext i32 %160 to i64
  %163 = getelementptr inbounds double, double* %161, i64 %162
  store double* %163, double** %42, align 8
  br label %164

; <label>:164:                                    ; preds = %157, %155
  br label %165

; <label>:165:                                    ; preds = %164
  %166 = load i32, i32* %48, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %48, align 4
  br label %59

; <label>:168:                                    ; preds = %59
  %169 = load i32, i32* %40, align 4
  store i32 %169, i32* %49, align 4
  store i32 0, i32* %44, align 4
  br label %170

; <label>:170:                                    ; preds = %295, %168
  %171 = load i32, i32* %44, align 4
  %172 = load i32, i32* %49, align 4
  %173 = icmp slt i32 %171, %172
  br i1 %173, label %174, label %299

; <label>:174:                                    ; preds = %170
  store i32 0, i32* %45, align 4
  br label %175

; <label>:175:                                    ; preds = %291, %174
  %176 = load i32, i32* %45, align 4
  %177 = load i32, i32* %49, align 4
  %178 = icmp slt i32 %176, %177
  br i1 %178, label %179, label %294

; <label>:179:                                    ; preds = %175
  %180 = load i32, i32* %45, align 4
  %181 = load i32, i32* %44, align 4
  %182 = icmp sge i32 %180, %181
  br i1 %182, label %183, label %194

; <label>:183:                                    ; preds = %179
  %184 = load i32, i32* %44, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %185
  %187 = load double, double* %186, align 8
  %188 = load i32, i32* %45, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %189
  %191 = load double, double* %190, align 8
  %192 = fsub double %187, %191
  %193 = fmul double %192, 3.000000e+00
  store double %193, double* %51, align 8
  br label %206

; <label>:194:                                    ; preds = %179
  %pgocount5 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 5)
  %195 = add i64 %pgocount5, 1
  store i64 %195, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 5)
  %196 = load i32, i32* %44, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %197
  %199 = load double, double* %198, align 8
  %200 = load i32, i32* %45, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %201
  %203 = load double, double* %202, align 8
  %204 = fsub double %199, %203
  %205 = fmul double %204, 1.500000e+00
  store double %205, double* %51, align 8
  br label %206

; <label>:206:                                    ; preds = %194, %183
  %207 = load i32, i32* %44, align 4
  %208 = load i32, i32* %45, align 4
  %209 = icmp sge i32 %207, %208
  br i1 %209, label %210, label %221

; <label>:210:                                    ; preds = %206
  %211 = load i32, i32* %44, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %212
  %214 = load double, double* %213, align 8
  %215 = load i32, i32* %45, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %216
  %218 = load double, double* %217, align 8
  %219 = fsub double %214, %218
  %220 = fmul double %219, 3.000000e+00
  store double %220, double* %51, align 8
  br label %233

; <label>:221:                                    ; preds = %206
  %pgocount6 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 6)
  %222 = add i64 %pgocount6, 1
  store i64 %222, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 6)
  %223 = load i32, i32* %44, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %224
  %226 = load double, double* %225, align 8
  %227 = load i32, i32* %45, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [63 x double], [63 x double]* %38, i64 0, i64 %228
  %230 = load double, double* %229, align 8
  %231 = fsub double %226, %230
  %232 = fmul double %231, 1.500000e+00
  store double %232, double* %51, align 8
  br label %233

; <label>:233:                                    ; preds = %221, %210
  %234 = load double, double* %51, align 8
  %235 = fcmp oge double %234, 5.000000e-01
  br i1 %235, label %236, label %251

; <label>:236:                                    ; preds = %233
  %pgocount7 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 7)
  %237 = add i64 %pgocount7, 1
  store i64 %237, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 7)
  %238 = load double, double* %51, align 8
  %239 = fcmp ole double %238, 2.500000e+00
  br i1 %239, label %240, label %251

; <label>:240:                                    ; preds = %236
  %pgocount8 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 17)
  %241 = add i64 %pgocount8, 1
  store i64 %241, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 17)
  %242 = load double, double* %51, align 8
  %243 = fsub double %242, 5.000000e-01
  store double %243, double* %54, align 8
  %244 = load double, double* %54, align 8
  %245 = load double, double* %54, align 8
  %246 = fmul double %244, %245
  %247 = load double, double* %54, align 8
  %248 = fmul double 2.000000e+00, %247
  %249 = fsub double %246, %248
  %250 = fmul double 8.000000e+00, %249
  store double %250, double* %52, align 8
  br label %252

; <label>:251:                                    ; preds = %236, %233
  store double 0.000000e+00, double* %52, align 8
  br label %252

; <label>:252:                                    ; preds = %251, %240
  %253 = load double, double* %51, align 8
  %254 = fadd double %253, 4.740000e-01
  store double %254, double* %51, align 8
  %255 = load double, double* %51, align 8
  %256 = fmul double 7.500000e+00, %255
  %257 = fadd double 0x402F9F6E6106AB15, %256
  %258 = load double, double* %51, align 8
  %259 = load double, double* %51, align 8
  %260 = fmul double %258, %259
  %261 = fadd double 1.000000e+00, %260
  %262 = call double @sqrt(double %261) #6
  %263 = fmul double 1.750000e+01, %262
  %264 = fsub double %257, %263
  store double %264, double* %53, align 8
  %265 = load double, double* %53, align 8
  %266 = fcmp ole double %265, -6.000000e+01
  br i1 %266, label %267, label %276

; <label>:267:                                    ; preds = %252
  %pgocount9 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 8)
  %268 = add i64 %pgocount9, 1
  store i64 %268, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 8)
  %269 = load [64 x double]*, [64 x double]** %25, align 8
  %270 = load i32, i32* %44, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [64 x double], [64 x double]* %269, i64 %271
  %273 = load i32, i32* %45, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [64 x double], [64 x double]* %272, i64 0, i64 %274
  store double 0.000000e+00, double* %275, align 8
  br label %290

; <label>:276:                                    ; preds = %252
  %pgocount10 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 9)
  %277 = add i64 %pgocount10, 1
  store i64 %277, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 9)
  %278 = load double, double* %52, align 8
  %279 = load double, double* %53, align 8
  %280 = fadd double %278, %279
  %281 = fmul double %280, 0x3FCD791C5F888823
  %282 = call double @exp(double %281) #6
  %283 = load [64 x double]*, [64 x double]** %25, align 8
  %284 = load i32, i32* %44, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [64 x double], [64 x double]* %283, i64 %285
  %287 = load i32, i32* %45, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds [64 x double], [64 x double]* %286, i64 0, i64 %288
  store double %282, double* %289, align 8
  br label %290

; <label>:290:                                    ; preds = %276, %267
  br label %291

; <label>:291:                                    ; preds = %290
  %292 = load i32, i32* %45, align 4
  %293 = add nsw i32 %292, 1
  store i32 %293, i32* %45, align 4
  br label %175

; <label>:294:                                    ; preds = %175
  br label %295

; <label>:295:                                    ; preds = %294
  %pgocount11 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 19)
  %296 = add i64 %pgocount11, 1
  store i64 %296, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 19)
  %297 = load i32, i32* %44, align 4
  %298 = add nsw i32 %297, 1
  store i32 %298, i32* %44, align 4
  br label %170

; <label>:299:                                    ; preds = %170
  store i32 0, i32* %48, align 4
  br label %300

; <label>:300:                                    ; preds = %392, %299
  %301 = load i32, i32* %48, align 4
  %302 = icmp slt i32 %301, 6
  br i1 %302, label %303, label %395

; <label>:303:                                    ; preds = %300
  %304 = load double*, double** %42, align 8
  %305 = getelementptr inbounds double, double* %304, i32 1
  store double* %305, double** %42, align 8
  %306 = load double, double* %304, align 8
  store double %306, double* %37, align 8
  %307 = load double*, double** %42, align 8
  %308 = getelementptr inbounds double, double* %307, i32 1
  store double* %308, double** %42, align 8
  %309 = load double, double* %307, align 8
  %310 = fptosi double %309 to i32
  store i32 %310, i32* %41, align 4
  %311 = load i32, i32* %41, align 4
  %312 = add nsw i32 %311, 1
  store i32 %312, i32* %41, align 4
  %313 = load double, double* %19, align 8
  %314 = load double, double* %37, align 8
  %315 = load i32, i32* %50, align 4
  %316 = sitofp i32 %315 to double
  %317 = fdiv double %314, %316
  %318 = fcmp oeq double %313, %317
  br i1 %318, label %319, label %384

; <label>:319:                                    ; preds = %303
  %320 = load i32, i32* %41, align 4
  store i32 %320, i32* %40, align 4
  store i32 0, i32* %44, align 4
  store i32 0, i32* %47, align 4
  br label %321

; <label>:321:                                    ; preds = %374, %319
  %322 = load i32, i32* %44, align 4
  %323 = load i32, i32* %41, align 4
  %324 = icmp slt i32 %322, %323
  br i1 %324, label %325, label %378

; <label>:325:                                    ; preds = %321
  %326 = load double*, double** %42, align 8
  %327 = getelementptr inbounds double, double* %326, i32 1
  store double* %327, double** %42, align 8
  %328 = load double, double* %326, align 8
  %329 = fptosi double %328 to i32
  store i32 %329, i32* %45, align 4
  %330 = load double*, double** %42, align 8
  %331 = getelementptr inbounds double, double* %330, i32 1
  store double* %331, double** %42, align 8
  %332 = load double, double* %330, align 8
  %333 = fptosi double %332 to i32
  %334 = load i32*, i32** %21, align 8
  %335 = load i32, i32* %44, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds i32, i32* %334, i64 %336
  store i32 %333, i32* %337, align 4
  %338 = load double*, double** %42, align 8
  %339 = getelementptr inbounds double, double* %338, i32 1
  store double* %339, double** %42, align 8
  %340 = load double, double* %338, align 8
  %341 = load double*, double** %27, align 8
  %342 = load i32, i32* %44, align 4
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds double, double* %341, i64 %343
  store double %340, double* %344, align 8
  %345 = load double*, double** %42, align 8
  %346 = getelementptr inbounds double, double* %345, i32 1
  store double* %346, double** %42, align 8
  %347 = load double*, double** %42, align 8
  %348 = getelementptr inbounds double, double* %347, i32 1
  store double* %348, double** %42, align 8
  %349 = load double, double* %347, align 8
  %350 = load double*, double** %28, align 8
  %351 = load i32, i32* %44, align 4
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds double, double* %350, i64 %352
  store double %349, double* %353, align 8
  %354 = load double*, double** %42, align 8
  %355 = getelementptr inbounds double, double* %354, i32 1
  store double* %355, double** %42, align 8
  %356 = load double, double* %354, align 8
  %357 = load i32, i32* %44, align 4
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %358
  store double %356, double* %359, align 8
  %360 = load i32, i32* %45, align 4
  %361 = load i32, i32* %44, align 4
  %362 = icmp ne i32 %360, %361
  br i1 %362, label %363, label %367

; <label>:363:                                    ; preds = %325
  %pgocount12 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 31)
  %364 = add i64 %pgocount12, 1
  store i64 %364, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 31)
  %365 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %366 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %365, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:367:                                    ; preds = %325
  %368 = load i32*, i32** %21, align 8
  %369 = load i32, i32* %44, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i32, i32* %368, i64 %370
  %372 = load i32, i32* %371, align 4
  %373 = add nsw i32 %372, -1
  store i32 %373, i32* %371, align 4
  br label %374

; <label>:374:                                    ; preds = %367
  %pgocount13 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 2)
  %375 = add i64 %pgocount13, 1
  store i64 %375, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 2)
  %376 = load i32, i32* %44, align 4
  %377 = add nsw i32 %376, 1
  store i32 %377, i32* %44, align 4
  br label %321

; <label>:378:                                    ; preds = %321
  %pgocount14 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 22)
  %379 = add i64 %pgocount14, 1
  store i64 %379, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 22)
  %380 = load i32*, i32** %21, align 8
  %381 = load i32, i32* %44, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i32, i32* %380, i64 %382
  store i32 -1, i32* %383, align 4
  br label %391

; <label>:384:                                    ; preds = %303
  %pgocount15 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 26)
  %385 = add i64 %pgocount15, 1
  store i64 %385, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 26)
  %386 = load i32, i32* %41, align 4
  %387 = mul nsw i32 %386, 6
  %388 = load double*, double** %42, align 8
  %389 = sext i32 %387 to i64
  %390 = getelementptr inbounds double, double* %388, i64 %389
  store double* %390, double** %42, align 8
  br label %391

; <label>:391:                                    ; preds = %384, %378
  br label %392

; <label>:392:                                    ; preds = %391
  %393 = load i32, i32* %48, align 4
  %394 = add nsw i32 %393, 1
  store i32 %394, i32* %48, align 4
  br label %300

; <label>:395:                                    ; preds = %300
  %396 = load i32, i32* %40, align 4
  store i32 %396, i32* %49, align 4
  store i32 0, i32* %44, align 4
  br label %397

; <label>:397:                                    ; preds = %523, %395
  %398 = load i32, i32* %44, align 4
  %399 = load i32, i32* %49, align 4
  %400 = icmp slt i32 %398, %399
  br i1 %400, label %401, label %526

; <label>:401:                                    ; preds = %397
  %pgocount16 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 20)
  %402 = add i64 %pgocount16, 1
  store i64 %402, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 20)
  store i32 0, i32* %45, align 4
  br label %403

; <label>:403:                                    ; preds = %519, %401
  %404 = load i32, i32* %45, align 4
  %405 = load i32, i32* %49, align 4
  %406 = icmp slt i32 %404, %405
  br i1 %406, label %407, label %522

; <label>:407:                                    ; preds = %403
  %408 = load i32, i32* %45, align 4
  %409 = load i32, i32* %44, align 4
  %410 = icmp sge i32 %408, %409
  br i1 %410, label %411, label %422

; <label>:411:                                    ; preds = %407
  %412 = load i32, i32* %44, align 4
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %413
  %415 = load double, double* %414, align 8
  %416 = load i32, i32* %45, align 4
  %417 = sext i32 %416 to i64
  %418 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %417
  %419 = load double, double* %418, align 8
  %420 = fsub double %415, %419
  %421 = fmul double %420, 3.000000e+00
  store double %421, double* %55, align 8
  br label %434

; <label>:422:                                    ; preds = %407
  %pgocount17 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 10)
  %423 = add i64 %pgocount17, 1
  store i64 %423, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 10)
  %424 = load i32, i32* %44, align 4
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %425
  %427 = load double, double* %426, align 8
  %428 = load i32, i32* %45, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %429
  %431 = load double, double* %430, align 8
  %432 = fsub double %427, %431
  %433 = fmul double %432, 1.500000e+00
  store double %433, double* %55, align 8
  br label %434

; <label>:434:                                    ; preds = %422, %411
  %435 = load i32, i32* %44, align 4
  %436 = load i32, i32* %45, align 4
  %437 = icmp sge i32 %435, %436
  br i1 %437, label %438, label %449

; <label>:438:                                    ; preds = %434
  %439 = load i32, i32* %44, align 4
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %440
  %442 = load double, double* %441, align 8
  %443 = load i32, i32* %45, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %444
  %446 = load double, double* %445, align 8
  %447 = fsub double %442, %446
  %448 = fmul double %447, 3.000000e+00
  store double %448, double* %55, align 8
  br label %461

; <label>:449:                                    ; preds = %434
  %pgocount18 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 11)
  %450 = add i64 %pgocount18, 1
  store i64 %450, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 11)
  %451 = load i32, i32* %44, align 4
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %452
  %454 = load double, double* %453, align 8
  %455 = load i32, i32* %45, align 4
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds [63 x double], [63 x double]* %39, i64 0, i64 %456
  %458 = load double, double* %457, align 8
  %459 = fsub double %454, %458
  %460 = fmul double %459, 1.500000e+00
  store double %460, double* %55, align 8
  br label %461

; <label>:461:                                    ; preds = %449, %438
  %462 = load double, double* %55, align 8
  %463 = fcmp oge double %462, 5.000000e-01
  br i1 %463, label %464, label %479

; <label>:464:                                    ; preds = %461
  %pgocount19 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 12)
  %465 = add i64 %pgocount19, 1
  store i64 %465, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 12)
  %466 = load double, double* %55, align 8
  %467 = fcmp ole double %466, 2.500000e+00
  br i1 %467, label %468, label %479

; <label>:468:                                    ; preds = %464
  %pgocount20 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 18)
  %469 = add i64 %pgocount20, 1
  store i64 %469, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 18)
  %470 = load double, double* %55, align 8
  %471 = fsub double %470, 5.000000e-01
  store double %471, double* %58, align 8
  %472 = load double, double* %58, align 8
  %473 = load double, double* %58, align 8
  %474 = fmul double %472, %473
  %475 = load double, double* %58, align 8
  %476 = fmul double 2.000000e+00, %475
  %477 = fsub double %474, %476
  %478 = fmul double 8.000000e+00, %477
  store double %478, double* %56, align 8
  br label %480

; <label>:479:                                    ; preds = %464, %461
  store double 0.000000e+00, double* %56, align 8
  br label %480

; <label>:480:                                    ; preds = %479, %468
  %481 = load double, double* %55, align 8
  %482 = fadd double %481, 4.740000e-01
  store double %482, double* %55, align 8
  %483 = load double, double* %55, align 8
  %484 = fmul double 7.500000e+00, %483
  %485 = fadd double 0x402F9F6E6106AB15, %484
  %486 = load double, double* %55, align 8
  %487 = load double, double* %55, align 8
  %488 = fmul double %486, %487
  %489 = fadd double 1.000000e+00, %488
  %490 = call double @sqrt(double %489) #6
  %491 = fmul double 1.750000e+01, %490
  %492 = fsub double %485, %491
  store double %492, double* %57, align 8
  %493 = load double, double* %57, align 8
  %494 = fcmp ole double %493, -6.000000e+01
  br i1 %494, label %495, label %504

; <label>:495:                                    ; preds = %480
  %pgocount21 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 13)
  %496 = add i64 %pgocount21, 1
  store i64 %496, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 13)
  %497 = load [64 x double]*, [64 x double]** %26, align 8
  %498 = load i32, i32* %44, align 4
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds [64 x double], [64 x double]* %497, i64 %499
  %501 = load i32, i32* %45, align 4
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds [64 x double], [64 x double]* %500, i64 0, i64 %502
  store double 0.000000e+00, double* %503, align 8
  br label %518

; <label>:504:                                    ; preds = %480
  %pgocount22 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 14)
  %505 = add i64 %pgocount22, 1
  store i64 %505, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 14)
  %506 = load double, double* %56, align 8
  %507 = load double, double* %57, align 8
  %508 = fadd double %506, %507
  %509 = fmul double %508, 0x3FCD791C5F888823
  %510 = call double @exp(double %509) #6
  %511 = load [64 x double]*, [64 x double]** %26, align 8
  %512 = load i32, i32* %44, align 4
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds [64 x double], [64 x double]* %511, i64 %513
  %515 = load i32, i32* %45, align 4
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds [64 x double], [64 x double]* %514, i64 0, i64 %516
  store double %510, double* %517, align 8
  br label %518

; <label>:518:                                    ; preds = %504, %495
  br label %519

; <label>:519:                                    ; preds = %518
  %520 = load i32, i32* %45, align 4
  %521 = add nsw i32 %520, 1
  store i32 %521, i32* %45, align 4
  br label %403

; <label>:522:                                    ; preds = %403
  br label %523

; <label>:523:                                    ; preds = %522
  %524 = load i32, i32* %44, align 4
  %525 = add nsw i32 %524, 1
  store i32 %525, i32* %44, align 4
  br label %397

; <label>:526:                                    ; preds = %397
  store i32 0, i32* %48, align 4
  br label %527

; <label>:527:                                    ; preds = %648, %526
  %528 = load i32, i32* %48, align 4
  %529 = icmp slt i32 %528, 6
  br i1 %529, label %530, label %651

; <label>:530:                                    ; preds = %527
  %531 = load double*, double** %42, align 8
  %532 = getelementptr inbounds double, double* %531, i32 1
  store double* %532, double** %42, align 8
  %533 = load double, double* %531, align 8
  store double %533, double* %37, align 8
  %534 = load double*, double** %42, align 8
  %535 = getelementptr inbounds double, double* %534, i32 1
  store double* %535, double** %42, align 8
  %536 = load double, double* %534, align 8
  %537 = fptosi double %536 to i32
  store i32 %537, i32* %43, align 4
  %538 = load i32, i32* %43, align 4
  %539 = add nsw i32 %538, 1
  store i32 %539, i32* %43, align 4
  %540 = load double, double* %19, align 8
  %541 = load double, double* %37, align 8
  %542 = load i32, i32* %50, align 4
  %543 = sitofp i32 %542 to double
  %544 = fdiv double %541, %543
  %545 = fcmp oeq double %540, %544
  br i1 %545, label %546, label %640

; <label>:546:                                    ; preds = %530
  store i32 0, i32* %44, align 4
  br label %547

; <label>:547:                                    ; preds = %634, %546
  %548 = load i32, i32* %44, align 4
  %549 = load i32, i32* %43, align 4
  %550 = icmp slt i32 %548, %549
  br i1 %550, label %551, label %638

; <label>:551:                                    ; preds = %547
  %552 = load double*, double** %42, align 8
  %553 = getelementptr inbounds double, double* %552, i32 1
  store double* %553, double** %42, align 8
  %554 = load double, double* %552, align 8
  %555 = fptosi double %554 to i32
  store i32 %555, i32* %45, align 4
  %556 = load double*, double** %42, align 8
  %557 = getelementptr inbounds double, double* %556, i32 1
  store double* %557, double** %42, align 8
  %558 = load double*, double** %42, align 8
  %559 = getelementptr inbounds double, double* %558, i32 1
  store double* %559, double** %42, align 8
  %560 = load double, double* %558, align 8
  %561 = fptosi double %560 to i32
  %562 = load i32*, i32** %29, align 8
  %563 = load i32, i32* %44, align 4
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds i32, i32* %562, i64 %564
  store i32 %561, i32* %565, align 4
  %566 = load double*, double** %42, align 8
  %567 = getelementptr inbounds double, double* %566, i32 1
  store double* %567, double** %42, align 8
  %568 = load double, double* %566, align 8
  %569 = fptosi double %568 to i32
  %570 = load i32*, i32** %30, align 8
  %571 = load i32, i32* %44, align 4
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds i32, i32* %570, i64 %572
  store i32 %569, i32* %573, align 4
  %574 = load double*, double** %42, align 8
  %575 = getelementptr inbounds double, double* %574, i32 1
  store double* %575, double** %42, align 8
  %576 = load double, double* %574, align 8
  %577 = load double*, double** %31, align 8
  %578 = load i32, i32* %44, align 4
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds double, double* %577, i64 %579
  store double %576, double* %580, align 8
  %581 = load double*, double** %42, align 8
  %582 = getelementptr inbounds double, double* %581, i32 1
  store double* %582, double** %42, align 8
  %583 = load double, double* %581, align 8
  %584 = load double*, double** %32, align 8
  %585 = load i32, i32* %44, align 4
  %586 = sext i32 %585 to i64
  %587 = getelementptr inbounds double, double* %584, i64 %586
  store double %583, double* %587, align 8
  %588 = load i32, i32* %45, align 4
  %589 = load i32, i32* %44, align 4
  %590 = icmp ne i32 %588, %589
  br i1 %590, label %591, label %595

; <label>:591:                                    ; preds = %551
  %pgocount23 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 32)
  %592 = add i64 %pgocount23, 1
  store i64 %592, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 32)
  %593 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %594 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %593, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:595:                                    ; preds = %551
  %596 = load i32, i32* %44, align 4
  %597 = icmp ne i32 %596, 0
  br i1 %597, label %598, label %633

; <label>:598:                                    ; preds = %595
  %599 = load double*, double** %31, align 8
  %600 = load i32, i32* %44, align 4
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds double, double* %599, i64 %601
  %603 = load double, double* %602, align 8
  %604 = fsub double 1.000000e+00, %603
  %605 = load double*, double** %32, align 8
  %606 = load i32, i32* %44, align 4
  %607 = sub nsw i32 %606, 1
  %608 = sext i32 %607 to i64
  %609 = getelementptr inbounds double, double* %605, i64 %608
  %610 = load double, double* %609, align 8
  %611 = fsub double %604, %610
  %612 = call double @fabs(double %611) #8
  %613 = fcmp ogt double %612, 1.000000e-02
  br i1 %613, label %614, label %631

; <label>:614:                                    ; preds = %598
  %pgocount24 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 34)
  %615 = add i64 %pgocount24, 1
  store i64 %615, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 34)
  %616 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %617 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %616, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i32 0, i32 0))
  %618 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %619 = load double*, double** %31, align 8
  %620 = load i32, i32* %44, align 4
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds double, double* %619, i64 %621
  %623 = load double, double* %622, align 8
  %624 = load double*, double** %32, align 8
  %625 = load i32, i32* %44, align 4
  %626 = sub nsw i32 %625, 1
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds double, double* %624, i64 %627
  %629 = load double, double* %628, align 8
  %630 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %618, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), double %623, double %629)
  call void @exit(i32 -1) #7
  unreachable

; <label>:631:                                    ; preds = %598
  %pgocount25 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 15)
  %632 = add i64 %pgocount25, 1
  store i64 %632, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 15)
  br label %633

; <label>:633:                                    ; preds = %631, %595
  br label %634

; <label>:634:                                    ; preds = %633
  %pgocount26 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 3)
  %635 = add i64 %pgocount26, 1
  store i64 %635, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 3)
  %636 = load i32, i32* %44, align 4
  %637 = add nsw i32 %636, 1
  store i32 %637, i32* %44, align 4
  br label %547

; <label>:638:                                    ; preds = %547
  %pgocount27 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 23)
  %639 = add i64 %pgocount27, 1
  store i64 %639, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 23)
  br label %647

; <label>:640:                                    ; preds = %530
  %pgocount28 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 27)
  %641 = add i64 %pgocount28, 1
  store i64 %641, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 27)
  %642 = load i32, i32* %43, align 4
  %643 = mul nsw i32 %642, 6
  %644 = load double*, double** %42, align 8
  %645 = sext i32 %643 to i64
  %646 = getelementptr inbounds double, double* %644, i64 %645
  store double* %646, double** %42, align 8
  br label %647

; <label>:647:                                    ; preds = %640, %638
  br label %648

; <label>:648:                                    ; preds = %647
  %649 = load i32, i32* %48, align 4
  %650 = add nsw i32 %649, 1
  store i32 %650, i32* %48, align 4
  br label %527

; <label>:651:                                    ; preds = %527
  store i32 0, i32* %48, align 4
  br label %652

; <label>:652:                                    ; preds = %773, %651
  %653 = load i32, i32* %48, align 4
  %654 = icmp slt i32 %653, 6
  br i1 %654, label %655, label %776

; <label>:655:                                    ; preds = %652
  %656 = load double*, double** %42, align 8
  %657 = getelementptr inbounds double, double* %656, i32 1
  store double* %657, double** %42, align 8
  %658 = load double, double* %656, align 8
  store double %658, double* %37, align 8
  %659 = load double*, double** %42, align 8
  %660 = getelementptr inbounds double, double* %659, i32 1
  store double* %660, double** %42, align 8
  %661 = load double, double* %659, align 8
  %662 = fptosi double %661 to i32
  store i32 %662, i32* %43, align 4
  %663 = load i32, i32* %43, align 4
  %664 = add nsw i32 %663, 1
  store i32 %664, i32* %43, align 4
  %665 = load double, double* %19, align 8
  %666 = load double, double* %37, align 8
  %667 = load i32, i32* %50, align 4
  %668 = sitofp i32 %667 to double
  %669 = fdiv double %666, %668
  %670 = fcmp oeq double %665, %669
  br i1 %670, label %671, label %765

; <label>:671:                                    ; preds = %655
  store i32 0, i32* %44, align 4
  br label %672

; <label>:672:                                    ; preds = %759, %671
  %673 = load i32, i32* %44, align 4
  %674 = load i32, i32* %43, align 4
  %675 = icmp slt i32 %673, %674
  br i1 %675, label %676, label %763

; <label>:676:                                    ; preds = %672
  %677 = load double*, double** %42, align 8
  %678 = getelementptr inbounds double, double* %677, i32 1
  store double* %678, double** %42, align 8
  %679 = load double, double* %677, align 8
  %680 = fptosi double %679 to i32
  store i32 %680, i32* %45, align 4
  %681 = load double*, double** %42, align 8
  %682 = getelementptr inbounds double, double* %681, i32 1
  store double* %682, double** %42, align 8
  %683 = load double*, double** %42, align 8
  %684 = getelementptr inbounds double, double* %683, i32 1
  store double* %684, double** %42, align 8
  %685 = load double, double* %683, align 8
  %686 = fptosi double %685 to i32
  %687 = load i32*, i32** %33, align 8
  %688 = load i32, i32* %44, align 4
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds i32, i32* %687, i64 %689
  store i32 %686, i32* %690, align 4
  %691 = load double*, double** %42, align 8
  %692 = getelementptr inbounds double, double* %691, i32 1
  store double* %692, double** %42, align 8
  %693 = load double, double* %691, align 8
  %694 = fptosi double %693 to i32
  %695 = load i32*, i32** %34, align 8
  %696 = load i32, i32* %44, align 4
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds i32, i32* %695, i64 %697
  store i32 %694, i32* %698, align 4
  %699 = load double*, double** %42, align 8
  %700 = getelementptr inbounds double, double* %699, i32 1
  store double* %700, double** %42, align 8
  %701 = load double, double* %699, align 8
  %702 = load double*, double** %35, align 8
  %703 = load i32, i32* %44, align 4
  %704 = sext i32 %703 to i64
  %705 = getelementptr inbounds double, double* %702, i64 %704
  store double %701, double* %705, align 8
  %706 = load double*, double** %42, align 8
  %707 = getelementptr inbounds double, double* %706, i32 1
  store double* %707, double** %42, align 8
  %708 = load double, double* %706, align 8
  %709 = load double*, double** %36, align 8
  %710 = load i32, i32* %44, align 4
  %711 = sext i32 %710 to i64
  %712 = getelementptr inbounds double, double* %709, i64 %711
  store double %708, double* %712, align 8
  %713 = load i32, i32* %45, align 4
  %714 = load i32, i32* %44, align 4
  %715 = icmp ne i32 %713, %714
  br i1 %715, label %716, label %720

; <label>:716:                                    ; preds = %676
  %pgocount29 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 33)
  %717 = add i64 %pgocount29, 1
  store i64 %717, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 33)
  %718 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %719 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %718, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:720:                                    ; preds = %676
  %721 = load i32, i32* %44, align 4
  %722 = icmp ne i32 %721, 0
  br i1 %722, label %723, label %758

; <label>:723:                                    ; preds = %720
  %724 = load double*, double** %35, align 8
  %725 = load i32, i32* %44, align 4
  %726 = sext i32 %725 to i64
  %727 = getelementptr inbounds double, double* %724, i64 %726
  %728 = load double, double* %727, align 8
  %729 = fsub double 1.000000e+00, %728
  %730 = load double*, double** %36, align 8
  %731 = load i32, i32* %44, align 4
  %732 = sub nsw i32 %731, 1
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds double, double* %730, i64 %733
  %735 = load double, double* %734, align 8
  %736 = fsub double %729, %735
  %737 = call double @fabs(double %736) #8
  %738 = fcmp ogt double %737, 1.000000e-02
  br i1 %738, label %739, label %756

; <label>:739:                                    ; preds = %723
  %pgocount30 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 35)
  %740 = add i64 %pgocount30, 1
  store i64 %740, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 35)
  %741 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %742 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %741, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.7, i32 0, i32 0))
  %743 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %744 = load double*, double** %35, align 8
  %745 = load i32, i32* %44, align 4
  %746 = sext i32 %745 to i64
  %747 = getelementptr inbounds double, double* %744, i64 %746
  %748 = load double, double* %747, align 8
  %749 = load double*, double** %36, align 8
  %750 = load i32, i32* %44, align 4
  %751 = sub nsw i32 %750, 1
  %752 = sext i32 %751 to i64
  %753 = getelementptr inbounds double, double* %749, i64 %752
  %754 = load double, double* %753, align 8
  %755 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %743, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), double %748, double %754)
  call void @exit(i32 -1) #7
  unreachable

; <label>:756:                                    ; preds = %723
  %pgocount31 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 16)
  %757 = add i64 %pgocount31, 1
  store i64 %757, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 16)
  br label %758

; <label>:758:                                    ; preds = %756, %720
  br label %759

; <label>:759:                                    ; preds = %758
  %pgocount32 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 4)
  %760 = add i64 %pgocount32, 1
  store i64 %760, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 4)
  %761 = load i32, i32* %44, align 4
  %762 = add nsw i32 %761, 1
  store i32 %762, i32* %44, align 4
  br label %672

; <label>:763:                                    ; preds = %672
  %pgocount33 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 24)
  %764 = add i64 %pgocount33, 1
  store i64 %764, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 24)
  br label %772

; <label>:765:                                    ; preds = %655
  %pgocount34 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 28)
  %766 = add i64 %pgocount34, 1
  store i64 %766, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 28)
  %767 = load i32, i32* %43, align 4
  %768 = mul nsw i32 %767, 6
  %769 = load double*, double** %42, align 8
  %770 = sext i32 %768 to i64
  %771 = getelementptr inbounds double, double* %769, i64 %770
  store double* %771, double** %42, align 8
  br label %772

; <label>:772:                                    ; preds = %765, %763
  br label %773

; <label>:773:                                    ; preds = %772
  %774 = load i32, i32* %48, align 4
  %775 = add nsw i32 %774, 1
  store i32 %775, i32* %48, align 4
  br label %652

; <label>:776:                                    ; preds = %652
  %pgocount35 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 29)
  %777 = add i64 %pgocount35, 1
  store i64 %777, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_L3para_read, i64 0, i64 29)
  ret void
}

; Function Attrs: nounwind
declare double @exp(double) #4

declare void @init_fft() #1

declare void @fft_long(float*, i32, i16**) #1

declare void @fft_short([256 x float]*, i32, i16**) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind readnone
declare double @fabs(double) #5

; Function Attrs: nounwind
declare double @log(double) #4

; Function Attrs: nounwind
declare double @log10(double) #4

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
