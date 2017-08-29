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
  br label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge1

._crit_edge1:                                     ; preds = %14
  br label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge1, %._crit_edge, %17
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
  br i1 %10, label %.preheader9.preheader.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

.preheader9.preheader.lr.ph:                      ; preds = %7
  %11 = icmp sgt i32 %1, 0
  %12 = sitofp i32 %0 to double
  %13 = sitofp i32 %1 to double
  br i1 %11, label %.preheader9.preheader.us.preheader, label %.preheader9.preheader.lr.ph..preheader.preheader.preheader_crit_edge

.preheader9.preheader.lr.ph..preheader.preheader.preheader_crit_edge: ; preds = %.preheader9.preheader.lr.ph
  br label %.preheader.preheader.preheader

.preheader9.preheader.us.preheader:               ; preds = %.preheader9.preheader.lr.ph
  br label %.preheader9.preheader.us

.preheader9.preheader.us:                         ; preds = %.preheader9._crit_edge.us..preheader9.preheader.us_crit_edge, %.preheader9.preheader.us.preheader
  %indvars.iv717.us = phi i64 [ %indvars.iv.next8.us, %.preheader9._crit_edge.us..preheader9.preheader.us_crit_edge ], [ 0, %.preheader9.preheader.us.preheader ]
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us..preheader9.us_crit_edge, %.preheader9.preheader.us
  %indvars.iv515.us = phi i64 [ 0, %.preheader9.preheader.us ], [ %indvars.iv.next6.us, %.preheader9.us..preheader9.us_crit_edge ]
  %14 = mul nuw nsw i64 %indvars.iv515.us, %indvars.iv717.us
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %12
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv717.us, i64 %indvars.iv515.us
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %14, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %13
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv717.us, i64 %indvars.iv515.us
  store double %25, double* %26, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv515.us, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next6.us, %8
  br i1 %exitcond22, label %.preheader9._crit_edge.us, label %.preheader9.us..preheader9.us_crit_edge

.preheader9.us..preheader9.us_crit_edge:          ; preds = %.preheader9.us
  br label %.preheader9.us

.preheader9._crit_edge.us:                        ; preds = %.preheader9.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv717.us, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next8.us, %9
  br i1 %exitcond23, label %._crit_edge19, label %.preheader9._crit_edge.us..preheader9.preheader.us_crit_edge

.preheader9._crit_edge.us..preheader9.preheader.us_crit_edge: ; preds = %.preheader9._crit_edge.us
  br label %.preheader9.preheader.us

._crit_edge19:                                    ; preds = %.preheader9._crit_edge.us
  %27 = icmp sgt i32 %0, 0
  br i1 %27, label %._crit_edge19..preheader.preheader.preheader_crit_edge, label %._crit_edge19.._crit_edge_crit_edge

._crit_edge19.._crit_edge_crit_edge:              ; preds = %._crit_edge19
  br label %._crit_edge

._crit_edge19..preheader.preheader.preheader_crit_edge: ; preds = %._crit_edge19
  br label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %._crit_edge19..preheader.preheader.preheader_crit_edge, %.preheader9.preheader.lr.ph..preheader.preheader.preheader_crit_edge
  %28 = zext i32 %0 to i64
  %29 = sitofp i32 %1 to double
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv313 = phi i64 [ %indvars.iv.next4, %.preheader._crit_edge..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader..preheader_crit_edge ]
  %30 = mul nuw nsw i64 %indvars.iv12, %indvars.iv313
  %31 = add nuw nsw i64 %30, 3
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %0
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %29
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv313, i64 %indvars.iv12
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %28
  br i1 %exitcond10, label %.preheader._crit_edge, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, %9
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader._crit_edge..preheader.preheader_crit_edge

.preheader._crit_edge..preheader.preheader_crit_edge: ; preds = %.preheader._crit_edge
  br label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader18.preheader.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

.preheader18.preheader.lr.ph:                     ; preds = %7
  %11 = icmp sgt i32 %1, 0
  br i1 %11, label %.preheader18.preheader.us.preheader, label %.preheader18.preheader.preheader

.preheader18.preheader.preheader:                 ; preds = %.preheader18.preheader.lr.ph
  %broadcast.splatinsert39 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat40 = shufflevector <2 x double> %broadcast.splatinsert39, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18.preheader

.preheader18.preheader.us.preheader:              ; preds = %.preheader18.preheader.lr.ph
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert83 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat84 = shufflevector <2 x double> %broadcast.splatinsert83, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18.preheader.us

.preheader18.preheader.us:                        ; preds = %.preheader17._crit_edge.us..preheader18.preheader.us_crit_edge, %.preheader18.preheader.us.preheader
  %indvars.iv1324.us = phi i64 [ %indvars.iv.next14.us, %.preheader17._crit_edge.us..preheader18.preheader.us_crit_edge ], [ 1, %.preheader18.preheader.us.preheader ]
  %indvars.iv1522.us = phi i64 [ %indvars.iv.next16.us, %.preheader17._crit_edge.us..preheader18.preheader.us_crit_edge ], [ 0, %.preheader18.preheader.us.preheader ]
  %12 = add i64 %indvars.iv1522.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 0
  %13 = mul i64 %indvars.iv1522.us, 1201
  %14 = add i64 %13, 1
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %14
  %15 = add i64 %indvars.iv1522.us, 1
  %16 = add nuw nsw i64 %indvars.iv1522.us, 1
  %xtraiter = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader18.preheader.us..preheader18.us.prol.loopexit_crit_edge, label %.preheader18.us.prol.preheader

.preheader18.preheader.us..preheader18.us.prol.loopexit_crit_edge: ; preds = %.preheader18.preheader.us
  br label %.preheader18.us.prol.loopexit

.preheader18.us.prol.preheader:                   ; preds = %.preheader18.preheader.us
  br label %.preheader18.us.prol

.preheader18.us.prol:                             ; preds = %.preheader18.us.prol..preheader18.us.prol_crit_edge, %.preheader18.us.prol.preheader
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.preheader18.us.prol..preheader18.us.prol_crit_edge ], [ 0, %.preheader18.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader18.us.prol..preheader18.us.prol_crit_edge ], [ %xtraiter, %.preheader18.us.prol.preheader ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us.prol
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  store double %19, double* %17, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader18.us.prol.loopexit.loopexit, label %.preheader18.us.prol..preheader18.us.prol_crit_edge, !llvm.loop !1

.preheader18.us.prol..preheader18.us.prol_crit_edge: ; preds = %.preheader18.us.prol
  br label %.preheader18.us.prol

.preheader18.us.prol.loopexit.loopexit:           ; preds = %.preheader18.us.prol
  br label %.preheader18.us.prol.loopexit

.preheader18.us.prol.loopexit:                    ; preds = %.preheader18.preheader.us..preheader18.us.prol.loopexit_crit_edge, %.preheader18.us.prol.loopexit.loopexit
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader18.preheader.us..preheader18.us.prol.loopexit_crit_edge ], [ %indvars.iv.next.us.prol, %.preheader18.us.prol.loopexit.loopexit ]
  %20 = icmp ult i64 %indvars.iv1522.us, 3
  br i1 %20, label %.preheader18.us.prol.loopexit..preheader.preheader.us.preheader_crit_edge, label %.preheader18.us.preheader

.preheader18.us.prol.loopexit..preheader.preheader.us.preheader_crit_edge: ; preds = %.preheader18.us.prol.loopexit
  br label %.preheader.preheader.us.preheader

.preheader18.us.preheader:                        ; preds = %.preheader18.us.prol.loopexit
  %21 = sub i64 %12, %indvars.iv19.us.unr
  %22 = lshr i64 %21, 2
  %23 = add nuw nsw i64 %22, 1
  %min.iters.check88 = icmp ult i64 %23, 2
  br i1 %min.iters.check88, label %.preheader18.us.preheader..preheader18.us.preheader111_crit_edge, label %min.iters.checked89

.preheader18.us.preheader..preheader18.us.preheader111_crit_edge: ; preds = %.preheader18.us.preheader
  br label %.preheader18.us.preheader111

min.iters.checked89:                              ; preds = %.preheader18.us.preheader
  %n.mod.vf90 = and i64 %23, 1
  %n.vec91 = sub nsw i64 %23, %n.mod.vf90
  %cmp.zero92 = icmp eq i64 %n.vec91, 0
  %24 = add i64 %indvars.iv19.us.unr, 4
  %25 = shl nuw i64 %22, 2
  %26 = add i64 %24, %25
  %27 = shl nuw nsw i64 %n.mod.vf90, 2
  %ind.end97 = sub i64 %26, %27
  br i1 %cmp.zero92, label %min.iters.checked89..preheader18.us.preheader111_crit_edge, label %vector.ph93

min.iters.checked89..preheader18.us.preheader111_crit_edge: ; preds = %min.iters.checked89
  br label %.preheader18.us.preheader111

vector.ph93:                                      ; preds = %min.iters.checked89
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85.vector.body85_crit_edge, %vector.ph93
  %index94 = phi i64 [ 0, %vector.ph93 ], [ %index.next95, %vector.body85.vector.body85_crit_edge ]
  %28 = shl i64 %index94, 2
  %29 = add i64 %indvars.iv19.us.unr, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %29
  %31 = bitcast double* %30 to <8 x double>*
  %wide.vec103 = load <8 x double>, <8 x double>* %31, align 8
  %strided.vec104 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec105 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec106 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec107 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %32 = fmul <2 x double> %strided.vec104, %broadcast.splat109
  %33 = fmul <2 x double> %strided.vec105, %broadcast.splat109
  %34 = fmul <2 x double> %strided.vec106, %broadcast.splat109
  %35 = add nsw i64 %29, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %35
  %37 = fmul <2 x double> %strided.vec107, %broadcast.splat109
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %32, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %34, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec110 = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec110, <8 x double>* %39, align 8
  %index.next95 = add i64 %index94, 2
  %42 = icmp eq i64 %index.next95, %n.vec91
  br i1 %42, label %middle.block86, label %vector.body85.vector.body85_crit_edge, !llvm.loop !3

vector.body85.vector.body85_crit_edge:            ; preds = %vector.body85
  br label %vector.body85

middle.block86:                                   ; preds = %vector.body85
  %cmp.n98 = icmp eq i64 %n.mod.vf90, 0
  br i1 %cmp.n98, label %middle.block86..preheader.preheader.us.preheader_crit_edge, label %middle.block86..preheader18.us.preheader111_crit_edge

middle.block86..preheader18.us.preheader111_crit_edge: ; preds = %middle.block86
  br label %.preheader18.us.preheader111

middle.block86..preheader.preheader.us.preheader_crit_edge: ; preds = %middle.block86
  br label %.preheader.preheader.us.preheader

.preheader18.us.preheader111:                     ; preds = %middle.block86..preheader18.us.preheader111_crit_edge, %min.iters.checked89..preheader18.us.preheader111_crit_edge, %.preheader18.us.preheader..preheader18.us.preheader111_crit_edge
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked89..preheader18.us.preheader111_crit_edge ], [ %indvars.iv19.us.unr, %.preheader18.us.preheader..preheader18.us.preheader111_crit_edge ], [ %ind.end97, %middle.block86..preheader18.us.preheader111_crit_edge ]
  br label %.preheader18.us

.preheader18.us:                                  ; preds = %.preheader18.us..preheader18.us_crit_edge, %.preheader18.us.preheader111
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader18.us..preheader18.us_crit_edge ], [ %indvars.iv19.us.ph, %.preheader18.us.preheader111 ]
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
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1324.us
  br i1 %exitcond.us.3, label %.preheader.preheader.us.preheader.loopexit, label %.preheader18.us..preheader18.us_crit_edge, !llvm.loop !6

.preheader18.us..preheader18.us_crit_edge:        ; preds = %.preheader18.us
  br label %.preheader18.us

.preheader.preheader.us.preheader.loopexit:       ; preds = %.preheader18.us
  br label %.preheader.preheader.us.preheader

.preheader.preheader.us.preheader:                ; preds = %middle.block86..preheader.preheader.us.preheader_crit_edge, %.preheader18.us.prol.loopexit..preheader.preheader.us.preheader_crit_edge, %.preheader.preheader.us.preheader.loopexit
  %min.iters.check44 = icmp ult i64 %15, 2
  %n.vec47 = and i64 %15, -2
  %cmp.zero48 = icmp eq i64 %n.vec47, 0
  %cmp.n79 = icmp eq i64 %15, %n.vec47
  br label %.preheader.preheader.us

.preheader.us:                                    ; preds = %.preheader.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv520.us = phi i64 [ %indvars.iv.next6.us, %.preheader.us..preheader.us_crit_edge ], [ %indvars.iv520.us.ph, %.preheader.us.preheader ]
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
  br i1 %exitcond10.us, label %.preheader17.us.loopexit, label %.preheader.us..preheader.us_crit_edge, !llvm.loop !8

.preheader.us..preheader.us_crit_edge:            ; preds = %.preheader.us
  br label %.preheader.us

.preheader17.us.loopexit:                         ; preds = %.preheader.us
  br label %.preheader17.us

.preheader17.us:                                  ; preds = %middle.block42..preheader17.us_crit_edge, %.preheader17.us.loopexit
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next12.us, %8
  br i1 %exitcond27, label %.preheader17._crit_edge.us, label %.preheader17.us..preheader.preheader.us_crit_edge

.preheader17.us..preheader.preheader.us_crit_edge: ; preds = %.preheader17.us
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader17.us..preheader.preheader.us_crit_edge, %.preheader.preheader.us.preheader
  %indvars.iv1121.us = phi i64 [ %indvars.iv.next12.us, %.preheader17.us..preheader.preheader.us_crit_edge ], [ 0, %.preheader.preheader.us.preheader ]
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1121.us
  %69 = add i64 %indvars.iv1121.us, 1
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %69
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1121.us
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %69
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  br i1 %min.iters.check44, label %.preheader.preheader.us..preheader.us.preheader_crit_edge, label %min.iters.checked45

.preheader.preheader.us..preheader.us.preheader_crit_edge: ; preds = %.preheader.preheader.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %middle.block42..preheader.us.preheader_crit_edge, %vector.memcheck..preheader.us.preheader_crit_edge, %min.iters.checked45..preheader.us.preheader_crit_edge, %.preheader.preheader.us..preheader.us.preheader_crit_edge
  %indvars.iv520.us.ph = phi i64 [ 0, %vector.memcheck..preheader.us.preheader_crit_edge ], [ 0, %min.iters.checked45..preheader.us.preheader_crit_edge ], [ 0, %.preheader.preheader.us..preheader.us.preheader_crit_edge ], [ %n.vec47, %middle.block42..preheader.us.preheader_crit_edge ]
  br label %.preheader.us

min.iters.checked45:                              ; preds = %.preheader.preheader.us
  br i1 %cmp.zero48, label %min.iters.checked45..preheader.us.preheader_crit_edge, label %vector.memcheck

min.iters.checked45..preheader.us.preheader_crit_edge: ; preds = %min.iters.checked45
  br label %.preheader.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked45
  %bound0 = icmp ult double* %scevgep, %71
  %bound1 = icmp ult double* %71, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult double* %scevgep, %scevgep55
  %bound163 = icmp ult double* %scevgep53, %scevgep51
  %found.conflict64 = and i1 %bound062, %bound163
  %conflict.rdx = or i1 %found.conflict, %found.conflict64
  %bound065 = icmp ult double* %scevgep, %scevgep59
  %bound166 = icmp ult double* %scevgep57, %scevgep51
  %found.conflict67 = and i1 %bound065, %bound166
  %conflict.rdx68 = or i1 %conflict.rdx, %found.conflict67
  %bound071 = icmp ult double* %scevgep, %70
  %bound172 = icmp ult double* %70, %scevgep51
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx74 = or i1 %conflict.rdx68, %found.conflict73
  br i1 %conflict.rdx74, label %vector.memcheck..preheader.us.preheader_crit_edge, label %vector.ph75

vector.memcheck..preheader.us.preheader_crit_edge: ; preds = %vector.memcheck
  br label %.preheader.us.preheader

vector.ph75:                                      ; preds = %vector.memcheck
  br label %vector.body41

vector.body41:                                    ; preds = %vector.body41.vector.body41_crit_edge, %vector.ph75
  %index76 = phi i64 [ 0, %vector.ph75 ], [ %index.next77, %vector.body41.vector.body41_crit_edge ]
  %72 = or i64 %index76, 1
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index76, i64 %indvars.iv1121.us
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %72, i64 %indvars.iv1121.us
  %75 = load double, double* %73, align 8, !alias.scope !9
  %76 = load double, double* %74, align 8, !alias.scope !9
  %77 = insertelement <2 x double> undef, double %75, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fmul <2 x double> %78, %broadcast.splat84
  %80 = load double, double* %70, align 8, !alias.scope !12
  %81 = insertelement <2 x double> undef, double %80, i32 0
  %82 = shufflevector <2 x double> %81, <2 x double> undef, <2 x i32> zeroinitializer
  %83 = fmul <2 x double> %79, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index76, i64 %indvars.iv1121.us
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %72, i64 %indvars.iv1121.us
  %86 = load double, double* %84, align 8, !alias.scope !14
  %87 = load double, double* %85, align 8, !alias.scope !14
  %88 = insertelement <2 x double> undef, double %86, i32 0
  %89 = insertelement <2 x double> %88, double %87, i32 1
  %90 = fmul <2 x double> %89, %broadcast.splat84
  %91 = load double, double* %71, align 8, !alias.scope !16
  %92 = insertelement <2 x double> undef, double %91, i32 0
  %93 = shufflevector <2 x double> %92, <2 x double> undef, <2 x i32> zeroinitializer
  %94 = fmul <2 x double> %90, %93
  %95 = fadd <2 x double> %83, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %index76
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !18, !noalias !20
  %98 = fadd <2 x double> %wide.load, %95
  %99 = bitcast double* %96 to <2 x double>*
  store <2 x double> %98, <2 x double>* %99, align 8, !alias.scope !18, !noalias !20
  %index.next77 = add i64 %index76, 2
  %100 = icmp eq i64 %index.next77, %n.vec47
  br i1 %100, label %middle.block42, label %vector.body41.vector.body41_crit_edge, !llvm.loop !21

vector.body41.vector.body41_crit_edge:            ; preds = %vector.body41
  br label %vector.body41

middle.block42:                                   ; preds = %vector.body41
  br i1 %cmp.n79, label %middle.block42..preheader17.us_crit_edge, label %middle.block42..preheader.us.preheader_crit_edge

middle.block42..preheader.us.preheader_crit_edge: ; preds = %middle.block42
  br label %.preheader.us.preheader

middle.block42..preheader17.us_crit_edge:         ; preds = %middle.block42
  br label %.preheader17.us

.preheader17._crit_edge.us:                       ; preds = %.preheader17.us
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1522.us, 1
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next16.us, %9
  br i1 %exitcond28, label %._crit_edge.loopexit, label %.preheader17._crit_edge.us..preheader18.preheader.us_crit_edge

.preheader17._crit_edge.us..preheader18.preheader.us_crit_edge: ; preds = %.preheader17._crit_edge.us
  br label %.preheader18.preheader.us

.preheader18.preheader:                           ; preds = %.preheader17.preheader..preheader18.preheader_crit_edge, %.preheader18.preheader.preheader
  %indvars.iv1324 = phi i64 [ %indvars.iv.next14, %.preheader17.preheader..preheader18.preheader_crit_edge ], [ 1, %.preheader18.preheader.preheader ]
  %indvars.iv1522 = phi i64 [ %indvars.iv.next16, %.preheader17.preheader..preheader18.preheader_crit_edge ], [ 0, %.preheader18.preheader.preheader ]
  %101 = add i64 %indvars.iv1522, -3
  %102 = add nuw nsw i64 %indvars.iv1522, 1
  %xtraiter29 = and i64 %102, 3
  %lcmp.mod30 = icmp eq i64 %xtraiter29, 0
  br i1 %lcmp.mod30, label %.preheader18.preheader..preheader18.prol.loopexit_crit_edge, label %.preheader18.prol.preheader

.preheader18.preheader..preheader18.prol.loopexit_crit_edge: ; preds = %.preheader18.preheader
  br label %.preheader18.prol.loopexit

.preheader18.prol.preheader:                      ; preds = %.preheader18.preheader
  br label %.preheader18.prol

.preheader18.prol:                                ; preds = %.preheader18.prol..preheader18.prol_crit_edge, %.preheader18.prol.preheader
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next.prol, %.preheader18.prol..preheader18.prol_crit_edge ], [ 0, %.preheader18.prol.preheader ]
  %prol.iter31 = phi i64 [ %prol.iter31.sub, %.preheader18.prol..preheader18.prol_crit_edge ], [ %xtraiter29, %.preheader18.prol.preheader ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv19.prol
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %3
  store double %105, double* %103, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter31.sub = add i64 %prol.iter31, -1
  %prol.iter31.cmp = icmp eq i64 %prol.iter31.sub, 0
  br i1 %prol.iter31.cmp, label %.preheader18.prol.loopexit.loopexit, label %.preheader18.prol..preheader18.prol_crit_edge, !llvm.loop !22

.preheader18.prol..preheader18.prol_crit_edge:    ; preds = %.preheader18.prol
  br label %.preheader18.prol

.preheader18.prol.loopexit.loopexit:              ; preds = %.preheader18.prol
  br label %.preheader18.prol.loopexit

.preheader18.prol.loopexit:                       ; preds = %.preheader18.preheader..preheader18.prol.loopexit_crit_edge, %.preheader18.prol.loopexit.loopexit
  %indvars.iv19.unr = phi i64 [ 0, %.preheader18.preheader..preheader18.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.preheader18.prol.loopexit.loopexit ]
  %106 = icmp ult i64 %indvars.iv1522, 3
  br i1 %106, label %.preheader18.prol.loopexit..preheader17.preheader_crit_edge, label %.preheader18.preheader34

.preheader18.prol.loopexit..preheader17.preheader_crit_edge: ; preds = %.preheader18.prol.loopexit
  br label %.preheader17.preheader

.preheader18.preheader34:                         ; preds = %.preheader18.prol.loopexit
  %107 = sub i64 %101, %indvars.iv19.unr
  %108 = lshr i64 %107, 2
  %109 = add nuw nsw i64 %108, 1
  %min.iters.check = icmp ult i64 %109, 2
  br i1 %min.iters.check, label %.preheader18.preheader34..preheader18.preheader112_crit_edge, label %min.iters.checked

.preheader18.preheader34..preheader18.preheader112_crit_edge: ; preds = %.preheader18.preheader34
  br label %.preheader18.preheader112

min.iters.checked:                                ; preds = %.preheader18.preheader34
  %n.mod.vf = and i64 %109, 1
  %n.vec = sub nsw i64 %109, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %110 = add i64 %indvars.iv19.unr, 4
  %111 = shl nuw i64 %108, 2
  %112 = add i64 %110, %111
  %113 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %112, %113
  br i1 %cmp.zero, label %min.iters.checked..preheader18.preheader112_crit_edge, label %vector.ph

min.iters.checked..preheader18.preheader112_crit_edge: ; preds = %min.iters.checked
  br label %.preheader18.preheader112

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %114 = shl i64 %index, 2
  %115 = add i64 %indvars.iv19.unr, %114
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %115
  %117 = bitcast double* %116 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %117, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec36 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec37 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec38 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %118 = fmul <2 x double> %strided.vec, %broadcast.splat40
  %119 = fmul <2 x double> %strided.vec36, %broadcast.splat40
  %120 = fmul <2 x double> %strided.vec37, %broadcast.splat40
  %121 = add nsw i64 %115, 3
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522, i64 %121
  %123 = fmul <2 x double> %strided.vec38, %broadcast.splat40
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
  br i1 %cmp.n, label %middle.block..preheader17.preheader_crit_edge, label %middle.block..preheader18.preheader112_crit_edge

middle.block..preheader18.preheader112_crit_edge: ; preds = %middle.block
  br label %.preheader18.preheader112

middle.block..preheader17.preheader_crit_edge:    ; preds = %middle.block
  br label %.preheader17.preheader

.preheader18.preheader112:                        ; preds = %middle.block..preheader18.preheader112_crit_edge, %min.iters.checked..preheader18.preheader112_crit_edge, %.preheader18.preheader34..preheader18.preheader112_crit_edge
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked..preheader18.preheader112_crit_edge ], [ %indvars.iv19.unr, %.preheader18.preheader34..preheader18.preheader112_crit_edge ], [ %ind.end, %middle.block..preheader18.preheader112_crit_edge ]
  br label %.preheader18

.preheader18:                                     ; preds = %.preheader18..preheader18_crit_edge, %.preheader18.preheader112
  %indvars.iv19 = phi i64 [ %indvars.iv.next.3, %.preheader18..preheader18_crit_edge ], [ %indvars.iv19.ph, %.preheader18.preheader112 ]
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
  %indvars.iv.next.3 = add nsw i64 %indvars.iv19, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1324
  br i1 %exitcond.3, label %.preheader17.preheader.loopexit, label %.preheader18..preheader18_crit_edge, !llvm.loop !24

.preheader18..preheader18_crit_edge:              ; preds = %.preheader18
  br label %.preheader18

.preheader17.preheader.loopexit:                  ; preds = %.preheader18
  br label %.preheader17.preheader

.preheader17.preheader:                           ; preds = %middle.block..preheader17.preheader_crit_edge, %.preheader18.prol.loopexit..preheader17.preheader_crit_edge, %.preheader17.preheader.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1522, 1
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1324, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %9
  br i1 %exitcond, label %._crit_edge.loopexit113, label %.preheader17.preheader..preheader18.preheader_crit_edge

.preheader17.preheader..preheader18.preheader_crit_edge: ; preds = %.preheader17.preheader
  br label %.preheader18.preheader

._crit_edge.loopexit:                             ; preds = %.preheader17._crit_edge.us
  br label %._crit_edge

._crit_edge.loopexit113:                          ; preds = %.preheader17.preheader
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit113, %._crit_edge.loopexit
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
  %8 = zext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader.preheader.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %10 = mul nsw i64 %indvars.iv27, %7
  br label %11

; <label>:11:                                     ; preds = %.preheader._crit_edge10, %.preheader.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader._crit_edge10 ]
  %12 = add nsw i64 %indvars.iv6, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %11
  br label %.preheader

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv6
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond4, label %.preheader._crit_edge, label %.preheader._crit_edge10

.preheader._crit_edge10:                          ; preds = %.preheader
  br label %11

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader._crit_edge..preheader.preheader_crit_edge

.preheader._crit_edge..preheader.preheader_crit_edge: ; preds = %.preheader._crit_edge
  br label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
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
