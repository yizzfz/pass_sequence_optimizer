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
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge1, %._crit_edge, %17
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
  %.pre = zext i32 %0 to i64
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
  br i1 %exitcond26, label %.preheader.lr.ph.loopexit, label %._crit_edge11.us..preheader4.us_crit_edge

._crit_edge11.us..preheader4.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %.preheader4.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge11.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %.preheader4.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count25, %.preheader.lr.ph.loopexit ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  br label %26

; <label>:26:                                     ; preds = %._crit_edge29, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge29 ]
  %27 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %28 = add nuw nsw i64 %27, 3
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %0
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %11
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge29

._crit_edge29:                                    ; preds = %26
  br label %26

._crit_edge.us:                                   ; preds = %26
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count.pre-phi
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %7
  br label %._crit_edge11

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count53 = zext i32 %0 to i64
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count30 = zext i32 %1 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  %broadcast.splatinsert104 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat105 = shufflevector <2 x double> %broadcast.splatinsert104, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert129 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat130 = shufflevector <2 x double> %broadcast.splatinsert129, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader132
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader132 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %.preheader.us13.preheader.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.preheader.us13.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us13.preheader

.preheader.us13.preheader:                        ; preds = %middle.block107..preheader.us13.preheader_crit_edge, %.prol.loopexit..preheader.us13.preheader_crit_edge, %.preheader.us13.preheader.loopexit
  %min.iters.check65 = icmp ult i64 %75, 2
  %n.vec68 = and i64 %75, -2
  %cmp.zero69 = icmp eq i64 %n.vec68, 0
  %cmp.n100 = icmp eq i64 %75, %n.vec68
  br label %.preheader.us13

scalar.ph64:                                      ; preds = %scalar.ph64.scalar.ph64_crit_edge, %scalar.ph64.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %scalar.ph64.scalar.ph64_crit_edge ], [ %indvars.iv23.ph, %scalar.ph64.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv28
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv28
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv23
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, %indvars.iv33
  br i1 %exitcond, label %._crit_edge.us16.loopexit, label %scalar.ph64.scalar.ph64_crit_edge, !llvm.loop !5

scalar.ph64.scalar.ph64_crit_edge:                ; preds = %scalar.ph64
  br label %scalar.ph64

.preheader.us13:                                  ; preds = %._crit_edge.us16..preheader.us13_crit_edge, %.preheader.us13.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us16..preheader.us13_crit_edge ], [ 0, %.preheader.us13.preheader ]
  %scevgep74 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv28
  %36 = add nuw nsw i64 %indvars.iv28, 1
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %36
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv28
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv35, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv28
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv28
  br i1 %min.iters.check65, label %.preheader.us13.scalar.ph64.preheader_crit_edge, label %min.iters.checked66

.preheader.us13.scalar.ph64.preheader_crit_edge:  ; preds = %.preheader.us13
  br label %scalar.ph64.preheader

scalar.ph64.preheader:                            ; preds = %middle.block63.scalar.ph64.preheader_crit_edge, %vector.memcheck.scalar.ph64.preheader_crit_edge, %min.iters.checked66.scalar.ph64.preheader_crit_edge, %.preheader.us13.scalar.ph64.preheader_crit_edge
  %indvars.iv23.ph = phi i64 [ 0, %vector.memcheck.scalar.ph64.preheader_crit_edge ], [ 0, %min.iters.checked66.scalar.ph64.preheader_crit_edge ], [ 0, %.preheader.us13.scalar.ph64.preheader_crit_edge ], [ %n.vec68, %middle.block63.scalar.ph64.preheader_crit_edge ]
  br label %scalar.ph64

min.iters.checked66:                              ; preds = %.preheader.us13
  br i1 %cmp.zero69, label %min.iters.checked66.scalar.ph64.preheader_crit_edge, label %vector.memcheck

min.iters.checked66.scalar.ph64.preheader_crit_edge: ; preds = %min.iters.checked66
  br label %scalar.ph64.preheader

vector.memcheck:                                  ; preds = %min.iters.checked66
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep72
  %found.conflict = and i1 %bound0, %bound1
  %bound083 = icmp ult double* %scevgep, %scevgep76
  %bound184 = icmp ult double* %scevgep74, %scevgep72
  %found.conflict85 = and i1 %bound083, %bound184
  %conflict.rdx = or i1 %found.conflict, %found.conflict85
  %bound086 = icmp ult double* %scevgep, %scevgep80
  %bound187 = icmp ult double* %scevgep78, %scevgep72
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx89 = or i1 %conflict.rdx, %found.conflict88
  %bound092 = icmp ult double* %scevgep, %37
  %bound193 = icmp ult double* %37, %scevgep72
  %found.conflict94 = and i1 %bound092, %bound193
  %conflict.rdx95 = or i1 %conflict.rdx89, %found.conflict94
  br i1 %conflict.rdx95, label %vector.memcheck.scalar.ph64.preheader_crit_edge, label %vector.ph96

vector.memcheck.scalar.ph64.preheader_crit_edge:  ; preds = %vector.memcheck
  br label %scalar.ph64.preheader

vector.ph96:                                      ; preds = %vector.memcheck
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body62

vector.body62:                                    ; preds = %vector.body62.vector.body62_crit_edge, %vector.ph96
  %index97 = phi i64 [ 0, %vector.ph96 ], [ %index.next98, %vector.body62.vector.body62_crit_edge ]
  %45 = or i64 %index97, 1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index97, i64 %indvars.iv28
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %45, i64 %indvars.iv28
  %48 = load double, double* %46, align 8, !alias.scope !11
  %49 = load double, double* %47, align 8, !alias.scope !11
  %50 = insertelement <2 x double> undef, double %48, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %51, %broadcast.splat105
  %53 = fmul <2 x double> %52, %41
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index97, i64 %indvars.iv28
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %45, i64 %indvars.iv28
  %56 = load double, double* %54, align 8, !alias.scope !13
  %57 = load double, double* %55, align 8, !alias.scope !13
  %58 = insertelement <2 x double> undef, double %56, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %59, %broadcast.splat105
  %61 = fmul <2 x double> %60, %44
  %62 = fadd <2 x double> %53, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %index97
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next98 = add i64 %index97, 2
  %67 = icmp eq i64 %index.next98, %n.vec68
  br i1 %67, label %middle.block63, label %vector.body62.vector.body62_crit_edge, !llvm.loop !18

vector.body62.vector.body62_crit_edge:            ; preds = %vector.body62
  br label %vector.body62

middle.block63:                                   ; preds = %vector.body62
  br i1 %cmp.n100, label %middle.block63.._crit_edge.us16_crit_edge, label %middle.block63.scalar.ph64.preheader_crit_edge

middle.block63.scalar.ph64.preheader_crit_edge:   ; preds = %middle.block63
  br label %scalar.ph64.preheader

middle.block63.._crit_edge.us16_crit_edge:        ; preds = %middle.block63
  br label %._crit_edge.us16

.lr.ph.us:                                        ; preds = %._crit_edge9.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader
  %indvars.iv135 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next136, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %indvars.iv35 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next36, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %indvars.iv33 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next34, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %68 = zext i2 %indvars.iv135 to i64
  %69 = add nuw nsw i64 %68, 4294967295
  %70 = and i64 %69, 4294967295
  %71 = add nuw nsw i64 %70, 1
  %72 = add nsw i64 %indvars.iv35, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 0
  %73 = mul i64 %indvars.iv35, 1201
  %74 = add i64 %73, 1
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %74
  %75 = add nuw nsw i64 %indvars.iv35, 1
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %76 = trunc i64 %indvars.iv.next36 to i32
  %xtraiter = and i32 %76, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  store double %79, double* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !19

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %71, %.prol.loopexit.loopexit ]
  %80 = icmp ult i64 %indvars.iv35, 3
  br i1 %80, label %.prol.loopexit..preheader.us13.preheader_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit..preheader.us13.preheader_crit_edge: ; preds = %.prol.loopexit
  br label %.preheader.us13.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %81 = sub i64 %72, %indvars.iv.unr
  %82 = lshr i64 %81, 2
  %83 = add nuw nsw i64 %82, 1
  %min.iters.check109 = icmp ult i64 %83, 2
  br i1 %min.iters.check109, label %.lr.ph.us.new.preheader..lr.ph.us.new.preheader132_crit_edge, label %min.iters.checked110

.lr.ph.us.new.preheader..lr.ph.us.new.preheader132_crit_edge: ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.preheader132

.lr.ph.us.new.preheader132:                       ; preds = %middle.block107..lr.ph.us.new.preheader132_crit_edge, %min.iters.checked110..lr.ph.us.new.preheader132_crit_edge, %.lr.ph.us.new.preheader..lr.ph.us.new.preheader132_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked110..lr.ph.us.new.preheader132_crit_edge ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader..lr.ph.us.new.preheader132_crit_edge ], [ %ind.end118, %middle.block107..lr.ph.us.new.preheader132_crit_edge ]
  br label %.lr.ph.us.new

min.iters.checked110:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf111 = and i64 %83, 1
  %n.vec112 = sub nsw i64 %83, %n.mod.vf111
  %cmp.zero113 = icmp eq i64 %n.vec112, 0
  %84 = add nsw i64 %indvars.iv.unr, 4
  %85 = shl nuw i64 %82, 2
  %86 = add i64 %84, %85
  %87 = shl nuw nsw i64 %n.mod.vf111, 2
  %ind.end118 = sub i64 %86, %87
  br i1 %cmp.zero113, label %min.iters.checked110..lr.ph.us.new.preheader132_crit_edge, label %vector.ph114

min.iters.checked110..lr.ph.us.new.preheader132_crit_edge: ; preds = %min.iters.checked110
  br label %.lr.ph.us.new.preheader132

vector.ph114:                                     ; preds = %min.iters.checked110
  br label %vector.body106

vector.body106:                                   ; preds = %vector.body106.vector.body106_crit_edge, %vector.ph114
  %index115 = phi i64 [ 0, %vector.ph114 ], [ %index.next116, %vector.body106.vector.body106_crit_edge ]
  %88 = shl i64 %index115, 2
  %89 = add i64 %indvars.iv.unr, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %89
  %91 = bitcast double* %90 to <8 x double>*
  %wide.vec124 = load <8 x double>, <8 x double>* %91, align 8
  %strided.vec125 = shufflevector <8 x double> %wide.vec124, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec126 = shufflevector <8 x double> %wide.vec124, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec127 = shufflevector <8 x double> %wide.vec124, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec128 = shufflevector <8 x double> %wide.vec124, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %92 = fmul <2 x double> %strided.vec125, %broadcast.splat130
  %93 = fmul <2 x double> %strided.vec126, %broadcast.splat130
  %94 = fmul <2 x double> %strided.vec127, %broadcast.splat130
  %95 = add nsw i64 %89, 3
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %95
  %97 = fmul <2 x double> %strided.vec128, %broadcast.splat130
  %98 = getelementptr double, double* %96, i64 -3
  %99 = bitcast double* %98 to <8 x double>*
  %100 = shufflevector <2 x double> %92, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %101 = shufflevector <2 x double> %94, <2 x double> %97, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec131 = shufflevector <4 x double> %100, <4 x double> %101, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec131, <8 x double>* %99, align 8
  %index.next116 = add i64 %index115, 2
  %102 = icmp eq i64 %index.next116, %n.vec112
  br i1 %102, label %middle.block107, label %vector.body106.vector.body106_crit_edge, !llvm.loop !21

vector.body106.vector.body106_crit_edge:          ; preds = %vector.body106
  br label %vector.body106

middle.block107:                                  ; preds = %vector.body106
  %cmp.n119 = icmp eq i64 %n.mod.vf111, 0
  br i1 %cmp.n119, label %middle.block107..preheader.us13.preheader_crit_edge, label %middle.block107..lr.ph.us.new.preheader132_crit_edge

middle.block107..lr.ph.us.new.preheader132_crit_edge: ; preds = %middle.block107
  br label %.lr.ph.us.new.preheader132

middle.block107..preheader.us13.preheader_crit_edge: ; preds = %middle.block107
  br label %.preheader.us13.preheader

._crit_edge.us16.loopexit:                        ; preds = %scalar.ph64
  br label %._crit_edge.us16

._crit_edge.us16:                                 ; preds = %middle.block63.._crit_edge.us16_crit_edge, %._crit_edge.us16.loopexit
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge9.us, label %._crit_edge.us16..preheader.us13_crit_edge

._crit_edge.us16..preheader.us13_crit_edge:       ; preds = %._crit_edge.us16
  br label %.preheader.us13

._crit_edge9.us:                                  ; preds = %._crit_edge.us16
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  %indvars.iv.next136 = add i2 %indvars.iv135, 1
  br i1 %exitcond38, label %._crit_edge11.loopexit, label %._crit_edge9.us..lr.ph.us_crit_edge

._crit_edge9.us..lr.ph.us_crit_edge:              ; preds = %._crit_edge9.us
  br label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader3..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv137 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next138, %.preheader3..lr.ph_crit_edge ]
  %indvars.iv51 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next52, %.preheader3..lr.ph_crit_edge ]
  %indvars.iv49 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next50, %.preheader3..lr.ph_crit_edge ]
  %103 = zext i2 %indvars.iv137 to i64
  %104 = add nuw nsw i64 %103, 4294967295
  %105 = and i64 %104, 4294967295
  %106 = add nuw nsw i64 %105, 1
  %107 = add nsw i64 %indvars.iv51, -3
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %108 = trunc i64 %indvars.iv.next52 to i32
  %xtraiter46 = and i32 %108, 3
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.lr.ph..prol.loopexit45_crit_edge, label %.prol.preheader44.preheader

.lr.ph..prol.loopexit45_crit_edge:                ; preds = %.lr.ph
  br label %.prol.loopexit45

.prol.preheader44.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader44

.prol.preheader44:                                ; preds = %.prol.preheader44..prol.preheader44_crit_edge, %.prol.preheader44.preheader
  %indvars.iv39.prol = phi i64 [ %indvars.iv.next40.prol, %.prol.preheader44..prol.preheader44_crit_edge ], [ 0, %.prol.preheader44.preheader ]
  %prol.iter48 = phi i32 [ %prol.iter48.sub, %.prol.preheader44..prol.preheader44_crit_edge ], [ %xtraiter46, %.prol.preheader44.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv39.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next40.prol = add nuw nsw i64 %indvars.iv39.prol, 1
  %prol.iter48.sub = add nsw i32 %prol.iter48, -1
  %prol.iter48.cmp = icmp eq i32 %prol.iter48.sub, 0
  br i1 %prol.iter48.cmp, label %.prol.loopexit45.loopexit, label %.prol.preheader44..prol.preheader44_crit_edge, !llvm.loop !22

.prol.preheader44..prol.preheader44_crit_edge:    ; preds = %.prol.preheader44
  br label %.prol.preheader44

.prol.loopexit45.loopexit:                        ; preds = %.prol.preheader44
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.lr.ph..prol.loopexit45_crit_edge, %.prol.loopexit45.loopexit
  %indvars.iv39.unr = phi i64 [ 0, %.lr.ph..prol.loopexit45_crit_edge ], [ %106, %.prol.loopexit45.loopexit ]
  %112 = icmp ult i64 %indvars.iv51, 3
  br i1 %112, label %.prol.loopexit45..preheader3_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit45..preheader3_crit_edge:           ; preds = %.prol.loopexit45
  br label %.preheader3

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit45
  %113 = sub i64 %107, %indvars.iv39.unr
  %114 = lshr i64 %113, 2
  %115 = add nuw nsw i64 %114, 1
  %min.iters.check = icmp ult i64 %115, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader..lr.ph.new.preheader133_crit_edge, label %min.iters.checked

.lr.ph.new.preheader..lr.ph.new.preheader133_crit_edge: ; preds = %.lr.ph.new.preheader
  br label %.lr.ph.new.preheader133

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %115, 1
  %n.vec = sub nsw i64 %115, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %116 = add nsw i64 %indvars.iv39.unr, 4
  %117 = shl nuw i64 %114, 2
  %118 = add i64 %116, %117
  %119 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %118, %119
  br i1 %cmp.zero, label %min.iters.checked..lr.ph.new.preheader133_crit_edge, label %vector.ph

min.iters.checked..lr.ph.new.preheader133_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph.new.preheader133

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %120 = shl i64 %index, 2
  %121 = add i64 %indvars.iv39.unr, %120
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %121
  %123 = bitcast double* %122 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %123, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec57 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec58 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec59 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %124 = fmul <2 x double> %strided.vec, %broadcast.splat61
  %125 = fmul <2 x double> %strided.vec57, %broadcast.splat61
  %126 = fmul <2 x double> %strided.vec58, %broadcast.splat61
  %127 = add nsw i64 %121, 3
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %127
  %129 = fmul <2 x double> %strided.vec59, %broadcast.splat61
  %130 = getelementptr double, double* %128, i64 -3
  %131 = bitcast double* %130 to <8 x double>*
  %132 = shufflevector <2 x double> %124, <2 x double> %125, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %133 = shufflevector <2 x double> %126, <2 x double> %129, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %132, <4 x double> %133, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %131, align 8
  %index.next = add i64 %index, 2
  %134 = icmp eq i64 %index.next, %n.vec
  br i1 %134, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !23

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader3_crit_edge, label %middle.block..lr.ph.new.preheader133_crit_edge

middle.block..lr.ph.new.preheader133_crit_edge:   ; preds = %middle.block
  br label %.lr.ph.new.preheader133

middle.block..preheader3_crit_edge:               ; preds = %middle.block
  br label %.preheader3

.lr.ph.new.preheader133:                          ; preds = %middle.block..lr.ph.new.preheader133_crit_edge, %min.iters.checked..lr.ph.new.preheader133_crit_edge, %.lr.ph.new.preheader..lr.ph.new.preheader133_crit_edge
  %indvars.iv39.ph = phi i64 [ %indvars.iv39.unr, %min.iters.checked..lr.ph.new.preheader133_crit_edge ], [ %indvars.iv39.unr, %.lr.ph.new.preheader..lr.ph.new.preheader133_crit_edge ], [ %ind.end, %middle.block..lr.ph.new.preheader133_crit_edge ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader133
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv39.ph, %.lr.ph.new.preheader133 ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv39
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next40
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next40.1
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %3
  store double %143, double* %141, align 8
  %indvars.iv.next40.2 = add nsw i64 %indvars.iv39, 3
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next40.2
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, %3
  store double %146, double* %144, align 8
  %indvars.iv.next40.3 = add nsw i64 %indvars.iv39, 4
  %exitcond43.3 = icmp eq i64 %indvars.iv.next40.3, %indvars.iv49
  br i1 %exitcond43.3, label %.preheader3.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge, !llvm.loop !24

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %middle.block..preheader3_crit_edge, %.prol.loopexit45..preheader3_crit_edge, %.preheader3.loopexit
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  %indvars.iv.next138 = add i2 %indvars.iv137, 1
  br i1 %exitcond54, label %._crit_edge11.loopexit134, label %.preheader3..lr.ph_crit_edge

.preheader3..lr.ph_crit_edge:                     ; preds = %.preheader3
  br label %.lr.ph

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11.loopexit134:                        ; preds = %.preheader3
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %._crit_edge11.loopexit134, %._crit_edge11.loopexit
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
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
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge9:                                     ; preds = %17
  br label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
