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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph44.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit62, %._crit_edge
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond, label %._crit_edge47.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.lr.ph, %.loopexit
  %indvars.iv69 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next70, %.loopexit ]
  %indvars.iv67 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next68, %.loopexit ]
  %33 = sub nsw i64 0, %indvars.iv69
  %34 = trunc i64 %33 to i32
  %35 = add i32 %29, %34
  %36 = trunc i64 %33 to i32
  %37 = add i32 %30, %36
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %xtraiter80 = and i64 %indvars.iv.next70, 1
  %lcmp.mod = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %38 = trunc i64 %indvars.iv69 to i32
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %28
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 0
  store double %41, double* %42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %43 = icmp eq i64 %indvars.iv69, 0
  br i1 %43, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %44 = add nuw nsw i64 %indvars.iv, %indvars.iv69
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, 100
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %28
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv
  store double %48, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = add nuw nsw i64 %indvars.iv.next, %indvars.iv69
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, 100
  %53 = sitofp i32 %52 to double
  %54 = fdiv double %53, %28
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next
  store double %54, double* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv67
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %56 = icmp slt i64 %indvars.iv.next70, %31
  br i1 %56, label %.lr.ph44, label %.loopexit

.lr.ph44:                                         ; preds = %._crit_edge
  %xtraiter63 = and i32 %35, 7
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.prol.loopexit62, label %.prol.preheader61.preheader

.prol.preheader61.preheader:                      ; preds = %.lr.ph44
  br label %.prol.preheader61

.prol.preheader61:                                ; preds = %.prol.preheader61.preheader, %.prol.preheader61
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader61 ], [ %indvars.iv67, %.prol.preheader61.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader61 ], [ %xtraiter63, %.prol.preheader61.preheader ]
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58.prol
  store double -9.990000e+02, double* %57, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit62.loopexit, label %.prol.preheader61, !llvm.loop !1

.prol.loopexit62.loopexit:                        ; preds = %.prol.preheader61
  br label %.prol.loopexit62

.prol.loopexit62:                                 ; preds = %.prol.loopexit62.loopexit, %.lr.ph44
  %indvars.iv58.unr = phi i64 [ %indvars.iv67, %.lr.ph44 ], [ %indvars.iv.next59.prol, %.prol.loopexit62.loopexit ]
  %58 = icmp ult i32 %37, 7
  br i1 %58, label %.loopexit, label %.lr.ph44.new.preheader

.lr.ph44.new.preheader:                           ; preds = %.prol.loopexit62
  %59 = sub i64 %32, %indvars.iv58.unr
  %60 = lshr i64 %59, 3
  %61 = add nuw nsw i64 %60, 1
  %min.iters.check = icmp ult i64 %61, 2
  br i1 %min.iters.check, label %.lr.ph44.new.preheader82, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph44.new.preheader
  %n.mod.vf = and i64 %61, 1
  %n.vec = sub nsw i64 %61, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %62 = add i64 %indvars.iv58.unr, 8
  %63 = shl nuw i64 %60, 3
  %64 = add i64 %62, %63
  %65 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %64, %65
  br i1 %cmp.zero, label %.lr.ph44.new.preheader82, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %66 = shl i64 %index, 3
  %67 = add i64 %indvars.iv58.unr, %66
  %68 = add nsw i64 %67, 7
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %68
  %70 = getelementptr double, double* %69, i64 -7
  %71 = bitcast double* %70 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %71, align 8
  %index.next = add i64 %index, 2
  %72 = icmp eq i64 %index.next, %n.vec
  br i1 %72, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph44.new.preheader82

.lr.ph44.new.preheader82:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph44.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %min.iters.checked ], [ %indvars.iv58.unr, %.lr.ph44.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph44.new

.lr.ph44.new:                                     ; preds = %.lr.ph44.new.preheader82, %.lr.ph44.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.7, %.lr.ph44.new ], [ %indvars.iv58.ph, %.lr.ph44.new.preheader82 ]
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58
  store double -9.990000e+02, double* %73, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59
  store double -9.990000e+02, double* %74, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.1
  store double -9.990000e+02, double* %75, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.2
  store double -9.990000e+02, double* %76, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.3
  store double -9.990000e+02, double* %77, align 8
  %indvars.iv.next59.4 = add nsw i64 %indvars.iv58, 5
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.4
  store double -9.990000e+02, double* %78, align 8
  %indvars.iv.next59.5 = add nsw i64 %indvars.iv58, 6
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.5
  store double -9.990000e+02, double* %79, align 8
  %indvars.iv.next59.6 = add nsw i64 %indvars.iv58, 7
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.6
  store double -9.990000e+02, double* %80, align 8
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next59.7, %wide.trip.count60.7
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
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.us.preheader, %._crit_edge51.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge51.us ], [ 0, %.preheader44.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %wide.trip.count80
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 0
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %wide.trip.count80
  %13 = icmp sgt i64 %indvars.iv82, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us61.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us61.preheader:                        ; preds = %.preheader44.us
  br i1 %min.iters.check, label %.preheader.us61.preheader110, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us61.preheader
  br i1 %cmp.zero, label %.preheader.us61.preheader110, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep92, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %14
  %bound198 = icmp ult double* %14, %scevgep90
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  br i1 %conflict.rdx, label %.preheader.us61.preheader110, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %index
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !8, !noalias !11
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !8, !noalias !11
  %19 = fmul <2 x double> %wide.load, %broadcast.splat103
  %20 = fmul <2 x double> %wide.load101, %broadcast.splat103
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !14
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !14
  %25 = fmul <2 x double> %wide.load104, %broadcast.splat107
  %26 = fmul <2 x double> %wide.load105, %broadcast.splat107
  %27 = load double, double* %14, align 8, !alias.scope !15
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x double> undef, double %27, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = fmul <2 x double> %25, %29
  %33 = fmul <2 x double> %26, %31
  %34 = fadd <2 x double> %19, %32
  %35 = fadd <2 x double> %20, %33
  %36 = fadd <2 x double> %broadcast.splat109, %34
  %37 = fadd <2 x double> %broadcast.splat109, %35
  %38 = bitcast double* %15 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !8, !noalias !11
  %39 = bitcast double* %17 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge51.us, label %.preheader.us61.preheader110

.preheader.us61.preheader110:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us61.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us61.preheader ], [ %n.vec, %middle.block ]
  %41 = sub nsw i64 %wide.trip.count80, %indvars.iv.ph
  %xtraiter = and i64 %41, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us61.prol.loopexit.unr-lcssa, label %.preheader.us61.prol.preheader

.preheader.us61.prol.preheader:                   ; preds = %.preheader.us61.preheader110
  br label %.preheader.us61.prol

.preheader.us61.prol:                             ; preds = %.preheader.us61.prol.preheader
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
  br label %.preheader.us61.prol.loopexit.unr-lcssa

.preheader.us61.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us61.preheader110, %.preheader.us61.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us61.prol ], [ %indvars.iv.ph, %.preheader.us61.preheader110 ]
  br label %.preheader.us61.prol.loopexit

.preheader.us61.prol.loopexit:                    ; preds = %.preheader.us61.prol.loopexit.unr-lcssa
  %52 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %52, label %._crit_edge51.us.loopexit111, label %.preheader.us61.preheader110.new

.preheader.us61.preheader110.new:                 ; preds = %.preheader.us61.prol.loopexit
  br label %.preheader.us61

.preheader.us61:                                  ; preds = %.preheader.us61, %.preheader.us61.preheader110.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us61.preheader110.new ], [ %indvars.iv.next.1, %.preheader.us61 ]
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
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit111.unr-lcssa, label %.preheader.us61, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit111.unr-lcssa:           ; preds = %.preheader.us61
  br label %._crit_edge51.us.loopexit111

._crit_edge51.us.loopexit111:                     ; preds = %.preheader.us61.prol.loopexit, %._crit_edge51.us.loopexit111.unr-lcssa
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit111, %._crit_edge51.us.loopexit, %middle.block
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %._crit_edge55.loopexit, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  br label %85

._crit_edge.us.us:                                ; preds = %85
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %2
  %80 = load double, double* %14, align 8
  %81 = fmul double %79, %80
  %82 = fadd double %76, %81
  %83 = fmul double %98, %2
  %84 = fadd double %83, %82
  store double %84, double* %74, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge51.us.loopexit, label %.preheader.us.us

; <label>:85:                                     ; preds = %85, %.preheader.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %85 ], [ 0, %.preheader.us.us ]
  %.047.us.us = phi double [ %98, %85 ], [ 0.000000e+00, %.preheader.us.us ]
  %86 = load double, double* %73, align 8
  %87 = fmul double %86, %2
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv72
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv78
  %95 = load double, double* %94, align 8
  %96 = load double, double* %88, align 8
  %97 = fmul double %95, %96
  %98 = fadd double %.047.us.us, %97
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge.us.us, label %85

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
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv15, %10
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
