; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  %18 = load i32, i32* %5, align 4
  %19 = load i32, i32* %6, align 4
  %20 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %21 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %20, i64 0, i64 0
  %22 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %23 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %22, i64 0, i64 0
  %24 = bitcast i8* %16 to [1200 x double]*
  call fastcc void @init_array(i32 %18, i32 %19, double* nonnull %7, double* nonnull %8, [1200 x double]* %21, [1000 x double]* %23, [1200 x double]* %24)
  call void (...) @polybench_timer_start() #4
  %25 = load i32, i32* %5, align 4
  %26 = load i32, i32* %6, align 4
  %27 = load double, double* %7, align 8
  %28 = load double, double* %8, align 8
  %29 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %30 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %29, i64 0, i64 0
  %31 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %32 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %31, i64 0, i64 0
  %33 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %34 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %33, i64 0, i64 0
  call fastcc void @kernel_symm(i32 %25, i32 %26, double %27, double %28, [1200 x double]* %30, [1000 x double]* %32, [1200 x double]* %34)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %35 = load i32, i32* %3, align 4
  %36 = icmp sgt i32 %35, 42
  br i1 %36, label %37, label %46

; <label>:37:                                     ; preds = %2
  %38 = load i8**, i8*** %4, align 8
  %39 = load i8*, i8** %38, align 8
  %strcmpload = load i8, i8* %39, align 1
  %40 = icmp eq i8 %strcmpload, 0
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %37
  %42 = load i32, i32* %5, align 4
  %43 = load i32, i32* %6, align 4
  %44 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %45 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %44, i64 0, i64 0
  call fastcc void @print_array(i32 %42, i32 %43, [1200 x double]* %45)
  br label %46

; <label>:46:                                     ; preds = %37, %41, %2
  %47 = bitcast [1000 x [1200 x double]]** %9 to i8**
  %48 = load i8*, i8** %47, align 8
  call void @free(i8* %48) #4
  %49 = bitcast [1000 x [1000 x double]]** %10 to i8**
  %50 = load i8*, i8** %49, align 8
  call void @free(i8* %50) #4
  %51 = bitcast [1000 x [1200 x double]]** %11 to i8**
  %52 = load i8*, i8** %51, align 8
  call void @free(i8* %52) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
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
  %14 = load i32, i32* %8, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.preheader7.lr.ph, label %.preheader6.thread

.preheader6.thread:                               ; preds = %7
  store i32 0, i32* %13, align 4
  br label %94

.preheader7.lr.ph:                                ; preds = %7
  %16 = load i32, i32* %9, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = load i32, i32* %8, align 4
  %19 = sitofp i32 %18 to double
  %20 = load [1200 x double]*, [1200 x double]** %10, align 8
  %21 = sitofp i32 %18 to double
  %22 = load [1200 x double]*, [1200 x double]** %12, align 8
  br i1 %17, label %.preheader7.us.preheader, label %.preheader6

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %.promoted26 = load i32, i32* %13, align 4
  %23 = load i32, i32* %9, align 4
  %24 = sext i32 %23 to i64
  %25 = sext i32 %.promoted26 to i64
  %26 = zext i32 %16 to i64
  %27 = sext i32 %18 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge22.us
  %indvars.iv44 = phi i64 [ %25, %.preheader7.us.preheader ], [ %indvars.iv.next45, %._crit_edge22.us ]
  %28 = add i64 %indvars.iv44, %26
  %29 = trunc i64 %28 to i32
  br label %30

; <label>:30:                                     ; preds = %.preheader7.us, %30
  %indvars.iv42 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next43, %30 ]
  %31 = add nsw i64 %indvars.iv44, %indvars.iv42
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %19
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv44, i64 %indvars.iv42
  store double %35, double* %36, align 8
  %37 = trunc i64 %indvars.iv42 to i32
  %38 = sub i32 %29, %37
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %21
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv44, i64 %indvars.iv42
  store double %41, double* %42, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %43 = icmp slt i64 %indvars.iv.next43, %24
  br i1 %43, label %30, label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %30
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %44 = icmp slt i64 %indvars.iv.next45, %27
  br i1 %44, label %.preheader7.us, label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader7.lr.ph
  %.pr = load i32, i32* %8, align 4
  store i32 0, i32* %13, align 4
  %45 = icmp sgt i32 %.pr, 0
  br i1 %45, label %.preheader5.lr.ph, label %94

.preheader5.lr.ph:                                ; preds = %.preheader6
  %46 = load i32, i32* %8, align 4
  %47 = load [1000 x double]*, [1000 x double]** %11, align 8
  %48 = sitofp i32 %46 to double
  %.promoted = load i32, i32* %13, align 4
  %49 = add i32 %.promoted, 1
  %50 = sext i32 %49 to i64
  %51 = sext i32 %.promoted to i64
  %52 = sext i32 %46 to i64
  %53 = sext i32 %46 to i64
  %54 = add i32 %46, 7
  %55 = sub i32 %54, %.promoted
  %56 = add i32 %46, -2
  %57 = sub i32 %56, %.promoted
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %._crit_edge
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %indvar.next, %._crit_edge ]
  %indvars.iv40 = phi i64 [ %51, %.preheader5.lr.ph ], [ %indvars.iv.next41, %._crit_edge ]
  %indvars.iv35 = phi i64 [ %50, %.preheader5.lr.ph ], [ %indvars.iv.next36, %._crit_edge ]
  %indvars.iv33 = phi i32 [ %49, %.preheader5.lr.ph ], [ %indvars.iv.next34, %._crit_edge ]
  %58 = sub i32 %55, %indvar
  %59 = sub i32 %57, %indvar
  %60 = icmp slt i64 %indvars.iv40, 0
  br i1 %60, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %61 = add i32 %49, %indvar
  %xtraiter = and i32 %61, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %62 = trunc i64 %indvars.iv40 to i32
  %63 = srem i32 %62, 100
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %64, %48
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 0
  store double %65, double* %66, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %67 = sub i32 0, %indvar
  %68 = icmp eq i32 %.promoted, %67
  br i1 %68, label %.preheader, label %.lr.ph.preheader48

.lr.ph.preheader48:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv33 to i64
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph.prol.loopexit, %.preheader5
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %69 = icmp slt i64 %indvars.iv.next41, %53
  br i1 %69, label %.lr.ph13, label %._crit_edge

.lr.ph13:                                         ; preds = %.preheader
  %xtraiter46 = and i32 %58, 7
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader ], [ %indvars.iv35, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter46, %.prol.preheader.preheader ]
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph13
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph13 ], [ %indvars.iv.next38.prol, %.prol.loopexit.loopexit ]
  %71 = icmp ult i32 %59, 7
  br i1 %71, label %._crit_edge, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph13.new

.lr.ph:                                           ; preds = %.lr.ph.preheader48, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader48 ]
  %72 = add nsw i64 %indvars.iv40, %indvars.iv
  %73 = trunc i64 %72 to i32
  %74 = srem i32 %73, 100
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %75, %48
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv
  store double %76, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %78 = add nsw i64 %indvars.iv40, %indvars.iv.next
  %79 = trunc i64 %78 to i32
  %80 = srem i32 %79, 100
  %81 = sitofp i32 %80 to double
  %82 = fdiv double %81, %48
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %82, double* %83, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader, %.lr.ph13.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph13.new ], [ %indvars.iv37.unr, %.lr.ph13.new.preheader ]
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv37
  store double -9.990000e+02, double* %84, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %85, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %86, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %87, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %88, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %89, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %90, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %91, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond39.7 = icmp eq i32 %lftr.wideiv.7, %46
  br i1 %exitcond39.7, label %._crit_edge.loopexit, label %.lr.ph13.new

._crit_edge.loopexit:                             ; preds = %.lr.ph13.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %92 = icmp slt i64 %indvars.iv.next41, %52
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %92, label %.preheader5, label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge
  %93 = trunc i64 %indvars.iv.next41 to i32
  store i32 %93, i32* %13, align 4
  br label %94

; <label>:94:                                     ; preds = %.preheader6.thread, %._crit_edge16, %.preheader6
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
  %18 = load i32, i32* %8, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.preheader.lr.ph, label %108

.preheader.lr.ph:                                 ; preds = %7
  %20 = load i32, i32* %9, align 4
  %21 = icmp sgt i32 %20, 0
  %22 = load double, double* %11, align 8
  %23 = load [1200 x double]*, [1200 x double]** %12, align 8
  %24 = load double, double* %10, align 8
  %25 = load [1200 x double]*, [1200 x double]** %14, align 8
  %26 = load [1000 x double]*, [1000 x double]** %13, align 8
  %27 = load i32, i32* %9, align 4
  %28 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %16, align 4
  %.promoted18 = load i32, i32* %15, align 4
  %.promoted20 = load double, double* %17, align 8
  %29 = sext i32 %27 to i64
  %30 = sext i32 %27 to i64
  %31 = sext i32 %.promoted18 to i64
  %32 = sext i32 %28 to i64
  %33 = fmul double %24, 0.000000e+00
  %34 = icmp sgt i64 %30, 1
  %smax = select i1 %34, i64 %30, i64 1
  %35 = icmp sgt i64 %30, 1
  %smax41 = select i1 %35, i64 %30, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %24, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %33, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge8
  %indvar = phi i64 [ 0, %.preheader.lr.ph ], [ %indvar.next, %._crit_edge8 ]
  %indvars.iv36 = phi i64 [ %31, %.preheader.lr.ph ], [ %indvars.iv.next37, %._crit_edge8 ]
  %indvars.iv34 = phi i32 [ %.promoted18, %.preheader.lr.ph ], [ %indvars.iv.next35, %._crit_edge8 ]
  %.lcssa613.lcssa21 = phi double [ %.promoted20, %.preheader.lr.ph ], [ %.lcssa613.lcssa22, %._crit_edge8 ]
  %.lcssa412.lcssa16 = phi i32 [ %.promoted, %.preheader.lr.ph ], [ %.lcssa412.lcssa17, %._crit_edge8 ]
  %36 = add i64 %31, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %23, i64 %36, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %23, i64 %36, i64 %smax41
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %25, i64 %36, i64 0
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %25, i64 %36, i64 %smax41
  br i1 %21, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %.preheader
  %37 = icmp sgt i64 %indvars.iv36, 0
  br i1 %37, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.lr.ph7
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv36, i64 %indvars.iv36
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
  %bound049 = icmp ult double* %scevgep, %38
  %bound150 = icmp ult double* %38, %scevgep42
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx = or i1 %found.conflict, %found.conflict51
  br i1 %conflict.rdx, label %.lr.ph7.split.preheader62, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %39 = load double, double* %38, align 8, !alias.scope !3
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = insertelement <2 x double> undef, double %39, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv36, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %48 = fmul <2 x double> %broadcast.splat55, %wide.load
  %49 = fmul <2 x double> %broadcast.splat55, %wide.load53
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv36, i64 %index
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = fmul <2 x double> %broadcast.splat59, %wide.load56
  %55 = fmul <2 x double> %broadcast.splat59, %wide.load57
  %56 = fmul <2 x double> %54, %41
  %57 = fmul <2 x double> %55, %43
  %58 = fadd <2 x double> %48, %56
  %59 = fadd <2 x double> %49, %57
  %60 = fadd <2 x double> %58, %broadcast.splat61
  %61 = fadd <2 x double> %59, %broadcast.splat61
  %62 = bitcast double* %44 to <2 x double>*
  store <2 x double> %60, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  %63 = bitcast double* %46 to <2 x double>*
  store <2 x double> %61, <2 x double>* %63, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge8, label %.lr.ph7.split.preheader62

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv36, i64 %indvars.iv36
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv32
  br label %67

; <label>:67:                                     ; preds = %67, %.lr.ph7.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next27, %67 ]
  %68 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %82, %67 ]
  %69 = load double, double* %66, align 8
  %70 = fmul double %24, %69
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv36, i64 %indvars.iv26
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv26, i64 %indvars.iv32
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  store double %76, double* %74, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv26, i64 %indvars.iv32
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv36, i64 %indvars.iv26
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %68, %81
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %67

._crit_edge.us:                                   ; preds = %67
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv36, i64 %indvars.iv32
  %84 = load double, double* %83, align 8
  %85 = fmul double %22, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv32
  %87 = load double, double* %86, align 8
  %88 = fmul double %24, %87
  %89 = load double, double* %65, align 8
  %90 = fmul double %88, %89
  %91 = fadd double %85, %90
  %92 = fmul double %24, %82
  %93 = fadd double %91, %92
  store double %93, double* %83, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %94 = icmp slt i64 %indvars.iv.next33, %30
  br i1 %94, label %.lr.ph7.split.us, label %._crit_edge8.loopexit

.lr.ph7.split:                                    ; preds = %.lr.ph7.split.preheader62, %.lr.ph7.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph7.split ], [ %indvars.iv.ph, %.lr.ph7.split.preheader62 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv36, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = fmul double %22, %96
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv
  %99 = load double, double* %98, align 8
  %100 = fmul double %24, %99
  %101 = load double, double* %38, align 8
  %102 = fmul double %100, %101
  %103 = fadd double %97, %102
  %104 = fadd double %103, %33
  store double %104, double* %95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %105 = icmp slt i64 %indvars.iv.next, %29
  br i1 %105, label %.lr.ph7.split, label %._crit_edge8.loopexit63, !llvm.loop !14

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit63:                          ; preds = %.lr.ph7.split
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit63, %._crit_edge8.loopexit, %middle.block, %.preheader
  %.lcssa613.lcssa22 = phi double [ %.lcssa613.lcssa21, %.preheader ], [ 0.000000e+00, %middle.block ], [ %82, %._crit_edge8.loopexit ], [ 0.000000e+00, %._crit_edge8.loopexit63 ]
  %.lcssa412.lcssa17 = phi i32 [ %.lcssa412.lcssa16, %.preheader ], [ 0, %middle.block ], [ %indvars.iv34, %._crit_edge8.loopexit ], [ 0, %._crit_edge8.loopexit63 ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %106 = icmp slt i64 %indvars.iv.next37, %32
  %indvar.next = add i64 %indvar, 1
  br i1 %106, label %.preheader, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge8
  %107 = trunc i64 %indvars.iv.next37 to i32
  store i32 %.lcssa412.lcssa17, i32* %16, align 4
  store i32 %107, i32* %15, align 4
  store double %.lcssa613.lcssa22, double* %17, align 8
  br label %108

; <label>:108:                                    ; preds = %._crit_edge14, %7
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
  %12 = load i32, i32* %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader.lr.ph, label %38

.preheader.lr.ph:                                 ; preds = %3
  %14 = load i32, i32* %5, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = load i32, i32* %4, align 4
  %17 = load [1200 x double]*, [1200 x double]** %6, align 8
  %.promoted5 = load i32, i32* %7, align 4
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge4.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %18 = sext i32 %.promoted5 to i64
  %19 = sext i32 %16 to i64
  %20 = sext i32 %16 to i64
  %wide.trip.count = zext i32 %14 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %18, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %21 = mul nsw i64 %19, %indvars.iv11
  br label %22

; <label>:22:                                     ; preds = %29, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %29 ]
  %23 = add nsw i64 %21, %indvars.iv
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 20
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %22
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %28) #5
  br label %29

; <label>:29:                                     ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i64 %indvars.iv11, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %22

._crit_edge.us:                                   ; preds = %29
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %34 = icmp slt i64 %indvars.iv.next12, %20
  br i1 %34, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %35 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge4

._crit_edge4.loopexit9:                           ; preds = %.preheader.lr.ph
  %36 = add i32 %.promoted5, 1
  %37 = icmp sgt i32 %16, %36
  %smax = select i1 %37, i32 %16, i32 %36
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit9, %._crit_edge4.loopexit
  %.lcssa6 = phi i32 [ %35, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit9 ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %38

; <label>:38:                                     ; preds = %._crit_edge4, %3
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
