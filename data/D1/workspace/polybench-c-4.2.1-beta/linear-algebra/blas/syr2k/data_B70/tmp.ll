; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader4.lr.ph, label %._crit_edge15

.preheader4.lr.ph:                                ; preds = %7
  %11 = icmp sgt i32 %1, 0
  %12 = sitofp i32 %0 to double
  %13 = sitofp i32 %1 to double
  br i1 %11, label %.preheader4.us.preheader, label %.preheader.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge18.us
  %indvars.iv919.us = phi i64 [ %indvars.iv.next10.us, %._crit_edge18.us ], [ 0, %.preheader4.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader4.us
  %indvars.iv716.us = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next8.us, %14 ]
  %15 = mul nuw nsw i64 %indvars.iv716.us, %indvars.iv919.us
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv919.us, i64 %indvars.iv716.us
  %21 = add nuw nsw i64 %15, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %12, i32 0
  %26 = insertelement <2 x double> %25, double %13, i32 1
  %27 = insertelement <2 x double> undef, double %19, i32 0
  %28 = insertelement <2 x double> %27, double %24, i32 1
  %29 = fdiv <2 x double> %28, %26
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  store double %30, double* %20, align 8
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv919.us, i64 %indvars.iv716.us
  store double %31, double* %32, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv716.us, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next8.us, %8
  br i1 %exitcond23, label %._crit_edge18.us, label %14

._crit_edge18.us:                                 ; preds = %14
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv919.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next10.us, %9
  br i1 %exitcond24, label %.preheader.us.preheader.loopexit, label %.preheader4.us

.preheader.us.preheader.loopexit:                 ; preds = %._crit_edge18.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %.preheader4.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv513.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %33

; <label>:33:                                     ; preds = %33, %.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %33 ]
  %34 = mul nuw nsw i64 %indvars.iv12.us, %indvars.iv513.us
  %35 = add nuw nsw i64 %34, 3
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %0
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %13
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv513.us, i64 %indvars.iv12.us
  store double %39, double* %40, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv513.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next6.us, %9
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader4.lr.ph, label %._crit_edge26

.preheader4.lr.ph:                                ; preds = %7
  %11 = icmp sgt i32 %1, 0
  br i1 %11, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %broadcast.splatinsert88 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat89 = shufflevector <2 x double> %broadcast.splatinsert88, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert113 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat114 = shufflevector <2 x double> %broadcast.splatinsert113, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next36, %._crit_edge.us ], [ 1, %.preheader4.us.preheader ]
  %indvars.iv1524.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge.us ], [ 1, %.preheader4.us.preheader ]
  %indvars.iv1722.us = phi i64 [ %17, %._crit_edge.us ], [ 0, %.preheader4.us.preheader ]
  %12 = add nsw i64 %indvars.iv1722.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 0
  %13 = mul i64 %indvars.iv1722.us, 1201
  %14 = add i64 %13, 1
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %14
  %15 = add nuw nsw i64 %indvars.iv1722.us, 1
  %16 = and i64 %indvars.iv, 3
  %17 = add nuw nsw i64 %indvars.iv1722.us, 1
  %xtraiter = and i64 %17, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader4.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us.prol
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %3
  store double %20, double* %18, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader4.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader4.us ], [ %16, %.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %indvars.iv1722.us, 3
  br i1 %21, label %.preheader.us.preheader, label %.preheader4.us.new.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit
  %22 = sub i64 %12, %indvars.iv19.us.unr
  %23 = lshr i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check93 = icmp ult i64 %24, 2
  br i1 %min.iters.check93, label %.preheader4.us.new.preheader116, label %min.iters.checked94

min.iters.checked94:                              ; preds = %.preheader4.us.new.preheader
  %n.mod.vf95 = and i64 %24, 1
  %n.vec96 = sub nsw i64 %24, %n.mod.vf95
  %cmp.zero97 = icmp eq i64 %n.vec96, 0
  %25 = or i64 %indvars.iv19.us.unr, 4
  %26 = shl nuw i64 %23, 2
  %27 = add i64 %25, %26
  %28 = shl nuw nsw i64 %n.mod.vf95, 2
  %ind.end102 = sub i64 %27, %28
  br i1 %cmp.zero97, label %.preheader4.us.new.preheader116, label %vector.ph98

vector.ph98:                                      ; preds = %min.iters.checked94
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90, %vector.ph98
  %index99 = phi i64 [ 0, %vector.ph98 ], [ %index.next100, %vector.body90 ]
  %29 = shl i64 %index99, 2
  %offset.idx104 = or i64 %indvars.iv19.us.unr, %29
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %offset.idx104
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
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %35
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
  br i1 %cmp.n103, label %.preheader.us.preheader, label %.preheader4.us.new.preheader116

.preheader4.us.new.preheader116:                  ; preds = %middle.block91, %min.iters.checked94, %.preheader4.us.new.preheader
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked94 ], [ %indvars.iv19.us.unr, %.preheader4.us.new.preheader ], [ %ind.end102, %middle.block91 ]
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new.preheader116, %.preheader4.us.new
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader4.us.new ], [ %indvars.iv19.us.ph, %.preheader4.us.new.preheader116 ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us
  %44 = bitcast double* %43 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = insertelement <2 x double> undef, double %3, i32 0
  %47 = insertelement <2 x double> %46, double %3, i32 1
  %48 = fmul <2 x double> %45, %47
  %49 = bitcast double* %43 to <2 x double>*
  store <2 x double> %48, <2 x double>* %49, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us.1
  %51 = bitcast double* %50 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %51, align 8
  %53 = insertelement <2 x double> undef, double %3, i32 0
  %54 = insertelement <2 x double> %53, double %3, i32 1
  %55 = fmul <2 x double> %52, %54
  %56 = bitcast double* %50 to <2 x double>*
  store <2 x double> %55, <2 x double>* %56, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1524.us
  br i1 %exitcond.us.3, label %.preheader.us.preheader.loopexit, label %.preheader4.us.new, !llvm.loop !6

.preheader.us.preheader.loopexit:                 ; preds = %.preheader4.us.new
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block91, %.prol.loopexit
  %min.iters.check49 = icmp ult i64 %15, 2
  %n.vec52 = and i64 %15, -2
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  %cmp.n84 = icmp eq i64 %15, %n.vec52
  br label %.preheader.us

scalar.ph48:                                      ; preds = %scalar.ph48.preheader, %scalar.ph48
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us, %scalar.ph48 ], [ %indvars.iv720.us.ph, %scalar.ph48.preheader ]
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %2
  %60 = load double, double* %72, align 8
  %61 = fmul double %59, %60
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %2
  %65 = load double, double* %73, align 8
  %66 = fmul double %64, %65
  %67 = fadd double %61, %66
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv720.us
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %exitcond12.us = icmp eq i64 %indvars.iv.next8.us, %indvars.iv1524.us
  br i1 %exitcond12.us, label %.loopexit.loopexit, label %scalar.ph48, !llvm.loop !8

.loopexit.loopexit:                               ; preds = %scalar.ph48
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block47
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1321.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next14.us, %8
  br i1 %exitcond28, label %._crit_edge.us, label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit
  %indvars.iv1321.us = phi i64 [ %indvars.iv.next14.us, %.loopexit ], [ 0, %.preheader.us.preheader ]
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1321.us
  %71 = add nuw nsw i64 %indvars.iv1321.us, 1
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %71
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1321.us
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %71
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  br i1 %min.iters.check49, label %scalar.ph48.preheader, label %min.iters.checked50

scalar.ph48.preheader:                            ; preds = %middle.block47, %vector.memcheck, %min.iters.checked50, %.preheader.us
  %indvars.iv720.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked50 ], [ 0, %.preheader.us ], [ %n.vec52, %middle.block47 ]
  br label %scalar.ph48

min.iters.checked50:                              ; preds = %.preheader.us
  br i1 %cmp.zero53, label %scalar.ph48.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked50
  %bound0 = icmp ult double* %scevgep, %73
  %bound1 = icmp ult double* %73, %scevgep56
  %found.conflict = and i1 %bound0, %bound1
  %bound067 = icmp ult double* %scevgep, %scevgep60
  %bound168 = icmp ult double* %scevgep58, %scevgep56
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx = or i1 %found.conflict, %found.conflict69
  %bound070 = icmp ult double* %scevgep, %scevgep64
  %bound171 = icmp ult double* %scevgep62, %scevgep56
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx73 = or i1 %conflict.rdx, %found.conflict72
  %bound076 = icmp ult double* %scevgep, %72
  %bound177 = icmp ult double* %72, %scevgep56
  %found.conflict78 = and i1 %bound076, %bound177
  %conflict.rdx79 = or i1 %conflict.rdx73, %found.conflict78
  br i1 %conflict.rdx79, label %scalar.ph48.preheader, label %vector.ph80

vector.ph80:                                      ; preds = %vector.memcheck
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46, %vector.ph80
  %index81 = phi i64 [ 0, %vector.ph80 ], [ %index.next82, %vector.body46 ]
  %74 = or i64 %index81, 1
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index81, i64 %indvars.iv1321.us
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %74, i64 %indvars.iv1321.us
  %77 = load double, double* %75, align 8, !alias.scope !9
  %78 = load double, double* %76, align 8, !alias.scope !9
  %79 = insertelement <2 x double> undef, double %77, i32 0
  %80 = insertelement <2 x double> %79, double %78, i32 1
  %81 = fmul <2 x double> %80, %broadcast.splat89
  %82 = load double, double* %72, align 8, !alias.scope !12
  %83 = insertelement <2 x double> undef, double %82, i32 0
  %84 = shufflevector <2 x double> %83, <2 x double> undef, <2 x i32> zeroinitializer
  %85 = fmul <2 x double> %81, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index81, i64 %indvars.iv1321.us
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %74, i64 %indvars.iv1321.us
  %88 = load double, double* %86, align 8, !alias.scope !14
  %89 = load double, double* %87, align 8, !alias.scope !14
  %90 = insertelement <2 x double> undef, double %88, i32 0
  %91 = insertelement <2 x double> %90, double %89, i32 1
  %92 = fmul <2 x double> %91, %broadcast.splat89
  %93 = load double, double* %73, align 8, !alias.scope !16
  %94 = insertelement <2 x double> undef, double %93, i32 0
  %95 = shufflevector <2 x double> %94, <2 x double> undef, <2 x i32> zeroinitializer
  %96 = fmul <2 x double> %92, %95
  %97 = fadd <2 x double> %85, %96
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %index81
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !18, !noalias !20
  %100 = fadd <2 x double> %wide.load, %97
  %101 = bitcast double* %98 to <2 x double>*
  store <2 x double> %100, <2 x double>* %101, align 8, !alias.scope !18, !noalias !20
  %index.next82 = add i64 %index81, 2
  %102 = icmp eq i64 %index.next82, %n.vec52
  br i1 %102, label %middle.block47, label %vector.body46, !llvm.loop !21

middle.block47:                                   ; preds = %vector.body46
  br i1 %cmp.n84, label %.loopexit, label %scalar.ph48.preheader

._crit_edge.us:                                   ; preds = %.loopexit
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1524.us, 1
  %exitcond29 = icmp eq i64 %17, %9
  %indvars.iv.next36 = add nuw nsw i64 %16, 1
  br i1 %exitcond29, label %._crit_edge26.loopexit, label %.preheader4.us

.preheader4:                                      ; preds = %.preheader4.preheader, %.preheader3
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.preheader3 ], [ 1, %.preheader4.preheader ]
  %indvars.iv1524 = phi i64 [ %indvars.iv.next16, %.preheader3 ], [ 1, %.preheader4.preheader ]
  %indvars.iv1722 = phi i64 [ %105, %.preheader3 ], [ 0, %.preheader4.preheader ]
  %103 = add nsw i64 %indvars.iv1722, -3
  %104 = and i64 %indvars.iv37, 3
  %105 = add nuw nsw i64 %indvars.iv1722, 1
  %xtraiter32 = and i64 %105, 3
  %lcmp.mod33 = icmp eq i64 %xtraiter32, 0
  br i1 %lcmp.mod33, label %.prol.loopexit31, label %.prol.preheader30.preheader

.prol.preheader30.preheader:                      ; preds = %.preheader4
  br label %.prol.preheader30

.prol.preheader30:                                ; preds = %.prol.preheader30.preheader, %.prol.preheader30
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader30 ], [ 0, %.prol.preheader30.preheader ]
  %prol.iter34 = phi i64 [ %prol.iter34.sub, %.prol.preheader30 ], [ %xtraiter32, %.prol.preheader30.preheader ]
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv19.prol
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %3
  store double %108, double* %106, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter34.sub = add nsw i64 %prol.iter34, -1
  %prol.iter34.cmp = icmp eq i64 %prol.iter34.sub, 0
  br i1 %prol.iter34.cmp, label %.prol.loopexit31.loopexit, label %.prol.preheader30, !llvm.loop !22

.prol.loopexit31.loopexit:                        ; preds = %.prol.preheader30
  br label %.prol.loopexit31

.prol.loopexit31:                                 ; preds = %.prol.loopexit31.loopexit, %.preheader4
  %indvars.iv19.unr = phi i64 [ 0, %.preheader4 ], [ %104, %.prol.loopexit31.loopexit ]
  %109 = icmp ult i64 %indvars.iv1722, 3
  br i1 %109, label %.preheader3, label %.preheader4.new.preheader

.preheader4.new.preheader:                        ; preds = %.prol.loopexit31
  %110 = sub i64 %103, %indvars.iv19.unr
  %111 = lshr i64 %110, 2
  %112 = add nuw nsw i64 %111, 1
  %min.iters.check = icmp ult i64 %112, 2
  br i1 %min.iters.check, label %.preheader4.new.preheader117, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader4.new.preheader
  %n.mod.vf = and i64 %112, 1
  %n.vec = sub nsw i64 %112, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %113 = or i64 %indvars.iv19.unr, 4
  %114 = shl nuw i64 %111, 2
  %115 = add i64 %113, %114
  %116 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %115, %116
  br i1 %cmp.zero, label %.preheader4.new.preheader117, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %117 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv19.unr, %117
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %offset.idx
  %119 = bitcast double* %118 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %119, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec41 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec42 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec43 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %120 = fmul <2 x double> %strided.vec, %broadcast.splat45
  %121 = fmul <2 x double> %strided.vec41, %broadcast.splat45
  %122 = fmul <2 x double> %strided.vec42, %broadcast.splat45
  %123 = add nsw i64 %offset.idx, 3
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %123
  %125 = fmul <2 x double> %strided.vec43, %broadcast.splat45
  %126 = getelementptr double, double* %124, i64 -3
  %127 = bitcast double* %126 to <8 x double>*
  %128 = shufflevector <2 x double> %120, <2 x double> %121, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %129 = shufflevector <2 x double> %122, <2 x double> %125, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %128, <4 x double> %129, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %127, align 8
  %index.next = add i64 %index, 2
  %130 = icmp eq i64 %index.next, %n.vec
  br i1 %130, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.preheader4.new.preheader117

.preheader4.new.preheader117:                     ; preds = %middle.block, %min.iters.checked, %.preheader4.new.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %.preheader4.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader4.new

.preheader4.new:                                  ; preds = %.preheader4.new.preheader117, %.preheader4.new
  %indvars.iv19 = phi i64 [ %indvars.iv.next.3, %.preheader4.new ], [ %indvars.iv19.ph, %.preheader4.new.preheader117 ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv19
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8
  %134 = insertelement <2 x double> undef, double %3, i32 0
  %135 = insertelement <2 x double> %134, double %3, i32 1
  %136 = fmul <2 x double> %133, %135
  %137 = bitcast double* %131 to <2 x double>*
  store <2 x double> %136, <2 x double>* %137, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv19, 2
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to <2 x double>*
  %140 = load <2 x double>, <2 x double>* %139, align 8
  %141 = insertelement <2 x double> undef, double %3, i32 0
  %142 = insertelement <2 x double> %141, double %3, i32 1
  %143 = fmul <2 x double> %140, %142
  %144 = bitcast double* %138 to <2 x double>*
  store <2 x double> %143, <2 x double>* %144, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv19, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1524
  br i1 %exitcond.3, label %.preheader3.loopexit, label %.preheader4.new, !llvm.loop !24

.preheader3.loopexit:                             ; preds = %.preheader4.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit31
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1524, 1
  %exitcond = icmp eq i64 %105, %9
  %indvars.iv.next38 = add nuw nsw i64 %104, 1
  br i1 %exitcond, label %._crit_edge26.loopexit118, label %.preheader4

._crit_edge26.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge26

._crit_edge26.loopexit118:                        ; preds = %.preheader3
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit118, %._crit_edge26.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.us.preheader, label %._crit_edge8

.preheader.us.preheader:                          ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv26.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %9 = mul nsw i64 %indvars.iv26.us, %7
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %17 ]
  %11 = add nsw i64 %indvars.iv5.us, %9
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, %7
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
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
