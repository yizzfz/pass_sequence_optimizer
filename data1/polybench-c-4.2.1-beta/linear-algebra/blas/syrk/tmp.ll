; ModuleID = 'B.ll'
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

; <label>:16:                                     ; preds = %15, %12, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = sext i32 %1 to i64
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader10.lr.ph, label %._crit_edge15

.preheader10.lr.ph:                               ; preds = %6
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader10.us.preheader, label %.preheader.preheader

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge18.us, %.preheader10.us.preheader
  %indvars.iv719.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge18.us ], [ 0, %.preheader10.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader10.us
  %indvars.iv516.us = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next6.us, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv516.us, %indvars.iv719.us
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %11
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  store double %18, double* %19, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv516.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next6.us, %7
  br i1 %exitcond24, label %._crit_edge18.us, label %12

._crit_edge18.us:                                 ; preds = %12
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv719.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next8.us, %8
  br i1 %exitcond25, label %.preheader.preheader.loopexit, label %.preheader10.us

.preheader.preheader.loopexit:                    ; preds = %._crit_edge18.us
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %.preheader10.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  %20 = sitofp i32 %1 to double
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv313 = phi i64 [ %indvars.iv.next4, %._crit_edge ], [ 0, %.preheader.preheader ]
  br label %21

; <label>:21:                                     ; preds = %21, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %21 ]
  %22 = mul nuw nsw i64 %indvars.iv12, %indvars.iv313
  %23 = add nuw nsw i64 %22, 2
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %1
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %20
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv313, i64 %indvars.iv12
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %21

._crit_edge:                                      ; preds = %21
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next4, %8
  br i1 %exitcond23, label %._crit_edge15.loopexit, label %.preheader

._crit_edge15.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %7 = sext i32 %1 to i64
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader18.lr.ph, label %._crit_edge26

.preheader18.lr.ph:                               ; preds = %6
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader18.us.preheader, label %.preheader18.preheader

.preheader18.preheader:                           ; preds = %.preheader18.lr.ph
  %broadcast.splatinsert48 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat49 = shufflevector <2 x double> %broadcast.splatinsert48, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18

.preheader18.us.preheader:                        ; preds = %.preheader18.lr.ph
  %broadcast.splatinsert73 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat74 = shufflevector <2 x double> %broadcast.splatinsert73, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18.us

.preheader18.us:                                  ; preds = %._crit_edge.us, %.preheader18.us.preheader
  %indvars.iv = phi i2 [ %indvars.iv.next42, %._crit_edge.us ], [ 1, %.preheader18.us.preheader ]
  %indvars.iv1324.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge.us ], [ 1, %.preheader18.us.preheader ]
  %indvars.iv1522.us = phi i64 [ %13, %._crit_edge.us ], [ 0, %.preheader18.us.preheader ]
  %11 = add i64 %indvars.iv1522.us, -3
  %12 = zext i2 %indvars.iv to i64
  %13 = add nuw nsw i64 %indvars.iv1522.us, 1
  %xtraiter = and i64 %13, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader18.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.prol.preheader.preheader
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us.prol
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %3
  store double %16, double* %14, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader18.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader18.us ], [ %12, %.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %indvars.iv1522.us, 3
  br i1 %17, label %.preheader.us.preheader, label %.preheader18.us.new.preheader

.preheader18.us.new.preheader:                    ; preds = %.prol.loopexit
  %18 = sub i64 %11, %indvars.iv19.us.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check53 = icmp ult i64 %20, 2
  br i1 %min.iters.check53, label %.preheader18.us.new.preheader76, label %min.iters.checked54

min.iters.checked54:                              ; preds = %.preheader18.us.new.preheader
  %n.mod.vf55 = and i64 %20, 1
  %n.vec56 = sub nsw i64 %20, %n.mod.vf55
  %cmp.zero57 = icmp eq i64 %n.vec56, 0
  %21 = or i64 %indvars.iv19.us.unr, 4
  %22 = shl nuw i64 %19, 2
  %23 = add i64 %21, %22
  %24 = shl nuw nsw i64 %n.mod.vf55, 2
  %ind.end62 = sub i64 %23, %24
  br i1 %cmp.zero57, label %.preheader18.us.new.preheader76, label %vector.ph58

vector.ph58:                                      ; preds = %min.iters.checked54
  br label %vector.body50

vector.body50:                                    ; preds = %vector.body50, %vector.ph58
  %index59 = phi i64 [ 0, %vector.ph58 ], [ %index.next60, %vector.body50 ]
  %25 = shl i64 %index59, 2
  %offset.idx64 = or i64 %indvars.iv19.us.unr, %25
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %offset.idx64
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec68 = load <8 x double>, <8 x double>* %27, align 8
  %strided.vec69 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec70 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec71 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec72 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %28 = fmul <2 x double> %strided.vec69, %broadcast.splat74
  %29 = fmul <2 x double> %strided.vec70, %broadcast.splat74
  %30 = fmul <2 x double> %strided.vec71, %broadcast.splat74
  %31 = add nsw i64 %offset.idx64, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %31
  %33 = fmul <2 x double> %strided.vec72, %broadcast.splat74
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec75 = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec75, <8 x double>* %35, align 8
  %index.next60 = add i64 %index59, 2
  %38 = icmp eq i64 %index.next60, %n.vec56
  br i1 %38, label %middle.block51, label %vector.body50, !llvm.loop !3

middle.block51:                                   ; preds = %vector.body50
  %cmp.n63 = icmp eq i64 %n.mod.vf55, 0
  br i1 %cmp.n63, label %.preheader.us.preheader, label %.preheader18.us.new.preheader76

.preheader18.us.new.preheader76:                  ; preds = %middle.block51, %min.iters.checked54, %.preheader18.us.new.preheader
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked54 ], [ %indvars.iv19.us.unr, %.preheader18.us.new.preheader ], [ %ind.end62, %middle.block51 ]
  br label %.preheader18.us.new

.preheader18.us.new:                              ; preds = %.preheader18.us.new, %.preheader18.us.new.preheader76
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader18.us.new ], [ %indvars.iv19.us.ph, %.preheader18.us.new.preheader76 ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %3
  store double %41, double* %39, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  store double %44, double* %42, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %3
  store double %47, double* %45, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv19.us, 3
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %3
  store double %50, double* %48, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1324.us
  br i1 %exitcond.us.3, label %.preheader.us.preheader.loopexit, label %.preheader18.us.new, !llvm.loop !6

.preheader.us.preheader.loopexit:                 ; preds = %.preheader18.us.new
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block51, %.prol.loopexit
  %51 = and i64 %indvars.iv1522.us, 1
  %lcmp.mod31 = icmp eq i64 %51, 0
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 0
  %53 = icmp eq i64 %indvars.iv1522.us, 0
  br label %.preheader.us

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv520.us = phi i64 [ %indvars.iv.next6.us.1, %.preheader.us.new ], [ %indvars.iv520.us.unr.ph, %.preheader.us.new.preheader ]
  %54 = load double, double* %70, align 8
  %55 = fmul double %54, %2
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv520.us
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv520.us, 1
  %62 = load double, double* %70, align 8
  %63 = fmul double %62, %2
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next6.us, i64 %indvars.iv1121.us
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next6.us
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next6.us.1 = add nuw nsw i64 %indvars.iv520.us, 2
  %exitcond10.us.1 = icmp eq i64 %indvars.iv.next6.us.1, %indvars.iv1324.us
  br i1 %exitcond10.us.1, label %.unr-lcssa.loopexit, label %.preheader.us.new

.unr-lcssa.loopexit:                              ; preds = %.preheader.us.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.prol.loopexit29, %.unr-lcssa.loopexit
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next12.us, %7
  br i1 %exitcond32, label %._crit_edge.us, label %.preheader.us

.preheader.us:                                    ; preds = %.unr-lcssa, %.preheader.us.preheader
  %indvars.iv1121.us = phi i64 [ %indvars.iv.next12.us, %.unr-lcssa ], [ 0, %.preheader.us.preheader ]
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  br i1 %lcmp.mod31, label %.prol.preheader28, label %.prol.loopexit29

.prol.preheader28:                                ; preds = %.preheader.us
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %2
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1121.us
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = load double, double* %52, align 8
  %77 = fadd double %76, %75
  store double %77, double* %52, align 8
  br label %.prol.loopexit29

.prol.loopexit29:                                 ; preds = %.prol.preheader28, %.preheader.us
  %indvars.iv520.us.unr.ph = phi i64 [ 1, %.prol.preheader28 ], [ 0, %.preheader.us ]
  br i1 %53, label %.unr-lcssa, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit29
  br label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.unr-lcssa
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  %exitcond33 = icmp eq i64 %13, %8
  %indvars.iv.next42 = add i2 %indvars.iv, 1
  br i1 %exitcond33, label %._crit_edge26.loopexit, label %.preheader18.us

.preheader18:                                     ; preds = %.preheader17, %.preheader18.preheader
  %indvars.iv43 = phi i2 [ %indvars.iv.next44, %.preheader17 ], [ 1, %.preheader18.preheader ]
  %indvars.iv1324 = phi i64 [ %indvars.iv.next14, %.preheader17 ], [ 1, %.preheader18.preheader ]
  %indvars.iv1522 = phi i64 [ %80, %.preheader17 ], [ 0, %.preheader18.preheader ]
  %78 = add i64 %indvars.iv1522, -3
  %79 = zext i2 %indvars.iv43 to i64
  %80 = add nuw nsw i64 %indvars.iv1522, 1
  %xtraiter36 = and i64 %80, 3
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  br i1 %lcmp.mod37, label %.prol.loopexit35, label %.prol.preheader34.preheader

.prol.preheader34.preheader:                      ; preds = %.preheader18
  br label %.prol.preheader34

.prol.preheader34:                                ; preds = %.prol.preheader34, %.prol.preheader34.preheader
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader34 ], [ 0, %.prol.preheader34.preheader ]
  %prol.iter38 = phi i64 [ %prol.iter38.sub, %.prol.preheader34 ], [ %xtraiter36, %.prol.preheader34.preheader ]
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv19.prol
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, %3
  store double %83, double* %81, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter38.sub = add nsw i64 %prol.iter38, -1
  %prol.iter38.cmp = icmp eq i64 %prol.iter38.sub, 0
  br i1 %prol.iter38.cmp, label %.prol.loopexit35.loopexit, label %.prol.preheader34, !llvm.loop !8

.prol.loopexit35.loopexit:                        ; preds = %.prol.preheader34
  br label %.prol.loopexit35

.prol.loopexit35:                                 ; preds = %.prol.loopexit35.loopexit, %.preheader18
  %indvars.iv19.unr = phi i64 [ 0, %.preheader18 ], [ %79, %.prol.loopexit35.loopexit ]
  %84 = icmp ult i64 %indvars.iv1522, 3
  br i1 %84, label %.preheader17, label %.preheader18.new.preheader

.preheader18.new.preheader:                       ; preds = %.prol.loopexit35
  %85 = sub i64 %78, %indvars.iv19.unr
  %86 = lshr i64 %85, 2
  %87 = add nuw nsw i64 %86, 1
  %min.iters.check = icmp ult i64 %87, 2
  br i1 %min.iters.check, label %.preheader18.new.preheader77, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader18.new.preheader
  %n.mod.vf = and i64 %87, 1
  %n.vec = sub nsw i64 %87, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %88 = or i64 %indvars.iv19.unr, 4
  %89 = shl nuw i64 %86, 2
  %90 = add i64 %88, %89
  %91 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %90, %91
  br i1 %cmp.zero, label %.preheader18.new.preheader77, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %92 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv19.unr, %92
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %offset.idx
  %94 = bitcast double* %93 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %94, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec45 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec46 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec47 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %95 = fmul <2 x double> %strided.vec, %broadcast.splat49
  %96 = fmul <2 x double> %strided.vec45, %broadcast.splat49
  %97 = fmul <2 x double> %strided.vec46, %broadcast.splat49
  %98 = add nsw i64 %offset.idx, 3
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %98
  %100 = fmul <2 x double> %strided.vec47, %broadcast.splat49
  %101 = getelementptr double, double* %99, i64 -3
  %102 = bitcast double* %101 to <8 x double>*
  %103 = shufflevector <2 x double> %95, <2 x double> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %104 = shufflevector <2 x double> %97, <2 x double> %100, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %103, <4 x double> %104, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %102, align 8
  %index.next = add i64 %index, 2
  %105 = icmp eq i64 %index.next, %n.vec
  br i1 %105, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader17, label %.preheader18.new.preheader77

.preheader18.new.preheader77:                     ; preds = %middle.block, %min.iters.checked, %.preheader18.new.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %.preheader18.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader18.new

.preheader18.new:                                 ; preds = %.preheader18.new, %.preheader18.new.preheader77
  %indvars.iv19 = phi i64 [ %indvars.iv.next.3, %.preheader18.new ], [ %indvars.iv19.ph, %.preheader18.new.preheader77 ]
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv19
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %3
  store double %108, double* %106, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv.next
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv19, 2
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv.next.1
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %3
  store double %114, double* %112, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv19, 3
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv.next.2
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %3
  store double %117, double* %115, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv19, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1324
  br i1 %exitcond.3, label %.preheader17.loopexit, label %.preheader18.new, !llvm.loop !10

.preheader17.loopexit:                            ; preds = %.preheader18.new
  br label %.preheader17

.preheader17:                                     ; preds = %.preheader17.loopexit, %middle.block, %.prol.loopexit35
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1324, 1
  %exitcond = icmp eq i64 %80, %8
  %indvars.iv.next44 = add i2 %indvars.iv43, 1
  br i1 %exitcond, label %._crit_edge26.loopexit78, label %.preheader18

._crit_edge26.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge26

._crit_edge26.loopexit78:                         ; preds = %.preheader17
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit78, %._crit_edge26.loopexit, %6
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
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.preheader, label %._crit_edge8

.preheader.preheader:                             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %9 = mul nsw i64 %indvars.iv26, %7
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv5, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %17
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond10, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
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
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !4, !5}
!10 = distinct !{!10, !7, !4, !5}
