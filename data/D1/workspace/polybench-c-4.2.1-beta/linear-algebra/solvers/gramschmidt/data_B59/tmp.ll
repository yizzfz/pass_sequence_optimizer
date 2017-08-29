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
  br i1 %12, label %.preheader5.lr.ph, label %.preheader4

.preheader5.lr.ph:                                ; preds = %5
  %13 = load i32, i32* %7, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = load i32, i32* %6, align 4
  %16 = sitofp i32 %15 to double
  %17 = load [1200 x double]*, [1200 x double]** %8, align 8
  %18 = load [1200 x double]*, [1200 x double]** %10, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %14, label %.preheader5.us.preheader, label %..preheader4_crit_edge.loopexit20

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %19 = load i32, i32* %7, align 4
  %20 = sext i32 %19 to i64
  %21 = sext i32 %.promoted to i64
  %22 = sext i32 %15 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge8.us
  %indvars.iv = phi i64 [ %21, %.preheader5.us.preheader ], [ %indvars.iv.next, %._crit_edge8.us ]
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader5.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %23 ], [ 0, %.preheader5.us ]
  %24 = mul nsw i64 %indvars.iv26, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %15
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %16
  %29 = fmul double %28, 1.000000e+02
  %30 = fadd double %29, 1.000000e+01
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i64 %indvars.iv, i64 %indvars.iv26
  store double %30, double* %31, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv, i64 %indvars.iv26
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %33 = icmp slt i64 %indvars.iv.next27, %20
  br i1 %33, label %23, label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %23
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %34 = icmp slt i64 %indvars.iv.next, %22
  br i1 %34, label %.preheader5.us, label %..preheader4_crit_edge.loopexit

..preheader4_crit_edge.loopexit:                  ; preds = %._crit_edge8.us
  %35 = trunc i64 %indvars.iv.next to i32
  br label %..preheader4_crit_edge

..preheader4_crit_edge.loopexit20:                ; preds = %.preheader5.lr.ph
  %36 = add i32 %.promoted, 1
  %37 = icmp sgt i32 %15, %36
  %smax30 = select i1 %37, i32 %15, i32 %36
  br label %..preheader4_crit_edge

..preheader4_crit_edge:                           ; preds = %..preheader4_crit_edge.loopexit20, %..preheader4_crit_edge.loopexit
  %.lcssa18 = phi i32 [ %35, %..preheader4_crit_edge.loopexit ], [ %smax30, %..preheader4_crit_edge.loopexit20 ]
  store i32 %.lcssa18, i32* %11, align 4
  br label %.preheader4

.preheader4:                                      ; preds = %..preheader4_crit_edge, %5
  store i32 0, i32* %11, align 4
  %38 = load i32, i32* %7, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %.preheader.lr.ph, label %54

.preheader.lr.ph:                                 ; preds = %.preheader4
  %40 = load i32, i32* %7, align 4
  %41 = icmp sgt i32 %40, 0
  %42 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted11 = load i32, i32* %11, align 4
  br i1 %41, label %.preheader.us.preheader, label %._crit_edge6.loopexit19

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %43 = load i32, i32* %7, align 4
  %44 = sext i32 %43 to i64
  %45 = sext i32 %.promoted11 to i64
  %46 = sext i32 %40 to i64
  %47 = icmp sgt i64 %44, 1
  %smax32 = select i1 %47, i64 %44, i64 1
  %48 = shl nsw i64 %smax32, 3
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvar = phi i64 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge.us ]
  %indvars.iv24 = phi i64 [ %45, %.preheader.us.preheader ], [ %indvars.iv.next25, %._crit_edge.us ]
  %49 = add nsw i64 %45, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %42, i64 %49, i64 0
  %scevgep31 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31, i8 0, i64 %48, i32 8, i1 false)
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, 1
  %50 = icmp slt i64 %indvars.iv.next25, %46
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %50, label %._crit_edge.us, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  %51 = trunc i64 %indvars.iv.next25 to i32
  br label %._crit_edge6

._crit_edge6.loopexit19:                          ; preds = %.preheader.lr.ph
  %52 = add i32 %.promoted11, 1
  %53 = icmp sgt i32 %40, %52
  %smax = select i1 %53, i32 %40, i32 %52
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit19, %._crit_edge6.loopexit
  %.lcssa12 = phi i32 [ %51, %._crit_edge6.loopexit ], [ %smax, %._crit_edge6.loopexit19 ]
  store i32 %.lcssa12, i32* %11, align 4
  br label %54

; <label>:54:                                     ; preds = %._crit_edge6, %.preheader4
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
  br i1 %12, label %.lr.ph18, label %141

.lr.ph18:                                         ; preds = %5
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
  %xtraiter96 = and i64 %27, 1
  %lcmp.mod97 = icmp eq i64 %xtraiter96, 0
  %39 = icmp eq i64 %35, 0
  %xtraiter110 = and i64 %30, 1
  %lcmp.mod111 = icmp eq i64 %xtraiter110, 0
  %40 = icmp eq i64 %37, 0
  %xtraiter116 = and i64 %30, 1
  %lcmp.mod117 = icmp eq i64 %xtraiter116, 0
  %41 = icmp eq i64 %37, 0
  br label %42

; <label>:42:                                     ; preds = %.lr.ph18, %._crit_edge16
  %indvar = phi i64 [ 0, %.lr.ph18 ], [ %indvar.next, %._crit_edge16 ]
  %indvars.iv92 = phi i64 [ %32, %.lr.ph18 ], [ %indvars.iv.next93, %._crit_edge16 ]
  %indvars.iv82 = phi i64 [ %29, %.lr.ph18 ], [ %indvars.iv.next83, %._crit_edge16 ]
  %43 = mul nuw nsw i64 %indvar, 1201
  %44 = add nsw i64 %29, %43
  %scevgep = getelementptr [1200 x double], [1200 x double]* %16, i64 %32, i64 %44
  %scevgep99 = bitcast double* %scevgep to i8*
  %45 = add nsw i64 %36, %indvar
  %46 = icmp sgt i64 %45, %33
  %smax = select i1 %46, i64 %45, i64 %33
  %sum = add nsw i64 %29, %indvar
  %47 = sub i64 %smax, %sum
  %48 = shl i64 %47, 3
  br i1 %14, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %42
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %49 = phi double [ %53, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.prol, i64 %indvars.iv92
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fadd double %49, %52
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %53, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %53, %.prol.loopexit.loopexit ]
  br i1 %38, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %54 = phi double [ %70, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv, i64 %indvars.iv92
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %56
  %58 = fadd double %54, %57
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next, i64 %indvars.iv92
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %60
  %62 = fadd double %58, %61
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next.1, i64 %indvars.iv92
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fadd double %62, %65
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next.2, i64 %indvars.iv92
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fadd double %66, %69
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %27
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %42
  %.lcssa2147 = phi double [ 0.000000e+00, %42 ], [ %.lcssa.unr, %.prol.loopexit ], [ %70, %._crit_edge.loopexit ]
  %71 = tail call double @sqrt(double %.lcssa2147) #4
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv92, i64 %indvars.iv92
  store double %71, double* %72, align 8
  br i1 %17, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %._crit_edge
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv92, i64 %indvars.iv92
  br i1 %lcmp.mod97, label %.prol.loopexit95, label %.prol.preheader94

.prol.preheader94:                                ; preds = %.lr.ph7
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 0, i64 %indvars.iv92
  %75 = load double, double* %74, align 8
  %76 = load double, double* %73, align 8
  %77 = fdiv double %75, %76
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 0, i64 %indvars.iv92
  store double %77, double* %78, align 8
  br label %.prol.loopexit95

.prol.loopexit95:                                 ; preds = %.prol.preheader94, %.lr.ph7
  %indvars.iv54.unr.ph = phi i64 [ 1, %.prol.preheader94 ], [ 0, %.lr.ph7 ]
  br i1 %39, label %._crit_edge8, label %.lr.ph7.new.preheader

.lr.ph7.new.preheader:                            ; preds = %.prol.loopexit95
  br label %.lr.ph7.new

.lr.ph7.new:                                      ; preds = %.lr.ph7.new.preheader, %.lr.ph7.new
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.lr.ph7.new ], [ %indvars.iv54.unr.ph, %.lr.ph7.new.preheader ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv54, i64 %indvars.iv92
  %80 = load double, double* %79, align 8
  %81 = load double, double* %73, align 8
  %82 = fdiv double %80, %81
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv54, i64 %indvars.iv92
  store double %82, double* %83, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv.next55, i64 %indvars.iv92
  %85 = load double, double* %84, align 8
  %86 = load double, double* %73, align 8
  %87 = fdiv double %85, %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv.next55, i64 %indvars.iv92
  store double %87, double* %88, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next55.1, %27
  br i1 %exitcond.1, label %._crit_edge8.loopexit, label %.lr.ph7.new

._crit_edge8.loopexit:                            ; preds = %.lr.ph7.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.prol.loopexit95, %._crit_edge
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, 1
  %89 = icmp slt i64 %indvars.iv.next93, %34
  br i1 %89, label %.lr.ph15, label %._crit_edge16

.lr.ph15:                                         ; preds = %._crit_edge8
  br i1 %21, label %.lr.ph15.split.us.preheader, label %._crit_edge16.loopexit51

.lr.ph15.split.us.preheader:                      ; preds = %.lr.ph15
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 0, i64 %indvars.iv92
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 0, i64 %indvars.iv92
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %._crit_edge12.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge12.us ], [ %indvars.iv82, %.lr.ph15.split.us.preheader ]
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv92, i64 %indvars.iv84
  store double 0.000000e+00, double* %92, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv92, i64 %indvars.iv84
  br i1 %lcmp.mod111, label %.prol.loopexit109, label %.prol.preheader108

.prol.preheader108:                               ; preds = %.lr.ph15.split.us
  %94 = load double, double* %91, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 %indvars.iv84
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = load double, double* %93, align 8
  %99 = fadd double %97, %98
  store double %99, double* %93, align 8
  br label %.prol.loopexit109

.prol.loopexit109:                                ; preds = %.prol.preheader108, %.lr.ph15.split.us
  %indvars.iv78.unr.ph = phi i64 [ 1, %.prol.preheader108 ], [ 0, %.lr.ph15.split.us ]
  br i1 %40, label %.preheader.us, label %.lr.ph15.split.us.new.preheader

.lr.ph15.split.us.new.preheader:                  ; preds = %.prol.loopexit109
  br label %.lr.ph15.split.us.new

.lr.ph15.split.us.new:                            ; preds = %.lr.ph15.split.us.new.preheader, %.lr.ph15.split.us.new
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph15.split.us.new ], [ %indvars.iv78.unr.ph, %.lr.ph15.split.us.new.preheader ]
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv78, i64 %indvars.iv92
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv78, i64 %indvars.iv84
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = load double, double* %93, align 8
  %106 = fadd double %104, %105
  store double %106, double* %93, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv.next79, i64 %indvars.iv92
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv.next79, i64 %indvars.iv84
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = load double, double* %93, align 8
  %113 = fadd double %111, %112
  store double %113, double* %93, align 8
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  %exitcond.1113 = icmp eq i64 %indvars.iv.next79.1, %30
  br i1 %exitcond.1113, label %.preheader.us.loopexit, label %.lr.ph15.split.us.new

.preheader.us.loopexit:                           ; preds = %.lr.ph15.split.us.new
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.prol.loopexit109
  br i1 %24, label %.lr.ph11.us, label %._crit_edge12.us

.lr.ph11.us:                                      ; preds = %.preheader.us
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv92, i64 %indvars.iv84
  br i1 %lcmp.mod117, label %.prol.loopexit115, label %.prol.preheader114

.prol.preheader114:                               ; preds = %.lr.ph11.us
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 %indvars.iv84
  %116 = load double, double* %115, align 8
  %117 = load double, double* %90, align 8
  %118 = load double, double* %114, align 8
  %119 = fmul double %117, %118
  %120 = fsub double %116, %119
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 %indvars.iv84
  store double %120, double* %121, align 8
  br label %.prol.loopexit115

.prol.loopexit115:                                ; preds = %.prol.preheader114, %.lr.ph11.us
  %indvars.iv80.unr.ph = phi i64 [ 1, %.prol.preheader114 ], [ 0, %.lr.ph11.us ]
  br i1 %41, label %._crit_edge12.us, label %.lr.ph11.us.new.preheader

.lr.ph11.us.new.preheader:                        ; preds = %.prol.loopexit115
  br label %.lr.ph11.us.new

.lr.ph11.us.new:                                  ; preds = %.lr.ph11.us.new.preheader, %.lr.ph11.us.new
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.1, %.lr.ph11.us.new ], [ %indvars.iv80.unr.ph, %.lr.ph11.us.new.preheader ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv80, i64 %indvars.iv84
  %123 = load double, double* %122, align 8
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv80, i64 %indvars.iv92
  %125 = load double, double* %124, align 8
  %126 = load double, double* %114, align 8
  %127 = fmul double %125, %126
  %128 = fsub double %123, %127
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv80, i64 %indvars.iv84
  store double %128, double* %129, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv.next81, i64 %indvars.iv84
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv.next81, i64 %indvars.iv92
  %133 = load double, double* %132, align 8
  %134 = load double, double* %114, align 8
  %135 = fmul double %133, %134
  %136 = fsub double %131, %135
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv.next81, i64 %indvars.iv84
  store double %136, double* %137, align 8
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond.1119 = icmp eq i64 %indvars.iv.next81.1, %30
  br i1 %exitcond.1119, label %._crit_edge12.us.loopexit, label %.lr.ph11.us.new

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit115, %.preheader.us
  %indvars.iv.next85 = add nsw i64 %indvars.iv84, 1
  %138 = icmp slt i64 %indvars.iv.next85, %31
  br i1 %138, label %.lr.ph15.split.us, label %._crit_edge16.loopexit

._crit_edge16.loopexit51:                         ; preds = %.lr.ph15
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep99, i8 0, i64 %48, i32 8, i1 false)
  br label %._crit_edge16

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge16.loopexit51, %._crit_edge8
  %139 = icmp slt i64 %indvars.iv.next93, %33
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %139, label %42, label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge16
  %140 = trunc i64 %indvars.iv.next93 to i32
  store i32 %140, i32* %11, align 4
  br label %141

; <label>:141:                                    ; preds = %._crit_edge19, %5
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
  br i1 %15, label %.preheader7.lr.ph, label %42

.preheader7.lr.ph:                                ; preds = %4
  %16 = load i32, i32* %6, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = load [1200 x double]*, [1200 x double]** %7, align 8
  %.promoted24 = load i32, i32* %9, align 4
  br i1 %17, label %.preheader7.us.preheader, label %._crit_edge13.loopexit27

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %19 = load i32, i32* %6, align 4
  %20 = sext i32 %19 to i64
  %21 = sext i32 %.promoted24 to i64
  %22 = sext i32 %16 to i64
  %23 = sext i32 %16 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge11.us
  %indvars.iv40 = phi i64 [ %21, %.preheader7.us.preheader ], [ %indvars.iv.next41, %._crit_edge11.us ]
  %24 = mul nsw i64 %22, %indvars.iv40
  br label %25

; <label>:25:                                     ; preds = %32, %.preheader7.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %32 ], [ 0, %.preheader7.us ]
  %26 = add i64 %24, %indvars.iv31
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %25
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %32

; <label>:32:                                     ; preds = %30, %25
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv40, i64 %indvars.iv31
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #7
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %37 = icmp slt i64 %indvars.iv.next32, %20
  br i1 %37, label %25, label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %32
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %38 = icmp slt i64 %indvars.iv.next41, %23
  br i1 %38, label %.preheader7.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  %39 = trunc i64 %indvars.iv.next41 to i32
  br label %._crit_edge13

._crit_edge13.loopexit27:                         ; preds = %.preheader7.lr.ph
  %40 = add i32 %.promoted24, 1
  %41 = icmp sgt i32 %16, %40
  %smax35 = select i1 %41, i32 %16, i32 %40
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit27, %._crit_edge13.loopexit
  %.lcssa25 = phi i32 [ %39, %._crit_edge13.loopexit ], [ %smax35, %._crit_edge13.loopexit27 ]
  store i32 %.lcssa25, i32* %9, align 4
  br label %42

; <label>:42:                                     ; preds = %._crit_edge13, %4
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  store i32 0, i32* %9, align 4
  %47 = load i32, i32* %5, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %.preheader.lr.ph, label %76

.preheader.lr.ph:                                 ; preds = %42
  %49 = load i32, i32* %6, align 4
  %50 = icmp sgt i32 %49, 0
  %51 = load [1200 x double]*, [1200 x double]** %8, align 8
  %52 = load i32, i32* %5, align 4
  %.promoted = load i32, i32* %9, align 4
  br i1 %50, label %.preheader.us.preheader, label %._crit_edge9.loopexit26

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %53 = load i32, i32* %6, align 4
  %54 = sext i32 %53 to i64
  %55 = sext i32 %.promoted to i64
  %56 = sext i32 %49 to i64
  %57 = sext i32 %52 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv37 = phi i64 [ %55, %.preheader.us.preheader ], [ %indvars.iv.next38, %._crit_edge.us ]
  %58 = mul nsw i64 %56, %indvars.iv37
  br label %59

; <label>:59:                                     ; preds = %66, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %66 ], [ 0, %.preheader.us ]
  %60 = add i64 %58, %indvars.iv
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 20
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %59
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %65) #6
  br label %66

; <label>:66:                                     ; preds = %64, %59
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %51, i64 %indvars.iv37, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %69) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %71 = icmp slt i64 %indvars.iv.next, %54
  br i1 %71, label %59, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %66
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %72 = icmp slt i64 %indvars.iv.next38, %57
  br i1 %72, label %.preheader.us, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  %73 = trunc i64 %indvars.iv.next38 to i32
  br label %._crit_edge9

._crit_edge9.loopexit26:                          ; preds = %.preheader.lr.ph
  %74 = add i32 %.promoted, 1
  %75 = icmp sgt i32 %52, %74
  %smax = select i1 %75, i32 %52, i32 %74
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit26, %._crit_edge9.loopexit
  %.lcssa19 = phi i32 [ %73, %._crit_edge9.loopexit ], [ %smax, %._crit_edge9.loopexit26 ]
  store i32 %.lcssa19, i32* %9, align 4
  br label %76

; <label>:76:                                     ; preds = %._crit_edge9, %42
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %78 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %80 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %79) #6
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
