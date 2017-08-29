; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
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
  %24 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %25 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %24, i64 0, i64 0
  call void @init_array(i32 %18, i32 %19, double* nonnull %7, double* nonnull %8, [1200 x double]* %21, [1000 x double]* %23, [1200 x double]* %25)
  call void (...) @polybench_timer_start() #4
  %26 = load i32, i32* %5, align 4
  %27 = load i32, i32* %6, align 4
  %28 = load double, double* %7, align 8
  %29 = load double, double* %8, align 8
  %30 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %31 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %30, i64 0, i64 0
  %32 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %33 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %32, i64 0, i64 0
  %34 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %35 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %34, i64 0, i64 0
  call void @kernel_symm(i32 %26, i32 %27, double %28, double %29, [1200 x double]* %31, [1000 x double]* %33, [1200 x double]* %35)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %36 = load i32, i32* %3, align 4
  %37 = icmp sgt i32 %36, 42
  br i1 %37, label %38, label %47

; <label>:38:                                     ; preds = %2
  %39 = load i8**, i8*** %4, align 8
  %40 = load i8*, i8** %39, align 8
  %strcmpload = load i8, i8* %40, align 1
  %41 = icmp eq i8 %strcmpload, 0
  br i1 %41, label %42, label %47

; <label>:42:                                     ; preds = %38
  %43 = load i32, i32* %5, align 4
  %44 = load i32, i32* %6, align 4
  %45 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %46 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %45, i64 0, i64 0
  call void @print_array(i32 %43, i32 %44, [1200 x double]* %46)
  br label %47

; <label>:47:                                     ; preds = %38, %42, %2
  %48 = bitcast [1000 x [1200 x double]]** %9 to i8**
  %49 = load i8*, i8** %48, align 8
  call void @free(i8* %49) #4
  %50 = bitcast [1000 x [1000 x double]]** %10 to i8**
  %51 = load i8*, i8** %50, align 8
  call void @free(i8* %51) #4
  %52 = bitcast [1000 x [1200 x double]]** %11 to i8**
  %53 = load i8*, i8** %52, align 8
  call void @free(i8* %53) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
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
  %.promoted25 = load i32, i32* %13, align 4
  %23 = load i32, i32* %9, align 4
  %24 = sext i32 %23 to i64
  %25 = sext i32 %.promoted25 to i64
  %26 = zext i32 %16 to i64
  %27 = sext i32 %18 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge19.us
  %indvars.iv46 = phi i64 [ %25, %.preheader7.us.preheader ], [ %indvars.iv.next47, %._crit_edge19.us ]
  %28 = add i64 %indvars.iv46, %26
  %29 = trunc i64 %28 to i32
  br label %30

; <label>:30:                                     ; preds = %.preheader7.us, %30
  %indvars.iv44 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next45, %30 ]
  %31 = add nsw i64 %indvars.iv44, %indvars.iv46
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %19
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv44
  store double %35, double* %36, align 8
  %37 = trunc i64 %indvars.iv44 to i32
  %38 = sub i32 %29, %37
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %21
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv46, i64 %indvars.iv44
  store double %41, double* %42, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %43 = icmp slt i64 %indvars.iv.next45, %24
  br i1 %43, label %30, label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %30
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %44 = icmp slt i64 %indvars.iv.next47, %27
  br i1 %44, label %.preheader7.us, label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %._crit_edge19.us
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
  %51 = add i32 %46, 7
  %52 = sub i32 %51, %.promoted
  %53 = add i32 %46, -2
  %54 = sub i32 %53, %.promoted
  %55 = sext i32 %.promoted to i64
  %56 = sext i32 %46 to i64
  %57 = sext i32 %46 to i64
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %._crit_edge
  %indvars.iv42 = phi i64 [ %55, %.preheader5.lr.ph ], [ %indvars.iv.next43, %._crit_edge ]
  %indvars.iv32 = phi i64 [ %50, %.preheader5.lr.ph ], [ %indvars.iv.next33, %._crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %indvar.next, %._crit_edge ]
  %indvars.iv30 = phi i32 [ %49, %.preheader5.lr.ph ], [ %indvars.iv.next31, %._crit_edge ]
  %58 = sub i32 %52, %indvar
  %59 = sub i32 %54, %indvar
  %60 = icmp slt i64 %indvars.iv42, 0
  br i1 %60, label %.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %61 = add i32 %49, %indvar
  %xtraiter = and i32 %61, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %62 = trunc i64 %indvars.iv42 to i32
  %63 = srem i32 %62, 100
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %64, %48
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 0
  store double %65, double* %66, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %67 = sub i32 0, %indvar
  %68 = icmp eq i32 %.promoted, %67
  br i1 %68, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv30 to i64
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit, %.preheader5
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, 1
  %69 = icmp slt i64 %indvars.iv.next43, %57
  br i1 %69, label %.lr.ph11, label %._crit_edge

.lr.ph11:                                         ; preds = %.preheader
  %xtraiter38 = and i32 %58, 7
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.prol.loopexit37, label %.prol.preheader36.preheader

.prol.preheader36.preheader:                      ; preds = %.lr.ph11
  br label %.prol.preheader36

.prol.preheader36:                                ; preds = %.prol.preheader36.preheader, %.prol.preheader36
  %indvars.iv34.prol = phi i64 [ %indvars.iv.next35.prol, %.prol.preheader36 ], [ %indvars.iv32, %.prol.preheader36.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader36 ], [ %xtraiter38, %.prol.preheader36.preheader ]
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv34.prol
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next35.prol = add nsw i64 %indvars.iv34.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit37.loopexit, label %.prol.preheader36, !llvm.loop !1

.prol.loopexit37.loopexit:                        ; preds = %.prol.preheader36
  br label %.prol.loopexit37

.prol.loopexit37:                                 ; preds = %.prol.loopexit37.loopexit, %.lr.ph11
  %indvars.iv34.unr = phi i64 [ %indvars.iv32, %.lr.ph11 ], [ %indvars.iv.next35.prol, %.prol.loopexit37.loopexit ]
  %71 = icmp ult i32 %59, 7
  br i1 %71, label %._crit_edge, label %.lr.ph11.new.preheader

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit37
  br label %.lr.ph11.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %72 = add nsw i64 %indvars.iv, %indvars.iv42
  %73 = trunc i64 %72 to i32
  %74 = srem i32 %73, 100
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %75, %48
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv
  store double %76, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %78 = add nsw i64 %indvars.iv.next, %indvars.iv42
  %79 = trunc i64 %78 to i32
  %80 = srem i32 %79, 100
  %81 = sitofp i32 %80 to double
  %82 = fdiv double %81, %48
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next
  store double %82, double* %83, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new.preheader, %.lr.ph11.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.7, %.lr.ph11.new ], [ %indvars.iv34.unr, %.lr.ph11.new.preheader ]
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv34
  store double -9.990000e+02, double* %84, align 8
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next35
  store double -9.990000e+02, double* %85, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next35.1
  store double -9.990000e+02, double* %86, align 8
  %indvars.iv.next35.2 = add nsw i64 %indvars.iv34, 3
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next35.2
  store double -9.990000e+02, double* %87, align 8
  %indvars.iv.next35.3 = add nsw i64 %indvars.iv34, 4
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next35.3
  store double -9.990000e+02, double* %88, align 8
  %indvars.iv.next35.4 = add nsw i64 %indvars.iv34, 5
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next35.4
  store double -9.990000e+02, double* %89, align 8
  %indvars.iv.next35.5 = add nsw i64 %indvars.iv34, 6
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next35.5
  store double -9.990000e+02, double* %90, align 8
  %indvars.iv.next35.6 = add nsw i64 %indvars.iv34, 7
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv42, i64 %indvars.iv.next35.6
  store double -9.990000e+02, double* %91, align 8
  %indvars.iv.next35.7 = add nsw i64 %indvars.iv34, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next35.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %46
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph11.new

._crit_edge.loopexit:                             ; preds = %.lr.ph11.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit37, %.preheader
  %92 = icmp slt i64 %indvars.iv.next43, %56
  %indvars.iv.next31 = add i32 %indvars.iv30, 1
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  br i1 %92, label %.preheader5, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge
  %93 = trunc i64 %indvars.iv.next43 to i32
  store i32 %93, i32* %13, align 4
  br label %94

; <label>:94:                                     ; preds = %.preheader6.thread, %._crit_edge14, %.preheader6
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
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
  br i1 %19, label %.preheader.lr.ph, label %109

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
  %.promoted = load i32, i32* %15, align 4
  %.promoted16 = load i32, i32* %16, align 4
  %.promoted19 = load double, double* %17, align 8
  %29 = sext i32 %27 to i64
  %30 = sext i32 %27 to i64
  %31 = sext i32 %.promoted to i64
  %32 = sext i32 %28 to i64
  %33 = fmul double %24, 0.000000e+00
  %34 = icmp sgt i64 %30, 1
  %smax = select i1 %34, i64 %30, i64 1
  %35 = icmp sgt i64 %30, 1
  %smax40 = select i1 %35, i64 %30, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert53 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat54 = shufflevector <2 x double> %broadcast.splatinsert53, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert57 = insertelement <2 x double> undef, double %24, i32 0
  %broadcast.splat58 = shufflevector <2 x double> %broadcast.splatinsert57, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %33, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge6
  %indvar = phi i64 [ 0, %.preheader.lr.ph ], [ %indvar.next, %._crit_edge6 ]
  %indvars.iv35 = phi i64 [ %31, %.preheader.lr.ph ], [ %indvars.iv.next36, %._crit_edge6 ]
  %indvars.iv33 = phi i32 [ %.promoted, %.preheader.lr.ph ], [ %indvars.iv.next34, %._crit_edge6 ]
  %.lcssa411.lcssa20 = phi double [ %.promoted19, %.preheader.lr.ph ], [ %.lcssa411.lcssa21, %._crit_edge6 ]
  %.lcssa10.lcssa17 = phi i32 [ %.promoted16, %.preheader.lr.ph ], [ %.lcssa10.lcssa18, %._crit_edge6 ]
  %36 = add i64 %31, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %23, i64 %36, i64 0
  %scevgep41 = getelementptr [1200 x double], [1200 x double]* %23, i64 %36, i64 %smax40
  %scevgep43 = getelementptr [1200 x double], [1200 x double]* %25, i64 %36, i64 0
  %scevgep45 = getelementptr [1200 x double], [1200 x double]* %25, i64 %36, i64 %smax40
  br i1 %21, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %37 = icmp sgt i64 %indvars.iv35, 0
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv35, i64 %indvars.iv35
  br i1 %37, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  br i1 %min.iters.check, label %.lr.ph5.split.preheader61, label %min.iters.checked

.lr.ph5.split.preheader61:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph5.split.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph5.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph5.split

min.iters.checked:                                ; preds = %.lr.ph5.split.preheader
  br i1 %cmp.zero, label %.lr.ph5.split.preheader61, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %found.conflict = and i1 %bound0, %bound1
  %bound048 = icmp ult double* %scevgep, %38
  %bound149 = icmp ult double* %38, %scevgep41
  %found.conflict50 = and i1 %bound048, %bound149
  %conflict.rdx = or i1 %found.conflict, %found.conflict50
  br i1 %conflict.rdx, label %.lr.ph5.split.preheader61, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv35, i64 %index
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !3, !noalias !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !3, !noalias !6
  %43 = fmul <2 x double> %broadcast.splat54, %wide.load
  %44 = fmul <2 x double> %broadcast.splat54, %wide.load52
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv35, i64 %index
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !9
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !9
  %49 = fmul <2 x double> %broadcast.splat58, %wide.load55
  %50 = fmul <2 x double> %broadcast.splat58, %wide.load56
  %51 = load double, double* %38, align 8, !alias.scope !10
  %52 = insertelement <2 x double> undef, double %51, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = insertelement <2 x double> undef, double %51, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = fmul <2 x double> %49, %53
  %57 = fmul <2 x double> %50, %55
  %58 = fadd <2 x double> %43, %56
  %59 = fadd <2 x double> %44, %57
  %60 = fadd <2 x double> %58, %broadcast.splat60
  %61 = fadd <2 x double> %59, %broadcast.splat60
  %62 = bitcast double* %39 to <2 x double>*
  store <2 x double> %60, <2 x double>* %62, align 8, !alias.scope !3, !noalias !6
  %63 = bitcast double* %41 to <2 x double>*
  store <2 x double> %61, <2 x double>* %63, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge6, label %.lr.ph5.split.preheader61

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %wide.trip.count = zext i32 %indvars.iv33 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv35, i64 %indvars.iv31
  br label %66

; <label>:66:                                     ; preds = %66, %.lr.ph5.split.us
  %indvars.iv25 = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next26, %66 ]
  %67 = phi double [ 0.000000e+00, %.lr.ph5.split.us ], [ %81, %66 ]
  %68 = load double, double* %65, align 8
  %69 = fmul double %24, %68
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv35, i64 %indvars.iv25
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv25, i64 %indvars.iv31
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  store double %75, double* %73, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv25, i64 %indvars.iv31
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv35, i64 %indvars.iv25
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %67, %80
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %66

._crit_edge.us:                                   ; preds = %66
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv35, i64 %indvars.iv31
  %83 = load double, double* %82, align 8
  %84 = fmul double %22, %83
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv35, i64 %indvars.iv31
  %86 = load double, double* %85, align 8
  %87 = fmul double %24, %86
  %88 = load double, double* %38, align 8
  %89 = fmul double %87, %88
  %90 = fadd double %84, %89
  %91 = fmul double %24, %81
  %92 = fadd double %90, %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv35, i64 %indvars.iv31
  store double %92, double* %93, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %94 = icmp slt i64 %indvars.iv.next32, %30
  br i1 %94, label %.lr.ph5.split.us, label %._crit_edge6.loopexit

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader61, %.lr.ph5.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph5.split ], [ %indvars.iv.ph, %.lr.ph5.split.preheader61 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv35, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = fmul double %22, %96
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv35, i64 %indvars.iv
  %99 = load double, double* %98, align 8
  %100 = fmul double %24, %99
  %101 = load double, double* %38, align 8
  %102 = fmul double %100, %101
  %103 = fadd double %97, %102
  %104 = fadd double %103, %33
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %indvars.iv35, i64 %indvars.iv
  store double %104, double* %105, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %106 = icmp slt i64 %indvars.iv.next, %29
  br i1 %106, label %.lr.ph5.split, label %._crit_edge6.loopexit62, !llvm.loop !14

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6.loopexit62:                          ; preds = %.lr.ph5.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit62, %._crit_edge6.loopexit, %middle.block, %.preheader
  %.lcssa411.lcssa21 = phi double [ %.lcssa411.lcssa20, %.preheader ], [ 0.000000e+00, %middle.block ], [ %81, %._crit_edge6.loopexit ], [ 0.000000e+00, %._crit_edge6.loopexit62 ]
  %.lcssa10.lcssa18 = phi i32 [ %.lcssa10.lcssa17, %.preheader ], [ 0, %middle.block ], [ %indvars.iv33, %._crit_edge6.loopexit ], [ 0, %._crit_edge6.loopexit62 ]
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %107 = icmp slt i64 %indvars.iv.next36, %32
  %indvar.next = add i64 %indvar, 1
  br i1 %107, label %.preheader, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge6
  %108 = trunc i64 %indvars.iv.next36 to i32
  store i32 %108, i32* %15, align 4
  store i32 %.lcssa10.lcssa18, i32* %16, align 4
  store double %.lcssa411.lcssa21, double* %17, align 8
  br label %109

; <label>:109:                                    ; preds = %._crit_edge12, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
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
  %.promoted = load i32, i32* %7, align 4
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge3.loopexit7

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %18 = sext i32 %.promoted to i64
  %19 = sext i32 %16 to i64
  %20 = sext i32 %16 to i64
  %wide.trip.count = zext i32 %14 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv9 = phi i64 [ %18, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %21 = mul nsw i64 %19, %indvars.iv9
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
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i64 %indvars.iv9, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %22

._crit_edge.us:                                   ; preds = %29
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %34 = icmp slt i64 %indvars.iv.next10, %20
  br i1 %34, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %35 = trunc i64 %indvars.iv.next10 to i32
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %.preheader.lr.ph
  %36 = add i32 %.promoted, 1
  %37 = icmp sgt i32 %16, %36
  %smax = select i1 %37, i32 %16, i32 %36
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %35, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit7 ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %38

; <label>:38:                                     ; preds = %._crit_edge3, %3
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
