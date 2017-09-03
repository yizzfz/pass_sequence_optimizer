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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
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
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  %10 = icmp eq i32 %1, 1
  %wide.trip.count26 = zext i32 %0 to i64
  %wide.trip.count15.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge6.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge6.us ], [ 0, %.preheader.us.preheader ]
  %11 = add i64 %indvars.iv24, 4294967295
  %12 = icmp sgt i64 %indvars.iv24, 0
  br i1 %12, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv24
  store double 1.000000e+00, double* %13, align 8
  %14 = trunc i64 %indvars.iv24 to i32
  %15 = add i32 %14, %1
  br i1 %lcmp.mod19, label %.prol.loopexit17, label %.prol.preheader16

.prol.preheader16:                                ; preds = %._crit_edge.us
  %16 = srem i32 %15, %1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit17

.prol.loopexit17:                                 ; preds = %.prol.preheader16, %._crit_edge.us
  %indvars.iv13.unr.ph = phi i64 [ 1, %.prol.preheader16 ], [ 0, %._crit_edge.us ]
  br i1 %10, label %._crit_edge6.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit17
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %._crit_edge.us.new ], [ %indvars.iv13.unr.ph, %._crit_edge.us.new.preheader ]
  %20 = trunc i64 %indvars.iv13 to i32
  %21 = sub i32 %15, %20
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv13
  store double %24, double* %25, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %26 = trunc i64 %indvars.iv.next14 to i32
  %27 = sub i32 %15, %26
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv.next14
  store double %30, double* %31, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.121 = icmp eq i64 %indvars.iv.next14.1, %wide.trip.count15.1
  br i1 %exitcond.121, label %._crit_edge6.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %32 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %9
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %0
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %9
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter43 = and i64 %indvars.iv24, 1
  %lcmp.mod = icmp eq i64 %xtraiter43, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %44 = trunc i64 %indvars.iv24 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 0
  store double %47, double* %48, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %49 = trunc i64 %11 to i32
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.prol.loopexit17
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge ], [ 0, %.preheader.preheader ]
  %51 = add i64 %indvars.iv38, 4294967295
  %52 = icmp sgt i64 %indvars.iv38, 0
  br i1 %52, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter3442 = and i64 %indvars.iv38, 1
  %lcmp.mod35 = icmp eq i64 %xtraiter3442, 0
  br i1 %lcmp.mod35, label %.prol.loopexit33, label %.prol.preheader32

.prol.preheader32:                                ; preds = %.lr.ph
  %53 = trunc i64 %indvars.iv38 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 0
  store double %56, double* %57, align 8
  br label %.prol.loopexit33

.prol.loopexit33:                                 ; preds = %.prol.preheader32, %.lr.ph
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader32 ], [ 0, %.lr.ph ]
  %58 = trunc i64 %51 to i32
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit33
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %.lr.ph.new ], [ %indvars.iv27.unr.ph, %.lr.ph.new.preheader ]
  %60 = add nuw nsw i64 %indvars.iv27, %indvars.iv38
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, %0
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %9
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv27
  store double %64, double* %65, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %66 = add nuw nsw i64 %indvars.iv.next28, %indvars.iv38
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %0
  %69 = sitofp i32 %68 to double
  %70 = fdiv double %69, %9
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv.next28
  store double %70, double* %71, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv38
  br i1 %exitcond31.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit33, %.preheader
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv38
  store double 1.000000e+00, double* %72, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge9.loopexit46, label %.preheader

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9.loopexit46:                          ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit46, %._crit_edge9.loopexit, %5
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
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %wide.trip.count.3 = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %1 to i64
  %wide.trip.count24.1 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count30, -4
  %broadcast.splatinsert43 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat44 = shufflevector <2 x double> %broadcast.splatinsert43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge7.us, %.preheader3.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next32, %._crit_edge7.us ]
  %indvars.iv20 = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv.next21, %._crit_edge7.us ]
  %14 = sub nsw i64 0, %indvars.iv31
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %15 = icmp slt i64 %indvars.iv.next32, %11
  br i1 %15, label %.preheader.us.us.preheader, label %.preheader.us12.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %16 = trunc i64 %14 to i32
  %17 = trunc i64 %14 to i32
  %18 = add i32 %9, %17
  %xtraiter25 = and i32 %18, 1
  %lcmp.mod26 = icmp eq i32 %xtraiter25, 0
  %19 = sub i32 0, %16
  %20 = icmp eq i32 %10, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv31
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv20, 1
  br label %.preheader.us.us

.preheader.us12.preheader:                        ; preds = %.preheader3.us
  br i1 %lcmp.mod, label %.preheader.us12.prol.loopexit, label %.preheader.us12.prol.preheader

.preheader.us12.prol.preheader:                   ; preds = %.preheader.us12.preheader
  br label %.preheader.us12.prol

.preheader.us12.prol:                             ; preds = %.preheader.us12.prol.preheader, %.preheader.us12.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us12.prol ], [ 0, %.preheader.us12.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us12.prol ], [ %xtraiter, %.preheader.us12.prol.preheader ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.prol
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  store double %24, double* %22, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us12.prol.loopexit.loopexit, label %.preheader.us12.prol, !llvm.loop !1

.preheader.us12.prol.loopexit.loopexit:           ; preds = %.preheader.us12.prol
  br label %.preheader.us12.prol.loopexit

.preheader.us12.prol.loopexit:                    ; preds = %.preheader.us12.prol.loopexit.loopexit, %.preheader.us12.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us12.preheader ], [ %indvars.iv.next.prol, %.preheader.us12.prol.loopexit.loopexit ]
  br i1 %12, label %._crit_edge7.us, label %.preheader.us12.preheader38

.preheader.us12.preheader38:                      ; preds = %.preheader.us12.prol.loopexit
  %25 = sub i64 %13, %indvars.iv.unr
  %26 = lshr i64 %25, 2
  %27 = add nuw nsw i64 %26, 1
  %min.iters.check = icmp ult i64 %27, 2
  br i1 %min.iters.check, label %.preheader.us12.preheader45, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us12.preheader38
  %n.mod.vf = and i64 %27, 1
  %n.vec = sub nsw i64 %27, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %28 = add i64 %indvars.iv.unr, 4
  %29 = shl nuw i64 %26, 2
  %30 = add i64 %28, %29
  %31 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %30, %31
  br i1 %cmp.zero, label %.preheader.us12.preheader45, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %32 = shl i64 %index, 2
  %33 = add i64 %indvars.iv.unr, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %33
  %35 = bitcast double* %34 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %35, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec40 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec41 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec42 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %36 = fmul <2 x double> %strided.vec, %broadcast.splat44
  %37 = fmul <2 x double> %strided.vec40, %broadcast.splat44
  %38 = fmul <2 x double> %strided.vec41, %broadcast.splat44
  %39 = add nsw i64 %33, 3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %39
  %41 = fmul <2 x double> %strided.vec42, %broadcast.splat44
  %42 = getelementptr double, double* %40, i64 -3
  %43 = bitcast double* %42 to <8 x double>*
  %44 = shufflevector <2 x double> %36, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %45 = shufflevector <2 x double> %38, <2 x double> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %44, <4 x double> %45, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %43, align 8
  %index.next = add i64 %index, 2
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge7.us, label %.preheader.us12.preheader45

.preheader.us12.preheader45:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us12.preheader38
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.preheader.us12.preheader38 ], [ %ind.end, %middle.block ]
  br label %.preheader.us12

.preheader.us12:                                  ; preds = %.preheader.us12.preheader45, %.preheader.us12
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us12 ], [ %indvars.iv.ph, %.preheader.us12.preheader45 ]
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %2
  store double %49, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %2
  store double %52, double* %50, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %2
  store double %55, double* %53, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  store double %58, double* %56, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge7.us.loopexit46, label %.preheader.us12, !llvm.loop !6

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge7.us

._crit_edge7.us.loopexit46:                       ; preds = %.preheader.us12
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit46, %._crit_edge7.us.loopexit, %middle.block, %.preheader.us12.prol.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge9.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  br i1 %lcmp.mod26, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %60 = load double, double* %21, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv28
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = load double, double* %59, align 8
  %65 = fadd double %64, %63
  store double %65, double* %59, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv22.unr.ph = phi i64 [ %indvars.iv.next23.prol, %.prol.preheader ], [ %indvars.iv20, %.preheader.us.us ]
  br i1 %20, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  store double %68, double* %66, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %._crit_edge7.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.preheader.us.us.new ], [ %indvars.iv22.unr.ph, %.preheader.us.us.new.preheader ]
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv31
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv28
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = load double, double* %59, align 8
  %75 = fadd double %74, %73
  store double %75, double* %59, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv31
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next23, i64 %indvars.iv28
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = load double, double* %59, align 8
  %82 = fadd double %81, %80
  store double %82, double* %59, align 8
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
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
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
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
