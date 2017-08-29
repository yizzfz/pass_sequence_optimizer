; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader10.lr.ph, label %._crit_edge15

.preheader10.lr.ph:                               ; preds = %7
  %11 = icmp sgt i32 %1, 0
  %12 = sitofp i32 %0 to double
  %13 = sitofp i32 %1 to double
  br i1 %11, label %.preheader10.us.preheader, label %.preheader.preheader

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %.preheader10.us.preheader, %._crit_edge18.us
  %indvars.iv719.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge18.us ], [ 0, %.preheader10.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader10.us
  %indvars.iv516.us = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next6.us, %14 ]
  %15 = mul nuw nsw i64 %indvars.iv516.us, %indvars.iv719.us
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %12
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  store double %20, double* %21, align 8
  %22 = add nuw nsw i64 %15, 2
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %13
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  store double %26, double* %27, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv516.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next6.us, %8
  br i1 %exitcond25, label %._crit_edge18.us, label %14

._crit_edge18.us:                                 ; preds = %14
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv719.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next8.us, %9
  br i1 %exitcond26, label %.preheader.preheader.loopexit, label %.preheader10.us

.preheader.preheader.loopexit:                    ; preds = %._crit_edge18.us
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %.preheader10.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv313 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next4, %._crit_edge ]
  br label %28

; <label>:28:                                     ; preds = %28, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %28 ]
  %29 = mul nuw nsw i64 %indvars.iv12, %indvars.iv313
  %30 = add nuw nsw i64 %29, 3
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %0
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %13
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv313, i64 %indvars.iv12
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %28

._crit_edge:                                      ; preds = %28
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next4, %9
  br i1 %exitcond24, label %._crit_edge15.loopexit, label %.preheader

._crit_edge15.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader18.lr.ph, label %._crit_edge26

.preheader18.lr.ph:                               ; preds = %7
  %11 = icmp sgt i32 %1, 0
  br i1 %11, label %.preheader18.us.preheader, label %.preheader18.preheader

.preheader18.preheader:                           ; preds = %.preheader18.lr.ph
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18

.preheader18.us.preheader:                        ; preds = %.preheader18.lr.ph
  %broadcast.splatinsert113 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat114 = shufflevector <2 x double> %broadcast.splatinsert113, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert88 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat89 = shufflevector <2 x double> %broadcast.splatinsert88, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18.us

.preheader18.us:                                  ; preds = %.preheader18.us.preheader, %._crit_edge.us
  %indvars.iv = phi i2 [ %indvars.iv.next38, %._crit_edge.us ], [ 1, %.preheader18.us.preheader ]
  %indvars.iv1324.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge.us ], [ 1, %.preheader18.us.preheader ]
  %indvars.iv1522.us = phi i64 [ %17, %._crit_edge.us ], [ 0, %.preheader18.us.preheader ]
  %12 = add i64 %indvars.iv1522.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 0
  %13 = mul i64 %indvars.iv1522.us, 1201
  %14 = add i64 %13, 1
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %14
  %15 = add i64 %indvars.iv1522.us, 1
  %16 = zext i2 %indvars.iv to i64
  %17 = add nuw nsw i64 %indvars.iv1522.us, 1
  %xtraiter = and i64 %17, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader18.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us.prol
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %3
  store double %20, double* %18, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader18.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader18.us ], [ %16, %.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %indvars.iv1522.us, 3
  br i1 %21, label %.preheader.us.preheader, label %.preheader18.us.new.preheader

.preheader18.us.new.preheader:                    ; preds = %.prol.loopexit
  %22 = sub i64 %12, %indvars.iv19.us.unr
  %23 = lshr i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check93 = icmp ult i64 %24, 2
  br i1 %min.iters.check93, label %.preheader18.us.new.preheader116, label %min.iters.checked94

min.iters.checked94:                              ; preds = %.preheader18.us.new.preheader
  %n.mod.vf95 = and i64 %24, 1
  %n.vec96 = sub nsw i64 %24, %n.mod.vf95
  %cmp.zero97 = icmp eq i64 %n.vec96, 0
  %25 = or i64 %indvars.iv19.us.unr, 4
  %26 = shl nuw i64 %23, 2
  %27 = add i64 %25, %26
  %28 = shl nuw nsw i64 %n.mod.vf95, 2
  %ind.end102 = sub i64 %27, %28
  br i1 %cmp.zero97, label %.preheader18.us.new.preheader116, label %vector.ph98

vector.ph98:                                      ; preds = %min.iters.checked94
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90, %vector.ph98
  %index99 = phi i64 [ 0, %vector.ph98 ], [ %index.next100, %vector.body90 ]
  %29 = shl i64 %index99, 2
  %offset.idx104 = or i64 %indvars.iv19.us.unr, %29
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %offset.idx104
  %31 = bitcast double* %30 to <8 x double>*
  %wide.vec108 = load <8 x double>, <8 x double>* %31, align 8
  %strided.vec109 = shufflevector <8 x double> %wide.vec108, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec110 = shufflevector <8 x double> %wide.vec108, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec111 = shufflevector <8 x double> %wide.vec108, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec112 = shufflevector <8 x double> %wide.vec108, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %32 = fmul <2 x double> %strided.vec109, %broadcast.splat114
  %33 = fmul <2 x double> %strided.vec110, %broadcast.splat114
  %34 = fmul <2 x double> %strided.vec111, %broadcast.splat114
  %35 = add nsw i64 %offset.idx104, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %35
  %37 = fmul <2 x double> %strided.vec112, %broadcast.splat114
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %32, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %34, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec115 = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec115, <8 x double>* %39, align 8
  %index.next100 = add i64 %index99, 2
  %42 = icmp eq i64 %index.next100, %n.vec96
  br i1 %42, label %middle.block91, label %vector.body90, !llvm.loop !3

middle.block91:                                   ; preds = %vector.body90
  %cmp.n103 = icmp eq i64 %n.mod.vf95, 0
  br i1 %cmp.n103, label %.preheader.us.preheader, label %.preheader18.us.new.preheader116

.preheader18.us.new.preheader116:                 ; preds = %middle.block91, %min.iters.checked94, %.preheader18.us.new.preheader
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked94 ], [ %indvars.iv19.us.unr, %.preheader18.us.new.preheader ], [ %ind.end102, %middle.block91 ]
  br label %.preheader18.us.new

.preheader18.us.new:                              ; preds = %.preheader18.us.new.preheader116, %.preheader18.us.new
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader18.us.new ], [ %indvars.iv19.us.ph, %.preheader18.us.new.preheader116 ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %3
  store double %45, double* %43, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %3
  store double %48, double* %46, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.1
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %3
  store double %51, double* %49, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv19.us, 3
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %3
  store double %54, double* %52, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1324.us
  br i1 %exitcond.us.3, label %.preheader.us.preheader.loopexit, label %.preheader18.us.new, !llvm.loop !6

.preheader.us.preheader.loopexit:                 ; preds = %.preheader18.us.new
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block91, %.prol.loopexit
  %min.iters.check49 = icmp ult i64 %15, 2
  %n.vec52 = and i64 %15, -2
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  %cmp.n84 = icmp eq i64 %15, %n.vec52
  br label %.preheader.us

scalar.ph48:                                      ; preds = %scalar.ph48.preheader, %scalar.ph48
  %indvars.iv520.us = phi i64 [ %indvars.iv.next6.us, %scalar.ph48 ], [ %indvars.iv520.us.ph, %scalar.ph48.preheader ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %70, align 8
  %59 = fmul double %57, %58
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %2
  %63 = load double, double* %71, align 8
  %64 = fmul double %62, %63
  %65 = fadd double %59, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv520.us
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv520.us, 1
  %exitcond10.us = icmp eq i64 %indvars.iv.next6.us, %indvars.iv1324.us
  br i1 %exitcond10.us, label %.loopexit.loopexit, label %scalar.ph48, !llvm.loop !8

.loopexit.loopexit:                               ; preds = %scalar.ph48
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block47
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next12.us, %8
  br i1 %exitcond28, label %._crit_edge.us, label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit
  %indvars.iv1121.us = phi i64 [ %indvars.iv.next12.us, %.loopexit ], [ 0, %.preheader.us.preheader ]
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1121.us
  %69 = add i64 %indvars.iv1121.us, 1
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %69
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1121.us
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %69
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  br i1 %min.iters.check49, label %scalar.ph48.preheader, label %min.iters.checked50

scalar.ph48.preheader:                            ; preds = %middle.block47, %vector.memcheck, %min.iters.checked50, %.preheader.us
  %indvars.iv520.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked50 ], [ 0, %.preheader.us ], [ %n.vec52, %middle.block47 ]
  br label %scalar.ph48

min.iters.checked50:                              ; preds = %.preheader.us
  br i1 %cmp.zero53, label %scalar.ph48.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked50
  %bound0 = icmp ult double* %scevgep, %71
  %bound1 = icmp ult double* %71, %scevgep56
  %found.conflict = and i1 %bound0, %bound1
  %bound067 = icmp ult double* %scevgep, %scevgep60
  %bound168 = icmp ult double* %scevgep58, %scevgep56
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx = or i1 %found.conflict, %found.conflict69
  %bound070 = icmp ult double* %scevgep, %scevgep64
  %bound171 = icmp ult double* %scevgep62, %scevgep56
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx73 = or i1 %conflict.rdx, %found.conflict72
  %bound076 = icmp ult double* %scevgep, %70
  %bound177 = icmp ult double* %70, %scevgep56
  %found.conflict78 = and i1 %bound076, %bound177
  %conflict.rdx79 = or i1 %conflict.rdx73, %found.conflict78
  br i1 %conflict.rdx79, label %scalar.ph48.preheader, label %vector.ph80

vector.ph80:                                      ; preds = %vector.memcheck
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46, %vector.ph80
  %index81 = phi i64 [ 0, %vector.ph80 ], [ %index.next82, %vector.body46 ]
  %72 = or i64 %index81, 1
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index81, i64 %indvars.iv1121.us
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %72, i64 %indvars.iv1121.us
  %75 = load double, double* %73, align 8, !alias.scope !9
  %76 = load double, double* %74, align 8, !alias.scope !9
  %77 = insertelement <2 x double> undef, double %75, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fmul <2 x double> %78, %broadcast.splat89
  %80 = load double, double* %70, align 8, !alias.scope !12
  %81 = insertelement <2 x double> undef, double %80, i32 0
  %82 = shufflevector <2 x double> %81, <2 x double> undef, <2 x i32> zeroinitializer
  %83 = fmul <2 x double> %79, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index81, i64 %indvars.iv1121.us
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %72, i64 %indvars.iv1121.us
  %86 = load double, double* %84, align 8, !alias.scope !14
  %87 = load double, double* %85, align 8, !alias.scope !14
  %88 = insertelement <2 x double> undef, double %86, i32 0
  %89 = insertelement <2 x double> %88, double %87, i32 1
  %90 = fmul <2 x double> %89, %broadcast.splat89
  %91 = load double, double* %71, align 8, !alias.scope !16
  %92 = insertelement <2 x double> undef, double %91, i32 0
  %93 = shufflevector <2 x double> %92, <2 x double> undef, <2 x i32> zeroinitializer
  %94 = fmul <2 x double> %90, %93
  %95 = fadd <2 x double> %83, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %index81
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !18, !noalias !20
  %98 = fadd <2 x double> %wide.load, %95
  %99 = bitcast double* %96 to <2 x double>*
  store <2 x double> %98, <2 x double>* %99, align 8, !alias.scope !18, !noalias !20
  %index.next82 = add i64 %index81, 2
  %100 = icmp eq i64 %index.next82, %n.vec52
  br i1 %100, label %middle.block47, label %vector.body46, !llvm.loop !21

middle.block47:                                   ; preds = %vector.body46
  br i1 %cmp.n84, label %.loopexit, label %scalar.ph48.preheader

._crit_edge.us:                                   ; preds = %.loopexit
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  %exitcond29 = icmp eq i64 %17, %9
  %indvars.iv.next38 = add i2 %indvars.iv, 1
  br i1 %exitcond29, label %._crit_edge26.loopexit, label %.preheader18.us

.preheader18:                                     ; preds = %.preheader18.preheader, %.preheader17
  %indvars.iv39 = phi i2 [ %indvars.iv.next40, %.preheader17 ], [ 1, %.preheader18.preheader ]
  %indvars.iv1324 = phi i64 [ %indvars.iv.next14, %.preheader17 ], [ 1, %.preheader18.preheader ]
  %indvars.iv1522 = phi i64 [ %103, %.preheader17 ], [ 0, %.preheader18.preheader ]
  %101 = add i64 %indvars.iv1522, -3
  %102 = zext i2 %indvars.iv39 to i64
  %103 = add nuw nsw i64 %indvars.iv1522, 1
  %xtraiter33 = and i64 %103, 3
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %.prol.loopexit32, label %.prol.preheader31.preheader

.prol.preheader31.preheader:                      ; preds = %.preheader18
  br label %.prol.preheader31

.prol.preheader31:                                ; preds = %.prol.preheader31.preheader, %.prol.preheader31
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader31 ], [ 0, %.prol.preheader31.preheader ]
  %prol.iter35 = phi i64 [ %prol.iter35.sub, %.prol.preheader31 ], [ %xtraiter33, %.prol.preheader31.preheader ]
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv19.prol
  %105 = load double, double* %104, align 8
  %106 = fmul double %105, %3
  store double %106, double* %104, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter35.sub = add nsw i64 %prol.iter35, -1
  %prol.iter35.cmp = icmp eq i64 %prol.iter35.sub, 0
  br i1 %prol.iter35.cmp, label %.prol.loopexit32.loopexit, label %.prol.preheader31, !llvm.loop !22

.prol.loopexit32.loopexit:                        ; preds = %.prol.preheader31
  br label %.prol.loopexit32

.prol.loopexit32:                                 ; preds = %.prol.loopexit32.loopexit, %.preheader18
  %indvars.iv19.unr = phi i64 [ 0, %.preheader18 ], [ %102, %.prol.loopexit32.loopexit ]
  %107 = icmp ult i64 %indvars.iv1522, 3
  br i1 %107, label %.preheader17, label %.preheader18.new.preheader

.preheader18.new.preheader:                       ; preds = %.prol.loopexit32
  %108 = sub i64 %101, %indvars.iv19.unr
  %109 = lshr i64 %108, 2
  %110 = add nuw nsw i64 %109, 1
  %min.iters.check = icmp ult i64 %110, 2
  br i1 %min.iters.check, label %.preheader18.new.preheader117, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader18.new.preheader
  %n.mod.vf = and i64 %110, 1
  %n.vec = sub nsw i64 %110, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %111 = or i64 %indvars.iv19.unr, 4
  %112 = shl nuw i64 %109, 2
  %113 = add i64 %111, %112
  %114 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %113, %114
  br i1 %cmp.zero, label %.preheader18.new.preheader117, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %115 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv19.unr, %115
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %offset.idx
  %117 = bitcast double* %116 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %117, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec41 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec42 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec43 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %118 = fmul <2 x double> %strided.vec, %broadcast.splat45
  %119 = fmul <2 x double> %strided.vec41, %broadcast.splat45
  %120 = fmul <2 x double> %strided.vec42, %broadcast.splat45
  %121 = add nsw i64 %offset.idx, 3
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %121
  %123 = fmul <2 x double> %strided.vec43, %broadcast.splat45
  %124 = getelementptr double, double* %122, i64 -3
  %125 = bitcast double* %124 to <8 x double>*
  %126 = shufflevector <2 x double> %118, <2 x double> %119, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %127 = shufflevector <2 x double> %120, <2 x double> %123, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %126, <4 x double> %127, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %125, align 8
  %index.next = add i64 %index, 2
  %128 = icmp eq i64 %index.next, %n.vec
  br i1 %128, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader17, label %.preheader18.new.preheader117

.preheader18.new.preheader117:                    ; preds = %middle.block, %min.iters.checked, %.preheader18.new.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %.preheader18.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader18.new

.preheader18.new:                                 ; preds = %.preheader18.new.preheader117, %.preheader18.new
  %indvars.iv19 = phi i64 [ %indvars.iv.next.3, %.preheader18.new ], [ %indvars.iv19.ph, %.preheader18.new.preheader117 ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv19
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %3
  store double %131, double* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv.next
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %3
  store double %134, double* %132, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv19, 2
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv.next.1
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv19, 3
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv.next.2
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv19, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1324
  br i1 %exitcond.3, label %.preheader17.loopexit, label %.preheader18.new, !llvm.loop !24

.preheader17.loopexit:                            ; preds = %.preheader18.new
  br label %.preheader17

.preheader17:                                     ; preds = %.preheader17.loopexit, %middle.block, %.prol.loopexit32
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1324, 1
  %exitcond30 = icmp eq i64 %103, %9
  %indvars.iv.next40 = add i2 %indvars.iv39, 1
  br i1 %exitcond30, label %._crit_edge26.loopexit118, label %.preheader18

._crit_edge26.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge26

._crit_edge26.loopexit118:                        ; preds = %.preheader17
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit118, %._crit_edge26.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.preheader, label %._crit_edge8

.preheader.preheader:                             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next3, %._crit_edge ]
  %9 = mul nsw i64 %indvars.iv26, %7
  br label %10

; <label>:10:                                     ; preds = %._crit_edge14, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge14 ]
  %11 = add nsw i64 %indvars.iv5, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge14

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %._crit_edge14
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond11, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!8 = distinct !{!8, !4, !5}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!17}
!17 = distinct !{!17, !11}
!18 = !{!19}
!19 = distinct !{!19, !11}
!20 = !{!17, !10, !15, !13}
!21 = distinct !{!21, !4, !5}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !7, !4, !5}
