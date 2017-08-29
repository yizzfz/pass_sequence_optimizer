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
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %._crit_edge

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %28 = load [120 x [120 x double]]*, [120 x [120 x double]]** %27, align 8
  tail call fastcc void @print_array(i32 %26, [120 x [120 x double]]* %28)
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %2, %25
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
  br i1 %9, label %.preheader3.lr.ph, label %49

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count.1 = zext i32 %10 to i64
  %wide.trip.count32 = zext i32 %10 to i64
  %11 = sext i32 %10 to i64
  %12 = icmp sgt i32 %10, 0
  %13 = sitofp i32 %10 to double
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %12, label %.preheader3.us.preheader, label %._crit_edge9.loopexit27

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %16 = sext i32 %.promoted to i64
  %xtraiter = and i32 %10, 1
  %17 = icmp sgt i32 %10, 0
  %18 = icmp eq i32 %xtraiter, 0
  %19 = icmp eq i32 %10, 1
  %20 = insertelement <2 x double> undef, double %13, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge4.us
  %indvars.iv33 = phi i64 [ %16, %.preheader3.us.preheader ], [ %indvars.iv.next34, %._crit_edge4.us ]
  br i1 %17, label %.preheader.us.us.preheader, label %._crit_edge4.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %22 = trunc i64 %indvars.iv33 to i32
  br label %.preheader.us.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %.preheader3.us
  %.lcssa8.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge4.us.loopexit ]
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %23 = icmp slt i64 %indvars.iv.next34, %11
  br i1 %23, label %.preheader3.us, label %._crit_edge9.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %24 = trunc i64 %indvars.iv30 to i32
  %25 = add i32 %24, %22
  %26 = add i32 %25, %10
  br i1 %18, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %27 = sitofp i32 %26 to double
  %28 = fmul double %27, 1.000000e+01
  %29 = fdiv double %28, %13
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv33, i64 %indvars.iv30, i64 0
  store double %29, double* %30, align 8
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv33, i64 %indvars.iv30, i64 0
  store double %29, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %19, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond, label %._crit_edge4.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %32 = trunc i64 %indvars.iv to i32
  %33 = sub i32 %26, %32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv33, i64 %indvars.iv30, i64 %indvars.iv
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv33, i64 %indvars.iv30, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = trunc i64 %indvars.iv.next to i32
  %38 = sub i32 %26, %37
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %34, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fmul <2 x double> %41, <double 1.000000e+01, double 1.000000e+01>
  %43 = fdiv <2 x double> %42, %21
  %44 = bitcast double* %35 to <2 x double>*
  %45 = bitcast double* %36 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8
  store <2 x double> %43, <2 x double>* %45, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge9.loopexit:                            ; preds = %._crit_edge4.us
  %46 = trunc i64 %indvars.iv.next34 to i32
  br label %._crit_edge9

._crit_edge9.loopexit27:                          ; preds = %.preheader3.lr.ph
  %.promoted13 = load i32, i32* %8, align 4
  %47 = add i32 %.promoted, 1
  %48 = icmp sgt i32 %10, %47
  %smax = select i1 %48, i32 %10, i32 %47
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit27, %._crit_edge9.loopexit
  %.lcssa8.lcssa15.lcssa = phi i32 [ %.lcssa8.lcssa.us, %._crit_edge9.loopexit ], [ %.promoted13, %._crit_edge9.loopexit27 ]
  %.lcssa10 = phi i32 [ %46, %._crit_edge9.loopexit ], [ %smax, %._crit_edge9.loopexit27 ]
  store i32 %.lcssa10, i32* %7, align 4
  store i32 %.lcssa8.lcssa15.lcssa, i32* %8, align 4
  br label %49

; <label>:49:                                     ; preds = %._crit_edge9, %3
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
  %.promoted43 = load i32, i32* %7, align 4
  %wide.trip.count = zext i32 %12 to i64
  %wide.trip.count55 = zext i32 %12 to i64
  %28 = icmp sgt i32 %8, 1
  %29 = icmp sgt i32 %16, 1
  %30 = icmp sgt i32 %17, 1
  %31 = icmp sgt i32 %18, 1
  %32 = icmp sgt i32 %9, 1
  %33 = icmp sgt i32 %11, 1
  br label %.preheader5

.preheader5:                                      ; preds = %3, %._crit_edge26
  %34 = phi i32 [ %.promoted43, %3 ], [ %129, %._crit_edge26 ]
  br i1 %28, label %.preheader3.preheader, label %.preheader4

.preheader3.preheader:                            ; preds = %.preheader5
  br label %.preheader3

.preheader4.loopexit:                             ; preds = %._crit_edge6
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5
  br i1 %29, label %.preheader2.preheader, label %._crit_edge26

.preheader2.preheader:                            ; preds = %.preheader4
  br label %.preheader2

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge6
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge6 ], [ 1, %.preheader3.preheader ]
  br i1 %32, label %.preheader1.lr.ph, label %._crit_edge6

.preheader1.lr.ph:                                ; preds = %.preheader3
  %35 = add nuw nsw i64 %indvars.iv57, 1
  %36 = add nsw i64 %indvars.iv57, -1
  br i1 %33, label %.preheader1.us.preheader, label %._crit_edge6

.preheader1.us.preheader:                         ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge.us ], [ 1, %.preheader1.us.preheader ]
  %37 = add nuw nsw i64 %indvars.iv53, 1
  %38 = add nsw i64 %indvars.iv53, -1
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader1.us
  %indvars.iv = phi i64 [ 1, %.preheader1.us ], [ %indvars.iv.next, %39 ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %35, i64 %indvars.iv53, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %36, i64 %indvars.iv53, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %37, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = insertelement <2 x double> undef, double %43, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %49, <double 2.000000e+00, double 2.000000e+00>
  %51 = insertelement <2 x double> undef, double %41, i32 0
  %52 = insertelement <2 x double> %51, double %47, i32 1
  %53 = fsub <2 x double> %52, %50
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %38, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %45, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  %58 = fadd <2 x double> %53, %57
  %59 = fmul <2 x double> %58, <double 1.250000e-01, double 1.250000e-01>
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %62 = fadd double %60, %61
  %63 = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %63
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, 2.000000e+00
  %69 = fsub double %65, %68
  %70 = add nsw i64 %indvars.iv, -1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %70
  %72 = load double, double* %71, align 8
  %73 = fadd double %69, %72
  %74 = fmul double %73, 1.250000e-01
  %75 = fadd double %62, %74
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  %77 = load double, double* %76, align 8
  %78 = fadd double %75, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  store double %78, double* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %39

._crit_edge.us:                                   ; preds = %39
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge6.loopexit, label %.preheader1.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader1.lr.ph, %.preheader3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %80 = icmp slt i64 %indvars.iv.next58, %15
  br i1 %80, label %.preheader3, label %.preheader4.loopexit

.preheader2:                                      ; preds = %.preheader2.preheader, %._crit_edge21
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge21 ], [ 1, %.preheader2.preheader ]
  br i1 %30, label %.preheader.lr.ph, label %._crit_edge21

.preheader.lr.ph:                                 ; preds = %.preheader2
  %81 = add nuw nsw i64 %indvars.iv66, 1
  %82 = add nsw i64 %indvars.iv66, -1
  br i1 %31, label %.preheader.us.preheader, label %._crit_edge21

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge18.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge18.us ], [ 1, %.preheader.us.preheader ]
  %83 = add nuw nsw i64 %indvars.iv63, 1
  %84 = add nsw i64 %indvars.iv63, -1
  br label %85

; <label>:85:                                     ; preds = %.preheader.us, %85
  %indvars.iv60 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next61, %85 ]
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %81, i64 %indvars.iv63, i64 %indvars.iv60
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %82, i64 %indvars.iv63, i64 %indvars.iv60
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %83, i64 %indvars.iv60
  %93 = load double, double* %92, align 8
  %94 = insertelement <2 x double> undef, double %89, i32 0
  %95 = shufflevector <2 x double> %94, <2 x double> undef, <2 x i32> zeroinitializer
  %96 = fmul <2 x double> %95, <double 2.000000e+00, double 2.000000e+00>
  %97 = insertelement <2 x double> undef, double %87, i32 0
  %98 = insertelement <2 x double> %97, double %93, i32 1
  %99 = fsub <2 x double> %98, %96
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %84, i64 %indvars.iv60
  %101 = load double, double* %100, align 8
  %102 = insertelement <2 x double> undef, double %91, i32 0
  %103 = insertelement <2 x double> %102, double %101, i32 1
  %104 = fadd <2 x double> %99, %103
  %105 = fmul <2 x double> %104, <double 1.250000e-01, double 1.250000e-01>
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fadd double %106, %107
  %109 = add nuw nsw i64 %indvars.iv60, 1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %109
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, 2.000000e+00
  %115 = fsub double %111, %114
  %116 = add nsw i64 %indvars.iv60, -1
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %116
  %118 = load double, double* %117, align 8
  %119 = fadd double %115, %118
  %120 = fmul double %119, 1.250000e-01
  %121 = fadd double %108, %120
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  store double %124, double* %125, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %126 = icmp slt i64 %indvars.iv.next61, %26
  br i1 %126, label %85, label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %85
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %127 = icmp slt i64 %indvars.iv.next64, %23
  br i1 %127, label %.preheader.us, label %._crit_edge21.loopexit

._crit_edge21.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader.lr.ph, %.preheader2
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %128 = icmp slt i64 %indvars.iv.next67, %27
  br i1 %128, label %.preheader2, label %._crit_edge26.loopexit

._crit_edge26.loopexit:                           ; preds = %._crit_edge21
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader4
  %129 = add nsw i32 %34, 1
  %130 = icmp slt i32 %129, 501
  br i1 %130, label %.preheader5, label %131

; <label>:131:                                    ; preds = %._crit_edge26
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
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.preheader3.lr.ph, label %41

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %wide.trip.count34 = zext i32 %13 to i64
  %wide.trip.count = zext i32 %13 to i64
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

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv36 = phi i64 [ %18, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 %19, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %20 = mul nsw i64 %14, %indvars.iv36
  %21 = trunc i64 %20 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge4.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %22 = icmp slt i64 %indvars.iv.next37, %15
  br i1 %22, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge4.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge4.us.us ], [ 0, %.preheader.us.us.preheader ]
  %23 = trunc i64 %indvars.iv32 to i32
  %24 = add i32 %21, %23
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %27

._crit_edge4.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:27:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %28 = add i64 %26, %indvars.iv
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %._crit_edge.us.us

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %32, %27
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us.us, label %27

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %38 = trunc i64 %indvars.iv.next37 to i32
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %39 = add i32 %.promoted, 1
  %40 = icmp sgt i32 %13, %39
  %smax = select i1 %40, i32 %13, i32 %39
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted14, %._crit_edge10.loopexit29 ]
  %.lcssa11 = phi i32 [ %38, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit29 ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %6, align 4
  br label %41

; <label>:41:                                     ; preds = %._crit_edge10, %2
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %44) #5
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
