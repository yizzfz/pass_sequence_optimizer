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
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
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
  br i1 %8, label %.preheader40.lr.ph, label %._crit_edge47

.preheader40.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader40.us.preheader, label %.preheader.lr.ph

.preheader40.us.preheader:                        ; preds = %.preheader40.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %.preheader40.us.preheader, %._crit_edge50.us
  %.03751.us = phi i32 [ %27, %._crit_edge50.us ], [ 0, %.preheader40.us.preheader ]
  %11 = sext i32 %.03751.us to i64
  %12 = add nsw i32 %.03751.us, %1
  %13 = zext i32 %.03751.us to i64
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader40.us
  %indvars.iv73 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next74, %14 ]
  %15 = add i64 %indvars.iv73, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %10
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %11, i64 %indvars.iv73
  store double %19, double* %20, align 8
  %21 = trunc i64 %indvars.iv73 to i32
  %22 = sub i32 %12, %21
  %23 = srem i32 %22, 100
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %10
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %11, i64 %indvars.iv73
  store double %25, double* %26, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next74, %wide.trip.count
  br i1 %exitcond75, label %._crit_edge50.us, label %14

._crit_edge50.us:                                 ; preds = %14
  %27 = add nsw i32 %.03751.us, 1
  %28 = icmp slt i32 %27, %0
  br i1 %28, label %.preheader40.us, label %.preheader39

.preheader39:                                     ; preds = %._crit_edge50.us
  %29 = icmp sgt i32 %0, 0
  br i1 %29, label %.preheader.lr.ph, label %._crit_edge47

.preheader.lr.ph:                                 ; preds = %.preheader40.lr.ph, %.preheader39
  %30 = sitofp i32 %0 to double
  %31 = add i32 %0, 7
  %32 = add i32 %0, -2
  %33 = sext i32 %0 to i64
  %wide.trip.count61.7 = zext i32 %0 to i64
  %wide.trip.count72 = zext i32 %0 to i64
  %34 = add nsw i64 %wide.trip.count61.7, -8
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph44.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit63, %._crit_edge
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond, label %._crit_edge47.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.lr.ph, %.loopexit
  %indvars.iv70 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next71, %.loopexit ]
  %indvars.iv68 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next69, %.loopexit ]
  %35 = sub nsw i64 0, %indvars.iv70
  %36 = trunc i64 %35 to i32
  %37 = add i32 %31, %36
  %38 = trunc i64 %35 to i32
  %39 = add i32 %32, %38
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %xtraiter77 = and i64 %indvars.iv.next71, 1
  %lcmp.mod = icmp eq i64 %xtraiter77, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %40 = trunc i64 %indvars.iv70 to i32
  %41 = srem i32 %40, 100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %30
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 0
  store double %43, double* %44, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %45 = icmp eq i64 %indvars.iv70, 0
  br i1 %45, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %46 = add nuw nsw i64 %indvars.iv, %indvars.iv70
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, 100
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %30
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv
  store double %50, double* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = add nuw nsw i64 %indvars.iv.next, %indvars.iv70
  %53 = trunc i64 %52 to i32
  %54 = srem i32 %53, 100
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %30
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next
  store double %56, double* %57, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv68
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %58 = icmp slt i64 %indvars.iv.next71, %33
  br i1 %58, label %.lr.ph44, label %.loopexit

.lr.ph44:                                         ; preds = %._crit_edge
  %xtraiter64 = and i32 %37, 7
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  br i1 %lcmp.mod65, label %.prol.loopexit63, label %.prol.preheader62.preheader

.prol.preheader62.preheader:                      ; preds = %.lr.ph44
  br label %.prol.preheader62

.prol.preheader62:                                ; preds = %.prol.preheader62.preheader, %.prol.preheader62
  %indvars.iv59.prol = phi i64 [ %indvars.iv.next60.prol, %.prol.preheader62 ], [ %indvars.iv68, %.prol.preheader62.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader62 ], [ %xtraiter64, %.prol.preheader62.preheader ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv59.prol
  store double -9.990000e+02, double* %59, align 8
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit63.loopexit, label %.prol.preheader62, !llvm.loop !1

.prol.loopexit63.loopexit:                        ; preds = %.prol.preheader62
  br label %.prol.loopexit63

.prol.loopexit63:                                 ; preds = %.prol.loopexit63.loopexit, %.lr.ph44
  %indvars.iv59.unr = phi i64 [ %indvars.iv68, %.lr.ph44 ], [ %indvars.iv.next60.prol, %.prol.loopexit63.loopexit ]
  %60 = icmp ult i32 %39, 7
  br i1 %60, label %.loopexit, label %.lr.ph44.new.preheader

.lr.ph44.new.preheader:                           ; preds = %.prol.loopexit63
  %61 = sub i64 %34, %indvars.iv59.unr
  %62 = lshr i64 %61, 3
  %63 = add nuw nsw i64 %62, 1
  %min.iters.check = icmp ult i64 %63, 2
  br i1 %min.iters.check, label %.lr.ph44.new.preheader79, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph44.new.preheader
  %n.mod.vf = and i64 %63, 1
  %n.vec = sub nsw i64 %63, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %64 = add i64 %indvars.iv59.unr, 8
  %65 = shl nuw i64 %62, 3
  %66 = add i64 %64, %65
  %67 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %66, %67
  br i1 %cmp.zero, label %.lr.ph44.new.preheader79, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %68 = shl i64 %index, 3
  %69 = add i64 %indvars.iv59.unr, %68
  %70 = add nsw i64 %69, 7
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %70
  %72 = getelementptr double, double* %71, i64 -7
  %73 = bitcast double* %72 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %73, align 8
  %index.next = add i64 %index, 2
  %74 = icmp eq i64 %index.next, %n.vec
  br i1 %74, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph44.new.preheader79

.lr.ph44.new.preheader79:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph44.new.preheader
  %indvars.iv59.ph = phi i64 [ %indvars.iv59.unr, %min.iters.checked ], [ %indvars.iv59.unr, %.lr.ph44.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph44.new

.lr.ph44.new:                                     ; preds = %.lr.ph44.new.preheader79, %.lr.ph44.new
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.7, %.lr.ph44.new ], [ %indvars.iv59.ph, %.lr.ph44.new.preheader79 ]
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv59
  store double -9.990000e+02, double* %75, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next60
  store double -9.990000e+02, double* %76, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next60.1
  store double -9.990000e+02, double* %77, align 8
  %indvars.iv.next60.2 = add nsw i64 %indvars.iv59, 3
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next60.2
  store double -9.990000e+02, double* %78, align 8
  %indvars.iv.next60.3 = add nsw i64 %indvars.iv59, 4
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next60.3
  store double -9.990000e+02, double* %79, align 8
  %indvars.iv.next60.4 = add nsw i64 %indvars.iv59, 5
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next60.4
  store double -9.990000e+02, double* %80, align 8
  %indvars.iv.next60.5 = add nsw i64 %indvars.iv59, 6
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next60.5
  store double -9.990000e+02, double* %81, align 8
  %indvars.iv.next60.6 = add nsw i64 %indvars.iv59, 7
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv70, i64 %indvars.iv.next60.6
  store double -9.990000e+02, double* %82, align 8
  %indvars.iv.next60.7 = add nsw i64 %indvars.iv59, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next60.7, %wide.trip.count61.7
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph44.new, !llvm.loop !6

._crit_edge47.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %7, %.preheader39
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader44.us.preheader, label %._crit_edge55

.preheader44.us.preheader:                        ; preds = %7
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert94 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat95 = shufflevector <2 x double> %broadcast.splatinsert94, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert98 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat99 = shufflevector <2 x double> %broadcast.splatinsert98, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.us.preheader, %._crit_edge51.us
  %indvar = phi i64 [ 0, %.preheader44.us.preheader ], [ %indvar.next, %._crit_edge51.us ]
  %.04352.us = phi i32 [ 0, %.preheader44.us.preheader ], [ %75, %._crit_edge51.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 0
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 %wide.trip.count
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 %wide.trip.count
  %13 = icmp sgt i32 %.04352.us, 0
  %14 = sext i32 %.04352.us to i64
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us61.preheader

.preheader.us61.preheader:                        ; preds = %.preheader44.us
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %14, i64 %14
  br i1 %min.iters.check, label %.preheader.us61.preheader102, label %min.iters.checked

.preheader.us61.preheader102:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us61.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us61.preheader ], [ %n.vec, %middle.block ]
  %16 = sub nsw i64 %wide.trip.count, %indvars.iv.ph
  %xtraiter = and i64 %16, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us61.prol.loopexit.unr-lcssa, label %.preheader.us61.prol.preheader

.preheader.us61.prol.preheader:                   ; preds = %.preheader.us61.preheader102
  br label %.preheader.us61.prol

.preheader.us61.prol:                             ; preds = %.preheader.us61.prol.preheader
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %14, i64 %indvars.iv.ph
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %14, i64 %indvars.iv.ph
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %2
  %23 = load double, double* %15, align 8
  %24 = fmul double %22, %23
  %25 = fadd double %19, %24
  %26 = fadd double %10, %25
  store double %26, double* %17, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us61.prol.loopexit.unr-lcssa

.preheader.us61.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us61.preheader102, %.preheader.us61.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us61.prol ], [ %indvars.iv.ph, %.preheader.us61.preheader102 ]
  br label %.preheader.us61.prol.loopexit

.preheader.us61.prol.loopexit:                    ; preds = %.preheader.us61.prol.loopexit.unr-lcssa
  %27 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %27, label %._crit_edge51.us.loopexit103, label %.preheader.us61.preheader102.new

.preheader.us61.preheader102.new:                 ; preds = %.preheader.us61.prol.loopexit
  br label %.preheader.us61

min.iters.checked:                                ; preds = %.preheader.us61.preheader
  br i1 %cmp.zero, label %.preheader.us61.preheader102, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep86
  %bound1 = icmp ult double* %scevgep84, %scevgep82
  %found.conflict = and i1 %bound0, %bound1
  %bound089 = icmp ult double* %scevgep, %15
  %bound190 = icmp ult double* %15, %scevgep82
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx = or i1 %found.conflict, %found.conflict91
  br i1 %conflict.rdx, label %.preheader.us61.preheader102, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %28 = load double, double* %15, align 8, !alias.scope !8
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = insertelement <2 x double> undef, double %28, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %14, i64 %index
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !11, !noalias !13
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  %37 = fmul <2 x double> %wide.load, %broadcast.splat95
  %38 = fmul <2 x double> %wide.load93, %broadcast.splat95
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %14, i64 %index
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !15
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !15
  %43 = fmul <2 x double> %wide.load96, %broadcast.splat99
  %44 = fmul <2 x double> %wide.load97, %broadcast.splat99
  %45 = fmul <2 x double> %43, %30
  %46 = fmul <2 x double> %44, %32
  %47 = fadd <2 x double> %37, %45
  %48 = fadd <2 x double> %38, %46
  %49 = fadd <2 x double> %broadcast.splat101, %47
  %50 = fadd <2 x double> %broadcast.splat101, %48
  %51 = bitcast double* %33 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !11, !noalias !13
  %52 = bitcast double* %35 to <2 x double>*
  store <2 x double> %50, <2 x double>* %52, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %53 = icmp eq i64 %index.next, %n.vec
  br i1 %53, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge51.us, label %.preheader.us61.preheader102

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  %wide.trip.count76 = zext i32 %.04352.us to i64
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %14, i64 %14
  br label %.preheader.us.us

.preheader.us61:                                  ; preds = %.preheader.us61, %.preheader.us61.preheader102.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us61.preheader102.new ], [ %indvars.iv.next.1, %.preheader.us61 ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %14, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %14, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %2
  %61 = load double, double* %15, align 8
  %62 = fmul double %60, %61
  %63 = fadd double %57, %62
  %64 = fadd double %10, %63
  store double %64, double* %55, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %14, i64 %indvars.iv.next
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %3
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %14, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %2
  %71 = load double, double* %15, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %67, %72
  %74 = fadd double %10, %73
  store double %74, double* %65, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit103.unr-lcssa, label %.preheader.us61, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit103.unr-lcssa:           ; preds = %.preheader.us61
  br label %._crit_edge51.us.loopexit103

._crit_edge51.us.loopexit103:                     ; preds = %.preheader.us61.prol.loopexit, %._crit_edge51.us.loopexit103.unr-lcssa
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit103, %._crit_edge51.us.loopexit, %middle.block
  %75 = add nsw i32 %.04352.us, 1
  %76 = icmp slt i32 %75, %0
  %indvar.next = add i64 %indvar, 1
  br i1 %76, label %.preheader44.us, label %._crit_edge55.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %.04250.us.us = phi i32 [ %90, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %77 = sext i32 %.04250.us.us to i64
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %14, i64 %77
  br label %92

._crit_edge.us.us:                                ; preds = %92
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %14, i64 %77
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %3
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %14, i64 %77
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %2
  %85 = load double, double* %54, align 8
  %86 = fmul double %84, %85
  %87 = fadd double %81, %86
  %88 = fmul double %105, %2
  %89 = fadd double %88, %87
  store double %89, double* %79, align 8
  %90 = add nsw i32 %.04250.us.us, 1
  %91 = icmp slt i32 %90, %1
  br i1 %91, label %.preheader.us.us, label %._crit_edge51.us.loopexit

; <label>:92:                                     ; preds = %92, %.preheader.us.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %92 ], [ 0, %.preheader.us.us ]
  %.047.us.us = phi double [ %105, %92 ], [ 0.000000e+00, %.preheader.us.us ]
  %93 = load double, double* %78, align 8
  %94 = fmul double %93, %2
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %14, i64 %indvars.iv74
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %77
  %99 = load double, double* %98, align 8
  %100 = fadd double %99, %97
  store double %100, double* %98, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv74, i64 %77
  %102 = load double, double* %101, align 8
  %103 = load double, double* %95, align 8
  %104 = fmul double %102, %103
  %105 = fadd double %.047.us.us, %104
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge.us.us, label %92

._crit_edge55.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
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
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %.01012.us = phi i32 [ %25, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %10 = mul nsw i32 %.01012.us, %0
  %11 = sext i32 %.01012.us to i64
  %12 = zext i32 %10 to i64
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %20 ]
  %14 = add i64 %indvars.iv, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %11, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %20
  %25 = add nsw i32 %.01012.us, 1
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %.preheader.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %3
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
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
