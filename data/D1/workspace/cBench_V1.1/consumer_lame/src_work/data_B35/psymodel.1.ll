; ModuleID = 'psymodel.ll'
source_filename = "psymodel.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }

@L3psycho_anal.minval = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.qthr_l = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.qthr_s = internal global [63 x double] zeroinitializer, align 16
@L3psycho_anal.nb_1 = internal unnamed_addr global [4 x [63 x double]] zeroinitializer, align 16
@L3psycho_anal.nb_2 = internal unnamed_addr global [4 x [63 x double]] zeroinitializer, align 16
@L3psycho_anal.s3_s = internal global [64 x [64 x double]] zeroinitializer, align 16
@L3psycho_anal.s3_l = internal global [64 x [64 x double]] zeroinitializer, align 16
@L3psycho_anal.thm = internal unnamed_addr global [4 x %struct.III_psy_xmin] zeroinitializer, align 16
@L3psycho_anal.en = internal unnamed_addr global [4 x %struct.III_psy_xmin] zeroinitializer, align 16
@L3psycho_anal.cw_upper_index = internal unnamed_addr global i32 0, align 4
@L3psycho_anal.cw_lower_index = internal unnamed_addr global i1 false, align 4
@L3psycho_anal.ax_sav = internal unnamed_addr global [4 x [2 x [513 x float]]] zeroinitializer, align 16
@L3psycho_anal.bx_sav = internal unnamed_addr global [4 x [2 x [513 x float]]] zeroinitializer, align 16
@L3psycho_anal.rx_sav = internal unnamed_addr global [4 x [2 x [513 x float]]] zeroinitializer, align 16
@L3psycho_anal.cw = internal unnamed_addr global [513 x float] zeroinitializer, align 16
@L3psycho_anal.wsamp_L = internal global [2 x [1024 x float]] zeroinitializer, align 16
@L3psycho_anal.energy = internal unnamed_addr global [513 x float] zeroinitializer, align 16
@L3psycho_anal.wsamp_S = internal global [2 x [3 x [256 x float]]] zeroinitializer, align 16
@L3psycho_anal.energy_s = internal unnamed_addr global [3 x [129 x float]] zeroinitializer, align 16
@L3psycho_anal.eb = internal unnamed_addr global [63 x double] zeroinitializer, align 16
@L3psycho_anal.cb = internal unnamed_addr global [63 x double] zeroinitializer, align 16
@L3psycho_anal.thr = internal unnamed_addr global [63 x double] zeroinitializer, align 16
@L3psycho_anal.w1_l = internal global [21 x double] zeroinitializer, align 16
@L3psycho_anal.w2_l = internal global [21 x double] zeroinitializer, align 16
@L3psycho_anal.w1_s = internal global [12 x double] zeroinitializer, align 16
@L3psycho_anal.w2_s = internal global [12 x double] zeroinitializer, align 16
@L3psycho_anal.mld_l = internal unnamed_addr global [21 x double] zeroinitializer, align 16
@L3psycho_anal.mld_s = internal unnamed_addr global [12 x double] zeroinitializer, align 16
@L3psycho_anal.bu_l = internal global [21 x i32] zeroinitializer, align 16
@L3psycho_anal.bo_l = internal global [21 x i32] zeroinitializer, align 16
@L3psycho_anal.bu_s = internal global [12 x i32] zeroinitializer, align 16
@L3psycho_anal.bo_s = internal global [12 x i32] zeroinitializer, align 16
@L3psycho_anal.npart_l = internal unnamed_addr global i32 0, align 4
@L3psycho_anal.npart_s = internal unnamed_addr global i32 0, align 4
@L3psycho_anal.npart_l_orig = internal unnamed_addr global i32 0, align 4
@L3psycho_anal.npart_s_orig = internal unnamed_addr global i32 0, align 4
@L3psycho_anal.s3ind = internal unnamed_addr global [63 x [2 x i32]] zeroinitializer, align 16
@L3psycho_anal.s3ind_s = internal unnamed_addr global [63 x [2 x i32]] zeroinitializer, align 16
@L3psycho_anal.numlines_s = internal global [63 x i32] zeroinitializer, align 16
@L3psycho_anal.numlines_l = internal global [63 x i32] zeroinitializer, align 16
@L3psycho_anal.partition_l = internal global [513 x i32] zeroinitializer, align 16
@L3psycho_anal.pe = internal unnamed_addr global [4 x double] zeroinitializer, align 16
@L3psycho_anal.ms_ratio_s_old = internal unnamed_addr global double 0.000000e+00, align 8
@L3psycho_anal.ms_ratio_l_old = internal unnamed_addr global double 0.000000e+00, align 8
@L3psycho_anal.ms_ener_ratio_old = internal unnamed_addr global double 2.500000e-01, align 8
@L3psycho_anal.blocktype_old = internal unnamed_addr global [2 x i32] zeroinitializer, align 4
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [42 x i8] c"error, invalid sampling frequency: %d Hz\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Error in block selecting\0A\00", align 1
@psy_data = external global [0 x double], align 8
@.str.2 = private unnamed_addr constant [27 x i8] c"1. please check \22psy_data\22\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"3. please check \22psy_data\22\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"30:please check \22psy_data\22\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"31l: please check \22psy_data.\22\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"w1,w2: %f %f \0A\00", align 1
@.str.7 = private unnamed_addr constant [31 x i8] c"31s: please check \22psy_data.\22\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @L3psycho_anal(%struct.lame_global_flags* nocapture readonly, i16**, i32, double* nocapture, double* nocapture, double* nocapture, [2 x %struct.III_psy_ratio]* nocapture, [2 x %struct.III_psy_ratio]* nocapture, double* nocapture, double* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %12 = alloca [4 x float], align 16
  %13 = alloca [2 x i32], align 4
  %14 = bitcast [2 x i32]* %13 to i8*
  %15 = alloca [2 x i32], align 4
  %16 = alloca [63 x double], align 16
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %18 = load i64, i64* %17, align 8
  %19 = icmp eq i64 %18, 0
  %20 = icmp eq i32 %2, 0
  %or.cond = and i1 %20, %19
  br i1 %or.cond, label %21, label %327

; <label>:21:                                     ; preds = %11
  store i32 3, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 0), align 4
  store i32 3, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 1), align 4
  %22 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %23 = load i32, i32* %22, align 8
  switch i32 %23, label %24 [
    i32 32000, label %27
    i32 44100, label %27
    i32 48000, label %27
    i32 16000, label %27
    i32 22050, label %27
    i32 24000, label %27
  ]

; <label>:24:                                     ; preds = %21
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i64 0, i64 0), i32 %23) #7
  tail call void @exit(i32 -1) #8
  unreachable

; <label>:27:                                     ; preds = %21, %21, %21, %21, %21, %21
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav to i8*), i8 0, i64 16416, i32 16, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav to i8*), i8 0, i64 16416, i32 16, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav to i8*), i8 0, i64 16416, i32 16, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x %struct.III_psy_xmin]* @L3psycho_anal.en to i8*), i8 0, i64 1952, i32 16, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x %struct.III_psy_xmin]* @L3psycho_anal.thm to i8*), i8 0, i64 1952, i32 16, i1 false)
  store i1 true, i1* @L3psycho_anal.cw_lower_index, align 4
  %28 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 35
  %29 = load float, float* %28, align 8
  %30 = fcmp ogt float %29, 0.000000e+00
  %31 = fpext float %29 to double
  %.op = fmul double %31, 1.000000e+03
  %.op.op = fmul double %.op, 1.024000e+03
  %32 = select i1 %30, double %.op.op, double 0x416153D9A3000000
  %33 = load i32, i32* %22, align 8
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %32, %34
  %36 = fptosi double %35 to i32
  %37 = icmp slt i32 %36, 509
  %38 = select i1 %37, i32 %36, i32 509
  %39 = icmp sgt i32 %38, 6
  %40 = select i1 %39, i32 %38, i32 6
  store i32 %40, i32* @L3psycho_anal.cw_upper_index, align 4
  br label %41

; <label>:41:                                     ; preds = %41, %27
  %indvars.iv521 = phi i64 [ 0, %27 ], [ %indvars.iv.next522.8, %41 ]
  %42 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv521
  store float 0x3FD99999A0000000, float* %42, align 4
  %indvars.iv.next522 = add nuw nsw i64 %indvars.iv521, 1
  %43 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522
  store float 0x3FD99999A0000000, float* %43, align 4
  %indvars.iv.next522.1 = add nsw i64 %indvars.iv521, 2
  %44 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522.1
  store float 0x3FD99999A0000000, float* %44, align 4
  %indvars.iv.next522.2 = add nsw i64 %indvars.iv521, 3
  %45 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522.2
  store float 0x3FD99999A0000000, float* %45, align 4
  %indvars.iv.next522.3 = add nsw i64 %indvars.iv521, 4
  %46 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522.3
  store float 0x3FD99999A0000000, float* %46, align 4
  %indvars.iv.next522.4 = add nsw i64 %indvars.iv521, 5
  %47 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522.4
  store float 0x3FD99999A0000000, float* %47, align 4
  %indvars.iv.next522.5 = add nsw i64 %indvars.iv521, 6
  %48 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522.5
  store float 0x3FD99999A0000000, float* %48, align 4
  %indvars.iv.next522.6 = add nsw i64 %indvars.iv521, 7
  %49 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522.6
  store float 0x3FD99999A0000000, float* %49, align 4
  %indvars.iv.next522.7 = add nsw i64 %indvars.iv521, 8
  %50 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next522.7
  store float 0x3FD99999A0000000, float* %50, align 4
  %indvars.iv.next522.8 = add nsw i64 %indvars.iv521, 9
  %exitcond523.8 = icmp eq i64 %indvars.iv.next522.8, 513
  br i1 %exitcond523.8, label %.preheader164.preheader, label %41

.preheader164.preheader:                          ; preds = %41
  br label %.preheader164

.preheader164:                                    ; preds = %.preheader164.preheader, %.preheader164
  %indvars.iv518 = phi i64 [ %indvars.iv.next519.1, %.preheader164 ], [ 0, %.preheader164.preheader ]
  %51 = trunc i64 %indvars.iv518 to i32
  %52 = sitofp i32 %51 to double
  %53 = fmul double %52, 0x400921FB54442D18
  %54 = fdiv double %53, 1.200000e+01
  %55 = tail call double @cos(double %54) #6
  %56 = fsub double 1.000000e+00, %55
  %57 = fmul double %56, 1.250000e+00
  %58 = fadd double %57, -2.500000e+00
  %59 = tail call double @pow(double 1.000000e+01, double %58) #6
  %60 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.mld_s, i64 0, i64 %indvars.iv518
  store double %59, double* %60, align 16
  %indvars.iv.next519 = or i64 %indvars.iv518, 1
  %61 = trunc i64 %indvars.iv.next519 to i32
  %62 = sitofp i32 %61 to double
  %63 = fmul double %62, 0x400921FB54442D18
  %64 = fdiv double %63, 1.200000e+01
  %65 = tail call double @cos(double %64) #6
  %66 = fsub double 1.000000e+00, %65
  %67 = fmul double %66, 1.250000e+00
  %68 = fadd double %67, -2.500000e+00
  %69 = tail call double @pow(double 1.000000e+01, double %68) #6
  %70 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.mld_s, i64 0, i64 %indvars.iv.next519
  store double %69, double* %70, align 8
  %indvars.iv.next519.1 = add nsw i64 %indvars.iv518, 2
  %exitcond520.1 = icmp eq i64 %indvars.iv.next519.1, 12
  br i1 %exitcond520.1, label %.preheader163.preheader, label %.preheader164

.preheader163.preheader:                          ; preds = %.preheader164
  store double 0x3F69E7C6E43390B7, double* getelementptr inbounds ([21 x double], [21 x double]* @L3psycho_anal.mld_l, i64 0, i64 0), align 16
  br label %.preheader163.1

; <label>:71:                                     ; preds = %.preheader163.1
  call void @llvm.memset.p0i8.i64(i8* bitcast ([513 x i32]* @L3psycho_anal.partition_l to i8*), i8 -1, i64 2052, i32 16, i1 false)
  %72 = load i32, i32* %22, align 8
  %73 = sitofp i32 %72 to double
  %74 = getelementptr inbounds [63 x double], [63 x double]* %16, i64 0, i64 0
  call void @L3para_read(double %73, i32* getelementptr inbounds ([63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i64 0, i64 0), i32* getelementptr inbounds ([63 x i32], [63 x i32]* @L3psycho_anal.numlines_s, i64 0, i64 0), i32* getelementptr inbounds ([513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i64 0, i64 0), double* getelementptr inbounds ([63 x double], [63 x double]* @L3psycho_anal.minval, i64 0, i64 0), double* getelementptr inbounds ([63 x double], [63 x double]* @L3psycho_anal.qthr_l, i64 0, i64 0), [64 x double]* getelementptr inbounds ([64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 0), [64 x double]* getelementptr inbounds ([64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 0), double* getelementptr inbounds ([63 x double], [63 x double]* @L3psycho_anal.qthr_s, i64 0, i64 0), double* nonnull %74, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bu_l, i64 0, i64 0), i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 0), double* getelementptr inbounds ([21 x double], [21 x double]* @L3psycho_anal.w1_l, i64 0, i64 0), double* getelementptr inbounds ([21 x double], [21 x double]* @L3psycho_anal.w2_l, i64 0, i64 0), i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bu_s, i64 0, i64 0), i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 0), double* getelementptr inbounds ([12 x double], [12 x double]* @L3psycho_anal.w1_s, i64 0, i64 0), double* getelementptr inbounds ([12 x double], [12 x double]* @L3psycho_anal.w2_s, i64 0, i64 0))
  store i32 0, i32* @L3psycho_anal.npart_l_orig, align 4
  store i32 0, i32* @L3psycho_anal.npart_s_orig, align 4
  br label %75

; <label>:75:                                     ; preds = %1517, %71
  %indvars.iv509 = phi i64 [ 0, %71 ], [ %indvars.iv.next510.2, %1517 ]
  %76 = getelementptr inbounds [513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i64 0, i64 %indvars.iv509
  %77 = load i32, i32* %76, align 4
  %78 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %79 = icmp sgt i32 %77, %78
  br i1 %79, label %80, label %81

; <label>:80:                                     ; preds = %75
  store i32 %77, i32* @L3psycho_anal.npart_l_orig, align 4
  br label %81

; <label>:81:                                     ; preds = %75, %80
  %indvars.iv.next510 = add nuw nsw i64 %indvars.iv509, 1
  %82 = getelementptr inbounds [513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i64 0, i64 %indvars.iv.next510
  %83 = load i32, i32* %82, align 4
  %84 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %85 = icmp sgt i32 %83, %84
  br i1 %85, label %1510, label %1511

; <label>:86:                                     ; preds = %1517
  %87 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* @L3psycho_anal.npart_l_orig, align 4
  br label %89

; <label>:89:                                     ; preds = %89, %86
  %indvars.iv507 = phi i64 [ %indvars.iv.next508, %89 ], [ 0, %86 ]
  %90 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_s, i64 0, i64 %indvars.iv507
  %91 = load i32, i32* %90, align 4
  %92 = icmp sgt i32 %91, -1
  %indvars.iv.next508 = add nuw i64 %indvars.iv507, 1
  br i1 %92, label %89, label %93

; <label>:93:                                     ; preds = %89
  %94 = trunc i64 %indvars.iv507 to i32
  store i32 %94, i32* @L3psycho_anal.npart_s_orig, align 4
  %95 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 20), align 16
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* @L3psycho_anal.npart_l, align 4
  %97 = load i32, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 11), align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* @L3psycho_anal.npart_s, align 4
  %99 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %100 = icmp slt i32 %95, %99
  br i1 %100, label %103, label %101

; <label>:101:                                    ; preds = %93
  %102 = add nsw i32 %99, -1
  store i32 %99, i32* @L3psycho_anal.npart_l, align 4
  store i32 %102, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 20), align 16
  store double 1.000000e+00, double* getelementptr inbounds ([21 x double], [21 x double]* @L3psycho_anal.w2_l, i64 0, i64 20), align 16
  br label %103

; <label>:103:                                    ; preds = %93, %101
  %104 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %105 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  %106 = icmp sgt i32 %104, %105
  br i1 %106, label %107, label %.preheader161

; <label>:107:                                    ; preds = %103
  %108 = add nsw i32 %105, -1
  store i32 %105, i32* @L3psycho_anal.npart_s, align 4
  store i32 %108, i32* getelementptr inbounds ([12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 11), align 4
  store double 1.000000e+00, double* getelementptr inbounds ([12 x double], [12 x double]* @L3psycho_anal.w2_s, i64 0, i64 11), align 8
  br label %.preheader161

.preheader161:                                    ; preds = %107, %103
  %109 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %.preheader160.lr.ph, label %.preheader159

.preheader160.lr.ph:                              ; preds = %.preheader161
  %111 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %112 = icmp sgt i32 %111, 0
  %113 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %114 = sext i32 %111 to i64
  %115 = sext i32 %113 to i64
  br i1 %112, label %.preheader160.us.preheader, label %.preheader160.preheader

.preheader160.preheader:                          ; preds = %.preheader160.lr.ph
  br label %.preheader160

.preheader160.us.preheader:                       ; preds = %.preheader160.lr.ph
  br label %.preheader160.us

.preheader160.us:                                 ; preds = %.preheader160.us.preheader, %131
  %indvars.iv501 = phi i64 [ %indvars.iv.next502, %131 ], [ 0, %.preheader160.us.preheader ]
  br label %116

; <label>:116:                                    ; preds = %.preheader160.us, %121
  %indvars.iv497 = phi i64 [ 0, %.preheader160.us ], [ %indvars.iv.next498, %121 ]
  %.127325.us = phi i32 [ 0, %.preheader160.us ], [ %122, %121 ]
  %117 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv501, i64 %indvars.iv497
  %118 = load double, double* %117, align 8
  %119 = fcmp une double %118, 0.000000e+00
  %120 = trunc i64 %indvars.iv497 to i32
  br i1 %119, label %._crit_edge327.us, label %121

; <label>:121:                                    ; preds = %116
  %indvars.iv.next498 = add nuw nsw i64 %indvars.iv497, 1
  %122 = add nuw nsw i32 %.127325.us, 1
  %123 = icmp slt i64 %indvars.iv.next498, %114
  br i1 %123, label %116, label %._crit_edge327.us

._crit_edge327.us:                                ; preds = %121, %116
  %.127.lcssa.us = phi i32 [ %120, %116 ], [ %122, %121 ]
  %124 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv501, i64 0
  store i32 %.127.lcssa.us, i32* %124, align 8
  br label %125

; <label>:125:                                    ; preds = %127, %._crit_edge327.us
  %indvars.iv499 = phi i64 [ %indvars.iv.next500, %127 ], [ %114, %._crit_edge327.us ]
  %indvars.iv.next500 = add nsw i64 %indvars.iv499, -1
  %126 = icmp sgt i64 %indvars.iv499, 1
  br i1 %126, label %127, label %131

; <label>:127:                                    ; preds = %125
  %128 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv501, i64 %indvars.iv.next500
  %129 = load double, double* %128, align 8
  %130 = fcmp une double %129, 0.000000e+00
  br i1 %130, label %131, label %125

; <label>:131:                                    ; preds = %127, %125
  %132 = trunc i64 %indvars.iv.next500 to i32
  %133 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv501, i64 1
  store i32 %132, i32* %133, align 4
  %indvars.iv.next502 = add nuw nsw i64 %indvars.iv501, 1
  %134 = icmp slt i64 %indvars.iv.next502, %115
  br i1 %134, label %.preheader160.us, label %.preheader159.loopexit

.preheader160:                                    ; preds = %.preheader160.preheader, %168
  %indvars.iv505 = phi i64 [ %indvars.iv.next506, %168 ], [ 0, %.preheader160.preheader ]
  %135 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv505, i64 0
  store i32 0, i32* %135, align 8
  br label %162

.preheader159.loopexit:                           ; preds = %131
  br label %.preheader159

.preheader159.loopexit727:                        ; preds = %168
  br label %.preheader159

.preheader159:                                    ; preds = %.preheader159.loopexit727, %.preheader159.loopexit, %.preheader161
  %136 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %137 = icmp sgt i32 %136, 0
  br i1 %137, label %.preheader158.lr.ph, label %.preheader157

.preheader158.lr.ph:                              ; preds = %.preheader159
  %138 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  %139 = icmp sgt i32 %138, 0
  %140 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %141 = sext i32 %138 to i64
  %142 = sext i32 %140 to i64
  br i1 %139, label %.preheader158.us.preheader, label %.preheader158.preheader

.preheader158.preheader:                          ; preds = %.preheader158.lr.ph
  br label %.preheader158

.preheader158.us.preheader:                       ; preds = %.preheader158.lr.ph
  br label %.preheader158.us

.preheader158.us:                                 ; preds = %.preheader158.us.preheader, %158
  %indvars.iv491 = phi i64 [ %indvars.iv.next492, %158 ], [ 0, %.preheader158.us.preheader ]
  br label %143

; <label>:143:                                    ; preds = %.preheader158.us, %148
  %indvars.iv487 = phi i64 [ 0, %.preheader158.us ], [ %indvars.iv.next488, %148 ]
  %.329318.us = phi i32 [ 0, %.preheader158.us ], [ %149, %148 ]
  %144 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv491, i64 %indvars.iv487
  %145 = load double, double* %144, align 8
  %146 = fcmp une double %145, 0.000000e+00
  %147 = trunc i64 %indvars.iv487 to i32
  br i1 %146, label %._crit_edge320.us, label %148

; <label>:148:                                    ; preds = %143
  %indvars.iv.next488 = add nuw nsw i64 %indvars.iv487, 1
  %149 = add nuw nsw i32 %.329318.us, 1
  %150 = icmp slt i64 %indvars.iv.next488, %141
  br i1 %150, label %143, label %._crit_edge320.us

._crit_edge320.us:                                ; preds = %148, %143
  %.329.lcssa.us = phi i32 [ %147, %143 ], [ %149, %148 ]
  %151 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv491, i64 0
  store i32 %.329.lcssa.us, i32* %151, align 8
  br label %152

; <label>:152:                                    ; preds = %154, %._crit_edge320.us
  %indvars.iv489 = phi i64 [ %indvars.iv.next490, %154 ], [ %141, %._crit_edge320.us ]
  %indvars.iv.next490 = add nsw i64 %indvars.iv489, -1
  %153 = icmp sgt i64 %indvars.iv489, 1
  br i1 %153, label %154, label %158

; <label>:154:                                    ; preds = %152
  %155 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv491, i64 %indvars.iv.next490
  %156 = load double, double* %155, align 8
  %157 = fcmp une double %156, 0.000000e+00
  br i1 %157, label %158, label %152

; <label>:158:                                    ; preds = %154, %152
  %159 = trunc i64 %indvars.iv.next490 to i32
  %160 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv491, i64 1
  store i32 %159, i32* %160, align 4
  %indvars.iv.next492 = add nuw nsw i64 %indvars.iv491, 1
  %161 = icmp slt i64 %indvars.iv.next492, %142
  br i1 %161, label %.preheader158.us, label %.preheader157.loopexit

; <label>:162:                                    ; preds = %164, %.preheader160
  %indvars.iv503 = phi i64 [ %indvars.iv.next504, %164 ], [ %114, %.preheader160 ]
  %indvars.iv.next504 = add nsw i64 %indvars.iv503, -1
  %163 = icmp sgt i64 %indvars.iv503, 1
  br i1 %163, label %164, label %168

; <label>:164:                                    ; preds = %162
  %165 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv505, i64 %indvars.iv.next504
  %166 = load double, double* %165, align 8
  %167 = fcmp une double %166, 0.000000e+00
  br i1 %167, label %168, label %162

; <label>:168:                                    ; preds = %164, %162
  %169 = trunc i64 %indvars.iv.next504 to i32
  %170 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv505, i64 1
  store i32 %169, i32* %170, align 4
  %indvars.iv.next506 = add nuw nsw i64 %indvars.iv505, 1
  %171 = icmp slt i64 %indvars.iv.next506, %115
  br i1 %171, label %.preheader160, label %.preheader159.loopexit727

.preheader158:                                    ; preds = %.preheader158.preheader, %183
  %indvars.iv495 = phi i64 [ %indvars.iv.next496, %183 ], [ 0, %.preheader158.preheader ]
  %172 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv495, i64 0
  store i32 0, i32* %172, align 8
  br label %177

.preheader157.loopexit:                           ; preds = %158
  br label %.preheader157

.preheader157.loopexit726:                        ; preds = %183
  br label %.preheader157

.preheader157:                                    ; preds = %.preheader157.loopexit726, %.preheader157.loopexit, %.preheader159
  %173 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %174 = icmp sgt i32 %173, 0
  br i1 %174, label %.lr.ph316, label %._crit_edge317

.lr.ph316:                                        ; preds = %.preheader157
  %175 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %176 = sext i32 %175 to i64
  br label %187

; <label>:177:                                    ; preds = %179, %.preheader158
  %indvars.iv493 = phi i64 [ %indvars.iv.next494, %179 ], [ %141, %.preheader158 ]
  %indvars.iv.next494 = add nsw i64 %indvars.iv493, -1
  %178 = icmp sgt i64 %indvars.iv493, 1
  br i1 %178, label %179, label %183

; <label>:179:                                    ; preds = %177
  %180 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv495, i64 %indvars.iv.next494
  %181 = load double, double* %180, align 8
  %182 = fcmp une double %181, 0.000000e+00
  br i1 %182, label %183, label %177

; <label>:183:                                    ; preds = %179, %177
  %184 = trunc i64 %indvars.iv.next494 to i32
  %185 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv495, i64 1
  store i32 %184, i32* %185, align 4
  %indvars.iv.next496 = add nuw nsw i64 %indvars.iv495, 1
  %186 = icmp slt i64 %indvars.iv.next496, %142
  br i1 %186, label %.preheader158, label %.preheader157.loopexit726

; <label>:187:                                    ; preds = %.lr.ph316, %._crit_edge314
  %indvars.iv485 = phi i64 [ 0, %.lr.ph316 ], [ %indvars.iv.next486, %._crit_edge314 ]
  %188 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv485, i64 0
  %189 = load i32, i32* %188, align 8
  %190 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv485, i64 1
  %191 = load i32, i32* %190, align 4
  %192 = icmp sgt i32 %189, %191
  br i1 %192, label %._crit_edge308, label %.lr.ph307

.lr.ph307:                                        ; preds = %187
  %193 = load i32, i32* %190, align 4
  %194 = sext i32 %189 to i64
  %195 = sext i32 %193 to i64
  br label %196

; <label>:196:                                    ; preds = %196, %.lr.ph307
  %indvars.iv481 = phi i64 [ %indvars.iv.next482, %196 ], [ %194, %.lr.ph307 ]
  %.060304 = phi double [ %199, %196 ], [ 0.000000e+00, %.lr.ph307 ]
  %197 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv485, i64 %indvars.iv481
  %198 = load double, double* %197, align 8
  %199 = fadd double %.060304, %198
  %indvars.iv.next482 = add nsw i64 %indvars.iv481, 1
  %200 = icmp slt i64 %indvars.iv481, %195
  br i1 %200, label %196, label %._crit_edge308.loopexit

._crit_edge308.loopexit:                          ; preds = %196
  br label %._crit_edge308

._crit_edge308:                                   ; preds = %._crit_edge308.loopexit, %187
  %.060.lcssa = phi double [ 0.000000e+00, %187 ], [ %199, %._crit_edge308.loopexit ]
  %201 = load i32, i32* %188, align 8
  %202 = load i32, i32* %190, align 4
  %203 = icmp sgt i32 %201, %202
  br i1 %203, label %._crit_edge314, label %.lr.ph313

.lr.ph313:                                        ; preds = %._crit_edge308
  %204 = fdiv double 0x3FD0137987DD704C, %.060.lcssa
  %205 = sext i32 %201 to i64
  %206 = load i32, i32* %190, align 4
  %207 = sext i32 %206 to i64
  %208 = sext i32 %206 to i64
  %209 = icmp sgt i64 %205, %208
  %smax607 = select i1 %209, i64 %205, i64 %208
  %210 = add nsw i64 %smax607, 1
  %211 = sub nsw i64 %210, %205
  %min.iters.check = icmp ult i64 %211, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph313
  %n.vec = and i64 %211, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %205, %n.vec
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert610 = insertelement <2 x double> undef, double %204, i32 0
  %broadcast.splat611 = shufflevector <2 x double> %broadcast.splatinsert610, <2 x double> undef, <2 x i32> zeroinitializer
  %212 = add nsw i64 %n.vec, -4
  %213 = lshr exact i64 %212, 2
  %214 = and i64 %213, 1
  %lcmp.mod761 = icmp eq i64 %214, 0
  br i1 %lcmp.mod761, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %215 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv485, i64 %205
  %216 = bitcast double* %215 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %216, align 8
  %217 = getelementptr double, double* %215, i64 2
  %218 = bitcast double* %217 to <2 x double>*
  %wide.load609.prol = load <2 x double>, <2 x double>* %218, align 8
  %219 = fmul <2 x double> %broadcast.splat611, %wide.load.prol
  %220 = fmul <2 x double> %broadcast.splat611, %wide.load609.prol
  %221 = bitcast double* %215 to <2 x double>*
  store <2 x double> %219, <2 x double>* %221, align 8
  %222 = bitcast double* %217 to <2 x double>*
  store <2 x double> %220, <2 x double>* %222, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %223 = icmp eq i64 %213, 0
  br i1 %223, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %224 = add i64 %205, %index
  %225 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv485, i64 %224
  %226 = bitcast double* %225 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %226, align 8
  %227 = getelementptr double, double* %225, i64 2
  %228 = bitcast double* %227 to <2 x double>*
  %wide.load609 = load <2 x double>, <2 x double>* %228, align 8
  %229 = fmul <2 x double> %broadcast.splat611, %wide.load
  %230 = fmul <2 x double> %broadcast.splat611, %wide.load609
  %231 = bitcast double* %225 to <2 x double>*
  store <2 x double> %229, <2 x double>* %231, align 8
  %232 = bitcast double* %227 to <2 x double>*
  store <2 x double> %230, <2 x double>* %232, align 8
  %index.next = add i64 %index, 4
  %233 = add i64 %205, %index.next
  %234 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv485, i64 %233
  %235 = bitcast double* %234 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %235, align 8
  %236 = getelementptr double, double* %234, i64 2
  %237 = bitcast double* %236 to <2 x double>*
  %wide.load609.1 = load <2 x double>, <2 x double>* %237, align 8
  %238 = fmul <2 x double> %broadcast.splat611, %wide.load.1
  %239 = fmul <2 x double> %broadcast.splat611, %wide.load609.1
  %240 = bitcast double* %234 to <2 x double>*
  store <2 x double> %238, <2 x double>* %240, align 8
  %241 = bitcast double* %236 to <2 x double>*
  store <2 x double> %239, <2 x double>* %241, align 8
  %index.next.1 = add i64 %index, 8
  %242 = icmp eq i64 %index.next.1, %n.vec
  br i1 %242, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !1

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %211, %n.vec
  br i1 %cmp.n, label %._crit_edge314, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph313
  %indvars.iv483.ph = phi i64 [ %205, %min.iters.checked ], [ %205, %.lr.ph313 ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv483 = phi i64 [ %indvars.iv.next484, %scalar.ph ], [ %indvars.iv483.ph, %scalar.ph.preheader ]
  %243 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv485, i64 %indvars.iv483
  %244 = load double, double* %243, align 8
  %245 = fmul double %204, %244
  store double %245, double* %243, align 8
  %indvars.iv.next484 = add i64 %indvars.iv483, 1
  %246 = icmp slt i64 %indvars.iv483, %207
  br i1 %246, label %scalar.ph, label %._crit_edge314.loopexit, !llvm.loop !4

._crit_edge314.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge314

._crit_edge314:                                   ; preds = %._crit_edge314.loopexit, %middle.block, %._crit_edge308
  %indvars.iv.next486 = add nuw nsw i64 %indvars.iv485, 1
  %247 = icmp slt i64 %indvars.iv.next486, %176
  br i1 %247, label %187, label %._crit_edge317.loopexit

._crit_edge317.loopexit:                          ; preds = %._crit_edge314
  br label %._crit_edge317

._crit_edge317:                                   ; preds = %._crit_edge317.loopexit, %.preheader157
  %248 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %249 = load i32, i32* %248, align 8
  %250 = icmp eq i32 %249, 1
  %251 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %252 = icmp sgt i32 %251, 0
  %or.cond338 = and i1 %250, %252
  br i1 %or.cond338, label %.lr.ph303.preheader, label %.preheader155

.lr.ph303.preheader:                              ; preds = %._crit_edge317
  br label %.lr.ph303

.preheader155.loopexit:                           ; preds = %.lr.ph303
  br label %.preheader155

.preheader155:                                    ; preds = %.preheader155.loopexit, %._crit_edge317
  %253 = phi i32 [ %251, %._crit_edge317 ], [ %261, %.preheader155.loopexit ]
  %254 = icmp sgt i32 %253, 0
  br i1 %254, label %.lr.ph300, label %._crit_edge301

.lr.ph300:                                        ; preds = %.preheader155
  %255 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %256 = sext i32 %255 to i64
  br label %264

.lr.ph303:                                        ; preds = %.lr.ph303.preheader, %.lr.ph303
  %indvars.iv479 = phi i64 [ %indvars.iv.next480, %.lr.ph303 ], [ 0, %.lr.ph303.preheader ]
  %257 = getelementptr inbounds [63 x double], [63 x double]* %16, i64 0, i64 %indvars.iv479
  %258 = load double, double* %257, align 8
  %259 = fmul double %258, 0x3FCD791C5F888823
  %260 = tail call double @exp(double %259) #6
  store double %260, double* %257, align 8
  %indvars.iv.next480 = add nuw i64 %indvars.iv479, 1
  %261 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %262 = sext i32 %261 to i64
  %263 = icmp slt i64 %indvars.iv.next480, %262
  br i1 %263, label %.lr.ph303, label %.preheader155.loopexit

; <label>:264:                                    ; preds = %.lr.ph300, %._crit_edge298
  %indvars.iv477 = phi i64 [ 0, %.lr.ph300 ], [ %indvars.iv.next478, %._crit_edge298 ]
  %265 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv477, i64 0
  %266 = load i32, i32* %265, align 8
  %267 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv477, i64 1
  %268 = load i32, i32* %267, align 4
  %269 = icmp sgt i32 %266, %268
  br i1 %269, label %._crit_edge292, label %.lr.ph291

.lr.ph291:                                        ; preds = %264
  %270 = load i32, i32* %267, align 4
  %271 = sext i32 %266 to i64
  %272 = sext i32 %270 to i64
  br label %273

; <label>:273:                                    ; preds = %273, %.lr.ph291
  %indvars.iv473 = phi i64 [ %indvars.iv.next474, %273 ], [ %271, %.lr.ph291 ]
  %.061288 = phi double [ %276, %273 ], [ 0.000000e+00, %.lr.ph291 ]
  %274 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv477, i64 %indvars.iv473
  %275 = load double, double* %274, align 8
  %276 = fadd double %.061288, %275
  %indvars.iv.next474 = add nsw i64 %indvars.iv473, 1
  %277 = icmp slt i64 %indvars.iv473, %272
  br i1 %277, label %273, label %._crit_edge292.loopexit

._crit_edge292.loopexit:                          ; preds = %273
  br label %._crit_edge292

._crit_edge292:                                   ; preds = %._crit_edge292.loopexit, %264
  %.061.lcssa = phi double [ 0.000000e+00, %264 ], [ %276, %._crit_edge292.loopexit ]
  %278 = load i32, i32* %265, align 8
  %279 = load i32, i32* %267, align 4
  %280 = icmp sgt i32 %278, %279
  br i1 %280, label %._crit_edge298, label %.lr.ph297

.lr.ph297:                                        ; preds = %._crit_edge292
  %281 = getelementptr inbounds [63 x double], [63 x double]* %16, i64 0, i64 %indvars.iv477
  %282 = sext i32 %278 to i64
  %283 = load double, double* %281, align 8
  %284 = fdiv double %283, %.061.lcssa
  %285 = load i32, i32* %267, align 4
  %286 = sext i32 %285 to i64
  %287 = sext i32 %285 to i64
  %288 = icmp sgt i64 %282, %287
  %smax615 = select i1 %288, i64 %282, i64 %287
  %289 = add nsw i64 %smax615, 1
  %290 = sub nsw i64 %289, %282
  %min.iters.check616 = icmp ult i64 %290, 4
  br i1 %min.iters.check616, label %scalar.ph614.preheader, label %min.iters.checked617

min.iters.checked617:                             ; preds = %.lr.ph297
  %n.vec619 = and i64 %290, -4
  %cmp.zero620 = icmp eq i64 %n.vec619, 0
  %ind.end625 = add nsw i64 %282, %n.vec619
  br i1 %cmp.zero620, label %scalar.ph614.preheader, label %vector.ph621

vector.ph621:                                     ; preds = %min.iters.checked617
  %broadcast.splatinsert634 = insertelement <2 x double> undef, double %284, i32 0
  %broadcast.splat635 = shufflevector <2 x double> %broadcast.splatinsert634, <2 x double> undef, <2 x i32> zeroinitializer
  %291 = add nsw i64 %n.vec619, -4
  %292 = lshr exact i64 %291, 2
  %293 = and i64 %292, 1
  %lcmp.mod759 = icmp eq i64 %293, 0
  br i1 %lcmp.mod759, label %vector.body612.prol.preheader, label %vector.body612.prol.loopexit.unr-lcssa

vector.body612.prol.preheader:                    ; preds = %vector.ph621
  br label %vector.body612.prol

vector.body612.prol:                              ; preds = %vector.body612.prol.preheader
  %294 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv477, i64 %282
  %295 = bitcast double* %294 to <2 x double>*
  %wide.load632.prol = load <2 x double>, <2 x double>* %295, align 8
  %296 = getelementptr double, double* %294, i64 2
  %297 = bitcast double* %296 to <2 x double>*
  %wide.load633.prol = load <2 x double>, <2 x double>* %297, align 8
  %298 = fmul <2 x double> %wide.load632.prol, %broadcast.splat635
  %299 = fmul <2 x double> %wide.load633.prol, %broadcast.splat635
  %300 = bitcast double* %294 to <2 x double>*
  store <2 x double> %298, <2 x double>* %300, align 8
  %301 = bitcast double* %296 to <2 x double>*
  store <2 x double> %299, <2 x double>* %301, align 8
  br label %vector.body612.prol.loopexit.unr-lcssa

vector.body612.prol.loopexit.unr-lcssa:           ; preds = %vector.ph621, %vector.body612.prol
  %index622.unr.ph = phi i64 [ 4, %vector.body612.prol ], [ 0, %vector.ph621 ]
  br label %vector.body612.prol.loopexit

vector.body612.prol.loopexit:                     ; preds = %vector.body612.prol.loopexit.unr-lcssa
  %302 = icmp eq i64 %292, 0
  br i1 %302, label %middle.block613, label %vector.ph621.new

vector.ph621.new:                                 ; preds = %vector.body612.prol.loopexit
  br label %vector.body612

vector.body612:                                   ; preds = %vector.body612, %vector.ph621.new
  %index622 = phi i64 [ %index622.unr.ph, %vector.ph621.new ], [ %index.next623.1, %vector.body612 ]
  %303 = add i64 %282, %index622
  %304 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv477, i64 %303
  %305 = bitcast double* %304 to <2 x double>*
  %wide.load632 = load <2 x double>, <2 x double>* %305, align 8
  %306 = getelementptr double, double* %304, i64 2
  %307 = bitcast double* %306 to <2 x double>*
  %wide.load633 = load <2 x double>, <2 x double>* %307, align 8
  %308 = fmul <2 x double> %wide.load632, %broadcast.splat635
  %309 = fmul <2 x double> %wide.load633, %broadcast.splat635
  %310 = bitcast double* %304 to <2 x double>*
  store <2 x double> %308, <2 x double>* %310, align 8
  %311 = bitcast double* %306 to <2 x double>*
  store <2 x double> %309, <2 x double>* %311, align 8
  %index.next623 = add i64 %index622, 4
  %312 = add i64 %282, %index.next623
  %313 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv477, i64 %312
  %314 = bitcast double* %313 to <2 x double>*
  %wide.load632.1 = load <2 x double>, <2 x double>* %314, align 8
  %315 = getelementptr double, double* %313, i64 2
  %316 = bitcast double* %315 to <2 x double>*
  %wide.load633.1 = load <2 x double>, <2 x double>* %316, align 8
  %317 = fmul <2 x double> %wide.load632.1, %broadcast.splat635
  %318 = fmul <2 x double> %wide.load633.1, %broadcast.splat635
  %319 = bitcast double* %313 to <2 x double>*
  store <2 x double> %317, <2 x double>* %319, align 8
  %320 = bitcast double* %315 to <2 x double>*
  store <2 x double> %318, <2 x double>* %320, align 8
  %index.next623.1 = add i64 %index622, 8
  %321 = icmp eq i64 %index.next623.1, %n.vec619
  br i1 %321, label %middle.block613.unr-lcssa, label %vector.body612, !llvm.loop !6

middle.block613.unr-lcssa:                        ; preds = %vector.body612
  br label %middle.block613

middle.block613:                                  ; preds = %vector.body612.prol.loopexit, %middle.block613.unr-lcssa
  %cmp.n626 = icmp eq i64 %290, %n.vec619
  br i1 %cmp.n626, label %._crit_edge298, label %scalar.ph614.preheader

scalar.ph614.preheader:                           ; preds = %middle.block613, %min.iters.checked617, %.lr.ph297
  %indvars.iv475.ph = phi i64 [ %282, %min.iters.checked617 ], [ %282, %.lr.ph297 ], [ %ind.end625, %middle.block613 ]
  br label %scalar.ph614

scalar.ph614:                                     ; preds = %scalar.ph614.preheader, %scalar.ph614
  %indvars.iv475 = phi i64 [ %indvars.iv.next476, %scalar.ph614 ], [ %indvars.iv475.ph, %scalar.ph614.preheader ]
  %322 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv477, i64 %indvars.iv475
  %323 = load double, double* %322, align 8
  %324 = fmul double %323, %284
  store double %324, double* %322, align 8
  %indvars.iv.next476 = add i64 %indvars.iv475, 1
  %325 = icmp slt i64 %indvars.iv475, %286
  br i1 %325, label %scalar.ph614, label %._crit_edge298.loopexit, !llvm.loop !7

._crit_edge298.loopexit:                          ; preds = %scalar.ph614
  br label %._crit_edge298

._crit_edge298:                                   ; preds = %._crit_edge298.loopexit, %middle.block613, %._crit_edge292
  %indvars.iv.next478 = add nuw nsw i64 %indvars.iv477, 1
  %326 = icmp slt i64 %indvars.iv.next478, %256
  br i1 %326, label %264, label %._crit_edge301.loopexit

._crit_edge301.loopexit:                          ; preds = %._crit_edge298
  br label %._crit_edge301

._crit_edge301:                                   ; preds = %._crit_edge301.loopexit, %.preheader155
  tail call void @init_fft() #6
  br label %327

; <label>:327:                                    ; preds = %._crit_edge301, %11
  %328 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %329 = load i32, i32* %328, align 4
  %330 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %331 = load i32, i32* %330, align 4
  %332 = icmp eq i32 %331, 1
  %. = select i1 %332, i32 4, i32 %329
  %333 = icmp sgt i32 %., 0
  br i1 %333, label %.lr.ph286, label %.loopexit

.lr.ph286:                                        ; preds = %327
  %334 = sext i32 %2 to i64
  %335 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 37
  %336 = sext i32 %2 to i64
  %wide.trip.count471 = zext i32 %. to i64
  br label %337

; <label>:337:                                    ; preds = %.us-lcssa.us, %.lr.ph286
  %indvars.iv469 = phi i64 [ 0, %.lr.ph286 ], [ %indvars.iv.next470, %.us-lcssa.us ]
  %338 = and i64 %indvars.iv469, 1
  %339 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 %338
  %340 = icmp slt i64 %indvars.iv469, 2
  br i1 %340, label %341, label %359

; <label>:341:                                    ; preds = %337
  %342 = getelementptr inbounds [1024 x float], [1024 x float]* %339, i64 0, i64 0
  %343 = trunc i64 %indvars.iv469 to i32
  tail call void @fft_long(float* %342, i32 %343, i16** %1) #6
  %344 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0
  %345 = trunc i64 %indvars.iv469 to i32
  tail call void @fft_short([256 x float]* %344, i32 %345, i16** %1) #6
  %346 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %indvars.iv469
  %347 = bitcast double* %346 to i64*
  %348 = load i64, i64* %347, align 8
  %349 = getelementptr inbounds double, double* %8, i64 %indvars.iv469
  %350 = bitcast double* %349 to i64*
  store i64 %348, i64* %350, align 8
  %351 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %6, i64 %334, i64 %indvars.iv469, i32 0
  %352 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %indvars.iv469
  %353 = bitcast %struct.III_psy_xmin* %351 to i8*
  %354 = bitcast %struct.III_psy_xmin* %352 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %353, i8* %354, i64 488, i32 8, i1 false)
  %355 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %6, i64 %334, i64 %indvars.iv469, i32 1
  %356 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %indvars.iv469
  %357 = bitcast %struct.III_psy_xmin* %355 to i8*
  %358 = bitcast %struct.III_psy_xmin* %356 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %357, i8* %358, i64 488, i32 8, i1 false)
  br label %.loopexit153

; <label>:359:                                    ; preds = %337
  %360 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %indvars.iv469
  %361 = bitcast double* %360 to i64*
  %362 = load i64, i64* %361, align 8
  %363 = add nsw i64 %indvars.iv469, -2
  %364 = getelementptr inbounds double, double* %9, i64 %363
  %365 = bitcast double* %364 to i64*
  store i64 %362, i64* %365, align 8
  %366 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %7, i64 %336, i64 %363, i32 1
  %367 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %indvars.iv469
  %368 = bitcast %struct.III_psy_xmin* %366 to i8*
  %369 = bitcast %struct.III_psy_xmin* %367 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %368, i8* %369, i64 488, i32 8, i1 false)
  %370 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %7, i64 %336, i64 %363, i32 0
  %371 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %indvars.iv469
  %372 = bitcast %struct.III_psy_xmin* %370 to i8*
  %373 = bitcast %struct.III_psy_xmin* %371 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %372, i8* %373, i64 488, i32 8, i1 false)
  %374 = icmp eq i64 %indvars.iv469, 2
  br i1 %374, label %.preheader154.preheader, label %.loopexit153

.preheader154.preheader:                          ; preds = %359
  br label %.preheader154

.preheader154:                                    ; preds = %.preheader154.preheader, %.preheader154
  %indvars.iv391 = phi i64 [ %indvars.iv.next392.1, %.preheader154 ], [ 1023, %.preheader154.preheader ]
  %375 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 0, i64 %indvars.iv391
  %376 = load float, float* %375, align 4
  %377 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 1, i64 %indvars.iv391
  %378 = load float, float* %377, align 4
  %379 = fadd float %376, %378
  %380 = fmul float %379, 0x3FE6A09E60000000
  store float %380, float* %375, align 4
  %381 = fsub float %376, %378
  %382 = fmul float %381, 0x3FE6A09E60000000
  store float %382, float* %377, align 4
  %indvars.iv.next392 = add nsw i64 %indvars.iv391, -1
  %383 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 0, i64 %indvars.iv.next392
  %384 = load float, float* %383, align 4
  %385 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 1, i64 %indvars.iv.next392
  %386 = load float, float* %385, align 4
  %387 = fadd float %384, %386
  %388 = fmul float %387, 0x3FE6A09E60000000
  store float %388, float* %383, align 4
  %389 = fsub float %384, %386
  %390 = fmul float %389, 0x3FE6A09E60000000
  store float %390, float* %385, align 4
  %indvars.iv.next392.1 = add nsw i64 %indvars.iv391, -2
  %391 = icmp sgt i64 %indvars.iv391, 1
  br i1 %391, label %.preheader154, label %.preheader143.preheader

.preheader143.preheader:                          ; preds = %.preheader154
  br label %.preheader143

.preheader143:                                    ; preds = %.preheader143.preheader, %.preheader143
  %indvars.iv393 = phi i64 [ %indvars.iv.next394.1, %.preheader143 ], [ 255, %.preheader143.preheader ]
  %392 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0, i64 2, i64 %indvars.iv393
  %393 = load float, float* %392, align 4
  %394 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1, i64 2, i64 %indvars.iv393
  %395 = load float, float* %394, align 4
  %396 = fadd float %393, %395
  %397 = fmul float %396, 0x3FE6A09E60000000
  store float %397, float* %392, align 4
  %398 = fsub float %393, %395
  %399 = fmul float %398, 0x3FE6A09E60000000
  store float %399, float* %394, align 4
  %indvars.iv.next394 = add nsw i64 %indvars.iv393, -1
  %400 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0, i64 2, i64 %indvars.iv.next394
  %401 = load float, float* %400, align 4
  %402 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1, i64 2, i64 %indvars.iv.next394
  %403 = load float, float* %402, align 4
  %404 = fadd float %401, %403
  %405 = fmul float %404, 0x3FE6A09E60000000
  store float %405, float* %400, align 4
  %406 = fsub float %401, %403
  %407 = fmul float %406, 0x3FE6A09E60000000
  store float %407, float* %402, align 4
  %indvars.iv.next394.1 = add nsw i64 %indvars.iv393, -2
  %408 = icmp sgt i64 %indvars.iv393, 1
  br i1 %408, label %.preheader143, label %.preheader143.1398.preheader

.preheader143.1398.preheader:                     ; preds = %.preheader143
  br label %.preheader143.1398

.loopexit153.loopexit:                            ; preds = %.preheader143.2399
  br label %.loopexit153

.loopexit153:                                     ; preds = %.loopexit153.loopexit, %359, %341
  %409 = getelementptr inbounds [1024 x float], [1024 x float]* %339, i64 0, i64 0
  %410 = load float, float* %409, align 16
  %411 = fmul float %410, %410
  store float %411, float* getelementptr inbounds ([513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 0), align 16
  %412 = getelementptr inbounds [4 x float], [4 x float]* %12, i64 0, i64 %indvars.iv469
  store float %411, float* %412, align 4
  br label %413

; <label>:413:                                    ; preds = %413, %.loopexit153
  %indvars.iv401 = phi i64 [ 511, %.loopexit153 ], [ %indvars.iv.next402.1, %413 ]
  %414 = phi float [ %411, %.loopexit153 ], [ %438, %413 ]
  %415 = sub nuw nsw i64 512, %indvars.iv401
  %416 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 %338, i64 %415
  %417 = load float, float* %416, align 4
  %418 = add nuw nsw i64 %indvars.iv401, 512
  %419 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 %338, i64 %418
  %420 = load float, float* %419, align 4
  %421 = fmul float %417, %417
  %422 = fmul float %420, %420
  %423 = fadd float %421, %422
  %424 = fmul float %423, 5.000000e-01
  %425 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %415
  store float %424, float* %425, align 4
  %426 = fadd float %414, %424
  %427 = sub i64 513, %indvars.iv401
  %428 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 %338, i64 %427
  %429 = load float, float* %428, align 4
  %430 = add nsw i64 %indvars.iv401, 511
  %431 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 %338, i64 %430
  %432 = load float, float* %431, align 4
  %433 = fmul float %429, %429
  %434 = fmul float %432, %432
  %435 = fadd float %433, %434
  %436 = fmul float %435, 5.000000e-01
  %437 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %427
  store float %436, float* %437, align 4
  %438 = fadd float %426, %436
  %indvars.iv.next402.1 = add nsw i64 %indvars.iv401, -2
  %439 = icmp sgt i64 %indvars.iv401, 1
  br i1 %439, label %413, label %min.iters.checked691

.lr.ph194:                                        ; preds = %.preheader150408
  %440 = getelementptr inbounds [1024 x float], [1024 x float]* %339, i64 0, i64 0
  br label %531

min.iters.checked691:                             ; preds = %413
  store float %438, float* %412, align 4
  %441 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 0
  %442 = bitcast float* %441 to i32*
  %443 = load i32, i32* %442, align 16
  store i32 %443, i32* bitcast ([129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2) to i32*), align 8
  %444 = load float, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 0), align 8
  %445 = fmul float %444, %444
  store float %445, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 0), align 8
  br i1 or (i1 icmp ult (i64 add (i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 1) to i64), i64 504), i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 1) to i64)), i1 icmp ult (i64 add (i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 2) to i64), i64 504), i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 2) to i64))), label %scalar.ph690.preheader, label %vector.body688.preheader

vector.body688.preheader:                         ; preds = %min.iters.checked691
  br label %vector.body688

scalar.ph690.preheader:                           ; preds = %min.iters.checked691
  br label %scalar.ph690

vector.body688:                                   ; preds = %vector.body688.preheader, %vector.body688
  %index701 = phi i64 [ %index.next702, %vector.body688 ], [ 0, %vector.body688.preheader ]
  %446 = shl i64 %index701, 1
  %offset.idx705 = sub i64 127, %446
  %447 = sub nuw nsw i64 128, %offset.idx705
  %448 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %447
  %449 = bitcast float* %448 to <8 x float>*
  %wide.vec709 = load <8 x float>, <8 x float>* %449, align 4
  %450 = add nuw nsw i64 %offset.idx705, 128
  %451 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %450
  %452 = getelementptr float, float* %451, i64 -7
  %453 = bitcast float* %452 to <8 x float>*
  %wide.vec712 = load <8 x float>, <8 x float>* %453, align 4
  %454 = fmul <8 x float> %wide.vec709, %wide.vec709
  %455 = shufflevector <8 x float> %454, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %456 = fmul <8 x float> %wide.vec712, %wide.vec712
  %457 = shufflevector <8 x float> %456, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %458 = shufflevector <4 x float> %457, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %459 = fadd <4 x float> %455, %458
  %460 = fmul <4 x float> %459, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %461 = sub i64 129, %offset.idx705
  %462 = fmul <8 x float> %wide.vec709, %wide.vec709
  %463 = shufflevector <8 x float> %462, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %464 = fmul <8 x float> %wide.vec712, %wide.vec712
  %465 = shufflevector <8 x float> %464, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %466 = shufflevector <4 x float> %465, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %467 = fadd <4 x float> %463, %466
  %468 = fmul <4 x float> %467, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %469 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 %461
  %470 = getelementptr float, float* %469, i64 -1
  %471 = bitcast float* %470 to <8 x float>*
  %interleaved.vec717 = shufflevector <4 x float> %460, <4 x float> %468, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec717, <8 x float>* %471, align 4
  %index.next702 = add i64 %index701, 4
  %472 = icmp eq i64 %index.next702, 64
  br i1 %472, label %middle.block689.loopexit725, label %vector.body688, !llvm.loop !8

scalar.ph690:                                     ; preds = %scalar.ph690.preheader, %scalar.ph690
  %indvars.iv403 = phi i64 [ %indvars.iv.next404.1, %scalar.ph690 ], [ 127, %scalar.ph690.preheader ]
  %473 = sub nuw nsw i64 128, %indvars.iv403
  %474 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %473
  %475 = load float, float* %474, align 4
  %476 = add nuw nsw i64 %indvars.iv403, 128
  %477 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %476
  %478 = load float, float* %477, align 4
  %479 = fmul float %475, %475
  %480 = fmul float %478, %478
  %481 = fadd float %479, %480
  %482 = fmul float %481, 5.000000e-01
  %483 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 %473
  store float %482, float* %483, align 4
  %484 = sub i64 129, %indvars.iv403
  %485 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %484
  %486 = load float, float* %485, align 4
  %487 = add nsw i64 %indvars.iv403, 127
  %488 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %487
  %489 = load float, float* %488, align 4
  %490 = fmul float %486, %486
  %491 = fmul float %489, %489
  %492 = fadd float %490, %491
  %493 = fmul float %492, 5.000000e-01
  %494 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 %484
  store float %493, float* %494, align 4
  %indvars.iv.next404.1 = add nsw i64 %indvars.iv403, -2
  %495 = icmp sgt i64 %indvars.iv403, 1
  br i1 %495, label %scalar.ph690, label %middle.block689.loopexit, !llvm.loop !9

middle.block689.loopexit:                         ; preds = %scalar.ph690
  br label %middle.block689

middle.block689.loopexit725:                      ; preds = %vector.body688
  br label %middle.block689

middle.block689:                                  ; preds = %middle.block689.loopexit725, %middle.block689.loopexit
  %496 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 0
  %497 = bitcast float* %496 to i32*
  %498 = load i32, i32* %497, align 16
  store i32 %498, i32* bitcast ([129 x float]* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1) to i32*), align 4
  %499 = load float, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 0), align 4
  %500 = fmul float %499, %499
  store float %500, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 0), align 4
  br i1 or (i1 icmp ult (i64 add (i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 1) to i64), i64 504), i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 1) to i64)), i1 icmp ult (i64 add (i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 2) to i64), i64 504), i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 2) to i64))), label %scalar.ph660.preheader, label %vector.body658.preheader

vector.body658.preheader:                         ; preds = %middle.block689
  br label %vector.body658

scalar.ph660.preheader:                           ; preds = %middle.block689
  br label %scalar.ph660

vector.body658:                                   ; preds = %vector.body658.preheader, %vector.body658
  %index671 = phi i64 [ %index.next672, %vector.body658 ], [ 0, %vector.body658.preheader ]
  %501 = shl i64 %index671, 1
  %offset.idx675 = sub i64 127, %501
  %502 = sub nuw nsw i64 128, %offset.idx675
  %503 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %502
  %504 = bitcast float* %503 to <8 x float>*
  %wide.vec679 = load <8 x float>, <8 x float>* %504, align 4
  %505 = add nuw nsw i64 %offset.idx675, 128
  %506 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %505
  %507 = getelementptr float, float* %506, i64 -7
  %508 = bitcast float* %507 to <8 x float>*
  %wide.vec682 = load <8 x float>, <8 x float>* %508, align 4
  %509 = fmul <8 x float> %wide.vec679, %wide.vec679
  %510 = shufflevector <8 x float> %509, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %511 = fmul <8 x float> %wide.vec682, %wide.vec682
  %512 = shufflevector <8 x float> %511, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %513 = shufflevector <4 x float> %512, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %514 = fadd <4 x float> %510, %513
  %515 = fmul <4 x float> %514, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %516 = sub i64 129, %offset.idx675
  %517 = fmul <8 x float> %wide.vec679, %wide.vec679
  %518 = shufflevector <8 x float> %517, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %519 = fmul <8 x float> %wide.vec682, %wide.vec682
  %520 = shufflevector <8 x float> %519, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %521 = shufflevector <4 x float> %520, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %522 = fadd <4 x float> %518, %521
  %523 = fmul <4 x float> %522, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %524 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 %516
  %525 = getelementptr float, float* %524, i64 -1
  %526 = bitcast float* %525 to <8 x float>*
  %interleaved.vec687 = shufflevector <4 x float> %515, <4 x float> %523, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec687, <8 x float>* %526, align 4
  %index.next672 = add i64 %index671, 4
  %527 = icmp eq i64 %index.next672, 64
  br i1 %527, label %middle.block659.loopexit724, label %vector.body658, !llvm.loop !10

.preheader149.loopexit:                           ; preds = %593
  br label %.preheader149

.preheader149:                                    ; preds = %.preheader149.loopexit, %.preheader150408
  %.lcssa165 = phi i32 [ 0, %.preheader150408 ], [ %595, %.preheader149.loopexit ]
  %528 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  %529 = icmp slt i32 %.lcssa165, %528
  br i1 %529, label %.lr.ph197.preheader, label %.preheader148

.lr.ph197.preheader:                              ; preds = %.preheader149
  %530 = zext i32 %.lcssa165 to i64
  br label %.lr.ph197

; <label>:531:                                    ; preds = %.lr.ph194, %593
  %indvars.iv409 = phi i64 [ 0, %.lr.ph194 ], [ %indvars.iv.next410, %593 ]
  %532 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav, i64 0, i64 %indvars.iv469, i64 1, i64 %indvars.iv409
  %533 = load float, float* %532, align 4
  %534 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav, i64 0, i64 %indvars.iv469, i64 1, i64 %indvars.iv409
  %535 = load float, float* %534, align 4
  %536 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav, i64 0, i64 %indvars.iv469, i64 1, i64 %indvars.iv409
  %537 = load float, float* %536, align 4
  %538 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.ax_sav, i64 0, i64 %indvars.iv469, i64 0, i64 %indvars.iv409
  %539 = load float, float* %538, align 4
  store float %539, float* %532, align 4
  %540 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.bx_sav, i64 0, i64 %indvars.iv469, i64 0, i64 %indvars.iv409
  %541 = load float, float* %540, align 4
  store float %541, float* %534, align 4
  %542 = getelementptr inbounds [4 x [2 x [513 x float]]], [4 x [2 x [513 x float]]]* @L3psycho_anal.rx_sav, i64 0, i64 %indvars.iv469, i64 0, i64 %indvars.iv409
  %543 = load float, float* %542, align 4
  store float %543, float* %536, align 4
  %544 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 %338, i64 %indvars.iv409
  %545 = load float, float* %544, align 4
  store float %545, float* %538, align 4
  %546 = icmp eq i64 %indvars.iv409, 0
  %547 = sub nsw i64 1024, %indvars.iv409
  %548 = getelementptr inbounds [2 x [1024 x float]], [2 x [1024 x float]]* @L3psycho_anal.wsamp_L, i64 0, i64 %338, i64 %547
  %.in98 = select i1 %546, float* %440, float* %548
  %549 = load float, float* %.in98, align 4
  store float %549, float* %540, align 4
  %550 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv409
  %551 = load float, float* %550, align 4
  %sqrtf99 = tail call float @sqrtf(float %551) #1
  store float %sqrtf99, float* %542, align 4
  %552 = fcmp une float %543, 0.000000e+00
  %553 = fmul float %539, %541
  %554 = fmul float %539, %539
  %555 = fmul float %541, %541
  %556 = fsub float %554, %555
  %557 = fmul float %556, 5.000000e-01
  %558 = fmul float %543, %543
  %.087 = select i1 %552, float %558, float 1.000000e+00
  %.085 = select i1 %552, float %557, float 0.000000e+00
  %.083 = select i1 %552, float %553, float 1.000000e+00
  %559 = fcmp une float %537, 0.000000e+00
  br i1 %559, label %560, label %570

; <label>:560:                                    ; preds = %531
  %561 = fadd float %.085, %.083
  %562 = fadd float %533, %535
  %563 = fmul float %562, %561
  %564 = fmul float %563, 5.000000e-01
  %565 = fmul float %533, %.083
  %566 = fsub float %564, %565
  %567 = fmul float %535, %.085
  %568 = fsub float %564, %567
  %569 = fmul float %537, %.087
  br label %570

; <label>:570:                                    ; preds = %531, %560
  %.188 = phi float [ %569, %560 ], [ %.087, %531 ]
  %.186 = phi float [ %566, %560 ], [ %.085, %531 ]
  %.184 = phi float [ %568, %560 ], [ %.083, %531 ]
  %571 = fmul float %543, 2.000000e+00
  %572 = fsub float %571, %537
  %573 = fdiv float %572, %.188
  %fabsf100 = tail call float @fabsf(float %572) #5
  %574 = fadd float %sqrtf99, %fabsf100
  %575 = fcmp une float %574, 0.000000e+00
  br i1 %575, label %576, label %593

; <label>:576:                                    ; preds = %570
  %577 = fmul float %.186, %573
  %578 = fmul float %573, %.184
  %579 = fadd float %545, %549
  %580 = fmul float %579, 5.000000e-01
  %581 = fsub float %580, %578
  %582 = fsub float %545, %549
  %583 = fmul float %582, 5.000000e-01
  %584 = fsub float %583, %577
  %585 = fmul float %581, %581
  %586 = fmul float %584, %584
  %587 = fadd float %586, %585
  %588 = fpext float %587 to double
  %589 = tail call double @sqrt(double %588) #6
  %590 = fpext float %574 to double
  %591 = fdiv double %589, %590
  %592 = fptrunc double %591 to float
  br label %593

; <label>:593:                                    ; preds = %576, %570
  %.289 = phi float [ %592, %576 ], [ %574, %570 ]
  %594 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv409
  store float %.289, float* %594, align 4
  %indvars.iv.next410 = add nuw i64 %indvars.iv409, 1
  %.b1 = load i1, i1* @L3psycho_anal.cw_lower_index, align 4
  %595 = select i1 %.b1, i32 6, i32 0
  %596 = zext i32 %595 to i64
  %597 = icmp slt i64 %indvars.iv.next410, %596
  br i1 %597, label %531, label %.preheader149.loopexit

.preheader148.loopexit:                           ; preds = %671
  br label %.preheader148

.preheader148:                                    ; preds = %.preheader148.loopexit, %.preheader149
  %598 = phi i32 [ %528, %.preheader149 ], [ %679, %.preheader148.loopexit ]
  %599 = icmp sgt i32 %598, 0
  br i1 %599, label %.lr.ph211, label %.preheader147

.lr.ph211:                                        ; preds = %.preheader148
  %600 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  br label %688

.lr.ph197:                                        ; preds = %.lr.ph197.preheader, %671
  %indvars.iv411 = phi i64 [ %530, %.lr.ph197.preheader ], [ %indvars.iv.next412, %671 ]
  %601 = add nsw i64 %indvars.iv411, 2
  %602 = trunc i64 %601 to i32
  %603 = sdiv i32 %602, 4
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 %604
  %606 = load float, float* %605, align 4
  %607 = fcmp une float %606, 0.000000e+00
  br i1 %607, label %608, label %620

; <label>:608:                                    ; preds = %.lr.ph197
  %609 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %604
  %610 = load float, float* %609, align 4
  %611 = sub nsw i32 256, %603
  %612 = sext i32 %611 to i64
  %613 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %612
  %614 = load float, float* %613, align 4
  %615 = fmul float %610, %614
  %616 = fmul float %610, %610
  %617 = fmul float %614, %614
  %618 = fsub float %616, %617
  %619 = fmul float %618, 5.000000e-01
  %sqrtf97 = tail call float @sqrtf(float %606) #1
  br label %620

; <label>:620:                                    ; preds = %.lr.ph197, %608
  %.090 = phi float [ %sqrtf97, %608 ], [ %606, %.lr.ph197 ]
  %.080 = phi float [ %615, %608 ], [ 1.000000e+00, %.lr.ph197 ]
  %.078 = phi float [ %619, %608 ], [ 0.000000e+00, %.lr.ph197 ]
  %.075 = phi float [ %606, %608 ], [ 1.000000e+00, %.lr.ph197 ]
  %621 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 %604
  %622 = load float, float* %621, align 4
  %623 = fcmp une float %622, 0.000000e+00
  br i1 %623, label %624, label %640

; <label>:624:                                    ; preds = %620
  %625 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %604
  %626 = load float, float* %625, align 4
  %627 = sub nsw i32 256, %603
  %628 = sext i32 %627 to i64
  %629 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 2, i64 %628
  %630 = load float, float* %629, align 4
  %631 = fadd float %.080, %.078
  %632 = fadd float %626, %630
  %633 = fmul float %631, %632
  %634 = fmul float %633, 5.000000e-01
  %635 = fmul float %.080, %626
  %636 = fsub float %634, %635
  %637 = fmul float %.078, %630
  %638 = fsub float %634, %637
  %sqrtf96 = tail call float @sqrtf(float %622) #1
  %639 = fmul float %.075, %sqrtf96
  br label %640

; <label>:640:                                    ; preds = %620, %624
  %.082 = phi float [ %sqrtf96, %624 ], [ %622, %620 ]
  %.181 = phi float [ %638, %624 ], [ %.080, %620 ]
  %.179 = phi float [ %636, %624 ], [ %.078, %620 ]
  %.176 = phi float [ %639, %624 ], [ %.075, %620 ]
  %641 = fmul float %.090, 2.000000e+00
  %642 = fsub float %641, %.082
  %643 = fdiv float %642, %.176
  %644 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 %604
  %645 = load float, float* %644, align 4
  %sqrtf = tail call float @sqrtf(float %645) #1
  %fabsf = tail call float @fabsf(float %642) #5
  %646 = fadd float %sqrtf, %fabsf
  %647 = fcmp une float %646, 0.000000e+00
  br i1 %647, label %648, label %671

; <label>:648:                                    ; preds = %640
  %649 = fmul float %.179, %643
  %650 = fmul float %.181, %643
  %651 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %604
  %652 = load float, float* %651, align 4
  %653 = sub nsw i32 256, %603
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %654
  %656 = load float, float* %655, align 4
  %657 = fadd float %652, %656
  %658 = fmul float %657, 5.000000e-01
  %659 = fsub float %658, %650
  %660 = fsub float %652, %656
  %661 = fmul float %660, 5.000000e-01
  %662 = fsub float %661, %649
  %663 = fmul float %659, %659
  %664 = fmul float %662, %662
  %665 = fadd float %663, %664
  %666 = fpext float %665 to double
  %667 = tail call double @sqrt(double %666) #6
  %668 = fpext float %646 to double
  %669 = fdiv double %667, %668
  %670 = fptrunc double %669 to float
  br label %671

; <label>:671:                                    ; preds = %648, %640
  %.277 = phi float [ %670, %648 ], [ %646, %640 ]
  %672 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv411
  store float %.277, float* %672, align 8
  %673 = add nsw i64 %indvars.iv411, 3
  %674 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %673
  store float %.277, float* %674, align 4
  %675 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %601
  store float %.277, float* %675, align 8
  %676 = shl i64 %indvars.iv411, 32
  %sext = ashr exact i64 %676, 32
  %677 = or i64 %sext, 1
  %678 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %677
  store float %.277, float* %678, align 4
  %indvars.iv.next412 = add i64 %indvars.iv411, 4
  %679 = load i32, i32* @L3psycho_anal.cw_upper_index, align 4
  %680 = sext i32 %679 to i64
  %681 = icmp slt i64 %indvars.iv.next412, %680
  br i1 %681, label %.lr.ph197, label %.preheader148.loopexit

.preheader147.loopexit:                           ; preds = %._crit_edge205
  %682 = trunc i64 %indvars.iv.next416 to i32
  br label %.preheader147

.preheader147:                                    ; preds = %.preheader147.loopexit, %.preheader148
  %.1137.lcssa = phi i32 [ 0, %.preheader148 ], [ %.12.lcssa, %.preheader147.loopexit ]
  %.5.lcssa = phi i32 [ 0, %.preheader148 ], [ %682, %.preheader147.loopexit ]
  %683 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %684 = icmp slt i32 %.5.lcssa, %683
  br i1 %684, label %.lr.ph225, label %._crit_edge226

.lr.ph225:                                        ; preds = %.preheader147
  %685 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %686 = sext i32 %.5.lcssa to i64
  %687 = sext i32 %685 to i64
  br label %735

; <label>:688:                                    ; preds = %.lr.ph211, %._crit_edge205
  %indvars.iv415 = phi i64 [ 0, %.lr.ph211 ], [ %indvars.iv.next416, %._crit_edge205 ]
  %.1137209 = phi i32 [ 0, %.lr.ph211 ], [ %.12.lcssa, %._crit_edge205 ]
  %689 = sext i32 %.1137209 to i64
  %690 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %689
  %691 = load float, float* %690, align 4
  %692 = fpext float %691 to double
  %693 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %689
  %694 = load float, float* %693, align 4
  %695 = fmul float %691, %694
  %696 = fpext float %695 to double
  %697 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i64 0, i64 %indvars.iv415
  %698 = load i32, i32* %697, align 4
  %.12198 = add nsw i32 %.1137209, 1
  %699 = icmp sgt i32 %698, 1
  br i1 %699, label %.lr.ph204.preheader, label %._crit_edge205

.lr.ph204.preheader:                              ; preds = %688
  %700 = sext i32 %.12198 to i64
  %701 = and i32 %698, 1
  %lcmp.mod = icmp eq i32 %701, 0
  br i1 %lcmp.mod, label %.lr.ph204.prol, label %.lr.ph204.prol.loopexit

.lr.ph204.prol:                                   ; preds = %.lr.ph204.preheader
  %.072.prol = add nsw i32 %698, -1
  %702 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %700
  %703 = load float, float* %702, align 4
  %704 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %700
  %705 = load float, float* %704, align 4
  %706 = fmul float %703, %705
  %707 = fpext float %706 to double
  %708 = fadd double %696, %707
  %709 = fpext float %703 to double
  %710 = fadd double %692, %709
  %indvars.iv.next414.prol = add nsw i64 %700, 1
  br label %.lr.ph204.prol.loopexit

.lr.ph204.prol.loopexit:                          ; preds = %.lr.ph204.prol, %.lr.ph204.preheader
  %indvars.iv413.unr.ph = phi i64 [ %indvars.iv.next414.prol, %.lr.ph204.prol ], [ %700, %.lr.ph204.preheader ]
  %.072.in201.unr.ph = phi i32 [ %.072.prol, %.lr.ph204.prol ], [ %698, %.lr.ph204.preheader ]
  %.073200.unr.ph = phi double [ %708, %.lr.ph204.prol ], [ %696, %.lr.ph204.preheader ]
  %.074199.unr.ph = phi double [ %710, %.lr.ph204.prol ], [ %692, %.lr.ph204.preheader ]
  %.lcssa350.unr.ph = phi double [ %708, %.lr.ph204.prol ], [ undef, %.lr.ph204.preheader ]
  %.lcssa349.unr.ph = phi double [ %710, %.lr.ph204.prol ], [ undef, %.lr.ph204.preheader ]
  %711 = icmp eq i32 %698, 2
  br i1 %711, label %._crit_edge205.loopexit, label %.lr.ph204.preheader721

.lr.ph204.preheader721:                           ; preds = %.lr.ph204.prol.loopexit
  br label %.lr.ph204

.lr.ph204:                                        ; preds = %.lr.ph204.preheader721, %.lr.ph204
  %indvars.iv413 = phi i64 [ %indvars.iv.next414.1, %.lr.ph204 ], [ %indvars.iv413.unr.ph, %.lr.ph204.preheader721 ]
  %.072.in201 = phi i32 [ %.072.1, %.lr.ph204 ], [ %.072.in201.unr.ph, %.lr.ph204.preheader721 ]
  %.073200 = phi double [ %727, %.lr.ph204 ], [ %.073200.unr.ph, %.lr.ph204.preheader721 ]
  %.074199 = phi double [ %729, %.lr.ph204 ], [ %.074199.unr.ph, %.lr.ph204.preheader721 ]
  %712 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv413
  %713 = load float, float* %712, align 4
  %714 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv413
  %715 = load float, float* %714, align 4
  %716 = fmul float %713, %715
  %717 = fpext float %716 to double
  %718 = fadd double %.073200, %717
  %719 = fpext float %713 to double
  %720 = fadd double %.074199, %719
  %indvars.iv.next414 = add nsw i64 %indvars.iv413, 1
  %.072.1 = add nsw i32 %.072.in201, -2
  %721 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv.next414
  %722 = load float, float* %721, align 4
  %723 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.cw, i64 0, i64 %indvars.iv.next414
  %724 = load float, float* %723, align 4
  %725 = fmul float %722, %724
  %726 = fpext float %725 to double
  %727 = fadd double %718, %726
  %728 = fpext float %722 to double
  %729 = fadd double %720, %728
  %indvars.iv.next414.1 = add nsw i64 %indvars.iv413, 2
  %730 = icmp sgt i32 %.072.1, 1
  br i1 %730, label %.lr.ph204, label %._crit_edge205.loopexit.loopexit

._crit_edge205.loopexit.loopexit:                 ; preds = %.lr.ph204
  br label %._crit_edge205.loopexit

._crit_edge205.loopexit:                          ; preds = %._crit_edge205.loopexit.loopexit, %.lr.ph204.prol.loopexit
  %.lcssa350 = phi double [ %.lcssa350.unr.ph, %.lr.ph204.prol.loopexit ], [ %727, %._crit_edge205.loopexit.loopexit ]
  %.lcssa349 = phi double [ %.lcssa349.unr.ph, %.lr.ph204.prol.loopexit ], [ %729, %._crit_edge205.loopexit.loopexit ]
  %731 = add i32 %698, %.1137209
  br label %._crit_edge205

._crit_edge205:                                   ; preds = %._crit_edge205.loopexit, %688
  %.074.lcssa = phi double [ %692, %688 ], [ %.lcssa349, %._crit_edge205.loopexit ]
  %.073.lcssa = phi double [ %696, %688 ], [ %.lcssa350, %._crit_edge205.loopexit ]
  %.12.lcssa = phi i32 [ %.12198, %688 ], [ %731, %._crit_edge205.loopexit ]
  %732 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv415
  store double %.074.lcssa, double* %732, align 8
  %733 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.cb, i64 0, i64 %indvars.iv415
  store double %.073.lcssa, double* %733, align 8
  %indvars.iv.next416 = add nuw i64 %indvars.iv415, 1
  %734 = icmp slt i32 %.12.lcssa, %600
  br i1 %734, label %688, label %.preheader147.loopexit

; <label>:735:                                    ; preds = %.lr.ph225, %._crit_edge220
  %indvars.iv421 = phi i64 [ %686, %.lr.ph225 ], [ %indvars.iv.next422, %._crit_edge220 ]
  %.1338223 = phi i32 [ %.1137.lcssa, %.lr.ph225 ], [ %.14.lcssa, %._crit_edge220 ]
  %736 = sext i32 %.1338223 to i64
  %737 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %736
  %738 = load float, float* %737, align 4
  %739 = fpext float %738 to double
  %740 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i64 0, i64 %indvars.iv421
  %741 = load i32, i32* %740, align 4
  %.14214 = add nsw i32 %.1338223, 1
  %742 = icmp sgt i32 %741, 1
  br i1 %742, label %.lr.ph219.preheader, label %._crit_edge220

.lr.ph219.preheader:                              ; preds = %735
  %743 = sext i32 %.14214 to i64
  %744 = add i32 %741, -2
  %745 = add i32 %741, 3
  %xtraiter419 = and i32 %745, 3
  %lcmp.mod420 = icmp eq i32 %xtraiter419, 0
  br i1 %lcmp.mod420, label %.lr.ph219.prol.loopexit, label %.lr.ph219.prol.preheader

.lr.ph219.prol.preheader:                         ; preds = %.lr.ph219.preheader
  br label %.lr.ph219.prol

.lr.ph219.prol:                                   ; preds = %.lr.ph219.prol.preheader, %.lr.ph219.prol
  %indvars.iv417.prol = phi i64 [ %indvars.iv.next418.prol, %.lr.ph219.prol ], [ %743, %.lr.ph219.prol.preheader ]
  %.070216.prol = phi double [ %749, %.lr.ph219.prol ], [ %739, %.lr.ph219.prol.preheader ]
  %.071.in215.prol = phi i32 [ %.071.prol, %.lr.ph219.prol ], [ %741, %.lr.ph219.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph219.prol ], [ %xtraiter419, %.lr.ph219.prol.preheader ]
  %.071.prol = add nsw i32 %.071.in215.prol, -1
  %746 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv417.prol
  %747 = load float, float* %746, align 4
  %748 = fpext float %747 to double
  %749 = fadd double %.070216.prol, %748
  %indvars.iv.next418.prol = add nsw i64 %indvars.iv417.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph219.prol.loopexit.loopexit, label %.lr.ph219.prol, !llvm.loop !11

.lr.ph219.prol.loopexit.loopexit:                 ; preds = %.lr.ph219.prol
  br label %.lr.ph219.prol.loopexit

.lr.ph219.prol.loopexit:                          ; preds = %.lr.ph219.prol.loopexit.loopexit, %.lr.ph219.preheader
  %indvars.iv417.unr = phi i64 [ %743, %.lr.ph219.preheader ], [ %indvars.iv.next418.prol, %.lr.ph219.prol.loopexit.loopexit ]
  %.070216.unr = phi double [ %739, %.lr.ph219.preheader ], [ %749, %.lr.ph219.prol.loopexit.loopexit ]
  %.071.in215.unr = phi i32 [ %741, %.lr.ph219.preheader ], [ %.071.prol, %.lr.ph219.prol.loopexit.loopexit ]
  %.lcssa353.unr = phi double [ undef, %.lr.ph219.preheader ], [ %749, %.lr.ph219.prol.loopexit.loopexit ]
  %750 = icmp ult i32 %744, 3
  br i1 %750, label %._crit_edge220.loopexit, label %.lr.ph219.preheader720

.lr.ph219.preheader720:                           ; preds = %.lr.ph219.prol.loopexit
  br label %.lr.ph219

.lr.ph219:                                        ; preds = %.lr.ph219.preheader720, %.lr.ph219
  %indvars.iv417 = phi i64 [ %indvars.iv.next418.3, %.lr.ph219 ], [ %indvars.iv417.unr, %.lr.ph219.preheader720 ]
  %.070216 = phi double [ %766, %.lr.ph219 ], [ %.070216.unr, %.lr.ph219.preheader720 ]
  %.071.in215 = phi i32 [ %.071.3, %.lr.ph219 ], [ %.071.in215.unr, %.lr.ph219.preheader720 ]
  %751 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv417
  %752 = load float, float* %751, align 4
  %753 = fpext float %752 to double
  %754 = fadd double %.070216, %753
  %indvars.iv.next418 = add nsw i64 %indvars.iv417, 1
  %755 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv.next418
  %756 = load float, float* %755, align 4
  %757 = fpext float %756 to double
  %758 = fadd double %754, %757
  %indvars.iv.next418.1 = add nsw i64 %indvars.iv417, 2
  %759 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv.next418.1
  %760 = load float, float* %759, align 4
  %761 = fpext float %760 to double
  %762 = fadd double %758, %761
  %indvars.iv.next418.2 = add nsw i64 %indvars.iv417, 3
  %.071.3 = add nsw i32 %.071.in215, -4
  %763 = getelementptr inbounds [513 x float], [513 x float]* @L3psycho_anal.energy, i64 0, i64 %indvars.iv.next418.2
  %764 = load float, float* %763, align 4
  %765 = fpext float %764 to double
  %766 = fadd double %762, %765
  %indvars.iv.next418.3 = add nsw i64 %indvars.iv417, 4
  %767 = icmp sgt i32 %.071.3, 1
  br i1 %767, label %.lr.ph219, label %._crit_edge220.loopexit.loopexit

._crit_edge220.loopexit.loopexit:                 ; preds = %.lr.ph219
  br label %._crit_edge220.loopexit

._crit_edge220.loopexit:                          ; preds = %._crit_edge220.loopexit.loopexit, %.lr.ph219.prol.loopexit
  %.lcssa353 = phi double [ %.lcssa353.unr, %.lr.ph219.prol.loopexit ], [ %766, %._crit_edge220.loopexit.loopexit ]
  %768 = add i32 %741, %.1338223
  br label %._crit_edge220

._crit_edge220:                                   ; preds = %._crit_edge220.loopexit, %735
  %.070.lcssa = phi double [ %739, %735 ], [ %.lcssa353, %._crit_edge220.loopexit ]
  %.14.lcssa = phi i32 [ %.14214, %735 ], [ %768, %._crit_edge220.loopexit ]
  %769 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv421
  store double %.070.lcssa, double* %769, align 8
  %770 = fmul double %.070.lcssa, 4.000000e-01
  %771 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.cb, i64 0, i64 %indvars.iv421
  store double %770, double* %771, align 8
  %indvars.iv.next422 = add nsw i64 %indvars.iv421, 1
  %772 = icmp slt i64 %indvars.iv.next422, %687
  br i1 %772, label %735, label %._crit_edge226.loopexit

._crit_edge226.loopexit:                          ; preds = %._crit_edge220
  br label %._crit_edge226

._crit_edge226:                                   ; preds = %._crit_edge226.loopexit, %.preheader147
  %773 = getelementptr inbounds [4 x double], [4 x double]* @L3psycho_anal.pe, i64 0, i64 %indvars.iv469
  store double 0.000000e+00, double* %773, align 8
  %774 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %775 = icmp sgt i32 %774, 0
  br i1 %775, label %.lr.ph237.preheader, label %._crit_edge238

.lr.ph237.preheader:                              ; preds = %._crit_edge226
  br label %.lr.ph237

.lr.ph237:                                        ; preds = %.lr.ph237.preheader, %844
  %indvars.iv425 = phi i64 [ %indvars.iv.next426, %844 ], [ 0, %.lr.ph237.preheader ]
  %776 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv425, i64 0
  %777 = load i32, i32* %776, align 8
  %778 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind, i64 0, i64 %indvars.iv425, i64 1
  %779 = load i32, i32* %778, align 4
  %780 = icmp sgt i32 %777, %779
  br i1 %780, label %._crit_edge232.thread, label %.lr.ph231

.lr.ph231:                                        ; preds = %.lr.ph237
  %781 = load i32, i32* %778, align 4
  %782 = sext i32 %777 to i64
  %783 = sext i32 %781 to i64
  br label %784

; <label>:784:                                    ; preds = %784, %.lr.ph231
  %indvars.iv423 = phi i64 [ %indvars.iv.next424, %784 ], [ %782, %.lr.ph231 ]
  %.065228 = phi double [ %790, %784 ], [ 0.000000e+00, %.lr.ph231 ]
  %.066227 = phi double [ %794, %784 ], [ 0.000000e+00, %.lr.ph231 ]
  %785 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_l, i64 0, i64 %indvars.iv425, i64 %indvars.iv423
  %786 = load double, double* %785, align 8
  %787 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.cb, i64 0, i64 %indvars.iv423
  %788 = load double, double* %787, align 8
  %789 = fmul double %786, %788
  %790 = fadd double %.065228, %789
  %791 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv423
  %792 = load double, double* %791, align 8
  %793 = fmul double %786, %792
  %794 = fadd double %.066227, %793
  %indvars.iv.next424 = add nsw i64 %indvars.iv423, 1
  %795 = icmp slt i64 %indvars.iv423, %783
  br i1 %795, label %784, label %._crit_edge232

._crit_edge232:                                   ; preds = %784
  %796 = fcmp une double %794, 0.000000e+00
  br i1 %796, label %797, label %._crit_edge232.thread

; <label>:797:                                    ; preds = %._crit_edge232
  %798 = fdiv double %790, %794
  %799 = fcmp ugt double %798, 0x3FA8F6869E6F084D
  br i1 %799, label %800, label %._crit_edge232.thread

; <label>:800:                                    ; preds = %797
  %801 = fcmp ogt double %798, 0x3FDFEDFBDEEA22F7
  br i1 %801, label %._crit_edge232.thread, label %802

; <label>:802:                                    ; preds = %800
  %803 = tail call double @log(double %798) #6
  %804 = fmul double %803, 0x3FF30298B36105E3
  %805 = fadd double %804, 0x3FEA6FF6E4078667
  %806 = tail call double @exp(double %805) #6
  br label %._crit_edge232.thread

._crit_edge232.thread:                            ; preds = %.lr.ph237, %797, %800, %802, %._crit_edge232
  %.066.lcssa525 = phi double [ %794, %._crit_edge232 ], [ %794, %797 ], [ %794, %802 ], [ %794, %800 ], [ 0.000000e+00, %.lr.ph237 ]
  %.269 = phi double [ %794, %._crit_edge232 ], [ 0x3FB0270AC3F8A9F9, %797 ], [ %806, %802 ], [ 1.000000e+00, %800 ], [ 0.000000e+00, %.lr.ph237 ]
  %807 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.minval, i64 0, i64 %indvars.iv425
  %808 = load double, double* %807, align 8
  %809 = fcmp olt double %808, %.269
  %810 = select i1 %809, double %808, double %.269
  %811 = fmul double %.066.lcssa525, %810
  %812 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_1, i64 0, i64 %indvars.iv469, i64 %indvars.iv425
  %813 = load double, double* %812, align 8
  %814 = fmul double %813, 2.000000e+00
  %815 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* @L3psycho_anal.nb_2, i64 0, i64 %indvars.iv469, i64 %indvars.iv425
  %816 = load double, double* %815, align 8
  %817 = fmul double %816, 1.600000e+01
  %818 = fcmp olt double %814, %817
  %L3psycho_anal.nb_2.sink = select i1 %818, [4 x [63 x double]]* @L3psycho_anal.nb_1, [4 x [63 x double]]* @L3psycho_anal.nb_2
  %.sink101 = select i1 %818, double 2.000000e+00, double 1.600000e+01
  %819 = getelementptr inbounds [4 x [63 x double]], [4 x [63 x double]]* %L3psycho_anal.nb_2.sink, i64 0, i64 %indvars.iv469, i64 %indvars.iv425
  %820 = load double, double* %819, align 8
  %821 = fmul double %820, %.sink101
  %822 = fcmp olt double %811, %821
  %823 = select i1 %822, double %811, double %821
  %824 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.qthr_l, i64 0, i64 %indvars.iv425
  %825 = load double, double* %824, align 8
  %826 = fcmp ogt double %825, %823
  %827 = select i1 %826, double %825, double %823
  %828 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %indvars.iv425
  store double %827, double* %828, align 8
  %829 = bitcast double* %812 to i64*
  %830 = load i64, i64* %829, align 8
  %831 = bitcast double* %815 to i64*
  store i64 %830, i64* %831, align 8
  store double %811, double* %812, align 8
  %832 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv425
  %833 = load double, double* %832, align 8
  %834 = fcmp olt double %827, %833
  br i1 %834, label %835, label %844

; <label>:835:                                    ; preds = %._crit_edge232.thread
  %836 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_l, i64 0, i64 %indvars.iv425
  %837 = load i32, i32* %836, align 4
  %838 = sitofp i32 %837 to double
  %839 = fdiv double %827, %833
  %840 = tail call double @log(double %839) #6
  %841 = fmul double %838, %840
  %842 = load double, double* %773, align 8
  %843 = fsub double %842, %841
  store double %843, double* %773, align 8
  br label %844

; <label>:844:                                    ; preds = %._crit_edge232.thread, %835
  %indvars.iv.next426 = add nuw i64 %indvars.iv425, 1
  %845 = load i32, i32* @L3psycho_anal.npart_l, align 4
  %846 = sext i32 %845 to i64
  %847 = icmp slt i64 %indvars.iv.next426, %846
  br i1 %847, label %.lr.ph237, label %._crit_edge238.loopexit

._crit_edge238.loopexit:                          ; preds = %844
  br label %._crit_edge238

._crit_edge238:                                   ; preds = %._crit_edge238.loopexit, %._crit_edge226
  br i1 %340, label %848, label %.preheader145.preheader

.preheader145.preheader:                          ; preds = %851, %874, %881, %878, %875, %862, %._crit_edge238
  br label %.preheader145

; <label>:848:                                    ; preds = %._crit_edge238
  %849 = load i32, i32* %335, align 8
  %850 = icmp eq i32 %849, 0
  br i1 %850, label %853, label %851

; <label>:851:                                    ; preds = %848
  %852 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 %indvars.iv469
  store i32 1, i32* %852, align 4
  br label %.preheader145.preheader

; <label>:853:                                    ; preds = %848
  %854 = load double, double* %773, align 8
  %855 = fcmp ogt double %854, 3.000000e+03
  br i1 %855, label %862, label %.preheader146.preheader

.preheader146.preheader:                          ; preds = %853
  %856 = load float, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 64), align 8
  %857 = fadd float %856, 0.000000e+00
  %858 = load float, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 64), align 4
  %859 = fadd float %858, 0.000000e+00
  %860 = load float, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 64), align 16
  %861 = fadd float %860, 0.000000e+00
  br label %.preheader146.1

; <label>:862:                                    ; preds = %853
  %863 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 %indvars.iv469
  store i32 0, i32* %863, align 4
  br label %.preheader145.preheader

; <label>:864:                                    ; preds = %.preheader146.1
  %865 = fcmp olt float %1509, %1506
  %.064..063 = select i1 %865, float %1509, float %1506
  %866 = fcmp olt float %.064..063, %1503
  %867 = select i1 %866, float %.064..063, float %1503
  %868 = fcmp ogt float %1509, %1506
  %.064..063106 = select i1 %868, float %1509, float %1506
  %869 = fcmp ogt float %.064..063106, %1503
  %870 = select i1 %869, float %.064..063106, float %1503
  %871 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 %indvars.iv469
  store i32 1, i32* %871, align 4
  %872 = fmul float %867, 3.000000e+01
  %873 = fcmp ogt float %870, %872
  br i1 %873, label %874, label %875

; <label>:874:                                    ; preds = %864
  store i32 0, i32* %871, align 4
  br label %.preheader145.preheader

; <label>:875:                                    ; preds = %864
  %876 = fmul float %867, 1.000000e+01
  %877 = fcmp ogt float %870, %876
  br i1 %877, label %878, label %.preheader145.preheader

; <label>:878:                                    ; preds = %875
  %879 = load double, double* %773, align 8
  %880 = fcmp ogt double %879, 1.000000e+03
  br i1 %880, label %881, label %.preheader145.preheader

; <label>:881:                                    ; preds = %878
  store i32 0, i32* %871, align 4
  br label %.preheader145.preheader

.preheader144:                                    ; preds = %._crit_edge249
  %882 = load i32, i32* @L3psycho_anal.npart_s_orig, align 4
  %883 = icmp sgt i32 %882, 0
  %884 = load i32, i32* @L3psycho_anal.npart_s, align 4
  %885 = icmp sgt i32 %884, 0
  br i1 %883, label %.preheader142.us.preheader, label %.preheader142.preheader

.preheader142.preheader:                          ; preds = %.preheader144
  %wide.trip.count = zext i32 %884 to i64
  br label %.preheader142

.preheader142.us.preheader:                       ; preds = %.preheader144
  %wide.trip.count453 = zext i32 %882 to i64
  %wide.trip.count459 = zext i32 %884 to i64
  br label %.preheader142.us

.preheader142.us:                                 ; preds = %.preheader142.us.preheader, %886
  %indvars.iv466 = phi i64 [ %indvars.iv.next467, %886 ], [ 0, %.preheader142.us.preheader ]
  br label %941

; <label>:886:                                    ; preds = %._crit_edge279.us
  %indvars.iv.next467 = add nuw nsw i64 %indvars.iv466, 1
  %exitcond468 = icmp eq i64 %indvars.iv.next467, 3
  br i1 %exitcond468, label %.us-lcssa.us.loopexit, label %.preheader142.us

.preheader140.us:                                 ; preds = %.preheader140.us.preheader, %._crit_edge279.us
  %indvars.iv463 = phi i64 [ %indvars.iv.next464, %._crit_edge279.us ], [ 0, %.preheader140.us.preheader ]
  %887 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w1_s, i64 0, i64 %indvars.iv463
  %888 = load double, double* %887, align 8
  %889 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bu_s, i64 0, i64 %indvars.iv463
  %890 = load i32, i32* %889, align 4
  %891 = sext i32 %890 to i64
  %892 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %891
  %893 = load double, double* %892, align 8
  %894 = fmul double %888, %893
  %895 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w2_s, i64 0, i64 %indvars.iv463
  %896 = load double, double* %895, align 8
  %897 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 %indvars.iv463
  %898 = load i32, i32* %897, align 4
  %899 = sext i32 %898 to i64
  %900 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %899
  %901 = load double, double* %900, align 8
  %902 = fmul double %896, %901
  %903 = fadd double %894, %902
  %904 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %891
  %905 = load double, double* %904, align 8
  %906 = fmul double %888, %905
  %907 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %899
  %908 = load double, double* %907, align 8
  %909 = fmul double %896, %908
  %910 = fadd double %906, %909
  %.11273.us = add nsw i32 %890, 1
  %911 = load i32, i32* %897, align 4
  %912 = icmp slt i32 %.11273.us, %911
  br i1 %912, label %.lr.ph278.us, label %._crit_edge279.us

._crit_edge279.us.loopexit:                       ; preds = %915
  br label %._crit_edge279.us

._crit_edge279.us:                                ; preds = %._crit_edge279.us.loopexit, %.preheader140.us
  %.08.lcssa.us = phi double [ %903, %.preheader140.us ], [ %921, %._crit_edge279.us.loopexit ]
  %.07.lcssa.us = phi double [ %910, %.preheader140.us ], [ %918, %._crit_edge279.us.loopexit ]
  %913 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %indvars.iv469, i32 1, i64 %indvars.iv463, i64 %indvars.iv466
  store double %.08.lcssa.us, double* %913, align 8
  %914 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %indvars.iv469, i32 1, i64 %indvars.iv463, i64 %indvars.iv466
  store double %.07.lcssa.us, double* %914, align 8
  %indvars.iv.next464 = add nuw nsw i64 %indvars.iv463, 1
  %exitcond465 = icmp eq i64 %indvars.iv.next464, 12
  br i1 %exitcond465, label %886, label %.preheader140.us

; <label>:915:                                    ; preds = %.lr.ph278.us, %915
  %indvars.iv461 = phi i64 [ %961, %.lr.ph278.us ], [ %indvars.iv.next462, %915 ]
  %.07275.us = phi double [ %910, %.lr.ph278.us ], [ %918, %915 ]
  %.08274.us = phi double [ %903, %.lr.ph278.us ], [ %921, %915 ]
  %916 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %indvars.iv461
  %917 = load double, double* %916, align 8
  %918 = fadd double %.07275.us, %917
  %919 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv461
  %920 = load double, double* %919, align 8
  %921 = fadd double %.08274.us, %920
  %indvars.iv.next462 = add nsw i64 %indvars.iv461, 1
  %922 = icmp slt i64 %indvars.iv.next462, %962
  br i1 %922, label %915, label %._crit_edge279.us.loopexit

.lr.ph272.us:                                     ; preds = %.lr.ph272.us.preheader, %._crit_edge269.us
  %indvars.iv457 = phi i64 [ %indvars.iv.next458, %._crit_edge269.us ], [ 0, %.lr.ph272.us.preheader ]
  %923 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv457, i64 0
  %924 = load i32, i32* %923, align 8
  %925 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv457, i64 1
  %926 = load i32, i32* %925, align 4
  %927 = icmp sgt i32 %924, %926
  br i1 %927, label %._crit_edge269.us, label %.lr.ph268.us

; <label>:928:                                    ; preds = %928, %.lr.ph268.us
  %indvars.iv455 = phi i64 [ %indvars.iv.next456, %928 ], [ %958, %.lr.ph268.us ]
  %.09266.us = phi double [ %934, %928 ], [ 0.000000e+00, %.lr.ph268.us ]
  %929 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv457, i64 %indvars.iv455
  %930 = load double, double* %929, align 8
  %931 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv455
  %932 = load double, double* %931, align 8
  %933 = fmul double %930, %932
  %934 = fadd double %.09266.us, %933
  %indvars.iv.next456 = add nsw i64 %indvars.iv455, 1
  %935 = icmp slt i64 %indvars.iv455, %959
  br i1 %935, label %928, label %._crit_edge269.us.loopexit

._crit_edge269.us.loopexit:                       ; preds = %928
  br label %._crit_edge269.us

._crit_edge269.us:                                ; preds = %._crit_edge269.us.loopexit, %.lr.ph272.us
  %.09.lcssa.us = phi double [ 0.000000e+00, %.lr.ph272.us ], [ %934, %._crit_edge269.us.loopexit ]
  %936 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.qthr_s, i64 0, i64 %indvars.iv457
  %937 = load double, double* %936, align 8
  %938 = fcmp ogt double %937, %.09.lcssa.us
  %939 = select i1 %938, double %937, double %.09.lcssa.us
  %940 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %indvars.iv457
  store double %939, double* %940, align 8
  %indvars.iv.next458 = add nuw nsw i64 %indvars.iv457, 1
  %exitcond460 = icmp eq i64 %indvars.iv.next458, %wide.trip.count459
  br i1 %exitcond460, label %.preheader140.us.preheader.loopexit, label %.lr.ph272.us

; <label>:941:                                    ; preds = %._crit_edge259.us, %.preheader142.us
  %indvars.iv451 = phi i64 [ 0, %.preheader142.us ], [ %indvars.iv.next452, %._crit_edge259.us ]
  %.1639262.us = phi i32 [ 0, %.preheader142.us ], [ %.17.lcssa.us, %._crit_edge259.us ]
  %942 = sext i32 %.1639262.us to i64
  %943 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %indvars.iv466, i64 %942
  %944 = load float, float* %943, align 4
  %945 = getelementptr inbounds [63 x i32], [63 x i32]* @L3psycho_anal.numlines_s, i64 0, i64 %indvars.iv451
  %946 = load i32, i32* %945, align 4
  %.17253.us = add nsw i32 %.1639262.us, 1
  %947 = icmp sgt i32 %946, 0
  br i1 %947, label %.lr.ph258.us.preheader, label %._crit_edge259.us

.lr.ph258.us.preheader:                           ; preds = %941
  %948 = sext i32 %.17253.us to i64
  br label %.lr.ph258.us

._crit_edge259.us.loopexit:                       ; preds = %.lr.ph258.us
  %949 = trunc i64 %indvars.iv.next449 to i32
  br label %._crit_edge259.us

._crit_edge259.us:                                ; preds = %._crit_edge259.us.loopexit, %941
  %.010.lcssa.us = phi float [ %944, %941 ], [ %954, %._crit_edge259.us.loopexit ]
  %.17.lcssa.us = phi i32 [ %.17253.us, %941 ], [ %949, %._crit_edge259.us.loopexit ]
  %950 = fpext float %.010.lcssa.us to double
  %951 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv451
  store double %950, double* %951, align 8
  %indvars.iv.next452 = add nuw nsw i64 %indvars.iv451, 1
  %exitcond454 = icmp eq i64 %indvars.iv.next452, %wide.trip.count453
  br i1 %exitcond454, label %..preheader141_crit_edge.us, label %941

.lr.ph258.us:                                     ; preds = %.lr.ph258.us.preheader, %.lr.ph258.us
  %indvars.iv448 = phi i64 [ %948, %.lr.ph258.us.preheader ], [ %indvars.iv.next449, %.lr.ph258.us ]
  %.010255.us = phi float [ %944, %.lr.ph258.us.preheader ], [ %954, %.lr.ph258.us ]
  %.011254.us = phi i32 [ %946, %.lr.ph258.us.preheader ], [ %955, %.lr.ph258.us ]
  %952 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 %indvars.iv466, i64 %indvars.iv448
  %953 = load float, float* %952, align 4
  %954 = fadd float %.010255.us, %953
  %955 = add nsw i32 %.011254.us, -1
  %indvars.iv.next449 = add nsw i64 %indvars.iv448, 1
  %956 = icmp sgt i32 %.011254.us, 1
  br i1 %956, label %.lr.ph258.us, label %._crit_edge259.us.loopexit

..preheader141_crit_edge.us:                      ; preds = %._crit_edge259.us
  br i1 %885, label %.lr.ph272.us.preheader, label %.preheader140.us.preheader

.lr.ph272.us.preheader:                           ; preds = %..preheader141_crit_edge.us
  br label %.lr.ph272.us

.preheader140.us.preheader.loopexit:              ; preds = %._crit_edge269.us
  br label %.preheader140.us.preheader

.preheader140.us.preheader:                       ; preds = %.preheader140.us.preheader.loopexit, %..preheader141_crit_edge.us
  br label %.preheader140.us

.lr.ph268.us:                                     ; preds = %.lr.ph272.us
  %957 = load i32, i32* %925, align 4
  %958 = sext i32 %924 to i64
  %959 = sext i32 %957 to i64
  br label %928

.lr.ph278.us:                                     ; preds = %.preheader140.us
  %960 = load i32, i32* %897, align 4
  %961 = sext i32 %.11273.us to i64
  %962 = sext i32 %960 to i64
  br label %915

.preheader145:                                    ; preds = %.preheader145.preheader, %._crit_edge249
  %indvars.iv432 = phi i64 [ %indvars.iv.next433, %._crit_edge249 ], [ 0, %.preheader145.preheader ]
  %963 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.w1_l, i64 0, i64 %indvars.iv432
  %964 = load double, double* %963, align 8
  %965 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bu_l, i64 0, i64 %indvars.iv432
  %966 = load i32, i32* %965, align 4
  %967 = sext i32 %966 to i64
  %968 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %967
  %969 = load double, double* %968, align 8
  %970 = fmul double %964, %969
  %971 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.w2_l, i64 0, i64 %indvars.iv432
  %972 = load double, double* %971, align 8
  %973 = getelementptr inbounds [21 x i32], [21 x i32]* @L3psycho_anal.bo_l, i64 0, i64 %indvars.iv432
  %974 = load i32, i32* %973, align 4
  %975 = sext i32 %974 to i64
  %976 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %975
  %977 = load double, double* %976, align 8
  %978 = fmul double %972, %977
  %979 = fadd double %970, %978
  %980 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %967
  %981 = load double, double* %980, align 8
  %982 = fmul double %964, %981
  %983 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %975
  %984 = load double, double* %983, align 8
  %985 = fmul double %972, %984
  %986 = fadd double %982, %985
  %.8243 = add nsw i32 %966, 1
  %987 = load i32, i32* %973, align 4
  %988 = icmp slt i32 %.8243, %987
  br i1 %988, label %.lr.ph248, label %._crit_edge249

.lr.ph248:                                        ; preds = %.preheader145
  %989 = load i32, i32* %973, align 4
  %990 = sext i32 %.8243 to i64
  %991 = sext i32 %989 to i64
  br label %992

; <label>:992:                                    ; preds = %.lr.ph248, %992
  %indvars.iv430 = phi i64 [ %990, %.lr.ph248 ], [ %indvars.iv.next431, %992 ]
  %.058245 = phi double [ %986, %.lr.ph248 ], [ %995, %992 ]
  %.059244 = phi double [ %979, %.lr.ph248 ], [ %998, %992 ]
  %993 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %indvars.iv430
  %994 = load double, double* %993, align 8
  %995 = fadd double %.058245, %994
  %996 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv430
  %997 = load double, double* %996, align 8
  %998 = fadd double %.059244, %997
  %indvars.iv.next431 = add nsw i64 %indvars.iv430, 1
  %999 = icmp slt i64 %indvars.iv.next431, %991
  br i1 %999, label %992, label %._crit_edge249.loopexit

._crit_edge249.loopexit:                          ; preds = %992
  br label %._crit_edge249

._crit_edge249:                                   ; preds = %._crit_edge249.loopexit, %.preheader145
  %.059.lcssa = phi double [ %979, %.preheader145 ], [ %998, %._crit_edge249.loopexit ]
  %.058.lcssa = phi double [ %986, %.preheader145 ], [ %995, %._crit_edge249.loopexit ]
  %1000 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %indvars.iv469, i32 0, i64 %indvars.iv432
  store double %.059.lcssa, double* %1000, align 8
  %1001 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %indvars.iv469, i32 0, i64 %indvars.iv432
  store double %.058.lcssa, double* %1001, align 8
  %indvars.iv.next433 = add nuw nsw i64 %indvars.iv432, 1
  %exitcond434 = icmp eq i64 %indvars.iv.next433, 21
  br i1 %exitcond434, label %.preheader144, label %.preheader145

.preheader142:                                    ; preds = %.preheader142.preheader, %1062
  %indvars.iv445 = phi i64 [ %indvars.iv.next446, %1062 ], [ 0, %.preheader142.preheader ]
  br i1 %885, label %.lr.ph272.preheader, label %.preheader140.preheader

.lr.ph272.preheader:                              ; preds = %.preheader142
  br label %.lr.ph272

.lr.ph272:                                        ; preds = %.lr.ph272.preheader, %._crit_edge269
  %indvars.iv437 = phi i64 [ %indvars.iv.next438, %._crit_edge269 ], [ 0, %.lr.ph272.preheader ]
  %1002 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv437, i64 0
  %1003 = load i32, i32* %1002, align 8
  %1004 = getelementptr inbounds [63 x [2 x i32]], [63 x [2 x i32]]* @L3psycho_anal.s3ind_s, i64 0, i64 %indvars.iv437, i64 1
  %1005 = load i32, i32* %1004, align 4
  %1006 = icmp sgt i32 %1003, %1005
  br i1 %1006, label %._crit_edge269, label %.lr.ph268

.lr.ph268:                                        ; preds = %.lr.ph272
  %1007 = load i32, i32* %1004, align 4
  %1008 = sext i32 %1003 to i64
  %1009 = sext i32 %1007 to i64
  br label %1010

; <label>:1010:                                   ; preds = %1010, %.lr.ph268
  %indvars.iv435 = phi i64 [ %indvars.iv.next436, %1010 ], [ %1008, %.lr.ph268 ]
  %.09266 = phi double [ %1016, %1010 ], [ 0.000000e+00, %.lr.ph268 ]
  %1011 = getelementptr inbounds [64 x [64 x double]], [64 x [64 x double]]* @L3psycho_anal.s3_s, i64 0, i64 %indvars.iv437, i64 %indvars.iv435
  %1012 = load double, double* %1011, align 8
  %1013 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv435
  %1014 = load double, double* %1013, align 8
  %1015 = fmul double %1012, %1014
  %1016 = fadd double %.09266, %1015
  %indvars.iv.next436 = add nsw i64 %indvars.iv435, 1
  %1017 = icmp slt i64 %indvars.iv435, %1009
  br i1 %1017, label %1010, label %._crit_edge269.loopexit

._crit_edge269.loopexit:                          ; preds = %1010
  br label %._crit_edge269

._crit_edge269:                                   ; preds = %._crit_edge269.loopexit, %.lr.ph272
  %.09.lcssa = phi double [ 0.000000e+00, %.lr.ph272 ], [ %1016, %._crit_edge269.loopexit ]
  %1018 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.qthr_s, i64 0, i64 %indvars.iv437
  %1019 = load double, double* %1018, align 8
  %1020 = fcmp ogt double %1019, %.09.lcssa
  %1021 = select i1 %1020, double %1019, double %.09.lcssa
  %1022 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %indvars.iv437
  store double %1021, double* %1022, align 8
  %indvars.iv.next438 = add nuw nsw i64 %indvars.iv437, 1
  %exitcond439 = icmp eq i64 %indvars.iv.next438, %wide.trip.count
  br i1 %exitcond439, label %.preheader140.preheader.loopexit, label %.lr.ph272

.preheader140.preheader.loopexit:                 ; preds = %._crit_edge269
  br label %.preheader140.preheader

.preheader140.preheader:                          ; preds = %.preheader140.preheader.loopexit, %.preheader142
  br label %.preheader140

.preheader140:                                    ; preds = %.preheader140.preheader, %._crit_edge279
  %indvars.iv442 = phi i64 [ %indvars.iv.next443, %._crit_edge279 ], [ 0, %.preheader140.preheader ]
  %1023 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w1_s, i64 0, i64 %indvars.iv442
  %1024 = load double, double* %1023, align 8
  %1025 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bu_s, i64 0, i64 %indvars.iv442
  %1026 = load i32, i32* %1025, align 4
  %1027 = sext i32 %1026 to i64
  %1028 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1027
  %1029 = load double, double* %1028, align 8
  %1030 = fmul double %1024, %1029
  %1031 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.w2_s, i64 0, i64 %indvars.iv442
  %1032 = load double, double* %1031, align 8
  %1033 = getelementptr inbounds [12 x i32], [12 x i32]* @L3psycho_anal.bo_s, i64 0, i64 %indvars.iv442
  %1034 = load i32, i32* %1033, align 4
  %1035 = sext i32 %1034 to i64
  %1036 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %1035
  %1037 = load double, double* %1036, align 8
  %1038 = fmul double %1032, %1037
  %1039 = fadd double %1030, %1038
  %1040 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1027
  %1041 = load double, double* %1040, align 8
  %1042 = fmul double %1024, %1041
  %1043 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %1035
  %1044 = load double, double* %1043, align 8
  %1045 = fmul double %1032, %1044
  %1046 = fadd double %1042, %1045
  %.11273 = add nsw i32 %1026, 1
  %1047 = load i32, i32* %1033, align 4
  %1048 = icmp slt i32 %.11273, %1047
  br i1 %1048, label %.lr.ph278, label %._crit_edge279

.lr.ph278:                                        ; preds = %.preheader140
  %1049 = load i32, i32* %1033, align 4
  %1050 = sext i32 %.11273 to i64
  %1051 = sext i32 %1049 to i64
  br label %1052

; <label>:1052:                                   ; preds = %.lr.ph278, %1052
  %indvars.iv440 = phi i64 [ %1050, %.lr.ph278 ], [ %indvars.iv.next441, %1052 ]
  %.07275 = phi double [ %1046, %.lr.ph278 ], [ %1055, %1052 ]
  %.08274 = phi double [ %1039, %.lr.ph278 ], [ %1058, %1052 ]
  %1053 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.thr, i64 0, i64 %indvars.iv440
  %1054 = load double, double* %1053, align 8
  %1055 = fadd double %.07275, %1054
  %1056 = getelementptr inbounds [63 x double], [63 x double]* @L3psycho_anal.eb, i64 0, i64 %indvars.iv440
  %1057 = load double, double* %1056, align 8
  %1058 = fadd double %.08274, %1057
  %indvars.iv.next441 = add nsw i64 %indvars.iv440, 1
  %1059 = icmp slt i64 %indvars.iv.next441, %1051
  br i1 %1059, label %1052, label %._crit_edge279.loopexit

._crit_edge279.loopexit:                          ; preds = %1052
  br label %._crit_edge279

._crit_edge279:                                   ; preds = %._crit_edge279.loopexit, %.preheader140
  %.08.lcssa = phi double [ %1039, %.preheader140 ], [ %1058, %._crit_edge279.loopexit ]
  %.07.lcssa = phi double [ %1046, %.preheader140 ], [ %1055, %._crit_edge279.loopexit ]
  %1060 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 %indvars.iv469, i32 1, i64 %indvars.iv442, i64 %indvars.iv445
  store double %.08.lcssa, double* %1060, align 8
  %1061 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %indvars.iv469, i32 1, i64 %indvars.iv442, i64 %indvars.iv445
  store double %.07.lcssa, double* %1061, align 8
  %indvars.iv.next443 = add nuw nsw i64 %indvars.iv442, 1
  %exitcond444 = icmp eq i64 %indvars.iv.next443, 12
  br i1 %exitcond444, label %1062, label %.preheader140

; <label>:1062:                                   ; preds = %._crit_edge279
  %indvars.iv.next446 = add nuw nsw i64 %indvars.iv445, 1
  %exitcond447 = icmp eq i64 %indvars.iv.next446, 3
  br i1 %exitcond447, label %.us-lcssa.us.loopexit722, label %.preheader142

.us-lcssa.us.loopexit:                            ; preds = %886
  br label %.us-lcssa.us

.us-lcssa.us.loopexit722:                         ; preds = %1062
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit722, %.us-lcssa.us.loopexit
  %indvars.iv.next470 = add nuw nsw i64 %indvars.iv469, 1
  %exitcond472 = icmp eq i64 %indvars.iv.next470, %wide.trip.count471
  br i1 %exitcond472, label %._crit_edge287, label %337

._crit_edge287:                                   ; preds = %.us-lcssa.us
  %1063 = icmp eq i32 %., 4
  br i1 %1063, label %.preheader139.preheader, label %.loopexit

.preheader139.preheader:                          ; preds = %._crit_edge287
  br label %.preheader139

.preheader139:                                    ; preds = %.preheader139.preheader, %1106
  %indvars.iv388 = phi i64 [ %indvars.iv.next389, %1106 ], [ 0, %.preheader139.preheader ]
  %1064 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0, i64 %indvars.iv388
  %1065 = load double, double* %1064, align 8
  %1066 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0, i64 %indvars.iv388
  %1067 = load double, double* %1066, align 8
  %1068 = fmul double %1067, 1.580000e+00
  %1069 = fcmp ugt double %1065, %1068
  %1070 = fmul double %1065, 1.580000e+00
  %1071 = fcmp ugt double %1067, %1070
  %or.cond127 = or i1 %1071, %1069
  br i1 %or.cond127, label %1106, label %1072

; <label>:1072:                                   ; preds = %.preheader139
  %1073 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.mld_l, i64 0, i64 %indvars.iv388
  %1074 = load double, double* %1073, align 8
  %1075 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 3, i32 0, i64 %indvars.iv388
  %1076 = load double, double* %1075, align 8
  %1077 = fmul double %1074, %1076
  %1078 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 2, i32 0, i64 %indvars.iv388
  %1079 = load double, double* %1078, align 8
  %1080 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 3, i32 0, i64 %indvars.iv388
  %1081 = load double, double* %1080, align 8
  %1082 = fcmp olt double %1081, %1077
  %1083 = select i1 %1082, double %1081, double %1077
  %1084 = fcmp ogt double %1079, %1083
  br i1 %1084, label %.sink.split118, label %1085

; <label>:1085:                                   ; preds = %1072
  %1086 = load double, double* %1080, align 8
  %1087 = fcmp olt double %1086, %1077
  br i1 %1087, label %.sink.split118, label %1089

.sink.split118:                                   ; preds = %1085, %1072
  %.sink119 = phi double* [ %1078, %1072 ], [ %1080, %1085 ]
  %1088 = load double, double* %.sink119, align 8
  br label %1089

; <label>:1089:                                   ; preds = %.sink.split118, %1085
  %1090 = phi double [ %1077, %1085 ], [ %1088, %.sink.split118 ]
  %1091 = load double, double* %1073, align 8
  %1092 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 2, i32 0, i64 %indvars.iv388
  %1093 = load double, double* %1092, align 8
  %1094 = fmul double %1091, %1093
  %1095 = load double, double* %1080, align 8
  %1096 = load double, double* %1078, align 8
  %1097 = fcmp olt double %1096, %1094
  %1098 = select i1 %1097, double %1096, double %1094
  %1099 = fcmp ogt double %1095, %1098
  br i1 %1099, label %.sink.split120, label %1100

; <label>:1100:                                   ; preds = %1089
  %1101 = load double, double* %1078, align 8
  %1102 = fcmp olt double %1101, %1094
  br i1 %1102, label %.sink.split120, label %1104

.sink.split120:                                   ; preds = %1100, %1089
  %.sink121 = phi double* [ %1080, %1089 ], [ %1078, %1100 ]
  %1103 = load double, double* %.sink121, align 8
  br label %1104

; <label>:1104:                                   ; preds = %.sink.split120, %1100
  %1105 = phi double [ %1094, %1100 ], [ %1103, %.sink.split120 ]
  store double %1090, double* %1078, align 8
  store double %1105, double* %1080, align 8
  br label %1106

; <label>:1106:                                   ; preds = %1104, %.preheader139
  %indvars.iv.next389 = add nuw nsw i64 %indvars.iv388, 1
  %exitcond390 = icmp eq i64 %indvars.iv.next389, 21
  br i1 %exitcond390, label %.preheader526.preheader, label %.preheader139

.preheader526.preheader:                          ; preds = %1106
  br label %.preheader526

.preheader526:                                    ; preds = %.preheader526.preheader, %1378
  %indvars.iv385 = phi i64 [ %indvars.iv.next386, %1378 ], [ 0, %.preheader526.preheader ]
  %1107 = getelementptr inbounds [12 x double], [12 x double]* @L3psycho_anal.mld_s, i64 0, i64 %indvars.iv385
  %1108 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1, i64 %indvars.iv385, i64 0
  %1109 = load double, double* %1108, align 8
  %1110 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1, i64 %indvars.iv385, i64 0
  %1111 = load double, double* %1110, align 8
  %1112 = fmul double %1111, 1.580000e+00
  %1113 = fcmp ugt double %1109, %1112
  %1114 = fmul double %1109, 1.580000e+00
  %1115 = fcmp ugt double %1111, %1114
  %or.cond129 = or i1 %1115, %1113
  br i1 %or.cond129, label %1149, label %1116

; <label>:1116:                                   ; preds = %.preheader526
  %1117 = load double, double* %1107, align 8
  %1118 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 3, i32 1, i64 %indvars.iv385, i64 0
  %1119 = load double, double* %1118, align 8
  %1120 = fmul double %1117, %1119
  %1121 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 2, i32 1, i64 %indvars.iv385, i64 0
  %1122 = load double, double* %1121, align 8
  %1123 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 3, i32 1, i64 %indvars.iv385, i64 0
  %1124 = load double, double* %1123, align 8
  %1125 = fcmp olt double %1124, %1120
  %1126 = select i1 %1125, double %1124, double %1120
  %1127 = fcmp ogt double %1122, %1126
  br i1 %1127, label %.sink.split122, label %1128

; <label>:1128:                                   ; preds = %1116
  %1129 = load double, double* %1123, align 8
  %1130 = fcmp olt double %1129, %1120
  br i1 %1130, label %.sink.split122, label %1132

.sink.split122:                                   ; preds = %1128, %1116
  %.sink123 = phi double* [ %1121, %1116 ], [ %1123, %1128 ]
  %1131 = load double, double* %.sink123, align 8
  br label %1132

; <label>:1132:                                   ; preds = %.sink.split122, %1128
  %1133 = phi double [ %1120, %1128 ], [ %1131, %.sink.split122 ]
  %1134 = load double, double* %1107, align 8
  %1135 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 2, i32 1, i64 %indvars.iv385, i64 0
  %1136 = load double, double* %1135, align 8
  %1137 = fmul double %1134, %1136
  %1138 = load double, double* %1123, align 8
  %1139 = load double, double* %1121, align 8
  %1140 = fcmp olt double %1139, %1137
  %1141 = select i1 %1140, double %1139, double %1137
  %1142 = fcmp ogt double %1138, %1141
  br i1 %1142, label %.sink.split124, label %1143

; <label>:1143:                                   ; preds = %1132
  %1144 = load double, double* %1121, align 8
  %1145 = fcmp olt double %1144, %1137
  br i1 %1145, label %.sink.split124, label %1147

.sink.split124:                                   ; preds = %1143, %1132
  %.sink125 = phi double* [ %1123, %1132 ], [ %1121, %1143 ]
  %1146 = load double, double* %.sink125, align 8
  br label %1147

; <label>:1147:                                   ; preds = %.sink.split124, %1143
  %1148 = phi double [ %1137, %1143 ], [ %1146, %.sink.split124 ]
  store double %1133, double* %1121, align 8
  store double %1148, double* %1123, align 8
  br label %1149

; <label>:1149:                                   ; preds = %1147, %.preheader526
  %1150 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1, i64 %indvars.iv385, i64 1
  %1151 = load double, double* %1150, align 8
  %1152 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1, i64 %indvars.iv385, i64 1
  %1153 = load double, double* %1152, align 8
  %1154 = fmul double %1153, 1.580000e+00
  %1155 = fcmp ugt double %1151, %1154
  %1156 = fmul double %1151, 1.580000e+00
  %1157 = fcmp ugt double %1153, %1156
  %or.cond129.1 = or i1 %1157, %1155
  br i1 %or.cond129.1, label %1336, label %1303

.loopexit.loopexit:                               ; preds = %1378
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %327, %._crit_edge287
  %1158 = phi i1 [ false, %._crit_edge287 ], [ false, %327 ], [ %1063, %.loopexit.loopexit ]
  %1159 = load i32, i32* %330, align 4
  %1160 = icmp eq i32 %1159, 1
  br i1 %1160, label %.preheader136.preheader, label %1197

.preheader136.preheader:                          ; preds = %.loopexit
  br label %.preheader136

.preheader136:                                    ; preds = %.preheader136.preheader, %1174
  %indvars.iv379 = phi i64 [ %indvars.iv.next380, %1174 ], [ 5, %.preheader136.preheader ]
  %.0181 = phi double [ %1175, %1174 ], [ 0.000000e+00, %.preheader136.preheader ]
  %.02180 = phi double [ %1176, %1174 ], [ 0.000000e+00, %.preheader136.preheader ]
  %1161 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 0, i64 %indvars.iv379
  %1162 = load double, double* %1161, align 8
  %1163 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 0, i64 %indvars.iv379
  %1164 = load double, double* %1163, align 8
  %not.133 = fcmp uge double %1162, %1164
  %.sink = zext i1 %not.133 to i64
  %1165 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink, i32 0, i64 %indvars.iv379
  %1166 = load double, double* %1165, align 8
  %not.134 = fcmp ule double %1162, %1164
  %.sink107 = zext i1 %not.134 to i64
  %1167 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink107, i32 0, i64 %indvars.iv379
  %1168 = load double, double* %1167, align 8
  %1169 = fmul double %1166, 1.000000e+03
  %1170 = fcmp ult double %1168, %1169
  br i1 %1170, label %1171, label %1174

; <label>:1171:                                   ; preds = %.preheader136
  %1172 = fdiv double %1168, %1166
  %1173 = tail call double @log10(double %1172) #6
  br label %1174

; <label>:1174:                                   ; preds = %1171, %.preheader136
  %.05 = phi double [ %1173, %1171 ], [ 3.000000e+00, %.preheader136 ]
  %1175 = fadd double %.0181, 1.000000e+00
  %1176 = fadd double %.02180, %.05
  %indvars.iv.next380 = add nuw nsw i64 %indvars.iv379, 1
  %exitcond381 = icmp eq i64 %indvars.iv.next380, 21
  br i1 %exitcond381, label %.preheader135, label %.preheader136

.preheader135:                                    ; preds = %1174
  %1177 = fdiv double %1176, %1175
  %1178 = fmul double %1177, 7.000000e-01
  %1179 = fcmp olt double %1178, 5.000000e-01
  br label %1180

; <label>:1180:                                   ; preds = %1194, %.preheader135
  %indvars.iv372 = phi i64 [ 3, %.preheader135 ], [ %indvars.iv.next373, %1194 ]
  %.2175 = phi double [ 0.000000e+00, %.preheader135 ], [ %1195, %1194 ]
  %.24174 = phi double [ 0.000000e+00, %.preheader135 ], [ %1196, %1194 ]
  %1181 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1, i64 %indvars.iv372, i64 0
  %1182 = load double, double* %1181, align 8
  %1183 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1, i64 %indvars.iv372, i64 0
  %1184 = load double, double* %1183, align 8
  %not.131 = fcmp uge double %1182, %1184
  %.sink109 = zext i1 %not.131 to i64
  %1185 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink109, i32 1, i64 %indvars.iv372, i64 0
  %1186 = load double, double* %1185, align 8
  %not.132 = fcmp ule double %1182, %1184
  %.sink110 = zext i1 %not.132 to i64
  %1187 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink110, i32 1, i64 %indvars.iv372, i64 0
  %1188 = load double, double* %1187, align 8
  %1189 = fmul double %1186, 1.000000e+03
  %1190 = fcmp ult double %1188, %1189
  br i1 %1190, label %1191, label %1194

; <label>:1191:                                   ; preds = %1180
  %1192 = fdiv double %1188, %1186
  %1193 = tail call double @log10(double %1192) #6
  br label %1194

; <label>:1194:                                   ; preds = %1191, %1180
  %.16 = phi double [ %1193, %1191 ], [ 3.000000e+00, %1180 ]
  %1195 = fadd double %.2175, 1.000000e+00
  %1196 = fadd double %.24174, %.16
  %indvars.iv.next373 = add nuw nsw i64 %indvars.iv372, 1
  %exitcond = icmp eq i64 %indvars.iv.next373, 12
  br i1 %exitcond, label %.preheader135.1377.preheader, label %1180

.preheader135.1377.preheader:                     ; preds = %1194
  br label %.preheader135.1377

; <label>:1197:                                   ; preds = %1299, %.loopexit
  %.013 = phi double [ %.111, %1299 ], [ 0.000000e+00, %.loopexit ]
  %.012 = phi double [ %.108, %1299 ], [ 0.000000e+00, %.loopexit ]
  %1198 = load i32, i32* %328, align 4
  %1199 = icmp sgt i32 %1198, 0
  br i1 %1199, label %._crit_edge172, label %._crit_edge

._crit_edge172:                                   ; preds = %1197
  %1200 = load i32, i32* %328, align 4
  %1201 = icmp sgt i32 %1200, 1
  %smax = select i1 %1201, i32 %1200, i32 1
  %1202 = add nsw i32 %smax, -1
  %1203 = zext i32 %1202 to i64
  %1204 = shl nuw nsw i64 %1203, 2
  %1205 = add nuw nsw i64 %1204, 4
  call void @llvm.memset.p0i8.i64(i8* nonnull %14, i8 0, i64 %1205, i32 4, i1 false)
  %1206 = icmp eq i32 %1200, 2
  br i1 %1206, label %1207, label %.preheader

; <label>:1207:                                   ; preds = %._crit_edge172
  %1208 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 36
  %1209 = load i32, i32* %1208, align 4
  %1210 = icmp eq i32 %1209, 0
  br i1 %1210, label %1214, label %1211

; <label>:1211:                                   ; preds = %1207
  %1212 = load i32, i32* %330, align 4
  %1213 = icmp eq i32 %1212, 1
  br i1 %1213, label %1214, label %.preheader

; <label>:1214:                                   ; preds = %1207, %1211
  %1215 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 0
  %1216 = load i32, i32* %1215, align 4
  %1217 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 1
  %1218 = load i32, i32* %1217, align 4
  %1219 = icmp ne i32 %1218, 0
  %not. = icmp ne i32 %1216, 0
  %1220 = and i1 %not., %1219
  br i1 %1220, label %.preheader, label %1221

; <label>:1221:                                   ; preds = %1214
  store i32 0, i32* %1215, align 4
  store i32 0, i32* %1217, align 4
  br label %.preheader

.preheader:                                       ; preds = %1211, %1221, %1214, %._crit_edge172
  %.pr = load i32, i32* %328, align 4
  %1222 = icmp sgt i32 %.pr, 0
  br i1 %1222, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %1239
  %indvars.iv = phi i64 [ %indvars.iv.next, %1239 ], [ 0, %.lr.ph.preheader ]
  %1223 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i64 0, i64 %indvars.iv
  %1224 = load i32, i32* %1223, align 4
  %1225 = icmp eq i32 %1224, 0
  br i1 %1225, label %1234, label %1226

; <label>:1226:                                   ; preds = %.lr.ph
  %1227 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %indvars.iv
  %1228 = load i32, i32* %1227, align 4
  switch i32 %1228, label %1239 [
    i32 0, label %1229
    i32 3, label %1229
    i32 2, label %.sink.split
    i32 1, label %1230
  ]

; <label>:1229:                                   ; preds = %1226, %1226
  br label %.sink.split

; <label>:1230:                                   ; preds = %1226
  %1231 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1232 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %1231) #7
  tail call void @abort() #8
  unreachable

.sink.split:                                      ; preds = %1226, %1229
  %.sink112 = phi i32 [ 0, %1229 ], [ 3, %1226 ]
  %1233 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 %indvars.iv
  store i32 %.sink112, i32* %1233, align 4
  br label %1239

; <label>:1234:                                   ; preds = %.lr.ph
  %1235 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 %indvars.iv
  store i32 2, i32* %1235, align 4
  %1236 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %indvars.iv
  %1237 = load i32, i32* %1236, align 4
  switch i32 %1237, label %1239 [
    i32 0, label %.thread
    i32 3, label %1238
  ]

.thread:                                          ; preds = %1234
  store i32 1, i32* %1236, align 4
  br label %1239

; <label>:1238:                                   ; preds = %1234
  store i32 2, i32* %1236, align 4
  br label %1239

; <label>:1239:                                   ; preds = %1234, %.thread, %1238, %1226, %.sink.split
  %1240 = getelementptr inbounds [2 x i32], [2 x i32]* @L3psycho_anal.blocktype_old, i64 0, i64 %indvars.iv
  %1241 = load i32, i32* %1240, align 4
  %1242 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv
  store i32 %1241, i32* %1242, align 4
  %1243 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 %indvars.iv
  %1244 = load i32, i32* %1243, align 4
  store i32 %1244, i32* %1240, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %1245 = load i32, i32* %328, align 4
  %1246 = sext i32 %1245 to i64
  %1247 = icmp slt i64 %indvars.iv.next, %1246
  br i1 %1247, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %1239
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1197, %.preheader
  %1248 = load i32, i32* %10, align 4
  %1249 = icmp eq i32 %1248, 2
  %.val = load i64, i64* bitcast (double* @L3psycho_anal.ms_ratio_s_old to i64*), align 8
  %.val130 = load i64, i64* bitcast (double* @L3psycho_anal.ms_ratio_l_old to i64*), align 8
  %1250 = select i1 %1249, i64 %.val, i64 %.val130
  %1251 = bitcast double* %3 to i64*
  store i64 %1250, i64* %1251, align 8
  store double %.013, double* @L3psycho_anal.ms_ratio_s_old, align 8
  store double %.012, double* @L3psycho_anal.ms_ratio_l_old, align 8
  store double %.012, double* %4, align 8
  br i1 %1158, label %1252, label %1265

; <label>:1252:                                   ; preds = %._crit_edge
  %1253 = getelementptr inbounds [4 x float], [4 x float]* %12, i64 0, i64 3
  %1254 = load float, float* %1253, align 4
  %1255 = getelementptr inbounds [4 x float], [4 x float]* %12, i64 0, i64 2
  %1256 = load float, float* %1255, align 8
  %1257 = fadd float %1254, %1256
  %1258 = load i64, i64* bitcast (double* @L3psycho_anal.ms_ener_ratio_old to i64*), align 8
  %1259 = bitcast double* %5 to i64*
  store i64 %1258, i64* %1259, align 8
  store double 0.000000e+00, double* @L3psycho_anal.ms_ener_ratio_old, align 8
  %1260 = fcmp ogt float %1257, 0.000000e+00
  br i1 %1260, label %1261, label %1266

; <label>:1261:                                   ; preds = %1252
  %1262 = load float, float* %1253, align 4
  %1263 = fdiv float %1262, %1257
  %1264 = fpext float %1263 to double
  store double %1264, double* @L3psycho_anal.ms_ener_ratio_old, align 8
  br label %1266

; <label>:1265:                                   ; preds = %._crit_edge
  store double 0.000000e+00, double* %5, align 8
  br label %1266

; <label>:1266:                                   ; preds = %1252, %1261, %1265
  ret void

.preheader135.1377:                               ; preds = %.preheader135.1377.preheader, %1280
  %indvars.iv372.1 = phi i64 [ %indvars.iv.next373.1, %1280 ], [ 3, %.preheader135.1377.preheader ]
  %.2175.1 = phi double [ %1281, %1280 ], [ %1195, %.preheader135.1377.preheader ]
  %.24174.1 = phi double [ %1282, %1280 ], [ %1196, %.preheader135.1377.preheader ]
  %1267 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1, i64 %indvars.iv372.1, i64 1
  %1268 = load double, double* %1267, align 8
  %1269 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1, i64 %indvars.iv372.1, i64 1
  %1270 = load double, double* %1269, align 8
  %not.131.1 = fcmp uge double %1268, %1270
  %.sink109.1 = zext i1 %not.131.1 to i64
  %1271 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink109.1, i32 1, i64 %indvars.iv372.1, i64 1
  %1272 = load double, double* %1271, align 8
  %not.132.1 = fcmp ule double %1268, %1270
  %.sink110.1 = zext i1 %not.132.1 to i64
  %1273 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink110.1, i32 1, i64 %indvars.iv372.1, i64 1
  %1274 = load double, double* %1273, align 8
  %1275 = fmul double %1272, 1.000000e+03
  %1276 = fcmp ult double %1274, %1275
  br i1 %1276, label %1277, label %1280

; <label>:1277:                                   ; preds = %.preheader135.1377
  %1278 = fdiv double %1274, %1272
  %1279 = tail call double @log10(double %1278) #6
  br label %1280

; <label>:1280:                                   ; preds = %1277, %.preheader135.1377
  %.16.1 = phi double [ %1279, %1277 ], [ 3.000000e+00, %.preheader135.1377 ]
  %1281 = fadd double %.2175.1, 1.000000e+00
  %1282 = fadd double %.24174.1, %.16.1
  %indvars.iv.next373.1 = add nuw nsw i64 %indvars.iv372.1, 1
  %exitcond.1 = icmp eq i64 %indvars.iv.next373.1, 12
  br i1 %exitcond.1, label %.preheader135.2378.preheader, label %.preheader135.1377

.preheader135.2378.preheader:                     ; preds = %1280
  br label %.preheader135.2378

.preheader135.2378:                               ; preds = %.preheader135.2378.preheader, %1296
  %indvars.iv372.2 = phi i64 [ %indvars.iv.next373.2, %1296 ], [ 3, %.preheader135.2378.preheader ]
  %.2175.2 = phi double [ %1297, %1296 ], [ %1281, %.preheader135.2378.preheader ]
  %.24174.2 = phi double [ %1298, %1296 ], [ %1282, %.preheader135.2378.preheader ]
  %1283 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1, i64 %indvars.iv372.2, i64 2
  %1284 = load double, double* %1283, align 8
  %1285 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1, i64 %indvars.iv372.2, i64 2
  %1286 = load double, double* %1285, align 8
  %not.131.2 = fcmp uge double %1284, %1286
  %.sink109.2 = zext i1 %not.131.2 to i64
  %1287 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink109.2, i32 1, i64 %indvars.iv372.2, i64 2
  %1288 = load double, double* %1287, align 8
  %not.132.2 = fcmp ule double %1284, %1286
  %.sink110.2 = zext i1 %not.132.2 to i64
  %1289 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 %.sink110.2, i32 1, i64 %indvars.iv372.2, i64 2
  %1290 = load double, double* %1289, align 8
  %1291 = fmul double %1288, 1.000000e+03
  %1292 = fcmp ult double %1290, %1291
  br i1 %1292, label %1293, label %1296

; <label>:1293:                                   ; preds = %.preheader135.2378
  %1294 = fdiv double %1290, %1288
  %1295 = tail call double @log10(double %1294) #6
  br label %1296

; <label>:1296:                                   ; preds = %1293, %.preheader135.2378
  %.16.2 = phi double [ %1295, %1293 ], [ 3.000000e+00, %.preheader135.2378 ]
  %1297 = fadd double %.2175.2, 1.000000e+00
  %1298 = fadd double %.24174.2, %.16.2
  %indvars.iv.next373.2 = add nuw nsw i64 %indvars.iv372.2, 1
  %exitcond.2 = icmp eq i64 %indvars.iv.next373.2, 12
  br i1 %exitcond.2, label %1299, label %.preheader135.2378

; <label>:1299:                                   ; preds = %1296
  %.108 = select i1 %1179, double %1178, double 5.000000e-01
  %1300 = fdiv double %1298, %1297
  %1301 = fmul double %1300, 7.000000e-01
  %1302 = fcmp olt double %1301, 5.000000e-01
  %.111 = select i1 %1302, double %1301, double 5.000000e-01
  br label %1197

; <label>:1303:                                   ; preds = %1149
  %1304 = load double, double* %1107, align 8
  %1305 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 3, i32 1, i64 %indvars.iv385, i64 1
  %1306 = load double, double* %1305, align 8
  %1307 = fmul double %1304, %1306
  %1308 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 2, i32 1, i64 %indvars.iv385, i64 1
  %1309 = load double, double* %1308, align 8
  %1310 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 3, i32 1, i64 %indvars.iv385, i64 1
  %1311 = load double, double* %1310, align 8
  %1312 = fcmp olt double %1311, %1307
  %1313 = select i1 %1312, double %1311, double %1307
  %1314 = fcmp ogt double %1309, %1313
  br i1 %1314, label %.sink.split122.1, label %1315

; <label>:1315:                                   ; preds = %1303
  %1316 = load double, double* %1310, align 8
  %1317 = fcmp olt double %1316, %1307
  br i1 %1317, label %.sink.split122.1, label %1319

.sink.split122.1:                                 ; preds = %1315, %1303
  %.sink123.1 = phi double* [ %1308, %1303 ], [ %1310, %1315 ]
  %1318 = load double, double* %.sink123.1, align 8
  br label %1319

; <label>:1319:                                   ; preds = %.sink.split122.1, %1315
  %1320 = phi double [ %1307, %1315 ], [ %1318, %.sink.split122.1 ]
  %1321 = load double, double* %1107, align 8
  %1322 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 2, i32 1, i64 %indvars.iv385, i64 1
  %1323 = load double, double* %1322, align 8
  %1324 = fmul double %1321, %1323
  %1325 = load double, double* %1310, align 8
  %1326 = load double, double* %1308, align 8
  %1327 = fcmp olt double %1326, %1324
  %1328 = select i1 %1327, double %1326, double %1324
  %1329 = fcmp ogt double %1325, %1328
  br i1 %1329, label %.sink.split124.1, label %1330

; <label>:1330:                                   ; preds = %1319
  %1331 = load double, double* %1308, align 8
  %1332 = fcmp olt double %1331, %1324
  br i1 %1332, label %.sink.split124.1, label %1334

.sink.split124.1:                                 ; preds = %1330, %1319
  %.sink125.1 = phi double* [ %1310, %1319 ], [ %1308, %1330 ]
  %1333 = load double, double* %.sink125.1, align 8
  br label %1334

; <label>:1334:                                   ; preds = %.sink.split124.1, %1330
  %1335 = phi double [ %1324, %1330 ], [ %1333, %.sink.split124.1 ]
  store double %1320, double* %1308, align 8
  store double %1335, double* %1310, align 8
  br label %1336

; <label>:1336:                                   ; preds = %1334, %1149
  %1337 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 0, i32 1, i64 %indvars.iv385, i64 2
  %1338 = load double, double* %1337, align 8
  %1339 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 1, i32 1, i64 %indvars.iv385, i64 2
  %1340 = load double, double* %1339, align 8
  %1341 = fmul double %1340, 1.580000e+00
  %1342 = fcmp ugt double %1338, %1341
  %1343 = fmul double %1338, 1.580000e+00
  %1344 = fcmp ugt double %1340, %1343
  %or.cond129.2 = or i1 %1344, %1342
  br i1 %or.cond129.2, label %1378, label %1345

; <label>:1345:                                   ; preds = %1336
  %1346 = load double, double* %1107, align 8
  %1347 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 3, i32 1, i64 %indvars.iv385, i64 2
  %1348 = load double, double* %1347, align 8
  %1349 = fmul double %1346, %1348
  %1350 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 2, i32 1, i64 %indvars.iv385, i64 2
  %1351 = load double, double* %1350, align 8
  %1352 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.thm, i64 0, i64 3, i32 1, i64 %indvars.iv385, i64 2
  %1353 = load double, double* %1352, align 8
  %1354 = fcmp olt double %1353, %1349
  %1355 = select i1 %1354, double %1353, double %1349
  %1356 = fcmp ogt double %1351, %1355
  br i1 %1356, label %.sink.split122.2, label %1357

; <label>:1357:                                   ; preds = %1345
  %1358 = load double, double* %1352, align 8
  %1359 = fcmp olt double %1358, %1349
  br i1 %1359, label %.sink.split122.2, label %1361

.sink.split122.2:                                 ; preds = %1357, %1345
  %.sink123.2 = phi double* [ %1350, %1345 ], [ %1352, %1357 ]
  %1360 = load double, double* %.sink123.2, align 8
  br label %1361

; <label>:1361:                                   ; preds = %.sink.split122.2, %1357
  %1362 = phi double [ %1349, %1357 ], [ %1360, %.sink.split122.2 ]
  %1363 = load double, double* %1107, align 8
  %1364 = getelementptr inbounds [4 x %struct.III_psy_xmin], [4 x %struct.III_psy_xmin]* @L3psycho_anal.en, i64 0, i64 2, i32 1, i64 %indvars.iv385, i64 2
  %1365 = load double, double* %1364, align 8
  %1366 = fmul double %1363, %1365
  %1367 = load double, double* %1352, align 8
  %1368 = load double, double* %1350, align 8
  %1369 = fcmp olt double %1368, %1366
  %1370 = select i1 %1369, double %1368, double %1366
  %1371 = fcmp ogt double %1367, %1370
  br i1 %1371, label %.sink.split124.2, label %1372

; <label>:1372:                                   ; preds = %1361
  %1373 = load double, double* %1350, align 8
  %1374 = fcmp olt double %1373, %1366
  br i1 %1374, label %.sink.split124.2, label %1376

.sink.split124.2:                                 ; preds = %1372, %1361
  %.sink125.2 = phi double* [ %1352, %1361 ], [ %1350, %1372 ]
  %1375 = load double, double* %.sink125.2, align 8
  br label %1376

; <label>:1376:                                   ; preds = %.sink.split124.2, %1372
  %1377 = phi double [ %1366, %1372 ], [ %1375, %.sink.split124.2 ]
  store double %1362, double* %1350, align 8
  store double %1377, double* %1352, align 8
  br label %1378

; <label>:1378:                                   ; preds = %1376, %1336
  %indvars.iv.next386 = add nuw nsw i64 %indvars.iv385, 1
  %exitcond387 = icmp eq i64 %indvars.iv.next386, 12
  br i1 %exitcond387, label %.loopexit.loopexit, label %.preheader526

.preheader143.1398:                               ; preds = %.preheader143.1398.preheader, %.preheader143.1398
  %indvars.iv393.1 = phi i64 [ %indvars.iv.next394.1.1, %.preheader143.1398 ], [ 255, %.preheader143.1398.preheader ]
  %1379 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0, i64 1, i64 %indvars.iv393.1
  %1380 = load float, float* %1379, align 4
  %1381 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1, i64 1, i64 %indvars.iv393.1
  %1382 = load float, float* %1381, align 4
  %1383 = fadd float %1380, %1382
  %1384 = fmul float %1383, 0x3FE6A09E60000000
  store float %1384, float* %1379, align 4
  %1385 = fsub float %1380, %1382
  %1386 = fmul float %1385, 0x3FE6A09E60000000
  store float %1386, float* %1381, align 4
  %indvars.iv.next394.1397 = add nsw i64 %indvars.iv393.1, -1
  %1387 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0, i64 1, i64 %indvars.iv.next394.1397
  %1388 = load float, float* %1387, align 4
  %1389 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1, i64 1, i64 %indvars.iv.next394.1397
  %1390 = load float, float* %1389, align 4
  %1391 = fadd float %1388, %1390
  %1392 = fmul float %1391, 0x3FE6A09E60000000
  store float %1392, float* %1387, align 4
  %1393 = fsub float %1388, %1390
  %1394 = fmul float %1393, 0x3FE6A09E60000000
  store float %1394, float* %1389, align 4
  %indvars.iv.next394.1.1 = add nsw i64 %indvars.iv393.1, -2
  %1395 = icmp sgt i64 %indvars.iv393.1, 1
  br i1 %1395, label %.preheader143.1398, label %.preheader143.2399.preheader

.preheader143.2399.preheader:                     ; preds = %.preheader143.1398
  br label %.preheader143.2399

.preheader143.2399:                               ; preds = %.preheader143.2399.preheader, %.preheader143.2399
  %indvars.iv393.2 = phi i64 [ %indvars.iv.next394.1.2, %.preheader143.2399 ], [ 255, %.preheader143.2399.preheader ]
  %1396 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0, i64 0, i64 %indvars.iv393.2
  %1397 = load float, float* %1396, align 4
  %1398 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1, i64 0, i64 %indvars.iv393.2
  %1399 = load float, float* %1398, align 4
  %1400 = fadd float %1397, %1399
  %1401 = fmul float %1400, 0x3FE6A09E60000000
  store float %1401, float* %1396, align 4
  %1402 = fsub float %1397, %1399
  %1403 = fmul float %1402, 0x3FE6A09E60000000
  store float %1403, float* %1398, align 4
  %indvars.iv.next394.2 = add nsw i64 %indvars.iv393.2, -1
  %1404 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 0, i64 0, i64 %indvars.iv.next394.2
  %1405 = load float, float* %1404, align 4
  %1406 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 1, i64 0, i64 %indvars.iv.next394.2
  %1407 = load float, float* %1406, align 4
  %1408 = fadd float %1405, %1407
  %1409 = fmul float %1408, 0x3FE6A09E60000000
  store float %1409, float* %1404, align 4
  %1410 = fsub float %1405, %1407
  %1411 = fmul float %1410, 0x3FE6A09E60000000
  store float %1411, float* %1406, align 4
  %indvars.iv.next394.1.2 = add nsw i64 %indvars.iv393.2, -2
  %1412 = icmp sgt i64 %indvars.iv393.2, 1
  br i1 %1412, label %.preheader143.2399, label %.loopexit153.loopexit

scalar.ph660:                                     ; preds = %scalar.ph660.preheader, %scalar.ph660
  %indvars.iv403.1 = phi i64 [ %indvars.iv.next404.1.1, %scalar.ph660 ], [ 127, %scalar.ph660.preheader ]
  %1413 = sub nuw nsw i64 128, %indvars.iv403.1
  %1414 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %1413
  %1415 = load float, float* %1414, align 4
  %1416 = add nuw nsw i64 %indvars.iv403.1, 128
  %1417 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %1416
  %1418 = load float, float* %1417, align 4
  %1419 = fmul float %1415, %1415
  %1420 = fmul float %1418, %1418
  %1421 = fadd float %1419, %1420
  %1422 = fmul float %1421, 5.000000e-01
  %1423 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 %1413
  store float %1422, float* %1423, align 4
  %1424 = sub i64 129, %indvars.iv403.1
  %1425 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %1424
  %1426 = load float, float* %1425, align 4
  %1427 = add nsw i64 %indvars.iv403.1, 127
  %1428 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 1, i64 %1427
  %1429 = load float, float* %1428, align 4
  %1430 = fmul float %1426, %1426
  %1431 = fmul float %1429, %1429
  %1432 = fadd float %1430, %1431
  %1433 = fmul float %1432, 5.000000e-01
  %1434 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 %1424
  store float %1433, float* %1434, align 4
  %indvars.iv.next404.1.1 = add nsw i64 %indvars.iv403.1, -2
  %1435 = icmp sgt i64 %indvars.iv403.1, 1
  br i1 %1435, label %scalar.ph660, label %middle.block659.loopexit, !llvm.loop !13

middle.block659.loopexit:                         ; preds = %scalar.ph660
  br label %middle.block659

middle.block659.loopexit724:                      ; preds = %vector.body658
  br label %middle.block659

middle.block659:                                  ; preds = %middle.block659.loopexit724, %middle.block659.loopexit
  %1436 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 0
  %1437 = load float, float* %1436, align 16
  %1438 = fmul float %1437, %1437
  store float %1438, float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 0), align 16
  br i1 or (i1 icmp ult (i64 add (i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 1) to i64), i64 504), i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 1) to i64)), i1 icmp ult (i64 add (i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 2) to i64), i64 504), i64 ptrtoint (float* getelementptr inbounds ([3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 2) to i64))), label %scalar.ph638.preheader, label %vector.body636.preheader

vector.body636.preheader:                         ; preds = %middle.block659
  br label %vector.body636

scalar.ph638.preheader:                           ; preds = %middle.block659
  br label %scalar.ph638

vector.body636:                                   ; preds = %vector.body636.preheader, %vector.body636
  %index645 = phi i64 [ %index.next646, %vector.body636 ], [ 0, %vector.body636.preheader ]
  %1439 = shl i64 %index645, 1
  %offset.idx649 = sub i64 127, %1439
  %1440 = sub nuw nsw i64 128, %offset.idx649
  %1441 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %1440
  %1442 = bitcast float* %1441 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %1442, align 4
  %1443 = add nuw nsw i64 %offset.idx649, 128
  %1444 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %1443
  %1445 = getelementptr float, float* %1444, i64 -7
  %1446 = bitcast float* %1445 to <8 x float>*
  %wide.vec654 = load <8 x float>, <8 x float>* %1446, align 4
  %1447 = fmul <8 x float> %wide.vec, %wide.vec
  %1448 = shufflevector <8 x float> %1447, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %1449 = fmul <8 x float> %wide.vec654, %wide.vec654
  %1450 = shufflevector <8 x float> %1449, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %1451 = shufflevector <4 x float> %1450, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %1452 = fadd <4 x float> %1448, %1451
  %1453 = fmul <4 x float> %1452, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %1454 = sub i64 129, %offset.idx649
  %1455 = fmul <8 x float> %wide.vec, %wide.vec
  %1456 = shufflevector <8 x float> %1455, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %1457 = fmul <8 x float> %wide.vec654, %wide.vec654
  %1458 = shufflevector <8 x float> %1457, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %1459 = shufflevector <4 x float> %1458, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %1460 = fadd <4 x float> %1456, %1459
  %1461 = fmul <4 x float> %1460, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %1462 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 %1454
  %1463 = getelementptr float, float* %1462, i64 -1
  %1464 = bitcast float* %1463 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %1453, <4 x float> %1461, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %1464, align 4
  %index.next646 = add i64 %index645, 4
  %1465 = icmp eq i64 %index.next646, 64
  br i1 %1465, label %.preheader150408.loopexit723, label %vector.body636, !llvm.loop !14

scalar.ph638:                                     ; preds = %scalar.ph638.preheader, %scalar.ph638
  %indvars.iv403.2 = phi i64 [ %indvars.iv.next404.1.2, %scalar.ph638 ], [ 127, %scalar.ph638.preheader ]
  %1466 = sub nuw nsw i64 128, %indvars.iv403.2
  %1467 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %1466
  %1468 = load float, float* %1467, align 4
  %1469 = add nuw nsw i64 %indvars.iv403.2, 128
  %1470 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %1469
  %1471 = load float, float* %1470, align 4
  %1472 = fmul float %1468, %1468
  %1473 = fmul float %1471, %1471
  %1474 = fadd float %1472, %1473
  %1475 = fmul float %1474, 5.000000e-01
  %1476 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 %1466
  store float %1475, float* %1476, align 4
  %1477 = sub i64 129, %indvars.iv403.2
  %1478 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %1477
  %1479 = load float, float* %1478, align 4
  %1480 = add nsw i64 %indvars.iv403.2, 127
  %1481 = getelementptr inbounds [2 x [3 x [256 x float]]], [2 x [3 x [256 x float]]]* @L3psycho_anal.wsamp_S, i64 0, i64 %338, i64 0, i64 %1480
  %1482 = load float, float* %1481, align 4
  %1483 = fmul float %1479, %1479
  %1484 = fmul float %1482, %1482
  %1485 = fadd float %1483, %1484
  %1486 = fmul float %1485, 5.000000e-01
  %1487 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 %1477
  store float %1486, float* %1487, align 4
  %indvars.iv.next404.1.2 = add nsw i64 %indvars.iv403.2, -2
  %1488 = icmp sgt i64 %indvars.iv403.2, 1
  br i1 %1488, label %scalar.ph638, label %.preheader150408.loopexit, !llvm.loop !15

.preheader150408.loopexit:                        ; preds = %scalar.ph638
  br label %.preheader150408

.preheader150408.loopexit723:                     ; preds = %vector.body636
  br label %.preheader150408

.preheader150408:                                 ; preds = %.preheader150408.loopexit723, %.preheader150408.loopexit
  %.b1192 = load i1, i1* @L3psycho_anal.cw_lower_index, align 4
  br i1 %.b1192, label %.lr.ph194, label %.preheader149

.preheader146.1:                                  ; preds = %.preheader146.preheader, %.preheader146.1
  %indvars.iv.next428604 = phi i64 [ 65, %.preheader146.preheader ], [ %indvars.iv.next428, %.preheader146.1 ]
  %1489 = phi float [ %861, %.preheader146.preheader ], [ %1509, %.preheader146.1 ]
  %1490 = phi float [ %859, %.preheader146.preheader ], [ %1506, %.preheader146.1 ]
  %1491 = phi float [ %857, %.preheader146.preheader ], [ %1503, %.preheader146.1 ]
  %indvars.iv427603 = phi i64 [ 64, %.preheader146.preheader ], [ %indvars.iv.next428.1, %.preheader146.1 ]
  %1492 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 %indvars.iv.next428604
  %1493 = load float, float* %1492, align 4
  %1494 = fadd float %1491, %1493
  %1495 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 %indvars.iv.next428604
  %1496 = load float, float* %1495, align 4
  %1497 = fadd float %1490, %1496
  %1498 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 %indvars.iv.next428604
  %1499 = load float, float* %1498, align 4
  %1500 = fadd float %1489, %1499
  %indvars.iv.next428.1 = add nsw i64 %indvars.iv427603, 2
  %1501 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 2, i64 %indvars.iv.next428.1
  %1502 = load float, float* %1501, align 8
  %1503 = fadd float %1494, %1502
  %1504 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 1, i64 %indvars.iv.next428.1
  %1505 = load float, float* %1504, align 4
  %1506 = fadd float %1497, %1505
  %1507 = getelementptr inbounds [3 x [129 x float]], [3 x [129 x float]]* @L3psycho_anal.energy_s, i64 0, i64 0, i64 %indvars.iv.next428.1
  %1508 = load float, float* %1507, align 8
  %1509 = fadd float %1500, %1508
  %indvars.iv.next428 = or i64 %indvars.iv.next428.1, 1
  %exitcond429 = icmp eq i64 %indvars.iv.next428, 129
  br i1 %exitcond429, label %864, label %.preheader146.1

; <label>:1510:                                   ; preds = %81
  store i32 %83, i32* @L3psycho_anal.npart_l_orig, align 4
  br label %1511

; <label>:1511:                                   ; preds = %1510, %81
  %indvars.iv.next510.1 = add nsw i64 %indvars.iv509, 2
  %1512 = getelementptr inbounds [513 x i32], [513 x i32]* @L3psycho_anal.partition_l, i64 0, i64 %indvars.iv.next510.1
  %1513 = load i32, i32* %1512, align 4
  %1514 = load i32, i32* @L3psycho_anal.npart_l_orig, align 4
  %1515 = icmp sgt i32 %1513, %1514
  br i1 %1515, label %1516, label %1517

; <label>:1516:                                   ; preds = %1511
  store i32 %1513, i32* @L3psycho_anal.npart_l_orig, align 4
  br label %1517

; <label>:1517:                                   ; preds = %1516, %1511
  %indvars.iv.next510.2 = add nsw i64 %indvars.iv509, 3
  %exitcond511.2 = icmp eq i64 %indvars.iv.next510.2, 513
  br i1 %exitcond511.2, label %86, label %75

.preheader163.1:                                  ; preds = %.preheader163.preheader, %.preheader163.1
  %indvars.iv.next516606 = phi i64 [ 1, %.preheader163.preheader ], [ %indvars.iv.next516, %.preheader163.1 ]
  %indvars.iv515605 = phi i64 [ 0, %.preheader163.preheader ], [ %indvars.iv.next516.1, %.preheader163.1 ]
  %1518 = trunc i64 %indvars.iv.next516606 to i32
  %1519 = sitofp i32 %1518 to double
  %1520 = fmul double %1519, 0x400921FB54442D18
  %1521 = fdiv double %1520, 2.100000e+01
  %1522 = tail call double @cos(double %1521) #6
  %1523 = fsub double 1.000000e+00, %1522
  %1524 = fmul double %1523, 1.250000e+00
  %1525 = fadd double %1524, -2.500000e+00
  %1526 = tail call double @pow(double 1.000000e+01, double %1525) #6
  %1527 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.mld_l, i64 0, i64 %indvars.iv.next516606
  store double %1526, double* %1527, align 8
  %indvars.iv.next516.1 = add nsw i64 %indvars.iv515605, 2
  %1528 = trunc i64 %indvars.iv.next516.1 to i32
  %1529 = sitofp i32 %1528 to double
  %1530 = fmul double %1529, 0x400921FB54442D18
  %1531 = fdiv double %1530, 2.100000e+01
  %1532 = tail call double @cos(double %1531) #6
  %1533 = fsub double 1.000000e+00, %1532
  %1534 = fmul double %1533, 1.250000e+00
  %1535 = fadd double %1534, -2.500000e+00
  %1536 = tail call double @pow(double 1.000000e+01, double %1535) #6
  %1537 = getelementptr inbounds [21 x double], [21 x double]* @L3psycho_anal.mld_l, i64 0, i64 %indvars.iv.next516.1
  store double %1536, double* %1537, align 16
  %indvars.iv.next516 = or i64 %indvars.iv.next516.1, 1
  %exitcond517 = icmp eq i64 %indvars.iv.next516, 21
  br i1 %exitcond517, label %71, label %.preheader163.1
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare double @cos(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare double @pow(double, double) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @L3para_read(double, i32* nocapture, i32* nocapture, i32* nocapture, double* nocapture, double* nocapture, [64 x double]* nocapture, [64 x double]* nocapture, double* nocapture, double* nocapture, i32* nocapture, i32* nocapture, double* nocapture, double* nocapture, i32* nocapture, i32* nocapture, double* nocapture, double* nocapture) local_unnamed_addr #0 {
  %19 = alloca [63 x double], align 16
  %20 = alloca [63 x double], align 16
  br label %52

.preheader44:                                     ; preds = %.loopexit47
  %21 = icmp sgt i32 %.121, 0
  br i1 %21, label %.preheader43.us.preheader, label %.preheader42.preheader

.preheader42.preheader.loopexit:                  ; preds = %._crit_edge90.us
  br label %.preheader42.preheader

.preheader42.preheader:                           ; preds = %.preheader42.preheader.loopexit, %.preheader44
  br label %.preheader42

.preheader43.us.preheader:                        ; preds = %.preheader44
  %wide.trip.count135 = zext i32 %.121 to i64
  %wide.trip.count139 = zext i32 %.121 to i64
  br label %.preheader43.us

.preheader43.us:                                  ; preds = %.preheader43.us.preheader, %._crit_edge90.us
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge90.us ], [ 0, %.preheader43.us.preheader ]
  %22 = getelementptr inbounds [63 x double], [63 x double]* %19, i64 0, i64 %indvars.iv137
  br label %23

; <label>:23:                                     ; preds = %50, %.preheader43.us
  %indvars.iv133 = phi i64 [ 0, %.preheader43.us ], [ %indvars.iv.next134, %50 ]
  %24 = icmp slt i64 %indvars.iv137, %indvars.iv133
  %25 = load double, double* %22, align 8
  %26 = getelementptr inbounds [63 x double], [63 x double]* %19, i64 0, i64 %indvars.iv133
  %27 = load double, double* %26, align 8
  %28 = fsub double %25, %27
  %.sink.us = select i1 %24, double 1.500000e+00, double 3.000000e+00
  %29 = fmul double %.sink.us, %28
  %30 = fadd double %29, -5.000000e-01
  %31 = fadd double %29, 4.740000e-01
  %32 = fmul double %31, 7.500000e+00
  %33 = fadd double %32, 0x402F9F6E6106AB15
  %34 = fmul double %31, %31
  %35 = fadd double %34, 1.000000e+00
  %36 = tail call double @sqrt(double %35) #6
  %37 = fmul double %36, 1.750000e+01
  %38 = fsub double %33, %37
  %39 = fcmp ugt double %38, -6.000000e+01
  br i1 %39, label %40, label %50

; <label>:40:                                     ; preds = %23
  %41 = fcmp ult double %29, 5.000000e-01
  %42 = fcmp ugt double %29, 2.500000e+00
  %or.cond.us = or i1 %41, %42
  %43 = fmul double %30, %30
  %44 = fmul double %30, 2.000000e+00
  %45 = fsub double %43, %44
  %46 = fmul double %45, 8.000000e+00
  %..us = select i1 %or.cond.us, double 0.000000e+00, double %46
  %47 = fadd double %38, %..us
  %48 = fmul double %47, 0x3FCD791C5F888823
  %49 = tail call double @exp(double %48) #6
  br label %50

; <label>:50:                                     ; preds = %40, %23
  %.sink24.us = phi double [ %49, %40 ], [ 0.000000e+00, %23 ]
  %51 = getelementptr inbounds [64 x double], [64 x double]* %6, i64 %indvars.iv137, i64 %indvars.iv133
  store double %.sink24.us, double* %51, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  br i1 %exitcond136, label %._crit_edge90.us, label %23

._crit_edge90.us:                                 ; preds = %50
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %.preheader42.preheader.loopexit, label %.preheader43.us

; <label>:52:                                     ; preds = %18, %.loopexit47
  %.04104 = phi i32 [ 0, %18 ], [ %104, %.loopexit47 ]
  %.014103 = phi double* [ getelementptr inbounds ([0 x double], [0 x double]* @psy_data, i64 0, i64 0), %18 ], [ %.216, %.loopexit47 ]
  %.020102 = phi i32 [ 0, %18 ], [ %.121, %.loopexit47 ]
  %53 = getelementptr inbounds double, double* %.014103, i64 1
  %54 = load double, double* %.014103, align 8
  %55 = getelementptr inbounds double, double* %.014103, i64 2
  %56 = load double, double* %53, align 8
  %57 = fptosi double %56 to i32
  %58 = add nsw i32 %57, 1
  %59 = fcmp oeq double %54, %0
  br i1 %59, label %.preheader46, label %100

.preheader46:                                     ; preds = %52
  %60 = icmp slt i32 %57, 0
  br i1 %60, label %.loopexit47, label %.lr.ph100.preheader

.lr.ph100.preheader:                              ; preds = %.preheader46
  %61 = sext i32 %57 to i64
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100.preheader, %._crit_edge95
  %indvars.iv143 = phi i64 [ 0, %.lr.ph100.preheader ], [ %indvars.iv.next144, %._crit_edge95 ]
  %.0599 = phi i32 [ 0, %.lr.ph100.preheader ], [ %.16.lcssa, %._crit_edge95 ]
  %.11597 = phi double* [ %55, %.lr.ph100.preheader ], [ %80, %._crit_edge95 ]
  %62 = getelementptr inbounds double, double* %.11597, i64 1
  %63 = load double, double* %.11597, align 8
  %64 = fptosi double %63 to i32
  %65 = getelementptr inbounds double, double* %.11597, i64 2
  %66 = load double, double* %62, align 8
  %67 = fptosi double %66 to i32
  %68 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv143
  store i32 %67, i32* %68, align 4
  %69 = getelementptr inbounds double, double* %.11597, i64 3
  %70 = load double, double* %65, align 8
  %71 = fadd double %70, -6.000000e+00
  %72 = fmul double %71, 0xBFCD791C5F888823
  %73 = tail call double @exp(double %72) #6
  %74 = getelementptr inbounds double, double* %4, i64 %indvars.iv143
  store double %73, double* %74, align 8
  %75 = bitcast double* %69 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds double, double* %5, i64 %indvars.iv143
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %79 = getelementptr inbounds double, double* %.11597, i64 5
  %80 = getelementptr inbounds double, double* %.11597, i64 6
  %81 = bitcast double* %79 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [63 x double], [63 x double]* %19, i64 0, i64 %indvars.iv143
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %85 = zext i32 %64 to i64
  %86 = icmp eq i64 %85, %indvars.iv143
  br i1 %86, label %.preheader45, label %91

.preheader45:                                     ; preds = %.lr.ph100
  %87 = load i32, i32* %68, align 4
  %88 = icmp sgt i32 %87, 0
  br i1 %88, label %.lr.ph94.preheader, label %._crit_edge95

.lr.ph94.preheader:                               ; preds = %.preheader45
  %89 = sext i32 %.0599 to i64
  %90 = trunc i64 %indvars.iv143 to i32
  br label %.lr.ph94

; <label>:91:                                     ; preds = %.lr.ph100
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %93 = tail call i64 @fwrite(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %92) #7
  tail call void @exit(i32 -1) #8
  unreachable

.lr.ph94:                                         ; preds = %.lr.ph94.preheader, %.lr.ph94
  %indvars.iv141 = phi i64 [ %89, %.lr.ph94.preheader ], [ %indvars.iv.next142, %.lr.ph94 ]
  %.0792 = phi i32 [ 0, %.lr.ph94.preheader ], [ %95, %.lr.ph94 ]
  %94 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv141
  store i32 %90, i32* %94, align 4
  %indvars.iv.next142 = add i64 %indvars.iv141, 1
  %95 = add nuw nsw i32 %.0792, 1
  %96 = load i32, i32* %68, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %.lr.ph94, label %._crit_edge95.loopexit

._crit_edge95.loopexit:                           ; preds = %.lr.ph94
  %98 = trunc i64 %indvars.iv.next142 to i32
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %._crit_edge95.loopexit, %.preheader45
  %.16.lcssa = phi i32 [ %.0599, %.preheader45 ], [ %98, %._crit_edge95.loopexit ]
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %99 = icmp slt i64 %indvars.iv143, %61
  br i1 %99, label %.lr.ph100, label %.loopexit47.loopexit

; <label>:100:                                    ; preds = %52
  %101 = mul nsw i32 %58, 6
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double* %55, i64 %102
  br label %.loopexit47

.loopexit47.loopexit:                             ; preds = %._crit_edge95
  br label %.loopexit47

.loopexit47:                                      ; preds = %.loopexit47.loopexit, %.preheader46, %100
  %.121 = phi i32 [ %.020102, %100 ], [ %58, %.preheader46 ], [ %58, %.loopexit47.loopexit ]
  %.216 = phi double* [ %103, %100 ], [ %55, %.preheader46 ], [ %80, %.loopexit47.loopexit ]
  %104 = add nuw nsw i32 %.04104, 1
  %105 = icmp slt i32 %104, 6
  br i1 %105, label %52, label %.preheader44

.preheader40:                                     ; preds = %183
  %106 = icmp sgt i32 %.323, 0
  br i1 %106, label %.preheader39.us.preheader, label %.preheader38.preheader

.preheader38.preheader.loopexit:                  ; preds = %._crit_edge.us
  br label %.preheader38.preheader

.preheader38.preheader:                           ; preds = %.preheader38.preheader.loopexit, %.preheader40
  br label %.preheader38

.preheader39.us.preheader:                        ; preds = %.preheader40
  %wide.trip.count = zext i32 %.323 to i64
  %wide.trip.count129 = zext i32 %.323 to i64
  br label %.preheader39.us

.preheader39.us:                                  ; preds = %.preheader39.us.preheader, %._crit_edge.us
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %._crit_edge.us ], [ 0, %.preheader39.us.preheader ]
  %107 = getelementptr inbounds [63 x double], [63 x double]* %20, i64 0, i64 %indvars.iv127
  br label %108

; <label>:108:                                    ; preds = %135, %.preheader39.us
  %indvars.iv125 = phi i64 [ 0, %.preheader39.us ], [ %indvars.iv.next126, %135 ]
  %109 = icmp slt i64 %indvars.iv127, %indvars.iv125
  %110 = load double, double* %107, align 8
  %111 = getelementptr inbounds [63 x double], [63 x double]* %20, i64 0, i64 %indvars.iv125
  %112 = load double, double* %111, align 8
  %113 = fsub double %110, %112
  %.sink28.us = select i1 %109, double 1.500000e+00, double 3.000000e+00
  %114 = fmul double %.sink28.us, %113
  %115 = fadd double %114, -5.000000e-01
  %116 = fadd double %114, 4.740000e-01
  %117 = fmul double %116, 7.500000e+00
  %118 = fadd double %117, 0x402F9F6E6106AB15
  %119 = fmul double %116, %116
  %120 = fadd double %119, 1.000000e+00
  %121 = tail call double @sqrt(double %120) #6
  %122 = fmul double %121, 1.750000e+01
  %123 = fsub double %118, %122
  %124 = fcmp ugt double %123, -6.000000e+01
  br i1 %124, label %125, label %135

; <label>:125:                                    ; preds = %108
  %126 = fcmp ult double %114, 5.000000e-01
  %127 = fcmp ugt double %114, 2.500000e+00
  %or.cond29.us = or i1 %126, %127
  %128 = fmul double %115, %115
  %129 = fmul double %115, 2.000000e+00
  %130 = fsub double %128, %129
  %131 = fmul double %130, 8.000000e+00
  %.34.us = select i1 %or.cond29.us, double 0.000000e+00, double %131
  %132 = fadd double %123, %.34.us
  %133 = fmul double %132, 0x3FCD791C5F888823
  %134 = tail call double @exp(double %133) #6
  br label %135

; <label>:135:                                    ; preds = %125, %108
  %.sink30.us = phi double [ %134, %125 ], [ 0.000000e+00, %108 ]
  %136 = getelementptr inbounds [64 x double], [64 x double]* %7, i64 %indvars.iv127, i64 %indvars.iv125
  store double %.sink30.us, double* %136, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond = icmp eq i64 %indvars.iv.next126, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %108

._crit_edge.us:                                   ; preds = %135
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next128, %wide.trip.count129
  br i1 %exitcond130, label %.preheader38.preheader.loopexit, label %.preheader39.us

.preheader42:                                     ; preds = %.preheader42.preheader, %183
  %.187 = phi i32 [ %184, %183 ], [ 0, %.preheader42.preheader ]
  %.31786 = phi double* [ %.519, %183 ], [ %.216, %.preheader42.preheader ]
  %.22285 = phi i32 [ %.323, %183 ], [ %.121, %.preheader42.preheader ]
  %137 = getelementptr inbounds double, double* %.31786, i64 1
  %138 = load double, double* %.31786, align 8
  %139 = getelementptr inbounds double, double* %.31786, i64 2
  %140 = load double, double* %137, align 8
  %141 = fptosi double %140 to i32
  %142 = add nsw i32 %141, 1
  %143 = fcmp oeq double %138, %0
  br i1 %143, label %.preheader41, label %179

.preheader41:                                     ; preds = %.preheader42
  %144 = icmp slt i32 %141, 0
  br i1 %144, label %._crit_edge82, label %.lr.ph81.preheader

.lr.ph81.preheader:                               ; preds = %.preheader41
  %145 = sext i32 %141 to i64
  br label %.lr.ph81

.lr.ph81:                                         ; preds = %.lr.ph81.preheader, %172
  %indvars.iv131 = phi i64 [ 0, %.lr.ph81.preheader ], [ %indvars.iv.next132, %172 ]
  %.41879 = phi double* [ %139, %.lr.ph81.preheader ], [ %173, %172 ]
  %146 = getelementptr inbounds double, double* %.41879, i64 1
  %147 = load double, double* %.41879, align 8
  %148 = fptosi double %147 to i32
  %149 = getelementptr inbounds double, double* %.41879, i64 2
  %150 = load double, double* %146, align 8
  %151 = fptosi double %150 to i32
  %152 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv131
  store i32 %151, i32* %152, align 4
  %153 = bitcast double* %149 to i64*
  %154 = load i64, i64* %153, align 8
  %155 = getelementptr inbounds double, double* %8, i64 %indvars.iv131
  %156 = bitcast double* %155 to i64*
  store i64 %154, i64* %156, align 8
  %157 = getelementptr inbounds double, double* %.41879, i64 4
  %158 = getelementptr inbounds double, double* %.41879, i64 5
  %159 = bitcast double* %157 to i64*
  %160 = load i64, i64* %159, align 8
  %161 = getelementptr inbounds double, double* %9, i64 %indvars.iv131
  %162 = bitcast double* %161 to i64*
  store i64 %160, i64* %162, align 8
  %163 = bitcast double* %158 to i64*
  %164 = load i64, i64* %163, align 8
  %165 = getelementptr inbounds [63 x double], [63 x double]* %20, i64 0, i64 %indvars.iv131
  %166 = bitcast double* %165 to i64*
  store i64 %164, i64* %166, align 8
  %167 = zext i32 %148 to i64
  %168 = icmp eq i64 %167, %indvars.iv131
  br i1 %168, label %172, label %169

; <label>:169:                                    ; preds = %.lr.ph81
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %171 = tail call i64 @fwrite(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %170) #7
  tail call void @exit(i32 -1) #8
  unreachable

; <label>:172:                                    ; preds = %.lr.ph81
  %173 = getelementptr inbounds double, double* %.41879, i64 6
  %174 = load i32, i32* %152, align 4
  %175 = add nsw i32 %174, -1
  store i32 %175, i32* %152, align 4
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %176 = icmp slt i64 %indvars.iv131, %145
  br i1 %176, label %.lr.ph81, label %._crit_edge82.loopexit

._crit_edge82.loopexit:                           ; preds = %172
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82.loopexit, %.preheader41
  %.418.lcssa = phi double* [ %139, %.preheader41 ], [ %173, %._crit_edge82.loopexit ]
  %.212.lcssa = phi i64 [ 0, %.preheader41 ], [ %indvars.iv.next132, %._crit_edge82.loopexit ]
  %sext = shl i64 %.212.lcssa, 32
  %177 = ashr exact i64 %sext, 32
  %178 = getelementptr inbounds i32, i32* %2, i64 %177
  store i32 -1, i32* %178, align 4
  br label %183

; <label>:179:                                    ; preds = %.preheader42
  %180 = mul nsw i32 %142, 6
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds double, double* %139, i64 %181
  br label %183

; <label>:183:                                    ; preds = %._crit_edge82, %179
  %.323 = phi i32 [ %142, %._crit_edge82 ], [ %.22285, %179 ]
  %.519 = phi double* [ %.418.lcssa, %._crit_edge82 ], [ %182, %179 ]
  %184 = add nuw nsw i32 %.187, 1
  %185 = icmp slt i32 %184, 6
  br i1 %185, label %.preheader42, label %.preheader40

.preheader38:                                     ; preds = %.preheader38.preheader, %.loopexit37
  %.275 = phi i32 [ %245, %.loopexit37 ], [ 0, %.preheader38.preheader ]
  %.674 = phi double* [ %.8, %.loopexit37 ], [ %.519, %.preheader38.preheader ]
  %186 = getelementptr inbounds double, double* %.674, i64 1
  %187 = load double, double* %.674, align 8
  %188 = getelementptr inbounds double, double* %.674, i64 2
  %189 = load double, double* %186, align 8
  %190 = fptosi double %189 to i32
  %191 = fcmp oeq double %187, %0
  br i1 %191, label %.preheader36, label %240

.preheader36:                                     ; preds = %.preheader38
  %192 = icmp slt i32 %190, 0
  br i1 %192, label %.loopexit37, label %.lr.ph72.preheader

.lr.ph72.preheader:                               ; preds = %.preheader36
  %193 = sext i32 %190 to i64
  br label %.lr.ph72

.lr.ph72:                                         ; preds = %.lr.ph72.preheader, %238
  %indvars.iv123 = phi i64 [ 0, %.lr.ph72.preheader ], [ %indvars.iv.next124, %238 ]
  %.770 = phi double* [ %188, %.lr.ph72.preheader ], [ %210, %238 ]
  %194 = load double, double* %.770, align 8
  %195 = fptosi double %194 to i32
  %196 = getelementptr inbounds double, double* %.770, i64 2
  %197 = getelementptr inbounds double, double* %.770, i64 3
  %198 = load double, double* %196, align 8
  %199 = fptosi double %198 to i32
  %200 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv123
  store i32 %199, i32* %200, align 4
  %201 = getelementptr inbounds double, double* %.770, i64 4
  %202 = load double, double* %197, align 8
  %203 = fptosi double %202 to i32
  %204 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv123
  store i32 %203, i32* %204, align 4
  %205 = getelementptr inbounds double, double* %.770, i64 5
  %206 = bitcast double* %201 to i64*
  %207 = load i64, i64* %206, align 8
  %208 = getelementptr inbounds double, double* %12, i64 %indvars.iv123
  %209 = bitcast double* %208 to i64*
  store i64 %207, i64* %209, align 8
  %210 = getelementptr inbounds double, double* %.770, i64 6
  %211 = bitcast double* %205 to i64*
  %212 = load i64, i64* %211, align 8
  %213 = getelementptr inbounds double, double* %13, i64 %indvars.iv123
  %214 = bitcast double* %213 to i64*
  store i64 %212, i64* %214, align 8
  %215 = zext i32 %195 to i64
  %216 = icmp eq i64 %215, %indvars.iv123
  br i1 %216, label %220, label %217

; <label>:217:                                    ; preds = %.lr.ph72
  %218 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %219 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %218) #7
  tail call void @exit(i32 -1) #8
  unreachable

; <label>:220:                                    ; preds = %.lr.ph72
  %221 = icmp eq i64 %indvars.iv123, 0
  br i1 %221, label %238, label %222

; <label>:222:                                    ; preds = %220
  %223 = load double, double* %208, align 8
  %224 = fsub double 1.000000e+00, %223
  %225 = add nsw i64 %indvars.iv123, -1
  %226 = getelementptr inbounds double, double* %13, i64 %225
  %227 = load double, double* %226, align 8
  %228 = fsub double %224, %227
  %229 = tail call double @fabs(double %228) #9
  %230 = fcmp ogt double %229, 1.000000e-02
  br i1 %230, label %231, label %238

; <label>:231:                                    ; preds = %222
  %232 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %233 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %232) #7
  %234 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %235 = load double, double* %208, align 8
  %236 = load double, double* %226, align 8
  %237 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %234, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), double %235, double %236) #7
  tail call void @exit(i32 -1) #8
  unreachable

; <label>:238:                                    ; preds = %220, %222
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %239 = icmp slt i64 %indvars.iv123, %193
  br i1 %239, label %.lr.ph72, label %.loopexit37.loopexit

; <label>:240:                                    ; preds = %.preheader38
  %241 = mul i32 %190, 6
  %242 = add i32 %241, 6
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds double, double* %188, i64 %243
  br label %.loopexit37

.loopexit37.loopexit:                             ; preds = %238
  br label %.loopexit37

.loopexit37:                                      ; preds = %.loopexit37.loopexit, %.preheader36, %240
  %.8 = phi double* [ %244, %240 ], [ %188, %.preheader36 ], [ %210, %.loopexit37.loopexit ]
  %245 = add nuw nsw i32 %.275, 1
  %246 = icmp slt i32 %245, 6
  br i1 %246, label %.preheader38, label %.preheader35.preheader

.preheader35.preheader:                           ; preds = %.loopexit37
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %.loopexit
  %.369 = phi i32 [ %306, %.loopexit ], [ 0, %.preheader35.preheader ]
  %.968 = phi double* [ %.11, %.loopexit ], [ %.8, %.preheader35.preheader ]
  %247 = getelementptr inbounds double, double* %.968, i64 1
  %248 = load double, double* %.968, align 8
  %249 = getelementptr inbounds double, double* %.968, i64 2
  %250 = load double, double* %247, align 8
  %251 = fptosi double %250 to i32
  %252 = fcmp oeq double %248, %0
  br i1 %252, label %.preheader, label %301

.preheader:                                       ; preds = %.preheader35
  %253 = icmp slt i32 %251, 0
  br i1 %253, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %254 = sext i32 %251 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %299
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %299 ]
  %.1066 = phi double* [ %249, %.lr.ph.preheader ], [ %271, %299 ]
  %255 = load double, double* %.1066, align 8
  %256 = fptosi double %255 to i32
  %257 = getelementptr inbounds double, double* %.1066, i64 2
  %258 = getelementptr inbounds double, double* %.1066, i64 3
  %259 = load double, double* %257, align 8
  %260 = fptosi double %259 to i32
  %261 = getelementptr inbounds i32, i32* %14, i64 %indvars.iv
  store i32 %260, i32* %261, align 4
  %262 = getelementptr inbounds double, double* %.1066, i64 4
  %263 = load double, double* %258, align 8
  %264 = fptosi double %263 to i32
  %265 = getelementptr inbounds i32, i32* %15, i64 %indvars.iv
  store i32 %264, i32* %265, align 4
  %266 = getelementptr inbounds double, double* %.1066, i64 5
  %267 = bitcast double* %262 to i64*
  %268 = load i64, i64* %267, align 8
  %269 = getelementptr inbounds double, double* %16, i64 %indvars.iv
  %270 = bitcast double* %269 to i64*
  store i64 %268, i64* %270, align 8
  %271 = getelementptr inbounds double, double* %.1066, i64 6
  %272 = bitcast double* %266 to i64*
  %273 = load i64, i64* %272, align 8
  %274 = getelementptr inbounds double, double* %17, i64 %indvars.iv
  %275 = bitcast double* %274 to i64*
  store i64 %273, i64* %275, align 8
  %276 = zext i32 %256 to i64
  %277 = icmp eq i64 %276, %indvars.iv
  br i1 %277, label %281, label %278

; <label>:278:                                    ; preds = %.lr.ph
  %279 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %280 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %279) #7
  tail call void @exit(i32 -1) #8
  unreachable

; <label>:281:                                    ; preds = %.lr.ph
  %282 = icmp eq i64 %indvars.iv, 0
  br i1 %282, label %299, label %283

; <label>:283:                                    ; preds = %281
  %284 = load double, double* %269, align 8
  %285 = fsub double 1.000000e+00, %284
  %286 = add nsw i64 %indvars.iv, -1
  %287 = getelementptr inbounds double, double* %17, i64 %286
  %288 = load double, double* %287, align 8
  %289 = fsub double %285, %288
  %290 = tail call double @fabs(double %289) #9
  %291 = fcmp ogt double %290, 1.000000e-02
  br i1 %291, label %292, label %299

; <label>:292:                                    ; preds = %283
  %293 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %294 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.7, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %293) #7
  %295 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %296 = load double, double* %269, align 8
  %297 = load double, double* %287, align 8
  %298 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %295, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), double %296, double %297) #7
  tail call void @exit(i32 -1) #8
  unreachable

; <label>:299:                                    ; preds = %281, %283
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %300 = icmp slt i64 %indvars.iv, %254
  br i1 %300, label %.lr.ph, label %.loopexit.loopexit

; <label>:301:                                    ; preds = %.preheader35
  %302 = mul i32 %251, 6
  %303 = add i32 %302, 6
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds double, double* %249, i64 %304
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %299
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %301
  %.11 = phi double* [ %305, %301 ], [ %249, %.preheader ], [ %271, %.loopexit.loopexit ]
  %306 = add nuw nsw i32 %.369, 1
  %307 = icmp slt i32 %306, 6
  br i1 %307, label %.preheader35, label %308

; <label>:308:                                    ; preds = %.loopexit
  ret void
}

; Function Attrs: nounwind
declare double @exp(double) local_unnamed_addr #1

declare void @init_fft() local_unnamed_addr #4

declare void @fft_long(float*, i32, i16**) local_unnamed_addr #4

declare void @fft_short([256 x float]*, i32, i16**) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare double @fabs(double) local_unnamed_addr #5

; Function Attrs: nounwind
declare double @log(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare double @log10(double) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

declare float @sqrtf(float)

declare float @fabsf(float)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = distinct !{!6, !2, !3}
!7 = distinct !{!7, !5, !2, !3}
!8 = distinct !{!8, !2, !3}
!9 = distinct !{!9, !2, !3}
!10 = distinct !{!10, !2, !3}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !2, !3}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
