; ModuleID = 'B.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_deriche = private constant [19 x i8] c"B.ll:kernel_deriche"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 92494392653, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_deriche = private global [42 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_deriche = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3963923321610283555, i64 471118697375, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i32 0, i32 0), i8* null, i8* null, i32 42, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_deriche\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_deriche to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca float, align 4
  %4 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %8 = bitcast i8* %4 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  tail call void (...) @polybench_timer_start() #5
  %9 = load float, float* %3, align 4
  %10 = bitcast i8* %5 to [2160 x float]*
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %9, [2160 x float]* %8, [2160 x float]* %10, [2160 x float]* %11, [2160 x float]* %12)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %10)
  br label %20

; <label>:20:                                     ; preds = %18, %14, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
  store float 2.500000e-01, float* %2, align 4
  %5 = icmp sgt i32 %0, 0
  %6 = icmp sgt i32 %1, 0
  %or.cond = and i1 %5, %6
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %4
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  %min.iters.check = icmp ult i32 %1, 4
  %7 = and i32 %1, 3
  %n.mod.vf = zext i32 %7 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %7, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %8 = mul nuw nsw i64 %indvars.iv6, 313
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %8, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
  %10 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %11 = add nuw nsw <4 x i64> %10, %broadcast.splat
  %12 = trunc <4 x i64> %11 to <4 x i32>
  %13 = srem <4 x i32> %12, <i32 65536, i32 65536, i32 65536, i32 65536>
  %14 = sitofp <4 x i32> %13 to <4 x float>
  %15 = fdiv <4 x float> %14, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv6, i64 %index
  %17 = bitcast float* %16 to <4 x float>*
  store <4 x float> %15, <4 x float>* %17, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %18 = icmp eq i64 %index.next, %n.vec
  br i1 %18, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br i1 %cmp.n, label %middle.block.._crit_edge.us_crit_edge, label %scalar.ph.preheader

middle.block.._crit_edge.us_crit_edge:            ; preds = %middle.block
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge.us

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %22 = mul nuw nsw i64 %indvars.iv, 991
  %23 = add nuw nsw i64 %22, %8
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 65536
  %26 = sitofp i32 %25 to float
  %27 = fdiv float %26, 6.553500e+04
  %28 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv6, i64 %indvars.iv
  store float %27, float* %28, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !4

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %scalar.ph

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %30 = add i64 %pgocount5, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %31 = add i64 %pgocount6, 1
  store i64 %31, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %4
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %32 = add i64 %pgocount7, 1
  store i64 %32, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
  %8 = fsub float -0.000000e+00, %2
  %9 = tail call float @expf(float %8) #5
  %10 = fsub float 1.000000e+00, %9
  %11 = tail call float @expf(float %8) #5
  %12 = fsub float 1.000000e+00, %11
  %13 = fmul float %10, %12
  %14 = fmul float %2, 2.000000e+00
  %15 = tail call float @expf(float %8) #5
  %16 = fmul float %14, %15
  %17 = fadd float %16, 1.000000e+00
  %18 = tail call float @expf(float %14) #5
  %19 = fsub float %17, %18
  %20 = fdiv float %13, %19
  %21 = tail call float @expf(float %8) #5
  %22 = fmul float %21, %20
  %23 = fadd float %2, -1.000000e+00
  %24 = fmul float %23, %22
  %25 = tail call float @expf(float %8) #5
  %26 = fmul float %25, %20
  %27 = fadd float %2, 1.000000e+00
  %28 = fmul float %27, %26
  %29 = fmul float %2, -2.000000e+00
  %30 = tail call float @expf(float %29) #5
  %31 = fmul float %20, %30
  %32 = fsub float -0.000000e+00, %31
  %exp2 = tail call float @llvm.exp2.f32(float %8)
  %33 = tail call float @expf(float %29) #5
  %34 = fsub float -0.000000e+00, %33
  %35 = icmp sgt i32 %0, 0
  br i1 %35, label %.preheader30.lr.ph, label %.preheader25

.preheader30.lr.ph:                               ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 27)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 27)
  %37 = icmp sgt i32 %1, 0
  br i1 %37, label %.preheader30.us.preheader, label %._crit_edge33

.preheader30.us.preheader:                        ; preds = %.preheader30.lr.ph
  %pgocount2 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 31)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 31)
  %xtraiter126 = and i32 %1, 1
  %lcmp.mod127 = icmp eq i32 %xtraiter126, 0
  %39 = icmp eq i32 %1, 1
  %wide.trip.count130 = zext i32 %0 to i64
  %wide.trip.count122.1 = zext i32 %1 to i64
  %40 = fmul float %24, 0.000000e+00
  %41 = fmul float %exp2, 0.000000e+00
  %42 = fmul float %33, -0.000000e+00
  br label %.preheader30.us

.preheader30.us:                                  ; preds = %._crit_edge68.us, %.preheader30.us.preheader
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %._crit_edge68.us ], [ 0, %.preheader30.us.preheader ]
  br i1 %lcmp.mod127, label %.prol.loopexit125, label %.prol.preheader124

.prol.preheader124:                               ; preds = %.preheader30.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 12)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 12)
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 0
  %45 = load float, float* %44, align 4
  %46 = fmul float %20, %45
  %47 = fadd float %40, %46
  %48 = fadd float %41, %47
  %49 = fadd float %42, %48
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 0
  store float %49, float* %50, align 4
  %51 = load float, float* %44, align 4
  br label %.prol.loopexit125

.prol.loopexit125:                                ; preds = %.prol.preheader124, %.preheader30.us
  %indvars.iv120.unr.ph = phi i64 [ 1, %.prol.preheader124 ], [ 0, %.preheader30.us ]
  %.01764.us.unr.ph = phi float [ %51, %.prol.preheader124 ], [ 0.000000e+00, %.preheader30.us ]
  %.01963.us.unr.ph = phi float [ %49, %.prol.preheader124 ], [ 0.000000e+00, %.preheader30.us ]
  br i1 %39, label %.prol.loopexit125.._crit_edge68.us_crit_edge, label %.preheader30.us.new.preheader

.prol.loopexit125.._crit_edge68.us_crit_edge:     ; preds = %.prol.loopexit125
  %pgocount4 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 7)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 7)
  br label %._crit_edge68.us

.preheader30.us.new.preheader:                    ; preds = %.prol.loopexit125
  br label %.preheader30.us.new

.preheader30.us.new:                              ; preds = %.preheader30.us.new..preheader30.us.new_crit_edge, %.preheader30.us.new.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv.next121.1, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ %indvars.iv120.unr.ph, %.preheader30.us.new.preheader ]
  %.0766.us = phi float [ %61, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ 0.000000e+00, %.preheader30.us.new.preheader ]
  %.01764.us = phi float [ %74, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ %.01764.us.unr.ph, %.preheader30.us.new.preheader ]
  %.01963.us = phi float [ %72, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ %.01963.us.unr.ph, %.preheader30.us.new.preheader ]
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 %indvars.iv120
  %54 = load float, float* %53, align 4
  %55 = fmul float %20, %54
  %56 = fmul float %24, %.01764.us
  %57 = fadd float %56, %55
  %58 = fmul float %exp2, %.01963.us
  %59 = fadd float %58, %57
  %60 = fmul float %.0766.us, %34
  %61 = fadd float %60, %59
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 %indvars.iv120
  store float %61, float* %62, align 4
  %63 = load float, float* %53, align 4
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 %indvars.iv.next121
  %65 = load float, float* %64, align 4
  %66 = fmul float %20, %65
  %67 = fmul float %24, %63
  %68 = fadd float %67, %66
  %69 = fmul float %exp2, %61
  %70 = fadd float %69, %68
  %71 = fmul float %.01963.us, %34
  %72 = fadd float %71, %70
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 %indvars.iv.next121
  store float %72, float* %73, align 4
  %74 = load float, float* %64, align 4
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %exitcond123.1 = icmp eq i64 %indvars.iv.next121.1, %wide.trip.count122.1
  br i1 %exitcond123.1, label %._crit_edge68.us.loopexit, label %.preheader30.us.new..preheader30.us.new_crit_edge

.preheader30.us.new..preheader30.us.new_crit_edge: ; preds = %.preheader30.us.new
  %pgocount5 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 0)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 0)
  br label %.preheader30.us.new

._crit_edge68.us.loopexit:                        ; preds = %.preheader30.us.new
  %pgocount6 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 13)
  %76 = add i64 %pgocount6, 1
  store i64 %76, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 13)
  br label %._crit_edge68.us

._crit_edge68.us:                                 ; preds = %.prol.loopexit125.._crit_edge68.us_crit_edge, %._crit_edge68.us.loopexit
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next129, %wide.trip.count130
  br i1 %exitcond131, label %.preheader29, label %.preheader30.us

.preheader29:                                     ; preds = %._crit_edge68.us
  %77 = icmp sgt i32 %0, 0
  br i1 %77, label %.preheader28.lr.ph, label %.preheader25

.preheader28.lr.ph:                               ; preds = %.preheader29
  %pgocount7 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 34)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 34)
  %79 = icmp sgt i32 %1, 0
  br i1 %79, label %.preheader28.us.preheader, label %._crit_edge33

.preheader28.us.preheader:                        ; preds = %.preheader28.lr.ph
  %80 = sext i32 %1 to i64
  %wide.trip.count117 = zext i32 %0 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge61.us, %.preheader28.us.preheader
  %indvars.iv115 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next116, %._crit_edge61.us ]
  br label %81

; <label>:81:                                     ; preds = %._crit_edge, %.preheader28.us
  %indvars.iv113 = phi i64 [ %80, %.preheader28.us ], [ %indvars.iv.next114, %._crit_edge ]
  %.058.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %.0157.us, %._crit_edge ]
  %.0157.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %88, %._crit_edge ]
  %.0556.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %.0655.us, %._crit_edge ]
  %.0655.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %91, %._crit_edge ]
  %indvars.iv.next114 = add nsw i64 %indvars.iv113, -1
  %82 = fmul float %28, %.0655.us
  %83 = fmul float %.0556.us, %32
  %84 = fadd float %82, %83
  %85 = fmul float %exp2, %.0157.us
  %86 = fadd float %84, %85
  %87 = fmul float %.058.us, %34
  %88 = fadd float %86, %87
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv115, i64 %indvars.iv.next114
  store float %88, float* %89, align 4
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv115, i64 %indvars.iv.next114
  %91 = load float, float* %90, align 4
  %92 = icmp sgt i64 %indvars.iv113, 1
  br i1 %92, label %._crit_edge, label %._crit_edge61.us

._crit_edge:                                      ; preds = %81
  %pgocount8 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 1)
  %93 = add i64 %pgocount8, 1
  store i64 %93, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 1)
  br label %81

._crit_edge61.us:                                 ; preds = %81
  %pgocount9 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 14)
  %94 = add i64 %pgocount9, 1
  store i64 %94, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 14)
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, %wide.trip.count117
  br i1 %exitcond118, label %.preheader27, label %.preheader28.us

.preheader27:                                     ; preds = %._crit_edge61.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 36)
  %95 = add i64 %pgocount10, 1
  store i64 %95, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 36)
  %96 = icmp sgt i32 %0, 0
  br i1 %96, label %.preheader26.lr.ph, label %.preheader25

.preheader26.lr.ph:                               ; preds = %.preheader27
  %pgocount11 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 39)
  %97 = add i64 %pgocount11, 1
  store i64 %97, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 39)
  %98 = icmp sgt i32 %1, 0
  br i1 %98, label %.preheader26.us.preheader, label %._crit_edge33

.preheader26.us.preheader:                        ; preds = %.preheader26.lr.ph
  %xtraiter106 = and i32 %1, 1
  %lcmp.mod107 = icmp eq i32 %xtraiter106, 0
  %99 = icmp eq i32 %1, 1
  %wide.trip.count110 = zext i32 %0 to i64
  %wide.trip.count102.1 = zext i32 %1 to i64
  %100 = add nsw i64 %wide.trip.count122.1, -2
  %101 = add nsw i64 %wide.trip.count122.1, -2
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge52.us, %.preheader26.us.preheader
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge52.us ], [ 0, %.preheader26.us.preheader ]
  %scevgep139 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 2
  %scevgep145 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 2
  %scevgep151 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 2
  br i1 %lcmp.mod107, label %.prol.loopexit105, label %.prol.preheader104

.prol.preheader104:                               ; preds = %.preheader26.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 24)
  %102 = add i64 %pgocount12, 1
  store i64 %102, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 24)
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 0
  %104 = load float, float* %103, align 4
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 0
  %106 = load float, float* %105, align 4
  %107 = fadd float %104, %106
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 0
  store float %107, float* %108, align 4
  br label %.prol.loopexit105

.prol.loopexit105:                                ; preds = %.prol.preheader104, %.preheader26.us
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader104 ], [ 0, %.preheader26.us ]
  br i1 %99, label %.prol.loopexit105.._crit_edge52.us_crit_edge, label %.preheader26.us.new.preheader

.prol.loopexit105.._crit_edge52.us_crit_edge:     ; preds = %.prol.loopexit105
  %pgocount13 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 11)
  %109 = add i64 %pgocount13, 1
  store i64 %109, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 11)
  br label %._crit_edge52.us

.preheader26.us.new.preheader:                    ; preds = %.prol.loopexit105
  %pgocount14 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 25)
  %110 = add i64 %pgocount14, 1
  store i64 %110, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 25)
  %111 = sub nsw i64 %100, %indvars.iv100.unr.ph
  %112 = lshr i64 %111, 1
  %113 = add nuw i64 %112, 1
  %min.iters.check = icmp ult i64 %113, 4
  br i1 %min.iters.check, label %.preheader26.us.new.preheader215, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader26.us.new.preheader
  %pgocount15 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 29)
  %114 = add i64 %pgocount15, 1
  store i64 %114, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 29)
  %n.mod.vf = and i64 %113, 3
  %n.vec = sub i64 %113, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader26.us.new.preheader215, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount16 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 32)
  %115 = add i64 %pgocount16, 1
  store i64 %115, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 32)
  %scevgep137 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %116 = sub nsw i64 %101, %indvars.iv100.unr.ph
  %117 = and i64 %116, -2
  %118 = or i64 %indvars.iv100.unr.ph, %117
  %scevgep140 = getelementptr float, float* %scevgep139, i64 %118
  %scevgep143 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %scevgep146 = getelementptr float, float* %scevgep145, i64 %118
  %scevgep149 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %scevgep152 = getelementptr float, float* %scevgep151, i64 %118
  %bound0 = icmp ult float* %scevgep137, %scevgep146
  %bound1 = icmp ult float* %scevgep143, %scevgep140
  %found.conflict = and i1 %bound0, %bound1
  %bound0154 = icmp ult float* %scevgep137, %scevgep152
  %bound1155 = icmp ult float* %scevgep149, %scevgep140
  %found.conflict156 = and i1 %bound0154, %bound1155
  %conflict.rdx = or i1 %found.conflict, %found.conflict156
  %119 = or i64 %indvars.iv100.unr.ph, 2
  %120 = shl nuw i64 %112, 1
  %121 = add i64 %119, %120
  %122 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %121, %122
  br i1 %conflict.rdx, label %.preheader26.us.new.preheader215, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %123 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv100.unr.ph, %123
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %offset.idx
  %125 = bitcast float* %124 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %125, align 4, !alias.scope !6
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %offset.idx
  %127 = bitcast float* %126 to <8 x float>*
  %wide.vec158 = load <8 x float>, <8 x float>* %127, align 4, !alias.scope !9
  %128 = fadd <8 x float> %wide.vec, %wide.vec158
  %129 = shufflevector <8 x float> %128, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %130 = add nuw nsw i64 %offset.idx, 1
  %131 = fadd <8 x float> %wide.vec, %wide.vec158
  %132 = shufflevector <8 x float> %131, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %130
  %134 = getelementptr float, float* %133, i64 -1
  %135 = bitcast float* %134 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %129, <4 x float> %132, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %135, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %136 = icmp eq i64 %index.next, %n.vec
  br i1 %136, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount17 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 8)
  %137 = add i64 %pgocount17, 1
  store i64 %137, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 8)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount18 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 38)
  %138 = add i64 %pgocount18, 1
  store i64 %138, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 38)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge52.us, label %.preheader26.us.new.preheader215

.preheader26.us.new.preheader215:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader26.us.new.preheader
  %indvars.iv100.ph = phi i64 [ %indvars.iv100.unr.ph, %vector.memcheck ], [ %indvars.iv100.unr.ph, %min.iters.checked ], [ %indvars.iv100.unr.ph, %.preheader26.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader26.us.new

.preheader26.us.new:                              ; preds = %.preheader26.us.new..preheader26.us.new_crit_edge, %.preheader26.us.new.preheader215
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.preheader26.us.new..preheader26.us.new_crit_edge ], [ %indvars.iv100.ph, %.preheader26.us.new.preheader215 ]
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv100
  %140 = load float, float* %139, align 4
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv100
  %142 = load float, float* %141, align 4
  %143 = fadd float %140, %142
  %144 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv100
  store float %143, float* %144, align 4
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv.next101
  %146 = load float, float* %145, align 4
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv.next101
  %148 = load float, float* %147, align 4
  %149 = fadd float %146, %148
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv.next101
  store float %149, float* %150, align 4
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count102.1
  br i1 %exitcond103.1, label %._crit_edge52.us.loopexit, label %.preheader26.us.new..preheader26.us.new_crit_edge, !llvm.loop !15

.preheader26.us.new..preheader26.us.new_crit_edge: ; preds = %.preheader26.us.new
  %pgocount19 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 5)
  %151 = add i64 %pgocount19, 1
  store i64 %151, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 5)
  br label %.preheader26.us.new

._crit_edge52.us.loopexit:                        ; preds = %.preheader26.us.new
  %pgocount20 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 26)
  %152 = add i64 %pgocount20, 1
  store i64 %152, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 26)
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %.prol.loopexit105.._crit_edge52.us_crit_edge, %._crit_edge52.us.loopexit, %middle.block
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count110
  br i1 %exitcond111, label %.preheader25.loopexit, label %.preheader26.us

.preheader25.loopexit:                            ; preds = %._crit_edge52.us
  %pgocount21 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 41)
  %153 = add i64 %pgocount21, 1
  store i64 %153, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 41)
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.loopexit, %.preheader27, %.preheader29, %7
  %154 = icmp sgt i32 %1, 0
  br i1 %154, label %.preheader24.lr.ph, label %.preheader21

.preheader24.lr.ph:                               ; preds = %.preheader25
  %pgocount22 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 30)
  %155 = add i64 %pgocount22, 1
  store i64 %155, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 30)
  %156 = icmp sgt i32 %0, 0
  br i1 %156, label %.preheader24.us.preheader, label %._crit_edge33

.preheader24.us.preheader:                        ; preds = %.preheader24.lr.ph
  %xtraiter93 = and i32 %0, 1
  %lcmp.mod94 = icmp eq i32 %xtraiter93, 0
  %157 = icmp eq i32 %0, 1
  %wide.trip.count97 = zext i32 %1 to i64
  %wide.trip.count89.1 = zext i32 %0 to i64
  %158 = fmul float %24, 0.000000e+00
  %159 = fmul float %exp2, 0.000000e+00
  %160 = fmul float %33, -0.000000e+00
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %._crit_edge48.us, %.preheader24.us.preheader
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge48.us ], [ 0, %.preheader24.us.preheader ]
  br i1 %lcmp.mod94, label %.prol.loopexit92, label %.prol.preheader91

.prol.preheader91:                                ; preds = %.preheader24.us
  %pgocount23 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 15)
  %161 = add i64 %pgocount23, 1
  store i64 %161, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 15)
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv95
  %163 = load float, float* %162, align 4
  %164 = fmul float %20, %163
  %165 = fadd float %158, %164
  %166 = fadd float %159, %165
  %167 = fadd float %160, %166
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv95
  store float %167, float* %168, align 4
  %169 = load float, float* %162, align 4
  br label %.prol.loopexit92

.prol.loopexit92:                                 ; preds = %.prol.preheader91, %.preheader24.us
  %indvars.iv87.unr.ph = phi i64 [ 1, %.prol.preheader91 ], [ 0, %.preheader24.us ]
  %.01844.us.unr.ph = phi float [ %169, %.prol.preheader91 ], [ 0.000000e+00, %.preheader24.us ]
  %.12043.us.unr.ph = phi float [ %167, %.prol.preheader91 ], [ 0.000000e+00, %.preheader24.us ]
  br i1 %157, label %.prol.loopexit92.._crit_edge48.us_crit_edge, label %.preheader24.us.new.preheader

.prol.loopexit92.._crit_edge48.us_crit_edge:      ; preds = %.prol.loopexit92
  %pgocount24 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 9)
  %170 = add i64 %pgocount24, 1
  store i64 %170, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 9)
  br label %._crit_edge48.us

.preheader24.us.new.preheader:                    ; preds = %.prol.loopexit92
  br label %.preheader24.us.new

.preheader24.us.new:                              ; preds = %.preheader24.us.new..preheader24.us.new_crit_edge, %.preheader24.us.new.preheader
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ %indvars.iv87.unr.ph, %.preheader24.us.new.preheader ]
  %.1846.us = phi float [ %179, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ 0.000000e+00, %.preheader24.us.new.preheader ]
  %.01844.us = phi float [ %192, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ %.01844.us.unr.ph, %.preheader24.us.new.preheader ]
  %.12043.us = phi float [ %190, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ %.12043.us.unr.ph, %.preheader24.us.new.preheader ]
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv87, i64 %indvars.iv95
  %172 = load float, float* %171, align 4
  %173 = fmul float %20, %172
  %174 = fmul float %24, %.01844.us
  %175 = fadd float %174, %173
  %176 = fmul float %exp2, %.12043.us
  %177 = fadd float %176, %175
  %178 = fmul float %.1846.us, %34
  %179 = fadd float %178, %177
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv87, i64 %indvars.iv95
  store float %179, float* %180, align 4
  %181 = load float, float* %171, align 4
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next88, i64 %indvars.iv95
  %183 = load float, float* %182, align 4
  %184 = fmul float %20, %183
  %185 = fmul float %24, %181
  %186 = fadd float %185, %184
  %187 = fmul float %exp2, %179
  %188 = fadd float %187, %186
  %189 = fmul float %.12043.us, %34
  %190 = fadd float %189, %188
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next88, i64 %indvars.iv95
  store float %190, float* %191, align 4
  %192 = load float, float* %182, align 4
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next88.1, %wide.trip.count89.1
  br i1 %exitcond90.1, label %._crit_edge48.us.loopexit, label %.preheader24.us.new..preheader24.us.new_crit_edge

.preheader24.us.new..preheader24.us.new_crit_edge: ; preds = %.preheader24.us.new
  %pgocount25 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 2)
  %193 = add i64 %pgocount25, 1
  store i64 %193, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 2)
  br label %.preheader24.us.new

._crit_edge48.us.loopexit:                        ; preds = %.preheader24.us.new
  %pgocount26 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 16)
  %194 = add i64 %pgocount26, 1
  store i64 %194, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 16)
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit92.._crit_edge48.us_crit_edge, %._crit_edge48.us.loopexit
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98, label %.preheader23, label %.preheader24.us

.preheader23:                                     ; preds = %._crit_edge48.us
  %pgocount27 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 33)
  %195 = add i64 %pgocount27, 1
  store i64 %195, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 33)
  %196 = icmp sgt i32 %1, 0
  br i1 %196, label %.preheader22.lr.ph, label %.preheader21

.preheader22.lr.ph:                               ; preds = %.preheader23
  %pgocount28 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 37)
  %197 = add i64 %pgocount28, 1
  store i64 %197, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 37)
  %198 = icmp sgt i32 %0, 0
  br i1 %198, label %.preheader22.us.preheader, label %._crit_edge33

.preheader22.us.preheader:                        ; preds = %.preheader22.lr.ph
  %pgocount29 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 40)
  %199 = add i64 %pgocount29, 1
  store i64 %199, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 40)
  %200 = sext i32 %0 to i64
  %wide.trip.count84 = zext i32 %1 to i64
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge41.us, %.preheader22.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader22.us.preheader ], [ %indvars.iv.next83, %._crit_edge41.us ]
  br label %201

; <label>:201:                                    ; preds = %._crit_edge1, %.preheader22.us
  %indvars.iv80 = phi i64 [ %200, %.preheader22.us ], [ %indvars.iv.next81, %._crit_edge1 ]
  %.138.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %.1237.us, %._crit_edge1 ]
  %.1237.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %208, %._crit_edge1 ]
  %.0336.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %.0435.us, %._crit_edge1 ]
  %.0435.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %211, %._crit_edge1 ]
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, -1
  %202 = fmul float %28, %.0435.us
  %203 = fmul float %.0336.us, %32
  %204 = fadd float %202, %203
  %205 = fmul float %exp2, %.1237.us
  %206 = fadd float %204, %205
  %207 = fmul float %.138.us, %34
  %208 = fadd float %206, %207
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next81, i64 %indvars.iv82
  store float %208, float* %209, align 4
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next81, i64 %indvars.iv82
  %211 = load float, float* %210, align 4
  %212 = icmp sgt i64 %indvars.iv80, 1
  br i1 %212, label %._crit_edge1, label %._crit_edge41.us

._crit_edge1:                                     ; preds = %201
  %pgocount30 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 4)
  %213 = add i64 %pgocount30, 1
  store i64 %213, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 4)
  br label %201

._crit_edge41.us:                                 ; preds = %201
  %pgocount31 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 20)
  %214 = add i64 %pgocount31, 1
  store i64 %214, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 20)
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %.preheader21.loopexit, label %.preheader22.us

.preheader21.loopexit:                            ; preds = %._crit_edge41.us
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %.preheader23, %.preheader25
  %215 = icmp sgt i32 %0, 0
  %216 = icmp sgt i32 %1, 0
  %or.cond = and i1 %215, %216
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge33

.preheader.us.preheader:                          ; preds = %.preheader21
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %217 = icmp eq i32 %1, 1
  %wide.trip.count78 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %218 = add nsw i64 %wide.trip.count.1, -2
  %219 = add nsw i64 %wide.trip.count.1, -2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep173 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 2
  %scevgep179 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 2
  %scevgep185 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %pgocount32 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 17)
  %220 = add i64 %pgocount32, 1
  store i64 %220, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 17)
  %221 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 0
  %222 = load float, float* %221, align 4
  %223 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 0
  %224 = load float, float* %223, align 4
  %225 = fadd float %222, %224
  %226 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 0
  store float %225, float* %226, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %217, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  %pgocount33 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 10)
  %227 = add i64 %pgocount33, 1
  store i64 %227, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 10)
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %pgocount34 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 18)
  %228 = add i64 %pgocount34, 1
  store i64 %228, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 18)
  %229 = sub nsw i64 %218, %indvars.iv.unr.ph
  %230 = lshr i64 %229, 1
  %231 = add nuw i64 %230, 1
  %min.iters.check164 = icmp ult i64 %231, 4
  br i1 %min.iters.check164, label %.preheader.us.new.preheader214, label %min.iters.checked165

min.iters.checked165:                             ; preds = %.preheader.us.new.preheader
  %pgocount35 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 21)
  %232 = add i64 %pgocount35, 1
  store i64 %232, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 21)
  %n.mod.vf166 = and i64 %231, 3
  %n.vec167 = sub i64 %231, %n.mod.vf166
  %cmp.zero168 = icmp eq i64 %n.vec167, 0
  br i1 %cmp.zero168, label %.preheader.us.new.preheader214, label %vector.memcheck196

vector.memcheck196:                               ; preds = %min.iters.checked165
  %pgocount36 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 22)
  %233 = add i64 %pgocount36, 1
  store i64 %233, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 22)
  %scevgep171 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %234 = sub nsw i64 %219, %indvars.iv.unr.ph
  %235 = and i64 %234, -2
  %236 = or i64 %indvars.iv.unr.ph, %235
  %scevgep174 = getelementptr float, float* %scevgep173, i64 %236
  %scevgep177 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %scevgep180 = getelementptr float, float* %scevgep179, i64 %236
  %scevgep183 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %scevgep186 = getelementptr float, float* %scevgep185, i64 %236
  %bound0188 = icmp ult float* %scevgep171, %scevgep180
  %bound1189 = icmp ult float* %scevgep177, %scevgep174
  %found.conflict190 = and i1 %bound0188, %bound1189
  %bound0191 = icmp ult float* %scevgep171, %scevgep186
  %bound1192 = icmp ult float* %scevgep183, %scevgep174
  %found.conflict193 = and i1 %bound0191, %bound1192
  %conflict.rdx194 = or i1 %found.conflict190, %found.conflict193
  %237 = or i64 %indvars.iv.unr.ph, 2
  %238 = shl nuw i64 %230, 1
  %239 = add i64 %237, %238
  %240 = shl nuw nsw i64 %n.mod.vf166, 1
  %ind.end201 = sub i64 %239, %240
  br i1 %conflict.rdx194, label %.preheader.us.new.preheader214, label %vector.body161.preheader

vector.body161.preheader:                         ; preds = %vector.memcheck196
  br label %vector.body161

vector.body161:                                   ; preds = %vector.body161.vector.body161_crit_edge, %vector.body161.preheader
  %index198 = phi i64 [ %index.next199, %vector.body161.vector.body161_crit_edge ], [ 0, %vector.body161.preheader ]
  %241 = shl i64 %index198, 1
  %offset.idx203 = or i64 %indvars.iv.unr.ph, %241
  %242 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %offset.idx203
  %243 = bitcast float* %242 to <8 x float>*
  %wide.vec207 = load <8 x float>, <8 x float>* %243, align 4, !alias.scope !16
  %244 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %offset.idx203
  %245 = bitcast float* %244 to <8 x float>*
  %wide.vec210 = load <8 x float>, <8 x float>* %245, align 4, !alias.scope !19
  %246 = fadd <8 x float> %wide.vec207, %wide.vec210
  %247 = shufflevector <8 x float> %246, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %248 = add nuw nsw i64 %offset.idx203, 1
  %249 = fadd <8 x float> %wide.vec207, %wide.vec210
  %250 = shufflevector <8 x float> %249, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %251 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %248
  %252 = getelementptr float, float* %251, i64 -1
  %253 = bitcast float* %252 to <8 x float>*
  %interleaved.vec213 = shufflevector <4 x float> %247, <4 x float> %250, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec213, <8 x float>* %253, align 4, !alias.scope !21, !noalias !23
  %index.next199 = add i64 %index198, 4
  %254 = icmp eq i64 %index.next199, %n.vec167
  br i1 %254, label %middle.block162, label %vector.body161.vector.body161_crit_edge, !llvm.loop !24

vector.body161.vector.body161_crit_edge:          ; preds = %vector.body161
  %pgocount37 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 6)
  %255 = add i64 %pgocount37, 1
  store i64 %255, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 6)
  br label %vector.body161

middle.block162:                                  ; preds = %vector.body161
  %pgocount38 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 28)
  %256 = add i64 %pgocount38, 1
  store i64 %256, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 28)
  %cmp.n202 = icmp eq i64 %n.mod.vf166, 0
  br i1 %cmp.n202, label %._crit_edge.us, label %.preheader.us.new.preheader214

.preheader.us.new.preheader214:                   ; preds = %middle.block162, %vector.memcheck196, %min.iters.checked165, %.preheader.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck196 ], [ %indvars.iv.unr.ph, %min.iters.checked165 ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ], [ %ind.end201, %middle.block162 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader214
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.ph, %.preheader.us.new.preheader214 ]
  %257 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv
  %258 = load float, float* %257, align 4
  %259 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv
  %260 = load float, float* %259, align 4
  %261 = fadd float %258, %260
  %262 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv
  store float %261, float* %262, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %263 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv.next
  %264 = load float, float* %263, align 4
  %265 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv.next
  %266 = load float, float* %265, align 4
  %267 = fadd float %264, %266
  %268 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv.next
  store float %267, float* %268, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge, !llvm.loop !25

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount39 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 3)
  %269 = add i64 %pgocount39, 1
  store i64 %269, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 3)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount40 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 19)
  %270 = add i64 %pgocount40, 1
  store i64 %270, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 19)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit, %middle.block162
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond = icmp eq i64 %indvars.iv.next77, %wide.trip.count78
  br i1 %exitcond, label %._crit_edge33.loopexit, label %.preheader.us

._crit_edge33.loopexit:                           ; preds = %._crit_edge.us
  %pgocount41 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 35)
  %271 = add i64 %pgocount41, 1
  store i64 %271, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 35)
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader21, %.preheader22.lr.ph, %.preheader24.lr.ph, %.preheader26.lr.ph, %.preheader28.lr.ph, %.preheader30.lr.ph
  %pgocount42 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 23)
  %272 = add i64 %pgocount42, 1
  store i64 %272, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 23)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %12

; <label>:12:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %21 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %18, label %._crit_edge

._crit_edge:                                      ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %21

; <label>:18:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %._crit_edge, %18
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %24 = load float, float* %23, align 4
  %25 = fpext float %24 to double
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %25) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!7, !10}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = !{!22}
!22 = distinct !{!22, !18}
!23 = !{!17, !20}
!24 = distinct !{!24, !2, !3}
!25 = distinct !{!25, !2, !3}
