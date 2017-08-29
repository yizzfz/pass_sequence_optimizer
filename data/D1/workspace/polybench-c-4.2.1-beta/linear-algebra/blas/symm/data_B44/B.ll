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
  %30 = load [1200 x double]*, [1200 x double]** %20, align 8
  %31 = load [1000 x double]*, [1000 x double]** %22, align 8
  %32 = load [1200 x double]*, [1200 x double]** %24, align 8
  call void @kernel_symm(i32 %26, i32 %27, double %28, double %29, [1200 x double]* %30, [1000 x double]* %31, [1200 x double]* %32)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %33 = load i32, i32* %3, align 4
  %34 = icmp sgt i32 %33, 42
  br i1 %34, label %35, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %44

; <label>:35:                                     ; preds = %2
  %36 = load i8**, i8*** %4, align 8
  %37 = load i8*, i8** %36, align 8
  %strcmpload = load i8, i8* %37, align 1
  %38 = icmp eq i8 %strcmpload, 0
  br i1 %38, label %39, label %._crit_edge2

._crit_edge2:                                     ; preds = %35
  br label %44

; <label>:39:                                     ; preds = %35
  %40 = bitcast [1000 x [1200 x double]]** %9 to [1200 x double]**
  %41 = load i32, i32* %5, align 4
  %42 = load i32, i32* %6, align 4
  %43 = load [1200 x double]*, [1200 x double]** %40, align 8
  call void @print_array(i32 %41, i32 %42, [1200 x double]* %43)
  br label %44

; <label>:44:                                     ; preds = %._crit_edge2, %._crit_edge, %39
  %45 = bitcast [1000 x [1200 x double]]** %11 to i8**
  %46 = bitcast [1000 x [1000 x double]]** %10 to i8**
  %47 = bitcast [1000 x [1200 x double]]** %9 to i8**
  %48 = load i8*, i8** %47, align 8
  call void @free(i8* %48) #4
  %49 = load i8*, i8** %46, align 8
  call void @free(i8* %49) #4
  %50 = load i8*, i8** %45, align 8
  call void @free(i8* %50) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
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
  br label %110

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
  %25 = load i32, i32* %9, align 4
  %26 = sext i32 %25 to i64
  br i1 %18, label %.preheader7.us.preheader, label %.preheader7.lr.ph..preheader6_crit_edge

.preheader7.lr.ph..preheader6_crit_edge:          ; preds = %.preheader7.lr.ph
  br label %.preheader6

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %.promoted23 = load i32, i32* %13, align 4
  %27 = sext i32 %.promoted23 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us..preheader7.us_crit_edge, %.preheader7.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge19.us..preheader7.us_crit_edge ], [ %27, %.preheader7.us.preheader ]
  %28 = add i64 %indvars.iv44, %17
  %29 = trunc i64 %28 to i32
  br label %30

; <label>:30:                                     ; preds = %._crit_edge50, %.preheader7.us
  %indvars.iv42 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next43, %._crit_edge50 ]
  %31 = add nsw i64 %indvars.iv44, %indvars.iv42
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %21
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv44, i64 %indvars.iv42
  store double %35, double* %36, align 8
  %37 = trunc i64 %indvars.iv42 to i32
  %38 = sub i32 %29, %37
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %23
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv44, i64 %indvars.iv42
  store double %41, double* %42, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %43 = icmp slt i64 %indvars.iv.next43, %26
  br i1 %43, label %._crit_edge50, label %._crit_edge19.us

._crit_edge50:                                    ; preds = %30
  br label %30

._crit_edge19.us:                                 ; preds = %30
  %indvars.iv.next45 = add i64 %indvars.iv44, 1
  %44 = icmp slt i64 %indvars.iv.next45, %20
  br i1 %44, label %._crit_edge19.us..preheader7.us_crit_edge, label %.preheader6.loopexit

._crit_edge19.us..preheader7.us_crit_edge:        ; preds = %._crit_edge19.us
  br label %.preheader7.us

.preheader6.loopexit:                             ; preds = %._crit_edge19.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader7.lr.ph..preheader6_crit_edge, %.preheader6.loopexit
  %.pr = load i32, i32* %8, align 4
  store i32 0, i32* %13, align 4
  %45 = icmp sgt i32 %.pr, 0
  br i1 %45, label %.preheader5.lr.ph, label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6
  br label %110

.preheader5.lr.ph:                                ; preds = %.preheader6
  %46 = load i32, i32* %8, align 4
  %47 = load [1000 x double]*, [1000 x double]** %11, align 8
  %48 = sitofp i32 %46 to double
  %.promoted = load i32, i32* %13, align 4
  %49 = add i32 %.promoted, 1
  %50 = add i32 %46, -1
  %51 = sext i32 %.promoted to i64
  %52 = sext i32 %46 to i64
  %53 = sext i32 %46 to i64
  %54 = sext i32 %50 to i64
  %55 = add nsw i64 %54, 1
  %wide.trip.count38.3 = sext i32 %50 to i64
  %56 = add nsw i64 %wide.trip.count38.3, -3
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge..preheader5_crit_edge, %.preheader5.lr.ph
  %indvar = phi i32 [ %indvar.next, %._crit_edge..preheader5_crit_edge ], [ 0, %.preheader5.lr.ph ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge..preheader5_crit_edge ], [ %51, %.preheader5.lr.ph ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge..preheader5_crit_edge ], [ %49, %.preheader5.lr.ph ]
  %indvars.iv32 = phi i32 [ %indvars.iv.next33, %._crit_edge..preheader5_crit_edge ], [ %.promoted, %.preheader5.lr.ph ]
  %57 = add i32 %.promoted, %indvar
  %58 = add i32 %49, %indvar
  %59 = sext i32 %58 to i64
  %60 = sub nsw i64 %55, %59
  %61 = sub nsw i64 %54, %59
  %62 = sext i32 %indvars.iv34 to i64
  %63 = icmp slt i64 %indvars.iv40, 0
  br i1 %63, label %.preheader5..preheader_crit_edge, label %.lr.ph.preheader

.preheader5..preheader_crit_edge:                 ; preds = %.preheader5
  br label %.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv32 to i64
  %64 = and i32 %57, 1
  %lcmp.mod49 = icmp eq i32 %64, 0
  br i1 %lcmp.mod49, label %.lr.ph.prol.preheader, label %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge

.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %65 = trunc i64 %indvars.iv40 to i32
  %66 = srem i32 %65, 100
  %67 = sitofp i32 %66 to double
  %68 = fdiv double %67, %48
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 0
  store double %68, double* %69, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %70 = icmp eq i32 %57, 0
  br i1 %70, label %.lr.ph.prol.loopexit..preheader.loopexit_crit_edge, label %.lr.ph.preheader.new

.lr.ph.prol.loopexit..preheader.loopexit_crit_edge: ; preds = %.lr.ph.prol.loopexit
  br label %.preheader.loopexit

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph.prol.loopexit..preheader.loopexit_crit_edge, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader5..preheader_crit_edge, %.preheader.loopexit
  %indvars.iv.next41 = add i64 %indvars.iv40, 1
  %71 = icmp slt i64 %indvars.iv.next41, %53
  br i1 %71, label %.lr.ph13, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph13:                                         ; preds = %.preheader
  %xtraiter = and i64 %60, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph13..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph13..prol.loopexit_crit_edge:                ; preds = %.lr.ph13
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv36.prol = phi i64 [ %indvars.iv.next37.prol, %.prol.preheader..prol.preheader_crit_edge ], [ %62, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv36.prol
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next37.prol = add nsw i64 %indvars.iv36.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph13..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv36.unr = phi i64 [ %62, %.lr.ph13..prol.loopexit_crit_edge ], [ %indvars.iv.next37.prol, %.prol.loopexit.loopexit ]
  %73 = icmp ult i64 %61, 3
  br i1 %73, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph13.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  %74 = sub i64 %56, %indvars.iv36.unr
  %75 = lshr i64 %74, 2
  %76 = add nuw nsw i64 %75, 1
  %min.iters.check = icmp ult i64 %76, 4
  br i1 %min.iters.check, label %.lr.ph13.new.preheader..lr.ph13.new.preheader47_crit_edge, label %min.iters.checked

.lr.ph13.new.preheader..lr.ph13.new.preheader47_crit_edge: ; preds = %.lr.ph13.new.preheader
  br label %.lr.ph13.new.preheader47

.lr.ph13.new.preheader47:                         ; preds = %middle.block..lr.ph13.new.preheader47_crit_edge, %min.iters.checked..lr.ph13.new.preheader47_crit_edge, %.lr.ph13.new.preheader..lr.ph13.new.preheader47_crit_edge
  %indvars.iv36.ph = phi i64 [ %indvars.iv36.unr, %min.iters.checked..lr.ph13.new.preheader47_crit_edge ], [ %indvars.iv36.unr, %.lr.ph13.new.preheader..lr.ph13.new.preheader47_crit_edge ], [ %ind.end, %middle.block..lr.ph13.new.preheader47_crit_edge ]
  br label %.lr.ph13.new

min.iters.checked:                                ; preds = %.lr.ph13.new.preheader
  %n.mod.vf = and i64 %76, 3
  %n.vec = sub nsw i64 %76, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %77 = add i64 %indvars.iv36.unr, 4
  %78 = shl nuw i64 %75, 2
  %79 = add i64 %77, %78
  %80 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %79, %80
  br i1 %cmp.zero, label %min.iters.checked..lr.ph13.new.preheader47_crit_edge, label %vector.body.preheader

min.iters.checked..lr.ph13.new.preheader47_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph13.new.preheader47

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %81 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv36.unr, %81
  %82 = add i64 %indvars.iv36.unr, %81
  %83 = add nsw i64 %82, 3
  %84 = add i64 %offset.idx, 11
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %83
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %84
  %87 = getelementptr double, double* %85, i64 -3
  %88 = bitcast double* %87 to <8 x double>*
  %89 = getelementptr double, double* %86, i64 -3
  %90 = bitcast double* %89 to <8 x double>*
  store <8 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <8 x double>* %88, align 8
  store <8 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <8 x double>* %90, align 8
  %index.next = add i64 %index, 4
  %91 = icmp eq i64 %index.next, %n.vec
  br i1 %91, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.._crit_edge_crit_edge, label %middle.block..lr.ph13.new.preheader47_crit_edge

middle.block..lr.ph13.new.preheader47_crit_edge:  ; preds = %middle.block
  br label %.lr.ph13.new.preheader47

middle.block.._crit_edge_crit_edge:               ; preds = %middle.block
  br label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph..lr.ph_crit_edge ]
  %92 = add nsw i64 %indvars.iv40, %indvars.iv
  %93 = trunc i64 %92 to i32
  %94 = srem i32 %93, 100
  %95 = sitofp i32 %94 to double
  %96 = fdiv double %95, %48
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv
  store double %96, double* %97, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = add nsw i64 %indvars.iv40, %indvars.iv.next
  %99 = trunc i64 %98 to i32
  %100 = srem i32 %99, 100
  %101 = sitofp i32 %100 to double
  %102 = fdiv double %101, %48
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %102, double* %103, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new..lr.ph13.new_crit_edge, %.lr.ph13.new.preheader47
  %indvars.iv36 = phi i64 [ %indvars.iv.next37.3, %.lr.ph13.new..lr.ph13.new_crit_edge ], [ %indvars.iv36.ph, %.lr.ph13.new.preheader47 ]
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv36
  store double -9.990000e+02, double* %104, align 8
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next37
  store double -9.990000e+02, double* %105, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next37.1
  store double -9.990000e+02, double* %106, align 8
  %indvars.iv.next37.2 = add nsw i64 %indvars.iv36, 3
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 %indvars.iv40, i64 %indvars.iv.next37.2
  store double -9.990000e+02, double* %107, align 8
  %indvars.iv.next37.3 = add nsw i64 %indvars.iv36, 4
  %exitcond39.3 = icmp eq i64 %indvars.iv.next37.2, %wide.trip.count38.3
  br i1 %exitcond39.3, label %._crit_edge.loopexit, label %.lr.ph13.new..lr.ph13.new_crit_edge, !llvm.loop !6

.lr.ph13.new..lr.ph13.new_crit_edge:              ; preds = %.lr.ph13.new
  br label %.lr.ph13.new

._crit_edge.loopexit:                             ; preds = %.lr.ph13.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %middle.block.._crit_edge_crit_edge, %.prol.loopexit.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %108 = icmp slt i64 %indvars.iv.next41, %52
  br i1 %108, label %._crit_edge..preheader5_crit_edge, label %._crit_edge14

._crit_edge..preheader5_crit_edge:                ; preds = %._crit_edge
  %indvars.iv.next33 = add i32 %indvars.iv32, 1
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader5

._crit_edge14:                                    ; preds = %._crit_edge
  %109 = trunc i64 %indvars.iv.next41 to i32
  store i32 %109, i32* %13, align 4
  br label %110

; <label>:110:                                    ; preds = %.preheader6._crit_edge, %.preheader6.thread, %._crit_edge14
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

._crit_edge:                                      ; preds = %7
  br label %107

.preheader.lr.ph:                                 ; preds = %7
  %20 = load i32, i32* %9, align 4
  %21 = load double, double* %11, align 8
  %22 = load [1200 x double]*, [1200 x double]** %12, align 8
  %23 = load double, double* %10, align 8
  %24 = load [1200 x double]*, [1200 x double]** %14, align 8
  %25 = load [1000 x double]*, [1000 x double]** %13, align 8
  %26 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %16, align 4
  %.promoted18 = load i32, i32* %15, align 4
  %.promoted20 = load double, double* %17, align 8
  %27 = sext i32 %20 to i64
  %28 = add i32 %.promoted18, -1
  %29 = sext i32 %20 to i64
  %30 = sext i32 %.promoted18 to i64
  %31 = sext i32 %26 to i64
  %32 = fmul double %23, 0.000000e+00
  %33 = icmp sgt i32 %20, 0
  %min.iters.check = icmp ult i32 %20, 4
  %n.vec = and i64 %29, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert51 = insertelement <2 x double> undef, double %21, i32 0
  %broadcast.splat52 = shufflevector <2 x double> %broadcast.splatinsert51, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert55 = insertelement <2 x double> undef, double %23, i32 0
  %broadcast.splat56 = shufflevector <2 x double> %broadcast.splatinsert55, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert57 = insertelement <2 x double> undef, double %32, i32 0
  %broadcast.splat58 = shufflevector <2 x double> %broadcast.splatinsert57, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %29, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge8..preheader_crit_edge, %.preheader.lr.ph
  %indvar = phi i64 [ %indvar.next, %._crit_edge8..preheader_crit_edge ], [ 0, %.preheader.lr.ph ]
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge8..preheader_crit_edge ], [ %30, %.preheader.lr.ph ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %._crit_edge8..preheader_crit_edge ], [ %28, %.preheader.lr.ph ]
  %.lcssa613.lcssa21 = phi double [ %.lcssa613.lcssa22, %._crit_edge8..preheader_crit_edge ], [ %.promoted20, %.preheader.lr.ph ]
  %.lcssa412.lcssa16 = phi i32 [ %.lcssa412.lcssa17, %._crit_edge8..preheader_crit_edge ], [ %.promoted, %.preheader.lr.ph ]
  %34 = add i64 %30, %indvar
  %scevgep = getelementptr [1200 x double], [1200 x double]* %22, i64 %34, i64 0
  %scevgep39 = getelementptr [1200 x double], [1200 x double]* %22, i64 %34, i64 %29
  %scevgep41 = getelementptr [1200 x double], [1200 x double]* %24, i64 %34, i64 0
  %scevgep43 = getelementptr [1200 x double], [1200 x double]* %24, i64 %34, i64 %29
  %35 = add i32 %indvars.iv28, 1
  br i1 %33, label %.lr.ph7, label %.preheader.._crit_edge8_crit_edge

.preheader.._crit_edge8_crit_edge:                ; preds = %.preheader
  br label %._crit_edge8

.lr.ph7:                                          ; preds = %.preheader
  %36 = icmp sgt i64 %indvars.iv32, 0
  br i1 %36, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.lr.ph7
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv32, i64 %indvars.iv32
  br i1 %min.iters.check, label %.lr.ph7.split.preheader..lr.ph7.split.preheader59_crit_edge, label %min.iters.checked

.lr.ph7.split.preheader..lr.ph7.split.preheader59_crit_edge: ; preds = %.lr.ph7.split.preheader
  br label %.lr.ph7.split.preheader59

.lr.ph7.split.preheader59:                        ; preds = %middle.block..lr.ph7.split.preheader59_crit_edge, %vector.memcheck..lr.ph7.split.preheader59_crit_edge, %min.iters.checked..lr.ph7.split.preheader59_crit_edge, %.lr.ph7.split.preheader..lr.ph7.split.preheader59_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck..lr.ph7.split.preheader59_crit_edge ], [ 0, %min.iters.checked..lr.ph7.split.preheader59_crit_edge ], [ 0, %.lr.ph7.split.preheader..lr.ph7.split.preheader59_crit_edge ], [ %n.vec, %middle.block..lr.ph7.split.preheader59_crit_edge ]
  br label %.lr.ph7.split

min.iters.checked:                                ; preds = %.lr.ph7.split.preheader
  br i1 %cmp.zero, label %min.iters.checked..lr.ph7.split.preheader59_crit_edge, label %vector.memcheck

min.iters.checked..lr.ph7.split.preheader59_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph7.split.preheader59

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep43
  %bound1 = icmp ult double* %scevgep41, %scevgep39
  %found.conflict = and i1 %bound0, %bound1
  %bound046 = icmp ult double* %scevgep, %37
  %bound147 = icmp ult double* %37, %scevgep39
  %found.conflict48 = and i1 %bound046, %bound147
  %conflict.rdx = or i1 %found.conflict, %found.conflict48
  br i1 %conflict.rdx, label %vector.memcheck..lr.ph7.split.preheader59_crit_edge, label %vector.ph

vector.memcheck..lr.ph7.split.preheader59_crit_edge: ; preds = %vector.memcheck
  br label %.lr.ph7.split.preheader59

vector.ph:                                        ; preds = %vector.memcheck
  %38 = load double, double* %37, align 8, !alias.scope !8
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = insertelement <2 x double> undef, double %38, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv32, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !11, !noalias !13
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !11, !noalias !13
  %47 = fmul <2 x double> %broadcast.splat52, %wide.load
  %48 = fmul <2 x double> %broadcast.splat52, %wide.load50
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %index
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !15
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !15
  %53 = fmul <2 x double> %broadcast.splat56, %wide.load53
  %54 = fmul <2 x double> %broadcast.splat56, %wide.load54
  %55 = fmul <2 x double> %53, %40
  %56 = fmul <2 x double> %54, %42
  %57 = fadd <2 x double> %47, %55
  %58 = fadd <2 x double> %48, %56
  %59 = fadd <2 x double> %57, %broadcast.splat58
  %60 = fadd <2 x double> %58, %broadcast.splat58
  %61 = bitcast double* %43 to <2 x double>*
  store <2 x double> %59, <2 x double>* %61, align 8, !alias.scope !11, !noalias !13
  %62 = bitcast double* %45 to <2 x double>*
  store <2 x double> %60, <2 x double>* %62, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %63 = icmp eq i64 %index.next, %n.vec
  br i1 %63, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge8_crit_edge, label %middle.block..lr.ph7.split.preheader59_crit_edge

middle.block..lr.ph7.split.preheader59_crit_edge: ; preds = %middle.block
  br label %.lr.ph7.split.preheader59

middle.block.._crit_edge8_crit_edge:              ; preds = %middle.block
  br label %._crit_edge8

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  %wide.trip.count = zext i32 %indvars.iv28 to i64
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv32, i64 %indvars.iv32
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us..lr.ph7.split.us_crit_edge, %.lr.ph7.split.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us..lr.ph7.split.us_crit_edge ], [ 0, %.lr.ph7.split.us.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %indvars.iv30
  br label %66

; <label>:66:                                     ; preds = %._crit_edge61, %.lr.ph7.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next27, %._crit_edge61 ]
  %67 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %81, %._crit_edge61 ]
  %68 = load double, double* %65, align 8
  %69 = fmul double %23, %68
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv32, i64 %indvars.iv26
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv26, i64 %indvars.iv30
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  store double %75, double* %73, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv26, i64 %indvars.iv30
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv32, i64 %indvars.iv26
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %67, %80
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv26, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge61

._crit_edge61:                                    ; preds = %66
  br label %66

._crit_edge.us:                                   ; preds = %66
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv32, i64 %indvars.iv30
  %83 = load double, double* %82, align 8
  %84 = fmul double %21, %83
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %indvars.iv30
  %86 = load double, double* %85, align 8
  %87 = fmul double %23, %86
  %88 = load double, double* %64, align 8
  %89 = fmul double %87, %88
  %90 = fadd double %84, %89
  %91 = fmul double %23, %81
  %92 = fadd double %90, %91
  store double %92, double* %82, align 8
  %indvars.iv.next31 = add nuw i64 %indvars.iv30, 1
  %93 = icmp slt i64 %indvars.iv.next31, %29
  br i1 %93, label %._crit_edge.us..lr.ph7.split.us_crit_edge, label %._crit_edge8.loopexit

._crit_edge.us..lr.ph7.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph7.split.us

.lr.ph7.split:                                    ; preds = %.lr.ph7.split..lr.ph7.split_crit_edge, %.lr.ph7.split.preheader59
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph7.split..lr.ph7.split_crit_edge ], [ %indvars.iv.ph, %.lr.ph7.split.preheader59 ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %indvars.iv32, i64 %indvars.iv
  %95 = load double, double* %94, align 8
  %96 = fmul double %21, %95
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %indvars.iv32, i64 %indvars.iv
  %98 = load double, double* %97, align 8
  %99 = fmul double %23, %98
  %100 = load double, double* %37, align 8
  %101 = fmul double %99, %100
  %102 = fadd double %96, %101
  %103 = fadd double %102, %32
  store double %103, double* %94, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %104 = icmp slt i64 %indvars.iv.next, %27
  br i1 %104, label %.lr.ph7.split..lr.ph7.split_crit_edge, label %._crit_edge8.loopexit60, !llvm.loop !17

.lr.ph7.split..lr.ph7.split_crit_edge:            ; preds = %.lr.ph7.split
  br label %.lr.ph7.split

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit60:                          ; preds = %.lr.ph7.split
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %middle.block.._crit_edge8_crit_edge, %.preheader.._crit_edge8_crit_edge, %._crit_edge8.loopexit60, %._crit_edge8.loopexit
  %.lcssa613.lcssa22 = phi double [ %.lcssa613.lcssa21, %.preheader.._crit_edge8_crit_edge ], [ 0.000000e+00, %middle.block.._crit_edge8_crit_edge ], [ %81, %._crit_edge8.loopexit ], [ 0.000000e+00, %._crit_edge8.loopexit60 ]
  %.lcssa412.lcssa17 = phi i32 [ %.lcssa412.lcssa16, %.preheader.._crit_edge8_crit_edge ], [ 0, %middle.block.._crit_edge8_crit_edge ], [ %35, %._crit_edge8.loopexit ], [ 0, %._crit_edge8.loopexit60 ]
  %indvars.iv.next33 = add i64 %indvars.iv32, 1
  %105 = icmp slt i64 %indvars.iv.next33, %31
  %indvars.iv.next29 = add i32 %indvars.iv28, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %105, label %._crit_edge8..preheader_crit_edge, label %._crit_edge14

._crit_edge8..preheader_crit_edge:                ; preds = %._crit_edge8
  br label %.preheader

._crit_edge14:                                    ; preds = %._crit_edge8
  %106 = trunc i64 %indvars.iv.next33 to i32
  store i32 %.lcssa412.lcssa17, i32* %16, align 4
  store i32 %106, i32* %15, align 4
  store double %.lcssa613.lcssa22, double* %17, align 8
  br label %107

; <label>:107:                                    ; preds = %._crit_edge, %._crit_edge14
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
  br i1 %13, label %.preheader.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %40

.preheader.lr.ph:                                 ; preds = %3
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = icmp sgt i32 %14, 0
  %17 = load i32, i32* %4, align 4
  %18 = sext i32 %17 to i64
  %19 = sext i32 %17 to i64
  %20 = load [1200 x double]*, [1200 x double]** %6, align 8
  %.promoted5 = load i32, i32* %7, align 4
  br i1 %16, label %.preheader.us.preheader, label %.preheader.._crit_edge4_crit_edge

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %21 = sext i32 %.promoted5 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us..preheader.us_crit_edge ], [ %21, %.preheader.us.preheader ]
  %22 = mul nsw i64 %19, %indvars.iv12
  br label %23

; <label>:23:                                     ; preds = %._crit_edge15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge15 ]
  %24 = add nsw i64 %22, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %._crit_edge14

._crit_edge14:                                    ; preds = %23
  br label %30

; <label>:28:                                     ; preds = %23
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %29) #5
  br label %30

; <label>:30:                                     ; preds = %._crit_edge14, %28
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv12, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %35 = icmp slt i64 %indvars.iv.next, %15
  br i1 %35, label %._crit_edge15, label %._crit_edge.us

._crit_edge15:                                    ; preds = %30
  br label %23

._crit_edge.us:                                   ; preds = %30
  %indvars.iv.next13 = add i64 %indvars.iv12, 1
  %36 = icmp slt i64 %indvars.iv.next13, %18
  br i1 %36, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge.us.._crit_edge4_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.us.._crit_edge4_crit_edge:            ; preds = %._crit_edge.us
  %37 = trunc i64 %indvars.iv.next13 to i32
  br label %._crit_edge4

.preheader.._crit_edge4_crit_edge:                ; preds = %.preheader.lr.ph
  %38 = add i32 %.promoted5, 1
  %39 = icmp sgt i32 %17, %38
  %smax = select i1 %39, i32 %17, i32 %38
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.preheader.._crit_edge4_crit_edge, %._crit_edge.us.._crit_edge4_crit_edge
  %.lcssa6 = phi i32 [ %37, %._crit_edge.us.._crit_edge4_crit_edge ], [ %smax, %.preheader.._crit_edge4_crit_edge ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %40

; <label>:40:                                     ; preds = %._crit_edge, %._crit_edge4
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %43) #5
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
