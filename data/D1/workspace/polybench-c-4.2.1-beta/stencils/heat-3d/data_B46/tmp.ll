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
  %8 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %9 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  store i8* %8, i8** %9, align 8
  %10 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %11 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  store i8* %10, i8** %11, align 8
  %12 = load i32, i32* %5, align 4
  %13 = bitcast i8* %8 to [120 x [120 x double]]*
  %14 = bitcast i8* %10 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %12, [120 x [120 x double]]* %13, [120 x [120 x double]]* %14)
  tail call void (...) @polybench_timer_start() #3
  %15 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %16 = load [120 x [120 x double]]*, [120 x [120 x double]]** %15, align 8
  %17 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %17, align 8
  tail call fastcc void @kernel_heat_3d(i32 %12, [120 x [120 x double]]* %16, [120 x [120 x double]]* %18)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %19 = load i32, i32* %3, align 4
  %20 = icmp sgt i32 %19, 42
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %29

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %28 = load [120 x [120 x double]]*, [120 x [120 x double]]** %27, align 8
  tail call fastcc void @print_array(i32 %26, [120 x [120 x double]]* %28)
  br label %29

; <label>:29:                                     ; preds = %21, %25, %2
  %30 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  %31 = load i8*, i8** %30, align 8
  tail call void @free(i8* %31) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
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
  br i1 %9, label %.preheader3.lr.ph, label %50

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %11 = zext i32 %10 to i64
  %12 = sext i32 %10 to i64
  %13 = icmp sgt i32 %10, 0
  %14 = sitofp i32 %10 to double
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %16 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %13, label %.preheader3.us.preheader, label %._crit_edge9.loopexit27

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %17 = sext i32 %.promoted to i64
  %xtraiter = and i64 %11, 1
  %18 = icmp sgt i32 %10, 0
  %19 = icmp eq i64 %xtraiter, 0
  %20 = icmp eq i32 %10, 1
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge4.us
  %indvars.iv35 = phi i64 [ %17, %.preheader3.us.preheader ], [ %indvars.iv.next36, %._crit_edge4.us ]
  br i1 %18, label %.preheader.us.us.preheader, label %._crit_edge4.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %21 = trunc i64 %indvars.iv35 to i32
  br label %.preheader.us.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %.preheader3.us
  %.lcssa8.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge4.us.loopexit ]
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %22 = icmp slt i64 %indvars.iv.next36, %12
  br i1 %22, label %.preheader3.us, label %._crit_edge9.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %23 = trunc i64 %indvars.iv31 to i32
  %24 = add i32 %23, %21
  %25 = add i32 %24, %10
  br i1 %19, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %14
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv35, i64 %indvars.iv31, i64 0
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %16, i64 %indvars.iv35, i64 %indvars.iv31, i64 0
  store double %28, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %20, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, %11
  br i1 %exitcond, label %._crit_edge4.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %31 = trunc i64 %indvars.iv to i32
  %32 = sub i32 %25, %31
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %16, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = trunc i64 %indvars.iv.next to i32
  %37 = sub i32 %25, %36
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %40, <double 1.000000e+01, double 1.000000e+01>
  %42 = insertelement <2 x double> undef, double %14, i32 0
  %43 = insertelement <2 x double> %42, double %14, i32 1
  %44 = fdiv <2 x double> %41, %43
  %45 = bitcast double* %34 to <2 x double>*
  %46 = bitcast double* %35 to <2 x double>*
  store <2 x double> %44, <2 x double>* %45, align 8
  store <2 x double> %44, <2 x double>* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %11
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge9.loopexit:                            ; preds = %._crit_edge4.us
  %47 = trunc i64 %indvars.iv.next36 to i32
  br label %._crit_edge9

._crit_edge9.loopexit27:                          ; preds = %.preheader3.lr.ph
  %.promoted13 = load i32, i32* %8, align 4
  %48 = add i32 %.promoted, 1
  %49 = icmp sgt i32 %10, %48
  %smax = select i1 %49, i32 %10, i32 %48
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit27, %._crit_edge9.loopexit
  %.lcssa8.lcssa15.lcssa = phi i32 [ %.lcssa8.lcssa.us, %._crit_edge9.loopexit ], [ %.promoted13, %._crit_edge9.loopexit27 ]
  %.lcssa10 = phi i32 [ %47, %._crit_edge9.loopexit ], [ %smax, %._crit_edge9.loopexit27 ]
  store i32 %.lcssa10, i32* %7, align 4
  store i32 %.lcssa8.lcssa15.lcssa, i32* %8, align 4
  br label %50

; <label>:50:                                     ; preds = %._crit_edge9, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
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
  %28 = zext i32 %12 to i64
  %wide.trip.count55 = zext i32 %12 to i64
  %29 = icmp sgt i32 %8, 1
  %30 = icmp sgt i32 %16, 1
  %31 = icmp sgt i32 %17, 1
  %32 = icmp sgt i32 %18, 1
  %33 = icmp sgt i32 %9, 1
  %34 = icmp sgt i32 %11, 1
  br label %.preheader5

.preheader5:                                      ; preds = %3, %._crit_edge26
  %35 = phi i32 [ %.promoted43, %3 ], [ %126, %._crit_edge26 ]
  br i1 %29, label %.preheader3.preheader, label %.preheader4

.preheader3.preheader:                            ; preds = %.preheader5
  br label %.preheader3

.preheader4.loopexit:                             ; preds = %._crit_edge6
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5
  br i1 %30, label %.preheader2.preheader, label %._crit_edge26

.preheader2.preheader:                            ; preds = %.preheader4
  br label %.preheader2

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge6
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge6 ], [ 1, %.preheader3.preheader ]
  br i1 %33, label %.preheader1.lr.ph, label %._crit_edge6

.preheader1.lr.ph:                                ; preds = %.preheader3
  %36 = add nuw nsw i64 %indvars.iv57, 1
  %37 = add nsw i64 %indvars.iv57, -1
  br i1 %34, label %.preheader1.us.preheader, label %._crit_edge6

.preheader1.us.preheader:                         ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge.us ], [ 1, %.preheader1.us.preheader ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %38 = add nsw i64 %indvars.iv53, -1
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader1.us
  %indvars.iv = phi i64 [ 1, %.preheader1.us ], [ %indvars.iv.next, %39 ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %36, i64 %indvars.iv53, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %37, i64 %indvars.iv53, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv.next54, i64 %indvars.iv
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, 2.000000e+00
  %68 = fsub double %64, %67
  %69 = add nsw i64 %indvars.iv, -1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %68, %71
  %73 = fmul double %72, 1.250000e-01
  %74 = fadd double %62, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv
  store double %77, double* %78, align 8
  %exitcond69 = icmp eq i64 %indvars.iv.next, %28
  br i1 %exitcond69, label %._crit_edge.us, label %39

._crit_edge.us:                                   ; preds = %39
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge6.loopexit, label %.preheader1.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader1.lr.ph, %.preheader3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %79 = icmp slt i64 %indvars.iv.next58, %15
  br i1 %79, label %.preheader3, label %.preheader4.loopexit

.preheader2:                                      ; preds = %.preheader2.preheader, %._crit_edge21
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge21 ], [ 1, %.preheader2.preheader ]
  br i1 %31, label %.preheader.lr.ph, label %._crit_edge21

.preheader.lr.ph:                                 ; preds = %.preheader2
  %80 = add nuw nsw i64 %indvars.iv66, 1
  %81 = add nsw i64 %indvars.iv66, -1
  br i1 %32, label %.preheader.us.preheader, label %._crit_edge21

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge18.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge18.us ], [ 1, %.preheader.us.preheader ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %82 = add nsw i64 %indvars.iv63, -1
  br label %83

; <label>:83:                                     ; preds = %.preheader.us, %83
  %indvars.iv60 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next61, %83 ]
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %80, i64 %indvars.iv63, i64 %indvars.iv60
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %81, i64 %indvars.iv63, i64 %indvars.iv60
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %indvars.iv60
  %91 = load double, double* %90, align 8
  %92 = insertelement <2 x double> undef, double %87, i32 0
  %93 = shufflevector <2 x double> %92, <2 x double> undef, <2 x i32> zeroinitializer
  %94 = fmul <2 x double> %93, <double 2.000000e+00, double 2.000000e+00>
  %95 = insertelement <2 x double> undef, double %85, i32 0
  %96 = insertelement <2 x double> %95, double %91, i32 1
  %97 = fsub <2 x double> %96, %94
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %82, i64 %indvars.iv60
  %99 = load double, double* %98, align 8
  %100 = insertelement <2 x double> undef, double %89, i32 0
  %101 = insertelement <2 x double> %100, double %99, i32 1
  %102 = fadd <2 x double> %97, %101
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = extractelement <2 x double> %103, i32 0
  %105 = extractelement <2 x double> %103, i32 1
  %106 = fadd double %104, %105
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv.next61
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, 2.000000e+00
  %112 = fsub double %108, %111
  %113 = add nsw i64 %indvars.iv60, -1
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %113
  %115 = load double, double* %114, align 8
  %116 = fadd double %112, %115
  %117 = fmul double %116, 1.250000e-01
  %118 = fadd double %106, %117
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  store double %121, double* %122, align 8
  %123 = icmp slt i64 %indvars.iv.next61, %26
  br i1 %123, label %83, label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %83
  %124 = icmp slt i64 %indvars.iv.next64, %23
  br i1 %124, label %.preheader.us, label %._crit_edge21.loopexit

._crit_edge21.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader.lr.ph, %.preheader2
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %125 = icmp slt i64 %indvars.iv.next67, %27
  br i1 %125, label %.preheader2, label %._crit_edge26.loopexit

._crit_edge26.loopexit:                           ; preds = %._crit_edge21
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader4
  %126 = add nsw i32 %35, 1
  %127 = icmp slt i32 %126, 501
  br i1 %127, label %.preheader5, label %128

; <label>:128:                                    ; preds = %._crit_edge26
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
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %7) #4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.preheader3.lr.ph, label %44

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %14 = zext i32 %13 to i64
  %15 = zext i32 %13 to i64
  %16 = sext i32 %13 to i64
  %17 = sext i32 %13 to i64
  %18 = icmp sgt i32 %13, 0
  %19 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %18, label %.preheader3.us.preheader, label %._crit_edge9.loopexit27

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %20 = sext i32 %.promoted to i64
  %21 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge4.us
  %indvars.iv35 = phi i64 [ %20, %.preheader3.us.preheader ], [ %indvars.iv.next36, %._crit_edge4.us ]
  br i1 %21, label %.preheader.us.us.preheader, label %._crit_edge4.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %22 = mul nsw i64 %16, %indvars.iv35
  %23 = trunc i64 %22 to i32
  br label %.preheader.us.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %.preheader3.us
  %.lcssa8.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge4.us.loopexit ]
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %24 = icmp slt i64 %indvars.iv.next36, %17
  br i1 %24, label %.preheader3.us, label %._crit_edge9.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %25 = trunc i64 %indvars.iv31 to i32
  %26 = add i32 %23, %25
  %27 = mul i32 %26, %13
  %28 = zext i32 %27 to i64
  br label %29

._crit_edge.us.us:                                ; preds = %36
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next32, %14
  br i1 %exitcond38, label %._crit_edge4.us.loopexit, label %.preheader.us.us

; <label>:29:                                     ; preds = %36, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %36 ], [ 0, %.preheader.us.us ]
  %30 = add i64 %28, %indvars.iv
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #4
  br label %36

; <label>:36:                                     ; preds = %34, %29
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %15
  br i1 %exitcond, label %._crit_edge.us.us, label %29

._crit_edge9.loopexit:                            ; preds = %._crit_edge4.us
  %41 = trunc i64 %indvars.iv.next36 to i32
  br label %._crit_edge9

._crit_edge9.loopexit27:                          ; preds = %.preheader3.lr.ph
  %.promoted13 = load i32, i32* %6, align 4
  %42 = add i32 %.promoted, 1
  %43 = icmp sgt i32 %13, %42
  %smax = select i1 %43, i32 %13, i32 %42
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit27, %._crit_edge9.loopexit
  %.lcssa8.lcssa15.lcssa = phi i32 [ %.lcssa8.lcssa.us, %._crit_edge9.loopexit ], [ %.promoted13, %._crit_edge9.loopexit27 ]
  %.lcssa10 = phi i32 [ %41, %._crit_edge9.loopexit ], [ %smax, %._crit_edge9.loopexit27 ]
  store i32 %.lcssa10, i32* %5, align 4
  store i32 %.lcssa8.lcssa15.lcssa, i32* %6, align 4
  br label %44

; <label>:44:                                     ; preds = %._crit_edge9, %2
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %47) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
