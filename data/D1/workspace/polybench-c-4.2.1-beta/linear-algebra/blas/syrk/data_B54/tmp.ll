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
  %21 = bitcast [1200 x [1200 x double]]** %9 to [1200 x double]**
  %22 = load [1200 x double]*, [1200 x double]** %21, align 8
  %23 = bitcast [1200 x [1000 x double]]** %10 to [1000 x double]**
  %24 = load [1000 x double]*, [1000 x double]** %23, align 8
  call fastcc void @kernel_syrk(i32 %15, i32 %16, double %19, double %20, [1200 x double]* %22, [1000 x double]* %24)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = load i32, i32* %3, align 4
  %26 = icmp sgt i32 %25, 42
  br i1 %26, label %27, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %35

; <label>:27:                                     ; preds = %2
  %28 = load i8**, i8*** %4, align 8
  %29 = load i8*, i8** %28, align 8
  %strcmpload = load i8, i8* %29, align 1
  %30 = icmp eq i8 %strcmpload, 0
  br i1 %30, label %31, label %._crit_edge2

._crit_edge2:                                     ; preds = %27
  br label %35

; <label>:31:                                     ; preds = %27
  %32 = load i32, i32* %5, align 4
  %33 = bitcast [1200 x [1200 x double]]** %9 to [1200 x double]**
  %34 = load [1200 x double]*, [1200 x double]** %33, align 8
  call fastcc void @print_array(i32 %32, [1200 x double]* %34)
  br label %35

; <label>:35:                                     ; preds = %._crit_edge2, %._crit_edge, %31
  %36 = bitcast [1200 x [1200 x double]]** %9 to i8**
  %37 = load i8*, i8** %36, align 8
  call void @free(i8* %37) #4
  %38 = bitcast [1200 x [1000 x double]]** %10 to i8**
  %39 = load i8*, i8** %38, align 8
  call void @free(i8* %39) #4
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
  br label %52

.preheader5.lr.ph:                                ; preds = %6
  %14 = load i32, i32* %8, align 4
  %15 = zext i32 %14 to i64
  %16 = icmp sgt i32 %14, 0
  %17 = load i32, i32* %7, align 4
  %18 = sext i32 %17 to i64
  %19 = sitofp i32 %17 to double
  %20 = load [1000 x double]*, [1000 x double]** %10, align 8
  br i1 %16, label %.preheader5.us.preheader, label %.preheader5.lr.ph..preheader4_crit_edge

.preheader5.lr.ph..preheader4_crit_edge:          ; preds = %.preheader5.lr.ph
  br label %.preheader4

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %.promoted19 = load i32, i32* %11, align 4
  %21 = sext i32 %.promoted19 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge13.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv32 = phi i64 [ %21, %.preheader5.us.preheader ], [ %indvars.iv.next33, %._crit_edge13.us..preheader5.us_crit_edge ]
  br label %22

; <label>:22:                                     ; preds = %._crit_edge, %.preheader5.us
  %indvars.iv28 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next29, %._crit_edge ]
  %23 = mul nsw i64 %indvars.iv28, %indvars.iv32
  %24 = add nsw i64 %23, 1
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %17
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %19
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv32, i64 %indvars.iv28
  store double %28, double* %29, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %15
  br i1 %exitcond, label %._crit_edge13.us, label %._crit_edge

._crit_edge:                                      ; preds = %22
  br label %22

._crit_edge13.us:                                 ; preds = %22
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %30 = icmp slt i64 %indvars.iv.next33, %18
  br i1 %30, label %._crit_edge13.us..preheader5.us_crit_edge, label %.preheader4.loopexit

._crit_edge13.us..preheader5.us_crit_edge:        ; preds = %._crit_edge13.us
  br label %.preheader5.us

.preheader4.loopexit:                             ; preds = %._crit_edge13.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader5.lr.ph..preheader4_crit_edge, %.preheader4.loopexit
  %.pr = load i32, i32* %7, align 4
  store i32 0, i32* %11, align 4
  %31 = icmp sgt i32 %.pr, 0
  br i1 %31, label %.preheader.lr.ph, label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4
  br label %52

.preheader.lr.ph:                                 ; preds = %.preheader4
  %32 = load i32, i32* %7, align 4
  %33 = sext i32 %32 to i64
  %34 = icmp sgt i32 %32, 0
  %35 = load i32, i32* %8, align 4
  %36 = sitofp i32 %35 to double
  %37 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %34, label %.preheader.us.preheader, label %._crit_edge8.loopexit21

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %38 = sext i32 %.promoted to i64
  %39 = zext i32 %32 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv26 = phi i64 [ %38, %.preheader.us.preheader ], [ %indvars.iv.next27, %._crit_edge.us..preheader.us_crit_edge ]
  br label %40

; <label>:40:                                     ; preds = %._crit_edge40, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge40 ]
  %41 = mul nsw i64 %indvars.iv, %indvars.iv26
  %42 = add nsw i64 %41, 2
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %35
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %36
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %37, i64 %indvars.iv26, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next, %39
  br i1 %exitcond36, label %._crit_edge.us, label %._crit_edge40

._crit_edge40:                                    ; preds = %40
  br label %40

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %48 = icmp slt i64 %indvars.iv.next27, %33
  br i1 %48, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge8.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

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
  br label %52

; <label>:52:                                     ; preds = %.preheader4._crit_edge, %.preheader4.thread, %._crit_edge8
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

._crit_edge:                                      ; preds = %6
  br label %154

.preheader5.lr.ph:                                ; preds = %6
  %16 = load i32, i32* %8, align 4
  %17 = zext i32 %16 to i64
  %18 = icmp sgt i32 %16, 0
  %19 = load double, double* %9, align 8
  %20 = load [1000 x double]*, [1000 x double]** %12, align 8
  %21 = load [1200 x double]*, [1200 x double]** %11, align 8
  %22 = load i32, i32* %7, align 4
  %23 = load double, double* %10, align 8
  %.promoted15 = load i32, i32* %13, align 4
  %24 = add i32 %.promoted15, 1
  %25 = sext i32 %.promoted15 to i64
  %26 = sext i32 %22 to i64
  %27 = trunc i32 %24 to i2
  %28 = zext i32 %24 to i64
  br i1 %18, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %23, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %broadcast.splatinsert105 = insertelement <2 x double> undef, double %23, i32 0
  %broadcast.splat106 = shufflevector <2 x double> %broadcast.splatinsert105, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge9.us..preheader5.us_crit_edge
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge9.us..preheader5.us_crit_edge ], [ 0, %.preheader5.us.preheader ]
  %indvars.iv68 = phi i2 [ %indvars.iv.next69, %._crit_edge9.us..preheader5.us_crit_edge ], [ %27, %.preheader5.us.preheader ]
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge9.us..preheader5.us_crit_edge ], [ %25, %.preheader5.us.preheader ]
  %indvars.iv37 = phi i32 [ %indvars.iv.next38, %._crit_edge9.us..preheader5.us_crit_edge ], [ %24, %.preheader5.us.preheader ]
  %29 = add i64 %28, %indvars.iv70
  %30 = and i64 %29, 4294967295
  %31 = zext i2 %indvars.iv68 to i64
  %32 = trunc i64 %indvars.iv70 to i32
  %33 = add i32 %24, %32
  %34 = trunc i64 %indvars.iv70 to i32
  %35 = add i32 %24, %34
  %36 = zext i32 %35 to i64
  %37 = add nsw i64 %36, -1
  %38 = icmp slt i64 %indvars.iv46, 0
  br i1 %38, label %.preheader5.us.._crit_edge9.us_crit_edge, label %.lr.ph.us

.preheader5.us.._crit_edge9.us_crit_edge:         ; preds = %.preheader5.us
  br label %._crit_edge9.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader108
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader108 ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = fmul double %23, %40
  store double %41, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = fmul double %23, %43
  store double %44, double* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %23, %46
  store double %47, double* %45, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %23, %49
  store double %50, double* %48, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader.lr.ph.us.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.preheader.us22.new:                              ; preds = %.preheader.us22.new..preheader.us22.new_crit_edge, %.preheader.us22.new.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.preheader.us22.new..preheader.us22.new_crit_edge ], [ %indvars.iv35.unr.ph, %.preheader.us22.new.preheader ]
  %51 = load double, double* %67, align 8
  %52 = fmul double %19, %51
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv35, i64 %indvars.iv41
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %indvars.iv35
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  store double %58, double* %56, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %59 = load double, double* %67, align 8
  %60 = fmul double %19, %59
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv.next36, i64 %indvars.iv41
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %indvars.iv.next36
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  store double %66, double* %64, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count39.1
  br i1 %exitcond40.1, label %._crit_edge.us24.loopexit, label %.preheader.us22.new..preheader.us22.new_crit_edge

.preheader.us22.new..preheader.us22.new_crit_edge: ; preds = %.preheader.us22.new
  br label %.preheader.us22.new

.preheader.us22:                                  ; preds = %._crit_edge.us24..preheader.us22_crit_edge, %.preheader.us22.preheader
  %indvars.iv41 = phi i64 [ 0, %.preheader.us22.preheader ], [ %indvars.iv.next42, %._crit_edge.us24..preheader.us22_crit_edge ]
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv41
  br i1 %104, label %.preheader.us22..prol.loopexit57_crit_edge, label %.prol.preheader56

.preheader.us22..prol.loopexit57_crit_edge:       ; preds = %.preheader.us22
  br label %.prol.loopexit57

.prol.preheader56:                                ; preds = %.preheader.us22
  %68 = load double, double* %67, align 8
  %69 = fmul double %19, %68
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 0, i64 %indvars.iv41
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = load double, double* %103, align 8
  %74 = fadd double %72, %73
  store double %74, double* %103, align 8
  br label %.prol.loopexit57

.prol.loopexit57:                                 ; preds = %.preheader.us22..prol.loopexit57_crit_edge, %.prol.preheader56
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader56 ], [ 0, %.preheader.us22..prol.loopexit57_crit_edge ]
  br i1 %105, label %.prol.loopexit57.._crit_edge.us24_crit_edge, label %.preheader.us22.new.preheader

.prol.loopexit57.._crit_edge.us24_crit_edge:      ; preds = %.prol.loopexit57
  br label %._crit_edge.us24

.preheader.us22.new.preheader:                    ; preds = %.prol.loopexit57
  br label %.preheader.us22.new

.lr.ph.us:                                        ; preds = %.preheader5.us
  %xtraiter = and i64 %36, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %indvars.iv.prol
  %76 = load double, double* %75, align 8
  %77 = fmul double %23, %76
  store double %77, double* %75, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !5

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %31, %.prol.loopexit.loopexit ]
  %78 = icmp ult i64 %37, 3
  br i1 %78, label %.prol.loopexit..preheader.lr.ph.us_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit..preheader.lr.ph.us_crit_edge:     ; preds = %.prol.loopexit
  br label %.preheader.lr.ph.us

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv37 to i64
  %79 = add nsw i64 %30, -4
  %80 = sub nsw i64 %79, %indvars.iv.unr
  %81 = lshr i64 %80, 2
  %82 = add nuw nsw i64 %81, 1
  %min.iters.check85 = icmp ult i64 %82, 2
  br i1 %min.iters.check85, label %.lr.ph.us.new.preheader..lr.ph.us.new.preheader108_crit_edge, label %min.iters.checked86

.lr.ph.us.new.preheader..lr.ph.us.new.preheader108_crit_edge: ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.preheader108

.lr.ph.us.new.preheader108:                       ; preds = %middle.block83..lr.ph.us.new.preheader108_crit_edge, %min.iters.checked86..lr.ph.us.new.preheader108_crit_edge, %.lr.ph.us.new.preheader..lr.ph.us.new.preheader108_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked86..lr.ph.us.new.preheader108_crit_edge ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader..lr.ph.us.new.preheader108_crit_edge ], [ %ind.end94, %middle.block83..lr.ph.us.new.preheader108_crit_edge ]
  br label %.lr.ph.us.new

min.iters.checked86:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf87 = and i64 %82, 1
  %n.vec88 = sub nsw i64 %82, %n.mod.vf87
  %cmp.zero89 = icmp eq i64 %n.vec88, 0
  %83 = or i64 %indvars.iv.unr, 4
  %84 = shl nuw i64 %81, 2
  %85 = add i64 %83, %84
  %86 = shl nuw nsw i64 %n.mod.vf87, 2
  %ind.end94 = sub i64 %85, %86
  br i1 %cmp.zero89, label %min.iters.checked86..lr.ph.us.new.preheader108_crit_edge, label %vector.ph90

min.iters.checked86..lr.ph.us.new.preheader108_crit_edge: ; preds = %min.iters.checked86
  br label %.lr.ph.us.new.preheader108

vector.ph90:                                      ; preds = %min.iters.checked86
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82.vector.body82_crit_edge, %vector.ph90
  %index91 = phi i64 [ 0, %vector.ph90 ], [ %index.next92, %vector.body82.vector.body82_crit_edge ]
  %87 = shl i64 %index91, 2
  %offset.idx96 = or i64 %indvars.iv.unr, %87
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %offset.idx96
  %89 = bitcast double* %88 to <8 x double>*
  %wide.vec100 = load <8 x double>, <8 x double>* %89, align 8
  %strided.vec101 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec102 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec103 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec104 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %90 = fmul <2 x double> %broadcast.splat106, %strided.vec101
  %91 = fmul <2 x double> %broadcast.splat106, %strided.vec102
  %92 = fmul <2 x double> %broadcast.splat106, %strided.vec103
  %93 = add nsw i64 %offset.idx96, 3
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 %93
  %95 = fmul <2 x double> %broadcast.splat106, %strided.vec104
  %96 = getelementptr double, double* %94, i64 -3
  %97 = bitcast double* %96 to <8 x double>*
  %98 = shufflevector <2 x double> %90, <2 x double> %91, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %99 = shufflevector <2 x double> %92, <2 x double> %95, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec107 = shufflevector <4 x double> %98, <4 x double> %99, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec107, <8 x double>* %97, align 8
  %index.next92 = add i64 %index91, 2
  %100 = icmp eq i64 %index.next92, %n.vec88
  br i1 %100, label %middle.block83, label %vector.body82.vector.body82_crit_edge, !llvm.loop !7

vector.body82.vector.body82_crit_edge:            ; preds = %vector.body82
  br label %vector.body82

middle.block83:                                   ; preds = %vector.body82
  %cmp.n95 = icmp eq i64 %n.mod.vf87, 0
  br i1 %cmp.n95, label %middle.block83..preheader.lr.ph.us_crit_edge, label %middle.block83..lr.ph.us.new.preheader108_crit_edge

middle.block83..lr.ph.us.new.preheader108_crit_edge: ; preds = %middle.block83
  br label %.lr.ph.us.new.preheader108

middle.block83..preheader.lr.ph.us_crit_edge:     ; preds = %middle.block83
  br label %.preheader.lr.ph.us

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us22.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %.prol.loopexit57.._crit_edge.us24_crit_edge, %._crit_edge.us24.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, %17
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %._crit_edge.us24..preheader.us22_crit_edge

._crit_edge.us24..preheader.us22_crit_edge:       ; preds = %._crit_edge.us24
  br label %.preheader.us22

.preheader.lr.ph.us.loopexit:                     ; preds = %.lr.ph.us.new
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %middle.block83..preheader.lr.ph.us_crit_edge, %.prol.loopexit..preheader.lr.ph.us_crit_edge, %.preheader.lr.ph.us.loopexit
  %101 = icmp slt i64 %indvars.iv46, 0
  br i1 %101, label %.preheader.lr.ph.us.._crit_edge9.us_crit_edge, label %.preheader.us22.preheader

.preheader.lr.ph.us.._crit_edge9.us_crit_edge:    ; preds = %.preheader.lr.ph.us
  br label %._crit_edge9.us

.preheader.us22.preheader:                        ; preds = %.preheader.lr.ph.us
  %102 = and i32 %33, 1
  %wide.trip.count39.1 = zext i32 %indvars.iv37 to i64
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv46, i64 0
  %104 = icmp eq i32 %102, 0
  %105 = icmp eq i32 %33, 1
  br label %.preheader.us22

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us24
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.preheader.lr.ph.us.._crit_edge9.us_crit_edge, %.preheader5.us.._crit_edge9.us_crit_edge, %._crit_edge9.us.loopexit
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %106 = icmp slt i64 %indvars.iv.next47, %26
  br i1 %106, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvars.iv.next69 = add i2 %indvars.iv68, 1
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  br label %.preheader5.us

.preheader5:                                      ; preds = %.preheader5.preheader, %.preheader4..preheader5_crit_edge
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %.preheader4..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv72 = phi i2 [ %indvars.iv.next73, %.preheader4..preheader5_crit_edge ], [ %27, %.preheader5.preheader ]
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.preheader4..preheader5_crit_edge ], [ %25, %.preheader5.preheader ]
  %indvars.iv50 = phi i32 [ %indvars.iv.next51, %.preheader4..preheader5_crit_edge ], [ %24, %.preheader5.preheader ]
  %107 = add i64 %28, %indvars.iv74
  %108 = and i64 %107, 4294967295
  %109 = zext i2 %indvars.iv72 to i64
  %110 = trunc i64 %indvars.iv74 to i32
  %111 = add i32 %24, %110
  %112 = zext i32 %111 to i64
  %113 = add nsw i64 %112, -1
  %114 = icmp slt i64 %indvars.iv54, 0
  br i1 %114, label %.preheader5..preheader4_crit_edge, label %.lr.ph

.preheader5..preheader4_crit_edge:                ; preds = %.preheader5
  br label %.preheader4

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter64 = and i64 %112, 3
  %lcmp.mod65 = icmp eq i64 %xtraiter64, 0
  br i1 %lcmp.mod65, label %.lr.ph..prol.loopexit61_crit_edge, label %.prol.preheader60.preheader

.lr.ph..prol.loopexit61_crit_edge:                ; preds = %.lr.ph
  br label %.prol.loopexit61

.prol.preheader60.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader60

.prol.preheader60:                                ; preds = %.prol.preheader60..prol.preheader60_crit_edge, %.prol.preheader60.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.prol.preheader60..prol.preheader60_crit_edge ], [ 0, %.prol.preheader60.preheader ]
  %prol.iter66 = phi i64 [ %prol.iter66.sub, %.prol.preheader60..prol.preheader60_crit_edge ], [ %xtraiter64, %.prol.preheader60.preheader ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv54, i64 %indvars.iv48.prol
  %116 = load double, double* %115, align 8
  %117 = fmul double %23, %116
  store double %117, double* %115, align 8
  %prol.iter66.sub = add nsw i64 %prol.iter66, -1
  %prol.iter66.cmp = icmp eq i64 %prol.iter66.sub, 0
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  br i1 %prol.iter66.cmp, label %.prol.loopexit61.loopexit, label %.prol.preheader60..prol.preheader60_crit_edge, !llvm.loop !8

.prol.preheader60..prol.preheader60_crit_edge:    ; preds = %.prol.preheader60
  br label %.prol.preheader60

.prol.loopexit61.loopexit:                        ; preds = %.prol.preheader60
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph..prol.loopexit61_crit_edge, %.prol.loopexit61.loopexit
  %indvars.iv48.unr = phi i64 [ 0, %.lr.ph..prol.loopexit61_crit_edge ], [ %109, %.prol.loopexit61.loopexit ]
  %118 = icmp ult i64 %113, 3
  br i1 %118, label %.prol.loopexit61..preheader4_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit61..preheader4_crit_edge:           ; preds = %.prol.loopexit61
  br label %.preheader4

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit61
  %wide.trip.count52.3 = zext i32 %indvars.iv50 to i64
  %119 = add nsw i64 %108, -4
  %120 = sub nsw i64 %119, %indvars.iv48.unr
  %121 = lshr i64 %120, 2
  %122 = add nuw nsw i64 %121, 1
  %min.iters.check = icmp ult i64 %122, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader..lr.ph.new.preheader109_crit_edge, label %min.iters.checked

.lr.ph.new.preheader..lr.ph.new.preheader109_crit_edge: ; preds = %.lr.ph.new.preheader
  br label %.lr.ph.new.preheader109

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %122, 1
  %n.vec = sub nsw i64 %122, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %123 = or i64 %indvars.iv48.unr, 4
  %124 = shl nuw i64 %121, 2
  %125 = add i64 %123, %124
  %126 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %125, %126
  br i1 %cmp.zero, label %min.iters.checked..lr.ph.new.preheader109_crit_edge, label %vector.ph

min.iters.checked..lr.ph.new.preheader109_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph.new.preheader109

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %127 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv48.unr, %127
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv54, i64 %offset.idx
  %129 = bitcast double* %128 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %129, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec77 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec78 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec79 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %130 = fmul <2 x double> %broadcast.splat81, %strided.vec
  %131 = fmul <2 x double> %broadcast.splat81, %strided.vec77
  %132 = fmul <2 x double> %broadcast.splat81, %strided.vec78
  %133 = add nsw i64 %offset.idx, 3
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv54, i64 %133
  %135 = fmul <2 x double> %broadcast.splat81, %strided.vec79
  %136 = getelementptr double, double* %134, i64 -3
  %137 = bitcast double* %136 to <8 x double>*
  %138 = shufflevector <2 x double> %130, <2 x double> %131, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %139 = shufflevector <2 x double> %132, <2 x double> %135, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %138, <4 x double> %139, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %137, align 8
  %index.next = add i64 %index, 2
  %140 = icmp eq i64 %index.next, %n.vec
  br i1 %140, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader4_crit_edge, label %middle.block..lr.ph.new.preheader109_crit_edge

middle.block..lr.ph.new.preheader109_crit_edge:   ; preds = %middle.block
  br label %.lr.ph.new.preheader109

middle.block..preheader4_crit_edge:               ; preds = %middle.block
  br label %.preheader4

.lr.ph.new.preheader109:                          ; preds = %middle.block..lr.ph.new.preheader109_crit_edge, %min.iters.checked..lr.ph.new.preheader109_crit_edge, %.lr.ph.new.preheader..lr.ph.new.preheader109_crit_edge
  %indvars.iv48.ph = phi i64 [ %indvars.iv48.unr, %min.iters.checked..lr.ph.new.preheader109_crit_edge ], [ %indvars.iv48.unr, %.lr.ph.new.preheader..lr.ph.new.preheader109_crit_edge ], [ %ind.end, %middle.block..lr.ph.new.preheader109_crit_edge ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader109
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv48.ph, %.lr.ph.new.preheader109 ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv54, i64 %indvars.iv48
  %142 = load double, double* %141, align 8
  %143 = fmul double %23, %142
  store double %143, double* %141, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv54, i64 %indvars.iv.next49
  %145 = load double, double* %144, align 8
  %146 = fmul double %23, %145
  store double %146, double* %144, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv54, i64 %indvars.iv.next49.1
  %148 = load double, double* %147, align 8
  %149 = fmul double %23, %148
  store double %149, double* %147, align 8
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv48, 3
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %indvars.iv54, i64 %indvars.iv.next49.2
  %151 = load double, double* %150, align 8
  %152 = fmul double %23, %151
  store double %152, double* %150, align 8
  %indvars.iv.next49.3 = add nuw nsw i64 %indvars.iv48, 4
  %exitcond53.3 = icmp eq i64 %indvars.iv.next49.3, %wide.trip.count52.3
  br i1 %exitcond53.3, label %.preheader4.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge, !llvm.loop !10

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.preheader4.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader4

.preheader4:                                      ; preds = %middle.block..preheader4_crit_edge, %.prol.loopexit61..preheader4_crit_edge, %.preheader5..preheader4_crit_edge, %.preheader4.loopexit
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, 1
  %153 = icmp slt i64 %indvars.iv.next55, %26
  br i1 %153, label %.preheader4..preheader5_crit_edge, label %._crit_edge14.loopexit110

.preheader4..preheader5_crit_edge:                ; preds = %.preheader4
  %indvars.iv.next73 = add i2 %indvars.iv72, 1
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %indvars.iv.next51 = add i32 %indvars.iv50, 1
  br label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit110:                        ; preds = %.preheader4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit110, %._crit_edge14.loopexit
  %.lcssa16.in = phi i64 [ %indvars.iv.next47, %._crit_edge14.loopexit ], [ %indvars.iv.next55, %._crit_edge14.loopexit110 ]
  %.lcssa16 = trunc i64 %.lcssa16.in to i32
  store i32 %.lcssa16, i32* %13, align 4
  br label %154

; <label>:154:                                    ; preds = %._crit_edge, %._crit_edge14
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

._crit_edge:                                      ; preds = %2
  br label %36

.preheader.lr.ph:                                 ; preds = %2
  %12 = load i32, i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = sext i32 %12 to i64
  %15 = icmp sgt i32 %12, 0
  %16 = load [1200 x double]*, [1200 x double]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge3.loopexit7

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %17 = sext i32 %.promoted to i64
  %18 = zext i32 %12 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ %17, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us..preheader.us_crit_edge ]
  %19 = mul nsw i64 %14, %indvars.iv9
  br label %20

; <label>:20:                                     ; preds = %._crit_edge16, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge16 ]
  %21 = add nsw i64 %19, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %._crit_edge15

._crit_edge15:                                    ; preds = %20
  br label %27

; <label>:25:                                     ; preds = %20
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %27

; <label>:27:                                     ; preds = %._crit_edge15, %25
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv9, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, %18
  br i1 %exitcond11, label %._crit_edge.us, label %._crit_edge16

._crit_edge16:                                    ; preds = %27
  br label %20

._crit_edge.us:                                   ; preds = %27
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %32 = icmp slt i64 %indvars.iv.next10, %13
  br i1 %32, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge3.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %33 = trunc i64 %indvars.iv.next10 to i32
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %.preheader.lr.ph
  %34 = add i32 %.promoted, 1
  %35 = icmp sgt i32 %12, %34
  %smax = select i1 %35, i32 %12, i32 %34
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %33, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit7 ]
  store i32 %.lcssa6, i32* %5, align 4
  br label %36

; <label>:36:                                     ; preds = %._crit_edge, %._crit_edge3
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %39) #5
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
