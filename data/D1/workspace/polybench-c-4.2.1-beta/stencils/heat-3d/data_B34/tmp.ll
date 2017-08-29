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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge26

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %wide.trip.count39 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader19.lr.ph, %._crit_edge23.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge23.us ], [ 0, %.preheader19.lr.ph ]
  %8 = trunc i64 %indvars.iv40 to i32
  %9 = add i32 %8, %0
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge26.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next38, %._crit_edge.us.us ]
  %10 = trunc i64 %indvars.iv37 to i32
  %11 = add i32 %9, %10
  br i1 %6, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv37, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv37, i64 0
  store double %14, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %7, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond, label %._crit_edge23.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge26.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %wide.trip.count20 = zext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count24 = zext i32 %4 to i64
  %wide.trip.count32 = zext i32 %4 to i64
  %wide.trip.count28 = zext i32 %4 to i64
  %wide.trip.count36 = zext i32 %4 to i64
  %5 = icmp sgt i32 %4, 1
  %6 = icmp sgt i32 %4, 1
  %7 = icmp sgt i32 %4, 1
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge16, %3
  %storemerge17 = phi i32 [ 1, %3 ], [ %90, %._crit_edge16 ]
  br i1 %5, label %.preheader3.preheader, label %._crit_edge16

.preheader3.preheader:                            ; preds = %.preheader5
  br label %.preheader3

.preheader4:                                      ; preds = %._crit_edge8
  br i1 %7, label %.preheader.lr.ph.preheader, label %._crit_edge16

.preheader.lr.ph.preheader:                       ; preds = %.preheader4
  br label %.preheader.lr.ph

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge8
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge8 ], [ 1, %.preheader3.preheader ]
  br i1 %6, label %.preheader1.lr.ph, label %._crit_edge8

.preheader1.lr.ph:                                ; preds = %.preheader3
  %8 = add nuw nsw i64 %indvars.iv22, 1
  %9 = add nsw i64 %indvars.iv22, -1
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us, %.preheader1.lr.ph
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 1, %.preheader1.lr.ph ]
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %10 = add nsw i64 %indvars.iv18, -1
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader1.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 1, %.preheader1.us ]
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %indvars.iv18, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, 2.000000e+00
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %indvars.iv18, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = insertelement <2 x double> undef, double %13, i32 0
  %24 = insertelement <2 x double> %23, double %20, i32 1
  %25 = fsub <2 x double> %24, %22
  %26 = extractelement <2 x double> %25, i32 0
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %10, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = insertelement <2 x double> undef, double %26, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = insertelement <2 x double> undef, double %18, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> %25, <2 x i32> <i32 0, i32 3>
  %33 = fadd <2 x double> %32, %30
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = extractelement <2 x double> %34, i32 0
  %36 = extractelement <2 x double> %34, i32 1
  %37 = fadd double %35, %36
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  %39 = load double, double* %38, align 8
  %40 = fsub double %39, %16
  %41 = add nsw i64 %indvars.iv, -1
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %41
  %43 = load double, double* %42, align 8
  %44 = fadd double %40, %43
  %45 = fmul double %44, 1.250000e-01
  %46 = fadd double %37, %45
  %47 = fadd double %15, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %47, double* %48, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %11

._crit_edge.us:                                   ; preds = %11
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge8.loopexit, label %.preheader1.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond25, label %.preheader4, label %.preheader3

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge14
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge14 ], [ 1, %.preheader.lr.ph.preheader ]
  %49 = add nuw nsw i64 %indvars.iv34, 1
  %50 = add nsw i64 %indvars.iv34, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.lr.ph
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge12.us ], [ 1, %.preheader.lr.ph ]
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %51 = add nsw i64 %indvars.iv30, -1
  br label %52

; <label>:52:                                     ; preds = %52, %.preheader.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %52 ], [ 1, %.preheader.us ]
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %49, i64 %indvars.iv30, i64 %indvars.iv26
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, 2.000000e+00
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %50, i64 %indvars.iv30, i64 %indvars.iv26
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %indvars.iv26
  %61 = load double, double* %60, align 8
  %62 = insertelement <2 x double> undef, double %57, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = insertelement <2 x double> undef, double %54, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = fsub <2 x double> %65, %63
  %67 = extractelement <2 x double> %66, i32 0
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %51, i64 %indvars.iv26
  %69 = load double, double* %68, align 8
  %70 = insertelement <2 x double> undef, double %67, i32 0
  %71 = insertelement <2 x double> %70, double %69, i32 1
  %72 = insertelement <2 x double> undef, double %59, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> %66, <2 x i32> <i32 0, i32 3>
  %74 = fadd <2 x double> %73, %71
  %75 = fmul <2 x double> %74, <double 1.250000e-01, double 1.250000e-01>
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fadd double %76, %77
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv.next27
  %80 = load double, double* %79, align 8
  %81 = fsub double %80, %57
  %82 = add nsw i64 %indvars.iv26, -1
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %82
  %84 = load double, double* %83, align 8
  %85 = fadd double %81, %84
  %86 = fmul double %85, 1.250000e-01
  %87 = fadd double %78, %86
  %88 = fadd double %56, %87
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  store double %88, double* %89, align 8
  %exitcond29 = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond29, label %._crit_edge12.us, label %52

._crit_edge12.us:                                 ; preds = %52
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge16.loopexit, label %.preheader.lr.ph

._crit_edge16.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader5, %.preheader4
  %90 = add nuw nsw i32 %storemerge17, 1
  %exitcond38 = icmp eq i32 %90, 501
  br i1 %exitcond38, label %91, label %.preheader5

; <label>:91:                                     ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader15.lr.ph, label %._crit_edge23

.preheader15.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  %wide.trip.count41 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader15.lr.ph, %._crit_edge20.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge20.us ], [ 0, %.preheader15.lr.ph ]
  %9 = mul nsw i64 %indvars.iv39, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge20.us:                                 ; preds = %._crit_edge17.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge23.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge17.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge17.us.us ]
  %11 = trunc i64 %indvars.iv35 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge17.us.us:                              ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %._crit_edge20.us, label %.preheader.us.us

; <label>:15:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %16 = add i64 %indvars.iv, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %._crit_edge.us.us

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %15, %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge17.us.us, label %15

._crit_edge23.loopexit:                           ; preds = %._crit_edge20.us
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
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
