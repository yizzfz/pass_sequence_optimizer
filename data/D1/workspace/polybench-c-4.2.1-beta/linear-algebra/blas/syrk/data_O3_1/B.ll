; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader4.lr.ph, label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  br i1 %8, label %.preheader4.us.preheader, label %.preheader.lr.ph

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %10 ]
  %11 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %9
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %16, double* %17, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge11.us, label %10

._crit_edge11.us:                                 ; preds = %10
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader3, label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge11.us
  %18 = icmp sgt i32 %0, 0
  br i1 %18, label %.preheader.lr.ph, label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %.preheader4.lr.ph, %.preheader3
  %19 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %22 = add nuw nsw i64 %21, 2
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %19
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %26, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %6, %.preheader3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count59 = zext i32 %0 to i64
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count37 = zext i32 %1 to i64
  %wide.trip.count43 = zext i32 %0 to i64
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader95, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader95 ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next.1
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next.2
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %3
  store double %20, double* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv39
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.new:                              ; preds = %.preheader.us15.new.preheader, %.preheader.us15.new
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.preheader.us15.new ], [ %indvars.iv25.unr.ph, %.preheader.us15.new.preheader ]
  %21 = load double, double* %37, align 8
  %22 = fmul double %21, %2
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv35
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv25
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %29 = load double, double* %37, align 8
  %30 = fmul double %29, %2
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next26, i64 %indvars.iv35
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next26
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv39
  br i1 %exitcond.1, label %._crit_edge.us18.loopexit, label %.preheader.us15.new

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv35
  br i1 %lcmp.mod33, label %.prol.loopexit31, label %.prol.preheader30

.prol.preheader30:                                ; preds = %.preheader.us15
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %2
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv35
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %74, align 8
  %44 = fadd double %43, %42
  store double %44, double* %74, align 8
  br label %.prol.loopexit31

.prol.loopexit31:                                 ; preds = %.prol.preheader30, %.preheader.us15
  %indvars.iv25.unr.ph = phi i64 [ 1, %.prol.preheader30 ], [ 0, %.preheader.us15 ]
  br i1 %73, label %._crit_edge.us18, label %.preheader.us15.new.preheader

.preheader.us15.new.preheader:                    ; preds = %.prol.loopexit31
  br label %.preheader.us15.new

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge9.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge9.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge9.us ], [ 1, %.lr.ph.us.preheader ]
  %45 = add i64 %indvars.iv41, -3
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %46 = trunc i64 %indvars.iv.next42 to i32
  %xtraiter = and i32 %46, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.prol
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  store double %49, double* %47, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %50 = icmp ult i64 %indvars.iv41, 3
  br i1 %50, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %51 = sub i64 %45, %indvars.iv.unr
  %52 = lshr i64 %51, 2
  %53 = add nuw nsw i64 %52, 1
  %min.iters.check72 = icmp ult i64 %53, 2
  br i1 %min.iters.check72, label %.lr.ph.us.new.preheader95, label %min.iters.checked73

.lr.ph.us.new.preheader95:                        ; preds = %middle.block70, %min.iters.checked73, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked73 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end81, %middle.block70 ]
  br label %.lr.ph.us.new

min.iters.checked73:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf74 = and i64 %53, 1
  %n.vec75 = sub nsw i64 %53, %n.mod.vf74
  %cmp.zero76 = icmp eq i64 %n.vec75, 0
  %54 = add i64 %indvars.iv.unr, 4
  %55 = shl nuw i64 %52, 2
  %56 = add i64 %54, %55
  %57 = shl nuw nsw i64 %n.mod.vf74, 2
  %ind.end81 = sub i64 %56, %57
  br i1 %cmp.zero76, label %.lr.ph.us.new.preheader95, label %vector.ph77

vector.ph77:                                      ; preds = %min.iters.checked73
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69, %vector.ph77
  %index78 = phi i64 [ 0, %vector.ph77 ], [ %index.next79, %vector.body69 ]
  %58 = shl i64 %index78, 2
  %59 = add i64 %indvars.iv.unr, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %59
  %61 = bitcast double* %60 to <8 x double>*
  %wide.vec87 = load <8 x double>, <8 x double>* %61, align 8
  %strided.vec88 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec89 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec90 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec91 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %62 = fmul <2 x double> %strided.vec88, %broadcast.splat93
  %63 = fmul <2 x double> %strided.vec89, %broadcast.splat93
  %64 = fmul <2 x double> %strided.vec90, %broadcast.splat93
  %65 = add nsw i64 %59, 3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %65
  %67 = fmul <2 x double> %strided.vec91, %broadcast.splat93
  %68 = getelementptr double, double* %66, i64 -3
  %69 = bitcast double* %68 to <8 x double>*
  %70 = shufflevector <2 x double> %62, <2 x double> %63, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %71 = shufflevector <2 x double> %64, <2 x double> %67, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec94 = shufflevector <4 x double> %70, <4 x double> %71, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec94, <8 x double>* %69, align 8
  %index.next79 = add i64 %index78, 2
  %72 = icmp eq i64 %index.next79, %n.vec75
  br i1 %72, label %middle.block70, label %vector.body69, !llvm.loop !7

middle.block70:                                   ; preds = %vector.body69
  %cmp.n82 = icmp eq i64 %n.mod.vf74, 0
  br i1 %cmp.n82, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader95

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block70, %.prol.loopexit
  %xtraiter3261 = and i64 %indvars.iv.next42, 1
  %lcmp.mod33 = icmp eq i64 %xtraiter3261, 0
  %73 = icmp eq i64 %indvars.iv41, 0
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 0
  br label %.preheader.us15

._crit_edge.us18.loopexit:                        ; preds = %.preheader.us15.new
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %.prol.loopexit31
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader3
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.preheader3 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %.preheader3 ], [ 1, %.lr.ph.preheader ]
  %75 = add i64 %indvars.iv57, -3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %76 = trunc i64 %indvars.iv.next58 to i32
  %xtraiter52 = and i32 %76, 3
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  br i1 %lcmp.mod53, label %.prol.loopexit51, label %.prol.preheader50.preheader

.prol.preheader50.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader50

.prol.preheader50:                                ; preds = %.prol.preheader50.preheader, %.prol.preheader50
  %indvars.iv45.prol = phi i64 [ %indvars.iv.next46.prol, %.prol.preheader50 ], [ 0, %.prol.preheader50.preheader ]
  %prol.iter54 = phi i32 [ %prol.iter54.sub, %.prol.preheader50 ], [ %xtraiter52, %.prol.preheader50.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv45.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  store double %79, double* %77, align 8
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv45.prol, 1
  %prol.iter54.sub = add i32 %prol.iter54, -1
  %prol.iter54.cmp = icmp eq i32 %prol.iter54.sub, 0
  br i1 %prol.iter54.cmp, label %.prol.loopexit51.loopexit, label %.prol.preheader50, !llvm.loop !8

.prol.loopexit51.loopexit:                        ; preds = %.prol.preheader50
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.prol.loopexit51.loopexit, %.lr.ph
  %indvars.iv45.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next46.prol, %.prol.loopexit51.loopexit ]
  %80 = icmp ult i64 %indvars.iv57, 3
  br i1 %80, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit51
  %81 = sub i64 %75, %indvars.iv45.unr
  %82 = lshr i64 %81, 2
  %83 = add nuw nsw i64 %82, 1
  %min.iters.check = icmp ult i64 %83, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader96, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %83, 1
  %n.vec = sub nsw i64 %83, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %84 = add i64 %indvars.iv45.unr, 4
  %85 = shl nuw i64 %82, 2
  %86 = add i64 %84, %85
  %87 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %86, %87
  br i1 %cmp.zero, label %.lr.ph.new.preheader96, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %88 = shl i64 %index, 2
  %89 = add i64 %indvars.iv45.unr, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %89
  %91 = bitcast double* %90 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %91, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %92 = fmul <2 x double> %strided.vec, %broadcast.splat68
  %93 = fmul <2 x double> %strided.vec64, %broadcast.splat68
  %94 = fmul <2 x double> %strided.vec65, %broadcast.splat68
  %95 = add nsw i64 %89, 3
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %95
  %97 = fmul <2 x double> %strided.vec66, %broadcast.splat68
  %98 = getelementptr double, double* %96, i64 -3
  %99 = bitcast double* %98 to <8 x double>*
  %100 = shufflevector <2 x double> %92, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %101 = shufflevector <2 x double> %94, <2 x double> %97, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %100, <4 x double> %101, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %99, align 8
  %index.next = add i64 %index, 2
  %102 = icmp eq i64 %index.next, %n.vec
  br i1 %102, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader96

.lr.ph.new.preheader96:                           ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv45.ph = phi i64 [ %indvars.iv45.unr, %min.iters.checked ], [ %indvars.iv45.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader96, %.lr.ph.new
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.3, %.lr.ph.new ], [ %indvars.iv45.ph, %.lr.ph.new.preheader96 ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv45
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %3
  store double %105, double* %103, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next46
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %3
  store double %108, double* %106, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next46.1
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv45, 3
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next46.2
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %3
  store double %114, double* %112, align 8
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv45, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next46.3, %indvars.iv55
  br i1 %exitcond49.3, label %.preheader3.loopexit, label %.lr.ph.new, !llvm.loop !10

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit51
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge13.loopexit97, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit97:                         ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit97, %._crit_edge13.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
