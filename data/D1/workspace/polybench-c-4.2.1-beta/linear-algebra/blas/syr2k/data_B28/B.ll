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

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader4.us.preheader, label %.preheader4.lr.ph..preheader.lr.ph_crit_edge

.preheader4.lr.ph..preheader.lr.ph_crit_edge:     ; preds = %.preheader4.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge ]
  %12 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %10
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %17, double* %18, align 8
  %19 = add nuw nsw i64 %12, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %11
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %23, double* %24, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge11.us, label %._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader3, label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge11.us
  br i1 true, label %.preheader.lr.ph, label %.preheader3.._crit_edge8_crit_edge

.preheader3.._crit_edge8_crit_edge:               ; preds = %.preheader3
  br label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %.preheader4.lr.ph..preheader.lr.ph_crit_edge, %.preheader3
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %.preheader4.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count25, %.preheader3 ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge.us ]
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge28 ]
  %25 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %0
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %11
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge28

._crit_edge.us:                                   ; preds = %._crit_edge28
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count.pre-phi
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.preheader3.._crit_edge8_crit_edge, %._crit_edge8.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count51 = zext i32 %0 to i64
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count33 = zext i32 %1 to i64
  %wide.trip.count40 = zext i32 %0 to i64
  %broadcast.splatinsert103 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat104 = shufflevector <2 x double> %broadcast.splatinsert103, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert125 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat126 = shufflevector <2 x double> %broadcast.splatinsert125, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv36
  br i1 %exitcond, label %.preheader.us14.preheader.loopexit, label %._crit_edge, !llvm.loop !1

.preheader.us14.preheader.loopexit:               ; preds = %._crit_edge
  br label %.preheader.us14.preheader

.preheader.us14.preheader:                        ; preds = %.preheader.us14.preheader.loopexit, %middle.block107
  %min.iters.check64 = icmp ult i64 %58, 2
  %n.vec67 = and i64 %58, -2
  %cmp.zero68 = icmp eq i64 %n.vec67, 0
  %cmp.n99 = icmp eq i64 %58, %n.vec67
  br label %.preheader.us14

.preheader.us14:                                  ; preds = %.preheader.us14.preheader, %._crit_edge.us18
  %indvars.iv31 = phi i64 [ %13, %._crit_edge.us18 ], [ 0, %.preheader.us14.preheader ]
  %scevgep73 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %13 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %13
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep79 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %13
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %min.iters.check64, label %._crit_edge53.preheader, label %min.iters.checked65

min.iters.checked65:                              ; preds = %.preheader.us14
  br i1 %cmp.zero68, label %._crit_edge53.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked65
  %bound0 = icmp ult double* %scevgep, %15
  %bound1 = icmp ult double* %15, %scevgep71
  %found.conflict = and i1 %bound0, %bound1
  %bound082 = icmp ult double* %scevgep, %scevgep75
  %bound183 = icmp ult double* %scevgep73, %scevgep71
  %found.conflict84 = and i1 %bound082, %bound183
  %conflict.rdx = or i1 %found.conflict, %found.conflict84
  %bound085 = icmp ult double* %scevgep, %scevgep79
  %bound186 = icmp ult double* %scevgep77, %scevgep71
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx88 = or i1 %conflict.rdx, %found.conflict87
  %bound091 = icmp ult double* %scevgep, %14
  %bound192 = icmp ult double* %14, %scevgep71
  %found.conflict93 = and i1 %bound091, %bound192
  %conflict.rdx94 = or i1 %conflict.rdx88, %found.conflict93
  br i1 %conflict.rdx94, label %._crit_edge53.preheader, label %vector.ph95

vector.ph95:                                      ; preds = %vector.memcheck
  %.pre = load double, double* %14, align 8, !alias.scope !5
  %.pre128 = load double, double* %15, align 8, !alias.scope !8
  %16 = insertelement <2 x double> undef, double %.pre, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %.pre128, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body61

vector.body61:                                    ; preds = %vector.body61, %vector.ph95
  %index96 = phi i64 [ 0, %vector.ph95 ], [ %index.next97, %vector.body61 ]
  %20 = or i64 %index96, 1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index96, i64 %indvars.iv31
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %20, i64 %indvars.iv31
  %23 = load double, double* %21, align 8, !alias.scope !10
  %24 = load double, double* %22, align 8, !alias.scope !10
  %25 = insertelement <2 x double> undef, double %23, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fmul <2 x double> %26, %broadcast.splat104
  %28 = fmul <2 x double> %27, %17
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index96, i64 %indvars.iv31
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %20, i64 %indvars.iv31
  %31 = load double, double* %29, align 8, !alias.scope !12
  %32 = load double, double* %30, align 8, !alias.scope !12
  %33 = insertelement <2 x double> undef, double %31, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fmul <2 x double> %34, %broadcast.splat104
  %36 = fmul <2 x double> %35, %19
  %37 = fadd <2 x double> %28, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index96
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !14, !noalias !16
  %40 = fadd <2 x double> %wide.load105, %37
  store <2 x double> %40, <2 x double>* %39, align 8, !alias.scope !14, !noalias !16
  %index.next97 = add i64 %index96, 2
  %41 = icmp eq i64 %index.next97, %n.vec67
  br i1 %41, label %middle.block62, label %vector.body61, !llvm.loop !17

middle.block62:                                   ; preds = %vector.body61
  br i1 %cmp.n99, label %._crit_edge.us18, label %._crit_edge53.preheader

._crit_edge53.preheader:                          ; preds = %middle.block62, %vector.memcheck, %min.iters.checked65, %.preheader.us14
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked65 ], [ 0, %.preheader.us14 ], [ %n.vec67, %middle.block62 ]
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.preheader, %._crit_edge53
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge53 ], [ %indvars.iv25.ph, %._crit_edge53.preheader ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv31
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %2
  %45 = load double, double* %14, align 8
  %46 = fmul double %44, %45
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %2
  %50 = load double, double* %15, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %46, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv25
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, %indvars.iv36
  br i1 %exitcond30, label %._crit_edge.us18.loopexit, label %._crit_edge53, !llvm.loop !18

.lr.ph.us:                                        ; preds = %._crit_edge9.us, %.lr.ph.us.preheader
  %indvars.iv38 = phi i64 [ %58, %._crit_edge9.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge9.us ], [ 1, %.lr.ph.us.preheader ]
  %56 = add i64 %indvars.iv38, -3
  %57 = lshr i64 %56, 2
  %58 = add nuw nsw i64 %indvars.iv38, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %59 = mul i64 %indvars.iv38, 1201
  %60 = add i64 %59, 1
  %scevgep71 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %60
  %min.iters.check109 = icmp ult i64 %58, 4
  br i1 %min.iters.check109, label %._crit_edge.preheader, label %min.iters.checked110

._crit_edge.preheader:                            ; preds = %middle.block107, %min.iters.checked110, %.lr.ph.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked110 ], [ 0, %.lr.ph.us ], [ %n.vec112, %middle.block107 ]
  br label %._crit_edge

min.iters.checked110:                             ; preds = %.lr.ph.us
  %n.vec112 = and i64 %58, -4
  %cmp.zero113 = icmp eq i64 %n.vec112, 0
  br i1 %cmp.zero113, label %._crit_edge.preheader, label %vector.ph114

vector.ph114:                                     ; preds = %min.iters.checked110
  %61 = and i64 %57, 1
  %lcmp.mod = icmp eq i64 %61, 0
  br i1 %lcmp.mod, label %vector.body106.prol.preheader, label %vector.body106.prol.loopexit.unr-lcssa

vector.body106.prol.preheader:                    ; preds = %vector.ph114
  br label %vector.body106.prol

vector.body106.prol:                              ; preds = %vector.body106.prol.preheader
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load123.prol = load <2 x double>, <2 x double>* %63, align 8
  %64 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load124.prol = load <2 x double>, <2 x double>* %65, align 8
  %66 = fmul <2 x double> %wide.load123.prol, %broadcast.splat126
  %67 = fmul <2 x double> %wide.load124.prol, %broadcast.splat126
  store <2 x double> %66, <2 x double>* %63, align 8
  store <2 x double> %67, <2 x double>* %65, align 8
  br label %vector.body106.prol.loopexit.unr-lcssa

vector.body106.prol.loopexit.unr-lcssa:           ; preds = %vector.ph114, %vector.body106.prol
  %index115.unr.ph = phi i64 [ 4, %vector.body106.prol ], [ 0, %vector.ph114 ]
  br label %vector.body106.prol.loopexit

vector.body106.prol.loopexit:                     ; preds = %vector.body106.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %57, 0
  br i1 %68, label %middle.block107, label %vector.ph114.new

vector.ph114.new:                                 ; preds = %vector.body106.prol.loopexit
  br label %vector.body106

vector.body106:                                   ; preds = %vector.body106, %vector.ph114.new
  %index115 = phi i64 [ %index115.unr.ph, %vector.ph114.new ], [ %index.next116.1, %vector.body106 ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index115
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %70, align 8
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %72, align 8
  %73 = fmul <2 x double> %wide.load123, %broadcast.splat126
  %74 = fmul <2 x double> %wide.load124, %broadcast.splat126
  store <2 x double> %73, <2 x double>* %70, align 8
  store <2 x double> %74, <2 x double>* %72, align 8
  %index.next116 = add i64 %index115, 4
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index.next116
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load123.1 = load <2 x double>, <2 x double>* %76, align 8
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load124.1 = load <2 x double>, <2 x double>* %78, align 8
  %79 = fmul <2 x double> %wide.load123.1, %broadcast.splat126
  %80 = fmul <2 x double> %wide.load124.1, %broadcast.splat126
  store <2 x double> %79, <2 x double>* %76, align 8
  store <2 x double> %80, <2 x double>* %78, align 8
  %index.next116.1 = add i64 %index115, 8
  %81 = icmp eq i64 %index.next116.1, %n.vec112
  br i1 %81, label %middle.block107.unr-lcssa, label %vector.body106, !llvm.loop !19

middle.block107.unr-lcssa:                        ; preds = %vector.body106
  br label %middle.block107

middle.block107:                                  ; preds = %vector.body106.prol.loopexit, %middle.block107.unr-lcssa
  %cmp.n118 = icmp eq i64 %58, %n.vec112
  br i1 %cmp.n118, label %.preheader.us14.preheader, label %._crit_edge.preheader

._crit_edge.us18.loopexit:                        ; preds = %._crit_edge53
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block62
  %exitcond34 = icmp eq i64 %13, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge9.us, label %.preheader.us14

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %exitcond41 = icmp eq i64 %58, %wide.trip.count40
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br i1 %exitcond41, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader3, %.lr.ph.preheader
  %indvars.iv49 = phi i64 [ %84, %.preheader3 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %.preheader3 ], [ 1, %.lr.ph.preheader ]
  %82 = add i64 %indvars.iv49, -3
  %83 = lshr i64 %82, 2
  %84 = add nuw nsw i64 %indvars.iv49, 1
  %min.iters.check = icmp ult i64 %84, 4
  br i1 %min.iters.check, label %._crit_edge54.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %84, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge54.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %85 = and i64 %83, 1
  %lcmp.mod130 = icmp eq i64 %85, 0
  br i1 %lcmp.mod130, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 0
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %87, align 8
  %88 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load58.prol = load <2 x double>, <2 x double>* %89, align 8
  %90 = fmul <2 x double> %wide.load.prol, %broadcast.splat60
  %91 = fmul <2 x double> %wide.load58.prol, %broadcast.splat60
  store <2 x double> %90, <2 x double>* %87, align 8
  store <2 x double> %91, <2 x double>* %89, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %92 = icmp eq i64 %83, 0
  br i1 %92, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %index
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %94, align 8
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %96, align 8
  %97 = fmul <2 x double> %wide.load, %broadcast.splat60
  %98 = fmul <2 x double> %wide.load58, %broadcast.splat60
  store <2 x double> %97, <2 x double>* %94, align 8
  store <2 x double> %98, <2 x double>* %96, align 8
  %index.next = add i64 %index, 4
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %index.next
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %100, align 8
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load58.1 = load <2 x double>, <2 x double>* %102, align 8
  %103 = fmul <2 x double> %wide.load.1, %broadcast.splat60
  %104 = fmul <2 x double> %wide.load58.1, %broadcast.splat60
  store <2 x double> %103, <2 x double>* %100, align 8
  store <2 x double> %104, <2 x double>* %102, align 8
  %index.next.1 = add i64 %index, 8
  %105 = icmp eq i64 %index.next.1, %n.vec
  br i1 %105, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %84, %n.vec
  br i1 %cmp.n, label %.preheader3, label %._crit_edge54.preheader

._crit_edge54.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph
  %indvars.iv42.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.preheader, %._crit_edge54
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge54 ], [ %indvars.iv42.ph, %._crit_edge54.preheader ]
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %3
  store double %108, double* %106, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next43, %indvars.iv47
  br i1 %exitcond46, label %.preheader3.loopexit, label %._crit_edge54, !llvm.loop !21

.preheader3.loopexit:                             ; preds = %._crit_edge54
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block
  %exitcond52 = icmp eq i64 %84, %wide.trip.count51
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br i1 %exitcond52, label %._crit_edge13.loopexit127, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit127:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit127, %._crit_edge13.loopexit, %7
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!13}
!13 = distinct !{!13, !7}
!14 = !{!15}
!15 = distinct !{!15, !7}
!16 = !{!9, !11, !13, !6}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !3, !4}
!20 = distinct !{!20, !3, !4}
!21 = distinct !{!21, !2, !3, !4}
