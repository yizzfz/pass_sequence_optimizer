; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge9

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count40 = zext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter18 = and i32 %1, 1
  %wide.trip.count26 = zext i32 %0 to i64
  %wide.trip.count15.1 = zext i32 %1 to i64
  %10 = icmp eq i32 %xtraiter18, 0
  %11 = icmp eq i32 %1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge6.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge6.us ], [ 0, %.preheader.us.preheader ]
  %12 = add i64 %indvars.iv24, 4294967295
  %13 = icmp sgt i64 %indvars.iv24, 0
  br i1 %13, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %._crit_edge43
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv24
  store double 1.000000e+00, double* %14, align 8
  %15 = trunc i64 %indvars.iv24 to i32
  %16 = add i32 %15, %1
  br i1 %10, label %.prol.loopexit17, label %.prol.preheader16

.prol.preheader16:                                ; preds = %._crit_edge.us
  %17 = srem i32 %16, %1
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 0
  store double %19, double* %20, align 8
  br label %.prol.loopexit17

.prol.loopexit17:                                 ; preds = %.prol.preheader16, %._crit_edge.us
  %indvars.iv13.unr.ph = phi i64 [ 1, %.prol.preheader16 ], [ 0, %._crit_edge.us ]
  br i1 %11, label %._crit_edge6.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit17
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %._crit_edge.us.new ], [ %indvars.iv13.unr.ph, %._crit_edge.us.new.preheader ]
  %21 = trunc i64 %indvars.iv13 to i32
  %22 = sub i32 %16, %21
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv13
  store double %25, double* %26, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %27 = trunc i64 %indvars.iv.next14 to i32
  %28 = sub i32 %16, %27
  %29 = srem i32 %28, %1
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv.next14
  store double %31, double* %32, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.121 = icmp eq i64 %indvars.iv.next14.1, %wide.trip.count15.1
  br i1 %exitcond.121, label %._crit_edge6.us.loopexit, label %._crit_edge.us.new

._crit_edge43:                                    ; preds = %._crit_edge43.preheader, %._crit_edge43
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge43 ], [ %indvars.iv.unr.ph, %._crit_edge43.preheader ]
  %33 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %9
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %9
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %43, double* %44, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %._crit_edge43

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter46 = and i64 %indvars.iv24, 1
  %lcmp.mod = icmp eq i64 %xtraiter46, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %45 = trunc i64 %indvars.iv24 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %9
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 0
  store double %48, double* %49, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %50 = trunc i64 %12 to i32
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %._crit_edge.us, label %._crit_edge43.preheader

._crit_edge43.preheader:                          ; preds = %.prol.loopexit
  br label %._crit_edge43

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.prol.loopexit17
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge ], [ 0, %.preheader.preheader ]
  %52 = add i64 %indvars.iv38, 4294967295
  %53 = icmp sgt i64 %indvars.iv38, 0
  br i1 %53, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter3445 = and i64 %indvars.iv38, 1
  %lcmp.mod35 = icmp eq i64 %xtraiter3445, 0
  br i1 %lcmp.mod35, label %.prol.loopexit33, label %.prol.preheader32

.prol.preheader32:                                ; preds = %.lr.ph
  %54 = trunc i64 %indvars.iv38 to i32
  %55 = srem i32 %54, %0
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %9
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 0
  store double %57, double* %58, align 8
  br label %.prol.loopexit33

.prol.loopexit33:                                 ; preds = %.prol.preheader32, %.lr.ph
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader32 ], [ 0, %.lr.ph ]
  %59 = trunc i64 %52 to i32
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit33
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %.lr.ph.new ], [ %indvars.iv27.unr.ph, %.lr.ph.new.preheader ]
  %61 = add nuw nsw i64 %indvars.iv27, %indvars.iv38
  %62 = trunc i64 %61 to i32
  %63 = srem i32 %62, %0
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %64, %9
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv27
  store double %65, double* %66, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %67 = add nuw nsw i64 %indvars.iv.next28, %indvars.iv38
  %68 = trunc i64 %67 to i32
  %69 = srem i32 %68, %0
  %70 = sitofp i32 %69 to double
  %71 = fdiv double %70, %9
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv.next28
  store double %71, double* %72, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv38
  br i1 %exitcond31.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit33, %.preheader
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv38
  store double 1.000000e+00, double* %73, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge9.loopexit50, label %.preheader

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9.loopexit50:                          ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit50, %._crit_edge9.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader3.us.preheader, label %._crit_edge9

.preheader3.us.preheader:                         ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count33 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %wide.trip.count.3 = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %1 to i64
  %wide.trip.count24.1 = zext i32 %0 to i64
  %12 = add nsw i64 %wide.trip.count30, -4
  %13 = icmp eq i32 %xtraiter, 0
  %14 = icmp ult i32 %8, 3
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge7.us, %.preheader3.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next32, %._crit_edge7.us ]
  %indvars.iv20 = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv.next21, %._crit_edge7.us ]
  %15 = sub nsw i64 0, %indvars.iv31
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %16 = icmp slt i64 %indvars.iv.next32, %11
  br i1 %16, label %.preheader.us.us.preheader, label %.preheader.us12.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %17 = trunc i64 %15 to i32
  %18 = trunc i64 %15 to i32
  %19 = add i32 %9, %18
  %xtraiter25 = and i32 %19, 1
  %20 = sub i32 0, %17
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv31
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv20, 1
  %22 = icmp eq i32 %xtraiter25, 0
  %23 = icmp eq i32 %10, %20
  br label %.preheader.us.us

.preheader.us12.preheader:                        ; preds = %.preheader3.us
  br i1 %13, label %.preheader.us12.prol.loopexit, label %.preheader.us12.prol.preheader

.preheader.us12.prol.preheader:                   ; preds = %.preheader.us12.preheader
  br label %.preheader.us12.prol

.preheader.us12.prol:                             ; preds = %.preheader.us12.prol.preheader, %.preheader.us12.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us12.prol ], [ 0, %.preheader.us12.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us12.prol ], [ %xtraiter, %.preheader.us12.prol.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  store double %26, double* %24, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us12.prol.loopexit.loopexit, label %.preheader.us12.prol, !llvm.loop !1

.preheader.us12.prol.loopexit.loopexit:           ; preds = %.preheader.us12.prol
  br label %.preheader.us12.prol.loopexit

.preheader.us12.prol.loopexit:                    ; preds = %.preheader.us12.prol.loopexit.loopexit, %.preheader.us12.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us12.preheader ], [ %indvars.iv.next.prol, %.preheader.us12.prol.loopexit.loopexit ]
  br i1 %14, label %._crit_edge7.us, label %.preheader.us12.preheader38

.preheader.us12.preheader38:                      ; preds = %.preheader.us12.prol.loopexit
  %27 = sub i64 %12, %indvars.iv.unr
  %28 = lshr i64 %27, 2
  %29 = add nuw nsw i64 %28, 1
  %min.iters.check = icmp ult i64 %29, 2
  br i1 %min.iters.check, label %.preheader.us12.preheader46, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us12.preheader38
  %n.mod.vf = and i64 %29, 1
  %n.vec = sub nsw i64 %29, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %30 = add i64 %indvars.iv.unr, 4
  %31 = shl nuw i64 %28, 2
  %32 = add i64 %30, %31
  %33 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %32, %33
  br i1 %cmp.zero, label %.preheader.us12.preheader46, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = shl i64 %index, 2
  %35 = add i64 %indvars.iv.unr, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %35
  %37 = bitcast double* %36 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %37, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec41 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec42 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec43 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %38 = fmul <2 x double> %strided.vec, %broadcast.splat45
  %39 = fmul <2 x double> %strided.vec41, %broadcast.splat45
  %40 = fmul <2 x double> %strided.vec42, %broadcast.splat45
  %41 = add nsw i64 %35, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %41
  %43 = fmul <2 x double> %strided.vec43, %broadcast.splat45
  %44 = getelementptr double, double* %42, i64 -3
  %45 = bitcast double* %44 to <8 x double>*
  %46 = shufflevector <2 x double> %38, <2 x double> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %47 = shufflevector <2 x double> %40, <2 x double> %43, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %46, <4 x double> %47, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %45, align 8
  %index.next = add i64 %index, 2
  %48 = icmp eq i64 %index.next, %n.vec
  br i1 %48, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge7.us, label %.preheader.us12.preheader46

.preheader.us12.preheader46:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us12.preheader38
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.preheader.us12.preheader38 ], [ %ind.end, %middle.block ]
  br label %.preheader.us12

.preheader.us12:                                  ; preds = %.preheader.us12.preheader46, %.preheader.us12
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us12 ], [ %indvars.iv.ph, %.preheader.us12.preheader46 ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %2
  store double %51, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %2
  store double %54, double* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  store double %57, double* %55, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %2
  store double %60, double* %58, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge7.us.loopexit47, label %.preheader.us12, !llvm.loop !6

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge7.us

._crit_edge7.us.loopexit47:                       ; preds = %.preheader.us12
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit47, %._crit_edge7.us.loopexit, %middle.block, %.preheader.us12.prol.loopexit
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond34, label %._crit_edge9.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  br i1 %22, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %62 = load double, double* %21, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv28
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = load double, double* %61, align 8
  %67 = fadd double %66, %65
  store double %67, double* %61, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv22.unr.ph = phi i64 [ %indvars.iv.next23.prol, %.prol.preheader ], [ %indvars.iv20, %.preheader.us.us ]
  br i1 %23, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %2
  store double %70, double* %68, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %._crit_edge7.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.preheader.us.us.new ], [ %indvars.iv22.unr.ph, %.preheader.us.us.new.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv31
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv28
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = load double, double* %61, align 8
  %77 = fadd double %76, %75
  store double %77, double* %61, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv31
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next23, i64 %indvars.iv28
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = load double, double* %61, align 8
  %84 = fadd double %83, %82
  store double %84, double* %61, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge9.loopexit:                            ; preds = %._crit_edge7.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count9 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge3.us ]
  %11 = mul nsw i64 %indvars.iv7, %10
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge.us._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %3
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
