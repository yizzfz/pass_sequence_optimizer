; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count60 = zext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter38 = and i32 %1, 1
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  %10 = icmp eq i32 %1, 1
  %wide.trip.count46 = zext i32 %0 to i64
  %wide.trip.count35.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge26.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge26.us ], [ 0, %.preheader.us.preheader ]
  %11 = add nuw i64 %indvars.iv44, 4294967295
  %12 = icmp sgt i64 %indvars.iv44, 0
  br i1 %12, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv44
  store double 1.000000e+00, double* %13, align 8
  %14 = trunc i64 %indvars.iv44 to i32
  %15 = add i32 %14, %1
  br i1 %lcmp.mod39, label %.prol.loopexit37, label %.prol.preheader36

.prol.preheader36:                                ; preds = %._crit_edge.us
  %16 = srem i32 %15, %1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit37

.prol.loopexit37:                                 ; preds = %.prol.preheader36, %._crit_edge.us
  %indvars.iv33.unr.ph = phi i64 [ 1, %.prol.preheader36 ], [ 0, %._crit_edge.us ]
  br i1 %10, label %._crit_edge26.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit37
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %._crit_edge.us.new ], [ %indvars.iv33.unr.ph, %._crit_edge.us.new.preheader ]
  %20 = trunc i64 %indvars.iv33 to i32
  %21 = sub i32 %15, %20
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv33
  store double %24, double* %25, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %26 = trunc i64 %indvars.iv.next34 to i32
  %27 = sub i32 %15, %26
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv.next34
  store double %30, double* %31, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond.141 = icmp eq i64 %indvars.iv.next34.1, %wide.trip.count35.1
  br i1 %exitcond.141, label %._crit_edge26.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %32 = add nuw nsw i64 %indvars.iv, %indvars.iv44
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %9
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = add nuw nsw i64 %indvars.iv.next, %indvars.iv44
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %0
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %9
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv44
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter63 = and i64 %indvars.iv44, 1
  %lcmp.mod = icmp eq i64 %xtraiter63, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %44 = trunc i64 %indvars.iv44 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 0
  store double %47, double* %48, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %49 = trunc i64 %11 to i32
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge26.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %.prol.loopexit37
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond, label %._crit_edge29.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge ], [ 0, %.preheader.preheader ]
  %51 = add nuw i64 %indvars.iv58, 4294967295
  %52 = icmp sgt i64 %indvars.iv58, 0
  br i1 %52, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter5462 = and i64 %indvars.iv58, 1
  %lcmp.mod55 = icmp eq i64 %xtraiter5462, 0
  br i1 %lcmp.mod55, label %.prol.loopexit53, label %.prol.preheader52

.prol.preheader52:                                ; preds = %.lr.ph
  %53 = trunc i64 %indvars.iv58 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 0
  store double %56, double* %57, align 8
  br label %.prol.loopexit53

.prol.loopexit53:                                 ; preds = %.prol.preheader52, %.lr.ph
  %indvars.iv47.unr.ph = phi i64 [ 1, %.prol.preheader52 ], [ 0, %.lr.ph ]
  %58 = trunc i64 %51 to i32
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit53
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %.lr.ph.new ], [ %indvars.iv47.unr.ph, %.lr.ph.new.preheader ]
  %60 = add nuw nsw i64 %indvars.iv47, %indvars.iv58
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, %0
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %9
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv47
  store double %64, double* %65, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %66 = add nuw nsw i64 %indvars.iv.next48, %indvars.iv58
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %0
  %69 = sitofp i32 %68 to double
  %70 = fdiv double %69, %9
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv.next48
  store double %70, double* %71, align 8
  %indvars.iv.next48.1 = add nuw nsw i64 %indvars.iv47, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next48.1, %indvars.iv58
  br i1 %exitcond51.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit53, %.preheader
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv58
  store double 1.000000e+00, double* %72, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %._crit_edge29.loopexit66, label %.preheader

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29.loopexit66:                         ; preds = %._crit_edge
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit66, %._crit_edge29.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader23.us.preheader, label %._crit_edge29

.preheader23.us.preheader:                        ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count50 = zext i32 %1 to i64
  %wide.trip.count44.1 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %13 = add nsw i32 %xtraiter, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count50, -4
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %._crit_edge27.us, %.preheader23.us.preheader
  %indvars.iv51 = phi i64 [ 0, %.preheader23.us.preheader ], [ %indvars.iv.next52, %._crit_edge27.us ]
  %indvars.iv40 = phi i64 [ 1, %.preheader23.us.preheader ], [ %indvars.iv.next41, %._crit_edge27.us ]
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %17 = icmp slt i64 %indvars.iv.next52, %11
  br i1 %17, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader23.us
  %18 = sub nsw i64 0, %indvars.iv51
  %19 = trunc i64 %18 to i32
  %20 = add i32 %9, %19
  %xtraiter45 = and i32 %20, 1
  %lcmp.mod46 = icmp eq i32 %xtraiter45, 0
  %21 = sub i32 0, %19
  %22 = icmp eq i32 %10, %21
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv51
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv40, 1
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader23.us
  br i1 %lcmp.mod, label %.preheader.us32.prol.loopexit, label %.preheader.us32.prol.preheader

.preheader.us32.prol.preheader:                   ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.prol:                             ; preds = %.preheader.us32.prol.preheader, %.preheader.us32.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol ], [ 0, %.preheader.us32.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us32.prol ], [ %xtraiter, %.preheader.us32.prol.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  store double %26, double* %24, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol.loopexit.loopexit, label %.preheader.us32.prol, !llvm.loop !1

.preheader.us32.prol.loopexit.loopexit:           ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.prol.loopexit.loopexit, %.preheader.us32.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader ], [ %15, %.preheader.us32.prol.loopexit.loopexit ]
  br i1 %12, label %._crit_edge27.us, label %.preheader.us32.preheader58

.preheader.us32.preheader58:                      ; preds = %.preheader.us32.prol.loopexit
  %27 = sub nsw i64 %16, %indvars.iv.unr
  %28 = lshr i64 %27, 2
  %29 = add nuw nsw i64 %28, 1
  %min.iters.check = icmp ult i64 %29, 2
  br i1 %min.iters.check, label %.preheader.us32.preheader66, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us32.preheader58
  %n.mod.vf = and i64 %29, 1
  %n.vec = sub nsw i64 %29, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %30 = add nsw i64 %indvars.iv.unr, 4
  %31 = shl nuw i64 %28, 2
  %32 = add i64 %30, %31
  %33 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %32, %33
  br i1 %cmp.zero, label %.preheader.us32.preheader66, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = shl i64 %index, 2
  %35 = add i64 %indvars.iv.unr, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %35
  %37 = bitcast double* %36 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %37, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %38 = fmul <2 x double> %strided.vec, %broadcast.splat65
  %39 = fmul <2 x double> %strided.vec61, %broadcast.splat65
  %40 = fmul <2 x double> %strided.vec62, %broadcast.splat65
  %41 = add nsw i64 %35, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %41
  %43 = fmul <2 x double> %strided.vec63, %broadcast.splat65
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
  br i1 %cmp.n, label %._crit_edge27.us, label %.preheader.us32.preheader66

.preheader.us32.preheader66:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us32.preheader58
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.preheader.us32.preheader58 ], [ %ind.end, %middle.block ]
  br label %.preheader.us32

.preheader.us32:                                  ; preds = %.preheader.us32.preheader66, %.preheader.us32
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us32 ], [ %indvars.iv.ph, %.preheader.us32.preheader66 ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %2
  store double %51, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %2
  store double %54, double* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next.1
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  store double %57, double* %55, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next.2
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %2
  store double %60, double* %58, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count50
  br i1 %exitcond.3, label %._crit_edge27.us.loopexit67, label %.preheader.us32, !llvm.loop !6

._crit_edge27.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge27.us

._crit_edge27.us.loopexit67:                      ; preds = %.preheader.us32
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit67, %._crit_edge27.us.loopexit, %middle.block, %.preheader.us32.prol.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count44.1
  br i1 %exitcond54, label %._crit_edge29.loopexit, label %.preheader23.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv48
  br i1 %lcmp.mod46, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %62 = load double, double* %23, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv48
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = load double, double* %61, align 8
  %67 = fadd double %66, %65
  store double %67, double* %61, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv42.unr.ph = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader ], [ %indvars.iv40, %.preheader.us.us ]
  %.pre60 = load double, double* %61, align 8
  br i1 %22, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %68 = phi double [ %.pre60, %.prol.loopexit ], [ %82, %._crit_edge.us.us.loopexit ]
  %69 = fmul double %68, %2
  store double %69, double* %61, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond, label %._crit_edge27.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %70 = phi double [ %82, %.preheader.us.us.new ], [ %.pre60, %.preheader.us.us.new.preheader ]
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %.preheader.us.us.new ], [ %indvars.iv42.unr.ph, %.preheader.us.us.new.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv51
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv48
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %70, %75
  store double %76, double* %61, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next43, i64 %indvars.iv51
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next43, i64 %indvars.iv48
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %61, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next43.1, %wide.trip.count44.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge29.loopexit:                           ; preds = %._crit_edge27.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %5
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
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv13, %10
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
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
