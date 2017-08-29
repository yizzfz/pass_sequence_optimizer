; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [120 x [120 x [120 x double]]]*, align 8
  %7 = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 120, i32* %5, align 4
  %8 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %9 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  store i8* %8, i8** %9, align 8
  %10 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %11 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  store i8* %10, i8** %11, align 8
  %12 = load i32, i32* %5, align 4
  %13 = bitcast i8* %8 to [120 x [120 x double]]*
  %14 = bitcast i8* %10 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %12, [120 x [120 x double]]* %13, [120 x [120 x double]]* %14)
  tail call void (...) @polybench_timer_start() #4
  %15 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %16 = load [120 x [120 x double]]*, [120 x [120 x double]]** %15, align 8
  %17 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %17, align 8
  tail call fastcc void @kernel_heat_3d(i32 %12, [120 x [120 x double]]* %16, [120 x [120 x double]]* %18)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %19 = load i32, i32* %3, align 4
  %20 = icmp sgt i32 %19, 42
  br i1 %20, label %21, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %21
  br label %._crit_edge

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %28 = load [120 x [120 x double]]*, [120 x [120 x double]]** %27, align 8
  tail call fastcc void @print_array(i32 %26, [120 x [120 x double]]* %28)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %25
  %29 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  %30 = load i8*, i8** %29, align 8
  tail call void @free(i8* %30) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = alloca i32, align 4
  %5 = alloca [120 x [120 x double]]*, align 8
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %5, align 8
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store i32 0, i32* %7, align 4
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %3
  br label %._crit_edge

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count38 = zext i32 %10 to i64
  %wide.trip.count33 = zext i32 %10 to i64
  %11 = sext i32 %10 to i64
  %12 = icmp sgt i32 %10, 0
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %12, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %15 = sext i32 %.promoted to i64
  %16 = sitofp i32 %10 to double
  %17 = icmp sgt i32 %10, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvars.iv40 = phi i64 [ %15, %.preheader3.us.preheader ], [ %indvars.iv.next41, %._crit_edge5.us..preheader3.us_crit_edge ]
  br i1 %17, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %18 = trunc i64 %indvars.iv40 to i32
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us.._crit_edge5.us_crit_edge, %.preheader3.us.._crit_edge5.us_crit_edge
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us.._crit_edge5.us_crit_edge ], [ %10, %._crit_edge.us.us.._crit_edge5.us_crit_edge ]
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %19 = icmp slt i64 %indvars.iv.next41, %11
  br i1 %19, label %._crit_edge5.us..preheader3.us_crit_edge, label %._crit_edge10.loopexit

._crit_edge5.us..preheader3.us_crit_edge:         ; preds = %._crit_edge5.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %20 = trunc i64 %indvars.iv35 to i32
  br label %._crit_edge44

._crit_edge.us.us:                                ; preds = %._crit_edge44
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge.us.us.._crit_edge5.us_crit_edge, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

._crit_edge.us.us.._crit_edge5.us_crit_edge:      ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge44:                                    ; preds = %._crit_edge44.._crit_edge44_crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge44.._crit_edge44_crit_edge ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = sub i32 %10, %21
  %23 = add i32 %22, %18
  %24 = add i32 %23, %20
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 1.000000e+01
  %27 = fdiv double %26, %16
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv40, i64 %indvars.iv35, i64 %indvars.iv
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv40, i64 %indvars.iv35, i64 %indvars.iv
  store double %27, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge.us.us, label %._crit_edge44.._crit_edge44_crit_edge

._crit_edge44.._crit_edge44_crit_edge:            ; preds = %._crit_edge44
  br label %._crit_edge44

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %30 = trunc i64 %indvars.iv.next41 to i32
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %31 = add i32 %.promoted, 1
  %32 = icmp sgt i32 %10, %31
  %smax = select i1 %32, i32 %10, i32 %31
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted14, %._crit_edge10.loopexit29 ]
  %.lcssa11 = phi i32 [ %30, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit29 ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %8, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge10
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = alloca i32, align 4
  %5 = alloca [120 x [120 x double]]*, align 8
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %5, align 8
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store i32 1, i32* %7, align 4
  %8 = add nsw i32 %0, -1
  %9 = add nsw i32 %0, -1
  %10 = sext i32 %0 to i64
  %11 = add nsw i32 %0, -1
  %12 = add nsw i32 %0, -1
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %15 = add nsw i64 %10, -1
  %16 = add nsw i32 %0, -1
  %17 = add nsw i32 %0, -1
  %18 = add nsw i32 %0, -1
  %19 = load i32, i32* %4, align 4
  %20 = sext i32 %19 to i64
  %21 = sext i32 %19 to i64
  %22 = sext i32 %19 to i64
  %23 = add nsw i64 %21, -1
  %24 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %25 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %26 = add nsw i64 %22, -1
  %27 = add nsw i64 %20, -1
  %.promoted45 = load i32, i32* %7, align 4
  %wide.trip.count59 = zext i32 %12 to i64
  %wide.trip.count55 = zext i32 %12 to i64
  %28 = icmp sgt i32 %8, 1
  %29 = icmp sgt i32 %9, 1
  %30 = icmp sgt i32 %11, 1
  %31 = icmp sgt i32 %16, 1
  %32 = icmp sgt i32 %17, 1
  %33 = icmp sgt i32 %18, 1
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge28..preheader5_crit_edge, %3
  %34 = phi i32 [ %.promoted45, %3 ], [ %119, %._crit_edge28..preheader5_crit_edge ]
  br i1 %28, label %.preheader5..preheader3_crit_edge, label %.preheader5..preheader4_crit_edge

.preheader5..preheader4_crit_edge:                ; preds = %.preheader5
  br label %.preheader4

.preheader5..preheader3_crit_edge:                ; preds = %.preheader5
  br label %.preheader3

.preheader4:                                      ; preds = %._crit_edge7..preheader4_crit_edge, %.preheader5..preheader4_crit_edge
  br i1 %31, label %.preheader4..preheader2_crit_edge, label %.preheader4.._crit_edge28_crit_edge

.preheader4.._crit_edge28_crit_edge:              ; preds = %.preheader4
  br label %._crit_edge28

.preheader4..preheader2_crit_edge:                ; preds = %.preheader4
  br label %.preheader2

.preheader3:                                      ; preds = %._crit_edge7..preheader3_crit_edge, %.preheader5..preheader3_crit_edge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge7..preheader3_crit_edge ], [ 1, %.preheader5..preheader3_crit_edge ]
  br i1 %29, label %.preheader1.lr.ph, label %.preheader3.._crit_edge7_crit_edge

.preheader3.._crit_edge7_crit_edge:               ; preds = %.preheader3
  br label %._crit_edge7

.preheader1.lr.ph:                                ; preds = %.preheader3
  %35 = add nuw nsw i64 %indvars.iv61, 1
  %36 = add nsw i64 %indvars.iv61, -1
  br i1 %30, label %.preheader1.lr.ph..preheader1.us_crit_edge, label %.preheader1.lr.ph.._crit_edge7_crit_edge

.preheader1.lr.ph.._crit_edge7_crit_edge:         ; preds = %.preheader1.lr.ph
  br label %._crit_edge7

.preheader1.lr.ph..preheader1.us_crit_edge:       ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us..preheader1.us_crit_edge, %.preheader1.lr.ph..preheader1.us_crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge.us..preheader1.us_crit_edge ], [ 1, %.preheader1.lr.ph..preheader1.us_crit_edge ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %37 = add nsw i64 %indvars.iv57, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader1.us
  %indvars.iv = phi i64 [ 1, %.preheader1.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %35, i64 %indvars.iv57, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %indvars.iv57, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, 2.000000e+00
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %36, i64 %indvars.iv57, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %indvars.iv.next58, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = insertelement <2 x double> undef, double %42, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = insertelement <2 x double> undef, double %39, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = fsub <2 x double> %50, %48
  %52 = extractelement <2 x double> %51, i32 0
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %37, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = insertelement <2 x double> undef, double %52, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = insertelement <2 x double> undef, double %44, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> %51, <2 x i32> <i32 0, i32 3>
  %59 = fadd <2 x double> %58, %56
  %60 = fmul <2 x double> %59, <double 1.250000e-01, double 1.250000e-01>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fadd double %61, %62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %indvars.iv57, i64 %indvars.iv.next
  %65 = load double, double* %64, align 8
  %66 = fsub double %65, %42
  %67 = add nsw i64 %indvars.iv, -1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %indvars.iv57, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fadd double %66, %69
  %71 = fmul double %70, 1.250000e-01
  %72 = fadd double %63, %71
  %73 = fadd double %41, %72
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv61, i64 %indvars.iv57, i64 %indvars.iv
  store double %73, double* %74, align 8
  %exitcond56 = icmp eq i64 %indvars.iv.next, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge.us.._crit_edge7_crit_edge, label %._crit_edge.us..preheader1.us_crit_edge

._crit_edge.us..preheader1.us_crit_edge:          ; preds = %._crit_edge.us
  br label %.preheader1.us

._crit_edge.us.._crit_edge7_crit_edge:            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge.us.._crit_edge7_crit_edge, %.preheader1.lr.ph.._crit_edge7_crit_edge, %.preheader3.._crit_edge7_crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %75 = icmp slt i64 %indvars.iv.next62, %15
  br i1 %75, label %._crit_edge7..preheader3_crit_edge, label %._crit_edge7..preheader4_crit_edge

._crit_edge7..preheader4_crit_edge:               ; preds = %._crit_edge7
  br label %.preheader4

._crit_edge7..preheader3_crit_edge:               ; preds = %._crit_edge7
  br label %.preheader3

.preheader2:                                      ; preds = %._crit_edge23..preheader2_crit_edge, %.preheader4..preheader2_crit_edge
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge23..preheader2_crit_edge ], [ 1, %.preheader4..preheader2_crit_edge ]
  br i1 %32, label %.preheader.lr.ph, label %.preheader2.._crit_edge23_crit_edge

.preheader2.._crit_edge23_crit_edge:              ; preds = %.preheader2
  br label %._crit_edge23

.preheader.lr.ph:                                 ; preds = %.preheader2
  %76 = add nuw nsw i64 %indvars.iv72, 1
  %77 = add nsw i64 %indvars.iv72, -1
  br i1 %33, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader.lr.ph.._crit_edge23_crit_edge

.preheader.lr.ph.._crit_edge23_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge23

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge20.us..preheader.us_crit_edge, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge20.us..preheader.us_crit_edge ], [ 1, %.preheader.lr.ph..preheader.us_crit_edge ]
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %78 = add nsw i64 %indvars.iv68, -1
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.._crit_edge76_crit_edge, %.preheader.us
  %indvars.iv64 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next65, %._crit_edge76.._crit_edge76_crit_edge ]
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %76, i64 %indvars.iv68, i64 %indvars.iv64
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv72, i64 %indvars.iv68, i64 %indvars.iv64
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, 2.000000e+00
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %77, i64 %indvars.iv68, i64 %indvars.iv64
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv72, i64 %indvars.iv.next69, i64 %indvars.iv64
  %87 = load double, double* %86, align 8
  %88 = insertelement <2 x double> undef, double %83, i32 0
  %89 = shufflevector <2 x double> %88, <2 x double> undef, <2 x i32> zeroinitializer
  %90 = insertelement <2 x double> undef, double %80, i32 0
  %91 = insertelement <2 x double> %90, double %87, i32 1
  %92 = fsub <2 x double> %91, %89
  %93 = extractelement <2 x double> %92, i32 0
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv72, i64 %78, i64 %indvars.iv64
  %95 = load double, double* %94, align 8
  %96 = insertelement <2 x double> undef, double %93, i32 0
  %97 = insertelement <2 x double> %96, double %95, i32 1
  %98 = insertelement <2 x double> undef, double %85, i32 0
  %99 = shufflevector <2 x double> %98, <2 x double> %92, <2 x i32> <i32 0, i32 3>
  %100 = fadd <2 x double> %99, %97
  %101 = fmul <2 x double> %100, <double 1.250000e-01, double 1.250000e-01>
  %102 = extractelement <2 x double> %101, i32 0
  %103 = extractelement <2 x double> %101, i32 1
  %104 = fadd double %102, %103
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv72, i64 %indvars.iv68, i64 %indvars.iv.next65
  %106 = load double, double* %105, align 8
  %107 = fsub double %106, %83
  %108 = add nsw i64 %indvars.iv64, -1
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv72, i64 %indvars.iv68, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fadd double %107, %110
  %112 = fmul double %111, 1.250000e-01
  %113 = fadd double %104, %112
  %114 = fadd double %82, %113
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv72, i64 %indvars.iv68, i64 %indvars.iv64
  store double %114, double* %115, align 8
  %116 = icmp slt i64 %indvars.iv.next65, %26
  br i1 %116, label %._crit_edge76.._crit_edge76_crit_edge, label %._crit_edge20.us

._crit_edge76.._crit_edge76_crit_edge:            ; preds = %._crit_edge76
  br label %._crit_edge76

._crit_edge20.us:                                 ; preds = %._crit_edge76
  %117 = icmp slt i64 %indvars.iv.next69, %23
  br i1 %117, label %._crit_edge20.us..preheader.us_crit_edge, label %._crit_edge20.us.._crit_edge23_crit_edge

._crit_edge20.us.._crit_edge23_crit_edge:         ; preds = %._crit_edge20.us
  br label %._crit_edge23

._crit_edge20.us..preheader.us_crit_edge:         ; preds = %._crit_edge20.us
  br label %.preheader.us

._crit_edge23:                                    ; preds = %._crit_edge20.us.._crit_edge23_crit_edge, %.preheader.lr.ph.._crit_edge23_crit_edge, %.preheader2.._crit_edge23_crit_edge
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %118 = icmp slt i64 %indvars.iv.next73, %27
  br i1 %118, label %._crit_edge23..preheader2_crit_edge, label %._crit_edge23.._crit_edge28_crit_edge

._crit_edge23.._crit_edge28_crit_edge:            ; preds = %._crit_edge23
  br label %._crit_edge28

._crit_edge23..preheader2_crit_edge:              ; preds = %._crit_edge23
  br label %.preheader2

._crit_edge28:                                    ; preds = %._crit_edge23.._crit_edge28_crit_edge, %.preheader4.._crit_edge28_crit_edge
  %119 = add nsw i32 %34, 1
  %120 = icmp slt i32 %119, 501
  br i1 %120, label %._crit_edge28..preheader5_crit_edge, label %121

._crit_edge28..preheader5_crit_edge:              ; preds = %._crit_edge28
  br label %.preheader5

; <label>:121:                                    ; preds = %._crit_edge28
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [120 x [120 x double]]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %4, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %7) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.preheader3.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %wide.trip.count38 = zext i32 %13 to i64
  %wide.trip.count33 = zext i32 %13 to i64
  %14 = sext i32 %13 to i64
  %15 = sext i32 %13 to i64
  %16 = icmp sgt i32 %13, 0
  %17 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %16, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %18 = sext i32 %.promoted to i64
  %19 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvars.iv40 = phi i64 [ %18, %.preheader3.us.preheader ], [ %indvars.iv.next41, %._crit_edge5.us..preheader3.us_crit_edge ]
  br i1 %19, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %20 = mul nsw i64 %indvars.iv40, %14
  %21 = trunc i64 %20 to i32
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us.._crit_edge5.us_crit_edge, %.preheader3.us.._crit_edge5.us_crit_edge
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us.._crit_edge5.us_crit_edge ], [ %13, %._crit_edge.us.us.._crit_edge5.us_crit_edge ]
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %22 = icmp slt i64 %indvars.iv.next41, %15
  br i1 %22, label %._crit_edge5.us..preheader3.us_crit_edge, label %._crit_edge10.loopexit

._crit_edge5.us..preheader3.us_crit_edge:         ; preds = %._crit_edge5.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %23 = trunc i64 %indvars.iv35 to i32
  %24 = add i32 %21, %23
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %._crit_edge45

._crit_edge.us.us:                                ; preds = %._crit_edge44
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge.us.us.._crit_edge5.us_crit_edge, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

._crit_edge.us.us.._crit_edge5.us_crit_edge:      ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge45:                                    ; preds = %._crit_edge44.._crit_edge45_crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge44.._crit_edge45_crit_edge ]
  %27 = add i64 %26, %indvars.iv
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge45.._crit_edge44_crit_edge

._crit_edge45.._crit_edge44_crit_edge:            ; preds = %._crit_edge45
  br label %._crit_edge44

; <label>:31:                                     ; preds = %._crit_edge45
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #5
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge45.._crit_edge44_crit_edge, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv40, i64 %indvars.iv35, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge.us.us, label %._crit_edge44.._crit_edge45_crit_edge

._crit_edge44.._crit_edge45_crit_edge:            ; preds = %._crit_edge44
  br label %._crit_edge45

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %37 = trunc i64 %indvars.iv.next41 to i32
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %38 = add i32 %.promoted, 1
  %39 = icmp sgt i32 %13, %38
  %smax = select i1 %39, i32 %13, i32 %38
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted14, %._crit_edge10.loopexit29 ]
  %.lcssa11 = phi i32 [ %37, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit29 ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %6, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge10
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %42) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
