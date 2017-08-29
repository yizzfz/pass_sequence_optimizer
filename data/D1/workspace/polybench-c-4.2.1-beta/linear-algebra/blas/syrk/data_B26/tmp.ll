; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca [1200 x [1200 x double]]*, align 8
  %10 = alloca [1200 x [1000 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1200, i32* %5, align 4
  store i32 1000, i32* %6, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %12 = bitcast [1200 x [1200 x double]]** %9 to i8**
  store i8* %11, i8** %12, align 8
  %13 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %14 = bitcast [1200 x [1000 x double]]** %10 to i8**
  store i8* %13, i8** %14, align 8
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %6, align 4
  %17 = bitcast i8* %11 to [1200 x double]*
  %18 = bitcast i8* %13 to [1000 x double]*
  call fastcc void @init_array(i32 %15, i32 %16, double* nonnull %7, double* nonnull %8, [1200 x double]* %17, [1000 x double]* %18)
  call void (...) @polybench_timer_start() #4
  %19 = load double, double* %7, align 8
  %20 = load double, double* %8, align 8
  %21 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %22 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %21, i64 0, i64 0
  %23 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %10, align 8
  %24 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %23, i64 0, i64 0
  call fastcc void @kernel_syrk(i32 %15, i32 %16, double %19, double %20, [1200 x double]* %22, [1000 x double]* %24)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = load i32, i32* %3, align 4
  %26 = icmp sgt i32 %25, 42
  br i1 %26, label %27, label %._crit_edge

; <label>:27:                                     ; preds = %2
  %28 = load i8**, i8*** %4, align 8
  %29 = load i8*, i8** %28, align 8
  %strcmpload = load i8, i8* %29, align 1
  %30 = icmp eq i8 %strcmpload, 0
  br i1 %30, label %31, label %._crit_edge

; <label>:31:                                     ; preds = %27
  %32 = load i32, i32* %5, align 4
  %33 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %34 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %33, i64 0, i64 0
  call fastcc void @print_array(i32 %32, [1200 x double]* %34)
  br label %._crit_edge

._crit_edge:                                      ; preds = %27, %2, %31
  %35 = bitcast [1200 x [1200 x double]]** %9 to i8**
  %36 = load i8*, i8** %35, align 8
  call void @free(i8* %36) #4
  %37 = bitcast [1200 x [1000 x double]]** %10 to i8**
  %38 = load i8*, i8** %37, align 8
  call void @free(i8* %38) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1000 x double]*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [1200 x double]* %4, [1200 x double]** %9, align 8
  store [1000 x double]* %5, [1000 x double]** %10, align 8
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  store i32 0, i32* %11, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader5.lr.ph, label %.preheader4.thread

.preheader4.thread:                               ; preds = %6
  store i32 0, i32* %11, align 4
  br label %.preheader4._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %14 = load i32, i32* %8, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = load i32, i32* %7, align 4
  %17 = sitofp i32 %16 to double
  %18 = load [1000 x double]*, [1000 x double]** %10, align 8
  br i1 %15, label %.preheader5.us.preheader, label %.preheader4

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %.promoted19 = load i32, i32* %11, align 4
  %19 = sext i32 %.promoted19 to i64
  %20 = sext i32 %16 to i64
  %21 = zext i32 %14 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge13.us, %.preheader5.us.preheader
  %indvars.iv32 = phi i64 [ %19, %.preheader5.us.preheader ], [ %indvars.iv.next33, %._crit_edge13.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader5.us
  %indvars.iv28 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next29, %._crit_edge ]
  %22 = mul nsw i64 %indvars.iv28, %indvars.iv32
  %23 = add nsw i64 %22, 1
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %16
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %17
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv32, i64 %indvars.iv28
  store double %27, double* %28, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %21
  br i1 %exitcond, label %._crit_edge13.us, label %._crit_edge

._crit_edge13.us:                                 ; preds = %._crit_edge
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %29 = icmp slt i64 %indvars.iv.next33, %20
  br i1 %29, label %.preheader5.us, label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %._crit_edge13.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5.lr.ph
  %.pr = load i32, i32* %7, align 4
  store i32 0, i32* %11, align 4
  %30 = icmp sgt i32 %.pr, 0
  br i1 %30, label %.preheader.lr.ph, label %.preheader4._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader4
  %31 = load i32, i32* %7, align 4
  %32 = icmp sgt i32 %31, 0
  %33 = load i32, i32* %8, align 4
  %34 = sitofp i32 %33 to double
  %35 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %32, label %.preheader.us.preheader, label %._crit_edge8.loopexit21

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %36 = sext i32 %.promoted to i64
  %37 = sext i32 %31 to i64
  %38 = zext i32 %31 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv26 = phi i64 [ %36, %.preheader.us.preheader ], [ %indvars.iv.next27, %._crit_edge.us ]
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge37 ]
  %39 = mul nsw i64 %indvars.iv, %indvars.iv26
  %40 = add nsw i64 %39, 2
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %33
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %34
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %35, i64 %indvars.iv26, i64 %indvars.iv
  store double %44, double* %45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next, %38
  br i1 %exitcond38, label %._crit_edge.us, label %._crit_edge37

._crit_edge.us:                                   ; preds = %._crit_edge37
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %46 = icmp slt i64 %indvars.iv.next27, %37
  br i1 %46, label %.preheader.us, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  %47 = trunc i64 %indvars.iv.next27 to i32
  br label %._crit_edge8

._crit_edge8.loopexit21:                          ; preds = %.preheader.lr.ph
  %48 = add i32 %.promoted, 1
  %49 = icmp sgt i32 %31, %48
  %smax = select i1 %49, i32 %31, i32 %48
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit21, %._crit_edge8.loopexit
  %.lcssa11 = phi i32 [ %47, %._crit_edge8.loopexit ], [ %smax, %._crit_edge8.loopexit21 ]
  store i32 %.lcssa11, i32* %11, align 4
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4, %.preheader4.thread, %._crit_edge8
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1000 x double]*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store double %2, double* %9, align 8
  store double %3, double* %10, align 8
  store [1200 x double]* %4, [1200 x double]** %11, align 8
  store [1000 x double]* %5, [1000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.preheader5.lr.ph, label %._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %16 = load i32, i32* %8, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = load double, double* %9, align 8
  %19 = load [1000 x double]*, [1000 x double]** %12, align 8
  %20 = load [1200 x double]*, [1200 x double]** %11, align 8
  %21 = load i32, i32* %7, align 4
  %22 = load double, double* %10, align 8
  %.promoted15 = load i32, i32* %13, align 4
  %23 = add i32 %.promoted15, 1
  %24 = sext i32 %.promoted15 to i64
  %25 = sext i32 %21 to i64
  %26 = trunc i32 %23 to i2
  br i1 %17, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %27 = zext i32 %16 to i64
  %broadcast.splatinsert105 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat106 = shufflevector <2 x double> %broadcast.splatinsert105, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv73 = phi i2 [ %indvars.iv.next74, %._crit_edge9.us..preheader5.us_crit_edge ], [ %26, %.preheader5.us.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge9.us..preheader5.us_crit_edge ], [ 0, %.preheader5.us.preheader ]
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge9.us..preheader5.us_crit_edge ], [ %24, %.preheader5.us.preheader ]
  %indvars.iv37 = phi i32 [ %indvars.iv.next38, %._crit_edge9.us..preheader5.us_crit_edge ], [ %23, %.preheader5.us.preheader ]
  %28 = add i32 %23, %indvar
  %29 = zext i32 %28 to i64
  %30 = zext i2 %indvars.iv73 to i64
  %31 = add i32 %23, %indvar
  %32 = add i32 %23, %indvar
  %33 = zext i32 %32 to i64
  %34 = add nsw i64 %33, -1
  %35 = icmp slt i64 %indvars.iv46, 0
  br i1 %35, label %._crit_edge9.us, label %.lr.ph.us

._crit_edge67:                                    ; preds = %._crit_edge67.preheader108, %._crit_edge67
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge67 ], [ %indvars.iv.ph, %._crit_edge67.preheader108 ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = fmul double %22, %37
  store double %38, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = fmul double %22, %40
  store double %41, double* %39, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = fmul double %22, %43
  store double %44, double* %42, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %46 = load double, double* %45, align 8
  %47 = fmul double %22, %46
  store double %47, double* %45, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader.lr.ph.us.loopexit, label %._crit_edge67, !llvm.loop !1

._crit_edge68:                                    ; preds = %._crit_edge68.preheader, %._crit_edge68
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %._crit_edge68 ], [ %indvars.iv35.unr.ph, %._crit_edge68.preheader ]
  %48 = load double, double* %64, align 8
  %49 = fmul double %18, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv35, i64 %indvars.iv41
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv35
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  store double %55, double* %53, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %56 = load double, double* %64, align 8
  %57 = fmul double %18, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv.next36, i64 %indvars.iv41
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv.next36
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  store double %63, double* %61, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count39.1
  br i1 %exitcond40.1, label %._crit_edge.us24.loopexit, label %._crit_edge68

.preheader.us22:                                  ; preds = %._crit_edge.us24, %.preheader.us22.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge.us24 ], [ 0, %.preheader.us22.preheader ]
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv46, i64 %indvars.iv41
  br i1 %lcmp.mod59, label %.prol.loopexit57, label %.prol.preheader56

.prol.preheader56:                                ; preds = %.preheader.us22
  %65 = load double, double* %64, align 8
  %66 = fmul double %18, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv41
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = load double, double* %101, align 8
  %71 = fadd double %69, %70
  store double %71, double* %101, align 8
  br label %.prol.loopexit57

.prol.loopexit57:                                 ; preds = %.preheader.us22, %.prol.preheader56
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader56 ], [ 0, %.preheader.us22 ]
  br i1 %100, label %._crit_edge.us24, label %._crit_edge68.preheader

._crit_edge68.preheader:                          ; preds = %.prol.loopexit57
  br label %._crit_edge68

.lr.ph.us:                                        ; preds = %.preheader5.us
  %xtraiter = and i64 %33, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv.prol
  %73 = load double, double* %72, align 8
  %74 = fmul double %22, %73
  store double %74, double* %72, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %30, %.prol.loopexit.loopexit ]
  %75 = icmp ult i64 %34, 3
  br i1 %75, label %.preheader.lr.ph.us, label %._crit_edge67.preheader

._crit_edge67.preheader:                          ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv37 to i64
  %76 = add nsw i64 %29, -4
  %77 = sub nsw i64 %76, %indvars.iv.unr
  %78 = lshr i64 %77, 2
  %79 = add nuw nsw i64 %78, 1
  %min.iters.check85 = icmp ult i64 %79, 2
  br i1 %min.iters.check85, label %._crit_edge67.preheader108, label %min.iters.checked86

._crit_edge67.preheader108:                       ; preds = %middle.block83, %min.iters.checked86, %._crit_edge67.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked86 ], [ %indvars.iv.unr, %._crit_edge67.preheader ], [ %ind.end94, %middle.block83 ]
  br label %._crit_edge67

min.iters.checked86:                              ; preds = %._crit_edge67.preheader
  %n.mod.vf87 = and i64 %79, 1
  %n.vec88 = sub nsw i64 %79, %n.mod.vf87
  %cmp.zero89 = icmp eq i64 %n.vec88, 0
  %80 = or i64 %indvars.iv.unr, 4
  %81 = shl nuw i64 %78, 2
  %82 = add i64 %80, %81
  %83 = shl nuw nsw i64 %n.mod.vf87, 2
  %ind.end94 = sub i64 %82, %83
  br i1 %cmp.zero89, label %._crit_edge67.preheader108, label %vector.ph90

vector.ph90:                                      ; preds = %min.iters.checked86
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82, %vector.ph90
  %index91 = phi i64 [ 0, %vector.ph90 ], [ %index.next92, %vector.body82 ]
  %84 = shl i64 %index91, 2
  %offset.idx96 = or i64 %indvars.iv.unr, %84
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %offset.idx96
  %86 = bitcast double* %85 to <8 x double>*
  %wide.vec100 = load <8 x double>, <8 x double>* %86, align 8
  %strided.vec101 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec102 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec103 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec104 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %87 = fmul <2 x double> %broadcast.splat106, %strided.vec101
  %88 = fmul <2 x double> %broadcast.splat106, %strided.vec102
  %89 = fmul <2 x double> %broadcast.splat106, %strided.vec103
  %90 = add nsw i64 %offset.idx96, 3
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %90
  %92 = fmul <2 x double> %broadcast.splat106, %strided.vec104
  %93 = getelementptr double, double* %91, i64 -3
  %94 = bitcast double* %93 to <8 x double>*
  %95 = shufflevector <2 x double> %87, <2 x double> %88, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %96 = shufflevector <2 x double> %89, <2 x double> %92, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec107 = shufflevector <4 x double> %95, <4 x double> %96, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec107, <8 x double>* %94, align 8
  %index.next92 = add i64 %index91, 2
  %97 = icmp eq i64 %index.next92, %n.vec88
  br i1 %97, label %middle.block83, label %vector.body82, !llvm.loop !7

middle.block83:                                   ; preds = %vector.body82
  %cmp.n95 = icmp eq i64 %n.mod.vf87, 0
  br i1 %cmp.n95, label %.preheader.lr.ph.us, label %._crit_edge67.preheader108

._crit_edge.us24.loopexit:                        ; preds = %._crit_edge68
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit57
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, %27
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us22

.preheader.lr.ph.us.loopexit:                     ; preds = %._crit_edge67
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.preheader.lr.ph.us.loopexit, %.prol.loopexit, %middle.block83
  %98 = icmp slt i64 %indvars.iv46, 0
  br i1 %98, label %._crit_edge9.us, label %.preheader.us22.preheader

.preheader.us22.preheader:                        ; preds = %.preheader.lr.ph.us
  %99 = and i32 %31, 1
  %lcmp.mod59 = icmp eq i32 %99, 0
  %100 = icmp eq i32 %31, 1
  %wide.trip.count39.1 = zext i32 %indvars.iv37 to i64
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 0
  br label %.preheader.us22

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us24
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.preheader.lr.ph.us, %.preheader5.us
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %102 = icmp slt i64 %indvars.iv.next47, %25
  br i1 %102, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  %indvars.iv.next74 = add i2 %indvars.iv73, 1
  br label %.preheader5.us

.preheader5:                                      ; preds = %.preheader5.preheader, %.preheader4..preheader5_crit_edge
  %indvars.iv75 = phi i2 [ %indvars.iv.next76, %.preheader4..preheader5_crit_edge ], [ %26, %.preheader5.preheader ]
  %indvar62 = phi i32 [ %indvar.next63, %.preheader4..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.preheader4..preheader5_crit_edge ], [ %24, %.preheader5.preheader ]
  %indvars.iv50 = phi i32 [ %indvars.iv.next51, %.preheader4..preheader5_crit_edge ], [ %23, %.preheader5.preheader ]
  %103 = add i32 %23, %indvar62
  %104 = zext i32 %103 to i64
  %105 = zext i2 %indvars.iv75 to i64
  %106 = add i32 %23, %indvar62
  %107 = zext i32 %106 to i64
  %108 = add nsw i64 %107, -1
  %109 = icmp slt i64 %indvars.iv54, 0
  br i1 %109, label %.preheader4, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter64 = and i64 %107, 3
  %lcmp.mod65 = icmp eq i64 %xtraiter64, 0
  br i1 %lcmp.mod65, label %.prol.loopexit61, label %.prol.preheader60.preheader

.prol.preheader60.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader60

.prol.preheader60:                                ; preds = %.prol.preheader60.preheader, %.prol.preheader60
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.prol.preheader60 ], [ 0, %.prol.preheader60.preheader ]
  %prol.iter66 = phi i64 [ %prol.iter66.sub, %.prol.preheader60 ], [ %xtraiter64, %.prol.preheader60.preheader ]
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv54, i64 %indvars.iv48.prol
  %111 = load double, double* %110, align 8
  %112 = fmul double %22, %111
  store double %112, double* %110, align 8
  %prol.iter66.sub = add nsw i64 %prol.iter66, -1
  %prol.iter66.cmp = icmp eq i64 %prol.iter66.sub, 0
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  br i1 %prol.iter66.cmp, label %.prol.loopexit61.loopexit, label %.prol.preheader60, !llvm.loop !8

.prol.loopexit61.loopexit:                        ; preds = %.prol.preheader60
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.prol.loopexit61.loopexit, %.lr.ph
  %indvars.iv48.unr = phi i64 [ 0, %.lr.ph ], [ %105, %.prol.loopexit61.loopexit ]
  %113 = icmp ult i64 %108, 3
  br i1 %113, label %.preheader4, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit61
  %wide.trip.count52.3 = zext i32 %indvars.iv50 to i64
  %114 = add nsw i64 %104, -4
  %115 = sub nsw i64 %114, %indvars.iv48.unr
  %116 = lshr i64 %115, 2
  %117 = add nuw nsw i64 %116, 1
  %min.iters.check = icmp ult i64 %117, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader109, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %117, 1
  %n.vec = sub nsw i64 %117, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %118 = or i64 %indvars.iv48.unr, 4
  %119 = shl nuw i64 %116, 2
  %120 = add i64 %118, %119
  %121 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %120, %121
  br i1 %cmp.zero, label %.lr.ph.new.preheader109, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %122 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv48.unr, %122
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv54, i64 %offset.idx
  %124 = bitcast double* %123 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %124, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec77 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec78 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec79 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %125 = fmul <2 x double> %broadcast.splat81, %strided.vec
  %126 = fmul <2 x double> %broadcast.splat81, %strided.vec77
  %127 = fmul <2 x double> %broadcast.splat81, %strided.vec78
  %128 = add nsw i64 %offset.idx, 3
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv54, i64 %128
  %130 = fmul <2 x double> %broadcast.splat81, %strided.vec79
  %131 = getelementptr double, double* %129, i64 -3
  %132 = bitcast double* %131 to <8 x double>*
  %133 = shufflevector <2 x double> %125, <2 x double> %126, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %134 = shufflevector <2 x double> %127, <2 x double> %130, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %133, <4 x double> %134, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %132, align 8
  %index.next = add i64 %index, 2
  %135 = icmp eq i64 %index.next, %n.vec
  br i1 %135, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader4, label %.lr.ph.new.preheader109

.lr.ph.new.preheader109:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv48.ph = phi i64 [ %indvars.iv48.unr, %min.iters.checked ], [ %indvars.iv48.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader109, %.lr.ph.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.3, %.lr.ph.new ], [ %indvars.iv48.ph, %.lr.ph.new.preheader109 ]
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv54, i64 %indvars.iv48
  %137 = load double, double* %136, align 8
  %138 = fmul double %22, %137
  store double %138, double* %136, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv54, i64 %indvars.iv.next49
  %140 = load double, double* %139, align 8
  %141 = fmul double %22, %140
  store double %141, double* %139, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv54, i64 %indvars.iv.next49.1
  %143 = load double, double* %142, align 8
  %144 = fmul double %22, %143
  store double %144, double* %142, align 8
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv48, 3
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv54, i64 %indvars.iv.next49.2
  %146 = load double, double* %145, align 8
  %147 = fmul double %22, %146
  store double %147, double* %145, align 8
  %indvars.iv.next49.3 = add nuw nsw i64 %indvars.iv48, 4
  %exitcond53.3 = icmp eq i64 %indvars.iv.next49.3, %wide.trip.count52.3
  br i1 %exitcond53.3, label %.preheader4.loopexit, label %.lr.ph.new, !llvm.loop !10

.preheader4.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block, %.prol.loopexit61, %.preheader5
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, 1
  %148 = icmp slt i64 %indvars.iv.next55, %25
  br i1 %148, label %.preheader4..preheader5_crit_edge, label %._crit_edge14.loopexit110

.preheader4..preheader5_crit_edge:                ; preds = %.preheader4
  %indvar.next63 = add i32 %indvar62, 1
  %indvars.iv.next51 = add i32 %indvars.iv50, 1
  %indvars.iv.next76 = add i2 %indvars.iv75, 1
  br label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit110:                        ; preds = %.preheader4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit110, %._crit_edge14.loopexit
  %.lcssa16.in = phi i64 [ %indvars.iv.next47, %._crit_edge14.loopexit ], [ %indvars.iv.next55, %._crit_edge14.loopexit110 ]
  %.lcssa16 = trunc i64 %.lcssa16.in to i32
  store i32 %.lcssa16, i32* %13, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %._crit_edge14
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1200 x double]*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1200 x double]* %1, [1200 x double]** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %2
  %12 = load i32, i32* %3, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = load [1200 x double]*, [1200 x double]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %13, label %.preheader.us.preheader, label %._crit_edge3.loopexit7

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %15 = sext i32 %.promoted to i64
  %16 = sext i32 %12 to i64
  %17 = sext i32 %12 to i64
  %18 = zext i32 %12 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ %15, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %19 = mul nsw i64 %16, %indvars.iv9
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %20 = add nsw i64 %19, %indvars.iv
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %._crit_edge11

; <label>:24:                                     ; preds = %._crit_edge12
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %24
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv9, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %18
  br i1 %exitcond13, label %._crit_edge.us, label %._crit_edge12

._crit_edge.us:                                   ; preds = %._crit_edge11
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %30 = icmp slt i64 %indvars.iv.next10, %17
  br i1 %30, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %31 = trunc i64 %indvars.iv.next10 to i32
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %.preheader.lr.ph
  %32 = add i32 %.promoted, 1
  %33 = icmp sgt i32 %12, %32
  %smax = select i1 %33, i32 %12, i32 %32
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %31, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit7 ]
  store i32 %.lcssa6, i32* %5, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge3
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #5
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
