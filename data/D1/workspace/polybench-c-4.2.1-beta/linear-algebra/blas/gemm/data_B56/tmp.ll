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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader9.lr.ph, label %.preheader8.thread

.preheader8.thread:                               ; preds = %8
  br label %.preheader6

.preheader9.lr.ph:                                ; preds = %8
  %wide.trip.count62 = zext i32 %1 to i64
  %10 = icmp sgt i32 %1, 0
  %11 = sext i32 %0 to i64
  %12 = sitofp i32 %0 to double
  br i1 %10, label %.preheader9.us.preheader, label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge20.us, %.preheader9.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next65, %._crit_edge20.us ]
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %._crit_edge23.us, %.preheader9.us
  %indvars.iv60 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next61, %._crit_edge23.us ]
  %13 = mul nsw i64 %indvars.iv64, %indvars.iv60
  %14 = add nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %12
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv60
  store double %18, double* %19, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %._crit_edge20.us, label %._crit_edge23.us

._crit_edge20.us:                                 ; preds = %._crit_edge23.us
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %20 = icmp slt i64 %indvars.iv.next65, %11
  br i1 %20, label %.preheader9.us, label %.preheader8.loopexit

.preheader8.loopexit:                             ; preds = %._crit_edge20.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9.lr.ph
  br i1 true, label %.preheader7.lr.ph, label %.preheader8..preheader6_crit_edge

.preheader8..preheader6_crit_edge:                ; preds = %.preheader8
  br label %.preheader6

.preheader7.lr.ph:                                ; preds = %.preheader8
  %wide.trip.count54 = zext i32 %2 to i64
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader7.us.preheader, label %..preheader6_crit_edge.loopexit43

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %22 = sitofp i32 %2 to double
  %xtraiter = and i64 %wide.trip.count54, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = icmp eq i32 %2, 1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge16.us, %.preheader7.us.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next57, %._crit_edge16.us ]
  br i1 %lcmp.mod, label %._crit_edge24.us.prol.loopexit.unr-lcssa, label %._crit_edge24.us.prol.preheader

._crit_edge24.us.prol.preheader:                  ; preds = %.preheader7.us
  br label %._crit_edge24.us.prol

._crit_edge24.us.prol:                            ; preds = %._crit_edge24.us.prol.preheader
  %24 = trunc i64 %indvars.iv56 to i32
  %25 = srem i32 %24, %2
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %22
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv56, i64 0
  store double %27, double* %28, align 8
  br label %._crit_edge24.us.prol.loopexit.unr-lcssa

._crit_edge24.us.prol.loopexit.unr-lcssa:         ; preds = %.preheader7.us, %._crit_edge24.us.prol
  %indvars.iv52.unr.ph = phi i64 [ 1, %._crit_edge24.us.prol ], [ 0, %.preheader7.us ]
  br label %._crit_edge24.us.prol.loopexit

._crit_edge24.us.prol.loopexit:                   ; preds = %._crit_edge24.us.prol.loopexit.unr-lcssa
  br i1 %23, label %._crit_edge16.us, label %.preheader7.us.new

.preheader7.us.new:                               ; preds = %._crit_edge24.us.prol.loopexit
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us, %.preheader7.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph, %.preheader7.us.new ], [ %indvars.iv.next53.1, %._crit_edge24.us ]
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %29 = mul nsw i64 %indvars.iv56, %indvars.iv.next53
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %2
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %22
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv52
  store double %33, double* %34, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %35 = mul nsw i64 %indvars.iv56, %indvars.iv.next53.1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %2
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %22
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv.next53
  store double %39, double* %40, align 8
  %exitcond55.1 = icmp eq i64 %indvars.iv.next53.1, %wide.trip.count54
  br i1 %exitcond55.1, label %._crit_edge16.us.unr-lcssa, label %._crit_edge24.us

._crit_edge16.us.unr-lcssa:                       ; preds = %._crit_edge24.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge24.us.prol.loopexit, %._crit_edge16.us.unr-lcssa
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  %41 = icmp slt i64 %indvars.iv.next57, %11
  br i1 %41, label %.preheader7.us, label %..preheader6_crit_edge.loopexit

..preheader6_crit_edge.loopexit:                  ; preds = %._crit_edge16.us
  br label %..preheader6_crit_edge

..preheader6_crit_edge.loopexit43:                ; preds = %.preheader7.lr.ph
  br label %..preheader6_crit_edge

..preheader6_crit_edge:                           ; preds = %..preheader6_crit_edge.loopexit43, %..preheader6_crit_edge.loopexit
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader8..preheader6_crit_edge, %.preheader8.thread, %..preheader6_crit_edge
  %42 = icmp sgt i32 %2, 0
  br i1 %42, label %.preheader.lr.ph, label %.preheader6._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader6
  %wide.trip.count = zext i32 %1 to i64
  %43 = icmp sgt i32 %1, 0
  %44 = sext i32 %2 to i64
  br i1 %43, label %.preheader.us.preheader, label %._crit_edge13.loopexit42

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %45 = sitofp i32 %1 to double
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us ]
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge25.us ]
  %46 = add nuw nsw i64 %indvars.iv, 2
  %47 = mul nsw i64 %indvars.iv50, %46
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, %1
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %45
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv50, i64 %indvars.iv
  store double %51, double* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge25.us

._crit_edge.us:                                   ; preds = %._crit_edge25.us
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, 1
  %53 = icmp slt i64 %indvars.iv.next51, %44
  br i1 %53, label %.preheader.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13.loopexit42:                         ; preds = %.preheader.lr.ph
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit42, %._crit_edge13.loopexit
  br label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6, %._crit_edge13
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader5.lr.ph, label %._crit_edge11

.preheader5.lr.ph:                                ; preds = %8
  %wide.trip.count.3 = zext i32 %1 to i64
  %10 = icmp sgt i32 %1, 0
  %wide.trip.count47 = zext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  br i1 %10, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %xtraiter154 = and i64 %12, 1
  %lcmp.mod = icmp eq i64 %xtraiter154, 0
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol.preheader
  br i1 false, label %.preheader5..preheader.us_crit_edge.prol, label %.preheader4._crit_edge.prol

.preheader5..preheader.us_crit_edge.prol:         ; preds = %.preheader5.prol
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader5..preheader.us_crit_edge.prol
  br i1 undef, label %._crit_edge13.us.preheader.prol, label %min.iters.checked.prol

min.iters.checked.prol:                           ; preds = %.preheader.us.prol
  br i1 undef, label %._crit_edge13.us.preheader.prol, label %vector.memcheck.prol

vector.memcheck.prol:                             ; preds = %min.iters.checked.prol
  br i1 undef, label %._crit_edge13.us.preheader.prol, label %vector.ph.prol

vector.ph.prol:                                   ; preds = %vector.memcheck.prol
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.ph.prol
  br i1 undef, label %._crit_edge.us.prol, label %._crit_edge13.us.preheader.prol

._crit_edge13.us.preheader.prol:                  ; preds = %vector.body.prol, %vector.memcheck.prol, %min.iters.checked.prol, %.preheader.us.prol
  br label %._crit_edge13.us.prol

._crit_edge13.us.prol:                            ; preds = %._crit_edge13.us.preheader.prol
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge13.us.prol, %vector.body.prol
  br label %.preheader4._crit_edge.prol

.preheader4._crit_edge.prol:                      ; preds = %._crit_edge.us.prol, %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader4._crit_edge.prol
  %indvars.iv57.unr = phi i64 [ 0, %.preheader5.preheader ], [ 1, %.preheader4._crit_edge.prol ]
  %13 = icmp eq i32 %0, 1
  br i1 %13, label %._crit_edge10.loopexit153, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %14 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %15 = icmp sgt i64 %11, 1
  %smax87 = select i1 %15, i64 %11, i64 1
  %16 = add nsw i64 %wide.trip.count.3, -4
  %17 = icmp eq i32 %xtraiter, 0
  %18 = icmp ult i32 %14, 3
  %19 = icmp sgt i32 %2, 0
  %min.iters.check88 = icmp ult i64 %smax87, 4
  %n.vec91 = and i64 %smax87, 9223372036854775804
  %cmp.zero92 = icmp eq i64 %n.vec91, 0
  %broadcast.splatinsert125 = insertelement <2 x double> undef, double %3, i32 0
  %cmp.n120 = icmp eq i64 %smax87, %n.vec91
  %broadcast.splatinsert150 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat151 = shufflevector <2 x double> %broadcast.splatinsert150, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us, %.preheader5.us.preheader
  %indvar94 = phi i64 [ %indvar.next95, %._crit_edge9.us ], [ 0, %.preheader5.us.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge9.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep96 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar94, i64 0
  %scevgep99 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar94, i64 %smax87
  br i1 %17, label %._crit_edge12.us.prol.loopexit, label %._crit_edge12.us.prol.preheader

._crit_edge12.us.prol.preheader:                  ; preds = %.preheader5.us
  br label %._crit_edge12.us.prol

._crit_edge12.us.prol:                            ; preds = %._crit_edge12.us.prol.preheader, %._crit_edge12.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge12.us.prol ], [ 0, %._crit_edge12.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge12.us.prol ], [ %xtraiter, %._crit_edge12.us.prol.preheader ]
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  store double %22, double* %20, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge12.us.prol.loopexit.loopexit, label %._crit_edge12.us.prol, !llvm.loop !1

._crit_edge12.us.prol.loopexit.loopexit:          ; preds = %._crit_edge12.us.prol
  br label %._crit_edge12.us.prol.loopexit

._crit_edge12.us.prol.loopexit:                   ; preds = %._crit_edge12.us.prol.loopexit.loopexit, %.preheader5.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next.prol, %._crit_edge12.us.prol.loopexit.loopexit ]
  br i1 %18, label %..preheader4_crit_edge.us, label %._crit_edge12.us.preheader

._crit_edge12.us.preheader:                       ; preds = %._crit_edge12.us.prol.loopexit
  %23 = sub i64 %16, %indvars.iv.unr
  %24 = lshr i64 %23, 2
  %25 = add nuw nsw i64 %24, 1
  %min.iters.check134 = icmp ult i64 %25, 2
  br i1 %min.iters.check134, label %._crit_edge12.us.preheader152, label %min.iters.checked135

._crit_edge12.us.preheader152:                    ; preds = %middle.block132, %min.iters.checked135, %._crit_edge12.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked135 ], [ %indvars.iv.unr, %._crit_edge12.us.preheader ], [ %ind.end, %middle.block132 ]
  br label %._crit_edge12.us

min.iters.checked135:                             ; preds = %._crit_edge12.us.preheader
  %n.mod.vf136 = and i64 %25, 1
  %n.vec137 = sub nsw i64 %25, %n.mod.vf136
  %cmp.zero138 = icmp eq i64 %n.vec137, 0
  %26 = add i64 %indvars.iv.unr, 4
  %27 = shl nuw i64 %24, 2
  %28 = add i64 %26, %27
  %29 = shl nuw nsw i64 %n.mod.vf136, 2
  %ind.end = sub i64 %28, %29
  br i1 %cmp.zero138, label %._crit_edge12.us.preheader152, label %vector.ph139

vector.ph139:                                     ; preds = %min.iters.checked135
  br label %vector.body131

vector.body131:                                   ; preds = %vector.body131, %vector.ph139
  %index140 = phi i64 [ 0, %vector.ph139 ], [ %index.next141, %vector.body131 ]
  %30 = shl i64 %index140, 2
  %31 = add i64 %indvars.iv.unr, %30
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %31
  %33 = bitcast double* %32 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %33, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec147 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec148 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec149 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %34 = fmul <2 x double> %broadcast.splat151, %strided.vec
  %35 = fmul <2 x double> %broadcast.splat151, %strided.vec147
  %36 = fmul <2 x double> %broadcast.splat151, %strided.vec148
  %37 = add nsw i64 %31, 3
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %37
  %39 = fmul <2 x double> %broadcast.splat151, %strided.vec149
  %40 = getelementptr double, double* %38, i64 -3
  %41 = bitcast double* %40 to <8 x double>*
  %42 = shufflevector <2 x double> %34, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %43 = shufflevector <2 x double> %36, <2 x double> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %42, <4 x double> %43, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %41, align 8
  %index.next141 = add i64 %index140, 2
  %44 = icmp eq i64 %index.next141, %n.vec137
  br i1 %44, label %middle.block132, label %vector.body131, !llvm.loop !3

middle.block132:                                  ; preds = %vector.body131
  %cmp.n143 = icmp eq i64 %n.mod.vf136, 0
  br i1 %cmp.n143, label %..preheader4_crit_edge.us, label %._crit_edge12.us.preheader152

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %..preheader4_crit_edge.us
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %45 = icmp slt i64 %indvars.iv.next49, %12
  %indvar.next95 = add i64 %indvar94, 1
  br i1 %45, label %.preheader5.us, label %._crit_edge10.loopexit

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.preheader152, %._crit_edge12.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge12.us ], [ %indvars.iv.ph, %._crit_edge12.us.preheader152 ]
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %4
  store double %48, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %4
  store double %51, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %4
  store double %54, double* %52, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv.next.2
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %4
  store double %57, double* %55, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %..preheader4_crit_edge.us.loopexit, label %._crit_edge12.us, !llvm.loop !6

..preheader4_crit_edge.us.loopexit:               ; preds = %._crit_edge12.us
  br label %..preheader4_crit_edge.us

..preheader4_crit_edge.us:                        ; preds = %..preheader4_crit_edge.us.loopexit, %middle.block132, %._crit_edge12.us.prol.loopexit
  br i1 %19, label %.preheader.us.us.preheader, label %._crit_edge9.us

.preheader.us.us.preheader:                       ; preds = %..preheader4_crit_edge.us
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep101 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv45, i64 0
  %scevgep103 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv45, i64 %smax87
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv48, i64 %indvars.iv45
  br i1 %min.iters.check88, label %._crit_edge13.us.us.preheader, label %min.iters.checked89

._crit_edge13.us.us.preheader:                    ; preds = %middle.block85, %vector.memcheck115, %min.iters.checked89, %.preheader.us.us
  %indvars.iv43.ph = phi i64 [ 0, %vector.memcheck115 ], [ 0, %min.iters.checked89 ], [ 0, %.preheader.us.us ], [ %n.vec91, %middle.block85 ]
  br label %._crit_edge13.us.us

min.iters.checked89:                              ; preds = %.preheader.us.us
  br i1 %cmp.zero92, label %._crit_edge13.us.us.preheader, label %vector.memcheck115

vector.memcheck115:                               ; preds = %min.iters.checked89
  %bound0107 = icmp ult double* %scevgep96, %58
  %bound1108 = icmp ult double* %58, %scevgep99
  %found.conflict109 = and i1 %bound0107, %bound1108
  %bound0110 = icmp ult double* %scevgep96, %scevgep103
  %bound1111 = icmp ult double* %scevgep101, %scevgep99
  %found.conflict112 = and i1 %bound0110, %bound1111
  %conflict.rdx113 = or i1 %found.conflict109, %found.conflict112
  br i1 %conflict.rdx113, label %._crit_edge13.us.us.preheader, label %vector.ph116

vector.ph116:                                     ; preds = %vector.memcheck115
  br label %vector.body84

vector.body84:                                    ; preds = %vector.body84, %vector.ph116
  %index117 = phi i64 [ 0, %vector.ph116 ], [ %index.next118, %vector.body84 ]
  %59 = load double, double* %58, align 8, !alias.scope !8
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = fmul <2 x double> %broadcast.splatinsert125, %60
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv45, i64 %index117
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !11
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !11
  %67 = fmul <2 x double> %62, %wide.load127
  %68 = fmul <2 x double> %62, %wide.load128
  %69 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %index117
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !13, !noalias !15
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !13, !noalias !15
  %73 = fadd <2 x double> %67, %wide.load129
  %74 = fadd <2 x double> %68, %wide.load130
  store <2 x double> %73, <2 x double>* %70, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %74, <2 x double>* %72, align 8, !alias.scope !13, !noalias !15
  %index.next118 = add i64 %index117, 4
  %75 = icmp eq i64 %index.next118, %n.vec91
  br i1 %75, label %middle.block85, label %vector.body84, !llvm.loop !16

middle.block85:                                   ; preds = %vector.body84
  br i1 %cmp.n120, label %._crit_edge.us.us, label %._crit_edge13.us.us.preheader

._crit_edge.us.us.loopexit:                       ; preds = %._crit_edge13.us.us
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block85
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.preheader, %._crit_edge13.us.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge13.us.us ], [ %indvars.iv43.ph, %._crit_edge13.us.us.preheader ]
  %76 = load double, double* %58, align 8
  %77 = fmul double %76, %3
  %78 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv45, i64 %indvars.iv43
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv43
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  store double %83, double* %81, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %84 = icmp slt i64 %indvars.iv.next44, %11
  br i1 %84, label %._crit_edge13.us.us, label %._crit_edge.us.us.loopexit, !llvm.loop !17

.preheader5:                                      ; preds = %.preheader4._crit_edge.1, %.preheader5.preheader.new
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr, %.preheader5.preheader.new ], [ %indvars.iv.next58.1, %.preheader4._crit_edge.1 ]
  br i1 false, label %.preheader5..preheader.us_crit_edge, label %.preheader4._crit_edge

.preheader5..preheader.us_crit_edge:              ; preds = %.preheader5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader5..preheader.us_crit_edge
  br i1 undef, label %._crit_edge13.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 undef, label %._crit_edge13.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %._crit_edge13.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  br i1 undef, label %._crit_edge.us, label %._crit_edge13.us.preheader

._crit_edge13.us.preheader:                       ; preds = %vector.body, %vector.memcheck, %min.iters.checked, %.preheader.us
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge13.us, %vector.body
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %._crit_edge.us, %.preheader5
  br i1 false, label %.preheader5..preheader.us_crit_edge.1, label %.preheader4._crit_edge.1

._crit_edge10.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge10

._crit_edge10.loopexit153.unr-lcssa:              ; preds = %.preheader4._crit_edge.1
  br label %._crit_edge10.loopexit153

._crit_edge10.loopexit153:                        ; preds = %.preheader5.prol.loopexit, %._crit_edge10.loopexit153.unr-lcssa
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit153, %._crit_edge10.loopexit
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %8, %._crit_edge10
  ret void

.preheader5..preheader.us_crit_edge.1:            ; preds = %.preheader4._crit_edge
  br label %.preheader.us.1

.preheader.us.1:                                  ; preds = %.preheader5..preheader.us_crit_edge.1
  br i1 undef, label %._crit_edge13.us.preheader.1, label %min.iters.checked.1

min.iters.checked.1:                              ; preds = %.preheader.us.1
  br i1 undef, label %._crit_edge13.us.preheader.1, label %vector.memcheck.1

vector.memcheck.1:                                ; preds = %min.iters.checked.1
  br i1 undef, label %._crit_edge13.us.preheader.1, label %vector.ph.1

vector.ph.1:                                      ; preds = %vector.memcheck.1
  br label %vector.body.1

vector.body.1:                                    ; preds = %vector.ph.1
  br i1 undef, label %._crit_edge.us.1, label %._crit_edge13.us.preheader.1

._crit_edge13.us.preheader.1:                     ; preds = %vector.body.1, %vector.memcheck.1, %min.iters.checked.1, %.preheader.us.1
  br label %._crit_edge13.us.1

._crit_edge13.us.1:                               ; preds = %._crit_edge13.us.preheader.1
  br label %._crit_edge.us.1

._crit_edge.us.1:                                 ; preds = %._crit_edge13.us.1, %vector.body.1
  br label %.preheader4._crit_edge.1

.preheader4._crit_edge.1:                         ; preds = %._crit_edge.us.1, %.preheader4._crit_edge
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %85 = icmp slt i64 %indvars.iv.next58.1, %12
  br i1 %85, label %.preheader5, label %._crit_edge10.loopexit153.unr-lcssa
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %._crit_edge5

.preheader.lr.ph:                                 ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge4.loopexit11

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge3.us ]
  %11 = mul nsw i64 %10, %indvars.iv13
  br label %._crit_edge._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us

; <label>:16:                                     ; preds = %._crit_edge._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge._crit_edge.us, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge._crit_edge.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %22 = icmp slt i64 %indvars.iv.next14, %10
  br i1 %22, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge4

._crit_edge4.loopexit11:                          ; preds = %.preheader.lr.ph
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit11, %._crit_edge4.loopexit
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %3, %._crit_edge4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
