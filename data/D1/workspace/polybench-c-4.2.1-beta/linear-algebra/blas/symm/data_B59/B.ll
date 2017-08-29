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
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader40.lr.ph, label %._crit_edge47

.preheader40.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader40.us.preheader, label %.preheader40.lr.ph..preheader.lr.ph_crit_edge

.preheader40.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader40.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader40.us.preheader:                        ; preds = %.preheader40.lr.ph
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge50.us, %.preheader40.us.preheader
  %indvars.iv75 = phi i64 [ 0, %.preheader40.us.preheader ], [ %indvars.iv.next76, %._crit_edge50.us ]
  %13 = add i64 %indvars.iv75, %11
  %14 = trunc i64 %13 to i32
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader40.us
  %indvars.iv72 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next73, %15 ]
  %16 = add nuw nsw i64 %indvars.iv72, %indvars.iv75
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %10
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv75, i64 %indvars.iv72
  store double %20, double* %21, align 8
  %22 = trunc i64 %indvars.iv72 to i32
  %23 = sub i32 %14, %22
  %24 = srem i32 %23, 100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %10
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv75, i64 %indvars.iv72
  store double %26, double* %27, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond = icmp eq i64 %indvars.iv.next73, %11
  br i1 %exitcond, label %._crit_edge50.us, label %15

._crit_edge50.us:                                 ; preds = %15
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next76, %12
  br i1 %exitcond85, label %.preheader.lr.ph.loopexit, label %.preheader40.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge50.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader40.lr.ph..preheader.lr.ph_crit_edge
  %.pre-phi = phi i64 [ %.pre, %.preheader40.lr.ph..preheader.lr.ph_crit_edge ], [ %12, %.preheader.lr.ph.loopexit ]
  %28 = add i32 %0, -1
  %29 = add i32 %0, -2
  %30 = sext i32 %0 to i64
  %31 = trunc i32 %28 to i3
  %32 = add nsw i64 %.pre-phi, -8
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph44.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit62, %._crit_edge
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %indvars.iv.next81 = add nuw i64 %indvars.iv80, 1
  %indvars.iv.next83 = add i3 %indvars.iv82, -1
  %exitcond84 = icmp eq i64 %indvars.iv.next70, %.pre-phi
  br i1 %exitcond84, label %._crit_edge47.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.lr.ph, %.loopexit
  %indvars.iv82 = phi i3 [ %31, %.preheader.lr.ph ], [ %indvars.iv.next83, %.loopexit ]
  %indvars.iv80 = phi i64 [ 2, %.preheader.lr.ph ], [ %indvars.iv.next81, %.loopexit ]
  %indvars.iv69 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next70, %.loopexit ]
  %indvars.iv67 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next68, %.loopexit ]
  %33 = zext i3 %indvars.iv82 to i64
  %34 = add nuw nsw i64 %33, 4294967295
  %35 = and i64 %34, 4294967295
  %36 = add i64 %indvars.iv80, %35
  %37 = sub nsw i64 0, %indvars.iv69
  %38 = trunc i64 %37 to i32
  %39 = add i32 %28, %38
  %40 = add i32 %29, %38
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %xtraiter86 = and i64 %indvars.iv.next70, 1
  %lcmp.mod = icmp eq i64 %xtraiter86, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %41 = trunc i64 %indvars.iv69 to i32
  %42 = srem i32 %41, 100
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %10
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 0
  store double %44, double* %45, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %46 = icmp eq i64 %indvars.iv69, 0
  br i1 %46, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %47 = add nuw nsw i64 %indvars.iv, %indvars.iv69
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 100
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %10
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv
  store double %51, double* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = add nuw nsw i64 %indvars.iv.next, %indvars.iv69
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 100
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %10
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next
  store double %57, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv67
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %59 = icmp slt i64 %indvars.iv.next70, %30
  br i1 %59, label %.lr.ph44, label %.loopexit

.lr.ph44:                                         ; preds = %._crit_edge
  %xtraiter63 = and i32 %39, 7
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.prol.loopexit62, label %.prol.preheader61.preheader

.prol.preheader61.preheader:                      ; preds = %.lr.ph44
  br label %.prol.preheader61

.prol.preheader61:                                ; preds = %.prol.preheader61.preheader, %.prol.preheader61
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader61 ], [ %indvars.iv67, %.prol.preheader61.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader61 ], [ %xtraiter63, %.prol.preheader61.preheader ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58.prol
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit62.loopexit, label %.prol.preheader61, !llvm.loop !1

.prol.loopexit62.loopexit:                        ; preds = %.prol.preheader61
  br label %.prol.loopexit62

.prol.loopexit62:                                 ; preds = %.prol.loopexit62.loopexit, %.lr.ph44
  %indvars.iv58.unr = phi i64 [ %indvars.iv67, %.lr.ph44 ], [ %36, %.prol.loopexit62.loopexit ]
  %61 = icmp ult i32 %40, 7
  br i1 %61, label %.loopexit, label %.lr.ph44.new.preheader

.lr.ph44.new.preheader:                           ; preds = %.prol.loopexit62
  %62 = sub i64 %32, %indvars.iv58.unr
  %63 = lshr i64 %62, 3
  %64 = add nuw nsw i64 %63, 1
  %min.iters.check = icmp ult i64 %64, 2
  br i1 %min.iters.check, label %.lr.ph44.new.preheader88, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph44.new.preheader
  %n.mod.vf = and i64 %64, 1
  %n.vec = sub nsw i64 %64, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %65 = add i64 %indvars.iv58.unr, 8
  %66 = shl nuw i64 %63, 3
  %67 = add i64 %65, %66
  %68 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %67, %68
  br i1 %cmp.zero, label %.lr.ph44.new.preheader88, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %69 = shl i64 %index, 3
  %70 = add i64 %indvars.iv58.unr, %69
  %71 = add nsw i64 %70, 7
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %71
  %73 = getelementptr double, double* %72, i64 -7
  %74 = bitcast double* %73 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %74, align 8
  %index.next = add i64 %index, 2
  %75 = icmp eq i64 %index.next, %n.vec
  br i1 %75, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph44.new.preheader88

.lr.ph44.new.preheader88:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph44.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %min.iters.checked ], [ %indvars.iv58.unr, %.lr.ph44.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph44.new

.lr.ph44.new:                                     ; preds = %.lr.ph44.new.preheader88, %.lr.ph44.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.7, %.lr.ph44.new ], [ %indvars.iv58.ph, %.lr.ph44.new.preheader88 ]
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58
  store double -9.990000e+02, double* %76, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59
  store double -9.990000e+02, double* %77, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.1
  store double -9.990000e+02, double* %78, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.2
  store double -9.990000e+02, double* %79, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.3
  store double -9.990000e+02, double* %80, align 8
  %indvars.iv.next59.4 = add nsw i64 %indvars.iv58, 5
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.4
  store double -9.990000e+02, double* %81, align 8
  %indvars.iv.next59.5 = add nsw i64 %indvars.iv58, 6
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.5
  store double -9.990000e+02, double* %82, align 8
  %indvars.iv.next59.6 = add nsw i64 %indvars.iv58, 7
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.6
  store double -9.990000e+02, double* %83, align 8
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next59.7, %.pre-phi
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph44.new, !llvm.loop !6

._crit_edge47.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader44.us.preheader, label %._crit_edge55

.preheader44.us.preheader:                        ; preds = %7
  %10 = zext i32 %1 to i64
  %11 = zext i32 %0 to i64
  %12 = fmul double %2, 0.000000e+00
  %13 = add nsw i64 %10, -1
  %min.iters.check = icmp ult i32 %1, 4
  %14 = and i32 %1, 3
  %n.mod.vf = zext i32 %14 to i64
  %n.vec = sub nsw i64 %10, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert104 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat105 = shufflevector <2 x double> %broadcast.splatinsert104, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %12, i32 0
  %broadcast.splat111 = shufflevector <2 x double> %broadcast.splatinsert110, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %14, 0
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %._crit_edge51.us, %.preheader44.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader44.us.preheader ], [ %indvars.iv.next83, %._crit_edge51.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %10
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 0
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %10
  %15 = icmp sgt i64 %indvars.iv82, 0
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %15, label %.preheader.us.us.preheader, label %.preheader.us61.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us61.preheader:                        ; preds = %.preheader44.us
  br i1 %min.iters.check, label %.preheader.us61.preheader112, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us61.preheader
  br i1 %cmp.zero, label %.preheader.us61.preheader112, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep96
  %bound1 = icmp ult double* %scevgep94, %scevgep92
  %found.conflict = and i1 %bound0, %bound1
  %bound099 = icmp ult double* %scevgep, %16
  %bound1100 = icmp ult double* %16, %scevgep92
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx = or i1 %found.conflict, %found.conflict101
  br i1 %conflict.rdx, label %.preheader.us61.preheader112, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %17 = load double, double* %16, align 8, !alias.scope !8
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x double> undef, double %17, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %index
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !11, !noalias !13
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !11, !noalias !13
  %26 = fmul <2 x double> %wide.load, %broadcast.splat105
  %27 = fmul <2 x double> %wide.load103, %broadcast.splat105
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %index
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !15
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !15
  %32 = fmul <2 x double> %wide.load106, %broadcast.splat109
  %33 = fmul <2 x double> %wide.load107, %broadcast.splat109
  %34 = fmul <2 x double> %32, %19
  %35 = fmul <2 x double> %33, %21
  %36 = fadd <2 x double> %26, %34
  %37 = fadd <2 x double> %27, %35
  %38 = fadd <2 x double> %broadcast.splat111, %36
  %39 = fadd <2 x double> %broadcast.splat111, %37
  %40 = bitcast double* %22 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !11, !noalias !13
  %41 = bitcast double* %24 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge51.us, label %.preheader.us61.preheader112

.preheader.us61.preheader112:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us61.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us61.preheader ], [ %n.vec, %middle.block ]
  %43 = sub nsw i64 %10, %indvars.iv.ph
  %xtraiter = and i64 %43, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us61.prol.loopexit.unr-lcssa, label %.preheader.us61.prol.preheader

.preheader.us61.prol.preheader:                   ; preds = %.preheader.us61.preheader112
  br label %.preheader.us61.prol

.preheader.us61.prol:                             ; preds = %.preheader.us61.prol.preheader
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.ph
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %3
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.ph
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %2
  %50 = load double, double* %16, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %46, %51
  %53 = fadd double %12, %52
  store double %53, double* %44, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us61.prol.loopexit.unr-lcssa

.preheader.us61.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us61.preheader112, %.preheader.us61.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us61.prol ], [ %indvars.iv.ph, %.preheader.us61.preheader112 ]
  br label %.preheader.us61.prol.loopexit

.preheader.us61.prol.loopexit:                    ; preds = %.preheader.us61.prol.loopexit.unr-lcssa
  %54 = icmp eq i64 %13, %indvars.iv.ph
  br i1 %54, label %._crit_edge51.us.loopexit113, label %.preheader.us61.preheader112.new

.preheader.us61.preheader112.new:                 ; preds = %.preheader.us61.prol.loopexit
  br label %.preheader.us61

.preheader.us61:                                  ; preds = %.preheader.us61, %.preheader.us61.preheader112.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us61.preheader112.new ], [ %indvars.iv.next.1, %.preheader.us61 ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %2
  %61 = load double, double* %16, align 8
  %62 = fmul double %60, %61
  %63 = fadd double %57, %62
  %64 = fadd double %12, %63
  store double %64, double* %55, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %3
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %2
  %71 = load double, double* %16, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %67, %72
  %74 = fadd double %12, %73
  store double %74, double* %65, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next.1, %10
  br i1 %exitcond87.1, label %._crit_edge51.us.loopexit113.unr-lcssa, label %.preheader.us61, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit113.unr-lcssa:           ; preds = %.preheader.us61
  br label %._crit_edge51.us.loopexit113

._crit_edge51.us.loopexit113:                     ; preds = %.preheader.us61.prol.loopexit, %._crit_edge51.us.loopexit113.unr-lcssa
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit113, %._crit_edge51.us.loopexit, %middle.block
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next83, %11
  br i1 %exitcond88, label %._crit_edge55.loopexit, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  br label %86

._crit_edge.us.us:                                ; preds = %86
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %3
  %79 = load double, double* %75, align 8
  %80 = fmul double %79, %2
  %81 = load double, double* %16, align 8
  %82 = fmul double %80, %81
  %83 = fadd double %78, %82
  %84 = fmul double %99, %2
  %85 = fadd double %84, %83
  store double %85, double* %76, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond = icmp eq i64 %indvars.iv.next79, %10
  br i1 %exitcond, label %._crit_edge51.us.loopexit, label %.preheader.us.us

; <label>:86:                                     ; preds = %86, %.preheader.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %86 ], [ 0, %.preheader.us.us ]
  %.047.us.us = phi double [ %99, %86 ], [ 0.000000e+00, %.preheader.us.us ]
  %87 = load double, double* %75, align 8
  %88 = fmul double %87, %2
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv72
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv78
  %96 = load double, double* %95, align 8
  %97 = load double, double* %89, align 8
  %98 = fmul double %96, %97
  %99 = fadd double %.047.us.us, %98
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge.us.us, label %86

._crit_edge55.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
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
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv15, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %21 ]
  %15 = add nsw i64 %indvars.iv, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond20, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %12
  br i1 %exitcond, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %3
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
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
