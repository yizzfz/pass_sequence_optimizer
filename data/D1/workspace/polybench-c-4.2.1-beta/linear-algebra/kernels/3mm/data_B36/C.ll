; ModuleID = 'B.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_3mm = private constant [15 x i8] c"B.ll:kernel_3mm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 199883487418, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_3mm = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_3mm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7165158374039736084, i64 317953800481, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_3mm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_3mm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %24

; <label>:18:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %20 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %20, align 1
  %21 = icmp eq i8 %strcmpload, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %24

; <label>:24:                                     ; preds = %22, %18, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %12 = icmp sgt i32 %2, 0
  %13 = mul nsw i32 %0, 5
  %14 = sitofp i32 %13 to double
  br i1 %12, label %.preheader10.us.preheader, label %.preheader7

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %wide.trip.count59 = zext i32 %2 to i64
  %wide.trip.count63 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge27.us ], [ 0, %.preheader10.us.preheader ]
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %16 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %17 = add nuw nsw i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %0
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %14
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv57
  store double %21, double* %22, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge27.us, label %._crit_edge

._crit_edge:                                      ; preds = %15
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %23 = add i64 %pgocount4, 1
  store i64 %23, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %15

._crit_edge27.us:                                 ; preds = %15
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %24 = add i64 %pgocount5, 1
  store i64 %24, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.preheader9.loopexit, label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %25 = add i64 %pgocount6, 1
  store i64 %25, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %9
  %26 = icmp sgt i32 %2, 0
  br i1 %26, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %27 = add i64 %pgocount7, 1
  store i64 %27, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %28 = icmp sgt i32 %1, 0
  %29 = mul nsw i32 %1, 5
  %30 = sitofp i32 %29 to double
  br i1 %28, label %.preheader8.us.preheader, label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %wide.trip.count50 = zext i32 %1 to i64
  %wide.trip.count54 = zext i32 %2 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  br label %31

; <label>:31:                                     ; preds = %._crit_edge3, %.preheader8.us
  %indvars.iv48 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next49, %._crit_edge3 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %32 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %33 = add nuw nsw i64 %32, 2
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %1
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %30
  %38 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv48
  store double %37, double* %38, align 8
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %._crit_edge22.us, label %._crit_edge3

._crit_edge3:                                     ; preds = %31
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %39 = add i64 %pgocount8, 1
  store i64 %39, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %31

._crit_edge22.us:                                 ; preds = %31
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %40 = add i64 %pgocount9, 1
  store i64 %40, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %41 = add i64 %pgocount10, 1
  store i64 %41, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9, %.preheader10.lr.ph
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %43 = add i64 %pgocount11, 1
  store i64 %43, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %44 = icmp sgt i32 %4, 0
  %45 = mul nsw i32 %3, 5
  %46 = sitofp i32 %45 to double
  br i1 %44, label %.preheader6.us.preheader, label %._crit_edge14

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count41 = zext i32 %4 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us, %.preheader6.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader6.us.preheader ]
  br label %47

; <label>:47:                                     ; preds = %._crit_edge1, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge1 ]
  %48 = add nuw nsw i64 %indvars.iv39, 3
  %49 = mul nuw nsw i64 %48, %indvars.iv43
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %3
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %46
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv43, i64 %indvars.iv39
  store double %53, double* %54, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %47
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %55 = add i64 %pgocount12, 1
  store i64 %55, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %47

._crit_edge17.us:                                 ; preds = %47
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %56 = add i64 %pgocount13, 1
  store i64 %56, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %57 = add i64 %pgocount14, 1
  store i64 %57, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7, %.preheader8.lr.ph
  %58 = icmp sgt i32 %4, 0
  br i1 %58, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %59 = add i64 %pgocount15, 1
  store i64 %59, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %60 = icmp sgt i32 %3, 0
  %61 = mul nsw i32 %2, 5
  %62 = sitofp i32 %61 to double
  br i1 %60, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count36 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %63

; <label>:63:                                     ; preds = %._crit_edge2, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge2 ]
  %64 = add nuw nsw i64 %indvars.iv, 2
  %65 = mul nuw nsw i64 %64, %indvars.iv34
  %66 = add nuw nsw i64 %65, 2
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %2
  %69 = sitofp i32 %68 to double
  %70 = fdiv double %69, %62
  %71 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv34, i64 %indvars.iv
  store double %70, double* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge2:                                     ; preds = %63
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %72 = add i64 %pgocount16, 1
  store i64 %72, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %63

._crit_edge.us:                                   ; preds = %63
  %pgocount17 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %73 = add i64 %pgocount17, 1
  store i64 %73, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %74 = add i64 %pgocount18, 1
  store i64 %74, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader.lr.ph, %.preheader5, %.preheader6.lr.ph
  %pgocount19 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %75 = add i64 %pgocount19, 1
  store i64 %75, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 20)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 20)
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  br i1 %15, label %.preheader10.us.preheader, label %.preheader.lr.ph

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %17 = add i32 %1, -1
  %18 = zext i32 %17 to i64
  %19 = shl nuw nsw i64 %18, 3
  %20 = add nuw nsw i64 %19, 8
  %wide.trip.count115 = zext i32 %0 to i64
  %xtraiter105 = and i32 %2, 1
  %lcmp.mod106 = icmp eq i32 %xtraiter105, 0
  %21 = icmp eq i32 %2, 1
  %wide.trip.count109 = zext i32 %1 to i64
  %wide.trip.count101.1 = zext i32 %2 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge43.us, %.preheader10.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next114, %._crit_edge43.us ]
  br i1 %16, label %.lr.ph39.us.us.preheader, label %._crit_edge43.us.loopexit55

.lr.ph39.us.us.preheader:                         ; preds = %.preheader10.us
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 0
  br label %.lr.ph39.us.us

._crit_edge43.us.loopexit55:                      ; preds = %.preheader10.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 17)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 17)
  %scevgep97 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv113, i64 0
  %scevgep9798 = bitcast double* %scevgep97 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep9798, i8 0, i64 %20, i32 8, i1 false)
  br label %._crit_edge43.us

._crit_edge43.us.loopexit:                        ; preds = %._crit_edge40.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 14)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 14)
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.loopexit, %._crit_edge43.us.loopexit55
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, %wide.trip.count115
  br i1 %exitcond116, label %.preheader9.loopexit, label %.preheader10.us

.lr.ph39.us.us:                                   ; preds = %._crit_edge40.us.us, %.lr.ph39.us.us.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge40.us.us ], [ 0, %.lr.ph39.us.us.preheader ]
  %25 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv113, i64 %indvars.iv107
  store double 0.000000e+00, double* %25, align 8
  br i1 %lcmp.mod106, label %.prol.loopexit104, label %.prol.preheader103

.prol.preheader103:                               ; preds = %.lr.ph39.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 9)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 9)
  %27 = load double, double* %22, align 8
  %28 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv107
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = load double, double* %25, align 8
  %32 = fadd double %31, %30
  store double %32, double* %25, align 8
  br label %.prol.loopexit104

.prol.loopexit104:                                ; preds = %.prol.preheader103, %.lr.ph39.us.us
  %indvars.iv99.unr.ph = phi i64 [ 1, %.prol.preheader103 ], [ 0, %.lr.ph39.us.us ]
  br i1 %21, label %.prol.loopexit104.._crit_edge40.us.us_crit_edge, label %.lr.ph39.us.us.new.preheader

.prol.loopexit104.._crit_edge40.us.us_crit_edge:  ; preds = %.prol.loopexit104
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 4)
  %33 = add i64 %pgocount4, 1
  store i64 %33, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 4)
  br label %._crit_edge40.us.us

.lr.ph39.us.us.new.preheader:                     ; preds = %.prol.loopexit104
  br label %.lr.ph39.us.us.new

._crit_edge40.us.us.loopexit:                     ; preds = %.lr.ph39.us.us.new
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 10)
  %34 = add i64 %pgocount5, 1
  store i64 %34, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 10)
  br label %._crit_edge40.us.us

._crit_edge40.us.us:                              ; preds = %.prol.loopexit104.._crit_edge40.us.us_crit_edge, %._crit_edge40.us.us.loopexit
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, %wide.trip.count109
  br i1 %exitcond110, label %._crit_edge43.us.loopexit, label %.lr.ph39.us.us

.lr.ph39.us.us.new:                               ; preds = %.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge, %.lr.ph39.us.us.new.preheader
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge ], [ %indvars.iv99.unr.ph, %.lr.ph39.us.us.new.preheader ]
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv99
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv99, i64 %indvars.iv107
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %25, align 8
  %41 = fadd double %40, %39
  store double %41, double* %25, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv.next100
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next100, i64 %indvars.iv107
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %25, align 8
  %48 = fadd double %47, %46
  store double %48, double* %25, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, %wide.trip.count101.1
  br i1 %exitcond102.1, label %._crit_edge40.us.us.loopexit, label %.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge

.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge:  ; preds = %.lr.ph39.us.us.new
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 1)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 1)
  br label %.lr.ph39.us.us.new

.preheader9.loopexit:                             ; preds = %._crit_edge43.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 23)
  %50 = add i64 %pgocount7, 1
  store i64 %50, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 23)
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %12
  %51 = icmp sgt i32 %1, 0
  br i1 %51, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 21)
  %52 = add i64 %pgocount8, 1
  store i64 %52, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 21)
  %53 = icmp sgt i32 %3, 0
  %54 = icmp sgt i32 %4, 0
  br i1 %53, label %.preheader8.us.preheader, label %.preheader7

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %55 = add i32 %3, -1
  %56 = zext i32 %55 to i64
  %57 = shl nuw nsw i64 %56, 3
  %58 = add nuw nsw i64 %57, 8
  %wide.trip.count90 = zext i32 %1 to i64
  %xtraiter80 = and i32 %4, 1
  %lcmp.mod81 = icmp eq i32 %xtraiter80, 0
  %59 = icmp eq i32 %4, 1
  %wide.trip.count84 = zext i32 %3 to i64
  %wide.trip.count76.1 = zext i32 %4 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge29.us, %.preheader8.us.preheader
  %indvars.iv88 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next89, %._crit_edge29.us ]
  br i1 %54, label %.lr.ph25.us.us.preheader, label %._crit_edge29.us.loopexit53

.lr.ph25.us.us.preheader:                         ; preds = %.preheader8.us
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 0
  br label %.lr.ph25.us.us

._crit_edge29.us.loopexit53:                      ; preds = %.preheader8.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 18)
  %61 = add i64 %pgocount9, 1
  store i64 %61, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 18)
  %scevgep72 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv88, i64 0
  %scevgep7273 = bitcast double* %scevgep72 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7273, i8 0, i64 %58, i32 8, i1 false)
  br label %._crit_edge29.us

._crit_edge29.us.loopexit:                        ; preds = %._crit_edge26.us.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 15)
  %62 = add i64 %pgocount10, 1
  store i64 %62, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 15)
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %._crit_edge29.us.loopexit53
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %.preheader7.loopexit, label %.preheader8.us

.lr.ph25.us.us:                                   ; preds = %._crit_edge26.us.us, %.lr.ph25.us.us.preheader
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge26.us.us ], [ 0, %.lr.ph25.us.us.preheader ]
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv88, i64 %indvars.iv82
  store double 0.000000e+00, double* %63, align 8
  br i1 %lcmp.mod81, label %.prol.loopexit79, label %.prol.preheader78

.prol.preheader78:                                ; preds = %.lr.ph25.us.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 11)
  %64 = add i64 %pgocount11, 1
  store i64 %64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 11)
  %65 = load double, double* %60, align 8
  %66 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv82
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = load double, double* %63, align 8
  %70 = fadd double %69, %68
  store double %70, double* %63, align 8
  br label %.prol.loopexit79

.prol.loopexit79:                                 ; preds = %.prol.preheader78, %.lr.ph25.us.us
  %indvars.iv74.unr.ph = phi i64 [ 1, %.prol.preheader78 ], [ 0, %.lr.ph25.us.us ]
  br i1 %59, label %.prol.loopexit79.._crit_edge26.us.us_crit_edge, label %.lr.ph25.us.us.new.preheader

.prol.loopexit79.._crit_edge26.us.us_crit_edge:   ; preds = %.prol.loopexit79
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 5)
  %71 = add i64 %pgocount12, 1
  store i64 %71, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 5)
  br label %._crit_edge26.us.us

.lr.ph25.us.us.new.preheader:                     ; preds = %.prol.loopexit79
  br label %.lr.ph25.us.us.new

._crit_edge26.us.us.loopexit:                     ; preds = %.lr.ph25.us.us.new
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 12)
  %72 = add i64 %pgocount13, 1
  store i64 %72, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 12)
  br label %._crit_edge26.us.us

._crit_edge26.us.us:                              ; preds = %.prol.loopexit79.._crit_edge26.us.us_crit_edge, %._crit_edge26.us.us.loopexit
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %._crit_edge29.us.loopexit, label %.lr.ph25.us.us

.lr.ph25.us.us.new:                               ; preds = %.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge, %.lr.ph25.us.us.new.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge ], [ %indvars.iv74.unr.ph, %.lr.ph25.us.us.new.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 %indvars.iv74
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv74, i64 %indvars.iv82
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = load double, double* %63, align 8
  %79 = fadd double %78, %77
  store double %79, double* %63, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 %indvars.iv.next75
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next75, i64 %indvars.iv82
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = load double, double* %63, align 8
  %86 = fadd double %85, %84
  store double %86, double* %63, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next75.1, %wide.trip.count76.1
  br i1 %exitcond77.1, label %._crit_edge26.us.us.loopexit, label %.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge

.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge:  ; preds = %.lr.ph25.us.us.new
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 2)
  %87 = add i64 %pgocount14, 1
  store i64 %87, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 2)
  br label %.lr.ph25.us.us.new

.preheader7.loopexit:                             ; preds = %._crit_edge29.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 24)
  %88 = add i64 %pgocount15, 1
  store i64 %88, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 24)
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader8.lr.ph, %.preheader9
  %89 = icmp sgt i32 %0, 0
  br i1 %89, label %.preheader.lr.ph, label %._crit_edge16

.preheader.lr.ph:                                 ; preds = %.preheader7, %.preheader10.lr.ph
  %90 = icmp sgt i32 %3, 0
  %91 = icmp sgt i32 %1, 0
  br i1 %90, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge16_crit_edge

.preheader.lr.ph.._crit_edge16_crit_edge:         ; preds = %.preheader.lr.ph
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 6)
  %92 = add i64 %pgocount16, 1
  store i64 %92, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 6)
  br label %._crit_edge16

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %93 = add i32 %3, -1
  %94 = zext i32 %93 to i64
  %95 = shl nuw nsw i64 %94, 3
  %96 = add nuw nsw i64 %95, 8
  %wide.trip.count65 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %97 = icmp eq i32 %1, 1
  %wide.trip.count60 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge14.us, %.preheader.us.preheader
  %indvars.iv63 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next64, %._crit_edge14.us ]
  br i1 %91, label %.lr.ph.us.us.preheader, label %._crit_edge14.us.loopexit51

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %98 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit51:                      ; preds = %.preheader.us
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 16)
  %99 = add i64 %pgocount17, 1
  store i64 %99, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 16)
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv63, i64 0
  %scevgep57 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep57, i8 0, i64 %96, i32 8, i1 false)
  br label %._crit_edge14.us

._crit_edge14.us.loopexit:                        ; preds = %._crit_edge.us.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 13)
  %100 = add i64 %pgocount18, 1
  store i64 %100, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 13)
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %._crit_edge14.us.loopexit51
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %._crit_edge16.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %101 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv63, i64 %indvars.iv58
  store double 0.000000e+00, double* %101, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 7)
  %102 = add i64 %pgocount19, 1
  store i64 %102, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 7)
  %103 = load double, double* %98, align 8
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv58
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = load double, double* %101, align 8
  %108 = fadd double %107, %106
  store double %108, double* %101, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %97, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 3)
  %109 = add i64 %pgocount20, 1
  store i64 %109, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 3)
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 8)
  %110 = add i64 %pgocount21, 1
  store i64 %110, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 8)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond, label %._crit_edge14.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %111 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv58
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = load double, double* %101, align 8
  %117 = fadd double %116, %115
  store double %117, double* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %118 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv58
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = load double, double* %101, align 8
  %124 = fadd double %123, %122
  store double %124, double* %101, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 0)
  %125 = add i64 %pgocount22, 1
  store i64 %125, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 0)
  br label %.lr.ph.us.us.new

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 22)
  %126 = add i64 %pgocount23, 1
  store i64 %126, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 22)
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %.preheader.lr.ph.._crit_edge16_crit_edge, %._crit_edge16.loopexit, %.preheader7
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 19)
  %127 = add i64 %pgocount24, 1
  store i64 %127, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 19)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %._crit_edge, %18
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
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
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #6
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
