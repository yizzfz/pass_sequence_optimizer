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
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader40.lr.ph, label %._crit_edge47

.preheader40.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader40.us.preheader, label %.preheader.lr.ph

.preheader40.us.preheader:                        ; preds = %.preheader40.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count77 = zext i32 %0 to i64
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge50.us, %.preheader40.us.preheader
  %indvars.iv75 = phi i64 [ 0, %.preheader40.us.preheader ], [ %indvars.iv.next76, %._crit_edge50.us ]
  %12 = add i64 %indvars.iv75, %11
  %13 = trunc i64 %12 to i32
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader40.us
  %indvars.iv72 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next73, %14 ]
  %15 = add nuw nsw i64 %indvars.iv72, %indvars.iv75
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %10
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv75, i64 %indvars.iv72
  store double %19, double* %20, align 8
  %21 = trunc i64 %indvars.iv72 to i32
  %22 = sub i32 %13, %21
  %23 = srem i32 %22, 100
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %10
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv75, i64 %indvars.iv72
  store double %25, double* %26, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next73, %wide.trip.count
  br i1 %exitcond74, label %._crit_edge50.us, label %14

._crit_edge50.us:                                 ; preds = %14
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, %wide.trip.count77
  br i1 %exitcond78, label %.preheader39, label %.preheader40.us

.preheader39:                                     ; preds = %._crit_edge50.us
  %27 = icmp sgt i32 %0, 0
  br i1 %27, label %.preheader.lr.ph, label %._crit_edge47

.preheader.lr.ph:                                 ; preds = %.preheader40.lr.ph, %.preheader39
  %28 = sitofp i32 %0 to double
  %29 = add i32 %0, 7
  %30 = add i32 %0, -2
  %31 = sext i32 %0 to i64
  %wide.trip.count60.7 = zext i32 %0 to i64
  %wide.trip.count71 = zext i32 %0 to i64
  %32 = add nsw i64 %wide.trip.count60.7, -8
  %33 = trunc i32 %29 to i3
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph44.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit62, %._crit_edge
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  %indvars.iv.next84 = add nuw i64 %indvars.iv83, 1
  %indvars.iv.next86 = add i3 %indvars.iv85, -1
  br i1 %exitcond, label %._crit_edge47.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.lr.ph, %.loopexit
  %indvars.iv85 = phi i3 [ %33, %.preheader.lr.ph ], [ %indvars.iv.next86, %.loopexit ]
  %indvars.iv83 = phi i64 [ 2, %.preheader.lr.ph ], [ %indvars.iv.next84, %.loopexit ]
  %indvars.iv69 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next70, %.loopexit ]
  %indvars.iv67 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next68, %.loopexit ]
  %34 = zext i3 %indvars.iv85 to i32
  %35 = add i32 %34, -1
  %36 = zext i32 %35 to i64
  %37 = add i64 %indvars.iv83, %36
  %38 = sub nsw i64 0, %indvars.iv69
  %39 = trunc i64 %38 to i32
  %40 = add i32 %29, %39
  %41 = trunc i64 %38 to i32
  %42 = add i32 %30, %41
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %xtraiter80 = and i64 %indvars.iv.next70, 1
  %lcmp.mod = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %43 = trunc i64 %indvars.iv69 to i32
  %44 = srem i32 %43, 100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %28
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 0
  store double %46, double* %47, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %48 = icmp eq i64 %indvars.iv69, 0
  br i1 %48, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %49 = add nuw nsw i64 %indvars.iv, %indvars.iv69
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, 100
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %28
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = add nuw nsw i64 %indvars.iv.next, %indvars.iv69
  %56 = trunc i64 %55 to i32
  %57 = srem i32 %56, 100
  %58 = sitofp i32 %57 to double
  %59 = fdiv double %58, %28
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next
  store double %59, double* %60, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv67
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %61 = icmp slt i64 %indvars.iv.next70, %31
  br i1 %61, label %.lr.ph44, label %.loopexit

.lr.ph44:                                         ; preds = %._crit_edge
  %xtraiter63 = and i32 %40, 7
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.prol.loopexit62, label %.prol.preheader61.preheader

.prol.preheader61.preheader:                      ; preds = %.lr.ph44
  br label %.prol.preheader61

.prol.preheader61:                                ; preds = %.prol.preheader61.preheader, %.prol.preheader61
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader61 ], [ %indvars.iv67, %.prol.preheader61.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader61 ], [ %xtraiter63, %.prol.preheader61.preheader ]
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58.prol
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit62.loopexit, label %.prol.preheader61, !llvm.loop !1

.prol.loopexit62.loopexit:                        ; preds = %.prol.preheader61
  br label %.prol.loopexit62

.prol.loopexit62:                                 ; preds = %.prol.loopexit62.loopexit, %.lr.ph44
  %indvars.iv58.unr = phi i64 [ %indvars.iv67, %.lr.ph44 ], [ %37, %.prol.loopexit62.loopexit ]
  %63 = icmp ult i32 %42, 7
  br i1 %63, label %.loopexit, label %.lr.ph44.new.preheader

.lr.ph44.new.preheader:                           ; preds = %.prol.loopexit62
  %64 = sub i64 %32, %indvars.iv58.unr
  %65 = lshr i64 %64, 3
  %66 = add nuw nsw i64 %65, 1
  %min.iters.check = icmp ult i64 %66, 2
  br i1 %min.iters.check, label %.lr.ph44.new.preheader82, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph44.new.preheader
  %n.mod.vf = and i64 %66, 1
  %n.vec = sub nsw i64 %66, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %67 = add i64 %indvars.iv58.unr, 8
  %68 = shl nuw i64 %65, 3
  %69 = add i64 %67, %68
  %70 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %69, %70
  br i1 %cmp.zero, label %.lr.ph44.new.preheader82, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %71 = shl i64 %index, 3
  %72 = add i64 %indvars.iv58.unr, %71
  %73 = add nsw i64 %72, 7
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %73
  %75 = getelementptr double, double* %74, i64 -7
  %76 = bitcast double* %75 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %76, align 8
  %index.next = add i64 %index, 2
  %77 = icmp eq i64 %index.next, %n.vec
  br i1 %77, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph44.new.preheader82

.lr.ph44.new.preheader82:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph44.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %min.iters.checked ], [ %indvars.iv58.unr, %.lr.ph44.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph44.new

.lr.ph44.new:                                     ; preds = %.lr.ph44.new.preheader82, %.lr.ph44.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.7, %.lr.ph44.new ], [ %indvars.iv58.ph, %.lr.ph44.new.preheader82 ]
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58
  store double -9.990000e+02, double* %78, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59
  store double -9.990000e+02, double* %79, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.1
  store double -9.990000e+02, double* %80, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.2
  store double -9.990000e+02, double* %81, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.3
  store double -9.990000e+02, double* %82, align 8
  %indvars.iv.next59.4 = add nsw i64 %indvars.iv58, 5
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.4
  store double -9.990000e+02, double* %83, align 8
  %indvars.iv.next59.5 = add nsw i64 %indvars.iv58, 6
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.5
  store double -9.990000e+02, double* %84, align 8
  %indvars.iv.next59.6 = add nsw i64 %indvars.iv58, 7
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.6
  store double -9.990000e+02, double* %85, align 8
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next59.7, %wide.trip.count60.7
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph44.new, !llvm.loop !6

._crit_edge47.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %7, %.preheader39
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader44.us.preheader, label %._crit_edge54

.preheader44.us.preheader:                        ; preds = %7
  %wide.trip.count83 = zext i32 %0 to i64
  %wide.trip.count79 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count79, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count79, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert101 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat102 = shufflevector <2 x double> %broadcast.splatinsert101, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert105 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat106 = shufflevector <2 x double> %broadcast.splatinsert105, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert107 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat108 = shufflevector <2 x double> %broadcast.splatinsert107, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.us.preheader, %._crit_edge51.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge51.us ], [ 0, %.preheader44.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 0
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %wide.trip.count79
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 0
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 %wide.trip.count79
  %13 = icmp sgt i64 %indvars.iv81, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv81, i64 %indvars.iv81
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us60.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us60.preheader:                        ; preds = %.preheader44.us
  br i1 %min.iters.check, label %.preheader.us60.preheader109, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us60.preheader
  br i1 %cmp.zero, label %.preheader.us60.preheader109, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep93
  %bound1 = icmp ult double* %scevgep91, %scevgep89
  %found.conflict = and i1 %bound0, %bound1
  %bound096 = icmp ult double* %scevgep, %14
  %bound197 = icmp ult double* %14, %scevgep89
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx = or i1 %found.conflict, %found.conflict98
  br i1 %conflict.rdx, label %.preheader.us60.preheader109, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %15 = load double, double* %14, align 8, !alias.scope !8
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %15, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !11, !noalias !13
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !11, !noalias !13
  %24 = fmul <2 x double> %wide.load, %broadcast.splat102
  %25 = fmul <2 x double> %wide.load100, %broadcast.splat102
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !15
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !15
  %30 = fmul <2 x double> %wide.load103, %broadcast.splat106
  %31 = fmul <2 x double> %wide.load104, %broadcast.splat106
  %32 = fmul <2 x double> %30, %17
  %33 = fmul <2 x double> %31, %19
  %34 = fadd <2 x double> %24, %32
  %35 = fadd <2 x double> %25, %33
  %36 = fadd <2 x double> %broadcast.splat108, %34
  %37 = fadd <2 x double> %broadcast.splat108, %35
  %38 = bitcast double* %20 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !11, !noalias !13
  %39 = bitcast double* %22 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge51.us, label %.preheader.us60.preheader109

.preheader.us60.preheader109:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us60.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us60.preheader ], [ %n.vec, %middle.block ]
  %41 = sub nsw i64 %wide.trip.count79, %indvars.iv.ph
  %xtraiter = and i64 %41, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us60.prol.loopexit, label %.preheader.us60.prol

.preheader.us60.prol:                             ; preds = %.preheader.us60.preheader109
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv.ph
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv.ph
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %2
  %48 = load double, double* %14, align 8
  %49 = fmul double %47, %48
  %50 = fadd double %44, %49
  %51 = fadd double %10, %50
  store double %51, double* %42, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us60.prol.loopexit

.preheader.us60.prol.loopexit:                    ; preds = %.preheader.us60.prol, %.preheader.us60.preheader109
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us60.prol ], [ %indvars.iv.ph, %.preheader.us60.preheader109 ]
  %52 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %52, label %._crit_edge51.us, label %.preheader.us60.preheader109.new

.preheader.us60.preheader109.new:                 ; preds = %.preheader.us60.prol.loopexit
  br label %.preheader.us60

.preheader.us60:                                  ; preds = %.preheader.us60, %.preheader.us60.preheader109.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us60.preheader109.new ], [ %indvars.iv.next.1, %.preheader.us60 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %14, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %55, %60
  %62 = fadd double %10, %61
  store double %62, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %14, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %10, %71
  store double %72, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit111, label %.preheader.us60, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit111:                     ; preds = %.preheader.us60
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit111, %._crit_edge51.us.loopexit, %.preheader.us60.prol.loopexit, %middle.block
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, %wide.trip.count83
  br i1 %exitcond84, label %._crit_edge54.loopexit, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv77
  br label %85

._crit_edge.us.us:                                ; preds = %85
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv77
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv77
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %2
  %80 = load double, double* %14, align 8
  %81 = fmul double %79, %80
  %82 = fadd double %76, %81
  %83 = fmul double %98, %2
  %84 = fadd double %83, %82
  store double %84, double* %74, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, %wide.trip.count79
  br i1 %exitcond80, label %._crit_edge51.us.loopexit, label %.preheader.us.us

; <label>:85:                                     ; preds = %85, %.preheader.us.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %85 ], [ 0, %.preheader.us.us ]
  %.047.us.us = phi double [ %98, %85 ], [ 0.000000e+00, %.preheader.us.us ]
  %86 = load double, double* %73, align 8
  %87 = fmul double %86, %2
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv81, i64 %indvars.iv71
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv77
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv71, i64 %indvars.iv77
  %95 = load double, double* %94, align 8
  %96 = load double, double* %88, align 8
  %97 = fmul double %95, %96
  %98 = fadd double %.047.us.us, %97
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next72, %indvars.iv81
  br i1 %exitcond76, label %._crit_edge.us.us, label %85

._crit_edge54.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #4
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

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
