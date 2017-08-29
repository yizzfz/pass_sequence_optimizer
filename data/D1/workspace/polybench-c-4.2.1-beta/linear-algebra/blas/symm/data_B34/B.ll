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
  %18 = load i32, i32* %5, align 4
  %19 = load i32, i32* %6, align 4
  %20 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %21 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %20, i64 0, i64 0
  %22 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %23 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %22, i64 0, i64 0
  %24 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %25 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %24, i64 0, i64 0
  call fastcc void @init_array(i32 %18, i32 %19, double* nonnull %7, double* nonnull %8, [1200 x double]* %21, [1000 x double]* %23, [1200 x double]* %25)
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
  call fastcc void @kernel_symm(i32 %26, i32 %27, double %28, double %29, [1200 x double]* %31, [1000 x double]* %33, [1200 x double]* %35)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %36 = load i32, i32* %3, align 4
  %37 = icmp sgt i32 %36, 42
  br i1 %37, label %38, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:38:                                     ; preds = %2
  %39 = load i8**, i8*** %4, align 8
  %40 = load i8*, i8** %39, align 8
  %strcmpload = load i8, i8* %40, align 1
  %41 = icmp eq i8 %strcmpload, 0
  br i1 %41, label %42, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %38
  br label %._crit_edge

; <label>:42:                                     ; preds = %38
  %43 = load i32, i32* %5, align 4
  %44 = load i32, i32* %6, align 4
  %45 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %46 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %45, i64 0, i64 0
  call fastcc void @print_array(i32 %43, i32 %44, [1200 x double]* %46)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %42
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
  br label %.preheader6._crit_edge

.preheader7.lr.ph:                                ; preds = %7
  %16 = load i32, i32* %9, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = load i32, i32* %8, align 4
  %19 = sitofp i32 %18 to double
  %20 = load [1200 x double]*, [1200 x double]** %10, align 8
  %21 = sitofp i32 %18 to double
  %22 = load [1200 x double]*, [1200 x double]** %12, align 8
  br i1 %17, label %.preheader7.us.preheader, label %.preheader7.lr.ph..preheader6_crit_edge

.preheader7.lr.ph..preheader6_crit_edge:          ; preds = %.preheader7.lr.ph
  br label %.preheader6

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %.promoted25 = load i32, i32* %13, align 4
  %23 = load i32, i32* %9, align 4
  %24 = sext i32 %23 to i64
  %25 = sext i32 %.promoted25 to i64
  %26 = zext i32 %16 to i64
  %27 = sext i32 %18 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us..preheader7.us_crit_edge, %.preheader7.us.preheader
  %indvars.iv46 = phi i64 [ %25, %.preheader7.us.preheader ], [ %indvars.iv.next47, %._crit_edge19.us..preheader7.us_crit_edge ]
  %28 = add i64 %indvars.iv46, %26
  %29 = trunc i64 %28 to i32
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.._crit_edge29_crit_edge, %.preheader7.us
  %indvars.iv44 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next45, %._crit_edge29.._crit_edge29_crit_edge ]
  %30 = add nsw i64 %indvars.iv44, %indvars.iv46
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %19
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv46, i64 %indvars.iv44
  store double %34, double* %35, align 8
  %36 = trunc i64 %indvars.iv44 to i32
  %37 = sub i32 %29, %36
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %21
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv46, i64 %indvars.iv44
  store double %40, double* %41, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %42 = icmp slt i64 %indvars.iv.next45, %24
  br i1 %42, label %._crit_edge29.._crit_edge29_crit_edge, label %._crit_edge19.us

._crit_edge29.._crit_edge29_crit_edge:            ; preds = %._crit_edge29
  br label %._crit_edge29

._crit_edge19.us:                                 ; preds = %._crit_edge29
  %indvars.iv.next47 = add i64 %indvars.iv46, 1
  %43 = icmp slt i64 %indvars.iv.next47, %27
  br i1 %43, label %._crit_edge19.us..preheader7.us_crit_edge, label %._crit_edge19.us..preheader6_crit_edge

._crit_edge19.us..preheader6_crit_edge:           ; preds = %._crit_edge19.us
  br label %.preheader6

._crit_edge19.us..preheader7.us_crit_edge:        ; preds = %._crit_edge19.us
  br label %.preheader7.us

.preheader6:                                      ; preds = %._crit_edge19.us..preheader6_crit_edge, %.preheader7.lr.ph..preheader6_crit_edge
  %.pr = load i32, i32* %8, align 4
  store i32 0, i32* %13, align 4
  %44 = icmp sgt i32 %.pr, 0
  br i1 %44, label %.preheader5.lr.ph, label %.preheader6..preheader6._crit_edge_crit_edge

.preheader6..preheader6._crit_edge_crit_edge:     ; preds = %.preheader6
  br label %.preheader6._crit_edge

.preheader5.lr.ph:                                ; preds = %.preheader6
  %45 = load i32, i32* %8, align 4
  %46 = load [1000 x double]*, [1000 x double]** %11, align 8
  %47 = sitofp i32 %45 to double
  %.promoted = load i32, i32* %13, align 4
  %48 = add i32 %45, -1
  %49 = sext i32 %.promoted to i64
  %50 = sext i32 %45 to i64
  %51 = sext i32 %45 to i64
  %wide.trip.count40 = sext i32 %48 to i64
  %52 = add nsw i64 %wide.trip.count40, 1
  %53 = add i32 %.promoted, 1
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge..preheader5_crit_edge, %.preheader5.lr.ph
  %indvar = phi i32 [ %indvar.next, %._crit_edge..preheader5_crit_edge ], [ 0, %.preheader5.lr.ph ]
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge..preheader5_crit_edge ], [ %49, %.preheader5.lr.ph ]
  %indvars.iv36.in = phi i32 [ %indvars.iv36, %._crit_edge..preheader5_crit_edge ], [ %.promoted, %.preheader5.lr.ph ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge..preheader5_crit_edge ], [ %.promoted, %.preheader5.lr.ph ]
  %54 = add i32 %53, %indvar
  %55 = sext i32 %54 to i64
  %56 = sub nsw i64 %52, %55
  %indvars.iv36 = add i32 %indvars.iv36.in, 1
  %57 = sext i32 %indvars.iv36 to i64
  %58 = icmp slt i64 %indvars.iv42, 0
  br i1 %58, label %.preheader5..preheader_crit_edge, label %.lr.ph.preheader

.preheader5..preheader_crit_edge:                 ; preds = %.preheader5
  br label %.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  br label %.lr.ph

.preheader:                                       ; preds = %.lr.ph..preheader_crit_edge, %.preheader5..preheader_crit_edge
  %indvars.iv.next43 = add i64 %indvars.iv42, 1
  %59 = icmp slt i64 %indvars.iv.next43, %51
  br i1 %59, label %.lr.ph11.preheader, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph11.preheader:                               ; preds = %.preheader
  %min.iters.check = icmp ult i64 %56, 4
  br i1 %min.iters.check, label %.lr.ph11.preheader..lr.ph11_crit_edge, label %min.iters.checked

.lr.ph11.preheader..lr.ph11_crit_edge:            ; preds = %.lr.ph11.preheader
  br label %.lr.ph11.preheader49

min.iters.checked:                                ; preds = %.lr.ph11.preheader
  %n.vec = and i64 %56, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %57, %n.vec
  br i1 %cmp.zero, label %min.iters.checked..lr.ph11_crit_edge, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  br label %vector.body

min.iters.checked..lr.ph11_crit_edge:             ; preds = %min.iters.checked
  br label %.lr.ph11.preheader49

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %min.iters.checked.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %min.iters.checked.vector.body_crit_edge ]
  %60 = add i64 %57, %index
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv42, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %62, align 8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %64, align 8
  %index.next = add i64 %index, 4
  %65 = icmp eq i64 %index.next, %n.vec
  br i1 %65, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %56, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge_crit_edge, label %middle.block..lr.ph11_crit_edge

middle.block..lr.ph11_crit_edge:                  ; preds = %middle.block
  br label %.lr.ph11.preheader49

.lr.ph11.preheader49:                             ; preds = %.lr.ph11.preheader..lr.ph11_crit_edge, %min.iters.checked..lr.ph11_crit_edge, %middle.block..lr.ph11_crit_edge
  %indvars.iv38.ph = phi i64 [ %57, %min.iters.checked..lr.ph11_crit_edge ], [ %57, %.lr.ph11.preheader..lr.ph11_crit_edge ], [ %ind.end, %middle.block..lr.ph11_crit_edge ]
  br label %.lr.ph11

middle.block.._crit_edge_crit_edge:               ; preds = %middle.block
  br label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %66 = add nsw i64 %indvars.iv, %indvars.iv42
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, 100
  %69 = sitofp i32 %68 to double
  %70 = fdiv double %69, %47
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv42, i64 %indvars.iv
  store double %70, double* %71, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %.lr.ph..preheader_crit_edge, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.lr.ph

.lr.ph..preheader_crit_edge:                      ; preds = %.lr.ph
  br label %.preheader

.lr.ph11:                                         ; preds = %.lr.ph11.preheader49, %.lr.ph11..lr.ph11_crit_edge
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %.lr.ph11..lr.ph11_crit_edge ], [ %indvars.iv38.ph, %.lr.ph11.preheader49 ]
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %46, i64 %indvars.iv42, i64 %indvars.iv38
  store double -9.990000e+02, double* %72, align 8
  %exitcond41 = icmp eq i64 %indvars.iv38, %wide.trip.count40
  br i1 %exitcond41, label %.lr.ph11.._crit_edge_crit_edge, label %.lr.ph11..lr.ph11_crit_edge, !llvm.loop !4

.lr.ph11..lr.ph11_crit_edge:                      ; preds = %.lr.ph11
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  br label %.lr.ph11

.lr.ph11.._crit_edge_crit_edge:                   ; preds = %.lr.ph11
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph11.._crit_edge_crit_edge, %middle.block.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge
  %73 = icmp slt i64 %indvars.iv.next43, %50
  br i1 %73, label %._crit_edge..preheader5_crit_edge, label %._crit_edge14

._crit_edge..preheader5_crit_edge:                ; preds = %._crit_edge
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  br label %.preheader5

._crit_edge14:                                    ; preds = %._crit_edge
  %74 = trunc i64 %indvars.iv.next43 to i32
  store i32 %74, i32* %13, align 4
  br label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6..preheader6._crit_edge_crit_edge, %.preheader6.thread, %._crit_edge14
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
  br i1 %19, label %.preheader.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

.preheader.lr.ph:                                 ; preds = %7
  %20 = load i32, i32* %9, align 4
  %21 = icmp sgt i32 %20, 0
  %22 = load i32, i32* %8, align 4
  %23 = load double, double* %11, align 8
  %24 = load [1200 x double]*, [1200 x double]** %12, align 8
  %25 = load double, double* %10, align 8
  %26 = load [1200 x double]*, [1200 x double]** %14, align 8
  %27 = load [1000 x double]*, [1000 x double]** %13, align 8
  %28 = load i32, i32* %9, align 4
  %.promoted = load i32, i32* %15, align 4
  %.promoted16 = load i32, i32* %16, align 4
  %.promoted19 = load double, double* %17, align 8
  %29 = sext i32 %28 to i64
  %30 = add i32 %.promoted, -1
  %31 = sext i32 %28 to i64
  %32 = sext i32 %.promoted to i64
  %33 = sext i32 %22 to i64
  %34 = fmul double %25, 0.000000e+00
  %35 = icmp sgt i64 %31, 1
  %smax = select i1 %35, i64 %31, i64 1
  %36 = icmp sgt i64 %31, 1
  %smax37 = select i1 %36, i64 %31, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert50 = insertelement <2 x double> undef, double %23, i32 0
  %broadcast.splat51 = shufflevector <2 x double> %broadcast.splatinsert50, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %25, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %34, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge6..preheader_crit_edge, %.preheader.lr.ph
  %indvar = phi i64 [ %indvar.next, %._crit_edge6..preheader_crit_edge ], [ 0, %.preheader.lr.ph ]
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge6..preheader_crit_edge ], [ %32, %.preheader.lr.ph ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %._crit_edge6..preheader_crit_edge ], [ %30, %.preheader.lr.ph ]
  %.lcssa411.lcssa20 = phi double [ %.lcssa411.lcssa21, %._crit_edge6..preheader_crit_edge ], [ %.promoted19, %.preheader.lr.ph ]
  %.lcssa10.lcssa17 = phi i32 [ %.lcssa10.lcssa18, %._crit_edge6..preheader_crit_edge ], [ %.promoted16, %.preheader.lr.ph ]
  %37 = add i64 %32, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %24, i64 %37, i64 0
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %24, i64 %37, i64 %smax37
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %26, i64 %37, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %26, i64 %37, i64 %smax37
  %38 = add i32 %indvars.iv28, 1
  br i1 %21, label %.lr.ph5, label %.preheader.._crit_edge6_crit_edge

.preheader.._crit_edge6_crit_edge:                ; preds = %.preheader
  br label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %39 = icmp sgt i64 %indvars.iv32, 0
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %indvars.iv32, i64 %indvars.iv32
  br i1 %39, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  br i1 %min.iters.check, label %.lr.ph5.split.preheader..lr.ph5.split_crit_edge, label %min.iters.checked

.lr.ph5.split.preheader..lr.ph5.split_crit_edge:  ; preds = %.lr.ph5.split.preheader
  br label %.lr.ph5.split.preheader59

min.iters.checked:                                ; preds = %.lr.ph5.split.preheader
  br i1 %cmp.zero, label %min.iters.checked..lr.ph5.split_crit_edge, label %vector.memcheck

min.iters.checked..lr.ph5.split_crit_edge:        ; preds = %min.iters.checked
  br label %.lr.ph5.split.preheader59

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep42
  %bound1 = icmp ult double* %scevgep40, %scevgep38
  %found.conflict = and i1 %bound0, %bound1
  %bound045 = icmp ult double* %scevgep, %40
  %bound146 = icmp ult double* %40, %scevgep38
  %found.conflict47 = and i1 %bound045, %bound146
  %conflict.rdx = or i1 %found.conflict, %found.conflict47
  br i1 %conflict.rdx, label %vector.memcheck..lr.ph5.split_crit_edge, label %vector.ph

vector.memcheck..lr.ph5.split_crit_edge:          ; preds = %vector.memcheck
  br label %.lr.ph5.split.preheader59

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !6, !noalias !9
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !6, !noalias !9
  %45 = fmul <2 x double> %broadcast.splat51, %wide.load
  %46 = fmul <2 x double> %broadcast.splat51, %wide.load49
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %26, i64 %indvars.iv32, i64 %index
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !12
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !12
  %51 = fmul <2 x double> %broadcast.splat55, %wide.load52
  %52 = fmul <2 x double> %broadcast.splat55, %wide.load53
  %53 = load double, double* %40, align 8, !alias.scope !13
  %54 = insertelement <2 x double> undef, double %53, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = insertelement <2 x double> undef, double %53, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = fmul <2 x double> %51, %55
  %59 = fmul <2 x double> %52, %57
  %60 = fadd <2 x double> %45, %58
  %61 = fadd <2 x double> %46, %59
  %62 = fadd <2 x double> %60, %broadcast.splat57
  %63 = fadd <2 x double> %61, %broadcast.splat57
  %64 = bitcast double* %41 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !6, !noalias !9
  %65 = bitcast double* %43 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !9
  %index.next = add i64 %index, 4
  %66 = icmp eq i64 %index.next, %n.vec
  br i1 %66, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge6_crit_edge, label %middle.block..lr.ph5.split_crit_edge

middle.block..lr.ph5.split_crit_edge:             ; preds = %middle.block
  br label %.lr.ph5.split.preheader59

.lr.ph5.split.preheader59:                        ; preds = %.lr.ph5.split.preheader..lr.ph5.split_crit_edge, %min.iters.checked..lr.ph5.split_crit_edge, %vector.memcheck..lr.ph5.split_crit_edge, %middle.block..lr.ph5.split_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck..lr.ph5.split_crit_edge ], [ 0, %min.iters.checked..lr.ph5.split_crit_edge ], [ 0, %.lr.ph5.split.preheader..lr.ph5.split_crit_edge ], [ %n.vec, %middle.block..lr.ph5.split_crit_edge ]
  br label %.lr.ph5.split

middle.block.._crit_edge6_crit_edge:              ; preds = %middle.block
  br label %._crit_edge6

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %wide.trip.count = zext i32 %indvars.iv28 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us..lr.ph5.split.us_crit_edge, %.lr.ph5.split.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us..lr.ph5.split.us_crit_edge ], [ 0, %.lr.ph5.split.us.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %26, i64 %indvars.iv32, i64 %indvars.iv30
  br label %68

; <label>:68:                                     ; preds = %._crit_edge58, %.lr.ph5.split.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge58 ], [ 0, %.lr.ph5.split.us ]
  %69 = phi double [ %83, %._crit_edge58 ], [ 0.000000e+00, %.lr.ph5.split.us ]
  %70 = load double, double* %67, align 8
  %71 = fmul double %25, %70
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %indvars.iv32, i64 %indvars.iv26
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv26, i64 %indvars.iv30
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  store double %77, double* %75, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %26, i64 %indvars.iv26, i64 %indvars.iv30
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %indvars.iv32, i64 %indvars.iv26
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %69, %82
  %exitcond = icmp eq i64 %indvars.iv26, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge58

._crit_edge58:                                    ; preds = %68
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  br label %68

._crit_edge.us:                                   ; preds = %68
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %indvars.iv30
  %85 = load double, double* %84, align 8
  %86 = fmul double %23, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %26, i64 %indvars.iv32, i64 %indvars.iv30
  %88 = load double, double* %87, align 8
  %89 = fmul double %25, %88
  %90 = load double, double* %40, align 8
  %91 = fmul double %89, %90
  %92 = fadd double %86, %91
  %93 = fmul double %25, %83
  %94 = fadd double %92, %93
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %indvars.iv30
  store double %94, double* %95, align 8
  %indvars.iv.next31 = add nuw i64 %indvars.iv30, 1
  %96 = icmp slt i64 %indvars.iv.next31, %31
  br i1 %96, label %._crit_edge.us..lr.ph5.split.us_crit_edge, label %._crit_edge.us.._crit_edge6_crit_edge

._crit_edge.us.._crit_edge6_crit_edge:            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge.us..lr.ph5.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph5.split.us

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader59, %.lr.ph5.split..lr.ph5.split_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph5.split..lr.ph5.split_crit_edge ], [ %indvars.iv.ph, %.lr.ph5.split.preheader59 ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %indvars.iv
  %98 = load double, double* %97, align 8
  %99 = fmul double %23, %98
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %26, i64 %indvars.iv32, i64 %indvars.iv
  %101 = load double, double* %100, align 8
  %102 = fmul double %25, %101
  %103 = load double, double* %40, align 8
  %104 = fmul double %102, %103
  %105 = fadd double %99, %104
  %106 = fadd double %105, %34
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %indvars.iv
  store double %106, double* %107, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %108 = icmp slt i64 %indvars.iv.next, %29
  br i1 %108, label %.lr.ph5.split..lr.ph5.split_crit_edge, label %.lr.ph5.split.._crit_edge6_crit_edge, !llvm.loop !15

.lr.ph5.split.._crit_edge6_crit_edge:             ; preds = %.lr.ph5.split
  br label %._crit_edge6

.lr.ph5.split..lr.ph5.split_crit_edge:            ; preds = %.lr.ph5.split
  br label %.lr.ph5.split

._crit_edge6:                                     ; preds = %.lr.ph5.split.._crit_edge6_crit_edge, %._crit_edge.us.._crit_edge6_crit_edge, %middle.block.._crit_edge6_crit_edge, %.preheader.._crit_edge6_crit_edge
  %.lcssa411.lcssa21 = phi double [ %.lcssa411.lcssa20, %.preheader.._crit_edge6_crit_edge ], [ %83, %._crit_edge.us.._crit_edge6_crit_edge ], [ 0.000000e+00, %.lr.ph5.split.._crit_edge6_crit_edge ], [ 0.000000e+00, %middle.block.._crit_edge6_crit_edge ]
  %.lcssa10.lcssa18 = phi i32 [ %.lcssa10.lcssa17, %.preheader.._crit_edge6_crit_edge ], [ %38, %._crit_edge.us.._crit_edge6_crit_edge ], [ 0, %.lr.ph5.split.._crit_edge6_crit_edge ], [ 0, %middle.block.._crit_edge6_crit_edge ]
  %indvars.iv.next33 = add i64 %indvars.iv32, 1
  %109 = icmp slt i64 %indvars.iv.next33, %33
  br i1 %109, label %._crit_edge6..preheader_crit_edge, label %._crit_edge12

._crit_edge6..preheader_crit_edge:                ; preds = %._crit_edge6
  %indvar.next = add i64 %indvar, 1
  %indvars.iv.next29 = add i32 %indvars.iv28, 1
  br label %.preheader

._crit_edge12:                                    ; preds = %._crit_edge6
  %110 = trunc i64 %indvars.iv.next33 to i32
  store i32 %110, i32* %15, align 4
  store i32 %.lcssa10.lcssa18, i32* %16, align 4
  store double %.lcssa411.lcssa21, double* %17, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge12
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
  br i1 %13, label %.preheader.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %3
  br label %._crit_edge

.preheader.lr.ph:                                 ; preds = %3
  %14 = load i32, i32* %5, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = load i32, i32* %4, align 4
  %17 = load [1200 x double]*, [1200 x double]** %6, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge3.loopexit7

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %18 = sext i32 %14 to i64
  %19 = sext i32 %.promoted to i64
  %20 = sext i32 %16 to i64
  %21 = sext i32 %16 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ %19, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us..preheader.us_crit_edge ]
  %22 = mul nsw i64 %20, %indvars.iv11
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge8.._crit_edge9_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge8.._crit_edge9_crit_edge ]
  %23 = add nsw i64 %22, %indvars.iv
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 20
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %._crit_edge9.._crit_edge8_crit_edge

._crit_edge9.._crit_edge8_crit_edge:              ; preds = %._crit_edge9
  br label %._crit_edge8

; <label>:27:                                     ; preds = %._crit_edge9
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %28) #5
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge9.._crit_edge8_crit_edge, %27
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i64 %indvars.iv11, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %31) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %33 = icmp slt i64 %indvars.iv.next, %18
  br i1 %33, label %._crit_edge8.._crit_edge9_crit_edge, label %._crit_edge.us

._crit_edge8.._crit_edge9_crit_edge:              ; preds = %._crit_edge8
  br label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge8
  %indvars.iv.next12 = add i64 %indvars.iv11, 1
  %34 = icmp slt i64 %indvars.iv.next12, %21
  br i1 %34, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge3.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %35 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %.preheader.lr.ph
  %36 = add i32 %.promoted, 1
  %37 = icmp sgt i32 %16, %36
  %smax = select i1 %37, i32 %16, i32 %36
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %35, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit7 ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge3
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %40) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10, !11}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = !{!10}
!13 = !{!11}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
