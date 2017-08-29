; ModuleID = 'A.ll'
source_filename = "gemm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader9.preheader.lr.ph, label %.preheader6.preheader

.preheader9.preheader.lr.ph:                      ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader9.preheader.us.preheader, label %.preheader7.preheader.lr.ph

.preheader9.preheader.us.preheader:               ; preds = %.preheader9.preheader.lr.ph
  %wide.trip.count64 = zext i32 %1 to i64
  %wide.trip.count68 = zext i32 %0 to i64
  br label %.preheader9.preheader.us

.preheader9.preheader.us:                         ; preds = %.preheader9.preheader.us.preheader, %.preheader9._crit_edge.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %.preheader9._crit_edge.us ], [ 0, %.preheader9.preheader.us.preheader ]
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us, %.preheader9.preheader.us
  %indvars.iv62 = phi i64 [ 0, %.preheader9.preheader.us ], [ %indvars.iv.next63, %.preheader9.us ]
  %12 = mul nuw nsw i64 %indvars.iv62, %indvars.iv66
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %11
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv66, i64 %indvars.iv62
  store double %17, double* %18, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  br i1 %exitcond65, label %.preheader9._crit_edge.us, label %.preheader9.us

.preheader9._crit_edge.us:                        ; preds = %.preheader9.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %.preheader7.preheader.lr.ph.loopexit, label %.preheader9.preheader.us

.preheader7.preheader.lr.ph.loopexit:             ; preds = %.preheader9._crit_edge.us
  br label %.preheader7.preheader.lr.ph

.preheader7.preheader.lr.ph:                      ; preds = %.preheader7.preheader.lr.ph.loopexit, %.preheader9.preheader.lr.ph
  %19 = icmp sgt i32 %2, 0
  %20 = sitofp i32 %2 to double
  br i1 %19, label %.preheader7.preheader.us.preheader, label %.preheader6._crit_edge

.preheader7.preheader.us.preheader:               ; preds = %.preheader7.preheader.lr.ph
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %21 = icmp eq i32 %2, 1
  %wide.trip.count59 = zext i32 %0 to i64
  %wide.trip.count55 = zext i32 %2 to i64
  br label %.preheader7.preheader.us

.preheader7.preheader.us:                         ; preds = %.preheader7.preheader.us.preheader, %.preheader7._crit_edge.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.preheader7._crit_edge.us ], [ 0, %.preheader7.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.preheader7.us.prol.loopexit.unr-lcssa, label %.preheader7.us.prol.preheader

.preheader7.us.prol.preheader:                    ; preds = %.preheader7.preheader.us
  %22 = trunc i64 %indvars.iv57 to i32
  %23 = srem i32 %22, %2
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %20
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 0
  store double %25, double* %26, align 8
  br label %.preheader7.us.prol.loopexit.unr-lcssa

.preheader7.us.prol.loopexit.unr-lcssa:           ; preds = %.preheader7.preheader.us, %.preheader7.us.prol.preheader
  %indvars.iv53.unr.ph = phi i64 [ 1, %.preheader7.us.prol.preheader ], [ 0, %.preheader7.preheader.us ]
  br i1 %21, label %.preheader7._crit_edge.us, label %.preheader7.us.preheader

.preheader7.us.preheader:                         ; preds = %.preheader7.us.prol.loopexit.unr-lcssa
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %.preheader7.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.preheader7.us ], [ %indvars.iv53.unr.ph, %.preheader7.us.preheader ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %27 = mul nuw nsw i64 %indvars.iv.next54, %indvars.iv57
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %2
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %20
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv53
  store double %31, double* %32, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %33 = mul nuw nsw i64 %indvars.iv.next54.1, %indvars.iv57
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %2
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %20
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv.next54
  store double %37, double* %38, align 8
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, %wide.trip.count55
  br i1 %exitcond56.1, label %.preheader7._crit_edge.us.loopexit, label %.preheader7.us

.preheader7._crit_edge.us.loopexit:               ; preds = %.preheader7.us
  br label %.preheader7._crit_edge.us

.preheader7._crit_edge.us:                        ; preds = %.preheader7._crit_edge.us.loopexit, %.preheader7.us.prol.loopexit.unr-lcssa
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %.preheader6.preheader.loopexit, label %.preheader7.preheader.us

.preheader6.preheader.loopexit:                   ; preds = %.preheader7._crit_edge.us
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader6.preheader.loopexit, %8
  %39 = icmp sgt i32 %2, 0
  br i1 %39, label %.preheader.preheader.lr.ph, label %.preheader6._crit_edge

.preheader.preheader.lr.ph:                       ; preds = %.preheader6.preheader
  %40 = icmp sgt i32 %1, 0
  %41 = sitofp i32 %1 to double
  br i1 %40, label %.preheader.preheader.us.preheader, label %.preheader6._crit_edge

.preheader.preheader.us.preheader:                ; preds = %.preheader.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count50 = zext i32 %2 to i64
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next, %.preheader.us ]
  %42 = add nuw nsw i64 %indvars.iv, 2
  %43 = mul nuw nsw i64 %42, %indvars.iv48
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %1
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %41
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv48, i64 %indvars.iv
  store double %47, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader._crit_edge.us, label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %.preheader6._crit_edge.loopexit, label %.preheader.preheader.us

.preheader6._crit_edge.loopexit:                  ; preds = %.preheader._crit_edge.us
  br label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6._crit_edge.loopexit, %.preheader7.preheader.lr.ph, %.preheader.preheader.lr.ph, %.preheader6.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader5.preheader.lr.ph, label %._crit_edge

.preheader5.preheader.lr.ph:                      ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %.preheader5.preheader.us.preheader, label %.preheader5.preheader.preheader

.preheader5.preheader.preheader:                  ; preds = %.preheader5.preheader.lr.ph
  %wide.trip.count66 = zext i32 %0 to i64
  %12 = add nsw i64 %wide.trip.count66, -1
  %xtraiter120 = and i64 %wide.trip.count66, 7
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  br i1 %lcmp.mod121, label %.preheader5.preheader.prol.loopexit, label %.preheader5.preheader.prol.preheader

.preheader5.preheader.prol.preheader:             ; preds = %.preheader5.preheader.preheader
  br label %.preheader5.preheader.prol

.preheader5.preheader.prol:                       ; preds = %.preheader5.preheader.prol, %.preheader5.preheader.prol.preheader
  %indvars.iv64.prol = phi i64 [ %indvars.iv.next65.prol, %.preheader5.preheader.prol ], [ 0, %.preheader5.preheader.prol.preheader ]
  %prol.iter122 = phi i64 [ %prol.iter122.sub, %.preheader5.preheader.prol ], [ %xtraiter120, %.preheader5.preheader.prol.preheader ]
  %indvars.iv.next65.prol = add nuw nsw i64 %indvars.iv64.prol, 1
  %prol.iter122.sub = add i64 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i64 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %.preheader5.preheader.prol.loopexit.unr-lcssa, label %.preheader5.preheader.prol, !llvm.loop !1

.preheader5.preheader.prol.loopexit.unr-lcssa:    ; preds = %.preheader5.preheader.prol
  br label %.preheader5.preheader.prol.loopexit

.preheader5.preheader.prol.loopexit:              ; preds = %.preheader5.preheader.preheader, %.preheader5.preheader.prol.loopexit.unr-lcssa
  %indvars.iv64.unr = phi i64 [ 0, %.preheader5.preheader.preheader ], [ %indvars.iv.next65.prol, %.preheader5.preheader.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %12, 7
  br i1 %13, label %._crit_edge.loopexit119, label %.preheader5.preheader.preheader.new

.preheader5.preheader.preheader.new:              ; preds = %.preheader5.preheader.prol.loopexit
  br label %.preheader5.preheader

.preheader5.preheader.us.preheader:               ; preds = %.preheader5.preheader.lr.ph
  %14 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %14, 3
  %wide.trip.count51 = zext i32 %0 to i64
  %xtraiter43 = and i32 %1, 1
  %lcmp.mod44 = icmp eq i32 %xtraiter43, 0
  %16 = icmp eq i32 %14, 0
  %wide.trip.count48 = zext i32 %2 to i64
  %wide.trip.count42 = zext i32 %1 to i64
  %17 = add nsw i64 %wide.trip.count42, -2
  %18 = add nsw i64 %wide.trip.count42, -2
  %19 = add nsw i64 %wide.trip.count42, -4
  %broadcast.splatinsert85 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splatinsert114 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat115 = shufflevector <2 x double> %broadcast.splatinsert114, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.preheader.us

.preheader5.preheader.us:                         ; preds = %.preheader4._crit_edge.us, %.preheader5.preheader.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader5.preheader.us.preheader ], [ %indvars.iv.next50, %.preheader4._crit_edge.us ]
  %scevgep72 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 2
  br i1 %lcmp.mod, label %.preheader5.us.prol.loopexit, label %.preheader5.us.prol.preheader

.preheader5.us.prol.preheader:                    ; preds = %.preheader5.preheader.us
  br label %.preheader5.us.prol

.preheader5.us.prol:                              ; preds = %.preheader5.us.prol.preheader, %.preheader5.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader5.us.prol ], [ 0, %.preheader5.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader5.us.prol ], [ %xtraiter, %.preheader5.us.prol.preheader ]
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  store double %22, double* %20, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.us.prol.loopexit.loopexit, label %.preheader5.us.prol, !llvm.loop !3

.preheader5.us.prol.loopexit.loopexit:            ; preds = %.preheader5.us.prol
  br label %.preheader5.us.prol.loopexit

.preheader5.us.prol.loopexit:                     ; preds = %.preheader5.us.prol.loopexit.loopexit, %.preheader5.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader5.preheader.us ], [ %indvars.iv.next.prol, %.preheader5.us.prol.loopexit.loopexit ]
  br i1 %15, label %.preheader5..preheader4.preheader_crit_edge.us, label %.preheader5.us.preheader

.preheader5.us.preheader:                         ; preds = %.preheader5.us.prol.loopexit
  %23 = sub i64 %19, %indvars.iv.unr
  %24 = lshr i64 %23, 2
  %25 = add nuw nsw i64 %24, 1
  %min.iters.check94 = icmp ult i64 %25, 2
  br i1 %min.iters.check94, label %.preheader5.us.preheader118, label %min.iters.checked95

.preheader5.us.preheader118:                      ; preds = %middle.block92, %min.iters.checked95, %.preheader5.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked95 ], [ %indvars.iv.unr, %.preheader5.us.preheader ], [ %ind.end103, %middle.block92 ]
  br label %.preheader5.us

min.iters.checked95:                              ; preds = %.preheader5.us.preheader
  %n.mod.vf96 = and i64 %25, 1
  %n.vec97 = sub nsw i64 %25, %n.mod.vf96
  %cmp.zero98 = icmp eq i64 %n.vec97, 0
  %26 = add i64 %indvars.iv.unr, 4
  %27 = shl nuw i64 %24, 2
  %28 = add i64 %26, %27
  %29 = shl nuw nsw i64 %n.mod.vf96, 2
  %ind.end103 = sub i64 %28, %29
  br i1 %cmp.zero98, label %.preheader5.us.preheader118, label %vector.ph99

vector.ph99:                                      ; preds = %min.iters.checked95
  br label %vector.body91

vector.body91:                                    ; preds = %vector.body91, %vector.ph99
  %index100 = phi i64 [ 0, %vector.ph99 ], [ %index.next101, %vector.body91 ]
  %30 = shl i64 %index100, 2
  %31 = add i64 %indvars.iv.unr, %30
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %31
  %33 = bitcast double* %32 to <8 x double>*
  %wide.vec109 = load <8 x double>, <8 x double>* %33, align 8
  %strided.vec110 = shufflevector <8 x double> %wide.vec109, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec111 = shufflevector <8 x double> %wide.vec109, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec112 = shufflevector <8 x double> %wide.vec109, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec113 = shufflevector <8 x double> %wide.vec109, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %34 = fmul <2 x double> %strided.vec110, %broadcast.splat115
  %35 = fmul <2 x double> %strided.vec111, %broadcast.splat115
  %36 = fmul <2 x double> %strided.vec112, %broadcast.splat115
  %37 = add nsw i64 %31, 3
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %37
  %39 = fmul <2 x double> %strided.vec113, %broadcast.splat115
  %40 = getelementptr double, double* %38, i64 -3
  %41 = bitcast double* %40 to <8 x double>*
  %42 = shufflevector <2 x double> %34, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %43 = shufflevector <2 x double> %36, <2 x double> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec116 = shufflevector <4 x double> %42, <4 x double> %43, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec116, <8 x double>* %41, align 8
  %index.next101 = add i64 %index100, 2
  %44 = icmp eq i64 %index.next101, %n.vec97
  br i1 %44, label %middle.block92, label %vector.body91, !llvm.loop !4

middle.block92:                                   ; preds = %vector.body91
  %cmp.n104 = icmp eq i64 %n.mod.vf96, 0
  br i1 %cmp.n104, label %.preheader5..preheader4.preheader_crit_edge.us, label %.preheader5.us.preheader118

.preheader4._crit_edge.us.loopexit:               ; preds = %.preheader._crit_edge.us.us
  br label %.preheader4._crit_edge.us

.preheader4._crit_edge.us:                        ; preds = %.preheader4._crit_edge.us.loopexit, %.preheader5..preheader4.preheader_crit_edge.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %._crit_edge.loopexit, label %.preheader5.preheader.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader118, %.preheader5.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader5.us ], [ %indvars.iv.ph, %.preheader5.us.preheader118 ]
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %4
  store double %47, double* %45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %4
  store double %50, double* %48, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %4
  store double %53, double* %51, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv.next.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %4
  store double %56, double* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count42
  br i1 %exitcond.3, label %.preheader5..preheader4.preheader_crit_edge.us.loopexit, label %.preheader5.us, !llvm.loop !7

.preheader5..preheader4.preheader_crit_edge.us.loopexit: ; preds = %.preheader5.us
  br label %.preheader5..preheader4.preheader_crit_edge.us

.preheader5..preheader4.preheader_crit_edge.us:   ; preds = %.preheader5..preheader4.preheader_crit_edge.us.loopexit, %middle.block92, %.preheader5.us.prol.loopexit
  br i1 %11, label %.preheader.preheader.us.us.preheader, label %.preheader4._crit_edge.us

.preheader.preheader.us.us.preheader:             ; preds = %.preheader5..preheader4.preheader_crit_edge.us
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 0
  br label %.preheader.preheader.us.us

.preheader.preheader.us.us:                       ; preds = %.preheader.preheader.us.us.preheader, %.preheader._crit_edge.us.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %scevgep78 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 2
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv46
  br i1 %lcmp.mod44, label %.preheader.us.us.prol.loopexit.unr-lcssa, label %.preheader.us.us.prol.preheader

.preheader.us.us.prol.preheader:                  ; preds = %.preheader.preheader.us.us
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %3
  %61 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 0
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = load double, double* %57, align 8
  %65 = fadd double %64, %63
  store double %65, double* %57, align 8
  br label %.preheader.us.us.prol.loopexit.unr-lcssa

.preheader.us.us.prol.loopexit.unr-lcssa:         ; preds = %.preheader.preheader.us.us, %.preheader.us.us.prol.preheader
  %indvars.iv40.unr.ph = phi i64 [ 1, %.preheader.us.us.prol.preheader ], [ 0, %.preheader.preheader.us.us ]
  br i1 %16, label %.preheader._crit_edge.us.us, label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader.us.us.prol.loopexit.unr-lcssa
  %66 = sub nsw i64 %17, %indvars.iv40.unr.ph
  %67 = lshr i64 %66, 1
  %68 = add nuw i64 %67, 1
  %min.iters.check = icmp ult i64 %68, 2
  br i1 %min.iters.check, label %.preheader.us.us.preheader117, label %min.iters.checked

.preheader.us.us.preheader117:                    ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.us.preheader
  %indvars.iv40.ph = phi i64 [ %indvars.iv40.unr.ph, %vector.memcheck ], [ %indvars.iv40.unr.ph, %min.iters.checked ], [ %indvars.iv40.unr.ph, %.preheader.us.us.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us.us

min.iters.checked:                                ; preds = %.preheader.us.us.preheader
  %n.mod.vf = and i64 %68, 1
  %n.vec = sub i64 %68, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us.us.preheader117, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep70 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv40.unr.ph
  %69 = sub nsw i64 %18, %indvars.iv40.unr.ph
  %70 = and i64 %69, -2
  %71 = or i64 %indvars.iv40.unr.ph, %70
  %scevgep73 = getelementptr double, double* %scevgep72, i64 %71
  %scevgep76 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv40.unr.ph
  %scevgep79 = getelementptr double, double* %scevgep78, i64 %71
  %bound0 = icmp ult double* %scevgep70, %58
  %bound1 = icmp ult double* %58, %scevgep73
  %found.conflict = and i1 %bound0, %bound1
  %bound082 = icmp ult double* %scevgep70, %scevgep79
  %bound183 = icmp ult double* %scevgep76, %scevgep73
  %found.conflict84 = and i1 %bound082, %bound183
  %conflict.rdx = or i1 %found.conflict, %found.conflict84
  %72 = or i64 %indvars.iv40.unr.ph, 2
  %73 = shl nuw i64 %67, 1
  %74 = add i64 %72, %73
  %75 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %74, %75
  br i1 %conflict.rdx, label %.preheader.us.us.preheader117, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %76 = load double, double* %58, align 8, !alias.scope !9
  %77 = insertelement <2 x double> undef, double %76, i32 0
  %78 = fmul <2 x double> %77, %broadcast.splatinsert85
  %79 = shufflevector <2 x double> %78, <2 x double> undef, <2 x i32> zeroinitializer
  %80 = load double, double* %58, align 8, !alias.scope !9
  %81 = insertelement <2 x double> undef, double %80, i32 0
  %82 = fmul <2 x double> %81, %broadcast.splatinsert85
  %83 = shufflevector <2 x double> %82, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %84 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv40.unr.ph, %84
  %85 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %offset.idx
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !12
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec87 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fmul <2 x double> %79, %strided.vec
  %88 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %offset.idx
  %89 = bitcast double* %88 to <4 x double>*
  %wide.vec88 = load <4 x double>, <4 x double>* %89, align 8, !alias.scope !14, !noalias !16
  %strided.vec89 = shufflevector <4 x double> %wide.vec88, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec90 = shufflevector <4 x double> %wide.vec88, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %90 = fadd <2 x double> %strided.vec89, %87
  %91 = add nuw nsw i64 %offset.idx, 1
  %92 = fmul <2 x double> %83, %strided.vec87
  %93 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %91
  %94 = fadd <2 x double> %strided.vec90, %92
  %95 = getelementptr double, double* %93, i64 -1
  %96 = bitcast double* %95 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %94, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %96, align 8, !alias.scope !14, !noalias !16
  %index.next = add i64 %index, 2
  %97 = icmp eq i64 %index.next, %n.vec
  br i1 %97, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader._crit_edge.us.us, label %.preheader.us.us.preheader117

.preheader._crit_edge.us.us.loopexit:             ; preds = %.preheader.us.us
  br label %.preheader._crit_edge.us.us

.preheader._crit_edge.us.us:                      ; preds = %.preheader._crit_edge.us.us.loopexit, %middle.block, %.preheader.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond, label %.preheader4._crit_edge.us.loopexit, label %.preheader.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader117, %.preheader.us.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %.preheader.us.us ], [ %indvars.iv40.ph, %.preheader.us.us.preheader117 ]
  %98 = load double, double* %58, align 8
  %99 = fmul double %98, %3
  %100 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv40
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv40
  %104 = load double, double* %103, align 8
  %105 = fadd double %104, %102
  store double %105, double* %103, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %106 = load double, double* %58, align 8
  %107 = fmul double %106, %3
  %108 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv.next41
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv.next41
  %112 = load double, double* %111, align 8
  %113 = fadd double %112, %110
  store double %113, double* %111, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next41.1, %wide.trip.count42
  br i1 %exitcond.1, label %.preheader._crit_edge.us.us.loopexit, label %.preheader.us.us, !llvm.loop !18

.preheader5.preheader:                            ; preds = %.preheader5.preheader, %.preheader5.preheader.preheader.new
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr, %.preheader5.preheader.preheader.new ], [ %indvars.iv.next65.7, %.preheader5.preheader ]
  %indvars.iv.next65.7 = add nsw i64 %indvars.iv64, 8
  %exitcond67.7 = icmp eq i64 %indvars.iv.next65.7, %wide.trip.count66
  br i1 %exitcond67.7, label %._crit_edge.loopexit119.unr-lcssa, label %.preheader5.preheader

._crit_edge.loopexit:                             ; preds = %.preheader4._crit_edge.us
  br label %._crit_edge

._crit_edge.loopexit119.unr-lcssa:                ; preds = %.preheader5.preheader
  br label %._crit_edge.loopexit119

._crit_edge.loopexit119:                          ; preds = %.preheader5.preheader.prol.loopexit, %._crit_edge.loopexit119.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit119, %._crit_edge.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.preheader.us.preheader, label %._crit_edge

.preheader.preheader.us.preheader:                ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count13 = zext i32 %0 to i64
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next12, %.preheader._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv11, %10
  br label %12

; <label>:12:                                     ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next, %.preheader.us ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %.preheader.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %17, %12
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader._crit_edge.us, label %12

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond14, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!10, !13}
!17 = distinct !{!17, !5, !6}
!18 = distinct !{!18, !5, !6}
