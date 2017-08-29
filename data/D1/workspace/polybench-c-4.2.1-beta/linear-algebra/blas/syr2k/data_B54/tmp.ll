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
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge16

._crit_edge16:                                    ; preds = %14
  br label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge16, %._crit_edge, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
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
  br i1 %10, label %.preheader35.lr.ph, label %.._crit_edge46_crit_edge

.._crit_edge46_crit_edge:                         ; preds = %7
  br label %._crit_edge46

.preheader35.lr.ph:                               ; preds = %7
  %11 = icmp sgt i32 %1, 0
  %12 = sitofp i32 %0 to double
  %13 = sitofp i32 %1 to double
  br i1 %11, label %.preheader35.us.preheader, label %.preheader35.lr.ph..preheader.us.preheader_crit_edge

.preheader35.lr.ph..preheader.us.preheader_crit_edge: ; preds = %.preheader35.lr.ph
  br label %.preheader.us.preheader

.preheader35.us.preheader:                        ; preds = %.preheader35.lr.ph
  %14 = insertelement <2 x double> undef, double %12, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %._crit_edge49.us..preheader35.us_crit_edge, %.preheader35.us.preheader
  %indvars.iv4050.us = phi i64 [ %indvars.iv.next41.us, %._crit_edge49.us..preheader35.us_crit_edge ], [ 0, %.preheader35.us.preheader ]
  br label %16

; <label>:16:                                     ; preds = %._crit_edge, %.preheader35.us
  %indvars.iv3847.us = phi i64 [ 0, %.preheader35.us ], [ %indvars.iv.next39.us, %._crit_edge ]
  %17 = mul nuw nsw i64 %indvars.iv3847.us, %indvars.iv4050.us
  %18 = add nuw nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4050.us, i64 %indvars.iv3847.us
  %23 = add nuw nsw i64 %17, 2
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %1
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, %15
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  store double %30, double* %22, align 8
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv4050.us, i64 %indvars.iv3847.us
  store double %31, double* %32, align 8
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3847.us, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next39.us, %8
  br i1 %exitcond54, label %._crit_edge49.us, label %._crit_edge

._crit_edge:                                      ; preds = %16
  br label %16

._crit_edge49.us:                                 ; preds = %16
  %indvars.iv.next41.us = add nuw nsw i64 %indvars.iv4050.us, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next41.us, %9
  br i1 %exitcond55, label %.preheader.us.preheader.loopexit, label %._crit_edge49.us..preheader35.us_crit_edge

._crit_edge49.us..preheader35.us_crit_edge:       ; preds = %._crit_edge49.us
  br label %.preheader35.us

.preheader.us.preheader.loopexit:                 ; preds = %._crit_edge49.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader35.lr.ph..preheader.us.preheader_crit_edge, %.preheader.us.preheader.loopexit
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv3644.us = phi i64 [ %indvars.iv.next37.us, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %33

; <label>:33:                                     ; preds = %._crit_edge58, %.preheader.us
  %indvars.iv43.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge58 ]
  %34 = mul nuw nsw i64 %indvars.iv43.us, %indvars.iv3644.us
  %35 = add nuw nsw i64 %34, 3
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %0
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %13
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3644.us, i64 %indvars.iv43.us
  store double %39, double* %40, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv43.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge58

._crit_edge58:                                    ; preds = %33
  br label %33

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next37.us = add nuw nsw i64 %indvars.iv3644.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next37.us, %9
  br i1 %exitcond, label %._crit_edge46.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge46.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %.._crit_edge46_crit_edge, %._crit_edge46.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader35.lr.ph, label %.._crit_edge57_crit_edge

.._crit_edge57_crit_edge:                         ; preds = %7
  br label %._crit_edge57

.preheader35.lr.ph:                               ; preds = %7
  %11 = icmp sgt i32 %1, 0
  br i1 %11, label %.preheader35.us.preheader, label %.preheader35.preheader

.preheader35.preheader:                           ; preds = %.preheader35.lr.ph
  %12 = insertelement <2 x double> undef, double %3, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x double> undef, double %3, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert72 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat73 = shufflevector <2 x double> %broadcast.splatinsert72, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader35

.preheader35.us.preheader:                        ; preds = %.preheader35.lr.ph
  %broadcast.splatinsert116 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat117 = shufflevector <2 x double> %broadcast.splatinsert116, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %3, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %3, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert141 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat142 = shufflevector <2 x double> %broadcast.splatinsert141, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %._crit_edge.us..preheader35.us_crit_edge, %.preheader35.us.preheader
  %indvars.iv = phi i2 [ 1, %.preheader35.us.preheader ], [ %indvars.iv.next, %._crit_edge.us..preheader35.us_crit_edge ]
  %indvars.iv4655.us = phi i64 [ 1, %.preheader35.us.preheader ], [ %indvars.iv.next47.us, %._crit_edge.us..preheader35.us_crit_edge ]
  %indvars.iv4853.us = phi i64 [ 0, %.preheader35.us.preheader ], [ %25, %._crit_edge.us..preheader35.us_crit_edge ]
  %20 = zext i2 %indvars.iv to i64
  %21 = add nsw i64 %indvars.iv4853.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 0
  %22 = mul i64 %indvars.iv4853.us, 1201
  %23 = add i64 %22, 1
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %23
  %24 = add nuw nsw i64 %indvars.iv4853.us, 1
  %25 = add nuw nsw i64 %indvars.iv4853.us, 1
  %xtraiter = and i64 %25, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader35.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader35.us..prol.loopexit_crit_edge:         ; preds = %.preheader35.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader35.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv50.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 %indvars.iv50.us.prol
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %3
  store double %28, double* %26, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv50.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader35.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv50.us.unr = phi i64 [ 0, %.preheader35.us..prol.loopexit_crit_edge ], [ %20, %.prol.loopexit.loopexit ]
  %29 = icmp ult i64 %indvars.iv4853.us, 3
  br i1 %29, label %.prol.loopexit..preheader.us.preheader_crit_edge, label %.preheader35.us.new.preheader

.prol.loopexit..preheader.us.preheader_crit_edge: ; preds = %.prol.loopexit
  br label %.preheader.us.preheader

.preheader35.us.new.preheader:                    ; preds = %.prol.loopexit
  %30 = sub i64 %21, %indvars.iv50.us.unr
  %31 = lshr i64 %30, 2
  %32 = add nuw nsw i64 %31, 1
  %min.iters.check121 = icmp ult i64 %32, 2
  br i1 %min.iters.check121, label %.preheader35.us.new.preheader..preheader35.us.new.preheader144_crit_edge, label %min.iters.checked122

.preheader35.us.new.preheader..preheader35.us.new.preheader144_crit_edge: ; preds = %.preheader35.us.new.preheader
  br label %.preheader35.us.new.preheader144

min.iters.checked122:                             ; preds = %.preheader35.us.new.preheader
  %n.mod.vf123 = and i64 %32, 1
  %n.vec124 = sub nsw i64 %32, %n.mod.vf123
  %cmp.zero125 = icmp eq i64 %n.vec124, 0
  %33 = or i64 %indvars.iv50.us.unr, 4
  %34 = shl nuw i64 %31, 2
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf123, 2
  %ind.end130 = sub i64 %35, %36
  br i1 %cmp.zero125, label %min.iters.checked122..preheader35.us.new.preheader144_crit_edge, label %vector.ph126

min.iters.checked122..preheader35.us.new.preheader144_crit_edge: ; preds = %min.iters.checked122
  br label %.preheader35.us.new.preheader144

vector.ph126:                                     ; preds = %min.iters.checked122
  br label %vector.body118

vector.body118:                                   ; preds = %vector.body118.vector.body118_crit_edge, %vector.ph126
  %index127 = phi i64 [ 0, %vector.ph126 ], [ %index.next128, %vector.body118.vector.body118_crit_edge ]
  %37 = shl i64 %index127, 2
  %38 = or i64 %indvars.iv50.us.unr, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 %38
  %40 = bitcast double* %39 to <8 x double>*
  %wide.vec136 = load <8 x double>, <8 x double>* %40, align 8
  %strided.vec137 = shufflevector <8 x double> %wide.vec136, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec138 = shufflevector <8 x double> %wide.vec136, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec139 = shufflevector <8 x double> %wide.vec136, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec140 = shufflevector <8 x double> %wide.vec136, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %41 = fmul <2 x double> %strided.vec137, %broadcast.splat142
  %42 = fmul <2 x double> %strided.vec138, %broadcast.splat142
  %43 = fmul <2 x double> %strided.vec139, %broadcast.splat142
  %44 = add nsw i64 %38, 3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 %44
  %46 = fmul <2 x double> %strided.vec140, %broadcast.splat142
  %47 = getelementptr double, double* %45, i64 -3
  %48 = bitcast double* %47 to <8 x double>*
  %49 = shufflevector <2 x double> %41, <2 x double> %42, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %50 = shufflevector <2 x double> %43, <2 x double> %46, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec143 = shufflevector <4 x double> %49, <4 x double> %50, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec143, <8 x double>* %48, align 8
  %index.next128 = add i64 %index127, 2
  %51 = icmp eq i64 %index.next128, %n.vec124
  br i1 %51, label %middle.block119, label %vector.body118.vector.body118_crit_edge, !llvm.loop !3

vector.body118.vector.body118_crit_edge:          ; preds = %vector.body118
  br label %vector.body118

middle.block119:                                  ; preds = %vector.body118
  %cmp.n131 = icmp eq i64 %n.mod.vf123, 0
  br i1 %cmp.n131, label %middle.block119..preheader.us.preheader_crit_edge, label %middle.block119..preheader35.us.new.preheader144_crit_edge

middle.block119..preheader35.us.new.preheader144_crit_edge: ; preds = %middle.block119
  br label %.preheader35.us.new.preheader144

middle.block119..preheader.us.preheader_crit_edge: ; preds = %middle.block119
  br label %.preheader.us.preheader

.preheader35.us.new.preheader144:                 ; preds = %middle.block119..preheader35.us.new.preheader144_crit_edge, %min.iters.checked122..preheader35.us.new.preheader144_crit_edge, %.preheader35.us.new.preheader..preheader35.us.new.preheader144_crit_edge
  %indvars.iv50.us.ph = phi i64 [ %indvars.iv50.us.unr, %min.iters.checked122..preheader35.us.new.preheader144_crit_edge ], [ %indvars.iv50.us.unr, %.preheader35.us.new.preheader..preheader35.us.new.preheader144_crit_edge ], [ %ind.end130, %middle.block119..preheader35.us.new.preheader144_crit_edge ]
  br label %.preheader35.us.new

.preheader35.us.new:                              ; preds = %.preheader35.us.new..preheader35.us.new_crit_edge, %.preheader35.us.new.preheader144
  %indvars.iv50.us = phi i64 [ %indvars.iv.next.us.3, %.preheader35.us.new..preheader35.us.new_crit_edge ], [ %indvars.iv50.us.ph, %.preheader35.us.new.preheader144 ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 %indvars.iv50.us
  %53 = bitcast double* %52 to <2 x double>*
  %54 = load <2 x double>, <2 x double>* %53, align 8
  %55 = fmul <2 x double> %54, %17
  %56 = bitcast double* %52 to <2 x double>*
  store <2 x double> %55, <2 x double>* %56, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv50.us, 2
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 %indvars.iv.next.us.1
  %58 = bitcast double* %57 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, %19
  %61 = bitcast double* %57 to <2 x double>*
  store <2 x double> %60, <2 x double>* %61, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv50.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv4655.us
  br i1 %exitcond.us.3, label %.preheader.us.preheader.loopexit, label %.preheader35.us.new..preheader35.us.new_crit_edge, !llvm.loop !6

.preheader35.us.new..preheader35.us.new_crit_edge: ; preds = %.preheader35.us.new
  br label %.preheader35.us.new

.preheader.us.preheader.loopexit:                 ; preds = %.preheader35.us.new
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %middle.block119..preheader.us.preheader_crit_edge, %.prol.loopexit..preheader.us.preheader_crit_edge, %.preheader.us.preheader.loopexit
  %min.iters.check77 = icmp ult i64 %24, 2
  %n.vec80 = and i64 %24, -2
  %cmp.zero81 = icmp eq i64 %n.vec80, 0
  %cmp.n112 = icmp eq i64 %24, %n.vec80
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv4452.us = phi i64 [ %indvars.iv.next45.us, %.loopexit..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep86 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv4452.us
  %62 = add nuw nsw i64 %indvars.iv4452.us, 1
  %scevgep88 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv4853.us, i64 %62
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv4452.us
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv4853.us, i64 %62
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv4853.us, i64 %indvars.iv4452.us
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4853.us, i64 %indvars.iv4452.us
  br i1 %min.iters.check77, label %.preheader.us.scalar.ph76.preheader_crit_edge, label %min.iters.checked78

.preheader.us.scalar.ph76.preheader_crit_edge:    ; preds = %.preheader.us
  br label %scalar.ph76.preheader

min.iters.checked78:                              ; preds = %.preheader.us
  br i1 %cmp.zero81, label %min.iters.checked78.scalar.ph76.preheader_crit_edge, label %vector.memcheck

min.iters.checked78.scalar.ph76.preheader_crit_edge: ; preds = %min.iters.checked78
  br label %scalar.ph76.preheader

vector.memcheck:                                  ; preds = %min.iters.checked78
  %bound0 = icmp ult double* %scevgep, %64
  %bound1 = icmp ult double* %64, %scevgep84
  %found.conflict = and i1 %bound0, %bound1
  %bound095 = icmp ult double* %scevgep, %scevgep88
  %bound196 = icmp ult double* %scevgep86, %scevgep84
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx = or i1 %found.conflict, %found.conflict97
  %bound098 = icmp ult double* %scevgep, %scevgep92
  %bound199 = icmp ult double* %scevgep90, %scevgep84
  %found.conflict100 = and i1 %bound098, %bound199
  %conflict.rdx101 = or i1 %conflict.rdx, %found.conflict100
  %bound0104 = icmp ult double* %scevgep, %63
  %bound1105 = icmp ult double* %63, %scevgep84
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx107 = or i1 %conflict.rdx101, %found.conflict106
  br i1 %conflict.rdx107, label %vector.memcheck.scalar.ph76.preheader_crit_edge, label %vector.ph108

vector.memcheck.scalar.ph76.preheader_crit_edge:  ; preds = %vector.memcheck
  br label %scalar.ph76.preheader

vector.ph108:                                     ; preds = %vector.memcheck
  %65 = load double, double* %63, align 8, !alias.scope !8
  %66 = insertelement <2 x double> undef, double %65, i32 0
  %67 = shufflevector <2 x double> %66, <2 x double> undef, <2 x i32> zeroinitializer
  %68 = load double, double* %64, align 8, !alias.scope !11
  %69 = insertelement <2 x double> undef, double %68, i32 0
  %70 = shufflevector <2 x double> %69, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74.vector.body74_crit_edge, %vector.ph108
  %index109 = phi i64 [ 0, %vector.ph108 ], [ %index.next110, %vector.body74.vector.body74_crit_edge ]
  %71 = or i64 %index109, 1
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index109, i64 %indvars.iv4452.us
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %71, i64 %indvars.iv4452.us
  %74 = load double, double* %72, align 8, !alias.scope !13
  %75 = load double, double* %73, align 8, !alias.scope !13
  %76 = insertelement <2 x double> undef, double %74, i32 0
  %77 = insertelement <2 x double> %76, double %75, i32 1
  %78 = fmul <2 x double> %77, %broadcast.splat117
  %79 = fmul <2 x double> %78, %67
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index109, i64 %indvars.iv4452.us
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %71, i64 %indvars.iv4452.us
  %82 = load double, double* %80, align 8, !alias.scope !15
  %83 = load double, double* %81, align 8, !alias.scope !15
  %84 = insertelement <2 x double> undef, double %82, i32 0
  %85 = insertelement <2 x double> %84, double %83, i32 1
  %86 = fmul <2 x double> %85, %broadcast.splat117
  %87 = fmul <2 x double> %86, %70
  %88 = fadd <2 x double> %79, %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 %index109
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !17, !noalias !19
  %91 = fadd <2 x double> %wide.load, %88
  %92 = bitcast double* %89 to <2 x double>*
  store <2 x double> %91, <2 x double>* %92, align 8, !alias.scope !17, !noalias !19
  %index.next110 = add i64 %index109, 2
  %93 = icmp eq i64 %index.next110, %n.vec80
  br i1 %93, label %middle.block75, label %vector.body74.vector.body74_crit_edge, !llvm.loop !20

vector.body74.vector.body74_crit_edge:            ; preds = %vector.body74
  br label %vector.body74

middle.block75:                                   ; preds = %vector.body74
  br i1 %cmp.n112, label %middle.block75..loopexit_crit_edge, label %middle.block75.scalar.ph76.preheader_crit_edge

middle.block75.scalar.ph76.preheader_crit_edge:   ; preds = %middle.block75
  br label %scalar.ph76.preheader

middle.block75..loopexit_crit_edge:               ; preds = %middle.block75
  br label %.loopexit

scalar.ph76.preheader:                            ; preds = %middle.block75.scalar.ph76.preheader_crit_edge, %vector.memcheck.scalar.ph76.preheader_crit_edge, %min.iters.checked78.scalar.ph76.preheader_crit_edge, %.preheader.us.scalar.ph76.preheader_crit_edge
  %indvars.iv3851.us.ph = phi i64 [ 0, %vector.memcheck.scalar.ph76.preheader_crit_edge ], [ 0, %min.iters.checked78.scalar.ph76.preheader_crit_edge ], [ 0, %.preheader.us.scalar.ph76.preheader_crit_edge ], [ %n.vec80, %middle.block75.scalar.ph76.preheader_crit_edge ]
  br label %scalar.ph76

scalar.ph76:                                      ; preds = %scalar.ph76.scalar.ph76_crit_edge, %scalar.ph76.preheader
  %indvars.iv3851.us = phi i64 [ %indvars.iv.next39.us, %scalar.ph76.scalar.ph76_crit_edge ], [ %indvars.iv3851.us.ph, %scalar.ph76.preheader ]
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv3851.us, i64 %indvars.iv4452.us
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, %2
  %97 = load double, double* %63, align 8
  %98 = fmul double %96, %97
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv3851.us, i64 %indvars.iv4452.us
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %2
  %102 = load double, double* %64, align 8
  %103 = fmul double %101, %102
  %104 = fadd double %98, %103
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853.us, i64 %indvars.iv3851.us
  %106 = load double, double* %105, align 8
  %107 = fadd double %106, %104
  store double %107, double* %105, align 8
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3851.us, 1
  %exitcond43.us = icmp eq i64 %indvars.iv.next39.us, %indvars.iv4655.us
  br i1 %exitcond43.us, label %.loopexit.loopexit, label %scalar.ph76.scalar.ph76_crit_edge, !llvm.loop !21

scalar.ph76.scalar.ph76_crit_edge:                ; preds = %scalar.ph76
  br label %scalar.ph76

.loopexit.loopexit:                               ; preds = %scalar.ph76
  br label %.loopexit

.loopexit:                                        ; preds = %middle.block75..loopexit_crit_edge, %.loopexit.loopexit
  %indvars.iv.next45.us = add nuw nsw i64 %indvars.iv4452.us, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next45.us, %8
  br i1 %exitcond59, label %._crit_edge.us, label %.loopexit..preheader.us_crit_edge

.loopexit..preheader.us_crit_edge:                ; preds = %.loopexit
  br label %.preheader.us

._crit_edge.us:                                   ; preds = %.loopexit
  %indvars.iv.next47.us = add nuw nsw i64 %indvars.iv4655.us, 1
  %exitcond60 = icmp eq i64 %25, %9
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond60, label %._crit_edge57.loopexit, label %._crit_edge.us..preheader35.us_crit_edge

._crit_edge.us..preheader35.us_crit_edge:         ; preds = %._crit_edge.us
  br label %.preheader35.us

.preheader35:                                     ; preds = %.preheader34..preheader35_crit_edge, %.preheader35.preheader
  %indvars.iv147 = phi i2 [ 1, %.preheader35.preheader ], [ %indvars.iv.next148, %.preheader34..preheader35_crit_edge ]
  %indvars.iv4655 = phi i64 [ 1, %.preheader35.preheader ], [ %indvars.iv.next47, %.preheader34..preheader35_crit_edge ]
  %indvars.iv4853 = phi i64 [ 0, %.preheader35.preheader ], [ %110, %.preheader34..preheader35_crit_edge ]
  %108 = zext i2 %indvars.iv147 to i64
  %109 = add nsw i64 %indvars.iv4853, -3
  %110 = add nuw nsw i64 %indvars.iv4853, 1
  %xtraiter63 = and i64 %110, 3
  %lcmp.mod64 = icmp eq i64 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.preheader35..prol.loopexit62_crit_edge, label %.prol.preheader61.preheader

.preheader35..prol.loopexit62_crit_edge:          ; preds = %.preheader35
  br label %.prol.loopexit62

.prol.preheader61.preheader:                      ; preds = %.preheader35
  br label %.prol.preheader61

.prol.preheader61:                                ; preds = %.prol.preheader61..prol.preheader61_crit_edge, %.prol.preheader61.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader61..prol.preheader61_crit_edge ], [ 0, %.prol.preheader61.preheader ]
  %prol.iter65 = phi i64 [ %prol.iter65.sub, %.prol.preheader61..prol.preheader61_crit_edge ], [ %xtraiter63, %.prol.preheader61.preheader ]
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853, i64 %indvars.iv50.prol
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, %3
  store double %113, double* %111, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter65.sub = add nsw i64 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i64 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %.prol.loopexit62.loopexit, label %.prol.preheader61..prol.preheader61_crit_edge, !llvm.loop !22

.prol.preheader61..prol.preheader61_crit_edge:    ; preds = %.prol.preheader61
  br label %.prol.preheader61

.prol.loopexit62.loopexit:                        ; preds = %.prol.preheader61
  br label %.prol.loopexit62

.prol.loopexit62:                                 ; preds = %.preheader35..prol.loopexit62_crit_edge, %.prol.loopexit62.loopexit
  %indvars.iv50.unr = phi i64 [ 0, %.preheader35..prol.loopexit62_crit_edge ], [ %108, %.prol.loopexit62.loopexit ]
  %114 = icmp ult i64 %indvars.iv4853, 3
  br i1 %114, label %.prol.loopexit62..preheader34_crit_edge, label %.preheader35.new.preheader

.prol.loopexit62..preheader34_crit_edge:          ; preds = %.prol.loopexit62
  br label %.preheader34

.preheader35.new.preheader:                       ; preds = %.prol.loopexit62
  %115 = sub i64 %109, %indvars.iv50.unr
  %116 = lshr i64 %115, 2
  %117 = add nuw nsw i64 %116, 1
  %min.iters.check = icmp ult i64 %117, 2
  br i1 %min.iters.check, label %.preheader35.new.preheader..preheader35.new.preheader145_crit_edge, label %min.iters.checked

.preheader35.new.preheader..preheader35.new.preheader145_crit_edge: ; preds = %.preheader35.new.preheader
  br label %.preheader35.new.preheader145

min.iters.checked:                                ; preds = %.preheader35.new.preheader
  %n.mod.vf = and i64 %117, 1
  %n.vec = sub nsw i64 %117, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %118 = or i64 %indvars.iv50.unr, 4
  %119 = shl nuw i64 %116, 2
  %120 = add i64 %118, %119
  %121 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %120, %121
  br i1 %cmp.zero, label %min.iters.checked..preheader35.new.preheader145_crit_edge, label %vector.ph

min.iters.checked..preheader35.new.preheader145_crit_edge: ; preds = %min.iters.checked
  br label %.preheader35.new.preheader145

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %122 = shl i64 %index, 2
  %123 = or i64 %indvars.iv50.unr, %122
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853, i64 %123
  %125 = bitcast double* %124 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %125, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec69 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec70 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec71 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %126 = fmul <2 x double> %strided.vec, %broadcast.splat73
  %127 = fmul <2 x double> %strided.vec69, %broadcast.splat73
  %128 = fmul <2 x double> %strided.vec70, %broadcast.splat73
  %129 = add nsw i64 %123, 3
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853, i64 %129
  %131 = fmul <2 x double> %strided.vec71, %broadcast.splat73
  %132 = getelementptr double, double* %130, i64 -3
  %133 = bitcast double* %132 to <8 x double>*
  %134 = shufflevector <2 x double> %126, <2 x double> %127, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %135 = shufflevector <2 x double> %128, <2 x double> %131, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %134, <4 x double> %135, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %133, align 8
  %index.next = add i64 %index, 2
  %136 = icmp eq i64 %index.next, %n.vec
  br i1 %136, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !23

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader34_crit_edge, label %middle.block..preheader35.new.preheader145_crit_edge

middle.block..preheader35.new.preheader145_crit_edge: ; preds = %middle.block
  br label %.preheader35.new.preheader145

middle.block..preheader34_crit_edge:              ; preds = %middle.block
  br label %.preheader34

.preheader35.new.preheader145:                    ; preds = %middle.block..preheader35.new.preheader145_crit_edge, %min.iters.checked..preheader35.new.preheader145_crit_edge, %.preheader35.new.preheader..preheader35.new.preheader145_crit_edge
  %indvars.iv50.ph = phi i64 [ %indvars.iv50.unr, %min.iters.checked..preheader35.new.preheader145_crit_edge ], [ %indvars.iv50.unr, %.preheader35.new.preheader..preheader35.new.preheader145_crit_edge ], [ %ind.end, %middle.block..preheader35.new.preheader145_crit_edge ]
  br label %.preheader35.new

.preheader35.new:                                 ; preds = %.preheader35.new..preheader35.new_crit_edge, %.preheader35.new.preheader145
  %indvars.iv50 = phi i64 [ %indvars.iv.next.3, %.preheader35.new..preheader35.new_crit_edge ], [ %indvars.iv50.ph, %.preheader35.new.preheader145 ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853, i64 %indvars.iv50
  %138 = bitcast double* %137 to <2 x double>*
  %139 = load <2 x double>, <2 x double>* %138, align 8
  %140 = fmul <2 x double> %139, %13
  %141 = bitcast double* %137 to <2 x double>*
  store <2 x double> %140, <2 x double>* %141, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv50, 2
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4853, i64 %indvars.iv.next.1
  %143 = bitcast double* %142 to <2 x double>*
  %144 = load <2 x double>, <2 x double>* %143, align 8
  %145 = fmul <2 x double> %144, %15
  %146 = bitcast double* %142 to <2 x double>*
  store <2 x double> %145, <2 x double>* %146, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv50, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv4655
  br i1 %exitcond.3, label %.preheader34.loopexit, label %.preheader35.new..preheader35.new_crit_edge, !llvm.loop !24

.preheader35.new..preheader35.new_crit_edge:      ; preds = %.preheader35.new
  br label %.preheader35.new

.preheader34.loopexit:                            ; preds = %.preheader35.new
  br label %.preheader34

.preheader34:                                     ; preds = %middle.block..preheader34_crit_edge, %.prol.loopexit62..preheader34_crit_edge, %.preheader34.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4655, 1
  %exitcond = icmp eq i64 %110, %9
  %indvars.iv.next148 = add i2 %indvars.iv147, 1
  br i1 %exitcond, label %._crit_edge57.loopexit146, label %.preheader34..preheader35_crit_edge

.preheader34..preheader35_crit_edge:              ; preds = %.preheader34
  br label %.preheader35

._crit_edge57.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge57

._crit_edge57.loopexit146:                        ; preds = %.preheader34
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %.._crit_edge57_crit_edge, %._crit_edge57.loopexit146, %._crit_edge57.loopexit
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
  br i1 %8, label %.preheader.us.preheader, label %.._crit_edge17_crit_edge

.._crit_edge17_crit_edge:                         ; preds = %2
  br label %._crit_edge17

.preheader.us.preheader:                          ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv1115.us = phi i64 [ %indvars.iv.next12.us, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %9 = mul nsw i64 %indvars.iv1115.us, %7
  br label %10

; <label>:10:                                     ; preds = %._crit_edge19, %.preheader.us
  %indvars.iv14.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge19 ]
  %11 = add nsw i64 %indvars.iv14.us, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %10
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %15
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1115.us, i64 %indvars.iv14.us
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge19

._crit_edge19:                                    ; preds = %17
  br label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1115.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next12.us, %7
  br i1 %exitcond, label %._crit_edge17.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %.._crit_edge17_crit_edge, %._crit_edge17.loopexit
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !7, !4, !5}
