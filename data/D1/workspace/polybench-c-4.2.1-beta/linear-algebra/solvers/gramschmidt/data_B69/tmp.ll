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
  br i1 %33, label %34, label %._crit_edge

; <label>:34:                                     ; preds = %2
  %35 = load i8**, i8*** %4, align 8
  %36 = load i8*, i8** %35, align 8
  %strcmpload = load i8, i8* %36, align 1
  %37 = icmp eq i8 %strcmpload, 0
  br i1 %37, label %38, label %._crit_edge

; <label>:38:                                     ; preds = %34
  %39 = load i32, i32* %5, align 4
  %40 = load i32, i32* %6, align 4
  %41 = bitcast [1200 x [1200 x double]]** %8 to [1200 x double]**
  %42 = load [1200 x double]*, [1200 x double]** %41, align 8
  %43 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %44 = load [1200 x double]*, [1200 x double]** %43, align 8
  tail call fastcc void @print_array(i32 %39, i32 %40, [1200 x double]* %42, [1200 x double]* %44)
  br label %._crit_edge

._crit_edge:                                      ; preds = %34, %2, %38
  %45 = bitcast [1000 x [1200 x double]]** %7 to i8**
  %46 = load i8*, i8** %45, align 8
  tail call void @free(i8* %46) #4
  %47 = bitcast [1200 x [1200 x double]]** %8 to i8**
  %48 = load i8*, i8** %47, align 8
  tail call void @free(i8* %48) #4
  %49 = bitcast [1000 x [1200 x double]]** %9 to i8**
  %50 = load i8*, i8** %49, align 8
  tail call void @free(i8* %50) #4
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
  br i1 %12, label %.lr.ph8, label %._crit_edge

.lr.ph8:                                          ; preds = %5
  %13 = load i32, i32* %7, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = load i32, i32* %6, align 4
  %16 = sext i32 %15 to i64
  %17 = sitofp i32 %15 to double
  %18 = load [1200 x double]*, [1200 x double]** %8, align 8
  %19 = load [1200 x double]*, [1200 x double]** %10, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %14, label %.lr.ph8.split.us.preheader, label %._crit_edge9.loopexit21

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %20 = sext i32 %.promoted to i64
  %21 = load i32, i32* %7, align 4
  %22 = sext i32 %21 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv = phi i64 [ %20, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next, %._crit_edge6.us ]
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42, %.lr.ph8.split.us
  %indvars.iv27 = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next28, %._crit_edge42 ]
  %23 = mul nsw i64 %indvars.iv27, %indvars.iv
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %15
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %17
  %28 = fmul double %27, 1.000000e+02
  %29 = fadd double %28, 1.000000e+01
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv, i64 %indvars.iv27
  store double %29, double* %30, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv, i64 %indvars.iv27
  store double 0.000000e+00, double* %31, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %32 = icmp slt i64 %indvars.iv.next28, %22
  br i1 %32, label %._crit_edge42, label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge42
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %33 = icmp slt i64 %indvars.iv.next, %16
  br i1 %33, label %.lr.ph8.split.us, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  %34 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge9

._crit_edge9.loopexit21:                          ; preds = %.lr.ph8
  %35 = add i32 %.promoted, 1
  %36 = icmp sgt i32 %15, %35
  %smax31 = select i1 %36, i32 %15, i32 %35
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit21, %._crit_edge9.loopexit
  %.lcssa19 = phi i32 [ %34, %._crit_edge9.loopexit ], [ %smax31, %._crit_edge9.loopexit21 ]
  store i32 %.lcssa19, i32* %11, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %._crit_edge9
  store i32 0, i32* %11, align 4
  %37 = load i32, i32* %7, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %.lr.ph2, label %._crit_edge43

.lr.ph2:                                          ; preds = %._crit_edge
  %39 = load i32, i32* %7, align 4
  %40 = sext i32 %39 to i64
  %41 = icmp sgt i32 %39, 0
  %42 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted12 = load i32, i32* %11, align 4
  %43 = sext i32 %.promoted12 to i64
  br i1 %41, label %.lr.ph2.split.us.preheader, label %._crit_edge3.loopexit20

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  %44 = load i32, i32* %7, align 4
  %45 = sext i32 %44 to i64
  %46 = icmp sgt i64 %45, 1
  %smax33 = select i1 %46, i64 %45, i64 1
  %47 = shl nsw i64 %smax33, 3
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.._crit_edge.us_crit_edge, %.lr.ph2.split.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvar.next, %._crit_edge.us.._crit_edge.us_crit_edge ]
  %indvars.iv25 = phi i64 [ %43, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next26, %._crit_edge.us.._crit_edge.us_crit_edge ]
  %48 = add nsw i64 %43, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %42, i64 %48, i64 0
  %scevgep32 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 1
  %49 = icmp slt i64 %indvars.iv.next26, %40
  br i1 %49, label %._crit_edge.us.._crit_edge.us_crit_edge, label %._crit_edge3.loopexit

._crit_edge.us.._crit_edge.us_crit_edge:          ; preds = %._crit_edge.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %._crit_edge.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %50 = trunc i64 %indvars.iv.next26 to i32
  br label %._crit_edge3

._crit_edge3.loopexit20:                          ; preds = %.lr.ph2
  %51 = add i32 %.promoted12, 1
  %52 = icmp sgt i32 %39, %51
  %smax = select i1 %52, i32 %39, i32 %51
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit20, %._crit_edge3.loopexit
  %.lcssa13 = phi i32 [ %50, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit20 ]
  store i32 %.lcssa13, i32* %11, align 4
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge, %._crit_edge3
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
  br i1 %12, label %.lr.ph14, label %._crit_edge122

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
  %29 = icmp sgt i32 %13, 0
  %xtraiter = and i64 %18, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %30 = icmp ult i64 %26, 3
  %31 = icmp sgt i32 %13, 0
  %xtraiter92 = and i64 %18, 1
  %lcmp.mod93 = icmp eq i64 %xtraiter92, 0
  %32 = icmp eq i64 %26, 0
  %33 = icmp sgt i32 %13, 0
  %xtraiter106 = and i64 %21, 1
  %lcmp.mod107 = icmp eq i64 %xtraiter106, 0
  %34 = icmp eq i64 %28, 0
  %35 = icmp sgt i32 %13, 0
  %xtraiter112 = and i64 %21, 1
  %lcmp.mod113 = icmp eq i64 %xtraiter112, 0
  %36 = icmp eq i64 %28, 0
  br label %37

; <label>:37:                                     ; preds = %._crit_edge12._crit_edge, %.lr.ph14
  %indvar = phi i64 [ 0, %.lr.ph14 ], [ %indvar.next, %._crit_edge12._crit_edge ]
  %indvars.iv88 = phi i64 [ %23, %.lr.ph14 ], [ %indvars.iv.next89, %._crit_edge12._crit_edge ]
  %indvars.iv78 = phi i64 [ %20, %.lr.ph14 ], [ %indvars.iv.next79, %._crit_edge12._crit_edge ]
  %38 = mul nuw nsw i64 %indvar, 1201
  %39 = add nsw i64 %20, %38
  %scevgep = getelementptr [1200 x double], [1200 x double]* %15, i64 %23, i64 %39
  %40 = add nsw i64 %27, %indvar
  %41 = icmp sgt i64 %40, %24
  %smax = select i1 %41, i64 %40, i64 %24
  %sum = add nsw i64 %20, %indvar
  %42 = sub i64 %smax, %sum
  %43 = shl i64 %42, 3
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %37
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %44 = phi double [ %48, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.prol, i64 %indvars.iv88
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fadd double %44, %47
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %48, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %48, %.prol.loopexit.loopexit ]
  br i1 %30, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %49 = phi double [ %65, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv, i64 %indvars.iv88
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fadd double %49, %52
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next, i64 %indvars.iv88
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fadd double %53, %56
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next.1, i64 %indvars.iv88
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %59
  %61 = fadd double %57, %60
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next.2, i64 %indvars.iv88
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %63
  %65 = fadd double %61, %64
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %18
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %37
  %.lcssa1740 = phi double [ 0.000000e+00, %37 ], [ %.lcssa.unr, %.prol.loopexit ], [ %65, %._crit_edge.loopexit ]
  %66 = tail call double @sqrt(double %.lcssa1740) #4
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv88
  store double %66, double* %67, align 8
  br i1 %31, label %.lr.ph2, label %._crit_edge3

.lr.ph2:                                          ; preds = %._crit_edge
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv88
  br i1 %lcmp.mod93, label %.prol.loopexit91, label %69

; <label>:69:                                     ; preds = %.lr.ph2
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv88
  %71 = load double, double* %70, align 8
  %72 = load double, double* %68, align 8
  %73 = fdiv double %71, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 0, i64 %indvars.iv88
  store double %73, double* %74, align 8
  br label %.prol.loopexit91

.prol.loopexit91:                                 ; preds = %.lr.ph2, %69
  %indvars.iv50.unr.ph = phi i64 [ 1, %69 ], [ 0, %.lr.ph2 ]
  br i1 %32, label %._crit_edge3, label %.lr.ph2.new.preheader

.lr.ph2.new.preheader:                            ; preds = %.prol.loopexit91
  br label %.lr.ph2.new

.lr.ph2.new:                                      ; preds = %.lr.ph2.new.preheader, %.lr.ph2.new
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph2.new ], [ %indvars.iv50.unr.ph, %.lr.ph2.new.preheader ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv50, i64 %indvars.iv88
  %76 = load double, double* %75, align 8
  %77 = load double, double* %68, align 8
  %78 = fdiv double %76, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv50, i64 %indvars.iv88
  store double %78, double* %79, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next51, i64 %indvars.iv88
  %81 = load double, double* %80, align 8
  %82 = load double, double* %68, align 8
  %83 = fdiv double %81, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next51, i64 %indvars.iv88
  store double %83, double* %84, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next51.1, %18
  br i1 %exitcond.1, label %._crit_edge3.loopexit, label %.lr.ph2.new

._crit_edge3.loopexit:                            ; preds = %.lr.ph2.new
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.prol.loopexit91, %._crit_edge
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %85 = icmp slt i64 %indvars.iv.next89, %25
  br i1 %85, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %._crit_edge3
  br i1 %33, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.split.preheader

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 0, i64 %indvars.iv88
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 0, i64 %indvars.iv88
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge9.us, %.lr.ph11.split.us.preheader
  %indvars.iv80 = phi i64 [ %indvars.iv78, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next81, %._crit_edge9.us ]
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv80
  store double 0.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv80
  br i1 %lcmp.mod107, label %.prol.loopexit105, label %90

; <label>:90:                                     ; preds = %.lr.ph11.split.us
  %91 = load double, double* %87, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv80
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = load double, double* %89, align 8
  %96 = fadd double %94, %95
  store double %96, double* %89, align 8
  br label %.prol.loopexit105

.prol.loopexit105:                                ; preds = %.lr.ph11.split.us, %90
  %indvars.iv74.unr.ph = phi i64 [ 1, %90 ], [ 0, %.lr.ph11.split.us ]
  br i1 %34, label %._crit_edge6.us, label %.lr.ph11.split.us.new.preheader

.lr.ph11.split.us.new.preheader:                  ; preds = %.prol.loopexit105
  br label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.lr.ph11.split.us.new.preheader, %.lr.ph11.split.us.new
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph11.split.us.new ], [ %indvars.iv74.unr.ph, %.lr.ph11.split.us.new.preheader ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv74, i64 %indvars.iv88
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv74, i64 %indvars.iv80
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = load double, double* %89, align 8
  %103 = fadd double %101, %102
  store double %103, double* %89, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next75, i64 %indvars.iv88
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next75, i64 %indvars.iv80
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = load double, double* %89, align 8
  %110 = fadd double %108, %109
  store double %110, double* %89, align 8
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv74, 2
  %exitcond.1109 = icmp eq i64 %indvars.iv.next75.1, %21
  br i1 %exitcond.1109, label %._crit_edge6.us.loopexit, label %.lr.ph11.split.us.new

._crit_edge6.us.loopexit:                         ; preds = %.lr.ph11.split.us.new
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.prol.loopexit105
  br i1 %35, label %.lr.ph8.us, label %._crit_edge9.us

.lr.ph8.us:                                       ; preds = %._crit_edge6.us
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv88, i64 %indvars.iv80
  br i1 %lcmp.mod113, label %.prol.loopexit111, label %112

; <label>:112:                                    ; preds = %.lr.ph8.us
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv80
  %114 = load double, double* %113, align 8
  %115 = load double, double* %86, align 8
  %116 = load double, double* %111, align 8
  %117 = fmul double %115, %116
  %118 = fsub double %114, %117
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv80
  store double %118, double* %119, align 8
  br label %.prol.loopexit111

.prol.loopexit111:                                ; preds = %.lr.ph8.us, %112
  %indvars.iv76.unr.ph = phi i64 [ 1, %112 ], [ 0, %.lr.ph8.us ]
  br i1 %36, label %._crit_edge9.us, label %.lr.ph8.us.new.preheader

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit111
  br label %.lr.ph8.us.new

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new.preheader, %.lr.ph8.us.new
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.1, %.lr.ph8.us.new ], [ %indvars.iv76.unr.ph, %.lr.ph8.us.new.preheader ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv76, i64 %indvars.iv80
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv76, i64 %indvars.iv88
  %123 = load double, double* %122, align 8
  %124 = load double, double* %111, align 8
  %125 = fmul double %123, %124
  %126 = fsub double %121, %125
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv76, i64 %indvars.iv80
  store double %126, double* %127, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next77, i64 %indvars.iv80
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next77, i64 %indvars.iv88
  %131 = load double, double* %130, align 8
  %132 = load double, double* %111, align 8
  %133 = fmul double %131, %132
  %134 = fsub double %129, %133
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next77, i64 %indvars.iv80
  store double %134, double* %135, align 8
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv76, 2
  %exitcond.1115 = icmp eq i64 %indvars.iv.next77.1, %21
  br i1 %exitcond.1115, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit111, %._crit_edge6.us
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, 1
  %136 = icmp slt i64 %indvars.iv.next81, %22
  br i1 %136, label %.lr.ph11.split.us, label %._crit_edge12.loopexit

.lr.ph11.split.split.preheader:                   ; preds = %.lr.ph11
  %137 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %137, i8 0, i64 %43, i32 8, i1 false)
  br label %._crit_edge12

._crit_edge12.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge3, %.lr.ph11.split.split.preheader
  %138 = icmp slt i64 %indvars.iv.next89, %24
  br i1 %138, label %._crit_edge12._crit_edge, label %._crit_edge15

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12
  %indvar.next = add nuw nsw i64 %indvar, 1
  %indvars.iv.next79 = add nsw i64 %indvars.iv78, 1
  br label %37

._crit_edge15:                                    ; preds = %._crit_edge12
  %139 = trunc i64 %indvars.iv.next89 to i32
  store i32 %139, i32* %11, align 4
  br label %._crit_edge122

._crit_edge122:                                   ; preds = %5, %._crit_edge15
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
  br i1 %15, label %.lr.ph10, label %._crit_edge

.lr.ph10:                                         ; preds = %4
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = icmp sgt i32 %16, 0
  %19 = load [1200 x double]*, [1200 x double]** %7, align 8
  %.promoted25 = load i32, i32* %9, align 4
  br i1 %18, label %.lr.ph10.split.us.preheader, label %._crit_edge11.loopexit28

.lr.ph10.split.us.preheader:                      ; preds = %.lr.ph10
  %20 = sext i32 %.promoted25 to i64
  %21 = load i32, i32* %6, align 4
  %22 = sext i32 %21 to i64
  %23 = sext i32 %16 to i64
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %._crit_edge7.us, %.lr.ph10.split.us.preheader
  %indvars.iv41 = phi i64 [ %20, %.lr.ph10.split.us.preheader ], [ %indvars.iv.next42, %._crit_edge7.us ]
  %24 = mul nsw i64 %17, %indvars.iv41
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge3, %.lr.ph10.split.us
  %indvars.iv32 = phi i64 [ 0, %.lr.ph10.split.us ], [ %indvars.iv.next33, %._crit_edge3 ]
  %25 = add i64 %24, %indvars.iv32
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge3

; <label>:29:                                     ; preds = %._crit_edge5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc14.us = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge5, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv41, i64 %indvars.iv32
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #7
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %35 = icmp slt i64 %indvars.iv.next33, %22
  br i1 %35, label %._crit_edge5, label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge3
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, 1
  %36 = icmp slt i64 %indvars.iv.next42, %23
  br i1 %36, label %.lr.ph10.split.us, label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge7.us
  %37 = trunc i64 %indvars.iv.next42 to i32
  br label %._crit_edge11

._crit_edge11.loopexit28:                         ; preds = %.lr.ph10
  %38 = add i32 %.promoted25, 1
  %39 = icmp sgt i32 %16, %38
  %smax36 = select i1 %39, i32 %16, i32 %38
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit28, %._crit_edge11.loopexit
  %.lcssa26 = phi i32 [ %37, %._crit_edge11.loopexit ], [ %smax36, %._crit_edge11.loopexit28 ]
  store i32 %.lcssa26, i32* %9, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %._crit_edge11
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  store i32 0, i32* %9, align 4
  %44 = load i32, i32* %5, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %.lr.ph3, label %._crit_edge6

.lr.ph3:                                          ; preds = %._crit_edge
  %46 = load i32, i32* %6, align 4
  %47 = sext i32 %46 to i64
  %48 = icmp sgt i32 %46, 0
  %49 = load [1200 x double]*, [1200 x double]** %8, align 8
  %50 = load i32, i32* %5, align 4
  %51 = sext i32 %50 to i64
  %.promoted = load i32, i32* %9, align 4
  br i1 %48, label %.lr.ph3.split.us.preheader, label %._crit_edge4.loopexit27

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %52 = sext i32 %.promoted to i64
  %53 = load i32, i32* %6, align 4
  %54 = sext i32 %53 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv38 = phi i64 [ %52, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us ]
  %55 = mul nsw i64 %47, %indvars.iv38
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge7, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge7 ]
  %56 = add i64 %55, %indvars.iv
  %57 = trunc i64 %56 to i32
  %58 = srem i32 %57, 20
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %._crit_edge7

; <label>:60:                                     ; preds = %._crit_edge8
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %61) #6
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge8, %60
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %indvars.iv38, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %64) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = icmp slt i64 %indvars.iv.next, %54
  br i1 %66, label %._crit_edge8, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge7
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  %67 = icmp slt i64 %indvars.iv.next39, %51
  br i1 %67, label %.lr.ph3.split.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %68 = trunc i64 %indvars.iv.next39 to i32
  br label %._crit_edge4

._crit_edge4.loopexit27:                          ; preds = %.lr.ph3
  %69 = add i32 %.promoted, 1
  %70 = icmp sgt i32 %50, %69
  %smax = select i1 %70, i32 %50, i32 %69
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit27, %._crit_edge4.loopexit
  %.lcssa20 = phi i32 [ %68, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit27 ]
  store i32 %.lcssa20, i32* %9, align 4
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %._crit_edge4
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %74 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %73) #6
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
