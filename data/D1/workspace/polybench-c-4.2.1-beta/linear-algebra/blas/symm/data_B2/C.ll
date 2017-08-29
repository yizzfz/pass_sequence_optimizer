; ModuleID = 'B.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_symm = private constant [16 x i8] c"B.ll:kernel_symm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 216003077631, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_symm = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_symm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7942146524714263212, i64 173535970358, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_symm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_symm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %20

; <label>:20:                                     ; preds = %18, %14, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge11

.preheader5.lr.ph:                                ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader5.us.preheader, label %.preheader3.lr.ph

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %12 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count41 = zext i32 %0 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.us.preheader
  %indvars.iv39 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next40, %._crit_edge14.us ]
  %13 = add i64 %indvars.iv39, %12
  %14 = trunc i64 %13 to i32
  br label %15

; <label>:15:                                     ; preds = %._crit_edge1, %.preheader5.us
  %indvars.iv36 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next37, %._crit_edge1 ]
  %16 = add nuw nsw i64 %indvars.iv36, %indvars.iv39
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %11
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv36
  store double %20, double* %21, align 8
  %22 = trunc i64 %indvars.iv36 to i32
  %23 = sub i32 %14, %22
  %24 = srem i32 %23, 100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %11
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv36
  store double %26, double* %27, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, %wide.trip.count
  br i1 %exitcond38, label %._crit_edge14.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %15

._crit_edge14.us:                                 ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %.preheader4, label %.preheader5.us

.preheader4:                                      ; preds = %._crit_edge14.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %30 = add i64 %pgocount4, 1
  store i64 %30, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %31 = icmp sgt i32 %0, 0
  br i1 %31, label %.preheader3.lr.ph, label %._crit_edge11

.preheader3.lr.ph:                                ; preds = %.preheader4, %.preheader5.lr.ph
  %32 = sitofp i32 %0 to double
  %33 = add i32 %0, 7
  %34 = add i32 %0, -2
  %35 = sext i32 %0 to i64
  %wide.trip.count24.7 = zext i32 %0 to i64
  %wide.trip.count35 = zext i32 %0 to i64
  %36 = add nsw i64 %wide.trip.count24.7, -8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader3.lr.ph
  %indvars.iv33 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next34, %._crit_edge ]
  %indvars.iv31 = phi i64 [ 1, %.preheader3.lr.ph ], [ %indvars.iv.next32, %._crit_edge ]
  %37 = sub nsw i64 0, %indvars.iv33
  %38 = trunc i64 %37 to i32
  %39 = add i32 %33, %38
  %40 = trunc i64 %37 to i32
  %41 = add i32 %34, %40
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %xtraiter44 = and i64 %indvars.iv.next34, 1
  %lcmp.mod = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %43 = trunc i64 %indvars.iv33 to i32
  %44 = srem i32 %43, 100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %32
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 0
  store double %46, double* %47, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %48 = icmp eq i64 %indvars.iv33, 0
  br i1 %48, label %.prol.loopexit..preheader_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit..preheader_crit_edge:              ; preds = %.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %50 = add i64 %pgocount7, 1
  store i64 %50, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %.preheader

.preheader:                                       ; preds = %.prol.loopexit..preheader_crit_edge, %.preheader.loopexit
  %51 = icmp slt i64 %indvars.iv.next34, %35
  br i1 %51, label %.lr.ph9, label %._crit_edge

.lr.ph9:                                          ; preds = %.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %52 = add i64 %pgocount8, 1
  store i64 %52, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %xtraiter27 = and i32 %39, 7
  %lcmp.mod28 = icmp eq i32 %xtraiter27, 0
  br i1 %lcmp.mod28, label %.prol.loopexit26, label %.prol.preheader25.preheader

.prol.preheader25.preheader:                      ; preds = %.lr.ph9
  br label %.prol.preheader25

.prol.preheader25:                                ; preds = %.prol.preheader25..prol.preheader25_crit_edge, %.prol.preheader25.preheader
  %indvars.iv22.prol = phi i64 [ %indvars.iv.next23.prol, %.prol.preheader25..prol.preheader25_crit_edge ], [ %indvars.iv31, %.prol.preheader25.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader25..prol.preheader25_crit_edge ], [ %xtraiter27, %.prol.preheader25.preheader ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22.prol
  store double -9.990000e+02, double* %53, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit26.loopexit, label %.prol.preheader25..prol.preheader25_crit_edge, !llvm.loop !1

.prol.preheader25..prol.preheader25_crit_edge:    ; preds = %.prol.preheader25
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %54 = add i64 %pgocount9, 1
  store i64 %54, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %.prol.preheader25

.prol.loopexit26.loopexit:                        ; preds = %.prol.preheader25
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %55 = add i64 %pgocount10, 1
  store i64 %55, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %.prol.loopexit26

.prol.loopexit26:                                 ; preds = %.prol.loopexit26.loopexit, %.lr.ph9
  %indvars.iv22.unr = phi i64 [ %indvars.iv31, %.lr.ph9 ], [ %indvars.iv.next23.prol, %.prol.loopexit26.loopexit ]
  %56 = icmp ult i32 %41, 7
  br i1 %56, label %._crit_edge, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit26
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %57 = add i64 %pgocount11, 1
  store i64 %57, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %58 = sub i64 %36, %indvars.iv22.unr
  %59 = lshr i64 %58, 3
  %60 = add nuw nsw i64 %59, 1
  %min.iters.check = icmp ult i64 %60, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader46, label %min.iters.checked

.lr.ph9.new.preheader46:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr, %min.iters.checked ], [ %indvars.iv22.unr, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %61 = add i64 %pgocount12, 1
  store i64 %61, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %n.mod.vf = and i64 %60, 1
  %n.vec = sub nsw i64 %60, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %62 = add i64 %indvars.iv22.unr, 8
  %63 = shl nuw i64 %59, 3
  %64 = add i64 %62, %63
  %65 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %64, %65
  br i1 %cmp.zero, label %.lr.ph9.new.preheader46, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %66 = shl i64 %index, 3
  %67 = add i64 %indvars.iv22.unr, %66
  %68 = add nsw i64 %67, 7
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %68
  %70 = getelementptr double, double* %69, i64 -7
  %71 = bitcast double* %70 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %71, align 8
  %index.next = add i64 %index, 2
  %72 = icmp eq i64 %index.next, %n.vec
  br i1 %72, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %73 = add i64 %pgocount13, 1
  store i64 %73, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %74 = add i64 %pgocount14, 1
  store i64 %74, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph9.new.preheader46

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %75 = add nuw nsw i64 %indvars.iv, %indvars.iv33
  %76 = trunc i64 %75 to i32
  %77 = srem i32 %76, 100
  %78 = sitofp i32 %77 to double
  %79 = fdiv double %78, %32
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv
  store double %79, double* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = add nuw nsw i64 %indvars.iv.next, %indvars.iv33
  %82 = trunc i64 %81 to i32
  %83 = srem i32 %82, 100
  %84 = sitofp i32 %83 to double
  %85 = fdiv double %84, %32
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next
  store double %85, double* %86, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv31
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %87 = add i64 %pgocount15, 1
  store i64 %87, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %.lr.ph.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new..lr.ph9.new_crit_edge, %.lr.ph9.new.preheader46
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.7, %.lr.ph9.new..lr.ph9.new_crit_edge ], [ %indvars.iv22.ph, %.lr.ph9.new.preheader46 ]
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22
  store double -9.990000e+02, double* %88, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23
  store double -9.990000e+02, double* %89, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.1
  store double -9.990000e+02, double* %90, align 8
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv22, 3
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.2
  store double -9.990000e+02, double* %91, align 8
  %indvars.iv.next23.3 = add nsw i64 %indvars.iv22, 4
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.3
  store double -9.990000e+02, double* %92, align 8
  %indvars.iv.next23.4 = add nsw i64 %indvars.iv22, 5
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.4
  store double -9.990000e+02, double* %93, align 8
  %indvars.iv.next23.5 = add nsw i64 %indvars.iv22, 6
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.5
  store double -9.990000e+02, double* %94, align 8
  %indvars.iv.next23.6 = add nsw i64 %indvars.iv22, 7
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23.6
  store double -9.990000e+02, double* %95, align 8
  %indvars.iv.next23.7 = add nsw i64 %indvars.iv22, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next23.7, %wide.trip.count24.7
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph9.new..lr.ph9.new_crit_edge, !llvm.loop !6

.lr.ph9.new..lr.ph9.new_crit_edge:                ; preds = %.lr.ph9.new
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %96 = add i64 %pgocount16, 1
  store i64 %96, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %.lr.ph9.new

._crit_edge.loopexit:                             ; preds = %.lr.ph9.new
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %97 = add i64 %pgocount17, 1
  store i64 %97, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.prol.loopexit26, %.preheader
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond, label %._crit_edge11.loopexit, label %.lr.ph

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %98 = add i64 %pgocount18, 1
  store i64 %98, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader4, %7
  %pgocount19 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %99 = add i64 %pgocount19, 1
  store i64 %99, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader4.us.preheader, label %._crit_edge15

.preheader4.us.preheader:                         ; preds = %7
  %wide.trip.count44 = zext i32 %0 to i64
  %wide.trip.count40 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count40, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count40, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert62 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat63 = shufflevector <2 x double> %broadcast.splatinsert62, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert66 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat67 = shufflevector <2 x double> %broadcast.splatinsert66, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert68 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat69 = shufflevector <2 x double> %broadcast.splatinsert68, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 0
  %scevgep50 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %wide.trip.count40
  %scevgep52 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 0
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %wide.trip.count40
  %13 = icmp sgt i64 %indvars.iv42, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv42
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us21.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader4.us
  br label %.preheader.us.us

.preheader.us21.preheader:                        ; preds = %.preheader4.us
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 5)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 5)
  br i1 %min.iters.check, label %.preheader.us21.preheader70, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us21.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 7)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 7)
  br i1 %cmp.zero, label %.preheader.us21.preheader70, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 10)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 10)
  %bound0 = icmp ult double* %scevgep, %scevgep54
  %bound1 = icmp ult double* %scevgep52, %scevgep50
  %found.conflict = and i1 %bound0, %bound1
  %bound057 = icmp ult double* %scevgep, %14
  %bound158 = icmp ult double* %14, %scevgep50
  %found.conflict59 = and i1 %bound057, %bound158
  %conflict.rdx = or i1 %found.conflict, %found.conflict59
  br i1 %conflict.rdx, label %.preheader.us21.preheader70, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %18 = load double, double* %14, align 8, !alias.scope !8
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %18, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !11, !noalias !13
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !11, !noalias !13
  %27 = fmul <2 x double> %wide.load, %broadcast.splat63
  %28 = fmul <2 x double> %wide.load61, %broadcast.splat63
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %index
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !15
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !15
  %33 = fmul <2 x double> %wide.load64, %broadcast.splat67
  %34 = fmul <2 x double> %wide.load65, %broadcast.splat67
  %35 = fmul <2 x double> %33, %20
  %36 = fmul <2 x double> %34, %22
  %37 = fadd <2 x double> %27, %35
  %38 = fadd <2 x double> %28, %36
  %39 = fadd <2 x double> %broadcast.splat69, %37
  %40 = fadd <2 x double> %broadcast.splat69, %38
  %41 = bitcast double* %23 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8, !alias.scope !11, !noalias !13
  %42 = bitcast double* %25 to <2 x double>*
  store <2 x double> %40, <2 x double>* %42, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 2)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 2)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 12)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 12)
  br i1 %cmp.n, label %._crit_edge11.us, label %.preheader.us21.preheader70

.preheader.us21.preheader70:                      ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us21.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us21.preheader ], [ %n.vec, %middle.block ]
  %46 = sub nsw i64 %wide.trip.count40, %indvars.iv.ph
  %xtraiter = and i64 %46, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us21.prol.loopexit.unr-lcssa, label %.preheader.us21.prol.preheader

.preheader.us21.prol.preheader:                   ; preds = %.preheader.us21.preheader70
  br label %.preheader.us21.prol

.preheader.us21.prol:                             ; preds = %.preheader.us21.prol.preheader
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 8)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 8)
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv.ph
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv.ph
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %2
  %54 = load double, double* %14, align 8
  %55 = fmul double %53, %54
  %56 = fadd double %50, %55
  %57 = fadd double %10, %56
  store double %57, double* %48, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us21.prol.loopexit.unr-lcssa

.preheader.us21.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us21.prol, %.preheader.us21.preheader70
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us21.prol ], [ %indvars.iv.ph, %.preheader.us21.preheader70 ]
  br label %.preheader.us21.prol.loopexit

.preheader.us21.prol.loopexit:                    ; preds = %.preheader.us21.prol.loopexit.unr-lcssa
  %58 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %58, label %._crit_edge11.us.loopexit71, label %.preheader.us21.preheader70.new

.preheader.us21.preheader70.new:                  ; preds = %.preheader.us21.prol.loopexit
  br label %.preheader.us21

.preheader.us21:                                  ; preds = %.preheader.us21..preheader.us21_crit_edge, %.preheader.us21.preheader70.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us21.preheader70.new ], [ %indvars.iv.next.1, %.preheader.us21..preheader.us21_crit_edge ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %3
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %2
  %65 = load double, double* %14, align 8
  %66 = fmul double %64, %65
  %67 = fadd double %61, %66
  %68 = fadd double %10, %67
  store double %68, double* %59, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv.next
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %3
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv.next
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %2
  %75 = load double, double* %14, align 8
  %76 = fmul double %74, %75
  %77 = fadd double %71, %76
  %78 = fadd double %10, %77
  store double %78, double* %69, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge11.us.loopexit71.unr-lcssa, label %.preheader.us21..preheader.us21_crit_edge, !llvm.loop !17

.preheader.us21..preheader.us21_crit_edge:        ; preds = %.preheader.us21
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 1)
  %79 = add i64 %pgocount6, 1
  store i64 %79, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 1)
  br label %.preheader.us21

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 4)
  %80 = add i64 %pgocount7, 1
  store i64 %80, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 4)
  br label %._crit_edge11.us

._crit_edge11.us.loopexit71.unr-lcssa:            ; preds = %.preheader.us21
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 9)
  %81 = add i64 %pgocount8, 1
  store i64 %81, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 9)
  br label %._crit_edge11.us.loopexit71

._crit_edge11.us.loopexit71:                      ; preds = %._crit_edge11.us.loopexit71.unr-lcssa, %.preheader.us21.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 6)
  %82 = add i64 %pgocount9, 1
  store i64 %82, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 6)
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit71, %._crit_edge11.us.loopexit, %middle.block
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge15.loopexit, label %.preheader4.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv38
  br label %96

._crit_edge.us.us:                                ; preds = %96
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 3)
  %84 = add i64 %pgocount10, 1
  store i64 %84, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 3)
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv38
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %3
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv38
  %89 = load double, double* %88, align 8
  %90 = fmul double %89, %2
  %91 = load double, double* %14, align 8
  %92 = fmul double %90, %91
  %93 = fadd double %87, %92
  %94 = fmul double %109, %2
  %95 = fadd double %94, %93
  store double %95, double* %85, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge11.us.loopexit, label %.preheader.us.us

; <label>:96:                                     ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge ], [ 0, %.preheader.us.us ]
  %.07.us.us = phi double [ %109, %._crit_edge ], [ 0.000000e+00, %.preheader.us.us ]
  %97 = load double, double* %83, align 8
  %98 = fmul double %97, %2
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv32
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv32, i64 %indvars.iv38
  %103 = load double, double* %102, align 8
  %104 = fadd double %103, %101
  store double %104, double* %102, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv38
  %106 = load double, double* %105, align 8
  %107 = load double, double* %99, align 8
  %108 = fmul double %106, %107
  %109 = fadd double %.07.us.us, %108
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next33, %indvars.iv42
  br i1 %exitcond37, label %._crit_edge.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %96
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 0)
  %110 = add i64 %pgocount11, 1
  store i64 %110, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 0)
  br label %96

._crit_edge15.loopexit:                           ; preds = %._crit_edge11.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 13)
  %111 = add i64 %pgocount12, 1
  store i64 %111, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 13)
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %7
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 11)
  %112 = add i64 %pgocount13, 1
  store i64 %112, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 11)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %21

; <label>:21:                                     ; preds = %._crit_edge, %18
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
