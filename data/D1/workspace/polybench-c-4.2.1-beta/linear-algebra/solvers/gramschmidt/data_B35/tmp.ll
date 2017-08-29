; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1000 x [1200 x double]]*, align 8
  %8 = alloca [1200 x [1200 x double]]*, align 8
  %9 = alloca [1000 x [1200 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1000, i32* %5, align 4
  store i32 1200, i32* %6, align 4
  %10 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %11 = bitcast [1000 x [1200 x double]]** %7 to i8**
  store i8* %10, i8** %11, align 8
  %12 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %13 = bitcast [1200 x [1200 x double]]** %8 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %15 = bitcast [1000 x [1200 x double]]** %9 to i8**
  store i8* %14, i8** %15, align 8
  %16 = load i32, i32* %5, align 4
  %17 = load i32, i32* %6, align 4
  %18 = bitcast [1000 x [1200 x double]]** %7 to [1200 x double]**
  %19 = load [1200 x double]*, [1200 x double]** %18, align 8
  %20 = bitcast [1200 x [1200 x double]]** %8 to [1200 x double]**
  %21 = load [1200 x double]*, [1200 x double]** %20, align 8
  %22 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %23 = load [1200 x double]*, [1200 x double]** %22, align 8
  tail call fastcc void @init_array(i32 %16, i32 %17, [1200 x double]* %19, [1200 x double]* %21, [1200 x double]* %23)
  tail call void (...) @polybench_timer_start() #4
  %24 = load i32, i32* %5, align 4
  %25 = load i32, i32* %6, align 4
  %26 = bitcast [1000 x [1200 x double]]** %7 to [1200 x double]**
  %27 = load [1200 x double]*, [1200 x double]** %26, align 8
  %28 = bitcast [1200 x [1200 x double]]** %8 to [1200 x double]**
  %29 = load [1200 x double]*, [1200 x double]** %28, align 8
  %30 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %31 = load [1200 x double]*, [1200 x double]** %30, align 8
  tail call fastcc void @kernel_gramschmidt(i32 %24, i32 %25, [1200 x double]* %27, [1200 x double]* %29, [1200 x double]* %31)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %32 = load i32, i32* %3, align 4
  %33 = icmp sgt i32 %32, 42
  br i1 %33, label %34, label %45

; <label>:34:                                     ; preds = %2
  %35 = load i8**, i8*** %4, align 8
  %36 = load i8*, i8** %35, align 8
  %strcmpload = load i8, i8* %36, align 1
  %37 = icmp eq i8 %strcmpload, 0
  br i1 %37, label %38, label %45

; <label>:38:                                     ; preds = %34
  %39 = load i32, i32* %5, align 4
  %40 = load i32, i32* %6, align 4
  %41 = bitcast [1200 x [1200 x double]]** %8 to [1200 x double]**
  %42 = load [1200 x double]*, [1200 x double]** %41, align 8
  %43 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %44 = load [1200 x double]*, [1200 x double]** %43, align 8
  tail call fastcc void @print_array(i32 %39, i32 %40, [1200 x double]* %42, [1200 x double]* %44)
  br label %45

; <label>:45:                                     ; preds = %34, %38, %2
  %46 = bitcast [1000 x [1200 x double]]** %7 to i8**
  %47 = load i8*, i8** %46, align 8
  tail call void @free(i8* %47) #4
  %48 = bitcast [1200 x [1200 x double]]** %8 to i8**
  %49 = load i8*, i8** %48, align 8
  tail call void @free(i8* %49) #4
  %50 = bitcast [1000 x [1200 x double]]** %9 to i8**
  %51 = load i8*, i8** %50, align 8
  tail call void @free(i8* %51) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store [1200 x double]* %2, [1200 x double]** %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store i32 0, i32* %11, align 4
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph8, label %38

.lr.ph8:                                          ; preds = %5
  %13 = load i32, i32* %7, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = load i32, i32* %6, align 4
  %16 = sext i32 %15 to i64
  %17 = sitofp i32 %15 to double
  %18 = load [1200 x double]*, [1200 x double]** %8, align 8
  %19 = load [1200 x double]*, [1200 x double]** %10, align 8
  %.promoted = load i32, i32* %11, align 4
  %20 = sext i32 %.promoted to i64
  br i1 %14, label %.lr.ph8.split.us.preheader, label %._crit_edge9.loopexit21

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %21 = load i32, i32* %7, align 4
  %22 = sext i32 %21 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %.lr.ph8.split.us.preheader, %._crit_edge6.us
  %indvars.iv = phi i64 [ %20, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next, %._crit_edge6.us ]
  br label %23

; <label>:23:                                     ; preds = %23, %.lr.ph8.split.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %23 ], [ 0, %.lr.ph8.split.us ]
  %24 = mul nsw i64 %indvars.iv27, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %15
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %17
  %29 = fmul double %28, 1.000000e+02
  %30 = fadd double %29, 1.000000e+01
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv, i64 %indvars.iv27
  store double %30, double* %31, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv, i64 %indvars.iv27
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %33 = icmp slt i64 %indvars.iv.next28, %22
  br i1 %33, label %23, label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %23
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %34 = icmp slt i64 %indvars.iv.next, %16
  br i1 %34, label %.lr.ph8.split.us, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  %35 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge9

._crit_edge9.loopexit21:                          ; preds = %.lr.ph8
  %36 = add i32 %.promoted, 1
  %37 = icmp sgt i32 %15, %36
  %smax31 = select i1 %37, i32 %15, i32 %36
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit21, %._crit_edge9.loopexit
  %.lcssa19 = phi i32 [ %35, %._crit_edge9.loopexit ], [ %smax31, %._crit_edge9.loopexit21 ]
  store i32 %.lcssa19, i32* %11, align 4
  br label %38

; <label>:38:                                     ; preds = %._crit_edge9, %5
  store i32 0, i32* %11, align 4
  %39 = load i32, i32* %7, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %.lr.ph2, label %55

.lr.ph2:                                          ; preds = %38
  %41 = load i32, i32* %7, align 4
  %42 = sext i32 %41 to i64
  %43 = icmp sgt i32 %41, 0
  %44 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted12 = load i32, i32* %11, align 4
  %45 = sext i32 %.promoted12 to i64
  br i1 %43, label %.lr.ph2.split.us.preheader, label %._crit_edge3.loopexit20

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  %46 = load i32, i32* %7, align 4
  %47 = sext i32 %46 to i64
  %48 = icmp sgt i64 %47, 1
  %smax33 = select i1 %48, i64 %47, i64 1
  %49 = shl nsw i64 %smax33, 3
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvar.next, %._crit_edge.us ]
  %indvars.iv25 = phi i64 [ %45, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next26, %._crit_edge.us ]
  %50 = add nsw i64 %45, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %44, i64 %50, i64 0
  %scevgep32 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32, i8 0, i64 %49, i32 8, i1 false)
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 1
  %51 = icmp slt i64 %indvars.iv.next26, %42
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %51, label %._crit_edge.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %52 = trunc i64 %indvars.iv.next26 to i32
  br label %._crit_edge3

._crit_edge3.loopexit20:                          ; preds = %.lr.ph2
  %53 = add i32 %.promoted12, 1
  %54 = icmp sgt i32 %41, %53
  %smax = select i1 %54, i32 %41, i32 %53
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit20, %._crit_edge3.loopexit
  %.lcssa13 = phi i32 [ %52, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit20 ]
  store i32 %.lcssa13, i32* %11, align 4
  br label %55

; <label>:55:                                     ; preds = %._crit_edge3, %38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store [1200 x double]* %2, [1200 x double]** %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store i32 0, i32* %11, align 4
  %12 = icmp sgt i32 %1, 0
  br i1 %12, label %.lr.ph14, label %139

.lr.ph14:                                         ; preds = %5
  %13 = load i32, i32* %6, align 4
  %14 = load [1200 x double]*, [1200 x double]** %8, align 8
  %15 = load [1200 x double]*, [1200 x double]** %9, align 8
  %16 = load [1200 x double]*, [1200 x double]** %10, align 8
  %17 = load i32, i32* %7, align 4
  %.promoted = load i32, i32* %11, align 4
  %18 = sext i32 %13 to i64
  %19 = add i32 %.promoted, 1
  %20 = sext i32 %19 to i64
  %21 = sext i32 %13 to i64
  %22 = sext i32 %17 to i64
  %23 = sext i32 %.promoted to i64
  %24 = sext i32 %17 to i64
  %25 = sext i32 %17 to i64
  %26 = add nsw i64 %18, -1
  %27 = add nsw i64 %20, 1
  %28 = add nsw i64 %21, -1
  %xtraiter = and i64 %18, 3
  %xtraiter92 = and i64 %18, 1
  %xtraiter106 = and i64 %21, 1
  %xtraiter112 = and i64 %21, 1
  br label %29

; <label>:29:                                     ; preds = %.lr.ph14, %._crit_edge12
  %indvar = phi i64 [ 0, %.lr.ph14 ], [ %indvar.next, %._crit_edge12 ]
  %indvars.iv88 = phi i64 [ %23, %.lr.ph14 ], [ %indvars.iv.next89, %._crit_edge12 ]
  %indvars.iv78 = phi i64 [ %20, %.lr.ph14 ], [ %indvars.iv.next79, %._crit_edge12 ]
  %30 = icmp sgt i32 %13, 0
  %31 = mul nuw nsw i64 %indvar, 1201
  %32 = add nsw i64 %20, %31
  %scevgep = getelementptr [1200 x double], [1200 x double]* %15, i64 %23, i64 %32
  %33 = add nsw i64 %27, %indvar
  %34 = icmp sgt i64 %33, %24
  %smax = select i1 %34, i64 %33, i64 %24
  %sum = add nsw i64 %20, %indvar
  %35 = sub i64 %smax, %sum
  %36 = shl i64 %35, 3
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %29
  %37 = icmp eq i64 %xtraiter, 0
  br i1 %37, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %38 = phi double [ %42, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.prol, i64 %indvars.iv88
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fadd double %38, %41
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %42, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %42, %.prol.loopexit.loopexit ]
  %43 = icmp ult i64 %26, 3
  br i1 %43, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %44 = phi double [ %60, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv, i64 %indvars.iv88
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fadd double %44, %47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next, i64 %indvars.iv88
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %50
  %52 = fadd double %48, %51
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next.1, i64 %indvars.iv88
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %54
  %56 = fadd double %52, %55
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next.2, i64 %indvars.iv88
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %58
  %60 = fadd double %56, %59
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %18
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %29
  %.lcssa1740 = phi double [ 0.000000e+00, %29 ], [ %.lcssa.unr, %.prol.loopexit ], [ %60, %._crit_edge.loopexit ]
  %61 = icmp sgt i32 %13, 0
  %62 = tail call double @sqrt(double %.lcssa1740) #4
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv88
  store double %62, double* %63, align 8
  br i1 %61, label %.lr.ph2, label %._crit_edge3

.lr.ph2:                                          ; preds = %._crit_edge
  %64 = icmp eq i64 %xtraiter92, 0
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv88
  br i1 %64, label %.prol.loopexit91, label %.prol.preheader90

.prol.preheader90:                                ; preds = %.lr.ph2
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv88
  %67 = load double, double* %66, align 8
  %68 = load double, double* %65, align 8
  %69 = fdiv double %67, %68
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 0, i64 %indvars.iv88
  store double %69, double* %70, align 8
  br label %.prol.loopexit91

.prol.loopexit91:                                 ; preds = %.prol.preheader90, %.lr.ph2
  %indvars.iv50.unr.ph = phi i64 [ 1, %.prol.preheader90 ], [ 0, %.lr.ph2 ]
  %71 = icmp eq i64 %26, 0
  br i1 %71, label %._crit_edge3, label %.lr.ph2.new.preheader

.lr.ph2.new.preheader:                            ; preds = %.prol.loopexit91
  br label %.lr.ph2.new

.lr.ph2.new:                                      ; preds = %.lr.ph2.new.preheader, %.lr.ph2.new
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph2.new ], [ %indvars.iv50.unr.ph, %.lr.ph2.new.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv50, i64 %indvars.iv88
  %73 = load double, double* %72, align 8
  %74 = load double, double* %65, align 8
  %75 = fdiv double %73, %74
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv50, i64 %indvars.iv88
  store double %75, double* %76, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next51, i64 %indvars.iv88
  %78 = load double, double* %77, align 8
  %79 = load double, double* %65, align 8
  %80 = fdiv double %78, %79
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next51, i64 %indvars.iv88
  store double %80, double* %81, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next51.1, %18
  br i1 %exitcond.1, label %._crit_edge3.loopexit, label %.lr.ph2.new

._crit_edge3.loopexit:                            ; preds = %.lr.ph2.new
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.prol.loopexit91, %._crit_edge
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %82 = icmp slt i64 %indvars.iv.next89, %25
  br i1 %82, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %._crit_edge3
  %83 = icmp sgt i32 %13, 0
  br i1 %83, label %.lr.ph11.split.us.preheader, label %._crit_edge12.loopexit44

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %._crit_edge9.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge9.us ], [ %indvars.iv78, %.lr.ph11.split.us.preheader ]
  %84 = icmp eq i64 %xtraiter106, 0
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv80
  store double 0.000000e+00, double* %85, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv80
  br i1 %84, label %.prol.loopexit105, label %.prol.preheader104

.prol.preheader104:                               ; preds = %.lr.ph11.split.us
  %sunkaddr = ptrtoint [1200 x double]* %16 to i64
  %sunkaddr133 = mul i64 %indvars.iv88, 8
  %sunkaddr134 = add i64 %sunkaddr, %sunkaddr133
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to double*
  %87 = load double, double* %sunkaddr135, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv80
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = load double, double* %86, align 8
  %92 = fadd double %90, %91
  store double %92, double* %86, align 8
  br label %.prol.loopexit105

.prol.loopexit105:                                ; preds = %.prol.preheader104, %.lr.ph11.split.us
  %indvars.iv74.unr.ph = phi i64 [ 1, %.prol.preheader104 ], [ 0, %.lr.ph11.split.us ]
  %93 = icmp eq i64 %28, 0
  br i1 %93, label %._crit_edge6.us, label %.lr.ph11.split.us.new.preheader

.lr.ph11.split.us.new.preheader:                  ; preds = %.prol.loopexit105
  br label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.lr.ph11.split.us.new.preheader, %.lr.ph11.split.us.new
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph11.split.us.new ], [ %indvars.iv74.unr.ph, %.lr.ph11.split.us.new.preheader ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv74, i64 %indvars.iv88
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv74, i64 %indvars.iv80
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = load double, double* %86, align 8
  %100 = fadd double %98, %99
  store double %100, double* %86, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next75, i64 %indvars.iv88
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next75, i64 %indvars.iv80
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = load double, double* %86, align 8
  %107 = fadd double %105, %106
  store double %107, double* %86, align 8
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv74, 2
  %exitcond.1109 = icmp eq i64 %indvars.iv.next75.1, %21
  br i1 %exitcond.1109, label %._crit_edge6.us.loopexit, label %.lr.ph11.split.us.new

._crit_edge6.us.loopexit:                         ; preds = %.lr.ph11.split.us.new
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.prol.loopexit105
  %108 = icmp sgt i32 %13, 0
  br i1 %108, label %.lr.ph8.us, label %._crit_edge9.us

.lr.ph8.us:                                       ; preds = %._crit_edge6.us
  %109 = icmp eq i64 %xtraiter112, 0
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv80
  br i1 %109, label %.prol.loopexit111, label %.prol.preheader110

.prol.preheader110:                               ; preds = %.lr.ph8.us
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv80
  %112 = load double, double* %111, align 8
  %sunkaddr136 = ptrtoint [1200 x double]* %16 to i64
  %sunkaddr137 = mul i64 %indvars.iv88, 8
  %sunkaddr138 = add i64 %sunkaddr136, %sunkaddr137
  %sunkaddr139 = inttoptr i64 %sunkaddr138 to double*
  %113 = load double, double* %sunkaddr139, align 8
  %114 = load double, double* %110, align 8
  %115 = fmul double %113, %114
  %116 = fsub double %112, %115
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv80
  store double %116, double* %117, align 8
  br label %.prol.loopexit111

.prol.loopexit111:                                ; preds = %.prol.preheader110, %.lr.ph8.us
  %indvars.iv76.unr.ph = phi i64 [ 1, %.prol.preheader110 ], [ 0, %.lr.ph8.us ]
  %118 = icmp eq i64 %28, 0
  br i1 %118, label %._crit_edge9.us, label %.lr.ph8.us.new.preheader

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit111
  br label %.lr.ph8.us.new

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new.preheader, %.lr.ph8.us.new
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.1, %.lr.ph8.us.new ], [ %indvars.iv76.unr.ph, %.lr.ph8.us.new.preheader ]
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv76, i64 %indvars.iv80
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv76, i64 %indvars.iv88
  %122 = load double, double* %121, align 8
  %123 = load double, double* %110, align 8
  %124 = fmul double %122, %123
  %125 = fsub double %120, %124
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv76, i64 %indvars.iv80
  store double %125, double* %126, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next77, i64 %indvars.iv80
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next77, i64 %indvars.iv88
  %130 = load double, double* %129, align 8
  %131 = load double, double* %110, align 8
  %132 = fmul double %130, %131
  %133 = fsub double %128, %132
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next77, i64 %indvars.iv80
  store double %133, double* %134, align 8
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv76, 2
  %exitcond.1115 = icmp eq i64 %indvars.iv.next77.1, %21
  br i1 %exitcond.1115, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit111, %._crit_edge6.us
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, 1
  %135 = icmp slt i64 %indvars.iv.next81, %22
  br i1 %135, label %.lr.ph11.split.us, label %._crit_edge12.loopexit

._crit_edge12.loopexit44:                         ; preds = %.lr.ph11
  %136 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %136, i8 0, i64 %36, i32 8, i1 false)
  br label %._crit_edge12

._crit_edge12.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge12.loopexit44, %._crit_edge3
  %137 = icmp slt i64 %indvars.iv.next89, %24
  %indvars.iv.next79 = add nsw i64 %indvars.iv78, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %137, label %29, label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge12
  %138 = trunc i64 %indvars.iv.next89 to i32
  store i32 %138, i32* %11, align 4
  br label %139

; <label>:139:                                    ; preds = %._crit_edge15, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store [1200 x double]* %3, [1200 x double]** %8, align 8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  store i32 0, i32* %9, align 4
  %14 = load i32, i32* %6, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph10, label %42

.lr.ph10:                                         ; preds = %4
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = icmp sgt i32 %16, 0
  %19 = load [1200 x double]*, [1200 x double]** %7, align 8
  %.promoted25 = load i32, i32* %9, align 4
  %20 = sext i32 %.promoted25 to i64
  br i1 %18, label %.lr.ph10.split.us.preheader, label %._crit_edge11.loopexit28

.lr.ph10.split.us.preheader:                      ; preds = %.lr.ph10
  %21 = load i32, i32* %6, align 4
  %22 = sext i32 %21 to i64
  %23 = sext i32 %16 to i64
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %.lr.ph10.split.us.preheader, %._crit_edge7.us
  %indvars.iv41 = phi i64 [ %20, %.lr.ph10.split.us.preheader ], [ %indvars.iv.next42, %._crit_edge7.us ]
  %24 = mul nsw i64 %17, %indvars.iv41
  br label %25

; <label>:25:                                     ; preds = %32, %.lr.ph10.split.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %32 ], [ 0, %.lr.ph10.split.us ]
  %26 = add i64 %24, %indvars.iv32
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %25
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc14.us = call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %32

; <label>:32:                                     ; preds = %30, %25
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv41, i64 %indvars.iv32
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #7
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %37 = icmp slt i64 %indvars.iv.next33, %22
  br i1 %37, label %25, label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %32
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, 1
  %38 = icmp slt i64 %indvars.iv.next42, %23
  br i1 %38, label %.lr.ph10.split.us, label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge7.us
  %39 = trunc i64 %indvars.iv.next42 to i32
  br label %._crit_edge11

._crit_edge11.loopexit28:                         ; preds = %.lr.ph10
  %40 = add i32 %.promoted25, 1
  %41 = icmp sgt i32 %16, %40
  %smax36 = select i1 %41, i32 %16, i32 %40
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit28, %._crit_edge11.loopexit
  %.lcssa26 = phi i32 [ %39, %._crit_edge11.loopexit ], [ %smax36, %._crit_edge11.loopexit28 ]
  store i32 %.lcssa26, i32* %9, align 4
  br label %42

; <label>:42:                                     ; preds = %._crit_edge11, %4
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  store i32 0, i32* %9, align 4
  %47 = load i32, i32* %5, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %.lr.ph3, label %76

.lr.ph3:                                          ; preds = %42
  %49 = load i32, i32* %6, align 4
  %50 = sext i32 %49 to i64
  %51 = icmp sgt i32 %49, 0
  %52 = load [1200 x double]*, [1200 x double]** %8, align 8
  %53 = load i32, i32* %5, align 4
  %54 = sext i32 %53 to i64
  %.promoted = load i32, i32* %9, align 4
  %55 = sext i32 %.promoted to i64
  br i1 %51, label %.lr.ph3.split.us.preheader, label %._crit_edge4.loopexit27

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %56 = load i32, i32* %6, align 4
  %57 = sext i32 %56 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv38 = phi i64 [ %55, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us ]
  %58 = mul nsw i64 %50, %indvars.iv38
  br label %59

; <label>:59:                                     ; preds = %66, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %66 ], [ 0, %.lr.ph3.split.us ]
  %60 = add i64 %58, %indvars.iv
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 20
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %59
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %65) #6
  br label %66

; <label>:66:                                     ; preds = %64, %59
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %indvars.iv38, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %69) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %71 = icmp slt i64 %indvars.iv.next, %57
  br i1 %71, label %59, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %66
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  %72 = icmp slt i64 %indvars.iv.next39, %54
  br i1 %72, label %.lr.ph3.split.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %73 = trunc i64 %indvars.iv.next39 to i32
  br label %._crit_edge4

._crit_edge4.loopexit27:                          ; preds = %.lr.ph3
  %74 = add i32 %.promoted, 1
  %75 = icmp sgt i32 %53, %74
  %smax = select i1 %75, i32 %53, i32 %74
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit27, %._crit_edge4.loopexit
  %.lcssa20 = phi i32 [ %73, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit27 ]
  store i32 %.lcssa20, i32* %9, align 4
  br label %76

; <label>:76:                                     ; preds = %._crit_edge4, %42
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %78 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %80 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %79) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
