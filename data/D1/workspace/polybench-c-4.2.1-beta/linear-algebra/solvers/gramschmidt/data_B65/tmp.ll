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
  br i1 %12, label %._crit_edge.lr.ph, label %._crit_edge4

._crit_edge.lr.ph:                                ; preds = %5
  %13 = load i32, i32* %7, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = load i32, i32* %6, align 4
  %16 = sitofp i32 %15 to double
  %17 = load [1200 x double]*, [1200 x double]** %8, align 8
  %18 = load [1200 x double]*, [1200 x double]** %10, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %14, label %._crit_edge.us.preheader, label %.._crit_edge4_crit_edge.loopexit21

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %19 = load i32, i32* %7, align 4
  %20 = sext i32 %19 to i64
  %21 = sext i32 %.promoted to i64
  %22 = sext i32 %15 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge9.us, %._crit_edge.us.preheader
  %indvars.iv = phi i64 [ %21, %._crit_edge.us.preheader ], [ %indvars.iv.next, %._crit_edge9.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.us
  %indvars.iv27 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next28, %._crit_edge ]
  %23 = mul nsw i64 %indvars.iv27, %indvars.iv
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %15
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %16
  %28 = fmul double %27, 1.000000e+02
  %29 = fadd double %28, 1.000000e+01
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i64 %indvars.iv, i64 %indvars.iv27
  store double %29, double* %30, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv, i64 %indvars.iv27
  store double 0.000000e+00, double* %31, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %32 = icmp slt i64 %indvars.iv.next28, %20
  br i1 %32, label %._crit_edge, label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %33 = icmp slt i64 %indvars.iv.next, %22
  br i1 %33, label %._crit_edge.us, label %.._crit_edge4_crit_edge.loopexit

.._crit_edge4_crit_edge.loopexit:                 ; preds = %._crit_edge9.us
  %34 = trunc i64 %indvars.iv.next to i32
  br label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge.loopexit21:               ; preds = %._crit_edge.lr.ph
  %35 = add i32 %.promoted, 1
  %36 = icmp sgt i32 %15, %35
  %smax31 = select i1 %36, i32 %15, i32 %35
  br label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %.._crit_edge4_crit_edge.loopexit21, %.._crit_edge4_crit_edge.loopexit
  %.lcssa19 = phi i32 [ %34, %.._crit_edge4_crit_edge.loopexit ], [ %smax31, %.._crit_edge4_crit_edge.loopexit21 ]
  store i32 %.lcssa19, i32* %11, align 4
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %5, %.._crit_edge4_crit_edge
  store i32 0, i32* %11, align 4
  %37 = load i32, i32* %7, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %._crit_edge5.lr.ph, label %._crit_edge4._crit_edge

._crit_edge5.lr.ph:                               ; preds = %._crit_edge4
  %39 = load i32, i32* %7, align 4
  %40 = icmp sgt i32 %39, 0
  %41 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted12 = load i32, i32* %11, align 4
  br i1 %40, label %._crit_edge5.us.preheader, label %._crit_edge7.loopexit20

._crit_edge5.us.preheader:                        ; preds = %._crit_edge5.lr.ph
  %42 = load i32, i32* %7, align 4
  %43 = sext i32 %42 to i64
  %44 = sext i32 %.promoted12 to i64
  %45 = sext i32 %39 to i64
  %46 = icmp sgt i64 %43, 1
  %smax33 = select i1 %46, i64 %43, i64 1
  %47 = shl nsw i64 %smax33, 3
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.._crit_edge6.us_crit_edge, %._crit_edge5.us.preheader
  %indvar = phi i64 [ 0, %._crit_edge5.us.preheader ], [ %indvar.next, %._crit_edge6.us.._crit_edge6.us_crit_edge ]
  %indvars.iv25 = phi i64 [ %44, %._crit_edge5.us.preheader ], [ %indvars.iv.next26, %._crit_edge6.us.._crit_edge6.us_crit_edge ]
  %48 = add nsw i64 %44, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %41, i64 %48, i64 0
  %scevgep32 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 1
  %49 = icmp slt i64 %indvars.iv.next26, %45
  br i1 %49, label %._crit_edge6.us.._crit_edge6.us_crit_edge, label %._crit_edge7.loopexit

._crit_edge6.us.._crit_edge6.us_crit_edge:        ; preds = %._crit_edge6.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %._crit_edge6.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge6.us
  %50 = trunc i64 %indvars.iv.next26 to i32
  br label %._crit_edge7

._crit_edge7.loopexit20:                          ; preds = %._crit_edge5.lr.ph
  %51 = add i32 %.promoted12, 1
  %52 = icmp sgt i32 %39, %51
  %smax = select i1 %52, i32 %39, i32 %51
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit20, %._crit_edge7.loopexit
  %.lcssa13 = phi i32 [ %50, %._crit_edge7.loopexit ], [ %smax, %._crit_edge7.loopexit20 ]
  store i32 %.lcssa13, i32* %11, align 4
  br label %._crit_edge4._crit_edge

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4, %._crit_edge7
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
  br i1 %12, label %.lr.ph20, label %._crit_edge

.lr.ph20:                                         ; preds = %5
  %13 = load i32, i32* %6, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = load [1200 x double]*, [1200 x double]** %8, align 8
  %16 = load [1200 x double]*, [1200 x double]** %9, align 8
  %17 = icmp sgt i32 %13, 0
  %18 = load [1200 x double]*, [1200 x double]** %10, align 8
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %6, align 4
  %21 = icmp sgt i32 %20, 0
  %22 = load [1200 x double]*, [1200 x double]** %8, align 8
  %23 = load [1200 x double]*, [1200 x double]** %9, align 8
  %24 = icmp sgt i32 %20, 0
  %25 = load [1200 x double]*, [1200 x double]** %10, align 8
  %26 = load i32, i32* %7, align 4
  %.promoted = load i32, i32* %11, align 4
  %27 = sext i32 %13 to i64
  %28 = add i32 %.promoted, 1
  %29 = sext i32 %28 to i64
  %30 = sext i32 %20 to i64
  %31 = sext i32 %26 to i64
  %32 = sext i32 %.promoted to i64
  %33 = sext i32 %26 to i64
  %34 = sext i32 %19 to i64
  %35 = add nsw i64 %27, -1
  %36 = add nsw i64 %29, 1
  %37 = add nsw i64 %30, -1
  %xtraiter = and i64 %27, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %38 = icmp ult i64 %35, 3
  %xtraiter98 = and i64 %27, 1
  %lcmp.mod99 = icmp eq i64 %xtraiter98, 0
  %39 = icmp eq i64 %35, 0
  %xtraiter112 = and i64 %30, 1
  %lcmp.mod113 = icmp eq i64 %xtraiter112, 0
  %40 = icmp eq i64 %37, 0
  %xtraiter118 = and i64 %30, 1
  %lcmp.mod119 = icmp eq i64 %xtraiter118, 0
  %41 = icmp eq i64 %37, 0
  br label %42

; <label>:42:                                     ; preds = %._crit_edge18._crit_edge, %.lr.ph20
  %indvar = phi i64 [ 0, %.lr.ph20 ], [ %indvar.next, %._crit_edge18._crit_edge ]
  %indvars.iv94 = phi i64 [ %32, %.lr.ph20 ], [ %indvars.iv.next95, %._crit_edge18._crit_edge ]
  %indvars.iv84 = phi i64 [ %29, %.lr.ph20 ], [ %indvars.iv.next85, %._crit_edge18._crit_edge ]
  %43 = mul nuw nsw i64 %indvar, 1201
  %44 = add nsw i64 %29, %43
  %scevgep = getelementptr [1200 x double], [1200 x double]* %16, i64 %32, i64 %44
  %scevgep101 = bitcast double* %scevgep to i8*
  %45 = add nsw i64 %36, %indvar
  %46 = icmp sgt i64 %45, %33
  %smax = select i1 %46, i64 %45, i64 %33
  %sum = add nsw i64 %29, %indvar
  %47 = sub i64 %smax, %sum
  %48 = shl i64 %47, 3
  br i1 %14, label %.lr.ph, label %._crit_edge7

.lr.ph:                                           ; preds = %42
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %49 = phi double [ %53, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.prol, i64 %indvars.iv94
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fadd double %49, %52
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
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %53, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %53, %.prol.loopexit.loopexit ]
  br i1 %38, label %._crit_edge7, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %54 = phi double [ %70, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv, i64 %indvars.iv94
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %56
  %58 = fadd double %54, %57
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next, i64 %indvars.iv94
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %60
  %62 = fadd double %58, %61
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next.1, i64 %indvars.iv94
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fadd double %62, %65
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next.2, i64 %indvars.iv94
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fadd double %66, %69
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %27
  br i1 %exitcond.3, label %._crit_edge7.loopexit, label %.lr.ph.new

._crit_edge7.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.prol.loopexit, %42
  %.lcssa2349 = phi double [ 0.000000e+00, %42 ], [ %.lcssa.unr, %.prol.loopexit ], [ %70, %._crit_edge7.loopexit ]
  %71 = tail call double @sqrt(double %.lcssa2349) #4
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv94, i64 %indvars.iv94
  store double %71, double* %72, align 8
  br i1 %17, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %._crit_edge7
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv94, i64 %indvars.iv94
  br i1 %lcmp.mod99, label %.prol.loopexit97, label %.prol.preheader96

.prol.preheader96:                                ; preds = %.lr.ph9
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 0, i64 %indvars.iv94
  %75 = load double, double* %74, align 8
  %76 = load double, double* %73, align 8
  %77 = fdiv double %75, %76
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 0, i64 %indvars.iv94
  store double %77, double* %78, align 8
  br label %.prol.loopexit97

.prol.loopexit97:                                 ; preds = %.lr.ph9, %.prol.preheader96
  %indvars.iv56.unr.ph = phi i64 [ 1, %.prol.preheader96 ], [ 0, %.lr.ph9 ]
  br i1 %39, label %._crit_edge10, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit97
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader, %.lr.ph9.new
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.lr.ph9.new ], [ %indvars.iv56.unr.ph, %.lr.ph9.new.preheader ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv56, i64 %indvars.iv94
  %80 = load double, double* %79, align 8
  %81 = load double, double* %73, align 8
  %82 = fdiv double %80, %81
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv56, i64 %indvars.iv94
  store double %82, double* %83, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next57, i64 %indvars.iv94
  %85 = load double, double* %84, align 8
  %86 = load double, double* %73, align 8
  %87 = fdiv double %85, %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv.next57, i64 %indvars.iv94
  store double %87, double* %88, align 8
  %indvars.iv.next57.1 = add nuw nsw i64 %indvars.iv56, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next57.1, %27
  br i1 %exitcond.1, label %._crit_edge10.loopexit, label %.lr.ph9.new

._crit_edge10.loopexit:                           ; preds = %.lr.ph9.new
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.prol.loopexit97, %._crit_edge7
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, 1
  %89 = icmp slt i64 %indvars.iv.next95, %34
  br i1 %89, label %.lr.ph17, label %._crit_edge18

.lr.ph17:                                         ; preds = %._crit_edge10
  br i1 %21, label %.lr.ph17.split.us.preheader, label %._crit_edge18.loopexit53

.lr.ph17.split.us.preheader:                      ; preds = %.lr.ph17
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 0, i64 %indvars.iv94
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 0, i64 %indvars.iv94
  br label %.lr.ph17.split.us

.lr.ph17.split.us:                                ; preds = %._crit_edge14.us, %.lr.ph17.split.us.preheader
  %indvars.iv86 = phi i64 [ %indvars.iv84, %.lr.ph17.split.us.preheader ], [ %indvars.iv.next87, %._crit_edge14.us ]
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv94, i64 %indvars.iv86
  store double 0.000000e+00, double* %92, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv94, i64 %indvars.iv86
  br i1 %lcmp.mod113, label %.prol.loopexit111, label %.prol.preheader110

.prol.preheader110:                               ; preds = %.lr.ph17.split.us
  %94 = load double, double* %91, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 %indvars.iv86
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = load double, double* %93, align 8
  %99 = fadd double %97, %98
  store double %99, double* %93, align 8
  br label %.prol.loopexit111

.prol.loopexit111:                                ; preds = %.lr.ph17.split.us, %.prol.preheader110
  %indvars.iv80.unr.ph = phi i64 [ 1, %.prol.preheader110 ], [ 0, %.lr.ph17.split.us ]
  br i1 %40, label %._crit_edge.us, label %.lr.ph17.split.us.new.preheader

.lr.ph17.split.us.new.preheader:                  ; preds = %.prol.loopexit111
  br label %.lr.ph17.split.us.new

.lr.ph17.split.us.new:                            ; preds = %.lr.ph17.split.us.new.preheader, %.lr.ph17.split.us.new
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.1, %.lr.ph17.split.us.new ], [ %indvars.iv80.unr.ph, %.lr.ph17.split.us.new.preheader ]
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv80, i64 %indvars.iv94
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv80, i64 %indvars.iv86
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = load double, double* %93, align 8
  %106 = fadd double %104, %105
  store double %106, double* %93, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv.next81, i64 %indvars.iv94
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv.next81, i64 %indvars.iv86
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = load double, double* %93, align 8
  %113 = fadd double %111, %112
  store double %113, double* %93, align 8
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond.1115 = icmp eq i64 %indvars.iv.next81.1, %30
  br i1 %exitcond.1115, label %._crit_edge.us.loopexit, label %.lr.ph17.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph17.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit111
  br i1 %24, label %.lr.ph13.us, label %._crit_edge14.us

.lr.ph13.us:                                      ; preds = %._crit_edge.us
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv94, i64 %indvars.iv86
  br i1 %lcmp.mod119, label %.prol.loopexit117, label %.prol.preheader116

.prol.preheader116:                               ; preds = %.lr.ph13.us
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 %indvars.iv86
  %116 = load double, double* %115, align 8
  %117 = load double, double* %90, align 8
  %118 = load double, double* %114, align 8
  %119 = fmul double %117, %118
  %120 = fsub double %116, %119
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 %indvars.iv86
  store double %120, double* %121, align 8
  br label %.prol.loopexit117

.prol.loopexit117:                                ; preds = %.lr.ph13.us, %.prol.preheader116
  %indvars.iv82.unr.ph = phi i64 [ 1, %.prol.preheader116 ], [ 0, %.lr.ph13.us ]
  br i1 %41, label %._crit_edge14.us, label %.lr.ph13.us.new.preheader

.lr.ph13.us.new.preheader:                        ; preds = %.prol.loopexit117
  br label %.lr.ph13.us.new

.lr.ph13.us.new:                                  ; preds = %.lr.ph13.us.new.preheader, %.lr.ph13.us.new
  %indvars.iv82 = phi i64 [ %indvars.iv.next83.1, %.lr.ph13.us.new ], [ %indvars.iv82.unr.ph, %.lr.ph13.us.new.preheader ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv82, i64 %indvars.iv86
  %123 = load double, double* %122, align 8
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv82, i64 %indvars.iv94
  %125 = load double, double* %124, align 8
  %126 = load double, double* %114, align 8
  %127 = fmul double %125, %126
  %128 = fsub double %123, %127
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv82, i64 %indvars.iv86
  store double %128, double* %129, align 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv.next83, i64 %indvars.iv86
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv.next83, i64 %indvars.iv94
  %133 = load double, double* %132, align 8
  %134 = load double, double* %114, align 8
  %135 = fmul double %133, %134
  %136 = fsub double %131, %135
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv.next83, i64 %indvars.iv86
  store double %136, double* %137, align 8
  %indvars.iv.next83.1 = add nuw nsw i64 %indvars.iv82, 2
  %exitcond.1121 = icmp eq i64 %indvars.iv.next83.1, %30
  br i1 %exitcond.1121, label %._crit_edge14.us.loopexit, label %.lr.ph13.us.new

._crit_edge14.us.loopexit:                        ; preds = %.lr.ph13.us.new
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %.prol.loopexit117, %._crit_edge.us
  %indvars.iv.next87 = add nsw i64 %indvars.iv86, 1
  %138 = icmp slt i64 %indvars.iv.next87, %31
  br i1 %138, label %.lr.ph17.split.us, label %._crit_edge18.loopexit

._crit_edge18.loopexit53:                         ; preds = %.lr.ph17
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep101, i8 0, i64 %48, i32 8, i1 false)
  br label %._crit_edge18

._crit_edge18.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %._crit_edge10, %._crit_edge18.loopexit53
  %139 = icmp slt i64 %indvars.iv.next95, %33
  br i1 %139, label %._crit_edge18._crit_edge, label %._crit_edge21

._crit_edge18._crit_edge:                         ; preds = %._crit_edge18
  %indvar.next = add nuw nsw i64 %indvar, 1
  %indvars.iv.next85 = add nsw i64 %indvars.iv84, 1
  br label %42

._crit_edge21:                                    ; preds = %._crit_edge18
  %140 = trunc i64 %indvars.iv.next95 to i32
  store i32 %140, i32* %11, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %._crit_edge21
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
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  store i32 0, i32* %9, align 4
  %14 = load i32, i32* %6, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %._crit_edge.lr.ph, label %._crit_edge

._crit_edge.lr.ph:                                ; preds = %4
  %16 = load i32, i32* %6, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = load [1200 x double]*, [1200 x double]** %7, align 8
  %.promoted21 = load i32, i32* %9, align 4
  br i1 %17, label %._crit_edge.us.preheader, label %._crit_edge10.loopexit24

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %19 = load i32, i32* %6, align 4
  %20 = sext i32 %19 to i64
  %21 = sext i32 %.promoted21 to i64
  %22 = sext i32 %16 to i64
  %23 = sext i32 %16 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge5.us, %._crit_edge.us.preheader
  %indvars.iv37 = phi i64 [ %21, %._crit_edge.us.preheader ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %24 = mul nsw i64 %22, %indvars.iv37
  br label %._crit_edge7.us._crit_edge

._crit_edge7.us._crit_edge:                       ; preds = %._crit_edge7.us, %._crit_edge.us
  %indvars.iv28 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next29, %._crit_edge7.us ]
  %25 = add i64 %24, %indvars.iv28
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge7.us

; <label>:29:                                     ; preds = %._crit_edge7.us._crit_edge
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us._crit_edge, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv37, i64 %indvars.iv28
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #7
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %35 = icmp slt i64 %indvars.iv.next29, %20
  br i1 %35, label %._crit_edge7.us._crit_edge, label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge7.us
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %36 = icmp slt i64 %indvars.iv.next38, %23
  br i1 %36, label %._crit_edge.us, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %37 = trunc i64 %indvars.iv.next38 to i32
  br label %._crit_edge10

._crit_edge10.loopexit24:                         ; preds = %._crit_edge.lr.ph
  %38 = add i32 %.promoted21, 1
  %39 = icmp sgt i32 %16, %38
  %smax32 = select i1 %39, i32 %16, i32 %38
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit24, %._crit_edge10.loopexit
  %.lcssa22 = phi i32 [ %37, %._crit_edge10.loopexit ], [ %smax32, %._crit_edge10.loopexit24 ]
  store i32 %.lcssa22, i32* %9, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %._crit_edge10
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  store i32 0, i32* %9, align 4
  %44 = load i32, i32* %5, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %._crit_edge8.lr.ph, label %._crit_edge42

._crit_edge8.lr.ph:                               ; preds = %._crit_edge
  %46 = load i32, i32* %6, align 4
  %47 = icmp sgt i32 %46, 0
  %48 = load [1200 x double]*, [1200 x double]** %8, align 8
  %49 = load i32, i32* %5, align 4
  %.promoted = load i32, i32* %9, align 4
  br i1 %47, label %._crit_edge8.us.preheader, label %._crit_edge3.loopexit23

._crit_edge8.us.preheader:                        ; preds = %._crit_edge8.lr.ph
  %50 = load i32, i32* %6, align 4
  %51 = sext i32 %50 to i64
  %52 = sext i32 %.promoted to i64
  %53 = sext i32 %46 to i64
  %54 = sext i32 %49 to i64
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge2.us, %._crit_edge8.us.preheader
  %indvars.iv34 = phi i64 [ %52, %._crit_edge8.us.preheader ], [ %indvars.iv.next35, %._crit_edge2.us ]
  %55 = mul nsw i64 %53, %indvars.iv34
  br label %._crit_edge9.us._crit_edge

._crit_edge9.us._crit_edge:                       ; preds = %._crit_edge9.us, %._crit_edge8.us
  %indvars.iv = phi i64 [ 0, %._crit_edge8.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %56 = add i64 %55, %indvars.iv
  %57 = trunc i64 %56 to i32
  %58 = srem i32 %57, 20
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %._crit_edge9.us

; <label>:60:                                     ; preds = %._crit_edge9.us._crit_edge
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %61) #6
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us._crit_edge, %60
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %indvars.iv34, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %64) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = icmp slt i64 %indvars.iv.next, %51
  br i1 %66, label %._crit_edge9.us._crit_edge, label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge9.us
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %67 = icmp slt i64 %indvars.iv.next35, %54
  br i1 %67, label %._crit_edge8.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge2.us
  %68 = trunc i64 %indvars.iv.next35 to i32
  br label %._crit_edge3

._crit_edge3.loopexit23:                          ; preds = %._crit_edge8.lr.ph
  %69 = add i32 %.promoted, 1
  %70 = icmp sgt i32 %49, %69
  %smax = select i1 %70, i32 %49, i32 %69
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit23, %._crit_edge3.loopexit
  %.lcssa16 = phi i32 [ %68, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit23 ]
  store i32 %.lcssa16, i32* %9, align 4
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge, %._crit_edge3
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %74 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %73) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
