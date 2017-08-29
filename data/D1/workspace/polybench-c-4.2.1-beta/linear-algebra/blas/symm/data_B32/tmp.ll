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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader38.lr.ph, label %._crit_edge44

.preheader38.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader38.lr.ph..preheader38.us_crit_edge, label %.preheader38.lr.ph..preheader36.lr.ph_crit_edge

.preheader38.lr.ph..preheader36.lr.ph_crit_edge:  ; preds = %.preheader38.lr.ph
  %.pre = sext i32 %0 to i64
  br label %.preheader36.lr.ph

.preheader38.lr.ph..preheader38.us_crit_edge:     ; preds = %.preheader38.lr.ph
  %11 = add i32 %1, -1
  %12 = zext i32 %1 to i64
  %13 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %11 to i64
  br label %.preheader38.us

.preheader38.us:                                  ; preds = %._crit_edge47.us, %.preheader38.lr.ph..preheader38.us_crit_edge
  %indvars.iv66 = phi i64 [ 0, %.preheader38.lr.ph..preheader38.us_crit_edge ], [ %indvars.iv.next67, %._crit_edge47.us ]
  %14 = add i64 %indvars.iv66, %12
  %15 = trunc i64 %14 to i32
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader38.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %16 ], [ 0, %.preheader38.us ]
  %17 = add nuw nsw i64 %indvars.iv63, %indvars.iv66
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 100
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %10
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv63
  store double %21, double* %22, align 8
  %23 = trunc i64 %indvars.iv63 to i32
  %24 = sub i32 %15, %23
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %10
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv63
  store double %27, double* %28, align 8
  %exitcond65 = icmp eq i64 %indvars.iv63, %wide.trip.count
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br i1 %exitcond65, label %._crit_edge47.us, label %16

._crit_edge47.us:                                 ; preds = %16
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %29 = icmp slt i64 %indvars.iv.next67, %13
  br i1 %29, label %.preheader38.us, label %.preheader36.lr.ph.loopexit

.preheader36.lr.ph.loopexit:                      ; preds = %._crit_edge47.us
  br label %.preheader36.lr.ph

.preheader36.lr.ph:                               ; preds = %.preheader36.lr.ph.loopexit, %.preheader38.lr.ph..preheader36.lr.ph_crit_edge
  %.pre-phi = phi i64 [ %.pre, %.preheader38.lr.ph..preheader36.lr.ph_crit_edge ], [ %13, %.preheader36.lr.ph.loopexit ]
  %30 = add i32 %0, -1
  %wide.trip.count59 = sext i32 %30 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader36.lr.ph
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge ], [ 0, %.preheader36.lr.ph ]
  %indvars.iv55 = phi i32 [ %indvars.iv.next56, %._crit_edge ], [ 1, %.preheader36.lr.ph ]
  %31 = sub i64 %wide.trip.count59, %indvars.iv61
  %32 = add i64 %31, -4
  %33 = lshr i64 %32, 2
  %34 = add nuw nsw i64 %33, 1
  %35 = sub i64 %wide.trip.count59, %indvars.iv61
  %36 = sext i32 %indvars.iv55 to i64
  %37 = and i64 %indvars.iv61, 1
  %lcmp.mod = icmp eq i64 %37, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %38

; <label>:38:                                     ; preds = %.prol.preheader
  %39 = trunc i64 %indvars.iv61 to i32
  %40 = srem i32 %39, 100
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %10
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 0
  store double %42, double* %43, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %38
  %indvars.iv.unr.ph = phi i64 [ 1, %38 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %44 = icmp eq i64 %indvars.iv61, 0
  br i1 %44, label %.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %73

.preheader.unr-lcssa:                             ; preds = %73
  br label %.preheader

.preheader:                                       ; preds = %.prol.loopexit, %.preheader.unr-lcssa
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %45 = icmp slt i64 %indvars.iv.next62, %.pre-phi
  br i1 %45, label %.lr.ph42.preheader, label %._crit_edge

.lr.ph42.preheader:                               ; preds = %.preheader
  %min.iters.check = icmp ult i64 %35, 4
  br i1 %min.iters.check, label %.lr.ph42.preheader71, label %min.iters.checked

.lr.ph42.preheader71:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph42.preheader
  %indvars.iv57.ph = phi i64 [ %36, %min.iters.checked ], [ %36, %.lr.ph42.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph42

min.iters.checked:                                ; preds = %.lr.ph42.preheader
  %n.vec = and i64 %35, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %36, %n.vec
  br i1 %cmp.zero, label %.lr.ph42.preheader71, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter72 = and i64 %34, 3
  %lcmp.mod73 = icmp eq i64 %xtraiter72, 0
  br i1 %lcmp.mod73, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter72, %vector.body.prol.preheader ]
  %46 = add i64 %36, %index.prol
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %46
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %48, align 8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %50, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %51 = icmp ult i64 %32, 12
  br i1 %51, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %52 = add i64 %36, %index
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %54, align 8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %56, align 8
  %index.next = add i64 %index, 4
  %57 = add i64 %36, %index.next
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %57
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %61, align 8
  %index.next.1 = add i64 %index, 8
  %62 = add i64 %36, %index.next.1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %62
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %64, align 8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %66, align 8
  %index.next.2 = add i64 %index, 12
  %67 = add i64 %36, %index.next.2
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %69, align 8
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %71, align 8
  %index.next.3 = add i64 %index, 16
  %72 = icmp eq i64 %index.next.3, %n.vec
  br i1 %72, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %35, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph42.preheader71

; <label>:73:                                     ; preds = %73, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %73 ]
  %74 = add nuw nsw i64 %indvars.iv, %indvars.iv61
  %75 = trunc i64 %74 to i32
  %76 = srem i32 %75, 100
  %77 = sitofp i32 %76 to double
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %79 = add nuw nsw i64 %indvars.iv.next, %indvars.iv61
  %80 = trunc i64 %79 to i32
  %81 = srem i32 %80, 100
  %82 = sitofp i32 %81 to double
  %83 = insertelement <2 x double> undef, double %10, i32 0
  %84 = insertelement <2 x double> %83, double %10, i32 1
  %85 = insertelement <2 x double> undef, double %77, i32 0
  %86 = insertelement <2 x double> %85, double %82, i32 1
  %87 = fdiv <2 x double> %86, %84
  %88 = bitcast double* %78 to <2 x double>*
  store <2 x double> %87, <2 x double>* %88, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv61
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.preheader.unr-lcssa, label %73

.lr.ph42:                                         ; preds = %.lr.ph42.preheader71, %.lr.ph42
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.lr.ph42 ], [ %indvars.iv57.ph, %.lr.ph42.preheader71 ]
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv57
  store double -9.990000e+02, double* %89, align 8
  %exitcond60 = icmp eq i64 %indvars.iv57, %wide.trip.count59
  %indvars.iv.next58 = add nsw i64 %indvars.iv57, 1
  br i1 %exitcond60, label %._crit_edge.loopexit, label %.lr.ph42, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph42
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.preheader
  %indvars.iv.next56 = add nuw i32 %indvars.iv55, 1
  br i1 %45, label %.lr.ph, label %._crit_edge44.loopexit

._crit_edge44.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]* readonly, [1200 x double]* readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader38.lr.ph, label %._crit_edge49

.preheader38.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = add i32 %1, -1
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %13 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %10 to i64
  %14 = add nuw nsw i64 %wide.trip.count, 1
  %15 = add nuw nsw i64 %wide.trip.count, 1
  %min.iters.check = icmp ult i64 %14, 4
  %n.vec = and i64 %14, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat76 = shufflevector <2 x double> %broadcast.splatinsert75, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert79 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat80 = shufflevector <2 x double> %broadcast.splatinsert79, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert81 = insertelement <2 x double> undef, double %13, i32 0
  %broadcast.splat82 = shufflevector <2 x double> %broadcast.splatinsert81, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %14, %n.vec
  br label %.preheader38

.preheader38:                                     ; preds = %._crit_edge45, %.preheader38.lr.ph
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge45 ], [ 0, %.preheader38.lr.ph ]
  %indvars.iv52 = phi i32 [ %indvars.iv.next53, %._crit_edge45 ], [ -1, %.preheader38.lr.ph ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 0
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %14
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv58, i64 0
  %scevgep67 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv58, i64 %14
  br i1 %9, label %.preheader.lr.ph, label %._crit_edge45

.preheader.lr.ph:                                 ; preds = %.preheader38
  %16 = icmp sgt i64 %indvars.iv58, 0
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv58, i64 %indvars.iv58
  br i1 %16, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br i1 %min.iters.check, label %.preheader.preheader83, label %min.iters.checked

.preheader.preheader83:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.preheader ], [ %n.vec, %middle.block ]
  %18 = sub nsw i64 %15, %indvars.iv.ph
  %xtraiter = and i64 %18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader83
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.ph
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv58, i64 %indvars.iv.ph
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %17, align 8
  %26 = fmul double %24, %25
  %27 = fadd double %21, %26
  %28 = fadd double %13, %27
  store double %28, double* %19, align 8
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.preheader83, %.preheader.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ %indvars.iv.ph, %.preheader.preheader83 ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %29 = icmp eq i64 %wide.trip.count, %indvars.iv.ph
  br i1 %29, label %._crit_edge45.loopexit84, label %.preheader.preheader83.new

.preheader.preheader83.new:                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

min.iters.checked:                                ; preds = %.preheader.preheader
  br i1 %cmp.zero, label %.preheader.preheader83, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep67
  %bound1 = icmp ult double* %scevgep65, %scevgep63
  %found.conflict = and i1 %bound0, %bound1
  %bound070 = icmp ult double* %scevgep, %17
  %bound171 = icmp ult double* %17, %scevgep63
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx = or i1 %found.conflict, %found.conflict72
  br i1 %conflict.rdx, label %.preheader.preheader83, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %index
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !8, !noalias !11
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !8, !noalias !11
  %34 = fmul <2 x double> %wide.load, %broadcast.splat76
  %35 = fmul <2 x double> %wide.load74, %broadcast.splat76
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv58, i64 %index
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !14
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !14
  %40 = fmul <2 x double> %wide.load77, %broadcast.splat80
  %41 = fmul <2 x double> %wide.load78, %broadcast.splat80
  %42 = load double, double* %17, align 8, !alias.scope !15
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = insertelement <2 x double> undef, double %42, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %40, %44
  %48 = fmul <2 x double> %41, %46
  %49 = fadd <2 x double> %34, %47
  %50 = fadd <2 x double> %35, %48
  %51 = fadd <2 x double> %broadcast.splat82, %49
  %52 = fadd <2 x double> %broadcast.splat82, %50
  %53 = bitcast double* %30 to <2 x double>*
  store <2 x double> %51, <2 x double>* %53, align 8, !alias.scope !8, !noalias !11
  %54 = bitcast double* %32 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %55 = icmp eq i64 %index.next, %n.vec
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge45, label %.preheader.preheader83

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count54 = zext i32 %indvars.iv52 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv58, i64 %indvars.iv56
  br label %57

; <label>:57:                                     ; preds = %57, %.preheader.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %57 ], [ 0, %.preheader.us ]
  %.040.us = phi double [ %70, %57 ], [ 0.000000e+00, %.preheader.us ]
  %58 = load double, double* %56, align 8
  %59 = fmul double %58, %2
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv58, i64 %indvars.iv50
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv56
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv50, i64 %indvars.iv56
  %67 = load double, double* %66, align 8
  %68 = load double, double* %60, align 8
  %69 = fmul double %67, %68
  %70 = fadd double %.040.us, %69
  %exitcond55 = icmp eq i64 %indvars.iv50, %wide.trip.count54
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  br i1 %exitcond55, label %._crit_edge.us, label %57

._crit_edge.us:                                   ; preds = %57
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv56
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %3
  %74 = load double, double* %56, align 8
  %75 = fmul double %74, %2
  %76 = load double, double* %17, align 8
  %77 = fmul double %75, %76
  %78 = fadd double %73, %77
  %79 = fmul double %70, %2
  %80 = fadd double %79, %78
  store double %80, double* %71, align 8
  %indvars.iv.next57 = add nuw i64 %indvars.iv56, 1
  %81 = icmp slt i64 %indvars.iv.next57, %11
  br i1 %81, label %.preheader.us, label %._crit_edge45.loopexit

.preheader:                                       ; preds = %.preheader, %.preheader.preheader83.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.preheader83.new ], [ %indvars.iv.next.1, %.preheader ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv
  %83 = bitcast double* %82 to <2 x double>*
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv58, i64 %indvars.iv
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %2
  %87 = load double, double* %17, align 8
  %88 = fmul double %86, %87
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.next
  %90 = load <2 x double>, <2 x double>* %83, align 8
  %91 = insertelement <2 x double> undef, double %3, i32 0
  %92 = insertelement <2 x double> %91, double %3, i32 1
  %93 = fmul <2 x double> %90, %92
  %94 = extractelement <2 x double> %93, i32 0
  %95 = extractelement <2 x double> %93, i32 1
  %96 = fadd double %94, %88
  %97 = fadd double %13, %96
  store double %97, double* %82, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv58, i64 %indvars.iv.next
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, %2
  %101 = load double, double* %17, align 8
  %102 = fmul double %100, %101
  %103 = fadd double %95, %102
  %104 = fadd double %13, %103
  store double %104, double* %89, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge45.loopexit84.unr-lcssa, label %.preheader, !llvm.loop !17

._crit_edge45.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge45

._crit_edge45.loopexit84.unr-lcssa:               ; preds = %.preheader
  br label %._crit_edge45.loopexit84

._crit_edge45.loopexit84:                         ; preds = %.preheader.prol.loopexit, %._crit_edge45.loopexit84.unr-lcssa
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit84, %._crit_edge45.loopexit, %middle.block, %.preheader38
  %indvars.iv.next59 = add nuw i64 %indvars.iv58, 1
  %105 = icmp slt i64 %indvars.iv.next59, %12
  %indvars.iv.next53 = add nsw i32 %indvars.iv52, 1
  br i1 %105, label %.preheader38, label %._crit_edge49.loopexit

._crit_edge49.loopexit:                           ; preds = %._crit_edge45
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.lr.ph..preheader.us_crit_edge, label %._crit_edge12

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %3
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %._crit_edge.us ]
  %12 = mul nsw i64 %indvars.iv14, %11
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %13 = add nsw i64 %indvars.iv, %12
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %23 = icmp slt i64 %indvars.iv.next, %10
  br i1 %23, label %._crit_edge13, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %24 = icmp slt i64 %indvars.iv.next15, %11
  br i1 %24, label %.preheader.us, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
