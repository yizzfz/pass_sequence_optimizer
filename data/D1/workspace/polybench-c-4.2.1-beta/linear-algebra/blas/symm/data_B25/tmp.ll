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
  %12 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %13 = bitcast [1000 x [1200 x double]]** %9 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %15 = bitcast [1000 x [1000 x double]]** %10 to i8**
  store i8* %14, i8** %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %17 = bitcast [1000 x [1200 x double]]** %11 to i8**
  store i8* %16, i8** %17, align 8
  %18 = load i32, i32* %5, align 4
  %19 = load i32, i32* %6, align 4
  %20 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %21 = load [1200 x double]*, [1200 x double]** %20, align 8
  %22 = bitcast [1000 x [1000 x double]]** %10 to [1000 x double]**
  %23 = load [1000 x double]*, [1000 x double]** %22, align 8
  %24 = bitcast [1000 x [1200 x double]]** %11 to [1200 x double]**
  %25 = load [1200 x double]*, [1200 x double]** %24, align 8
  call fastcc void @init_array(i32 %18, i32 %19, double* nonnull %7, double* nonnull %8, [1200 x double]* %21, [1000 x double]* %23, [1200 x double]* %25)
  call void (...) @polybench_timer_start() #3
  %26 = load i32, i32* %5, align 4
  %27 = load i32, i32* %6, align 4
  %28 = load double, double* %7, align 8
  %29 = load double, double* %8, align 8
  %30 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %31 = load [1200 x double]*, [1200 x double]** %30, align 8
  %32 = bitcast [1000 x [1000 x double]]** %10 to [1000 x double]**
  %33 = load [1000 x double]*, [1000 x double]** %32, align 8
  %34 = bitcast [1000 x [1200 x double]]** %11 to [1200 x double]**
  %35 = load [1200 x double]*, [1200 x double]** %34, align 8
  call fastcc void @kernel_symm(i32 %26, i32 %27, double %28, double %29, [1200 x double]* %31, [1000 x double]* %33, [1200 x double]* %35)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  %45 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %46 = load [1200 x double]*, [1200 x double]** %45, align 8
  call fastcc void @print_array(i32 %43, i32 %44, [1200 x double]* %46)
  br label %47

; <label>:47:                                     ; preds = %38, %42, %2
  %48 = bitcast [1000 x [1200 x double]]** %9 to i8**
  %49 = load i8*, i8** %48, align 8
  call void @free(i8* %49) #3
  %50 = bitcast [1000 x [1000 x double]]** %10 to i8**
  %51 = load i8*, i8** %50, align 8
  call void @free(i8* %51) #3
  %52 = bitcast [1000 x [1200 x double]]** %11 to i8**
  %53 = load i8*, i8** %52, align 8
  call void @free(i8* %53) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
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
  br label %95

.preheader7.lr.ph:                                ; preds = %7
  %16 = load i32, i32* %9, align 4
  %17 = zext i32 %16 to i64
  %18 = icmp sgt i32 %16, 0
  %19 = load i32, i32* %8, align 4
  %20 = sext i32 %19 to i64
  %21 = sitofp i32 %19 to double
  %22 = load [1200 x double]*, [1200 x double]** %10, align 8
  %23 = sitofp i32 %19 to double
  %24 = load [1200 x double]*, [1200 x double]** %12, align 8
  br i1 %18, label %.preheader7.lr.ph.split.us, label %.preheader6

.preheader7.lr.ph.split.us:                       ; preds = %.preheader7.lr.ph
  %.promoted25 = load i32, i32* %13, align 4
  %25 = sext i32 %.promoted25 to i64
  %26 = load i32, i32* %9, align 4
  %27 = sext i32 %26 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.lr.ph.split.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge19.us ], [ %25, %.preheader7.lr.ph.split.us ]
  %28 = add i64 %indvars.iv42, %17
  %29 = trunc i64 %28 to i32
  br label %30

; <label>:30:                                     ; preds = %.preheader7.us, %30
  %indvars.iv = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next, %30 ]
  %31 = add i64 %indvars.iv, %indvars.iv42
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %21
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv42, i64 %indvars.iv
  store double %35, double* %36, align 8
  %37 = sub nsw i64 0, %indvars.iv
  %38 = trunc i64 %37 to i32
  %39 = add i32 %29, %38
  %40 = srem i32 %39, 100
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %23
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv42, i64 %indvars.iv
  store double %42, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = icmp slt i64 %indvars.iv.next, %27
  br i1 %44, label %30, label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %30
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, 1
  %45 = icmp slt i64 %indvars.iv.next43, %20
  br i1 %45, label %.preheader7.us, label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %._crit_edge19.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader7.lr.ph
  %.pr = load i32, i32* %8, align 4
  store i32 0, i32* %13, align 4
  %46 = icmp sgt i32 %.pr, 0
  br i1 %46, label %.preheader5.lr.ph, label %95

.preheader5.lr.ph:                                ; preds = %.preheader6
  %47 = load i32, i32* %8, align 4
  %48 = load [1000 x double]*, [1000 x double]** %11, align 8
  %49 = sitofp i32 %47 to double
  %.promoted = load i32, i32* %13, align 4
  %50 = add i32 %.promoted, 1
  %51 = sext i32 %50 to i64
  %52 = sext i32 %.promoted to i64
  %53 = sext i32 %47 to i64
  %54 = sext i32 %47 to i64
  %55 = add i32 %47, 7
  %56 = sub i32 %55, %.promoted
  %57 = add i32 %47, -2
  %58 = sub i32 %57, %.promoted
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %._crit_edge
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %indvar.next, %._crit_edge ]
  %indvars.iv40 = phi i64 [ %52, %.preheader5.lr.ph ], [ %indvars.iv.next41, %._crit_edge ]
  %indvars.iv35 = phi i64 [ %51, %.preheader5.lr.ph ], [ %indvars.iv.next36, %._crit_edge ]
  %indvars.iv33 = phi i32 [ %50, %.preheader5.lr.ph ], [ %indvars.iv.next34, %._crit_edge ]
  %59 = sub i32 %56, %indvar
  %60 = sub i32 %58, %indvar
  %61 = add i32 %50, %indvar
  %62 = icmp slt i64 %indvars.iv40, 0
  br i1 %62, label %.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %63 = and i32 %61, 1
  %lcmp.mod = icmp eq i32 %63, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %64 = trunc i64 %indvars.iv40 to i32
  %65 = srem i32 %64, 100
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %66, %49
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 0
  store double %67, double* %68, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv31.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %69 = icmp eq i32 %61, 1
  br i1 %69, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv33 to i64
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit, %.preheader5
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %70 = icmp slt i64 %indvars.iv.next41, %54
  br i1 %70, label %.lr.ph11, label %._crit_edge

.lr.ph11:                                         ; preds = %.preheader
  %xtraiter46 = and i32 %59, 7
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.prol.loopexit45, label %.prol.preheader44.preheader

.prol.preheader44.preheader:                      ; preds = %.lr.ph11
  br label %.prol.preheader44

.prol.preheader44:                                ; preds = %.prol.preheader44.preheader, %.prol.preheader44
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader44 ], [ %indvars.iv35, %.prol.preheader44.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader44 ], [ %xtraiter46, %.prol.preheader44.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit45.loopexit, label %.prol.preheader44, !llvm.loop !1

.prol.loopexit45.loopexit:                        ; preds = %.prol.preheader44
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.prol.loopexit45.loopexit, %.lr.ph11
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph11 ], [ %indvars.iv.next38.prol, %.prol.loopexit45.loopexit ]
  %72 = icmp ult i32 %60, 7
  br i1 %72, label %._crit_edge, label %.lr.ph11.new.preheader

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit45
  br label %.lr.ph11.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %.lr.ph.new ], [ %indvars.iv31.unr.ph, %.lr.ph.new.preheader ]
  %73 = add nsw i64 %indvars.iv31, %indvars.iv40
  %74 = trunc i64 %73 to i32
  %75 = srem i32 %74, 100
  %76 = sitofp i32 %75 to double
  %77 = fdiv double %76, %49
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv31
  store double %77, double* %78, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %79 = add nsw i64 %indvars.iv.next32, %indvars.iv40
  %80 = trunc i64 %79 to i32
  %81 = srem i32 %80, 100
  %82 = sitofp i32 %81 to double
  %83 = fdiv double %82, %49
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next32
  store double %83, double* %84, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next32.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new.preheader, %.lr.ph11.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph11.new ], [ %indvars.iv37.unr, %.lr.ph11.new.preheader ]
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv37
  store double -9.990000e+02, double* %85, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %86, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %87, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %88, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %89, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %90, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %91, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv40, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %92, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond39.7 = icmp eq i32 %lftr.wideiv.7, %47
  br i1 %exitcond39.7, label %._crit_edge.loopexit, label %.lr.ph11.new

._crit_edge.loopexit:                             ; preds = %.lr.ph11.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit45, %.preheader
  %93 = icmp slt i64 %indvars.iv.next41, %53
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %93, label %.preheader5, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge
  %94 = trunc i64 %indvars.iv.next41 to i32
  store i32 %94, i32* %13, align 4
  br label %95

; <label>:95:                                     ; preds = %.preheader6.thread, %._crit_edge14, %.preheader6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
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
  br i1 %19, label %.preheader.lr.ph, label %107

.preheader.lr.ph:                                 ; preds = %7
  %20 = load i32, i32* %9, align 4
  %21 = load double, double* %11, align 8
  %22 = load [1200 x double]*, [1200 x double]** %12, align 8
  %23 = load double, double* %10, align 8
  %24 = load [1200 x double]*, [1200 x double]** %14, align 8
  %25 = load [1000 x double]*, [1000 x double]** %13, align 8
  %26 = sext i32 %20 to i64
  %27 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %15, align 4
  %.promoted18 = load i32, i32* %16, align 4
  %.promoted21 = load double, double* %17, align 8
  %28 = sext i32 %20 to i64
  %29 = sext i32 %.promoted to i64
  %30 = sext i32 %27 to i64
  %31 = icmp sgt i32 %20, 0
  %32 = fmul double %23, 0.000000e+00
  %min.iters.check = icmp ult i32 %20, 4
  %n.vec = and i64 %26, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %21, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert48 = insertelement <2 x double> undef, double %23, i32 0
  %broadcast.splat49 = shufflevector <2 x double> %broadcast.splatinsert48, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert50 = insertelement <2 x double> undef, double %32, i32 0
  %broadcast.splat51 = shufflevector <2 x double> %broadcast.splatinsert50, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %26, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge6
  %indvar = phi i64 [ 0, %.preheader.lr.ph ], [ %indvar.next, %._crit_edge6 ]
  %indvars.iv29 = phi i64 [ %29, %.preheader.lr.ph ], [ %indvars.iv.next30, %._crit_edge6 ]
  %.lcssa411.lcssa22 = phi double [ %.promoted21, %.preheader.lr.ph ], [ %.lcssa411.lcssa23, %._crit_edge6 ]
  %.lcssa10.lcssa19 = phi i32 [ %.promoted18, %.preheader.lr.ph ], [ %.lcssa10.lcssa20, %._crit_edge6 ]
  %33 = add i64 %29, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %22, i64 %33, i64 0
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %22, i64 %33, i64 %26
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %24, i64 %33, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %24, i64 %33, i64 %26
  br i1 %31, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %34 = icmp sgt i64 %indvars.iv29, 0
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv29, i64 %indvars.iv29
  br i1 %34, label %.lr.ph.us.preheader, label %.lr.ph5.split.preheader

.lr.ph.us.preheader:                              ; preds = %.lr.ph5
  br label %.lr.ph.us

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  br i1 %min.iters.check, label %.lr.ph5.split.preheader52, label %min.iters.checked

.lr.ph5.split.preheader52:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph5.split.preheader
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph5.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph5.split

min.iters.checked:                                ; preds = %.lr.ph5.split.preheader
  br i1 %cmp.zero, label %.lr.ph5.split.preheader52, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ult double* %scevgep34, %scevgep32
  %found.conflict = and i1 %bound0, %bound1
  %bound039 = icmp ult double* %scevgep, %35
  %bound140 = icmp ult double* %35, %scevgep32
  %found.conflict41 = and i1 %bound039, %bound140
  %conflict.rdx = or i1 %found.conflict, %found.conflict41
  br i1 %conflict.rdx, label %.lr.ph5.split.preheader52, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %36 = load double, double* %35, align 8, !alias.scope !3
  %37 = insertelement <2 x double> undef, double %36, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = insertelement <2 x double> undef, double %36, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv29, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !6, !noalias !8
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  %45 = fmul <2 x double> %broadcast.splat45, %wide.load
  %46 = fmul <2 x double> %broadcast.splat45, %wide.load43
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv29, i64 %index
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !10
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !10
  %51 = fmul <2 x double> %broadcast.splat49, %wide.load46
  %52 = fmul <2 x double> %broadcast.splat49, %wide.load47
  %53 = fmul <2 x double> %51, %38
  %54 = fmul <2 x double> %52, %40
  %55 = fadd <2 x double> %45, %53
  %56 = fadd <2 x double> %46, %54
  %57 = fadd <2 x double> %55, %broadcast.splat51
  %58 = fadd <2 x double> %56, %broadcast.splat51
  %59 = bitcast double* %41 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = bitcast double* %43 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge6, label %.lr.ph5.split.preheader52

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv29, i64 %indvars.iv12
  br label %63

; <label>:63:                                     ; preds = %63, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %63 ]
  %64 = phi double [ 0.000000e+00, %.lr.ph.us ], [ %78, %63 ]
  %65 = load double, double* %62, align 8
  %66 = fmul double %23, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv29, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv, i64 %indvars.iv12
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  store double %72, double* %70, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv, i64 %indvars.iv12
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv29, i64 %indvars.iv
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %64, %77
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv29
  br i1 %exitcond, label %._crit_edge.us, label %63

._crit_edge.us:                                   ; preds = %63
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv29, i64 %indvars.iv12
  %80 = load double, double* %79, align 8
  %81 = fmul double %21, %80
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv29, i64 %indvars.iv12
  %83 = load double, double* %82, align 8
  %84 = fmul double %23, %83
  %85 = load double, double* %35, align 8
  %86 = fmul double %84, %85
  %87 = fadd double %81, %86
  %88 = fmul double %23, %78
  %89 = fadd double %87, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv29, i64 %indvars.iv12
  store double %89, double* %90, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %91 = icmp slt i64 %indvars.iv.next13, %26
  br i1 %91, label %.lr.ph.us, label %._crit_edge6.us-lcssa.us

._crit_edge6.us-lcssa.us:                         ; preds = %._crit_edge.us
  %92 = trunc i64 %indvars.iv29 to i32
  br label %._crit_edge6

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader52, %.lr.ph5.split
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.lr.ph5.split ], [ %indvars.iv25.ph, %.lr.ph5.split.preheader52 ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv29, i64 %indvars.iv25
  %94 = load double, double* %93, align 8
  %95 = fmul double %21, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv29, i64 %indvars.iv25
  %97 = load double, double* %96, align 8
  %98 = fmul double %23, %97
  %99 = load double, double* %35, align 8
  %100 = fmul double %98, %99
  %101 = fadd double %95, %100
  %102 = fadd double %101, %32
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv29, i64 %indvars.iv25
  store double %102, double* %103, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %104 = icmp slt i64 %indvars.iv.next26, %28
  br i1 %104, label %.lr.ph5.split, label %._crit_edge6.loopexit, !llvm.loop !14

._crit_edge6.loopexit:                            ; preds = %.lr.ph5.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %middle.block, %._crit_edge6.us-lcssa.us, %.preheader
  %.lcssa411.lcssa23 = phi double [ %.lcssa411.lcssa22, %.preheader ], [ %78, %._crit_edge6.us-lcssa.us ], [ 0.000000e+00, %middle.block ], [ 0.000000e+00, %._crit_edge6.loopexit ]
  %.lcssa10.lcssa20 = phi i32 [ %.lcssa10.lcssa19, %.preheader ], [ %92, %._crit_edge6.us-lcssa.us ], [ 0, %middle.block ], [ 0, %._crit_edge6.loopexit ]
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, 1
  %105 = icmp slt i64 %indvars.iv.next30, %30
  %indvar.next = add i64 %indvar, 1
  br i1 %105, label %.preheader, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge6
  %106 = trunc i64 %indvars.iv.next30 to i32
  store i32 %106, i32* %15, align 4
  store i32 %.lcssa10.lcssa20, i32* %16, align 4
  store double %.lcssa411.lcssa23, double* %17, align 8
  br label %107

; <label>:107:                                    ; preds = %._crit_edge14, %7
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
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %7, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader.lr.ph, label %41

.preheader.lr.ph:                                 ; preds = %3
  %14 = load i32, i32* %5, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = load i32, i32* %4, align 4
  %17 = sext i32 %16 to i64
  %18 = sext i32 %16 to i64
  %19 = load [1200 x double]*, [1200 x double]** %6, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %15, label %.preheader.lr.ph.split.us, label %._crit_edge3.loopexit7

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  %20 = sext i32 %.promoted to i64
  %21 = load i32, i32* %5, align 4
  %22 = sext i32 %21 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge.us ], [ %20, %.preheader.lr.ph.split.us ]
  %23 = mul nsw i64 %18, %indvars.iv9
  br label %24

; <label>:24:                                     ; preds = %.preheader.us, %31
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %31 ]
  %25 = add i64 %23, %indvars.iv
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %31

; <label>:31:                                     ; preds = %29, %24
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i64 %indvars.iv9, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = icmp slt i64 %indvars.iv.next, %22
  br i1 %36, label %24, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %31
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %37 = icmp slt i64 %indvars.iv.next10, %17
  br i1 %37, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %38 = trunc i64 %indvars.iv.next10 to i32
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %.preheader.lr.ph
  %39 = add i32 %.promoted, 1
  %40 = icmp sgt i32 %16, %39
  %smax = select i1 %40, i32 %16, i32 %39
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %38, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit7 ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %41

; <label>:41:                                     ; preds = %._crit_edge3, %3
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %44) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
