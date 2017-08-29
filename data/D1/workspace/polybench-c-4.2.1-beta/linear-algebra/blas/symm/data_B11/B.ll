; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  %20 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %21 = load [1200 x double]*, [1200 x double]** %20, align 8
  %22 = bitcast [1000 x [1000 x double]]** %10 to [1000 x double]**
  %23 = load [1000 x double]*, [1000 x double]** %22, align 8
  %24 = bitcast [1000 x [1200 x double]]** %11 to [1200 x double]**
  %25 = load [1200 x double]*, [1200 x double]** %24, align 8
  call void @init_array(i32 %18, i32 %19, double* nonnull %7, double* nonnull %8, [1200 x double]* %21, [1000 x double]* %23, [1200 x double]* %25)
  call void (...) @polybench_timer_start() #4
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
  call void @kernel_symm(i32 %26, i32 %27, double %28, double %29, [1200 x double]* %31, [1000 x double]* %33, [1200 x double]* %35)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %36 = load i32, i32* %3, align 4
  %37 = icmp sgt i32 %36, 42
  br i1 %37, label %38, label %._crit_edge

; <label>:38:                                     ; preds = %2
  %39 = load i8**, i8*** %4, align 8
  %40 = load i8*, i8** %39, align 8
  %strcmpload = load i8, i8* %40, align 1
  %41 = icmp eq i8 %strcmpload, 0
  br i1 %41, label %42, label %._crit_edge

; <label>:42:                                     ; preds = %38
  %43 = load i32, i32* %5, align 4
  %44 = load i32, i32* %6, align 4
  %45 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %46 = load [1200 x double]*, [1200 x double]** %45, align 8
  call void @print_array(i32 %43, i32 %44, [1200 x double]* %46)
  br label %._crit_edge

._crit_edge:                                      ; preds = %38, %2, %42
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
  br label %.preheader6._crit_edge

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
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.us.preheader
  %25 = phi i32 [ %.promoted25, %.preheader7.us.preheader ], [ %43, %._crit_edge19.us ]
  %26 = sext i32 %25 to i64
  %27 = add nsw i32 %25, %16
  %28 = sext i32 %25 to i64
  %29 = zext i32 %25 to i64
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49, %.preheader7.us
  %indvars.iv47 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next48, %._crit_edge49 ]
  %30 = add i64 %indvars.iv47, %29
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %19
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %26, i64 %indvars.iv47
  store double %34, double* %35, align 8
  %36 = trunc i64 %indvars.iv47 to i32
  %37 = sub i32 %27, %36
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %21
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %28, i64 %indvars.iv47
  store double %40, double* %41, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %42 = icmp slt i64 %indvars.iv.next48, %24
  br i1 %42, label %._crit_edge49, label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge49
  %43 = add nsw i32 %25, 1
  %44 = icmp slt i32 %43, %18
  br i1 %44, label %.preheader7.us, label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %._crit_edge19.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader7.lr.ph
  %.pr = load i32, i32* %8, align 4
  store i32 0, i32* %13, align 4
  %45 = icmp sgt i32 %.pr, 0
  br i1 %45, label %.preheader5.lr.ph, label %.preheader6._crit_edge

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

.preheader5:                                      ; preds = %._crit_edge, %.preheader5.lr.ph
  %indvars.iv45 = phi i64 [ %55, %.preheader5.lr.ph ], [ %indvars.iv.next46, %._crit_edge ]
  %indvars.iv35 = phi i64 [ %50, %.preheader5.lr.ph ], [ %indvars.iv.next36, %._crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %indvar.next, %._crit_edge ]
  %indvars.iv33 = phi i32 [ %49, %.preheader5.lr.ph ], [ %indvars.iv.next34, %._crit_edge ]
  %58 = sub i32 %52, %indvar
  %59 = sub i32 %54, %indvar
  %60 = icmp slt i64 %indvars.iv45, 0
  br i1 %60, label %.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %61 = add i32 %49, %indvar
  %xtraiter = and i32 %61, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %62 = trunc i64 %indvars.iv45 to i32
  %63 = srem i32 %62, 100
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %64, %48
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 0
  store double %65, double* %66, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %67 = sub i32 0, %indvar
  %68 = icmp eq i32 %.promoted, %67
  br i1 %68, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv33 to i64
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit, %.preheader5
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, 1
  %69 = icmp slt i64 %indvars.iv.next46, %57
  br i1 %69, label %.lr.ph11, label %._crit_edge

.lr.ph11:                                         ; preds = %.preheader
  %xtraiter41 = and i32 %58, 7
  %lcmp.mod42 = icmp eq i32 %xtraiter41, 0
  br i1 %lcmp.mod42, label %.prol.loopexit40, label %.prol.preheader39.preheader

.prol.preheader39.preheader:                      ; preds = %.lr.ph11
  br label %.prol.preheader39

.prol.preheader39:                                ; preds = %.prol.preheader39.preheader, %.prol.preheader39
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader39 ], [ %indvars.iv35, %.prol.preheader39.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader39 ], [ %xtraiter41, %.prol.preheader39.preheader ]
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit40.loopexit, label %.prol.preheader39, !llvm.loop !1

.prol.loopexit40.loopexit:                        ; preds = %.prol.preheader39
  br label %.prol.loopexit40

.prol.loopexit40:                                 ; preds = %.prol.loopexit40.loopexit, %.lr.ph11
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph11 ], [ %indvars.iv.next38.prol, %.prol.loopexit40.loopexit ]
  %71 = icmp ult i32 %59, 7
  br i1 %71, label %._crit_edge, label %.lr.ph11.new.preheader

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit40
  br label %.lr.ph11.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %72 = add nsw i64 %indvars.iv, %indvars.iv45
  %73 = trunc i64 %72 to i32
  %74 = srem i32 %73, 100
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %75, %48
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv
  store double %76, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %78 = add nsw i64 %indvars.iv.next, %indvars.iv45
  %79 = trunc i64 %78 to i32
  %80 = srem i32 %79, 100
  %81 = sitofp i32 %80 to double
  %82 = fdiv double %81, %48
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next
  store double %82, double* %83, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new.preheader, %.lr.ph11.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph11.new ], [ %indvars.iv37.unr, %.lr.ph11.new.preheader ]
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv37
  store double -9.990000e+02, double* %84, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %85, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %86, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %87, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %88, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %89, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %90, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv45, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %91, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %46
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph11.new

._crit_edge.loopexit:                             ; preds = %.lr.ph11.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit40, %.preheader
  %92 = icmp slt i64 %indvars.iv.next46, %56
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  br i1 %92, label %.preheader5, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge
  %93 = trunc i64 %indvars.iv.next46 to i32
  store i32 %93, i32* %13, align 4
  br label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6, %.preheader6.thread, %._crit_edge14
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
  br i1 %19, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %7
  %20 = load i32, i32* %9, align 4
  %21 = load double, double* %11, align 8
  %22 = load [1200 x double]*, [1200 x double]** %12, align 8
  %23 = load double, double* %10, align 8
  %24 = load [1200 x double]*, [1200 x double]** %14, align 8
  %25 = load [1000 x double]*, [1000 x double]** %13, align 8
  %26 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %15, align 4
  %.promoted16 = load i32, i32* %16, align 4
  %.promoted19 = load double, double* %17, align 8
  %27 = sext i32 %20 to i64
  %28 = sext i32 %.promoted to i64
  %29 = sext i32 %26 to i64
  %30 = icmp sgt i32 %20, 0
  %31 = fmul double %23, 0.000000e+00
  %min.iters.check = icmp ult i32 %20, 4
  %n.vec = and i64 %27, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %21, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %23, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %31, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %27, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge6, %.preheader.lr.ph
  %indvar = phi i64 [ %indvar.next, %._crit_edge6 ], [ 0, %.preheader.lr.ph ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge6 ], [ %28, %.preheader.lr.ph ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge6 ], [ %.promoted, %.preheader.lr.ph ]
  %.lcssa411.lcssa20 = phi double [ %.lcssa411.lcssa21, %._crit_edge6 ], [ %.promoted19, %.preheader.lr.ph ]
  %.lcssa10.lcssa17 = phi i32 [ %.lcssa10.lcssa18, %._crit_edge6 ], [ %.promoted16, %.preheader.lr.ph ]
  %32 = add i64 %28, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %22, i64 %32, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %22, i64 %32, i64 %27
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %24, i64 %32, i64 0
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %24, i64 %32, i64 %27
  br i1 %30, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %33 = icmp sgt i64 %indvars.iv36, 0
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv36
  br i1 %33, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  br i1 %min.iters.check, label %.lr.ph5.split.preheader62, label %min.iters.checked

.lr.ph5.split.preheader62:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph5.split.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph5.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph5.split

min.iters.checked:                                ; preds = %.lr.ph5.split.preheader
  br i1 %cmp.zero, label %.lr.ph5.split.preheader62, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %found.conflict = and i1 %bound0, %bound1
  %bound049 = icmp ult double* %scevgep, %34
  %bound150 = icmp ult double* %34, %scevgep42
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx = or i1 %found.conflict, %found.conflict51
  br i1 %conflict.rdx, label %.lr.ph5.split.preheader62, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %35 = load double, double* %34, align 8, !alias.scope !3
  %36 = insertelement <2 x double> undef, double %35, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = insertelement <2 x double> undef, double %35, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !6, !noalias !8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %44 = fmul <2 x double> %broadcast.splat55, %wide.load
  %45 = fmul <2 x double> %broadcast.splat55, %wide.load53
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %index
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !10
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !10
  %50 = fmul <2 x double> %broadcast.splat59, %wide.load56
  %51 = fmul <2 x double> %broadcast.splat59, %wide.load57
  %52 = fmul <2 x double> %50, %37
  %53 = fmul <2 x double> %51, %39
  %54 = fadd <2 x double> %44, %52
  %55 = fadd <2 x double> %45, %53
  %56 = fadd <2 x double> %54, %broadcast.splat61
  %57 = fadd <2 x double> %55, %broadcast.splat61
  %58 = bitcast double* %40 to <2 x double>*
  store <2 x double> %56, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %59 = bitcast double* %42 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %60 = icmp eq i64 %index.next, %n.vec
  br i1 %60, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge6, label %.lr.ph5.split.preheader62

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %61 = phi i32 [ 0, %.lr.ph5.split.us.preheader ], [ %96, %._crit_edge.us ]
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %62
  %64 = sext i32 %61 to i64
  %65 = sext i32 %61 to i64
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39, %.lr.ph5.split.us
  %indvars.iv28 = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next29, %._crit_edge39 ]
  %66 = phi double [ 0.000000e+00, %.lr.ph5.split.us ], [ %80, %._crit_edge39 ]
  %67 = load double, double* %63, align 8
  %68 = fmul double %23, %67
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv28
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv28, i64 %64
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  store double %74, double* %72, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv28, i64 %65
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv36, i64 %indvars.iv28
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %66, %79
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge39

._crit_edge.us:                                   ; preds = %._crit_edge39
  %81 = sext i32 %61 to i64
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %81
  %83 = load double, double* %82, align 8
  %84 = fmul double %21, %83
  %85 = sext i32 %61 to i64
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fmul double %23, %87
  %89 = load double, double* %34, align 8
  %90 = fmul double %88, %89
  %91 = fadd double %84, %90
  %92 = fmul double %23, %80
  %93 = fadd double %91, %92
  %94 = sext i32 %61 to i64
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %94
  store double %93, double* %95, align 8
  %96 = add nsw i32 %61, 1
  %97 = icmp slt i32 %96, %20
  br i1 %97, label %.lr.ph5.split.us, label %._crit_edge6.loopexit

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader62, %.lr.ph5.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph5.split ], [ %indvars.iv.ph, %.lr.ph5.split.preheader62 ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %indvars.iv
  %99 = load double, double* %98, align 8
  %100 = fmul double %21, %99
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv36, i64 %indvars.iv
  %102 = load double, double* %101, align 8
  %103 = fmul double %23, %102
  %104 = load double, double* %34, align 8
  %105 = fmul double %103, %104
  %106 = fadd double %100, %105
  %107 = fadd double %106, %31
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv36, i64 %indvars.iv
  store double %107, double* %108, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %109 = icmp slt i64 %indvars.iv.next, %27
  br i1 %109, label %.lr.ph5.split, label %._crit_edge6.loopexit63, !llvm.loop !14

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6.loopexit63:                          ; preds = %.lr.ph5.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit63, %._crit_edge6.loopexit, %middle.block, %.preheader
  %.lcssa411.lcssa21 = phi double [ %.lcssa411.lcssa20, %.preheader ], [ 0.000000e+00, %middle.block ], [ %80, %._crit_edge6.loopexit ], [ 0.000000e+00, %._crit_edge6.loopexit63 ]
  %.lcssa10.lcssa18 = phi i32 [ %.lcssa10.lcssa17, %.preheader ], [ 0, %middle.block ], [ %indvars.iv34, %._crit_edge6.loopexit ], [ 0, %._crit_edge6.loopexit63 ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %110 = icmp slt i64 %indvars.iv.next37, %29
  %indvar.next = add i64 %indvar, 1
  br i1 %110, label %.preheader, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge6
  %111 = trunc i64 %indvars.iv.next37 to i32
  store i32 %111, i32* %15, align 4
  store i32 %.lcssa10.lcssa18, i32* %16, align 4
  store double %.lcssa411.lcssa21, double* %17, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %._crit_edge12
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
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %7, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %3
  %14 = load i32, i32* %5, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = load i32, i32* %4, align 4
  %17 = load [1200 x double]*, [1200 x double]** %6, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge3.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %14 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %18 = phi i32 [ %.promoted, %.preheader.us.preheader ], [ %32, %._crit_edge.us ]
  %19 = sext i32 %18 to i64
  %20 = mul nsw i32 %16, %18
  %21 = zext i32 %20 to i64
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %22 = add i64 %21, %indvars.iv
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 20
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %._crit_edge11

; <label>:26:                                     ; preds = %._crit_edge12
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %26
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i64 %19, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge12

._crit_edge.us:                                   ; preds = %._crit_edge11
  %32 = add nsw i32 %18, 1
  %33 = icmp slt i32 %32, %16
  br i1 %33, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit9:                           ; preds = %.preheader.lr.ph
  %34 = add i32 %.promoted, 1
  %35 = icmp sgt i32 %16, %34
  %smax = select i1 %35, i32 %16, i32 %34
  br label %._crit_edge3

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %._crit_edge3.loopexit9
  %.lcssa6 = phi i32 [ %smax, %._crit_edge3.loopexit9 ], [ %32, %._crit_edge3.loopexit ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %3, %._crit_edge3
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

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
