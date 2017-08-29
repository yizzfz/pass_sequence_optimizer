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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array([120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
.._crit_edge_crit_edge.lr.ph:
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.lr.ph ]
  %2 = add nuw nsw i64 %indvars.iv3, 120
  br label %._crit_edge.._crit_edge19_crit_edge.us.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge19._crit_edge.us.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %._crit_edge23, label %.._crit_edge_crit_edge.us

._crit_edge.._crit_edge19_crit_edge.us.us:        ; preds = %._crit_edge19._crit_edge.us.us, %.._crit_edge_crit_edge.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge19._crit_edge.us.us ], [ 0, %.._crit_edge_crit_edge.us ]
  %3 = add nuw nsw i64 %2, %indvars.iv1
  br label %._crit_edge19.us.us

._crit_edge19._crit_edge.us.us:                   ; preds = %._crit_edge19.us.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge.._crit_edge19_crit_edge.us.us

._crit_edge19.us.us:                              ; preds = %._crit_edge19.us.us, %._crit_edge.._crit_edge19_crit_edge.us.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.._crit_edge19_crit_edge.us.us ], [ %indvars.iv.next.1, %._crit_edge19.us.us ]
  %4 = sub nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = sub nuw nsw i64 %3, %indvars.iv.next
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fmul <2 x double> %13, <double 1.000000e+01, double 1.000000e+01>
  %15 = fdiv <2 x double> %14, <double 1.200000e+02, double 1.200000e+02>
  %16 = bitcast double* %7 to <2 x double>*
  %17 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  store <2 x double> %15, <2 x double>* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge19._crit_edge.us.us, label %._crit_edge19.us.us

._crit_edge23:                                    ; preds = %._crit_edge._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.._crit_edge106_crit_edge.preheader

._crit_edge.._crit_edge106_crit_edge.preheader:   ; preds = %._crit_edge107._crit_edge, %2
  %storemerge8 = phi i32 [ 1, %2 ], [ %76, %._crit_edge107._crit_edge ]
  br label %._crit_edge106.._crit_edge108_crit_edge.lr.ph

._crit_edge106.._crit_edge108_crit_edge.lr.ph:    ; preds = %._crit_edge, %._crit_edge.._crit_edge106_crit_edge.preheader
  %indvars.iv9 = phi i64 [ 1, %._crit_edge.._crit_edge106_crit_edge.preheader ], [ %3, %._crit_edge ]
  %3 = add nuw nsw i64 %indvars.iv9, 1
  %4 = add nsw i64 %indvars.iv9, -1
  br label %._crit_edge106.._crit_edge108_crit_edge.us

._crit_edge106.._crit_edge108_crit_edge.us:       ; preds = %._crit_edge108._crit_edge.us, %._crit_edge106.._crit_edge108_crit_edge.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge108._crit_edge.us ], [ 1, %._crit_edge106.._crit_edge108_crit_edge.lr.ph ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %5 = add nsw i64 %indvars.iv1, -1
  br label %._crit_edge108.us

._crit_edge108.us:                                ; preds = %._crit_edge108.us, %._crit_edge106.._crit_edge108_crit_edge.us
  %indvars.iv = phi i64 [ 1, %._crit_edge106.._crit_edge108_crit_edge.us ], [ %indvars.iv.next, %._crit_edge108.us ]
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv1, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv9, i64 %indvars.iv1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, 2.000000e+00
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv1, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv9, i64 %indvars.iv.next2, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = insertelement <2 x double> undef, double %7, i32 0
  %18 = insertelement <2 x double> %17, double %14, i32 1
  %19 = fsub <2 x double> %18, %16
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv9, i64 %5, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = insertelement <2 x double> undef, double %12, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fadd <2 x double> %23, %19
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fadd double %26, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv9, i64 %indvars.iv1, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fsub double %30, %10
  %32 = add nsw i64 %indvars.iv, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv9, i64 %indvars.iv1, i64 %32
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %31
  %36 = fmul double %35, 1.250000e-01
  %37 = fadd double %28, %36
  %38 = fadd double %9, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv1, i64 %indvars.iv
  store double %38, double* %39, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge108._crit_edge.us, label %._crit_edge108.us

._crit_edge108._crit_edge.us:                     ; preds = %._crit_edge108.us
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 119
  br i1 %exitcond3, label %._crit_edge, label %._crit_edge106.._crit_edge108_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge108._crit_edge.us
  %exitcond11 = icmp eq i64 %3, 119
  br i1 %exitcond11, label %._crit_edge109.._crit_edge110_crit_edge.lr.ph.preheader, label %._crit_edge106.._crit_edge108_crit_edge.lr.ph

._crit_edge109.._crit_edge110_crit_edge.lr.ph.preheader: ; preds = %._crit_edge
  br label %._crit_edge109.._crit_edge110_crit_edge.lr.ph

._crit_edge109.._crit_edge110_crit_edge.lr.ph:    ; preds = %._crit_edge107, %._crit_edge109.._crit_edge110_crit_edge.lr.ph.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge107 ], [ 1, %._crit_edge109.._crit_edge110_crit_edge.lr.ph.preheader ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %40 = add nsw i64 %indvars.iv7, -1
  br label %._crit_edge109.._crit_edge110_crit_edge.us

._crit_edge109.._crit_edge110_crit_edge.us:       ; preds = %._crit_edge110._crit_edge.us, %._crit_edge109.._crit_edge110_crit_edge.lr.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge110._crit_edge.us ], [ 1, %._crit_edge109.._crit_edge110_crit_edge.lr.ph ]
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %41 = add nsw i64 %indvars.iv4, -1
  br label %._crit_edge110.us

._crit_edge110.us:                                ; preds = %._crit_edge110.us, %._crit_edge109.._crit_edge110_crit_edge.us
  %indvars.iv12 = phi i64 [ 1, %._crit_edge109.._crit_edge110_crit_edge.us ], [ %indvars.iv.next13, %._crit_edge110.us ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next8, i64 %indvars.iv4, i64 %indvars.iv12
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv12
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %indvars.iv4, i64 %indvars.iv12
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv7, i64 %indvars.iv.next5, i64 %indvars.iv12
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %46, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = insertelement <2 x double> undef, double %43, i32 0
  %54 = insertelement <2 x double> %53, double %50, i32 1
  %55 = fsub <2 x double> %54, %52
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv7, i64 %41, i64 %indvars.iv12
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %48, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fadd <2 x double> %59, %55
  %61 = fmul <2 x double> %60, <double 1.250000e-01, double 1.250000e-01>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fadd double %62, %63
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv.next13
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %46
  %68 = add nsw i64 %indvars.iv12, -1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv7, i64 %indvars.iv4, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fadd double %70, %67
  %72 = fmul double %71, 1.250000e-01
  %73 = fadd double %64, %72
  %74 = fadd double %45, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv12
  store double %74, double* %75, align 8
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 119
  br i1 %exitcond14, label %._crit_edge110._crit_edge.us, label %._crit_edge110.us

._crit_edge110._crit_edge.us:                     ; preds = %._crit_edge110.us
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 119
  br i1 %exitcond6, label %._crit_edge107, label %._crit_edge109.._crit_edge110_crit_edge.us

._crit_edge107:                                   ; preds = %._crit_edge110._crit_edge.us
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 119
  br i1 %exitcond9, label %._crit_edge107._crit_edge, label %._crit_edge109.._crit_edge110_crit_edge.lr.ph

._crit_edge107._crit_edge:                        ; preds = %._crit_edge107
  %76 = add nuw nsw i32 %storemerge8, 1
  %exitcond15 = icmp eq i32 %76, 501
  br i1 %exitcond15, label %77, label %._crit_edge.._crit_edge106_crit_edge.preheader

; <label>:77:                                     ; preds = %._crit_edge107._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.lr.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.lr.ph ]
  %5 = mul nuw nsw i64 %indvars.iv4, 120
  br label %._crit_edge.._crit_edge15_crit_edge.us.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge15._crit_edge.us.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %._crit_edge20, label %.._crit_edge_crit_edge.us

._crit_edge.._crit_edge15_crit_edge.us.us:        ; preds = %._crit_edge15._crit_edge.us.us, %.._crit_edge_crit_edge.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge15._crit_edge.us.us ], [ 0, %.._crit_edge_crit_edge.us ]
  %6 = add nuw nsw i64 %indvars.iv1, %5
  %7 = mul nuw nsw i64 %6, 120
  br label %8

._crit_edge15._crit_edge.us.us:                   ; preds = %._crit_edge16.us.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %._crit_edge._crit_edge.us, label %._crit_edge.._crit_edge15_crit_edge.us.us

; <label>:8:                                      ; preds = %._crit_edge16.us.us, %._crit_edge.._crit_edge15_crit_edge.us.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.._crit_edge15_crit_edge.us.us ], [ %indvars.iv.next, %._crit_edge16.us.us ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge16.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge16.us.us

._crit_edge16.us.us:                              ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge15._crit_edge.us.us, label %8

._crit_edge20:                                    ; preds = %._crit_edge._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
