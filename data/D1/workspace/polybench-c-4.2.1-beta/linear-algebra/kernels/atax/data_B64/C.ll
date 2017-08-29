; ModuleID = 'B.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_atax = private constant [16 x i8] c"B.ll:kernel_atax"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 131680681903, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_atax = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_atax = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7745204956806891293, i64 195543935330, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_atax\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_atax to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2100, double* %9)
  br label %18

; <label>:18:                                     ; preds = %16, %12, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = sitofp i32 %1 to double
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph9.preheader, label %.preheader2

.lr.ph9.preheader:                                ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %xtraiter19 = and i32 %1, 1
  %lcmp.mod20 = icmp eq i32 %xtraiter19, 0
  br i1 %lcmp.mod20, label %.lr.ph9.prol.loopexit, label %.lr.ph9.prol

.lr.ph9.prol:                                     ; preds = %.lr.ph9.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %9 = fdiv double 0.000000e+00, %5
  %10 = fadd double %9, 1.000000e+00
  store double %10, double* %3, align 8
  br label %.lr.ph9.prol.loopexit

.lr.ph9.prol.loopexit:                            ; preds = %.lr.ph9.prol, %.lr.ph9.preheader
  %indvars.iv15.unr = phi i64 [ 0, %.lr.ph9.preheader ], [ 1, %.lr.ph9.prol ]
  %11 = icmp eq i32 %1, 1
  br i1 %11, label %.preheader2, label %.lr.ph9.preheader21

.lr.ph9.preheader21:                              ; preds = %.lr.ph9.prol.loopexit
  %wide.trip.count17.1 = zext i32 %1 to i64
  br label %.lr.ph9

.preheader2.loopexit:                             ; preds = %.lr.ph9
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.lr.ph9.prol.loopexit, %4
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader.lr.ph, label %._crit_edge6

.preheader.lr.ph:                                 ; preds = %.preheader2
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %14 = add i64 %pgocount3, 1
  store i64 %14, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %15 = icmp sgt i32 %1, 0
  %16 = mul nsw i32 %0, 5
  %17 = sitofp i32 %16 to double
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge6

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %1, 1
  %wide.trip.count13 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %19 = add i64 %pgocount4, 1
  store i64 %19, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %20 = trunc i64 %indvars.iv11 to i32
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %17
  %24 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 0
  store double %23, double* %24, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %18, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %25 = add i64 %pgocount5, 1
  store i64 %25, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %26 = add nuw nsw i64 %indvars.iv, %indvars.iv11
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %17
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = add nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %17
  %37 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %36, double* %37, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %38 = add i64 %pgocount6, 1
  store i64 %38, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %39 = add i64 %pgocount7, 1
  store i64 %39, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.preheader.us

.lr.ph9:                                          ; preds = %.lr.ph9..lr.ph9_crit_edge, %.lr.ph9.preheader21
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.lr.ph9..lr.ph9_crit_edge ], [ %indvars.iv15.unr, %.lr.ph9.preheader21 ]
  %40 = trunc i64 %indvars.iv15 to i32
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %5
  %43 = fadd double %42, 1.000000e+00
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  store double %43, double* %44, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %45 = trunc i64 %indvars.iv.next16 to i32
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %5
  %48 = fadd double %47, 1.000000e+00
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  store double %48, double* %49, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, %wide.trip.count17.1
  br i1 %exitcond18.1, label %.preheader2.loopexit, label %.lr.ph9..lr.ph9_crit_edge

.lr.ph9..lr.ph9_crit_edge:                        ; preds = %.lr.ph9
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %50 = add i64 %pgocount8, 1
  store i64 %50, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %.lr.ph9

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %51 = add i64 %pgocount9, 1
  store i64 %51, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader.lr.ph, %.preheader2
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %52 = add i64 %pgocount10, 1
  store i64 %52, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %7 = bitcast double* %5 to i8*
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader3.loopexit, label %.preheader3

.preheader3.loopexit:                             ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 14)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 14)
  %10 = bitcast double* %4 to i8*
  %11 = add i32 %1, -1
  %12 = zext i32 %11 to i64
  %13 = shl nuw nsw i64 %12, 3
  %14 = add nuw nsw i64 %13, 8
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 %14, i32 8, i1 false)
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %6
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %.preheader3
  %16 = icmp sgt i32 %1, 0
  %17 = icmp sgt i32 %1, 0
  br i1 %16, label %.lr.ph8.split.us.preheader, label %._crit_edge9.loopexit21

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %18 = add i32 %1, -1
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %19 = icmp eq i32 %18, 0
  %xtraiter25 = and i32 %1, 1
  %lcmp.mod26 = icmp eq i32 %xtraiter25, 0
  %20 = icmp eq i32 %18, 0
  %wide.trip.count24.1 = zext i32 %1 to i64
  %wide.trip.count31 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %21 = add nsw i64 %wide.trip.count24.1, -2
  %scevgep43 = getelementptr double, double* %4, i64 2
  %22 = add nsw i64 %wide.trip.count24.1, -2
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv29 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next30, %._crit_edge.us ]
  %scevgep49 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 2
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv29
  store double 0.000000e+00, double* %23, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph8.split.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 6)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 6)
  %25 = load double, double* %23, align 8
  %26 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 0
  %27 = load double, double* %26, align 8
  %28 = load double, double* %3, align 8
  %29 = fmul double %27, %28
  %30 = fadd double %25, %29
  store double %30, double* %23, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph8.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph8.split.us ]
  br i1 %19, label %..preheader_crit_edge.us, label %.lr.ph8.split.us.new.preheader

.lr.ph8.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph8.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %..preheader_crit_edge.us.._crit_edge.us_crit_edge, %middle.block, %.lr.ph6.us.prol.loopexit, %._crit_edge.us.loopexit
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %wide.trip.count31
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us..lr.ph6.us_crit_edge, %.lr.ph6.us.preheader60
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.lr.ph6.us..lr.ph6.us_crit_edge ], [ %indvars.iv22.ph, %.lr.ph6.us.preheader60 ]
  %31 = getelementptr inbounds double, double* %4, i64 %indvars.iv22
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv22
  %34 = load double, double* %33, align 8
  %35 = load double, double* %23, align 8
  %36 = fmul double %34, %35
  %37 = fadd double %32, %36
  store double %37, double* %31, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %38 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next23
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next23
  %41 = load double, double* %40, align 8
  %42 = load double, double* %23, align 8
  %43 = fmul double %41, %42
  %44 = fadd double %39, %43
  store double %44, double* %38, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.128 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.128, label %._crit_edge.us.loopexit, label %.lr.ph6.us..lr.ph6.us_crit_edge, !llvm.loop !1

.lr.ph6.us..lr.ph6.us_crit_edge:                  ; preds = %.lr.ph6.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 1)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 1)
  br label %.lr.ph6.us

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us.new..lr.ph8.split.us.new_crit_edge, %.lr.ph8.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph8.split.us.new..lr.ph8.split.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph8.split.us.new.preheader ]
  %46 = load double, double* %23, align 8
  %47 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %46, %51
  store double %52, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..preheader_crit_edge.us.loopexit, label %.lr.ph8.split.us.new..lr.ph8.split.us.new_crit_edge

.lr.ph8.split.us.new..lr.ph8.split.us.new_crit_edge: ; preds = %.lr.ph8.split.us.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 0)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 0)
  br label %.lr.ph8.split.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph8.split.us.new
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 4)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 4)
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %17, label %.lr.ph6.us.preheader, label %..preheader_crit_edge.us.._crit_edge.us_crit_edge

..preheader_crit_edge.us.._crit_edge.us_crit_edge: ; preds = %..preheader_crit_edge.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 3)
  %61 = add i64 %pgocount5, 1
  store i64 %61, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 3)
  br label %._crit_edge.us

.lr.ph6.us.preheader:                             ; preds = %..preheader_crit_edge.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 5)
  %62 = add i64 %pgocount6, 1
  store i64 %62, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 5)
  br i1 %lcmp.mod26, label %.lr.ph6.us.prol.loopexit, label %.lr.ph6.us.prol

.lr.ph6.us.prol:                                  ; preds = %.lr.ph6.us.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 9)
  %63 = add i64 %pgocount7, 1
  store i64 %63, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 9)
  %64 = load double, double* %4, align 8
  %65 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 0
  %66 = load double, double* %65, align 8
  %67 = load double, double* %23, align 8
  %68 = fmul double %66, %67
  %69 = fadd double %64, %68
  store double %69, double* %4, align 8
  br label %.lr.ph6.us.prol.loopexit

.lr.ph6.us.prol.loopexit:                         ; preds = %.lr.ph6.us.prol, %.lr.ph6.us.preheader
  %indvars.iv22.unr.ph = phi i64 [ 1, %.lr.ph6.us.prol ], [ 0, %.lr.ph6.us.preheader ]
  br i1 %20, label %._crit_edge.us, label %.lr.ph6.us.preheader41

.lr.ph6.us.preheader41:                           ; preds = %.lr.ph6.us.prol.loopexit
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 7)
  %70 = add i64 %pgocount8, 1
  store i64 %70, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 7)
  %71 = sub nsw i64 %21, %indvars.iv22.unr.ph
  %72 = lshr i64 %71, 1
  %73 = add nuw i64 %72, 1
  %min.iters.check = icmp ult i64 %73, 2
  br i1 %min.iters.check, label %.lr.ph6.us.preheader60, label %min.iters.checked

.lr.ph6.us.preheader60:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6.us.preheader41
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr.ph, %vector.memcheck ], [ %indvars.iv22.unr.ph, %min.iters.checked ], [ %indvars.iv22.unr.ph, %.lr.ph6.us.preheader41 ], [ %ind.end, %middle.block ]
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 8)
  %74 = add i64 %pgocount9, 1
  store i64 %74, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 8)
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader41
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 10)
  %75 = add i64 %pgocount10, 1
  store i64 %75, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 10)
  %n.mod.vf = and i64 %73, 1
  %n.vec = sub i64 %73, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph6.us.preheader60, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 11)
  %76 = add i64 %pgocount11, 1
  store i64 %76, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 11)
  %scevgep = getelementptr double, double* %4, i64 %indvars.iv22.unr.ph
  %77 = sub nsw i64 %22, %indvars.iv22.unr.ph
  %78 = and i64 %77, -2
  %79 = or i64 %indvars.iv22.unr.ph, %78
  %scevgep44 = getelementptr double, double* %scevgep43, i64 %79
  %scevgep47 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv22.unr.ph
  %scevgep50 = getelementptr double, double* %scevgep49, i64 %79
  %bound0 = icmp ult double* %scevgep, %scevgep50
  %bound1 = icmp ult double* %scevgep47, %scevgep44
  %found.conflict = and i1 %bound0, %bound1
  %bound053 = icmp ult double* %scevgep, %23
  %bound154 = icmp ult double* %23, %scevgep44
  %found.conflict55 = and i1 %bound053, %bound154
  %conflict.rdx = or i1 %found.conflict, %found.conflict55
  %80 = or i64 %indvars.iv22.unr.ph, 2
  %81 = shl nuw i64 %72, 1
  %82 = add i64 %80, %81
  %83 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %82, %83
  br i1 %conflict.rdx, label %.lr.ph6.us.preheader60, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %84 = load double, double* %23, align 8, !alias.scope !4
  %85 = insertelement <2 x double> undef, double %84, i32 0
  %86 = shufflevector <2 x double> %85, <2 x double> undef, <2 x i32> zeroinitializer
  %87 = load double, double* %23, align 8, !alias.scope !4
  %88 = insertelement <2 x double> undef, double %87, i32 0
  %89 = shufflevector <2 x double> %88, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %90 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv22.unr.ph, %90
  %91 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %92 = bitcast double* %91 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %92, align 8, !alias.scope !7, !noalias !9
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec56 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %93 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %offset.idx
  %94 = bitcast double* %93 to <4 x double>*
  %wide.vec57 = load <4 x double>, <4 x double>* %94, align 8, !alias.scope !11
  %strided.vec58 = shufflevector <4 x double> %wide.vec57, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec59 = shufflevector <4 x double> %wide.vec57, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %95 = fmul <2 x double> %strided.vec58, %86
  %96 = fadd <2 x double> %strided.vec, %95
  %97 = add nuw nsw i64 %offset.idx, 1
  %98 = getelementptr inbounds double, double* %4, i64 %97
  %99 = fmul <2 x double> %strided.vec59, %89
  %100 = fadd <2 x double> %strided.vec56, %99
  %101 = getelementptr double, double* %98, i64 -1
  %102 = bitcast double* %101 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %96, <2 x double> %100, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %102, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 2
  %103 = icmp eq i64 %index.next, %n.vec
  br i1 %103, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !12

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 2)
  %104 = add i64 %pgocount12, 1
  store i64 %104, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 2)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 13)
  %105 = add i64 %pgocount13, 1
  store i64 %105, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 13)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph6.us.preheader60

._crit_edge9.loopexit21:                          ; preds = %.lr.ph8
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 16)
  %106 = add i64 %pgocount14, 1
  store i64 %106, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 16)
  %107 = add i32 %0, -1
  %108 = zext i32 %107 to i64
  %109 = shl nuw nsw i64 %108, 3
  %110 = add nuw nsw i64 %109, 8
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %110, i32 8, i1 false)
  br label %._crit_edge9

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 15)
  %111 = add i64 %pgocount15, 1
  store i64 %111, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 15)
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge9.loopexit21, %.preheader3
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 12)
  %112 = add i64 %pgocount16, 1
  store i64 %112, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 12)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %15, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %15

; <label>:12:                                     ; preds = %.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %.lr.ph._crit_edge, %12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10, !5}
!10 = distinct !{!10, !6}
!11 = !{!10}
!12 = distinct !{!12, !2, !3}
