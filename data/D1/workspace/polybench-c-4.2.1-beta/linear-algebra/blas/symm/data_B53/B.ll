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
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge39._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %._crit_edge.preheader.us.preheader, label %._crit_edge40.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count72 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv70 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next71, %._crit_edge._crit_edge.us ]
  %12 = add i64 %indvars.iv70, %11
  %13 = trunc i64 %12 to i32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv67 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next68, %._crit_edge.us ]
  %14 = add nuw nsw i64 %indvars.iv67, %indvars.iv70
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv70, i64 %indvars.iv67
  store double %18, double* %19, align 8
  %20 = trunc i64 %indvars.iv67 to i32
  %21 = sub i32 %13, %20
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv67
  store double %24, double* %25, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next68, %wide.trip.count
  br i1 %exitcond69, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %._crit_edge39.preheader, label %._crit_edge.preheader.us

._crit_edge39.preheader:                          ; preds = %._crit_edge._crit_edge.us
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %._crit_edge40.preheader.lr.ph, label %._crit_edge39._crit_edge

._crit_edge40.preheader.lr.ph:                    ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge39.preheader
  %27 = sitofp i32 %0 to double
  %28 = sext i32 %0 to i64
  %wide.trip.count65 = zext i32 %0 to i64
  %wide.trip.count59 = zext i32 %0 to i64
  %29 = add nsw i64 %wide.trip.count65, -1
  br label %.lr.ph

._crit_edge39.loopexit.loopexit:                  ; preds = %.lr.ph45
  br label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %._crit_edge39.loopexit.loopexit, %middle.block, %._crit_edge40._crit_edge
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  br i1 %exitcond66, label %._crit_edge39._crit_edge.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge39.loopexit, %._crit_edge40.preheader.lr.ph
  %indvars.iv63 = phi i64 [ 0, %._crit_edge40.preheader.lr.ph ], [ %indvars.iv.next64, %._crit_edge39.loopexit ]
  %indvars.iv61 = phi i64 [ 1, %._crit_edge40.preheader.lr.ph ], [ %indvars.iv.next62, %._crit_edge39.loopexit ]
  %30 = sub i64 %29, %indvars.iv63
  %31 = add i64 %30, -4
  %32 = lshr i64 %31, 2
  %33 = add nuw nsw i64 %32, 1
  %34 = sub i64 %29, %indvars.iv63
  %35 = and i64 %indvars.iv63, 1
  %lcmp.mod = icmp eq i64 %35, 0
  br i1 %lcmp.mod, label %._crit_edge40.prol.preheader, label %._crit_edge40.prol.loopexit.unr-lcssa

._crit_edge40.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge40.prol

._crit_edge40.prol:                               ; preds = %._crit_edge40.prol.preheader
  %36 = trunc i64 %indvars.iv63 to i32
  %37 = srem i32 %36, 100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %27
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 0
  store double %39, double* %40, align 8
  br label %._crit_edge40.prol.loopexit.unr-lcssa

._crit_edge40.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge40.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge40.prol ], [ 0, %.lr.ph ]
  br label %._crit_edge40.prol.loopexit

._crit_edge40.prol.loopexit:                      ; preds = %._crit_edge40.prol.loopexit.unr-lcssa
  %41 = icmp eq i64 %indvars.iv63, 0
  br i1 %41, label %._crit_edge40._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge40.prol.loopexit
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge40 ]
  %42 = add nuw nsw i64 %indvars.iv, %indvars.iv63
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %27
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = add nuw nsw i64 %indvars.iv.next, %indvars.iv63
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 100
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %27
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next
  store double %52, double* %53, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv61
  br i1 %exitcond.1, label %._crit_edge40._crit_edge.unr-lcssa, label %._crit_edge40

._crit_edge40._crit_edge.unr-lcssa:               ; preds = %._crit_edge40
  br label %._crit_edge40._crit_edge

._crit_edge40._crit_edge:                         ; preds = %._crit_edge40.prol.loopexit, %._crit_edge40._crit_edge.unr-lcssa
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %54 = icmp slt i64 %indvars.iv.next64, %28
  br i1 %54, label %.lr.ph45.preheader, label %._crit_edge39.loopexit

.lr.ph45.preheader:                               ; preds = %._crit_edge40._crit_edge
  %min.iters.check = icmp ult i64 %34, 4
  br i1 %min.iters.check, label %.lr.ph45.preheader77, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph45.preheader
  %n.vec = and i64 %34, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv61, %n.vec
  br i1 %cmp.zero, label %.lr.ph45.preheader77, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter78 = and i64 %33, 3
  %lcmp.mod79 = icmp eq i64 %xtraiter78, 0
  br i1 %lcmp.mod79, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter78, %vector.body.prol.preheader ]
  %55 = add i64 %indvars.iv61, %index.prol
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %55
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %57, align 8
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %59, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %60 = icmp ult i64 %31, 12
  br i1 %60, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %61 = add i64 %indvars.iv61, %index
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %61
  %63 = bitcast double* %62 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %63, align 8
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %65, align 8
  %index.next = add i64 %index, 4
  %66 = add i64 %indvars.iv61, %index.next
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %68, align 8
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %70, align 8
  %index.next.1 = add i64 %index, 8
  %71 = add i64 %indvars.iv61, %index.next.1
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %73, align 8
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %75, align 8
  %index.next.2 = add i64 %index, 12
  %76 = add i64 %indvars.iv61, %index.next.2
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %78, align 8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %80, align 8
  %index.next.3 = add i64 %index, 16
  %81 = icmp eq i64 %index.next.3, %n.vec
  br i1 %81, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %34, %n.vec
  br i1 %cmp.n, label %._crit_edge39.loopexit, label %.lr.ph45.preheader77

.lr.ph45.preheader77:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph45.preheader
  %indvars.iv57.ph = phi i64 [ %indvars.iv61, %min.iters.checked ], [ %indvars.iv61, %.lr.ph45.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph45

.lr.ph45:                                         ; preds = %.lr.ph45.preheader77, %.lr.ph45
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.lr.ph45 ], [ %indvars.iv57.ph, %.lr.ph45.preheader77 ]
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv57
  store double -9.990000e+02, double* %82, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge39.loopexit.loopexit, label %.lr.ph45, !llvm.loop !6

._crit_edge39._crit_edge.loopexit:                ; preds = %._crit_edge39.loopexit
  br label %._crit_edge39._crit_edge

._crit_edge39._crit_edge:                         ; preds = %._crit_edge39._crit_edge.loopexit, %7, %._crit_edge39.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %._crit_edge.preheader.us.preheader, label %._crit_edge53

._crit_edge.preheader.us.preheader:               ; preds = %7
  %wide.trip.count84 = zext i32 %0 to i64
  %wide.trip.count80 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count80, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count80, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.us.preheader, %._crit_edge._crit_edge.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %wide.trip.count80
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 0
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %wide.trip.count80
  %13 = icmp sgt i64 %indvars.iv82, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %13, label %._crit_edge44.preheader.us.us.preheader, label %._crit_edge44.preheader.us61.preheader

._crit_edge44.preheader.us.us.preheader:          ; preds = %._crit_edge.preheader.us
  br label %._crit_edge44.preheader.us.us

._crit_edge44.preheader.us61.preheader:           ; preds = %._crit_edge.preheader.us
  br i1 %min.iters.check, label %._crit_edge44.preheader.us61.preheader110, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge44.preheader.us61.preheader
  br i1 %cmp.zero, label %._crit_edge44.preheader.us61.preheader110, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep92, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %14
  %bound198 = icmp ult double* %14, %scevgep90
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  br i1 %conflict.rdx, label %._crit_edge44.preheader.us61.preheader110, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %15 = load double, double* %14, align 8, !alias.scope !8
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %15, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !11, !noalias !13
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !11, !noalias !13
  %24 = fmul <2 x double> %wide.load, %broadcast.splat103
  %25 = fmul <2 x double> %wide.load101, %broadcast.splat103
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !15
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !15
  %30 = fmul <2 x double> %wide.load104, %broadcast.splat107
  %31 = fmul <2 x double> %wide.load105, %broadcast.splat107
  %32 = fmul <2 x double> %30, %17
  %33 = fmul <2 x double> %31, %19
  %34 = fadd <2 x double> %24, %32
  %35 = fadd <2 x double> %25, %33
  %36 = fadd <2 x double> %broadcast.splat109, %34
  %37 = fadd <2 x double> %broadcast.splat109, %35
  %38 = bitcast double* %20 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !11, !noalias !13
  %39 = bitcast double* %22 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge._crit_edge.us, label %._crit_edge44.preheader.us61.preheader110

._crit_edge44.preheader.us61.preheader110:        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge44.preheader.us61.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge44.preheader.us61.preheader ], [ %n.vec, %middle.block ]
  %41 = sub nsw i64 %wide.trip.count80, %indvars.iv.ph
  %xtraiter = and i64 %41, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge44.preheader.us61.prol.loopexit.unr-lcssa, label %._crit_edge44.preheader.us61.prol.preheader

._crit_edge44.preheader.us61.prol.preheader:      ; preds = %._crit_edge44.preheader.us61.preheader110
  br label %._crit_edge44.preheader.us61.prol

._crit_edge44.preheader.us61.prol:                ; preds = %._crit_edge44.preheader.us61.prol.preheader
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.ph
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.ph
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %2
  %48 = load double, double* %14, align 8
  %49 = fmul double %47, %48
  %50 = fadd double %44, %49
  %51 = fadd double %10, %50
  store double %51, double* %42, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %._crit_edge44.preheader.us61.prol.loopexit.unr-lcssa

._crit_edge44.preheader.us61.prol.loopexit.unr-lcssa: ; preds = %._crit_edge44.preheader.us61.preheader110, %._crit_edge44.preheader.us61.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %._crit_edge44.preheader.us61.prol ], [ %indvars.iv.ph, %._crit_edge44.preheader.us61.preheader110 ]
  br label %._crit_edge44.preheader.us61.prol.loopexit

._crit_edge44.preheader.us61.prol.loopexit:       ; preds = %._crit_edge44.preheader.us61.prol.loopexit.unr-lcssa
  %52 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %52, label %._crit_edge._crit_edge.us.loopexit111, label %._crit_edge44.preheader.us61.preheader110.new

._crit_edge44.preheader.us61.preheader110.new:    ; preds = %._crit_edge44.preheader.us61.prol.loopexit
  br label %._crit_edge44.preheader.us61

._crit_edge44.preheader.us61:                     ; preds = %._crit_edge44.preheader.us61, %._crit_edge44.preheader.us61.preheader110.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge44.preheader.us61.preheader110.new ], [ %indvars.iv.next.1, %._crit_edge44.preheader.us61 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %14, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %55, %60
  %62 = fadd double %10, %61
  store double %62, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %14, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %10, %71
  store double %72, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge._crit_edge.us.loopexit111.unr-lcssa, label %._crit_edge44.preheader.us61, !llvm.loop !17

._crit_edge._crit_edge.us.loopexit:               ; preds = %._crit_edge44._crit_edge.us.us
  br label %._crit_edge._crit_edge.us

._crit_edge._crit_edge.us.loopexit111.unr-lcssa:  ; preds = %._crit_edge44.preheader.us61
  br label %._crit_edge._crit_edge.us.loopexit111

._crit_edge._crit_edge.us.loopexit111:            ; preds = %._crit_edge44.preheader.us61.prol.loopexit, %._crit_edge._crit_edge.us.loopexit111.unr-lcssa
  br label %._crit_edge._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us.loopexit111, %._crit_edge._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %._crit_edge53.loopexit, label %._crit_edge.preheader.us

._crit_edge44.preheader.us.us:                    ; preds = %._crit_edge44.preheader.us.us.preheader, %._crit_edge44._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge44._crit_edge.us.us ], [ 0, %._crit_edge44.preheader.us.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  br label %._crit_edge44.us.us

._crit_edge44._crit_edge.us.us:                   ; preds = %._crit_edge44.us.us
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %2
  %80 = load double, double* %14, align 8
  %81 = fmul double %79, %80
  %82 = fadd double %76, %81
  %83 = fmul double %97, %2
  %84 = fadd double %83, %82
  store double %84, double* %74, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge._crit_edge.us.loopexit, label %._crit_edge44.preheader.us.us

._crit_edge44.us.us:                              ; preds = %._crit_edge44.us.us, %._crit_edge44.preheader.us.us
  %indvars.iv72 = phi i64 [ 0, %._crit_edge44.preheader.us.us ], [ %indvars.iv.next73, %._crit_edge44.us.us ]
  %.047.us.us = phi double [ 0.000000e+00, %._crit_edge44.preheader.us.us ], [ %97, %._crit_edge44.us.us ]
  %85 = load double, double* %73, align 8
  %86 = fmul double %85, %2
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv72
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv78
  %94 = load double, double* %93, align 8
  %95 = load double, double* %87, align 8
  %96 = fmul double %94, %95
  %97 = fadd double %.047.us.us, %96
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge44._crit_edge.us.us, label %._crit_edge44.us.us

._crit_edge53.loopexit:                           ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %._crit_edge.preheader.us.preheader, label %._crit_edge15

._crit_edge.preheader.us.preheader:               ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count19 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next18, %._crit_edge._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv17, %10
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us

; <label>:16:                                     ; preds = %._crit_edge.us._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  br i1 %exitcond20, label %._crit_edge15.loopexit, label %._crit_edge.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
