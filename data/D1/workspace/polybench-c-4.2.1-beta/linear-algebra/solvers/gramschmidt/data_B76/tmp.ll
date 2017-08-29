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

; <label>:45:                                     ; preds = %34, %2, %38
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
  %16 = sext i32 %15 to i64
  %17 = sitofp i32 %15 to double
  %18 = load [1200 x double]*, [1200 x double]** %8, align 8
  %19 = load [1200 x double]*, [1200 x double]** %10, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %14, label %.preheader5.us.preheader, label %..preheader4_crit_edge.loopexit20

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %20 = sext i32 %.promoted to i64
  %21 = load i32, i32* %7, align 4
  %22 = sext i32 %21 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge8.us, %.preheader5.us.preheader
  %indvars.iv = phi i64 [ %20, %.preheader5.us.preheader ], [ %indvars.iv.next, %._crit_edge8.us ]
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader5.us
  %indvars.iv26 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next27, %23 ]
  %24 = mul nsw i64 %indvars.iv26, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %15
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %17
  %29 = fmul double %28, 1.000000e+02
  %30 = fadd double %29, 1.000000e+01
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %indvars.iv, i64 %indvars.iv26
  store double %30, double* %31, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv, i64 %indvars.iv26
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %33 = icmp slt i64 %indvars.iv.next27, %22
  br i1 %33, label %23, label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %23
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %34 = icmp slt i64 %indvars.iv.next, %16
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

.preheader4:                                      ; preds = %5, %..preheader4_crit_edge
  store i32 0, i32* %11, align 4
  %38 = load i32, i32* %7, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %.preheader.lr.ph, label %54

.preheader.lr.ph:                                 ; preds = %.preheader4
  %40 = load i32, i32* %7, align 4
  %41 = sext i32 %40 to i64
  %42 = icmp sgt i32 %40, 0
  %43 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted11 = load i32, i32* %11, align 4
  %44 = sext i32 %.promoted11 to i64
  br i1 %42, label %.preheader.us.preheader, label %._crit_edge6.loopexit19

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %45 = load i32, i32* %7, align 4
  %46 = sext i32 %45 to i64
  %47 = icmp sgt i64 %46, 1
  %smax32 = select i1 %47, i64 %46, i64 1
  %48 = shl nsw i64 %smax32, 3
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvar = phi i64 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge.us ]
  %indvars.iv24 = phi i64 [ %44, %.preheader.us.preheader ], [ %indvars.iv.next25, %._crit_edge.us ]
  %49 = add nsw i64 %44, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %43, i64 %49, i64 0
  %scevgep31 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31, i8 0, i64 %48, i32 8, i1 false)
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, 1
  %50 = icmp slt i64 %indvars.iv.next25, %41
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

; <label>:54:                                     ; preds = %.preheader4, %._crit_edge6
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
  br i1 %12, label %.lr.ph18, label %140

.lr.ph18:                                         ; preds = %5
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
  %xtraiter96 = and i64 %18, 1
  %lcmp.mod97 = icmp eq i64 %xtraiter96, 0
  %32 = icmp eq i64 %26, 0
  %33 = icmp sgt i32 %13, 0
  %xtraiter110 = and i64 %21, 1
  %lcmp.mod111 = icmp eq i64 %xtraiter110, 0
  %34 = icmp eq i64 %28, 0
  %35 = icmp sgt i32 %13, 0
  %xtraiter116 = and i64 %21, 1
  %lcmp.mod117 = icmp eq i64 %xtraiter116, 0
  %36 = icmp eq i64 %28, 0
  br label %37

; <label>:37:                                     ; preds = %._crit_edge16._crit_edge, %.lr.ph18
  %indvar = phi i64 [ 0, %.lr.ph18 ], [ %indvar.next, %._crit_edge16._crit_edge ]
  %indvars.iv92 = phi i64 [ %23, %.lr.ph18 ], [ %indvars.iv.next93, %._crit_edge16._crit_edge ]
  %indvars.iv82 = phi i64 [ %20, %.lr.ph18 ], [ %indvars.iv.next83, %._crit_edge16._crit_edge ]
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

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %44 = phi double [ %48, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.prol, i64 %indvars.iv92
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fadd double %44, %47
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

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
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv, i64 %indvars.iv92
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fadd double %49, %52
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next, i64 %indvars.iv92
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fadd double %53, %56
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next.1, i64 %indvars.iv92
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %59
  %61 = fadd double %57, %60
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next.2, i64 %indvars.iv92
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %63
  %65 = fadd double %61, %64
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %18
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %37
  %.lcssa2147 = phi double [ 0.000000e+00, %37 ], [ %.lcssa.unr, %.prol.loopexit ], [ %65, %._crit_edge.loopexit ]
  %66 = tail call double @sqrt(double %.lcssa2147) #4
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv92, i64 %indvars.iv92
  store double %66, double* %67, align 8
  br i1 %31, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %._crit_edge
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv92, i64 %indvars.iv92
  br i1 %lcmp.mod97, label %.prol.loopexit95, label %69

; <label>:69:                                     ; preds = %.lr.ph7
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv92
  %71 = load double, double* %70, align 8
  %72 = load double, double* %68, align 8
  %73 = fdiv double %71, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 0, i64 %indvars.iv92
  store double %73, double* %74, align 8
  br label %.prol.loopexit95

.prol.loopexit95:                                 ; preds = %69, %.lr.ph7
  %indvars.iv54.unr.ph = phi i64 [ 1, %69 ], [ 0, %.lr.ph7 ]
  br i1 %32, label %._crit_edge8, label %.lr.ph7.new.preheader

.lr.ph7.new.preheader:                            ; preds = %.prol.loopexit95
  br label %.lr.ph7.new

.lr.ph7.new:                                      ; preds = %.lr.ph7.new.preheader, %.lr.ph7.new
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.lr.ph7.new ], [ %indvars.iv54.unr.ph, %.lr.ph7.new.preheader ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv54, i64 %indvars.iv92
  %76 = load double, double* %75, align 8
  %77 = load double, double* %68, align 8
  %78 = fdiv double %76, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv54, i64 %indvars.iv92
  store double %78, double* %79, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next55, i64 %indvars.iv92
  %81 = load double, double* %80, align 8
  %82 = load double, double* %68, align 8
  %83 = fdiv double %81, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next55, i64 %indvars.iv92
  store double %83, double* %84, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next55.1, %18
  br i1 %exitcond.1, label %._crit_edge8.loopexit, label %.lr.ph7.new

._crit_edge8.loopexit:                            ; preds = %.lr.ph7.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.prol.loopexit95, %._crit_edge
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, 1
  %85 = icmp slt i64 %indvars.iv.next93, %25
  br i1 %85, label %.lr.ph15, label %._crit_edge16

.lr.ph15:                                         ; preds = %._crit_edge8
  br i1 %33, label %.lr.ph15.split.us.preheader, label %.lr.ph15.split.split.preheader

.lr.ph15.split.us.preheader:                      ; preds = %.lr.ph15
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 0, i64 %indvars.iv92
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 0, i64 %indvars.iv92
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %._crit_edge12.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge12.us ], [ %indvars.iv82, %.lr.ph15.split.us.preheader ]
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv92, i64 %indvars.iv84
  store double 0.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv92, i64 %indvars.iv84
  br i1 %lcmp.mod111, label %.prol.loopexit109, label %90

; <label>:90:                                     ; preds = %.lr.ph15.split.us
  %91 = load double, double* %87, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv84
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = load double, double* %89, align 8
  %96 = fadd double %94, %95
  store double %96, double* %89, align 8
  br label %.prol.loopexit109

.prol.loopexit109:                                ; preds = %90, %.lr.ph15.split.us
  %indvars.iv78.unr.ph = phi i64 [ 1, %90 ], [ 0, %.lr.ph15.split.us ]
  br i1 %34, label %.preheader.us, label %.lr.ph15.split.us.new.preheader

.lr.ph15.split.us.new.preheader:                  ; preds = %.prol.loopexit109
  br label %.lr.ph15.split.us.new

.lr.ph15.split.us.new:                            ; preds = %.lr.ph15.split.us.new.preheader, %.lr.ph15.split.us.new
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph15.split.us.new ], [ %indvars.iv78.unr.ph, %.lr.ph15.split.us.new.preheader ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv78, i64 %indvars.iv92
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv78, i64 %indvars.iv84
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = load double, double* %89, align 8
  %103 = fadd double %101, %102
  store double %103, double* %89, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next79, i64 %indvars.iv92
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next79, i64 %indvars.iv84
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = load double, double* %89, align 8
  %110 = fadd double %108, %109
  store double %110, double* %89, align 8
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  %exitcond.1113 = icmp eq i64 %indvars.iv.next79.1, %21
  br i1 %exitcond.1113, label %.preheader.us.loopexit, label %.lr.ph15.split.us.new

.preheader.us.loopexit:                           ; preds = %.lr.ph15.split.us.new
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.prol.loopexit109
  br i1 %35, label %.lr.ph11.us, label %._crit_edge12.us

.lr.ph11.us:                                      ; preds = %.preheader.us
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %indvars.iv92, i64 %indvars.iv84
  br i1 %lcmp.mod117, label %.prol.loopexit115, label %112

; <label>:112:                                    ; preds = %.lr.ph11.us
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv84
  %114 = load double, double* %113, align 8
  %115 = load double, double* %86, align 8
  %116 = load double, double* %111, align 8
  %117 = fmul double %115, %116
  %118 = fsub double %114, %117
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 0, i64 %indvars.iv84
  store double %118, double* %119, align 8
  br label %.prol.loopexit115

.prol.loopexit115:                                ; preds = %112, %.lr.ph11.us
  %indvars.iv80.unr.ph = phi i64 [ 1, %112 ], [ 0, %.lr.ph11.us ]
  br i1 %36, label %._crit_edge12.us, label %.lr.ph11.us.new.preheader

.lr.ph11.us.new.preheader:                        ; preds = %.prol.loopexit115
  br label %.lr.ph11.us.new

.lr.ph11.us.new:                                  ; preds = %.lr.ph11.us.new.preheader, %.lr.ph11.us.new
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.1, %.lr.ph11.us.new ], [ %indvars.iv80.unr.ph, %.lr.ph11.us.new.preheader ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv80, i64 %indvars.iv84
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv80, i64 %indvars.iv92
  %123 = load double, double* %122, align 8
  %124 = load double, double* %111, align 8
  %125 = fmul double %123, %124
  %126 = fsub double %121, %125
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv80, i64 %indvars.iv84
  store double %126, double* %127, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next81, i64 %indvars.iv84
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %16, i64 %indvars.iv.next81, i64 %indvars.iv92
  %131 = load double, double* %130, align 8
  %132 = load double, double* %111, align 8
  %133 = fmul double %131, %132
  %134 = fsub double %129, %133
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv.next81, i64 %indvars.iv84
  store double %134, double* %135, align 8
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond.1119 = icmp eq i64 %indvars.iv.next81.1, %21
  br i1 %exitcond.1119, label %._crit_edge12.us.loopexit, label %.lr.ph11.us.new

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit115, %.preheader.us
  %indvars.iv.next85 = add nsw i64 %indvars.iv84, 1
  %136 = icmp slt i64 %indvars.iv.next85, %22
  br i1 %136, label %.lr.ph15.split.us, label %._crit_edge16.loopexit

.lr.ph15.split.split.preheader:                   ; preds = %.lr.ph15
  %137 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %137, i8 0, i64 %43, i32 8, i1 false)
  br label %._crit_edge16

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.lr.ph15.split.split.preheader, %._crit_edge8
  %138 = icmp slt i64 %indvars.iv.next93, %24
  br i1 %138, label %._crit_edge16._crit_edge, label %._crit_edge19

._crit_edge16._crit_edge:                         ; preds = %._crit_edge16
  %indvar.next = add nuw nsw i64 %indvar, 1
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  br label %37

._crit_edge19:                                    ; preds = %._crit_edge16
  %139 = trunc i64 %indvars.iv.next93 to i32
  store i32 %139, i32* %11, align 4
  br label %140

; <label>:140:                                    ; preds = %5, %._crit_edge19
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
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %9, align 4
  %14 = load i32, i32* %6, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.preheader7.lr.ph, label %42

.preheader7.lr.ph:                                ; preds = %4
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = icmp sgt i32 %16, 0
  %19 = load [1200 x double]*, [1200 x double]** %7, align 8
  %.promoted17 = load i32, i32* %9, align 4
  br i1 %18, label %.preheader7.us.preheader, label %._crit_edge5.loopexit20

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %20 = sext i32 %.promoted17 to i64
  %21 = load i32, i32* %6, align 4
  %22 = sext i32 %21 to i64
  %23 = sext i32 %16 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge3.us, %.preheader7.us.preheader
  %indvars.iv33 = phi i64 [ %20, %.preheader7.us.preheader ], [ %indvars.iv.next34, %._crit_edge3.us ]
  %24 = mul nsw i64 %17, %indvars.iv33
  br label %25

; <label>:25:                                     ; preds = %32, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %32 ]
  %26 = add i64 %24, %indvars.iv24
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %25
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %32

; <label>:32:                                     ; preds = %25, %30
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv33, i64 %indvars.iv24
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #6
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %37 = icmp slt i64 %indvars.iv.next25, %22
  br i1 %37, label %25, label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %32
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %38 = icmp slt i64 %indvars.iv.next34, %23
  br i1 %38, label %.preheader7.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  %39 = trunc i64 %indvars.iv.next34 to i32
  br label %._crit_edge5

._crit_edge5.loopexit20:                          ; preds = %.preheader7.lr.ph
  %40 = add i32 %.promoted17, 1
  %41 = icmp sgt i32 %16, %40
  %smax28 = select i1 %41, i32 %16, i32 %40
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit20, %._crit_edge5.loopexit
  %.lcssa18 = phi i32 [ %39, %._crit_edge5.loopexit ], [ %smax28, %._crit_edge5.loopexit20 ]
  store i32 %.lcssa18, i32* %9, align 4
  br label %42

; <label>:42:                                     ; preds = %4, %._crit_edge5
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  store i32 0, i32* %9, align 4
  %47 = load i32, i32* %5, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %.preheader.lr.ph, label %76

.preheader.lr.ph:                                 ; preds = %42
  %49 = load i32, i32* %6, align 4
  %50 = sext i32 %49 to i64
  %51 = icmp sgt i32 %49, 0
  %52 = load [1200 x double]*, [1200 x double]** %8, align 8
  %53 = load i32, i32* %5, align 4
  %54 = sext i32 %53 to i64
  %.promoted = load i32, i32* %9, align 4
  br i1 %51, label %.preheader.us.preheader, label %._crit_edge1.loopexit19

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %55 = sext i32 %.promoted to i64
  %56 = load i32, i32* %6, align 4
  %57 = sext i32 %56 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv30 = phi i64 [ %55, %.preheader.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us ]
  %58 = mul nsw i64 %50, %indvars.iv30
  br label %59

; <label>:59:                                     ; preds = %66, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %66 ]
  %60 = add i64 %58, %indvars.iv
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 20
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %59
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %65) #6
  br label %66

; <label>:66:                                     ; preds = %59, %64
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %indvars.iv30, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %69) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %71 = icmp slt i64 %indvars.iv.next, %57
  br i1 %71, label %59, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %66
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %72 = icmp slt i64 %indvars.iv.next31, %54
  br i1 %72, label %.preheader.us, label %._crit_edge1.loopexit

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  %73 = trunc i64 %indvars.iv.next31 to i32
  br label %._crit_edge1

._crit_edge1.loopexit19:                          ; preds = %.preheader.lr.ph
  %74 = add i32 %.promoted, 1
  %75 = icmp sgt i32 %53, %74
  %smax = select i1 %75, i32 %53, i32 %74
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit19, %._crit_edge1.loopexit
  %.lcssa12 = phi i32 [ %73, %._crit_edge1.loopexit ], [ %smax, %._crit_edge1.loopexit19 ]
  store i32 %.lcssa12, i32* %9, align 4
  br label %76

; <label>:76:                                     ; preds = %42, %._crit_edge1
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %78 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %80 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %79) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
