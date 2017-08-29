; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %9 = alloca [1000 x [1200 x double]]*, align 8
  %10 = alloca [1000 x [1000 x double]]*, align 8
  %11 = alloca [1000 x [1200 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1000, i32* %5, align 4
  store i32 1200, i32* %6, align 4
  %12 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %13 = bitcast [1000 x [1200 x double]]** %9 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %15 = bitcast [1000 x [1000 x double]]** %10 to i8**
  store i8* %14, i8** %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %17 = bitcast [1000 x [1200 x double]]** %11 to i8**
  store i8* %16, i8** %17, align 8
  %18 = ptrtoint i8* %12 to i64
  %19 = inttoptr i64 %18 to [1000 x [1200 x double]]*
  %20 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %19, i64 0, i64 0
  %21 = ptrtoint i8* %14 to i64
  %22 = inttoptr i64 %21 to [1000 x [1000 x double]]*
  %23 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %22, i64 0, i64 0
  %24 = bitcast i8* %16 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %7, double* nonnull %8, [1200 x double]* %20, [1000 x double]* %23, [1200 x double]* %24)
  call void (...) @polybench_timer_start() #4
  %25 = load double, double* %7, align 8
  %26 = load double, double* %8, align 8
  %27 = ptrtoint i8* %16 to i64
  %28 = inttoptr i64 %27 to [1000 x [1200 x double]]*
  %29 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %28, i64 0, i64 0
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %25, double %26, [1200 x double]* %20, [1000 x double]* %23, [1200 x double]* %29)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %30 = icmp sgt i32 %0, 42
  br i1 %30, label %31, label %35

; <label>:31:                                     ; preds = %2
  %32 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %32, align 1
  %33 = icmp eq i8 %strcmpload, 0
  br i1 %33, label %34, label %35

; <label>:34:                                     ; preds = %31
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %20)
  br label %35

; <label>:35:                                     ; preds = %31, %34, %2
  call void @free(i8* %12) #4
  call void @free(i8* %14) #4
  call void @free(i8* %16) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca [1000 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store [1000 x double]* %5, [1000 x double]** %11, align 8
  store [1200 x double]* %6, [1200 x double]** %12, align 8
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  store i32 0, i32* %13, align 4
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.preheader7.lr.ph, label %.preheader6.thread

.preheader6.thread:                               ; preds = %7
  store i32 0, i32* %13, align 4
  br label %80

.preheader7.lr.ph:                                ; preds = %7
  %15 = icmp sgt i32 %1, 0
  %16 = sitofp i32 %0 to double
  br i1 %15, label %.preheader7.us.preheader, label %.preheader6

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %17 = sext i32 %1 to i64
  %18 = zext i32 %1 to i64
  %19 = sext i32 %0 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge22.us
  %indvars.iv44 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next45, %._crit_edge22.us ]
  %20 = add i64 %indvars.iv44, %18
  %21 = trunc i64 %20 to i32
  br label %22

; <label>:22:                                     ; preds = %.preheader7.us, %22
  %indvars.iv42 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next43, %22 ]
  %23 = add nsw i64 %indvars.iv44, %indvars.iv42
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %16
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv42
  store double %27, double* %28, align 8
  %29 = trunc i64 %indvars.iv42 to i32
  %30 = sub i32 %21, %29
  %31 = srem i32 %30, 100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %16
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv44, i64 %indvars.iv42
  store double %33, double* %34, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %35 = icmp slt i64 %indvars.iv.next43, %17
  br i1 %35, label %22, label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %22
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %36 = icmp slt i64 %indvars.iv.next45, %19
  br i1 %36, label %.preheader7.us, label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader7.lr.ph
  store i32 0, i32* %13, align 4
  br i1 true, label %.preheader5.lr.ph, label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6
  br label %80

.preheader5.lr.ph:                                ; preds = %.preheader6
  %37 = sext i32 %0 to i64
  %38 = add i32 %0, 7
  %39 = add i32 %0, -2
  %40 = trunc i32 %38 to i3
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %._crit_edge
  %indvars.iv51 = phi i3 [ %40, %.preheader5.lr.ph ], [ %indvars.iv.next52, %._crit_edge ]
  %indvars.iv49 = phi i64 [ 2, %.preheader5.lr.ph ], [ %indvars.iv.next50, %._crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %47, %._crit_edge ]
  %indvars.iv40 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next41, %._crit_edge ]
  %indvars.iv35 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next36, %._crit_edge ]
  %indvars.iv33 = phi i32 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next34, %._crit_edge ]
  %41 = zext i3 %indvars.iv51 to i32
  %42 = add i32 %41, -1
  %43 = zext i32 %42 to i64
  %44 = add i64 %indvars.iv49, %43
  %45 = sub i32 %38, %indvar
  %46 = sub i32 %39, %indvar
  %47 = add i32 1, %indvar
  %48 = icmp slt i64 %indvars.iv40, 0
  br i1 %48, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %49 = and i32 %47, 1
  %lcmp.mod = icmp eq i32 %49, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %50 = trunc i64 %indvars.iv40 to i32
  %51 = srem i32 %50, 100
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %16
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 0
  store double %53, double* %54, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %55 = icmp eq i32 %47, 1
  br i1 %55, label %.preheader, label %.lr.ph.preheader48

.lr.ph.preheader48:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv33 to i64
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph.prol.loopexit, %.preheader5
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %56 = icmp slt i64 %indvars.iv.next41, %37
  br i1 %56, label %.lr.ph13, label %._crit_edge

.lr.ph13:                                         ; preds = %.preheader
  %xtraiter46 = and i32 %45, 7
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader ], [ %indvars.iv35, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter46, %.prol.preheader.preheader ]
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %57, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph13
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph13 ], [ %44, %.prol.loopexit.loopexit ]
  %58 = icmp ult i32 %46, 7
  br i1 %58, label %._crit_edge, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph13.new

.lr.ph:                                           ; preds = %.lr.ph.preheader48, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader48 ]
  %59 = add nsw i64 %indvars.iv40, %indvars.iv
  %60 = trunc i64 %59 to i32
  %61 = srem i32 %60, 100
  %62 = sitofp i32 %61 to double
  %63 = fdiv double %62, %16
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv
  store double %63, double* %64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = add nsw i64 %indvars.iv40, %indvars.iv.next
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, 100
  %68 = sitofp i32 %67 to double
  %69 = fdiv double %68, %16
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %69, double* %70, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader, %.lr.ph13.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph13.new ], [ %indvars.iv37.unr, %.lr.ph13.new.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %73, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %74, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %75, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %76, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %77, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %78, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond39.7 = icmp eq i32 %lftr.wideiv.7, %0
  br i1 %exitcond39.7, label %._crit_edge.loopexit, label %.lr.ph13.new

._crit_edge.loopexit:                             ; preds = %.lr.ph13.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvars.iv.next50 = add i64 %indvars.iv49, 1
  %indvars.iv.next52 = add i3 %indvars.iv51, -1
  br i1 %56, label %.preheader5, label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge
  %79 = trunc i64 %indvars.iv.next41 to i32
  store i32 %79, i32* %13, align 4
  br label %80

; <label>:80:                                     ; preds = %.preheader6._crit_edge, %.preheader6.thread, %._crit_edge16
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1000 x double]*, align 8
  %14 = alloca [1200 x double]*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double %2, double* %10, align 8
  store double %3, double* %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1000 x double]* %5, [1000 x double]** %13, align 8
  store [1200 x double]* %6, [1200 x double]** %14, align 8
  store i32 0, i32* %15, align 4
  %18 = icmp sgt i32 %0, 0
  br i1 %18, label %.preheader.lr.ph, label %89

.preheader.lr.ph:                                 ; preds = %7
  %19 = icmp sgt i32 %1, 0
  %20 = sext i32 %1 to i64
  %21 = sext i32 %0 to i64
  %22 = fmul double %2, 0.000000e+00
  %23 = icmp sgt i64 %20, 1
  %smax = select i1 %23, i64 %20, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge8
  %indvar = phi i64 [ 0, %.preheader.lr.ph ], [ %indvar.next, %._crit_edge8 ]
  %indvars.iv36 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next37, %._crit_edge8 ]
  %indvars.iv34 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next35, %._crit_edge8 ]
  %.lcssa613.lcssa21 = phi double [ undef, %.preheader.lr.ph ], [ %.lcssa613.lcssa22, %._crit_edge8 ]
  %.lcssa412.lcssa16 = phi i32 [ undef, %.preheader.lr.ph ], [ %.lcssa412.lcssa17, %._crit_edge8 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 %smax
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 0
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 %smax
  br i1 %19, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %.preheader
  %24 = icmp sgt i64 %indvars.iv36, 0
  br i1 %24, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.lr.ph7
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  br i1 %min.iters.check, label %.lr.ph7.split.preheader62, label %min.iters.checked

.lr.ph7.split.preheader62:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph7.split.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph7.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph7.split

min.iters.checked:                                ; preds = %.lr.ph7.split.preheader
  br i1 %cmp.zero, label %.lr.ph7.split.preheader62, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %found.conflict = and i1 %bound0, %bound1
  %bound049 = icmp ult double* %scevgep, %25
  %bound150 = icmp ult double* %25, %scevgep42
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx = or i1 %found.conflict, %found.conflict51
  br i1 %conflict.rdx, label %.lr.ph7.split.preheader62, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %26 = load double, double* %25, align 8, !alias.scope !3
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %index
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !6, !noalias !8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !6, !noalias !8
  %33 = fmul <2 x double> %broadcast.splat55, %wide.load
  %34 = fmul <2 x double> %broadcast.splat55, %wide.load53
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %index
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !10
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !10
  %39 = fmul <2 x double> %broadcast.splat59, %wide.load56
  %40 = fmul <2 x double> %broadcast.splat59, %wide.load57
  %41 = fmul <2 x double> %39, %28
  %42 = fmul <2 x double> %40, %28
  %43 = fadd <2 x double> %33, %41
  %44 = fadd <2 x double> %34, %42
  %45 = fadd <2 x double> %43, %broadcast.splat61
  %46 = fadd <2 x double> %44, %broadcast.splat61
  store <2 x double> %45, <2 x double>* %30, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %46, <2 x double>* %32, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge8, label %.lr.ph7.split.preheader62

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv32
  br label %50

; <label>:50:                                     ; preds = %50, %.lr.ph7.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next27, %50 ]
  %51 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %64, %50 ]
  %52 = load double, double* %49, align 8
  %53 = fmul double %2, %52
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv26
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv32
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  store double %59, double* %57, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv32
  %61 = load double, double* %60, align 8
  %62 = load double, double* %54, align 8
  %63 = fmul double %61, %62
  %64 = fadd double %51, %63
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %50

._crit_edge.us:                                   ; preds = %50
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv32
  %66 = load double, double* %65, align 8
  %67 = fmul double %3, %66
  %68 = load double, double* %49, align 8
  %69 = fmul double %2, %68
  %70 = load double, double* %48, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %67, %71
  %73 = fmul double %2, %64
  %74 = fadd double %72, %73
  store double %74, double* %65, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %75 = icmp slt i64 %indvars.iv.next33, %20
  br i1 %75, label %.lr.ph7.split.us, label %._crit_edge8.loopexit

.lr.ph7.split:                                    ; preds = %.lr.ph7.split.preheader62, %.lr.ph7.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph7.split ], [ %indvars.iv.ph, %.lr.ph7.split.preheader62 ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv
  %77 = load double, double* %76, align 8
  %78 = fmul double %3, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = fmul double %2, %80
  %82 = load double, double* %25, align 8
  %83 = fmul double %81, %82
  %84 = fadd double %78, %83
  %85 = fadd double %84, %22
  store double %85, double* %76, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %86 = icmp slt i64 %indvars.iv.next, %20
  br i1 %86, label %.lr.ph7.split, label %._crit_edge8.loopexit63, !llvm.loop !14

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit63:                          ; preds = %.lr.ph7.split
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit63, %._crit_edge8.loopexit, %middle.block, %.preheader
  %.lcssa613.lcssa22 = phi double [ %.lcssa613.lcssa21, %.preheader ], [ 0.000000e+00, %middle.block ], [ %64, %._crit_edge8.loopexit ], [ 0.000000e+00, %._crit_edge8.loopexit63 ]
  %.lcssa412.lcssa17 = phi i32 [ %.lcssa412.lcssa16, %.preheader ], [ 0, %middle.block ], [ %indvars.iv34, %._crit_edge8.loopexit ], [ 0, %._crit_edge8.loopexit63 ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %87 = icmp slt i64 %indvars.iv.next37, %21
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %87, label %.preheader, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge8
  %88 = trunc i64 %indvars.iv.next37 to i32
  store i32 %.lcssa412.lcssa17, i32* %16, align 4
  store i32 %88, i32* %15, align 4
  store double %.lcssa613.lcssa22, double* %17, align 8
  br label %89

; <label>:89:                                     ; preds = %._crit_edge14, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %7, align 4
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader.lr.ph, label %31

.preheader.lr.ph:                                 ; preds = %3
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.preheader.us.preheader, label %._crit_edge4.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %14 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %15 = mul nsw i64 %14, %indvars.iv11
  br label %16

; <label>:16:                                     ; preds = %23, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %23 ]
  %17 = add nsw i64 %15, %indvars.iv
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 20
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %16
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %22) #5
  br label %23

; <label>:23:                                     ; preds = %21, %16
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %16

._crit_edge.us:                                   ; preds = %23
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %28 = icmp slt i64 %indvars.iv.next12, %14
  br i1 %28, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %29 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge4

._crit_edge4.loopexit9:                           ; preds = %.preheader.lr.ph
  %30 = icmp sgt i32 %0, 1
  %smax = select i1 %30, i32 %0, i32 1
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit9, %._crit_edge4.loopexit
  %.lcssa6 = phi i32 [ %29, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit9 ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %31

; <label>:31:                                     ; preds = %._crit_edge4, %3
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9, !4}
!9 = distinct !{!9, !5}
!10 = !{!9}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
