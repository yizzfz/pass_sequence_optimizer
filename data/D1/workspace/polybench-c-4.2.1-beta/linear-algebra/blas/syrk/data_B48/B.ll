; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  %11 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %11)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %17)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %2, %16
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %6
  %wide.trip.count33 = zext i32 %1 to i64
  %8 = icmp sgt i32 %1, 0
  %9 = sext i32 %0 to i64
  %10 = sitofp i32 %0 to double
  br i1 %8, label %._crit_edge.us.preheader, label %._crit_edge5.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge16.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge16.us ], [ 0, %._crit_edge.us.preheader ]
  br label %11

; <label>:11:                                     ; preds = %11, %._crit_edge.us
  %indvars.iv31 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next32, %11 ]
  %12 = mul nsw i64 %indvars.iv35, %indvars.iv31
  %13 = add nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %10
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv31
  store double %17, double* %18, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge16.us, label %11

._crit_edge16.us:                                 ; preds = %11
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %19 = icmp slt i64 %indvars.iv.next36, %9
  br i1 %19, label %._crit_edge.us, label %._crit_edge5.us.preheader.loopexit

._crit_edge5.us.preheader.loopexit:               ; preds = %._crit_edge16.us
  br label %._crit_edge5.us.preheader

._crit_edge5.us.preheader:                        ; preds = %._crit_edge5.us.preheader.loopexit, %._crit_edge.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  %20 = sitofp i32 %1 to double
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.preheader, %._crit_edge8.us
  %indvars.iv29 = phi i64 [ 0, %._crit_edge5.us.preheader ], [ %indvars.iv.next30, %._crit_edge8.us ]
  br label %21

; <label>:21:                                     ; preds = %21, %._crit_edge5.us
  %indvars.iv = phi i64 [ 0, %._crit_edge5.us ], [ %indvars.iv.next, %21 ]
  %22 = mul nsw i64 %indvars.iv29, %indvars.iv
  %23 = add nsw i64 %22, 2
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %1
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %20
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge8.us, label %21

._crit_edge8.us:                                  ; preds = %21
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, 1
  %29 = icmp slt i64 %indvars.iv.next30, %9
  br i1 %29, label %._crit_edge5.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge8.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %6
  %wide.trip.count47 = zext i32 %1 to i64
  %8 = icmp sgt i32 %1, 0
  %9 = sext i32 %0 to i64
  br i1 %8, label %._crit_edge.us.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.lr.ph
  %10 = insertelement <2 x double> undef, double %3, i32 0
  %11 = insertelement <2 x double> %10, double %3, i32 1
  %12 = insertelement <2 x double> undef, double %3, i32 0
  %13 = insertelement <2 x double> %12, double %3, i32 1
  %broadcast.splatinsert78 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat79 = shufflevector <2 x double> %broadcast.splatinsert78, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %14 = insertelement <2 x double> undef, double %3, i32 0
  %15 = insertelement <2 x double> %14, double %3, i32 1
  %16 = insertelement <2 x double> undef, double %3, i32 0
  %17 = insertelement <2 x double> %16, double %3, i32 1
  %broadcast.splatinsert104 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat105 = shufflevector <2 x double> %broadcast.splatinsert104, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge12.us
  %indvar83 = phi i64 [ %indvar.next, %._crit_edge12.us ], [ 0, %._crit_edge.us.preheader ]
  %indvars.iv70 = phi i2 [ %indvars.iv.next71, %._crit_edge12.us ], [ 1, %._crit_edge.us.preheader ]
  %indvar = phi i32 [ %23, %._crit_edge12.us ], [ 0, %._crit_edge.us.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge12.us ], [ 0, %._crit_edge.us.preheader ]
  %indvars.iv41 = phi i32 [ %indvars.iv.next42, %._crit_edge12.us ], [ 1, %._crit_edge.us.preheader ]
  %18 = add i64 %indvar83, -3
  %19 = zext i2 %indvars.iv70 to i64
  %20 = add nuw nsw i64 %19, 4294967295
  %21 = and i64 %20, 4294967295
  %22 = add nuw nsw i64 %21, 1
  %23 = add i32 %indvar, 1
  %24 = icmp slt i64 %indvars.iv50, 0
  br i1 %24, label %._crit_edge12.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %._crit_edge.us
  %xtraiter = and i32 %23, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader, %.lr.ph.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.us.prol ], [ %xtraiter, %.lr.ph.us.prol.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.prol
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %3
  store double %27, double* %25, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.us.prol.loopexit.loopexit, label %.lr.ph.us.prol, !llvm.loop !1

.lr.ph.us.prol.loopexit.loopexit:                 ; preds = %.lr.ph.us.prol
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.loopexit, %.lr.ph.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us.preheader ], [ %22, %.lr.ph.us.prol.loopexit.loopexit ]
  %28 = icmp ult i32 %indvar, 3
  br i1 %28, label %._crit_edge5.us24.preheader, label %.lr.ph.us.preheader67

.lr.ph.us.preheader67:                            ; preds = %.lr.ph.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv41 to i64
  %29 = sub i64 %18, %indvars.iv.unr
  %30 = lshr i64 %29, 2
  %31 = add nuw nsw i64 %30, 1
  %min.iters.check84 = icmp ult i64 %31, 2
  br i1 %min.iters.check84, label %.lr.ph.us.preheader108, label %min.iters.checked85

min.iters.checked85:                              ; preds = %.lr.ph.us.preheader67
  %n.mod.vf86 = and i64 %31, 1
  %n.vec87 = sub nsw i64 %31, %n.mod.vf86
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  %32 = add nsw i64 %indvars.iv.unr, 4
  %33 = shl nuw i64 %30, 2
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf86, 2
  %ind.end93 = sub i64 %34, %35
  br i1 %cmp.zero88, label %.lr.ph.us.preheader108, label %vector.ph89

vector.ph89:                                      ; preds = %min.iters.checked85
  br label %vector.body80

vector.body80:                                    ; preds = %vector.body80, %vector.ph89
  %index90 = phi i64 [ 0, %vector.ph89 ], [ %index.next91, %vector.body80 ]
  %36 = shl i64 %index90, 2
  %37 = add i64 %indvars.iv.unr, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %37
  %39 = bitcast double* %38 to <8 x double>*
  %wide.vec99 = load <8 x double>, <8 x double>* %39, align 8
  %strided.vec100 = shufflevector <8 x double> %wide.vec99, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec101 = shufflevector <8 x double> %wide.vec99, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec102 = shufflevector <8 x double> %wide.vec99, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec103 = shufflevector <8 x double> %wide.vec99, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %40 = fmul <2 x double> %strided.vec100, %broadcast.splat105
  %41 = fmul <2 x double> %strided.vec101, %broadcast.splat105
  %42 = fmul <2 x double> %strided.vec102, %broadcast.splat105
  %43 = add nsw i64 %37, 3
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %43
  %45 = fmul <2 x double> %strided.vec103, %broadcast.splat105
  %46 = getelementptr double, double* %44, i64 -3
  %47 = bitcast double* %46 to <8 x double>*
  %48 = shufflevector <2 x double> %40, <2 x double> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %49 = shufflevector <2 x double> %42, <2 x double> %45, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec106 = shufflevector <4 x double> %48, <4 x double> %49, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec106, <8 x double>* %47, align 8
  %index.next91 = add i64 %index90, 2
  %50 = icmp eq i64 %index.next91, %n.vec87
  br i1 %50, label %middle.block81, label %vector.body80, !llvm.loop !3

middle.block81:                                   ; preds = %vector.body80
  %cmp.n94 = icmp eq i64 %n.mod.vf86, 0
  br i1 %cmp.n94, label %._crit_edge5.us24.preheader, label %.lr.ph.us.preheader108

.lr.ph.us.preheader108:                           ; preds = %middle.block81, %min.iters.checked85, %.lr.ph.us.preheader67
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked85 ], [ %indvars.iv.unr, %.lr.ph.us.preheader67 ], [ %ind.end93, %middle.block81 ]
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader108, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us ], [ %indvars.iv.ph, %.lr.ph.us.preheader108 ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv
  %52 = bitcast double* %51 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %52, align 8
  %54 = fmul <2 x double> %53, %15
  %55 = bitcast double* %51 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %59 = fmul <2 x double> %58, %17
  %60 = bitcast double* %56 to <2 x double>*
  store <2 x double> %59, <2 x double>* %60, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge5.us24.preheader.loopexit, label %.lr.ph.us, !llvm.loop !6

._crit_edge5.us24:                                ; preds = %._crit_edge5.us24.preheader, %._crit_edge9.us28
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge9.us28 ], [ 0, %._crit_edge5.us24.preheader ]
  br i1 %89, label %.prol.loopexit, label %61

; <label>:61:                                     ; preds = %._crit_edge5.us24
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv45
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %2
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv45
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = load double, double* %88, align 8
  %69 = fadd double %67, %68
  store double %69, double* %88, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge5.us24, %61
  %indvars.iv39.unr.ph = phi i64 [ 1, %61 ], [ 0, %._crit_edge5.us24 ]
  br i1 %90, label %._crit_edge9.us28, label %._crit_edge5.us24.new.preheader

._crit_edge5.us24.new.preheader:                  ; preds = %.prol.loopexit
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv45
  br label %._crit_edge5.us24.new

._crit_edge5.us24.new:                            ; preds = %._crit_edge5.us24.new.preheader, %._crit_edge5.us24.new
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %._crit_edge5.us24.new ], [ %indvars.iv39.unr.ph, %._crit_edge5.us24.new.preheader ]
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %2
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv45
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv39
  %77 = load double, double* %76, align 8
  %78 = fadd double %75, %77
  store double %78, double* %76, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %79 = load double, double* %70, align 8
  %80 = fmul double %79, %2
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next40, i64 %indvars.iv45
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next40
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  store double %86, double* %84, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next40.1, %wide.trip.count43.1
  br i1 %exitcond44.1, label %._crit_edge9.us28.loopexit, label %._crit_edge5.us24.new

._crit_edge9.us28.loopexit:                       ; preds = %._crit_edge5.us24.new
  br label %._crit_edge9.us28

._crit_edge9.us28:                                ; preds = %._crit_edge9.us28.loopexit, %.prol.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %._crit_edge12.us.loopexit, label %._crit_edge5.us24

._crit_edge5.us24.preheader.loopexit:             ; preds = %.lr.ph.us
  br label %._crit_edge5.us24.preheader

._crit_edge5.us24.preheader:                      ; preds = %._crit_edge5.us24.preheader.loopexit, %.lr.ph.us.prol.loopexit, %middle.block81
  %87 = and i32 %23, 1
  %wide.trip.count43.1 = zext i32 %indvars.iv41 to i64
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 0
  %89 = icmp eq i32 %87, 0
  %90 = icmp eq i32 %indvar, 0
  br label %._crit_edge5.us24

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge9.us28
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %._crit_edge.us
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, 1
  %91 = icmp slt i64 %indvars.iv.next51, %9
  %indvars.iv.next42 = add i32 %indvars.iv41, 1
  %indvars.iv.next71 = add i2 %indvars.iv70, 1
  %indvar.next = add i64 %indvar83, 1
  br i1 %91, label %._crit_edge.us, label %.loopexit.loopexit

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge4
  %indvars.iv72 = phi i2 [ %indvars.iv.next73, %._crit_edge4 ], [ 1, %._crit_edge.preheader ]
  %indvar62 = phi i32 [ %.pre, %._crit_edge4 ], [ 0, %._crit_edge.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge4 ], [ 0, %._crit_edge.preheader ]
  %indvars.iv54 = phi i32 [ %indvars.iv.next55, %._crit_edge4 ], [ 1, %._crit_edge.preheader ]
  %92 = add i64 %indvars.iv58, -3
  %93 = zext i2 %indvars.iv72 to i64
  %94 = add nuw nsw i64 %93, 4294967295
  %95 = and i64 %94, 4294967295
  %96 = add nuw nsw i64 %95, 1
  %97 = icmp slt i64 %indvars.iv58, 0
  %.pre = add i32 %indvar62, 1
  br i1 %97, label %._crit_edge4, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge
  %xtraiter64 = and i32 %.pre, 3
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  br i1 %lcmp.mod65, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter66 = phi i32 [ %prol.iter66.sub, %.lr.ph.prol ], [ %xtraiter64, %.lr.ph.prol.preheader ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv52.prol
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, %3
  store double %100, double* %98, align 8
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter66.sub = add nsw i32 %prol.iter66, -1
  %prol.iter66.cmp = icmp eq i32 %prol.iter66.sub, 0
  br i1 %prol.iter66.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !8

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv52.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %96, %.lr.ph.prol.loopexit.loopexit ]
  %101 = icmp ult i32 %indvar62, 3
  br i1 %101, label %._crit_edge4, label %.lr.ph.preheader68

.lr.ph.preheader68:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count56.3 = zext i32 %indvars.iv54 to i64
  %102 = sub i64 %92, %indvars.iv52.unr
  %103 = lshr i64 %102, 2
  %104 = add nuw nsw i64 %103, 1
  %min.iters.check = icmp ult i64 %104, 2
  br i1 %min.iters.check, label %.lr.ph.preheader109, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader68
  %n.mod.vf = and i64 %104, 1
  %n.vec = sub nsw i64 %104, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %105 = add nsw i64 %indvars.iv52.unr, 4
  %106 = shl nuw i64 %103, 2
  %107 = add i64 %105, %106
  %108 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %107, %108
  br i1 %cmp.zero, label %.lr.ph.preheader109, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %109 = shl i64 %index, 2
  %110 = add i64 %indvars.iv52.unr, %109
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %110
  %112 = bitcast double* %111 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %112, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec75 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec76 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec77 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %113 = fmul <2 x double> %strided.vec, %broadcast.splat79
  %114 = fmul <2 x double> %strided.vec75, %broadcast.splat79
  %115 = fmul <2 x double> %strided.vec76, %broadcast.splat79
  %116 = add nsw i64 %110, 3
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %116
  %118 = fmul <2 x double> %strided.vec77, %broadcast.splat79
  %119 = getelementptr double, double* %117, i64 -3
  %120 = bitcast double* %119 to <8 x double>*
  %121 = shufflevector <2 x double> %113, <2 x double> %114, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %122 = shufflevector <2 x double> %115, <2 x double> %118, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %121, <4 x double> %122, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %120, align 8
  %index.next = add i64 %index, 2
  %123 = icmp eq i64 %index.next, %n.vec
  br i1 %123, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge4, label %.lr.ph.preheader109

.lr.ph.preheader109:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph.preheader68
  %indvars.iv52.ph = phi i64 [ %indvars.iv52.unr, %min.iters.checked ], [ %indvars.iv52.unr, %.lr.ph.preheader68 ], [ %ind.end, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader109, %.lr.ph
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.3, %.lr.ph ], [ %indvars.iv52.ph, %.lr.ph.preheader109 ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv52
  %125 = bitcast double* %124 to <2 x double>*
  %126 = load <2 x double>, <2 x double>* %125, align 8
  %127 = fmul <2 x double> %126, %11
  %128 = bitcast double* %124 to <2 x double>*
  store <2 x double> %127, <2 x double>* %128, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.next53.1
  %130 = bitcast double* %129 to <2 x double>*
  %131 = load <2 x double>, <2 x double>* %130, align 8
  %132 = fmul <2 x double> %131, %13
  %133 = bitcast double* %129 to <2 x double>*
  store <2 x double> %132, <2 x double>* %133, align 8
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  %exitcond57.3 = icmp eq i64 %indvars.iv.next53.3, %wide.trip.count56.3
  br i1 %exitcond57.3, label %._crit_edge4.loopexit, label %.lr.ph, !llvm.loop !10

._crit_edge4.loopexit:                            ; preds = %.lr.ph
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge, %middle.block, %.lr.ph.prol.loopexit
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %134 = icmp slt i64 %indvars.iv.next59, %9
  %indvars.iv.next55 = add i32 %indvars.iv54, 1
  %indvars.iv.next73 = add i2 %indvars.iv72, 1
  br i1 %134, label %._crit_edge, label %.loopexit.loopexit110

.loopexit.loopexit:                               ; preds = %._crit_edge12.us
  br label %.loopexit

.loopexit.loopexit110:                            ; preds = %._crit_edge4
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit110, %.loopexit.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %10

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %21 = icmp slt i64 %indvars.iv.next14, %8
  br i1 %21, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge4.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !4, !5}
!10 = distinct !{!10, !7, !4, !5}
