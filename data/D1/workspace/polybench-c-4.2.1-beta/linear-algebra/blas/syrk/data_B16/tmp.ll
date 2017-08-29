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
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat76 = shufflevector <2 x double> %broadcast.splatinsert75, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %27 = zext i32 %16 to i64
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv67 = phi i2 [ %26, %.preheader5.us.preheader ], [ %indvars.iv.next68, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv49 = phi i64 [ %24, %.preheader5.us.preheader ], [ %indvars.iv.next50, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv37 = phi i32 [ %23, %.preheader5.us.preheader ], [ %indvars.iv.next38, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.us.preheader ], [ %indvar.next, %._crit_edge9.us..preheader5.us_crit_edge ]
  %28 = add i32 %23, %indvar
  %29 = zext i32 %28 to i64
  %30 = zext i2 %indvars.iv67 to i64
  %31 = add nuw nsw i64 %30, 4294967295
  %32 = and i64 %31, 4294967295
  %33 = add nuw nsw i64 %32, 1
  %34 = add i32 %23, %indvar
  %35 = add i32 %.promoted15, %indvar
  %36 = icmp slt i64 %indvars.iv49, 0
  br i1 %36, label %._crit_edge9.us, label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader103, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader103 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %22, %38
  store double %39, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fmul double %22, %41
  store double %42, double* %40, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %44 = load double, double* %43, align 8
  %45 = fmul double %22, %44
  store double %45, double* %43, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next.2
  %47 = load double, double* %46, align 8
  %48 = fmul double %22, %47
  store double %48, double* %46, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader.lr.ph.us.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us22.new:                              ; preds = %.preheader.us22.new.preheader, %.preheader.us22.new
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.preheader.us22.new ], [ %indvars.iv35.unr.ph, %.preheader.us22.new.preheader ]
  %49 = load double, double* %65, align 8
  %50 = fmul double %18, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv35, i64 %indvars.iv45
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv35
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  store double %56, double* %54, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %57 = load double, double* %65, align 8
  %58 = fmul double %18, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv.next36, i64 %indvars.iv45
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.next36
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  store double %64, double* %62, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count39.1
  br i1 %exitcond.1, label %._crit_edge.us24.loopexit, label %.preheader.us22.new

.preheader.us22:                                  ; preds = %._crit_edge.us24, %.preheader.us22.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us24 ], [ 0, %.preheader.us22.preheader ]
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %lcmp.mod43, label %.prol.loopexit41, label %.prol.preheader40

.prol.preheader40:                                ; preds = %.preheader.us22
  %66 = load double, double* %65, align 8
  %67 = fmul double %18, %66
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv45
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = load double, double* %104, align 8
  %72 = fadd double %70, %71
  store double %72, double* %104, align 8
  br label %.prol.loopexit41

.prol.loopexit41:                                 ; preds = %.preheader.us22, %.prol.preheader40
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader40 ], [ 0, %.preheader.us22 ]
  br i1 %103, label %._crit_edge.us24, label %.preheader.us22.new.preheader

.preheader.us22.new.preheader:                    ; preds = %.prol.loopexit41
  br label %.preheader.us22.new

.lr.ph.us:                                        ; preds = %.preheader5.us
  %73 = add i32 %23, %indvar
  %xtraiter = and i32 %73, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %22, %75
  store double %76, double* %74, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %33, %.prol.loopexit.loopexit ]
  %77 = icmp ult i32 %35, 3
  br i1 %77, label %.preheader.lr.ph.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv37 to i64
  %78 = add nsw i64 %29, -4
  %79 = sub nsw i64 %78, %indvars.iv.unr
  %80 = lshr i64 %79, 2
  %81 = add nuw nsw i64 %80, 1
  %min.iters.check80 = icmp ult i64 %81, 2
  br i1 %min.iters.check80, label %.lr.ph.us.new.preheader103, label %min.iters.checked81

.lr.ph.us.new.preheader103:                       ; preds = %middle.block78, %min.iters.checked81, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked81 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end89, %middle.block78 ]
  br label %.lr.ph.us.new

min.iters.checked81:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf82 = and i64 %81, 1
  %n.vec83 = sub nsw i64 %81, %n.mod.vf82
  %cmp.zero84 = icmp eq i64 %n.vec83, 0
  %82 = add nsw i64 %indvars.iv.unr, 4
  %83 = shl nuw i64 %80, 2
  %84 = add i64 %82, %83
  %85 = shl nuw nsw i64 %n.mod.vf82, 2
  %ind.end89 = sub i64 %84, %85
  br i1 %cmp.zero84, label %.lr.ph.us.new.preheader103, label %vector.ph85

vector.ph85:                                      ; preds = %min.iters.checked81
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77, %vector.ph85
  %index86 = phi i64 [ 0, %vector.ph85 ], [ %index.next87, %vector.body77 ]
  %86 = shl i64 %index86, 2
  %87 = add i64 %indvars.iv.unr, %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %87
  %89 = bitcast double* %88 to <8 x double>*
  %wide.vec95 = load <8 x double>, <8 x double>* %89, align 8
  %strided.vec96 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec97 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec98 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec99 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %90 = fmul <2 x double> %broadcast.splat101, %strided.vec96
  %91 = fmul <2 x double> %broadcast.splat101, %strided.vec97
  %92 = fmul <2 x double> %broadcast.splat101, %strided.vec98
  %93 = add nsw i64 %87, 3
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 %93
  %95 = fmul <2 x double> %broadcast.splat101, %strided.vec99
  %96 = getelementptr double, double* %94, i64 -3
  %97 = bitcast double* %96 to <8 x double>*
  %98 = shufflevector <2 x double> %90, <2 x double> %91, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %99 = shufflevector <2 x double> %92, <2 x double> %95, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec102 = shufflevector <4 x double> %98, <4 x double> %99, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec102, <8 x double>* %97, align 8
  %index.next87 = add i64 %index86, 2
  %100 = icmp eq i64 %index.next87, %n.vec83
  br i1 %100, label %middle.block78, label %vector.body77, !llvm.loop !7

middle.block78:                                   ; preds = %vector.body77
  %cmp.n90 = icmp eq i64 %n.mod.vf82, 0
  br i1 %cmp.n90, label %.preheader.lr.ph.us, label %.lr.ph.us.new.preheader103

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us22.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit41
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next46, %27
  br i1 %exitcond69, label %._crit_edge9.us.loopexit, label %.preheader.us22

.preheader.lr.ph.us.loopexit:                     ; preds = %.lr.ph.us.new
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.preheader.lr.ph.us.loopexit, %.prol.loopexit, %middle.block78
  %101 = icmp slt i64 %indvars.iv49, 0
  br i1 %101, label %._crit_edge9.us, label %.preheader.us22.preheader

.preheader.us22.preheader:                        ; preds = %.preheader.lr.ph.us
  %xtraiter42 = and i32 %34, 1
  %lcmp.mod43 = icmp eq i32 %xtraiter42, 0
  %102 = sub i32 0, %indvar
  %103 = icmp eq i32 %.promoted15, %102
  %wide.trip.count39.1 = zext i32 %indvars.iv37 to i64
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv49, i64 0
  br label %.preheader.us22

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us24
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.preheader.lr.ph.us, %.preheader5.us
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %105 = icmp slt i64 %indvars.iv.next50, %25
  br i1 %105, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvars.iv.next68 = add i2 %indvars.iv67, 1
  %indvar.next = add nuw i32 %indvar, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  br label %.preheader5.us

.preheader5:                                      ; preds = %.preheader5.preheader, %.preheader4..preheader5_crit_edge
  %indvars.iv70 = phi i2 [ %indvars.iv.next71, %.preheader4..preheader5_crit_edge ], [ %26, %.preheader5.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %.preheader4..preheader5_crit_edge ], [ %24, %.preheader5.preheader ]
  %indvar59 = phi i32 [ %indvar.next60, %.preheader4..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv53 = phi i32 [ %indvars.iv.next54, %.preheader4..preheader5_crit_edge ], [ %23, %.preheader5.preheader ]
  %106 = add i32 %23, %indvar59
  %107 = zext i32 %106 to i64
  %108 = zext i2 %indvars.iv70 to i64
  %109 = add nuw nsw i64 %108, 4294967295
  %110 = and i64 %109, 4294967295
  %111 = add nuw nsw i64 %110, 1
  %112 = add i32 %.promoted15, %indvar59
  %113 = icmp slt i64 %indvars.iv64, 0
  br i1 %113, label %.preheader4, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %114 = add i32 %23, %indvar59
  %xtraiter61 = and i32 %114, 3
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  br i1 %lcmp.mod62, label %.prol.loopexit58, label %.prol.preheader57.preheader

.prol.preheader57.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader57

.prol.preheader57:                                ; preds = %.prol.preheader57.preheader, %.prol.preheader57
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.prol.preheader57 ], [ 0, %.prol.preheader57.preheader ]
  %prol.iter63 = phi i32 [ %prol.iter63.sub, %.prol.preheader57 ], [ %xtraiter61, %.prol.preheader57.preheader ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv51.prol
  %116 = load double, double* %115, align 8
  %117 = fmul double %22, %116
  store double %117, double* %115, align 8
  %prol.iter63.sub = add nsw i32 %prol.iter63, -1
  %prol.iter63.cmp = icmp eq i32 %prol.iter63.sub, 0
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  br i1 %prol.iter63.cmp, label %.prol.loopexit58.loopexit, label %.prol.preheader57, !llvm.loop !8

.prol.loopexit58.loopexit:                        ; preds = %.prol.preheader57
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.loopexit58.loopexit, %.lr.ph
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph ], [ %111, %.prol.loopexit58.loopexit ]
  %118 = icmp ult i32 %112, 3
  br i1 %118, label %.preheader4, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit58
  %wide.trip.count55.3 = zext i32 %indvars.iv53 to i64
  %119 = add nsw i64 %107, -4
  %120 = sub nsw i64 %119, %indvars.iv51.unr
  %121 = lshr i64 %120, 2
  %122 = add nuw nsw i64 %121, 1
  %min.iters.check = icmp ult i64 %122, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader104, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %122, 1
  %n.vec = sub nsw i64 %122, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %123 = add nsw i64 %indvars.iv51.unr, 4
  %124 = shl nuw i64 %121, 2
  %125 = add i64 %123, %124
  %126 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %125, %126
  br i1 %cmp.zero, label %.lr.ph.new.preheader104, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %127 = shl i64 %index, 2
  %128 = add i64 %indvars.iv51.unr, %127
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %128
  %130 = bitcast double* %129 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %130, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec74 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %131 = fmul <2 x double> %broadcast.splat76, %strided.vec
  %132 = fmul <2 x double> %broadcast.splat76, %strided.vec72
  %133 = fmul <2 x double> %broadcast.splat76, %strided.vec73
  %134 = add nsw i64 %128, 3
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %134
  %136 = fmul <2 x double> %broadcast.splat76, %strided.vec74
  %137 = getelementptr double, double* %135, i64 -3
  %138 = bitcast double* %137 to <8 x double>*
  %139 = shufflevector <2 x double> %131, <2 x double> %132, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %140 = shufflevector <2 x double> %133, <2 x double> %136, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %139, <4 x double> %140, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %138, align 8
  %index.next = add i64 %index, 2
  %141 = icmp eq i64 %index.next, %n.vec
  br i1 %141, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader4, label %.lr.ph.new.preheader104

.lr.ph.new.preheader104:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv51.ph = phi i64 [ %indvars.iv51.unr, %min.iters.checked ], [ %indvars.iv51.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader104, %.lr.ph.new
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.3, %.lr.ph.new ], [ %indvars.iv51.ph, %.lr.ph.new.preheader104 ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv51
  %143 = load double, double* %142, align 8
  %144 = fmul double %22, %143
  store double %144, double* %142, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv.next52
  %146 = load double, double* %145, align 8
  %147 = fmul double %22, %146
  store double %147, double* %145, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv.next52.1
  %149 = load double, double* %148, align 8
  %150 = fmul double %22, %149
  store double %150, double* %148, align 8
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv64, i64 %indvars.iv.next52.2
  %152 = load double, double* %151, align 8
  %153 = fmul double %22, %152
  store double %153, double* %151, align 8
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next52.3, %wide.trip.count55.3
  br i1 %exitcond56.3, label %.preheader4.loopexit, label %.lr.ph.new, !llvm.loop !10

.preheader4.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block, %.prol.loopexit58, %.preheader5
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %154 = icmp slt i64 %indvars.iv.next65, %25
  br i1 %154, label %.preheader4..preheader5_crit_edge, label %._crit_edge14.loopexit105

.preheader4..preheader5_crit_edge:                ; preds = %.preheader4
  %indvars.iv.next71 = add i2 %indvars.iv70, 1
  %indvar.next60 = add nuw i32 %indvar59, 1
  %indvars.iv.next54 = add i32 %indvars.iv53, 1
  br label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit105:                        ; preds = %.preheader4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit105, %._crit_edge14.loopexit
  %.lcssa16.in = phi i64 [ %indvars.iv.next50, %._crit_edge14.loopexit ], [ %indvars.iv.next65, %._crit_edge14.loopexit105 ]
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
