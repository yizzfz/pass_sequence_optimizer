; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %.._crit_edge8_crit_edge

.._crit_edge8_crit_edge:                          ; preds = %7
  br label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader4.us.preheader, label %.preheader4.lr.ph..preheader.lr.ph_crit_edge

.preheader4.lr.ph..preheader.lr.ph_crit_edge:     ; preds = %.preheader4.lr.ph
  br label %.preheader.lr.ph

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us..preheader4.us_crit_edge ], [ 0, %.preheader4.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge ]
  %13 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %13, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %11
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %24, double* %25, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge11.us, label %._crit_edge

._crit_edge:                                      ; preds = %12
  br label %12

._crit_edge11.us:                                 ; preds = %12
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader3, label %._crit_edge11.us..preheader4.us_crit_edge

._crit_edge11.us..preheader4.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge11.us
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader3..preheader.lr.ph_crit_edge, label %.preheader3.._crit_edge8_crit_edge

.preheader3.._crit_edge8_crit_edge:               ; preds = %.preheader3
  br label %._crit_edge8

.preheader3..preheader.lr.ph_crit_edge:           ; preds = %.preheader3
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader3..preheader.lr.ph_crit_edge, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  %27 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  br label %28

; <label>:28:                                     ; preds = %._crit_edge29, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge29 ]
  %29 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %30 = add nuw nsw i64 %29, 3
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %0
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %27
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge29

._crit_edge29:                                    ; preds = %28
  br label %28

._crit_edge.us:                                   ; preds = %28
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.preheader3.._crit_edge8_crit_edge, %.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %.._crit_edge13_crit_edge

.._crit_edge13_crit_edge:                         ; preds = %7
  br label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count55 = zext i32 %0 to i64
  %broadcast.splatinsert62 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat63 = shufflevector <2 x double> %broadcast.splatinsert62, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count32 = zext i32 %1 to i64
  %wide.trip.count39 = zext i32 %0 to i64
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert131 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat132 = shufflevector <2 x double> %broadcast.splatinsert131, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader134
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader134 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv35
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %middle.block109..preheader.us15.preheader_crit_edge, %.prol.loopexit..preheader.us15.preheader_crit_edge, %.preheader.us15.preheader.loopexit
  %min.iters.check67 = icmp ult i64 %71, 2
  %n.vec70 = and i64 %71, -2
  %cmp.zero71 = icmp eq i64 %n.vec70, 0
  %cmp.n102 = icmp eq i64 %71, %n.vec70
  br label %.preheader.us15

scalar.ph66:                                      ; preds = %scalar.ph66.scalar.ph66_crit_edge, %scalar.ph66.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph66.scalar.ph66_crit_edge ], [ %indvars.iv25.ph, %scalar.ph66.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv30
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv30
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv25
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv35
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %scalar.ph66.scalar.ph66_crit_edge, !llvm.loop !5

scalar.ph66.scalar.ph66_crit_edge:                ; preds = %scalar.ph66
  br label %scalar.ph66

.preheader.us15:                                  ; preds = %._crit_edge.us18..preheader.us15_crit_edge, %.preheader.us15.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us18..preheader.us15_crit_edge ], [ 0, %.preheader.us15.preheader ]
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv30
  %36 = add i64 %indvars.iv30, 1
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %36
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv30
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv30
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv30
  br i1 %min.iters.check67, label %.preheader.us15.scalar.ph66.preheader_crit_edge, label %min.iters.checked68

.preheader.us15.scalar.ph66.preheader_crit_edge:  ; preds = %.preheader.us15
  br label %scalar.ph66.preheader

scalar.ph66.preheader:                            ; preds = %middle.block65.scalar.ph66.preheader_crit_edge, %vector.memcheck.scalar.ph66.preheader_crit_edge, %min.iters.checked68.scalar.ph66.preheader_crit_edge, %.preheader.us15.scalar.ph66.preheader_crit_edge
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck.scalar.ph66.preheader_crit_edge ], [ 0, %min.iters.checked68.scalar.ph66.preheader_crit_edge ], [ 0, %.preheader.us15.scalar.ph66.preheader_crit_edge ], [ %n.vec70, %middle.block65.scalar.ph66.preheader_crit_edge ]
  br label %scalar.ph66

min.iters.checked68:                              ; preds = %.preheader.us15
  br i1 %cmp.zero71, label %min.iters.checked68.scalar.ph66.preheader_crit_edge, label %vector.memcheck

min.iters.checked68.scalar.ph66.preheader_crit_edge: ; preds = %min.iters.checked68
  br label %scalar.ph66.preheader

vector.memcheck:                                  ; preds = %min.iters.checked68
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound085 = icmp ult double* %scevgep, %scevgep78
  %bound186 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx = or i1 %found.conflict, %found.conflict87
  %bound088 = icmp ult double* %scevgep, %scevgep82
  %bound189 = icmp ult double* %scevgep80, %scevgep74
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx91 = or i1 %conflict.rdx, %found.conflict90
  %bound094 = icmp ult double* %scevgep, %37
  %bound195 = icmp ult double* %37, %scevgep74
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx97 = or i1 %conflict.rdx91, %found.conflict96
  br i1 %conflict.rdx97, label %vector.memcheck.scalar.ph66.preheader_crit_edge, label %vector.ph98

vector.memcheck.scalar.ph66.preheader_crit_edge:  ; preds = %vector.memcheck
  br label %scalar.ph66.preheader

vector.ph98:                                      ; preds = %vector.memcheck
  br label %vector.body64

vector.body64:                                    ; preds = %vector.body64.vector.body64_crit_edge, %vector.ph98
  %index99 = phi i64 [ 0, %vector.ph98 ], [ %index.next100, %vector.body64.vector.body64_crit_edge ]
  %39 = or i64 %index99, 1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index99, i64 %indvars.iv30
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %39, i64 %indvars.iv30
  %42 = load double, double* %40, align 8, !alias.scope !6
  %43 = load double, double* %41, align 8, !alias.scope !6
  %44 = insertelement <2 x double> undef, double %42, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fmul <2 x double> %45, %broadcast.splat107
  %47 = load double, double* %37, align 8, !alias.scope !9
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %46, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index99, i64 %indvars.iv30
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %39, i64 %indvars.iv30
  %53 = load double, double* %51, align 8, !alias.scope !11
  %54 = load double, double* %52, align 8, !alias.scope !11
  %55 = insertelement <2 x double> undef, double %53, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %56, %broadcast.splat107
  %58 = load double, double* %38, align 8, !alias.scope !13
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = fmul <2 x double> %57, %60
  %62 = fadd <2 x double> %50, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index99
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next100 = add i64 %index99, 2
  %67 = icmp eq i64 %index.next100, %n.vec70
  br i1 %67, label %middle.block65, label %vector.body64.vector.body64_crit_edge, !llvm.loop !18

vector.body64.vector.body64_crit_edge:            ; preds = %vector.body64
  br label %vector.body64

middle.block65:                                   ; preds = %vector.body64
  br i1 %cmp.n102, label %middle.block65.._crit_edge.us18_crit_edge, label %middle.block65.scalar.ph66.preheader_crit_edge

middle.block65.scalar.ph66.preheader_crit_edge:   ; preds = %middle.block65
  br label %scalar.ph66.preheader

middle.block65.._crit_edge.us18_crit_edge:        ; preds = %middle.block65
  br label %._crit_edge.us18

.lr.ph.us:                                        ; preds = %._crit_edge9.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge9.us..lr.ph.us_crit_edge ], [ 1, %.lr.ph.us.preheader ]
  %68 = add i64 %indvars.iv37, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %69 = mul i64 %indvars.iv37, 1201
  %70 = add i64 %69, 1
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %70
  %71 = add i64 %indvars.iv37, 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %72 = trunc i64 %indvars.iv.next38 to i32
  %xtraiter = and i32 %72, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  store double %75, double* %73, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !19

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %76 = icmp ult i64 %indvars.iv37, 3
  br i1 %76, label %.prol.loopexit..preheader.us15.preheader_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit..preheader.us15.preheader_crit_edge: ; preds = %.prol.loopexit
  br label %.preheader.us15.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %77 = sub i64 %68, %indvars.iv.unr
  %78 = lshr i64 %77, 2
  %79 = add nuw nsw i64 %78, 1
  %min.iters.check111 = icmp ult i64 %79, 2
  br i1 %min.iters.check111, label %.lr.ph.us.new.preheader..lr.ph.us.new.preheader134_crit_edge, label %min.iters.checked112

.lr.ph.us.new.preheader..lr.ph.us.new.preheader134_crit_edge: ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.preheader134

.lr.ph.us.new.preheader134:                       ; preds = %middle.block109..lr.ph.us.new.preheader134_crit_edge, %min.iters.checked112..lr.ph.us.new.preheader134_crit_edge, %.lr.ph.us.new.preheader..lr.ph.us.new.preheader134_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked112..lr.ph.us.new.preheader134_crit_edge ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader..lr.ph.us.new.preheader134_crit_edge ], [ %ind.end120, %middle.block109..lr.ph.us.new.preheader134_crit_edge ]
  br label %.lr.ph.us.new

min.iters.checked112:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf113 = and i64 %79, 1
  %n.vec114 = sub nsw i64 %79, %n.mod.vf113
  %cmp.zero115 = icmp eq i64 %n.vec114, 0
  %80 = add i64 %indvars.iv.unr, 4
  %81 = shl nuw i64 %78, 2
  %82 = add i64 %80, %81
  %83 = shl nuw nsw i64 %n.mod.vf113, 2
  %ind.end120 = sub i64 %82, %83
  br i1 %cmp.zero115, label %min.iters.checked112..lr.ph.us.new.preheader134_crit_edge, label %vector.ph116

min.iters.checked112..lr.ph.us.new.preheader134_crit_edge: ; preds = %min.iters.checked112
  br label %.lr.ph.us.new.preheader134

vector.ph116:                                     ; preds = %min.iters.checked112
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108.vector.body108_crit_edge, %vector.ph116
  %index117 = phi i64 [ 0, %vector.ph116 ], [ %index.next118, %vector.body108.vector.body108_crit_edge ]
  %84 = shl i64 %index117, 2
  %85 = add i64 %indvars.iv.unr, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %85
  %87 = bitcast double* %86 to <8 x double>*
  %wide.vec126 = load <8 x double>, <8 x double>* %87, align 8
  %strided.vec127 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec128 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec129 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec130 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %88 = fmul <2 x double> %strided.vec127, %broadcast.splat132
  %89 = fmul <2 x double> %strided.vec128, %broadcast.splat132
  %90 = fmul <2 x double> %strided.vec129, %broadcast.splat132
  %91 = add nsw i64 %85, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %91
  %93 = fmul <2 x double> %strided.vec130, %broadcast.splat132
  %94 = getelementptr double, double* %92, i64 -3
  %95 = bitcast double* %94 to <8 x double>*
  %96 = shufflevector <2 x double> %88, <2 x double> %89, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %97 = shufflevector <2 x double> %90, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec133 = shufflevector <4 x double> %96, <4 x double> %97, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec133, <8 x double>* %95, align 8
  %index.next118 = add i64 %index117, 2
  %98 = icmp eq i64 %index.next118, %n.vec114
  br i1 %98, label %middle.block109, label %vector.body108.vector.body108_crit_edge, !llvm.loop !21

vector.body108.vector.body108_crit_edge:          ; preds = %vector.body108
  br label %vector.body108

middle.block109:                                  ; preds = %vector.body108
  %cmp.n121 = icmp eq i64 %n.mod.vf113, 0
  br i1 %cmp.n121, label %middle.block109..preheader.us15.preheader_crit_edge, label %middle.block109..lr.ph.us.new.preheader134_crit_edge

middle.block109..lr.ph.us.new.preheader134_crit_edge: ; preds = %middle.block109
  br label %.lr.ph.us.new.preheader134

middle.block109..preheader.us15.preheader_crit_edge: ; preds = %middle.block109
  br label %.preheader.us15.preheader

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph66
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %middle.block65.._crit_edge.us18_crit_edge, %._crit_edge.us18.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge9.us, label %._crit_edge.us18..preheader.us15_crit_edge

._crit_edge.us18..preheader.us15_crit_edge:       ; preds = %._crit_edge.us18
  br label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge13.loopexit, label %._crit_edge9.us..lr.ph.us_crit_edge

._crit_edge9.us..lr.ph.us_crit_edge:              ; preds = %._crit_edge9.us
  br label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader3..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %.preheader3..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.preheader3..lr.ph_crit_edge ], [ 1, %.lr.ph.preheader ]
  %99 = add i64 %indvars.iv53, -3
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %100 = trunc i64 %indvars.iv.next54 to i32
  %xtraiter48 = and i32 %100, 3
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  br i1 %lcmp.mod49, label %.lr.ph..prol.loopexit47_crit_edge, label %.prol.preheader46.preheader

.lr.ph..prol.loopexit47_crit_edge:                ; preds = %.lr.ph
  br label %.prol.loopexit47

.prol.preheader46.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader46

.prol.preheader46:                                ; preds = %.prol.preheader46..prol.preheader46_crit_edge, %.prol.preheader46.preheader
  %indvars.iv41.prol = phi i64 [ %indvars.iv.next42.prol, %.prol.preheader46..prol.preheader46_crit_edge ], [ 0, %.prol.preheader46.preheader ]
  %prol.iter50 = phi i32 [ %prol.iter50.sub, %.prol.preheader46..prol.preheader46_crit_edge ], [ %xtraiter48, %.prol.preheader46.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, %3
  store double %103, double* %101, align 8
  %indvars.iv.next42.prol = add nuw nsw i64 %indvars.iv41.prol, 1
  %prol.iter50.sub = add i32 %prol.iter50, -1
  %prol.iter50.cmp = icmp eq i32 %prol.iter50.sub, 0
  br i1 %prol.iter50.cmp, label %.prol.loopexit47.loopexit, label %.prol.preheader46..prol.preheader46_crit_edge, !llvm.loop !22

.prol.preheader46..prol.preheader46_crit_edge:    ; preds = %.prol.preheader46
  br label %.prol.preheader46

.prol.loopexit47.loopexit:                        ; preds = %.prol.preheader46
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.lr.ph..prol.loopexit47_crit_edge, %.prol.loopexit47.loopexit
  %indvars.iv41.unr = phi i64 [ 0, %.lr.ph..prol.loopexit47_crit_edge ], [ %indvars.iv.next42.prol, %.prol.loopexit47.loopexit ]
  %104 = icmp ult i64 %indvars.iv53, 3
  br i1 %104, label %.prol.loopexit47..preheader3_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit47..preheader3_crit_edge:           ; preds = %.prol.loopexit47
  br label %.preheader3

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit47
  %105 = sub i64 %99, %indvars.iv41.unr
  %106 = lshr i64 %105, 2
  %107 = add nuw nsw i64 %106, 1
  %min.iters.check = icmp ult i64 %107, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader..lr.ph.new.preheader135_crit_edge, label %min.iters.checked

.lr.ph.new.preheader..lr.ph.new.preheader135_crit_edge: ; preds = %.lr.ph.new.preheader
  br label %.lr.ph.new.preheader135

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %107, 1
  %n.vec = sub nsw i64 %107, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %108 = add i64 %indvars.iv41.unr, 4
  %109 = shl nuw i64 %106, 2
  %110 = add i64 %108, %109
  %111 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %110, %111
  br i1 %cmp.zero, label %min.iters.checked..lr.ph.new.preheader135_crit_edge, label %vector.ph

min.iters.checked..lr.ph.new.preheader135_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph.new.preheader135

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %112 = shl i64 %index, 2
  %113 = add i64 %indvars.iv41.unr, %112
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %113
  %115 = bitcast double* %114 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %115, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec59 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec60 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %116 = fmul <2 x double> %strided.vec, %broadcast.splat63
  %117 = fmul <2 x double> %strided.vec59, %broadcast.splat63
  %118 = fmul <2 x double> %strided.vec60, %broadcast.splat63
  %119 = add nsw i64 %113, 3
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %119
  %121 = fmul <2 x double> %strided.vec61, %broadcast.splat63
  %122 = getelementptr double, double* %120, i64 -3
  %123 = bitcast double* %122 to <8 x double>*
  %124 = shufflevector <2 x double> %116, <2 x double> %117, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %125 = shufflevector <2 x double> %118, <2 x double> %121, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %124, <4 x double> %125, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %123, align 8
  %index.next = add i64 %index, 2
  %126 = icmp eq i64 %index.next, %n.vec
  br i1 %126, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !23

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader3_crit_edge, label %middle.block..lr.ph.new.preheader135_crit_edge

middle.block..lr.ph.new.preheader135_crit_edge:   ; preds = %middle.block
  br label %.lr.ph.new.preheader135

middle.block..preheader3_crit_edge:               ; preds = %middle.block
  br label %.preheader3

.lr.ph.new.preheader135:                          ; preds = %middle.block..lr.ph.new.preheader135_crit_edge, %min.iters.checked..lr.ph.new.preheader135_crit_edge, %.lr.ph.new.preheader..lr.ph.new.preheader135_crit_edge
  %indvars.iv41.ph = phi i64 [ %indvars.iv41.unr, %min.iters.checked..lr.ph.new.preheader135_crit_edge ], [ %indvars.iv41.unr, %.lr.ph.new.preheader..lr.ph.new.preheader135_crit_edge ], [ %ind.end, %middle.block..lr.ph.new.preheader135_crit_edge ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader135
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv41.ph, %.lr.ph.new.preheader135 ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %3
  store double %129, double* %127, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %3
  store double %132, double* %130, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.1
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, %3
  store double %135, double* %133, align 8
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv41, 3
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.2
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, %3
  store double %138, double* %136, align 8
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next42.3, %indvars.iv51
  br i1 %exitcond45.3, label %.preheader3.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge, !llvm.loop !24

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %middle.block..preheader3_crit_edge, %.prol.loopexit47..preheader3_crit_edge, %.preheader3.loopexit
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge13.loopexit136, label %.preheader3..lr.ph_crit_edge

.preheader3..lr.ph_crit_edge:                     ; preds = %.preheader3
  br label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit136:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %._crit_edge13.loopexit136, %._crit_edge13.loopexit
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
  br i1 %7, label %.preheader.us.preheader, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge9 ]
  %11 = add nsw i64 %indvars.iv, %9
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge9:                                     ; preds = %17
  br label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
