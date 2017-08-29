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
  %17 = bitcast [1200 x [1200 x double]]** %9 to [1200 x double]**
  %18 = load [1200 x double]*, [1200 x double]** %17, align 8
  %.cast = bitcast i8* %13 to [1000 x double]*
  call fastcc void @init_array(i32 %15, i32 %16, double* nonnull %7, double* nonnull %8, [1200 x double]* %18, [1000 x double]* %.cast)
  call void (...) @polybench_timer_start() #4
  %19 = load i32, i32* %5, align 4
  %20 = load i32, i32* %6, align 4
  %21 = load double, double* %7, align 8
  %22 = load double, double* %8, align 8
  %23 = bitcast [1200 x [1200 x double]]** %9 to [1200 x double]**
  %24 = load [1200 x double]*, [1200 x double]** %23, align 8
  %25 = bitcast [1200 x [1000 x double]]** %10 to [1000 x double]**
  %26 = load [1000 x double]*, [1000 x double]** %25, align 8
  call fastcc void @kernel_syrk(i32 %19, i32 %20, double %21, double %22, [1200 x double]* %24, [1000 x double]* %26)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %27 = load i32, i32* %3, align 4
  %28 = icmp sgt i32 %27, 42
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %2
  %30 = load i8**, i8*** %4, align 8
  %31 = load i8*, i8** %30, align 8
  %strcmpload = load i8, i8* %31, align 1
  %32 = icmp eq i8 %strcmpload, 0
  br i1 %32, label %33, label %._crit_edge

; <label>:33:                                     ; preds = %29
  %34 = load i32, i32* %5, align 4
  %35 = bitcast [1200 x [1200 x double]]** %9 to [1200 x double]**
  %36 = load [1200 x double]*, [1200 x double]** %35, align 8
  call fastcc void @print_array(i32 %34, [1200 x double]* %36)
  br label %._crit_edge

._crit_edge:                                      ; preds = %29, %2, %33
  %37 = bitcast [1200 x [1200 x double]]** %9 to i8**
  %38 = load i8*, i8** %37, align 8
  call void @free(i8* %38) #4
  %39 = bitcast [1200 x [1000 x double]]** %10 to i8**
  %40 = load i8*, i8** %39, align 8
  call void @free(i8* %40) #4
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
  br label %22

; <label>:22:                                     ; preds = %22, %.preheader5.us
  %indvars.iv28 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next29, %22 ]
  %23 = mul nsw i64 %indvars.iv28, %indvars.iv32
  %24 = add nsw i64 %23, 1
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %16
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %17
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv32, i64 %indvars.iv28
  store double %28, double* %29, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %21
  br i1 %exitcond, label %._crit_edge13.us, label %22

._crit_edge13.us:                                 ; preds = %22
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %30 = icmp slt i64 %indvars.iv.next33, %20
  br i1 %30, label %.preheader5.us, label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %._crit_edge13.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5.lr.ph
  %.pr = load i32, i32* %7, align 4
  store i32 0, i32* %11, align 4
  %31 = icmp sgt i32 %.pr, 0
  br i1 %31, label %.preheader.lr.ph, label %.preheader4._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader4
  %32 = load i32, i32* %7, align 4
  %33 = icmp sgt i32 %32, 0
  %34 = load i32, i32* %8, align 4
  %35 = sitofp i32 %34 to double
  %36 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %33, label %.preheader.us.preheader, label %._crit_edge8.loopexit21

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %37 = sext i32 %.promoted to i64
  %38 = sext i32 %32 to i64
  %39 = zext i32 %32 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv26 = phi i64 [ %37, %.preheader.us.preheader ], [ %indvars.iv.next27, %._crit_edge.us ]
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %40 ]
  %41 = mul nsw i64 %indvars.iv, %indvars.iv26
  %42 = add nsw i64 %41, 2
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %34
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %35
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %indvars.iv26, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next, %39
  br i1 %exitcond36, label %._crit_edge.us, label %40

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %48 = icmp slt i64 %indvars.iv.next27, %38
  br i1 %48, label %.preheader.us, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  %49 = trunc i64 %indvars.iv.next27 to i32
  br label %._crit_edge8

._crit_edge8.loopexit21:                          ; preds = %.preheader.lr.ph
  %50 = add i32 %.promoted, 1
  %51 = icmp sgt i32 %32, %50
  %smax = select i1 %51, i32 %32, i32 %50
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit21, %._crit_edge8.loopexit
  %.lcssa11 = phi i32 [ %49, %._crit_edge8.loopexit ], [ %smax, %._crit_edge8.loopexit21 ]
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
  %27 = insertelement <2 x double> undef, double %22, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = insertelement <2 x double> undef, double %22, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %31 = zext i32 %16 to i64
  %32 = insertelement <2 x double> undef, double %22, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  %34 = insertelement <2 x double> undef, double %22, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv67 = phi i2 [ %26, %.preheader5.us.preheader ], [ %indvars.iv.next, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv49 = phi i64 [ %24, %.preheader5.us.preheader ], [ %indvars.iv.next50, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv37 = phi i32 [ %23, %.preheader5.us.preheader ], [ %indvars.iv.next38, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.us.preheader ], [ %indvar.next, %._crit_edge9.us..preheader5.us_crit_edge ]
  %36 = add i32 %23, %indvar
  %37 = zext i32 %36 to i64
  %38 = zext i2 %indvars.iv67 to i64
  %39 = add nuw nsw i64 %38, 4294967295
  %40 = and i64 %39, 4294967295
  %41 = add nuw nsw i64 %40, 1
  %42 = add i32 %23, %indvar
  %43 = add i32 %.promoted15, %indvar
  %44 = icmp slt i64 %indvars.iv49, 0
  br i1 %44, label %._crit_edge9.us, label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr75.ph, %.lr.ph.us.new.preheader.new ], [ %indvars.iv.next.3.1, %.lr.ph.us.new ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = fmul <2 x double> %33, %47
  %49 = bitcast double* %45 to <2 x double>*
  store <2 x double> %48, <2 x double>* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %51 = bitcast double* %50 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %51, align 8
  %53 = fmul <2 x double> %35, %52
  %54 = bitcast double* %50 to <2 x double>*
  store <2 x double> %53, <2 x double>* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next.3
  %56 = bitcast double* %55 to <2 x double>*
  %57 = load <2 x double>, <2 x double>* %56, align 8
  %58 = fmul <2 x double> %33, %57
  %59 = bitcast double* %55 to <2 x double>*
  store <2 x double> %58, <2 x double>* %59, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next.1.1
  %61 = bitcast double* %60 to <2 x double>*
  %62 = load <2 x double>, <2 x double>* %61, align 8
  %63 = fmul <2 x double> %35, %62
  %64 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %64, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %.preheader.lr.ph.us.loopexit.unr-lcssa, label %.lr.ph.us.new

.preheader.us22.new:                              ; preds = %.preheader.us22.new.preheader, %.preheader.us22.new
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.preheader.us22.new ], [ %indvars.iv35.unr.ph, %.preheader.us22.new.preheader ]
  %65 = load double, double* %81, align 8
  %66 = fmul double %18, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv35, i64 %indvars.iv45
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv35
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  store double %72, double* %70, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %73 = load double, double* %81, align 8
  %74 = fmul double %18, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv.next36, i64 %indvars.iv45
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next36
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  store double %80, double* %78, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count39.1
  br i1 %exitcond.1, label %._crit_edge.us24.loopexit, label %.preheader.us22.new

.preheader.us22:                                  ; preds = %._crit_edge.us24, %.preheader.us22.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us24 ], [ 0, %.preheader.us22.preheader ]
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %lcmp.mod43, label %.prol.loopexit41, label %.prol.preheader40

.prol.preheader40:                                ; preds = %.preheader.us22
  %82 = load double, double* %81, align 8
  %83 = fmul double %18, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv45
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = load double, double* %112, align 8
  %88 = fadd double %86, %87
  store double %88, double* %112, align 8
  br label %.prol.loopexit41

.prol.loopexit41:                                 ; preds = %.preheader.us22, %.prol.preheader40
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader40 ], [ 0, %.preheader.us22 ]
  br i1 %111, label %._crit_edge.us24, label %.preheader.us22.new.preheader

.preheader.us22.new.preheader:                    ; preds = %.prol.loopexit41
  br label %.preheader.us22.new

.lr.ph.us:                                        ; preds = %.preheader5.us
  %89 = add i32 %23, %indvar
  %xtraiter = and i32 %89, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.prol
  %91 = load double, double* %90, align 8
  %92 = fmul double %22, %91
  store double %92, double* %90, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %41, %.prol.loopexit.loopexit ]
  %93 = icmp ult i32 %43, 3
  br i1 %93, label %.preheader.lr.ph.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv37 to i64
  %94 = add nsw i64 %37, -4
  %95 = sub nsw i64 %94, %indvars.iv.unr
  %96 = lshr i64 %95, 2
  %97 = and i64 %96, 1
  %lcmp.mod73 = icmp eq i64 %97, 0
  br i1 %lcmp.mod73, label %.lr.ph.us.new.prol.preheader, label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.preheader:                     ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.prol

.lr.ph.us.new.prol:                               ; preds = %.lr.ph.us.new.prol.preheader
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.unr
  %99 = bitcast double* %98 to <2 x double>*
  %100 = load <2 x double>, <2 x double>* %99, align 8
  %101 = fmul <2 x double> %33, %100
  %102 = bitcast double* %98 to <2 x double>*
  store <2 x double> %101, <2 x double>* %102, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next.1.prol
  %104 = bitcast double* %103 to <2 x double>*
  %105 = load <2 x double>, <2 x double>* %104, align 8
  %106 = fmul <2 x double> %35, %105
  %107 = bitcast double* %103 to <2 x double>*
  store <2 x double> %106, <2 x double>* %107, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new.prol
  %indvars.iv.unr75.ph = phi i64 [ %indvars.iv.next.3.prol, %.lr.ph.us.new.prol ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ]
  br label %.lr.ph.us.new.prol.loopexit

.lr.ph.us.new.prol.loopexit:                      ; preds = %.lr.ph.us.new.prol.loopexit.unr-lcssa
  %108 = icmp eq i64 %96, 0
  br i1 %108, label %.preheader.lr.ph.us.loopexit, label %.lr.ph.us.new.preheader.new

.lr.ph.us.new.preheader.new:                      ; preds = %.lr.ph.us.new.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us22.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit41
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next46, %31
  br i1 %exitcond68, label %._crit_edge9.us.loopexit, label %.preheader.us22

.preheader.lr.ph.us.loopexit.unr-lcssa:           ; preds = %.lr.ph.us.new
  br label %.preheader.lr.ph.us.loopexit

.preheader.lr.ph.us.loopexit:                     ; preds = %.lr.ph.us.new.prol.loopexit, %.preheader.lr.ph.us.loopexit.unr-lcssa
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.preheader.lr.ph.us.loopexit, %.prol.loopexit
  %109 = icmp slt i64 %indvars.iv49, 0
  br i1 %109, label %._crit_edge9.us, label %.preheader.us22.preheader

.preheader.us22.preheader:                        ; preds = %.preheader.lr.ph.us
  %xtraiter42 = and i32 %42, 1
  %lcmp.mod43 = icmp eq i32 %xtraiter42, 0
  %110 = sub i32 0, %indvar
  %111 = icmp eq i32 %.promoted15, %110
  %wide.trip.count39.1 = zext i32 %indvars.iv37 to i64
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 0
  br label %.preheader.us22

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us24
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.preheader.lr.ph.us, %.preheader5.us
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %113 = icmp slt i64 %indvars.iv.next50, %25
  br i1 %113, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvars.iv.next = add i2 %indvars.iv67, 1
  %indvar.next = add nuw i32 %indvar, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  br label %.preheader5.us

.preheader5:                                      ; preds = %.preheader4..preheader5_crit_edge, %.preheader5.preheader
  %indvars.iv69 = phi i2 [ %26, %.preheader5.preheader ], [ %indvars.iv.next70, %.preheader4..preheader5_crit_edge ]
  %indvars.iv64 = phi i64 [ %24, %.preheader5.preheader ], [ %indvars.iv.next65, %.preheader4..preheader5_crit_edge ]
  %indvar59 = phi i32 [ 0, %.preheader5.preheader ], [ %indvar.next60, %.preheader4..preheader5_crit_edge ]
  %indvars.iv53 = phi i32 [ %23, %.preheader5.preheader ], [ %indvars.iv.next54, %.preheader4..preheader5_crit_edge ]
  %114 = add i32 %23, %indvar59
  %115 = zext i32 %114 to i64
  %116 = zext i2 %indvars.iv69 to i64
  %117 = add nuw nsw i64 %116, 4294967295
  %118 = and i64 %117, 4294967295
  %119 = add nuw nsw i64 %118, 1
  %120 = add i32 %.promoted15, %indvar59
  %121 = icmp slt i64 %indvars.iv64, 0
  br i1 %121, label %.preheader4, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %122 = add i32 %23, %indvar59
  %xtraiter61 = and i32 %122, 3
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  br i1 %lcmp.mod62, label %.prol.loopexit58, label %.prol.preheader57.preheader

.prol.preheader57.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader57

.prol.preheader57:                                ; preds = %.prol.preheader57.preheader, %.prol.preheader57
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.prol.preheader57 ], [ 0, %.prol.preheader57.preheader ]
  %prol.iter63 = phi i32 [ %prol.iter63.sub, %.prol.preheader57 ], [ %xtraiter61, %.prol.preheader57.preheader ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv51.prol
  %124 = load double, double* %123, align 8
  %125 = fmul double %22, %124
  store double %125, double* %123, align 8
  %prol.iter63.sub = add nsw i32 %prol.iter63, -1
  %prol.iter63.cmp = icmp eq i32 %prol.iter63.sub, 0
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  br i1 %prol.iter63.cmp, label %.prol.loopexit58.loopexit, label %.prol.preheader57, !llvm.loop !3

.prol.loopexit58.loopexit:                        ; preds = %.prol.preheader57
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.loopexit58.loopexit, %.lr.ph
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph ], [ %119, %.prol.loopexit58.loopexit ]
  %126 = icmp ult i32 %120, 3
  br i1 %126, label %.preheader4, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit58
  %wide.trip.count55.3 = zext i32 %indvars.iv53 to i64
  %127 = add nsw i64 %115, -4
  %128 = sub nsw i64 %127, %indvars.iv51.unr
  %129 = lshr i64 %128, 2
  %130 = and i64 %129, 1
  %lcmp.mod77 = icmp eq i64 %130, 0
  br i1 %lcmp.mod77, label %.lr.ph.new.prol.preheader, label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.preheader:                        ; preds = %.lr.ph.new.preheader
  br label %.lr.ph.new.prol

.lr.ph.new.prol:                                  ; preds = %.lr.ph.new.prol.preheader
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv51.unr
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8
  %134 = fmul <2 x double> %28, %133
  %135 = bitcast double* %131 to <2 x double>*
  store <2 x double> %134, <2 x double>* %135, align 8
  %indvars.iv.next52.1.prol = add nsw i64 %indvars.iv51.unr, 2
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv.next52.1.prol
  %137 = bitcast double* %136 to <2 x double>*
  %138 = load <2 x double>, <2 x double>* %137, align 8
  %139 = fmul <2 x double> %30, %138
  %140 = bitcast double* %136 to <2 x double>*
  store <2 x double> %139, <2 x double>* %140, align 8
  %indvars.iv.next52.3.prol = add nsw i64 %indvars.iv51.unr, 4
  br label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph.new.preheader, %.lr.ph.new.prol
  %indvars.iv51.unr79.ph = phi i64 [ %indvars.iv.next52.3.prol, %.lr.ph.new.prol ], [ %indvars.iv51.unr, %.lr.ph.new.preheader ]
  br label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol.loopexit:                         ; preds = %.lr.ph.new.prol.loopexit.unr-lcssa
  %141 = icmp eq i64 %129, 0
  br i1 %141, label %.preheader4.loopexit, label %.lr.ph.new.preheader.new

.lr.ph.new.preheader.new:                         ; preds = %.lr.ph.new.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr79.ph, %.lr.ph.new.preheader.new ], [ %indvars.iv.next52.3.1, %.lr.ph.new ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv51
  %143 = bitcast double* %142 to <2 x double>*
  %144 = load <2 x double>, <2 x double>* %143, align 8
  %145 = fmul <2 x double> %28, %144
  %146 = bitcast double* %142 to <2 x double>*
  store <2 x double> %145, <2 x double>* %146, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv.next52.1
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %148, align 8
  %150 = fmul <2 x double> %30, %149
  %151 = bitcast double* %147 to <2 x double>*
  store <2 x double> %150, <2 x double>* %151, align 8
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv.next52.3
  %153 = bitcast double* %152 to <2 x double>*
  %154 = load <2 x double>, <2 x double>* %153, align 8
  %155 = fmul <2 x double> %28, %154
  %156 = bitcast double* %152 to <2 x double>*
  store <2 x double> %155, <2 x double>* %156, align 8
  %indvars.iv.next52.1.1 = add nsw i64 %indvars.iv51, 6
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv.next52.1.1
  %158 = bitcast double* %157 to <2 x double>*
  %159 = load <2 x double>, <2 x double>* %158, align 8
  %160 = fmul <2 x double> %30, %159
  %161 = bitcast double* %157 to <2 x double>*
  store <2 x double> %160, <2 x double>* %161, align 8
  %indvars.iv.next52.3.1 = add nsw i64 %indvars.iv51, 8
  %exitcond56.3.1 = icmp eq i64 %indvars.iv.next52.3.1, %wide.trip.count55.3
  br i1 %exitcond56.3.1, label %.preheader4.loopexit.unr-lcssa, label %.lr.ph.new

.preheader4.loopexit.unr-lcssa:                   ; preds = %.lr.ph.new
  br label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %.lr.ph.new.prol.loopexit, %.preheader4.loopexit.unr-lcssa
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.prol.loopexit58, %.preheader5
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %162 = icmp slt i64 %indvars.iv.next65, %25
  br i1 %162, label %.preheader4..preheader5_crit_edge, label %._crit_edge14.loopexit71

.preheader4..preheader5_crit_edge:                ; preds = %.preheader4
  %indvars.iv.next70 = add i2 %indvars.iv69, 1
  %indvar.next60 = add nuw i32 %indvar59, 1
  %indvars.iv.next54 = add i32 %indvars.iv53, 1
  br label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit71:                         ; preds = %.preheader4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit71, %._crit_edge14.loopexit
  %.lcssa16.in = phi i64 [ %indvars.iv.next50, %._crit_edge14.loopexit ], [ %indvars.iv.next65, %._crit_edge14.loopexit71 ]
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
  br label %20

; <label>:20:                                     ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %21 = add nsw i64 %19, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %._crit_edge13

; <label>:25:                                     ; preds = %20
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %20, %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv9, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, %18
  br i1 %exitcond11, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %31 = icmp slt i64 %indvars.iv.next10, %17
  br i1 %31, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %32 = trunc i64 %indvars.iv.next10 to i32
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %.preheader.lr.ph
  %33 = add i32 %.promoted, 1
  %34 = icmp sgt i32 %12, %33
  %smax = select i1 %34, i32 %12, i32 %33
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %32, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit7 ]
  store i32 %.lcssa6, i32* %5, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge3
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %37) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
