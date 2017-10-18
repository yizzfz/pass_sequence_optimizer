; ModuleID = 'B.ll'
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %17, %14, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %5
  %indvars.iv1511 = phi i64 [ 0, %5 ], [ %indvars.iv.next16, %20 ]
  %6 = add nuw nsw i64 %indvars.iv1511, 1200
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv1310 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next14, %7 ]
  %8 = add nuw nsw i64 %indvars.iv1511, %indvars.iv1310
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 100
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1511, i64 %indvars.iv1310
  store double %12, double* %13, align 8
  %14 = sub nuw nsw i64 %6, %indvars.iv1310
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1511, i64 %indvars.iv1310
  store double %18, double* %19, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1310, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond2, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1511, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond3, label %..._crit_edge18_crit_edge_crit_edge, label %._crit_edge

..._crit_edge18_crit_edge_crit_edge:              ; preds = %20
  br label %.._crit_edge18_crit_edge

.._crit_edge18_crit_edge:                         ; preds = %._crit_edge19._crit_edge, %..._crit_edge18_crit_edge_crit_edge
  %21 = phi i64 [ 1, %..._crit_edge18_crit_edge_crit_edge ], [ %73, %._crit_edge19._crit_edge ]
  %indvars.iv99 = phi i64 [ 1, %..._crit_edge18_crit_edge_crit_edge ], [ %indvars.iv.next10, %._crit_edge19._crit_edge ]
  %indvars.iv117 = phi i64 [ 0, %..._crit_edge18_crit_edge_crit_edge ], [ %indvars.iv.next12, %._crit_edge19._crit_edge ]
  %22 = and i64 %indvars.iv117, 1
  %lcmp.mod = icmp eq i64 %22, 0
  br i1 %lcmp.mod, label %._crit_edge18.prol.preheader, label %._crit_edge18.prol.loopexit.unr-lcssa

._crit_edge18.prol.preheader:                     ; preds = %.._crit_edge18_crit_edge
  br label %._crit_edge18.prol

._crit_edge18.prol:                               ; preds = %._crit_edge18.prol.preheader
  %23 = trunc i64 %indvars.iv117 to i32
  %24 = srem i32 %23, 100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 0
  store double %26, double* %27, align 8
  br label %._crit_edge18.prol.loopexit.unr-lcssa

._crit_edge18.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge18.prol, %.._crit_edge18_crit_edge
  %indvars.iv4.unr.ph = phi i64 [ 1, %._crit_edge18.prol ], [ 0, %.._crit_edge18_crit_edge ]
  br label %._crit_edge18.prol.loopexit

._crit_edge18.prol.loopexit:                      ; preds = %._crit_edge18.prol.loopexit.unr-lcssa
  %28 = icmp eq i64 %indvars.iv117, 0
  br i1 %28, label %._crit_edge18.._crit_edge19_crit_edge, label %.._crit_edge18_crit_edge.new

.._crit_edge18_crit_edge.new:                     ; preds = %._crit_edge18.prol.loopexit
  br label %._crit_edge18

._crit_edge18.._crit_edge19_crit_edge.unr-lcssa:  ; preds = %._crit_edge18
  br label %._crit_edge18.._crit_edge19_crit_edge

._crit_edge18.._crit_edge19_crit_edge:            ; preds = %._crit_edge18.._crit_edge19_crit_edge.unr-lcssa, %._crit_edge18.prol.loopexit
  %exitcond175 = icmp eq i64 %21, 1000
  br i1 %exitcond175, label %._crit_edge19._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge18.._crit_edge19_crit_edge
  %29 = sub nsw i64 1000, %21
  %min.iters.check = icmp ult i64 %29, 4
  br i1 %min.iters.check, label %._crit_edge19.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %29, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %21, %n.vec
  br i1 %cmp.zero, label %._crit_edge19.preheader, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  %30 = add nsw i64 %n.vec, -4
  %31 = lshr exact i64 %30, 2
  %32 = add nuw nsw i64 %31, 1
  %xtraiter14 = and i64 %32, 3
  %lcmp.mod15 = icmp eq i64 %xtraiter14, 0
  br i1 %lcmp.mod15, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %min.iters.checked.vector.body_crit_edge
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter14, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %33 = add i64 %21, %index.prol
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %37, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %min.iters.checked.vector.body_crit_edge
  %index.unr = phi i64 [ 0, %min.iters.checked.vector.body_crit_edge ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %38 = icmp ult i64 %30, 12
  br i1 %38, label %middle.block, label %min.iters.checked.vector.body_crit_edge.new

min.iters.checked.vector.body_crit_edge.new:      ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %min.iters.checked.vector.body_crit_edge.new
  %index = phi i64 [ %index.unr, %min.iters.checked.vector.body_crit_edge.new ], [ %index.next.3, %vector.body ]
  %39 = add i64 %21, %index
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %39
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %41, align 8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %43, align 8
  %index.next = add i64 %index, 4
  %44 = add i64 %21, %index.next
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %44
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %46, align 8
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %48, align 8
  %index.next.1 = add i64 %index, 8
  %49 = add i64 %21, %index.next.1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %49
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %51, align 8
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %53, align 8
  %index.next.2 = add i64 %index, 12
  %54 = add i64 %21, %index.next.2
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %58, align 8
  %index.next.3 = add i64 %index, 16
  %59 = icmp eq i64 %index.next.3, %n.vec
  br i1 %59, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %29, %n.vec
  br i1 %cmp.n, label %._crit_edge19._crit_edge, label %._crit_edge19.preheader

._crit_edge19.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph
  %indvars.iv56.ph = phi i64 [ %21, %.lr.ph ], [ %21, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %._crit_edge19

._crit_edge18:                                    ; preds = %._crit_edge18, %.._crit_edge18_crit_edge.new
  %indvars.iv4 = phi i64 [ %indvars.iv4.unr.ph, %.._crit_edge18_crit_edge.new ], [ %indvars.iv.next.1, %._crit_edge18 ]
  %60 = add nuw nsw i64 %indvars.iv117, %indvars.iv4
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 100
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, 1.000000e+03
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv4
  store double %64, double* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %66 = add nuw nsw i64 %indvars.iv117, %indvars.iv.next
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, 100
  %69 = sitofp i32 %68 to double
  %70 = fdiv double %69, 1.000000e+03
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv.next
  store double %70, double* %71, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv99
  br i1 %exitcond.1, label %._crit_edge18.._crit_edge19_crit_edge.unr-lcssa, label %._crit_edge18

._crit_edge19:                                    ; preds = %._crit_edge19, %._crit_edge19.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv56.ph, %._crit_edge19.preheader ], [ %indvars.iv.next6, %._crit_edge19 ]
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv56
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next6 = add nsw i64 %indvars.iv56, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond17, label %._crit_edge19._crit_edge.loopexit, label %._crit_edge19, !llvm.loop !6

._crit_edge19._crit_edge.loopexit:                ; preds = %._crit_edge19
  br label %._crit_edge19._crit_edge

._crit_edge19._crit_edge:                         ; preds = %._crit_edge19._crit_edge.loopexit, %middle.block, %._crit_edge18.._crit_edge19_crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv117, 1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv99, 1
  %indvars.iv.next4 = shl nsw i64 %21, 32
  %sext = add i64 %indvars.iv.next4, 4294967296
  %73 = ashr exact i64 %sext, 32
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond1, label %74, label %.._crit_edge18_crit_edge

; <label>:74:                                     ; preds = %._crit_edge19._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %34, %5
  %indvars.iv98 = phi i64 [ 0, %5 ], [ %indvars.iv.next10, %34 ]
  %exitcond3 = icmp eq i64 %indvars.iv98, 0
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv98, i64 %indvars.iv98
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv77 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next8, %._crit_edge ]
  br i1 %exitcond3, label %._crit_edge, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %7
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv98, i64 %indvars.iv77
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge
  %9 = phi double [ 0.000000e+00, %..lr.ph_crit_edge ], [ %22, %.lr.ph ]
  %indvars.iv4 = phi i64 [ 0, %..lr.ph_crit_edge ], [ %indvars.iv.next, %.lr.ph ]
  %10 = load double, double* %8, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv98, i64 %indvars.iv4
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv77
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %15, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4, i64 %indvars.iv77
  %19 = load double, double* %18, align 8
  %20 = load double, double* %12, align 8
  %21 = fmul double %19, %20
  %22 = fadd double %9, %21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv98
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %7
  %.lcssa = phi double [ 0.000000e+00, %7 ], [ %22, %._crit_edge.loopexit ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv98, i64 %indvars.iv77
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv98, i64 %indvars.iv77
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %0
  %29 = load double, double* %6, align 8
  %30 = fmul double %28, %29
  %31 = fadd double %25, %30
  %32 = fmul double %.lcssa, %0
  %33 = fadd double %31, %32
  store double %33, double* %23, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond1, label %34, label %7

; <label>:34:                                     ; preds = %._crit_edge
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond2, label %35, label %.._crit_edge_crit_edge

; <label>:35:                                     ; preds = %34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge4, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge4 ]
  %8 = add nuw nsw i64 %6, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge4

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge4
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
