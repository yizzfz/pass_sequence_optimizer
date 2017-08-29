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
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge1

._crit_edge1:                                     ; preds = %14
  br label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %._crit_edge1, %._crit_edge, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
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
  br i1 %10, label %.preheader4.lr.ph, label %.._crit_edge15_crit_edge

.._crit_edge15_crit_edge:                         ; preds = %7
  br label %._crit_edge15

.preheader4.lr.ph:                                ; preds = %7
  %11 = icmp sgt i32 %1, 0
  %12 = sitofp i32 %0 to double
  %13 = sitofp i32 %1 to double
  br i1 %11, label %.preheader4.us.preheader, label %.preheader4.lr.ph..preheader.us.preheader_crit_edge

.preheader4.lr.ph..preheader.us.preheader_crit_edge: ; preds = %.preheader4.lr.ph
  br label %.preheader.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge18.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv919.us = phi i64 [ %indvars.iv.next10.us, %._crit_edge18.us..preheader4.us_crit_edge ], [ 0, %.preheader4.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv716.us = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next8.us, %._crit_edge ]
  %15 = mul nuw nsw i64 %indvars.iv716.us, %indvars.iv919.us
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %12
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv919.us, i64 %indvars.iv716.us
  store double %20, double* %21, align 8
  %22 = add nuw nsw i64 %15, 2
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %13
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv919.us, i64 %indvars.iv716.us
  store double %26, double* %27, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv716.us, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next8.us, %8
  br i1 %exitcond23, label %._crit_edge18.us, label %._crit_edge

._crit_edge:                                      ; preds = %14
  br label %14

._crit_edge18.us:                                 ; preds = %14
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv919.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next10.us, %9
  br i1 %exitcond24, label %.preheader3, label %._crit_edge18.us..preheader4.us_crit_edge

._crit_edge18.us..preheader4.us_crit_edge:        ; preds = %._crit_edge18.us
  br label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge18.us
  %28 = icmp sgt i32 %0, 0
  br i1 %28, label %.preheader3..preheader.us.preheader_crit_edge, label %.preheader3.._crit_edge15_crit_edge

.preheader3.._crit_edge15_crit_edge:              ; preds = %.preheader3
  br label %._crit_edge15

.preheader3..preheader.us.preheader_crit_edge:    ; preds = %.preheader3
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader3..preheader.us.preheader_crit_edge, %.preheader4.lr.ph..preheader.us.preheader_crit_edge
  %wide.trip.count = zext i32 %0 to i64
  %29 = sitofp i32 %1 to double
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv513.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %30

; <label>:30:                                     ; preds = %._crit_edge27, %.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge27 ]
  %31 = mul nuw nsw i64 %indvars.iv12.us, %indvars.iv513.us
  %32 = add nuw nsw i64 %31, 3
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %29
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv513.us, i64 %indvars.iv12.us
  store double %36, double* %37, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge27

._crit_edge27:                                    ; preds = %30
  br label %30

._crit_edge.us:                                   ; preds = %30
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv513.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next6.us, %9
  br i1 %exitcond, label %._crit_edge15.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader3.._crit_edge15_crit_edge, %.._crit_edge15_crit_edge, %._crit_edge15.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader4.lr.ph, label %.._crit_edge26_crit_edge

.._crit_edge26_crit_edge:                         ; preds = %7
  br label %._crit_edge26

.preheader4.lr.ph:                                ; preds = %7
  %11 = icmp sgt i32 %1, 0
  br i1 %11, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %broadcast.splatinsert41 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat42 = shufflevector <2 x double> %broadcast.splatinsert41, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %broadcast.splatinsert85 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat86 = shufflevector <2 x double> %broadcast.splatinsert85, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat111 = shufflevector <2 x double> %broadcast.splatinsert110, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv1524.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge.us..preheader4.us_crit_edge ], [ 1, %.preheader4.us.preheader ]
  %indvars.iv1722.us = phi i64 [ %indvars.iv.next18.us, %._crit_edge.us..preheader4.us_crit_edge ], [ 0, %.preheader4.us.preheader ]
  %12 = add i64 %indvars.iv1722.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 0
  %13 = mul i64 %indvars.iv1722.us, 1201
  %14 = add i64 %13, 1
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %14
  %15 = add i64 %indvars.iv1722.us, 1
  %16 = add i64 %indvars.iv1722.us, 1
  %xtraiter = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader4.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader4.us..prol.loopexit_crit_edge:          ; preds = %.preheader4.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader4.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us.prol
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  store double %19, double* %17, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader4.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader4.us..prol.loopexit_crit_edge ], [ %indvars.iv.next.us.prol, %.prol.loopexit.loopexit ]
  %20 = icmp ult i64 %indvars.iv1722.us, 3
  br i1 %20, label %.prol.loopexit..preheader.us.preheader_crit_edge, label %.preheader4.us.new.preheader

.prol.loopexit..preheader.us.preheader_crit_edge: ; preds = %.prol.loopexit
  br label %.preheader.us.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit
  %21 = sub i64 %12, %indvars.iv19.us.unr
  %22 = lshr i64 %21, 2
  %23 = add nuw nsw i64 %22, 1
  %min.iters.check90 = icmp ult i64 %23, 2
  br i1 %min.iters.check90, label %.preheader4.us.new.preheader..preheader4.us.new.preheader113_crit_edge, label %min.iters.checked91

.preheader4.us.new.preheader..preheader4.us.new.preheader113_crit_edge: ; preds = %.preheader4.us.new.preheader
  br label %.preheader4.us.new.preheader113

min.iters.checked91:                              ; preds = %.preheader4.us.new.preheader
  %n.mod.vf92 = and i64 %23, 1
  %n.vec93 = sub nsw i64 %23, %n.mod.vf92
  %cmp.zero94 = icmp eq i64 %n.vec93, 0
  %24 = add i64 %indvars.iv19.us.unr, 4
  %25 = shl nuw i64 %22, 2
  %26 = add i64 %24, %25
  %27 = shl nuw nsw i64 %n.mod.vf92, 2
  %ind.end99 = sub i64 %26, %27
  br i1 %cmp.zero94, label %min.iters.checked91..preheader4.us.new.preheader113_crit_edge, label %vector.ph95

min.iters.checked91..preheader4.us.new.preheader113_crit_edge: ; preds = %min.iters.checked91
  br label %.preheader4.us.new.preheader113

vector.ph95:                                      ; preds = %min.iters.checked91
  br label %vector.body87

vector.body87:                                    ; preds = %vector.body87.vector.body87_crit_edge, %vector.ph95
  %index96 = phi i64 [ 0, %vector.ph95 ], [ %index.next97, %vector.body87.vector.body87_crit_edge ]
  %28 = shl i64 %index96, 2
  %29 = add i64 %indvars.iv19.us.unr, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %29
  %31 = bitcast double* %30 to <8 x double>*
  %wide.vec105 = load <8 x double>, <8 x double>* %31, align 8
  %strided.vec106 = shufflevector <8 x double> %wide.vec105, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec107 = shufflevector <8 x double> %wide.vec105, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec108 = shufflevector <8 x double> %wide.vec105, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec109 = shufflevector <8 x double> %wide.vec105, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %32 = fmul <2 x double> %strided.vec106, %broadcast.splat111
  %33 = fmul <2 x double> %strided.vec107, %broadcast.splat111
  %34 = fmul <2 x double> %strided.vec108, %broadcast.splat111
  %35 = add nsw i64 %29, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %35
  %37 = fmul <2 x double> %strided.vec109, %broadcast.splat111
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %32, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %34, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec112 = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec112, <8 x double>* %39, align 8
  %index.next97 = add i64 %index96, 2
  %42 = icmp eq i64 %index.next97, %n.vec93
  br i1 %42, label %middle.block88, label %vector.body87.vector.body87_crit_edge, !llvm.loop !3

vector.body87.vector.body87_crit_edge:            ; preds = %vector.body87
  br label %vector.body87

middle.block88:                                   ; preds = %vector.body87
  %cmp.n100 = icmp eq i64 %n.mod.vf92, 0
  br i1 %cmp.n100, label %middle.block88..preheader.us.preheader_crit_edge, label %middle.block88..preheader4.us.new.preheader113_crit_edge

middle.block88..preheader4.us.new.preheader113_crit_edge: ; preds = %middle.block88
  br label %.preheader4.us.new.preheader113

middle.block88..preheader.us.preheader_crit_edge: ; preds = %middle.block88
  br label %.preheader.us.preheader

.preheader4.us.new.preheader113:                  ; preds = %middle.block88..preheader4.us.new.preheader113_crit_edge, %min.iters.checked91..preheader4.us.new.preheader113_crit_edge, %.preheader4.us.new.preheader..preheader4.us.new.preheader113_crit_edge
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked91..preheader4.us.new.preheader113_crit_edge ], [ %indvars.iv19.us.unr, %.preheader4.us.new.preheader..preheader4.us.new.preheader113_crit_edge ], [ %ind.end99, %middle.block88..preheader4.us.new.preheader113_crit_edge ]
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new..preheader4.us.new_crit_edge, %.preheader4.us.new.preheader113
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader4.us.new..preheader4.us.new_crit_edge ], [ %indvars.iv19.us.ph, %.preheader4.us.new.preheader113 ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %3
  store double %45, double* %43, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %3
  store double %48, double* %46, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us.1
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %3
  store double %51, double* %49, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv19.us, 3
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %3
  store double %54, double* %52, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1524.us
  br i1 %exitcond.us.3, label %.preheader.us.preheader.loopexit, label %.preheader4.us.new..preheader4.us.new_crit_edge, !llvm.loop !6

.preheader4.us.new..preheader4.us.new_crit_edge:  ; preds = %.preheader4.us.new
  br label %.preheader4.us.new

.preheader.us.preheader.loopexit:                 ; preds = %.preheader4.us.new
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %middle.block88..preheader.us.preheader_crit_edge, %.prol.loopexit..preheader.us.preheader_crit_edge, %.preheader.us.preheader.loopexit
  %min.iters.check46 = icmp ult i64 %15, 2
  %n.vec49 = and i64 %15, -2
  %cmp.zero50 = icmp eq i64 %n.vec49, 0
  %cmp.n81 = icmp eq i64 %15, %n.vec49
  br label %.preheader.us

scalar.ph45:                                      ; preds = %scalar.ph45.scalar.ph45_crit_edge, %scalar.ph45.preheader
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us, %scalar.ph45.scalar.ph45_crit_edge ], [ %indvars.iv720.us.ph, %scalar.ph45.preheader ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %70, align 8
  %59 = fmul double %57, %58
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %2
  %63 = load double, double* %71, align 8
  %64 = fmul double %62, %63
  %65 = fadd double %59, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv720.us
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %exitcond12.us = icmp eq i64 %indvars.iv.next8.us, %indvars.iv1524.us
  br i1 %exitcond12.us, label %.loopexit.loopexit, label %scalar.ph45.scalar.ph45_crit_edge, !llvm.loop !8

scalar.ph45.scalar.ph45_crit_edge:                ; preds = %scalar.ph45
  br label %scalar.ph45

.loopexit.loopexit:                               ; preds = %scalar.ph45
  br label %.loopexit

.loopexit:                                        ; preds = %middle.block44..loopexit_crit_edge, %.loopexit.loopexit
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1321.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next14.us, %8
  br i1 %exitcond28, label %._crit_edge.us, label %.loopexit..preheader.us_crit_edge

.loopexit..preheader.us_crit_edge:                ; preds = %.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv1321.us = phi i64 [ %indvars.iv.next14.us, %.loopexit..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1321.us
  %69 = add i64 %indvars.iv1321.us, 1
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %69
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1321.us
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %69
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  br i1 %min.iters.check46, label %.preheader.us.scalar.ph45.preheader_crit_edge, label %min.iters.checked47

.preheader.us.scalar.ph45.preheader_crit_edge:    ; preds = %.preheader.us
  br label %scalar.ph45.preheader

scalar.ph45.preheader:                            ; preds = %middle.block44.scalar.ph45.preheader_crit_edge, %vector.memcheck.scalar.ph45.preheader_crit_edge, %min.iters.checked47.scalar.ph45.preheader_crit_edge, %.preheader.us.scalar.ph45.preheader_crit_edge
  %indvars.iv720.us.ph = phi i64 [ 0, %vector.memcheck.scalar.ph45.preheader_crit_edge ], [ 0, %min.iters.checked47.scalar.ph45.preheader_crit_edge ], [ 0, %.preheader.us.scalar.ph45.preheader_crit_edge ], [ %n.vec49, %middle.block44.scalar.ph45.preheader_crit_edge ]
  br label %scalar.ph45

min.iters.checked47:                              ; preds = %.preheader.us
  br i1 %cmp.zero50, label %min.iters.checked47.scalar.ph45.preheader_crit_edge, label %vector.memcheck

min.iters.checked47.scalar.ph45.preheader_crit_edge: ; preds = %min.iters.checked47
  br label %scalar.ph45.preheader

vector.memcheck:                                  ; preds = %min.iters.checked47
  %bound0 = icmp ult double* %scevgep, %71
  %bound1 = icmp ult double* %71, %scevgep53
  %found.conflict = and i1 %bound0, %bound1
  %bound064 = icmp ult double* %scevgep, %scevgep57
  %bound165 = icmp ult double* %scevgep55, %scevgep53
  %found.conflict66 = and i1 %bound064, %bound165
  %conflict.rdx = or i1 %found.conflict, %found.conflict66
  %bound067 = icmp ult double* %scevgep, %scevgep61
  %bound168 = icmp ult double* %scevgep59, %scevgep53
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx70 = or i1 %conflict.rdx, %found.conflict69
  %bound073 = icmp ult double* %scevgep, %70
  %bound174 = icmp ult double* %70, %scevgep53
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx76 = or i1 %conflict.rdx70, %found.conflict75
  br i1 %conflict.rdx76, label %vector.memcheck.scalar.ph45.preheader_crit_edge, label %vector.ph77

vector.memcheck.scalar.ph45.preheader_crit_edge:  ; preds = %vector.memcheck
  br label %scalar.ph45.preheader

vector.ph77:                                      ; preds = %vector.memcheck
  br label %vector.body43

vector.body43:                                    ; preds = %vector.body43.vector.body43_crit_edge, %vector.ph77
  %index78 = phi i64 [ 0, %vector.ph77 ], [ %index.next79, %vector.body43.vector.body43_crit_edge ]
  %72 = or i64 %index78, 1
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index78, i64 %indvars.iv1321.us
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %72, i64 %indvars.iv1321.us
  %75 = load double, double* %73, align 8, !alias.scope !9
  %76 = load double, double* %74, align 8, !alias.scope !9
  %77 = insertelement <2 x double> undef, double %75, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fmul <2 x double> %78, %broadcast.splat86
  %80 = load double, double* %70, align 8, !alias.scope !12
  %81 = insertelement <2 x double> undef, double %80, i32 0
  %82 = shufflevector <2 x double> %81, <2 x double> undef, <2 x i32> zeroinitializer
  %83 = fmul <2 x double> %79, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index78, i64 %indvars.iv1321.us
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %72, i64 %indvars.iv1321.us
  %86 = load double, double* %84, align 8, !alias.scope !14
  %87 = load double, double* %85, align 8, !alias.scope !14
  %88 = insertelement <2 x double> undef, double %86, i32 0
  %89 = insertelement <2 x double> %88, double %87, i32 1
  %90 = fmul <2 x double> %89, %broadcast.splat86
  %91 = load double, double* %71, align 8, !alias.scope !16
  %92 = insertelement <2 x double> undef, double %91, i32 0
  %93 = shufflevector <2 x double> %92, <2 x double> undef, <2 x i32> zeroinitializer
  %94 = fmul <2 x double> %90, %93
  %95 = fadd <2 x double> %83, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %index78
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !18, !noalias !20
  %98 = fadd <2 x double> %wide.load, %95
  %99 = bitcast double* %96 to <2 x double>*
  store <2 x double> %98, <2 x double>* %99, align 8, !alias.scope !18, !noalias !20
  %index.next79 = add i64 %index78, 2
  %100 = icmp eq i64 %index.next79, %n.vec49
  br i1 %100, label %middle.block44, label %vector.body43.vector.body43_crit_edge, !llvm.loop !21

vector.body43.vector.body43_crit_edge:            ; preds = %vector.body43
  br label %vector.body43

middle.block44:                                   ; preds = %vector.body43
  br i1 %cmp.n81, label %middle.block44..loopexit_crit_edge, label %middle.block44.scalar.ph45.preheader_crit_edge

middle.block44.scalar.ph45.preheader_crit_edge:   ; preds = %middle.block44
  br label %scalar.ph45.preheader

middle.block44..loopexit_crit_edge:               ; preds = %middle.block44
  br label %.loopexit

._crit_edge.us:                                   ; preds = %.loopexit
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1722.us, 1
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1524.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next18.us, %9
  br i1 %exitcond29, label %._crit_edge26.loopexit, label %._crit_edge.us..preheader4.us_crit_edge

._crit_edge.us..preheader4.us_crit_edge:          ; preds = %._crit_edge.us
  br label %.preheader4.us

.preheader4:                                      ; preds = %.preheader3..preheader4_crit_edge, %.preheader4.preheader
  %indvars.iv1524 = phi i64 [ %indvars.iv.next16, %.preheader3..preheader4_crit_edge ], [ 1, %.preheader4.preheader ]
  %indvars.iv1722 = phi i64 [ %indvars.iv.next18, %.preheader3..preheader4_crit_edge ], [ 0, %.preheader4.preheader ]
  %101 = add i64 %indvars.iv1722, -3
  %102 = add i64 %indvars.iv1722, 1
  %xtraiter33 = and i64 %102, 3
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %.preheader4..prol.loopexit32_crit_edge, label %.prol.preheader31.preheader

.preheader4..prol.loopexit32_crit_edge:           ; preds = %.preheader4
  br label %.prol.loopexit32

.prol.preheader31.preheader:                      ; preds = %.preheader4
  br label %.prol.preheader31

.prol.preheader31:                                ; preds = %.prol.preheader31..prol.preheader31_crit_edge, %.prol.preheader31.preheader
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader31..prol.preheader31_crit_edge ], [ 0, %.prol.preheader31.preheader ]
  %prol.iter35 = phi i64 [ %prol.iter35.sub, %.prol.preheader31..prol.preheader31_crit_edge ], [ %xtraiter33, %.prol.preheader31.preheader ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv19.prol
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %3
  store double %105, double* %103, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter35.sub = add i64 %prol.iter35, -1
  %prol.iter35.cmp = icmp eq i64 %prol.iter35.sub, 0
  br i1 %prol.iter35.cmp, label %.prol.loopexit32.loopexit, label %.prol.preheader31..prol.preheader31_crit_edge, !llvm.loop !22

.prol.preheader31..prol.preheader31_crit_edge:    ; preds = %.prol.preheader31
  br label %.prol.preheader31

.prol.loopexit32.loopexit:                        ; preds = %.prol.preheader31
  br label %.prol.loopexit32

.prol.loopexit32:                                 ; preds = %.preheader4..prol.loopexit32_crit_edge, %.prol.loopexit32.loopexit
  %indvars.iv19.unr = phi i64 [ 0, %.preheader4..prol.loopexit32_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit32.loopexit ]
  %106 = icmp ult i64 %indvars.iv1722, 3
  br i1 %106, label %.prol.loopexit32..preheader3_crit_edge, label %.preheader4.new.preheader

.prol.loopexit32..preheader3_crit_edge:           ; preds = %.prol.loopexit32
  br label %.preheader3

.preheader4.new.preheader:                        ; preds = %.prol.loopexit32
  %107 = sub i64 %101, %indvars.iv19.unr
  %108 = lshr i64 %107, 2
  %109 = add nuw nsw i64 %108, 1
  %min.iters.check = icmp ult i64 %109, 2
  br i1 %min.iters.check, label %.preheader4.new.preheader..preheader4.new.preheader114_crit_edge, label %min.iters.checked

.preheader4.new.preheader..preheader4.new.preheader114_crit_edge: ; preds = %.preheader4.new.preheader
  br label %.preheader4.new.preheader114

min.iters.checked:                                ; preds = %.preheader4.new.preheader
  %n.mod.vf = and i64 %109, 1
  %n.vec = sub nsw i64 %109, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %110 = add i64 %indvars.iv19.unr, 4
  %111 = shl nuw i64 %108, 2
  %112 = add i64 %110, %111
  %113 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %112, %113
  br i1 %cmp.zero, label %min.iters.checked..preheader4.new.preheader114_crit_edge, label %vector.ph

min.iters.checked..preheader4.new.preheader114_crit_edge: ; preds = %min.iters.checked
  br label %.preheader4.new.preheader114

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %114 = shl i64 %index, 2
  %115 = add i64 %indvars.iv19.unr, %114
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %115
  %117 = bitcast double* %116 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %117, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec38 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec39 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec40 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %118 = fmul <2 x double> %strided.vec, %broadcast.splat42
  %119 = fmul <2 x double> %strided.vec38, %broadcast.splat42
  %120 = fmul <2 x double> %strided.vec39, %broadcast.splat42
  %121 = add nsw i64 %115, 3
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %121
  %123 = fmul <2 x double> %strided.vec40, %broadcast.splat42
  %124 = getelementptr double, double* %122, i64 -3
  %125 = bitcast double* %124 to <8 x double>*
  %126 = shufflevector <2 x double> %118, <2 x double> %119, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %127 = shufflevector <2 x double> %120, <2 x double> %123, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %126, <4 x double> %127, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %125, align 8
  %index.next = add i64 %index, 2
  %128 = icmp eq i64 %index.next, %n.vec
  br i1 %128, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !23

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader3_crit_edge, label %middle.block..preheader4.new.preheader114_crit_edge

middle.block..preheader4.new.preheader114_crit_edge: ; preds = %middle.block
  br label %.preheader4.new.preheader114

middle.block..preheader3_crit_edge:               ; preds = %middle.block
  br label %.preheader3

.preheader4.new.preheader114:                     ; preds = %middle.block..preheader4.new.preheader114_crit_edge, %min.iters.checked..preheader4.new.preheader114_crit_edge, %.preheader4.new.preheader..preheader4.new.preheader114_crit_edge
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked..preheader4.new.preheader114_crit_edge ], [ %indvars.iv19.unr, %.preheader4.new.preheader..preheader4.new.preheader114_crit_edge ], [ %ind.end, %middle.block..preheader4.new.preheader114_crit_edge ]
  br label %.preheader4.new

.preheader4.new:                                  ; preds = %.preheader4.new..preheader4.new_crit_edge, %.preheader4.new.preheader114
  %indvars.iv19 = phi i64 [ %indvars.iv.next.3, %.preheader4.new..preheader4.new_crit_edge ], [ %indvars.iv19.ph, %.preheader4.new.preheader114 ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv19
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %3
  store double %131, double* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv.next
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %3
  store double %134, double* %132, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv19, 2
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv.next.1
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv19, 3
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv.next.2
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv19, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1524
  br i1 %exitcond.3, label %.preheader3.loopexit, label %.preheader4.new..preheader4.new_crit_edge, !llvm.loop !24

.preheader4.new..preheader4.new_crit_edge:        ; preds = %.preheader4.new
  br label %.preheader4.new

.preheader3.loopexit:                             ; preds = %.preheader4.new
  br label %.preheader3

.preheader3:                                      ; preds = %middle.block..preheader3_crit_edge, %.prol.loopexit32..preheader3_crit_edge, %.preheader3.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1722, 1
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1524, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next18, %9
  br i1 %exitcond30, label %._crit_edge26.loopexit115, label %.preheader3..preheader4_crit_edge

.preheader3..preheader4_crit_edge:                ; preds = %.preheader3
  br label %.preheader4

._crit_edge26.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge26

._crit_edge26.loopexit115:                        ; preds = %.preheader3
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %.._crit_edge26_crit_edge, %._crit_edge26.loopexit115, %._crit_edge26.loopexit
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
  br i1 %8, label %.preheader.us.preheader, label %.._crit_edge8_crit_edge

.._crit_edge8_crit_edge:                          ; preds = %2
  br label %._crit_edge8

.preheader.us.preheader:                          ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv26.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %9 = mul nsw i64 %indvars.iv26.us, %7
  br label %10

; <label>:10:                                     ; preds = %._crit_edge10, %.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge10 ]
  %11 = add nsw i64 %indvars.iv5.us, %9
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge10

._crit_edge10:                                    ; preds = %17
  br label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, %7
  br i1 %exitcond, label %._crit_edge8.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.._crit_edge8_crit_edge, %._crit_edge8.loopexit
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
