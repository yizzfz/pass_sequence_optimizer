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
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %13)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to [1100 x double]*
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %2, %18
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double*, double*, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #0 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader9.lr.ph, label %.preheader8.thread

.preheader8.thread:                               ; preds = %8
  br label %.preheader6

.preheader9.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader9.us.preheader, label %.preheader7.lr.ph

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %12 = sext i32 %0 to i64
  %wide.trip.count58 = zext i32 %1 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge30.us
  %indvars.iv60 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next61, %._crit_edge30.us ]
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader9.us
  %indvars.iv56 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next57, %13 ]
  %14 = mul nsw i64 %indvars.iv60, %indvars.iv56
  %15 = add nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %11
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv60, i64 %indvars.iv56
  store double %19, double* %20, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond59, label %._crit_edge30.us, label %13

._crit_edge30.us:                                 ; preds = %13
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %21 = icmp slt i64 %indvars.iv.next61, %12
  br i1 %21, label %.preheader9.us, label %.preheader7.lr.ph.loopexit

.preheader7.lr.ph.loopexit:                       ; preds = %._crit_edge30.us
  br label %.preheader7.lr.ph

.preheader7.lr.ph:                                ; preds = %.preheader7.lr.ph.loopexit, %.preheader9.lr.ph
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %.preheader7.us.preheader, label %..preheader6_crit_edge.loopexit39

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %23 = sext i32 %0 to i64
  %24 = sitofp i32 %2 to double
  %wide.trip.count50 = zext i32 %2 to i64
  %xtraiter = and i64 %wide.trip.count50, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %25 = icmp eq i32 %2, 1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge20.us
  %indvars.iv52 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next53, %._crit_edge20.us ]
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader7.us
  br label %26

; <label>:26:                                     ; preds = %.prol.preheader
  %27 = trunc i64 %indvars.iv52 to i32
  %28 = srem i32 %27, %2
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %24
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv52, i64 0
  store double %30, double* %31, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader7.us, %26
  %indvars.iv48.unr.ph = phi i64 [ 1, %26 ], [ 0, %.preheader7.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %25, label %._crit_edge20.us, label %.preheader7.us.new

.preheader7.us.new:                               ; preds = %.prol.loopexit
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader7.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %.preheader7.us.new ], [ %indvars.iv.next49.1, %32 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %33 = mul nsw i64 %indvars.iv52, %indvars.iv.next49
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %2
  %36 = sitofp i32 %35 to double
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %38 = mul nsw i64 %indvars.iv52, %indvars.iv.next49.1
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %2
  %41 = sitofp i32 %40 to double
  %42 = insertelement <2 x double> undef, double %24, i32 0
  %43 = insertelement <2 x double> %42, double %24, i32 1
  %44 = insertelement <2 x double> undef, double %36, i32 0
  %45 = insertelement <2 x double> %44, double %41, i32 1
  %46 = fdiv <2 x double> %45, %43
  %47 = bitcast double* %37 to <2 x double>*
  store <2 x double> %46, <2 x double>* %47, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50
  br i1 %exitcond51.1, label %._crit_edge20.us.unr-lcssa, label %32

._crit_edge20.us.unr-lcssa:                       ; preds = %32
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %.prol.loopexit, %._crit_edge20.us.unr-lcssa
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %48 = icmp slt i64 %indvars.iv.next53, %23
  br i1 %48, label %.preheader7.us, label %..preheader6_crit_edge.loopexit

..preheader6_crit_edge.loopexit:                  ; preds = %._crit_edge20.us
  br label %..preheader6_crit_edge

..preheader6_crit_edge.loopexit39:                ; preds = %.preheader7.lr.ph
  br label %..preheader6_crit_edge

..preheader6_crit_edge:                           ; preds = %..preheader6_crit_edge.loopexit39, %..preheader6_crit_edge.loopexit
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader8.thread, %..preheader6_crit_edge
  %49 = icmp sgt i32 %2, 0
  br i1 %49, label %.preheader.lr.ph, label %62

.preheader.lr.ph:                                 ; preds = %.preheader6
  %50 = icmp sgt i32 %1, 0
  br i1 %50, label %.preheader.us.preheader, label %._crit_edge14.loopexit38

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %51 = sext i32 %2 to i64
  %52 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv46 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge.us ]
  br label %53

; <label>:53:                                     ; preds = %53, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %53 ]
  %54 = add nuw nsw i64 %indvars.iv, 2
  %55 = mul nsw i64 %indvars.iv46, %54
  %56 = trunc i64 %55 to i32
  %57 = srem i32 %56, %1
  %58 = sitofp i32 %57 to double
  %59 = fdiv double %58, %52
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv
  store double %59, double* %60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %53

._crit_edge.us:                                   ; preds = %53
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %61 = icmp slt i64 %indvars.iv.next47, %51
  br i1 %61, label %.preheader.us, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14.loopexit38:                         ; preds = %.preheader.lr.ph
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit38, %._crit_edge14.loopexit
  br label %62

; <label>:62:                                     ; preds = %._crit_edge14, %.preheader6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #0 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader5.lr.ph, label %84

.preheader5.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %11 = sext i32 %0 to i64
  %12 = add nsw i64 %11, -1
  %xtraiter147 = and i64 %11, 7
  %lcmp.mod = icmp eq i64 %xtraiter147, 0
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %._crit_edge11.prol, %.preheader5.prol.preheader
  %indvars.iv51.prol = phi i64 [ 0, %.preheader5.prol.preheader ], [ %indvars.iv.next52.prol, %._crit_edge11.prol ]
  %prol.iter148 = phi i64 [ %xtraiter147, %.preheader5.prol.preheader ], [ %prol.iter148.sub, %._crit_edge11.prol ]
  br label %._crit_edge11.prol

._crit_edge11.prol:                               ; preds = %.preheader5.prol
  %indvars.iv.next52.prol = add nsw i64 %indvars.iv51.prol, 1
  %prol.iter148.sub = add i64 %prol.iter148, -1
  %prol.iter148.cmp = icmp eq i64 %prol.iter148.sub, 0
  br i1 %prol.iter148.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge11.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv51.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next52.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %12, 7
  br i1 %13, label %._crit_edge16.loopexit146, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %14 = add i32 %1, -1
  %15 = sext i32 %1 to i64
  %16 = sext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %wide.trip.count41 = zext i32 %2 to i64
  %wide.trip.count.3 = zext i32 %1 to i64
  %17 = icmp sgt i64 %15, 1
  %smax80 = select i1 %17, i64 %15, i64 1
  %18 = add nsw i64 %wide.trip.count.3, -4
  %19 = icmp eq i32 %xtraiter, 0
  %20 = icmp ult i32 %14, 3
  %21 = icmp sgt i32 %2, 0
  %min.iters.check81 = icmp ult i64 %smax80, 4
  %n.vec84 = and i64 %smax80, 9223372036854775804
  %cmp.zero85 = icmp eq i64 %n.vec84, 0
  %broadcast.splatinsert118 = insertelement <2 x double> undef, double %3, i32 0
  %cmp.n113 = icmp eq i64 %smax80, %n.vec84
  %22 = insertelement <2 x double> undef, double %4, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert143 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat144 = shufflevector <2 x double> %broadcast.splatinsert143, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge11.us
  %indvar87 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvar.next88, %._crit_edge11.us ]
  %indvars.iv42 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next43, %._crit_edge11.us ]
  %scevgep89 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar87, i64 0
  %scevgep92 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar87, i64 %smax80
  br i1 %19, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader5.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %4
  store double %26, double* %24, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader5.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %20, label %..preheader4_crit_edge.us, label %.preheader5.us.new.preheader

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit
  %27 = sub i64 %18, %indvars.iv.unr
  %28 = lshr i64 %27, 2
  %29 = add nuw nsw i64 %28, 1
  %min.iters.check127 = icmp ult i64 %29, 2
  br i1 %min.iters.check127, label %.preheader5.us.new.preheader145, label %min.iters.checked128

.preheader5.us.new.preheader145:                  ; preds = %middle.block125, %min.iters.checked128, %.preheader5.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked128 ], [ %indvars.iv.unr, %.preheader5.us.new.preheader ], [ %ind.end, %middle.block125 ]
  br label %.preheader5.us.new

min.iters.checked128:                             ; preds = %.preheader5.us.new.preheader
  %n.mod.vf129 = and i64 %29, 1
  %n.vec130 = sub nsw i64 %29, %n.mod.vf129
  %cmp.zero131 = icmp eq i64 %n.vec130, 0
  %30 = add i64 %indvars.iv.unr, 4
  %31 = shl nuw i64 %28, 2
  %32 = add i64 %30, %31
  %33 = shl nuw nsw i64 %n.mod.vf129, 2
  %ind.end = sub i64 %32, %33
  br i1 %cmp.zero131, label %.preheader5.us.new.preheader145, label %vector.ph132

vector.ph132:                                     ; preds = %min.iters.checked128
  br label %vector.body124

vector.body124:                                   ; preds = %vector.body124, %vector.ph132
  %index133 = phi i64 [ 0, %vector.ph132 ], [ %index.next134, %vector.body124 ]
  %34 = shl i64 %index133, 2
  %35 = add i64 %indvars.iv.unr, %34
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv42, i64 %35
  %37 = bitcast double* %36 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %37, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec140 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec141 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec142 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %38 = fmul <2 x double> %broadcast.splat144, %strided.vec
  %39 = fmul <2 x double> %broadcast.splat144, %strided.vec140
  %40 = fmul <2 x double> %broadcast.splat144, %strided.vec141
  %41 = add nsw i64 %35, 3
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv42, i64 %41
  %43 = fmul <2 x double> %broadcast.splat144, %strided.vec142
  %44 = getelementptr double, double* %42, i64 -3
  %45 = bitcast double* %44 to <8 x double>*
  %46 = shufflevector <2 x double> %38, <2 x double> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %47 = shufflevector <2 x double> %40, <2 x double> %43, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %46, <4 x double> %47, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %45, align 8
  %index.next134 = add i64 %index133, 2
  %48 = icmp eq i64 %index.next134, %n.vec130
  br i1 %48, label %middle.block125, label %vector.body124, !llvm.loop !4

middle.block125:                                  ; preds = %vector.body124
  %cmp.n136 = icmp eq i64 %n.mod.vf129, 0
  br i1 %cmp.n136, label %..preheader4_crit_edge.us, label %.preheader5.us.new.preheader145

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %..preheader4_crit_edge.us
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, 1
  %49 = icmp slt i64 %indvars.iv.next43, %16
  %indvar.next88 = add i64 %indvar87, 1
  br i1 %49, label %.preheader5.us, label %._crit_edge16.loopexit

.preheader5.us.new:                               ; preds = %.preheader5.us.new.preheader145, %.preheader5.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader5.us.new ], [ %indvars.iv.ph, %.preheader5.us.new.preheader145 ]
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv
  %51 = bitcast double* %50 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %51, align 8
  %53 = fmul <2 x double> %23, %52
  store <2 x double> %53, <2 x double>* %51, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next.1
  %55 = bitcast double* %54 to <2 x double>*
  %56 = load <2 x double>, <2 x double>* %55, align 8
  %57 = fmul <2 x double> %23, %56
  store <2 x double> %57, <2 x double>* %55, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %..preheader4_crit_edge.us.loopexit, label %.preheader5.us.new, !llvm.loop !7

..preheader4_crit_edge.us.loopexit:               ; preds = %.preheader5.us.new
  br label %..preheader4_crit_edge.us

..preheader4_crit_edge.us:                        ; preds = %..preheader4_crit_edge.us.loopexit, %middle.block125, %.prol.loopexit
  br i1 %21, label %.preheader.us.us.preheader, label %._crit_edge11.us

.preheader.us.us.preheader:                       ; preds = %..preheader4_crit_edge.us
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep94 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv39, i64 0
  %scevgep96 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv39, i64 %smax80
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv39
  br i1 %min.iters.check81, label %scalar.ph79.preheader, label %min.iters.checked82

scalar.ph79.preheader:                            ; preds = %middle.block78, %vector.memcheck108, %min.iters.checked82, %.preheader.us.us
  %indvars.iv37.ph = phi i64 [ 0, %vector.memcheck108 ], [ 0, %min.iters.checked82 ], [ 0, %.preheader.us.us ], [ %n.vec84, %middle.block78 ]
  br label %scalar.ph79

min.iters.checked82:                              ; preds = %.preheader.us.us
  br i1 %cmp.zero85, label %scalar.ph79.preheader, label %vector.memcheck108

vector.memcheck108:                               ; preds = %min.iters.checked82
  %bound0100 = icmp ult double* %scevgep89, %58
  %bound1101 = icmp ult double* %58, %scevgep92
  %found.conflict102 = and i1 %bound0100, %bound1101
  %bound0103 = icmp ult double* %scevgep89, %scevgep96
  %bound1104 = icmp ult double* %scevgep94, %scevgep92
  %found.conflict105 = and i1 %bound0103, %bound1104
  %conflict.rdx106 = or i1 %found.conflict102, %found.conflict105
  br i1 %conflict.rdx106, label %scalar.ph79.preheader, label %vector.ph109

vector.ph109:                                     ; preds = %vector.memcheck108
  %.pre = load double, double* %58, align 8, !alias.scope !9
  %59 = insertelement <2 x double> undef, double %.pre, i32 0
  %60 = fmul <2 x double> %broadcast.splatinsert118, %59
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77, %vector.ph109
  %index110 = phi i64 [ 0, %vector.ph109 ], [ %index.next111, %vector.body77 ]
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv39, i64 %index110
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !12
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !12
  %66 = fmul <2 x double> %61, %wide.load120
  %67 = fmul <2 x double> %61, %wide.load121
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv42, i64 %index110
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !14, !noalias !16
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !14, !noalias !16
  %72 = fadd <2 x double> %66, %wide.load122
  %73 = fadd <2 x double> %67, %wide.load123
  store <2 x double> %72, <2 x double>* %69, align 8, !alias.scope !14, !noalias !16
  store <2 x double> %73, <2 x double>* %71, align 8, !alias.scope !14, !noalias !16
  %index.next111 = add i64 %index110, 4
  %74 = icmp eq i64 %index.next111, %n.vec84
  br i1 %74, label %middle.block78, label %vector.body77, !llvm.loop !17

middle.block78:                                   ; preds = %vector.body77
  br i1 %cmp.n113, label %._crit_edge.us.us, label %scalar.ph79.preheader

._crit_edge.us.us.loopexit:                       ; preds = %scalar.ph79
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block78
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond, label %._crit_edge11.us.loopexit, label %.preheader.us.us

scalar.ph79:                                      ; preds = %scalar.ph79.preheader, %scalar.ph79
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %scalar.ph79 ], [ %indvars.iv37.ph, %scalar.ph79.preheader ]
  %75 = load double, double* %58, align 8
  %76 = fmul double %75, %3
  %77 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv39, i64 %indvars.iv37
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv37
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  store double %82, double* %80, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %83 = icmp slt i64 %indvars.iv.next38, %15
  br i1 %83, label %scalar.ph79, label %._crit_edge.us.us.loopexit, !llvm.loop !18

.preheader5:                                      ; preds = %._crit_edge11.7, %.preheader5.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.preheader5.preheader.new ], [ %indvars.iv.next52.7, %._crit_edge11.7 ]
  br label %._crit_edge11

.preheader.us:                                    ; No predecessors!
  br label %scalar.ph

min.iters.checked:                                ; No predecessors!
  br label %scalar.ph

vector.memcheck:                                  ; No predecessors!
  br label %scalar.ph

vector.ph:                                        ; No predecessors!
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  br label %middle.block

middle.block:                                     ; preds = %vector.body
  br label %._crit_edge.us

scalar.ph:                                        ; preds = %min.iters.checked, %.preheader.us, %vector.memcheck
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %scalar.ph, %middle.block
  unreachable

._crit_edge11:                                    ; preds = %.preheader5
  br label %._crit_edge11.1

._crit_edge16.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge16

._crit_edge16.loopexit146.unr-lcssa:              ; preds = %._crit_edge11.7
  br label %._crit_edge16.loopexit146

._crit_edge16.loopexit146:                        ; preds = %.preheader5.prol.loopexit, %._crit_edge16.loopexit146.unr-lcssa
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit146, %._crit_edge16.loopexit
  br label %84

; <label>:84:                                     ; preds = %._crit_edge16, %8
  ret void

._crit_edge11.1:                                  ; preds = %._crit_edge11
  br label %._crit_edge11.2

._crit_edge11.2:                                  ; preds = %._crit_edge11.1
  br label %._crit_edge11.3

._crit_edge11.3:                                  ; preds = %._crit_edge11.2
  br label %._crit_edge11.4

._crit_edge11.4:                                  ; preds = %._crit_edge11.3
  br label %._crit_edge11.5

._crit_edge11.5:                                  ; preds = %._crit_edge11.4
  br label %._crit_edge11.6

._crit_edge11.6:                                  ; preds = %._crit_edge11.5
  br label %._crit_edge11.7

._crit_edge11.7:                                  ; preds = %._crit_edge11.6
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %85 = icmp slt i64 %indvars.iv.next52.7, %11
  br i1 %85, label %.preheader5, label %._crit_edge16.loopexit146.unr-lcssa
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %24

.preheader.lr.ph:                                 ; preds = %3
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge5.loopexit10

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge3.us
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge3.us ]
  %11 = mul nsw i64 %10, %indvars.iv12
  br label %12

; <label>:12:                                     ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #4
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %12

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %23 = icmp slt i64 %indvars.iv.next13, %10
  br i1 %23, label %.preheader.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5.loopexit10:                          ; preds = %.preheader.lr.ph
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit10, %._crit_edge5.loopexit
  br label %24

; <label>:24:                                     ; preds = %._crit_edge5, %3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
