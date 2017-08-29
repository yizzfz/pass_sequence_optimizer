; ModuleID = 'A.ll'
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
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader10.lr.ph..preheader10.us_crit_edge:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge18.us, %.preheader10.lr.ph..preheader10.us_crit_edge
  %indvars.iv719.us = phi i64 [ 0, %.preheader10.lr.ph..preheader10.us_crit_edge ], [ %indvars.iv.next8.us, %._crit_edge18.us ]
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30, %.preheader10.us
  %indvars.iv516.us = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next6.us, %._crit_edge30 ]
  %6 = mul nuw nsw i64 %indvars.iv516.us, %indvars.iv719.us
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  store double %11, double* %12, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv516.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond24, label %._crit_edge18.us, label %._crit_edge30

._crit_edge18.us:                                 ; preds = %._crit_edge30
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv719.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next8.us, 1200
  br i1 %exitcond25, label %.preheader.preheader, label %.preheader10.us

.preheader.preheader:                             ; preds = %._crit_edge18.us
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv313 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next4, %._crit_edge ]
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge31 ]
  %13 = mul nuw nsw i64 %indvars.iv12, %indvars.iv313
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv313, i64 %indvars.iv12
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge31

._crit_edge:                                      ; preds = %._crit_edge31
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond23, label %._crit_edge15, label %.preheader

._crit_edge15:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader18.lr.ph..preheader18.us_crit_edge:
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18.us

.preheader18.us:                                  ; preds = %._crit_edge.us..preheader18.us_crit_edge, %.preheader18.lr.ph..preheader18.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next41, %._crit_edge.us..preheader18.us_crit_edge ], [ 1, %.preheader18.lr.ph..preheader18.us_crit_edge ]
  %indvars.iv1324.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge.us..preheader18.us_crit_edge ], [ 1, %.preheader18.lr.ph..preheader18.us_crit_edge ]
  %indvars.iv1522.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge.us..preheader18.us_crit_edge ], [ 0, %.preheader18.lr.ph..preheader18.us_crit_edge ]
  %6 = add i64 %indvars.iv1522.us, -3
  %7 = and i64 %indvars.iv, 3
  %8 = add nuw nsw i64 %indvars.iv1522.us, 1
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader18.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader18.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader18.us ], [ %7, %.prol.loopexit.loopexit ]
  %12 = icmp ult i64 %indvars.iv1522.us, 3
  br i1 %12, label %.preheader.us.preheader, label %.prol.loopexit..preheader18.us.new_crit_edge

.prol.loopexit..preheader18.us.new_crit_edge:     ; preds = %.prol.loopexit
  %13 = sub i64 %6, %indvars.iv19.us.unr
  %14 = lshr i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %min.iters.check = icmp ult i64 %15, 2
  br i1 %min.iters.check, label %.preheader18.us.new.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.prol.loopexit..preheader18.us.new_crit_edge
  %n.mod.vf = and i64 %15, 1
  %n.vec = sub nsw i64 %15, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %16 = or i64 %indvars.iv19.us.unr, 4
  %17 = shl nuw i64 %14, 2
  %18 = add i64 %16, %17
  %19 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %18, %19
  br i1 %cmp.zero, label %.preheader18.us.new.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv19.us.unr, %20
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %offset.idx
  %22 = bitcast double* %21 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %22, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec44 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec45 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec46 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %23 = fmul <2 x double> %strided.vec, %broadcast.splat48
  %24 = fmul <2 x double> %strided.vec44, %broadcast.splat48
  %25 = fmul <2 x double> %strided.vec45, %broadcast.splat48
  %26 = add nsw i64 %offset.idx, 3
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %26
  %28 = fmul <2 x double> %strided.vec46, %broadcast.splat48
  %29 = getelementptr double, double* %27, i64 -3
  %30 = bitcast double* %29 to <8 x double>*
  %31 = shufflevector <2 x double> %23, <2 x double> %24, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %32 = shufflevector <2 x double> %25, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %31, <4 x double> %32, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %30, align 8
  %index.next = add i64 %index, 2
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader.us.preheader, label %.preheader18.us.new.preheader

.preheader18.us.new.preheader:                    ; preds = %middle.block, %min.iters.checked, %.prol.loopexit..preheader18.us.new_crit_edge
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %.prol.loopexit..preheader18.us.new_crit_edge ], [ %indvars.iv19.us.unr, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %.preheader18.us.new

.preheader18.us.new:                              ; preds = %.preheader18.us.new, %.preheader18.us.new.preheader
  %indvars.iv19.us = phi i64 [ %indvars.iv19.us.ph, %.preheader18.us.new.preheader ], [ %indvars.iv.next.us.3, %.preheader18.us.new ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %3
  store double %36, double* %34, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  store double %39, double* %37, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.1
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %3
  store double %42, double* %40, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv19.us, 3
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.2
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %3
  store double %45, double* %43, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1324.us
  br i1 %exitcond.us.3, label %.preheader.us.preheader.loopexit, label %.preheader18.us.new, !llvm.loop !6

.preheader.us.preheader.loopexit:                 ; preds = %.preheader18.us.new
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block, %.prol.loopexit
  %46 = and i64 %indvars.iv1522.us, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.unr-lcssa, %.preheader.us.preheader
  %indvars.iv1121.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12.us, %.unr-lcssa ]
  %48 = icmp eq i64 %46, 0
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  br i1 %48, label %.prol.preheader31, label %.prol.loopexit32

.prol.preheader31:                                ; preds = %.preheader.us
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %2
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1121.us
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %47, align 8
  %56 = fadd double %55, %54
  store double %56, double* %47, align 8
  br label %.prol.loopexit32

.prol.loopexit32:                                 ; preds = %.preheader.us, %.prol.preheader31
  %indvars.iv520.us.unr.ph = phi i64 [ 1, %.prol.preheader31 ], [ 0, %.preheader.us ]
  %57 = icmp eq i64 %indvars.iv1522.us, 0
  br i1 %57, label %.unr-lcssa, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv520.us = phi i64 [ %indvars.iv520.us.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next6.us.1, %.preheader.us.new ]
  %58 = load double, double* %49, align 8
  %59 = fmul double %58, %2
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv520.us
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv520.us, 1
  %66 = load double, double* %49, align 8
  %67 = fmul double %66, %2
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next6.us, i64 %indvars.iv1121.us
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next6.us
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next6.us.1 = add nuw nsw i64 %indvars.iv520.us, 2
  %exitcond10.us.1 = icmp eq i64 %indvars.iv.next6.us.1, %indvars.iv1324.us
  br i1 %exitcond10.us.1, label %.unr-lcssa.loopexit, label %.preheader.us.new

.unr-lcssa.loopexit:                              ; preds = %.preheader.us.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.prol.loopexit32
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next12.us, 1000
  br i1 %exitcond28, label %._crit_edge.us, label %.preheader.us

._crit_edge.us:                                   ; preds = %.unr-lcssa
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1522.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next16.us, 1200
  br i1 %exitcond29, label %._crit_edge26, label %._crit_edge.us..preheader18.us_crit_edge

._crit_edge.us..preheader18.us_crit_edge:         ; preds = %._crit_edge.us
  %indvars.iv.next41 = add nuw nsw i64 %7, 1
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  br label %.preheader18.us

._crit_edge26:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next3, %._crit_edge ]
  %6 = mul nsw i64 %indvars.iv26, 1200
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge13 ]
  %7 = add nsw i64 %indvars.iv5, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge13

; <label>:11:                                     ; preds = %._crit_edge14
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge14

._crit_edge:                                      ; preds = %._crit_edge13
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond10, label %._crit_edge8, label %.preheader

._crit_edge8:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
