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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge17

.._crit_edge_crit_edge17:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge17, %.._crit_edge_crit_edge, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader36.lr.ph, label %..preheader35._crit_edge_crit_edge

..preheader35._crit_edge_crit_edge:               ; preds = %7
  br label %.preheader35._crit_edge

.preheader36.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader36.us.preheader, label %.preheader36.lr.ph..preheader.lr.ph_crit_edge

.preheader36.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader36.lr.ph
  br label %.preheader.lr.ph

.preheader36.us.preheader:                        ; preds = %.preheader36.lr.ph
  %wide.trip.count56 = zext i32 %1 to i64
  %wide.trip.count60 = zext i32 %0 to i64
  br label %.preheader36.us

.preheader36.us:                                  ; preds = %._crit_edge43.us..preheader36.us_crit_edge, %.preheader36.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge43.us..preheader36.us_crit_edge ], [ 0, %.preheader36.us.preheader ]
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %._crit_edge47.us.._crit_edge47.us_crit_edge, %.preheader36.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge47.us.._crit_edge47.us_crit_edge ], [ 0, %.preheader36.us ]
  %12 = mul nuw nsw i64 %indvars.iv54, %indvars.iv58
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %10
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv58, i64 %indvars.iv54
  store double %17, double* %18, align 8
  %19 = add nuw nsw i64 %12, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %11
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv58, i64 %indvars.iv54
  store double %23, double* %24, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge43.us, label %._crit_edge47.us.._crit_edge47.us_crit_edge

._crit_edge47.us.._crit_edge47.us_crit_edge:      ; preds = %._crit_edge47.us
  br label %._crit_edge47.us

._crit_edge43.us:                                 ; preds = %._crit_edge47.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %.preheader35, label %._crit_edge43.us..preheader36.us_crit_edge

._crit_edge43.us..preheader36.us_crit_edge:       ; preds = %._crit_edge43.us
  br label %.preheader36.us

.preheader35:                                     ; preds = %._crit_edge43.us
  %25 = icmp sgt i32 %0, 0
  br i1 %25, label %.preheader35..preheader.lr.ph_crit_edge, label %.preheader35..preheader35._crit_edge_crit_edge

.preheader35..preheader35._crit_edge_crit_edge:   ; preds = %.preheader35
  br label %.preheader35._crit_edge

.preheader35..preheader.lr.ph_crit_edge:          ; preds = %.preheader35
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader35..preheader.lr.ph_crit_edge, %.preheader36.lr.ph..preheader.lr.ph_crit_edge
  %26 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count52 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.._crit_edge48.us_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge48.us.._crit_edge48.us_crit_edge ], [ 0, %.preheader.us ]
  %27 = mul nuw nsw i64 %indvars.iv, %indvars.iv50
  %28 = add nuw nsw i64 %27, 3
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %0
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %26
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge48.us.._crit_edge48.us_crit_edge

._crit_edge48.us.._crit_edge48.us_crit_edge:      ; preds = %._crit_edge48.us
  br label %._crit_edge48.us

._crit_edge.us:                                   ; preds = %._crit_edge48.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %.preheader35._crit_edge.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader35._crit_edge.loopexit:                 ; preds = %._crit_edge.us
  br label %.preheader35._crit_edge

.preheader35._crit_edge:                          ; preds = %.preheader35..preheader35._crit_edge_crit_edge, %..preheader35._crit_edge_crit_edge, %.preheader35._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader35.lr.ph, label %.._crit_edge43_crit_edge

.._crit_edge43_crit_edge:                         ; preds = %7
  br label %._crit_edge43

.preheader35.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader35.lr.ph
  %wide.trip.count86 = zext i32 %0 to i64
  %broadcast.splatinsert97 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat98 = shufflevector <2 x double> %broadcast.splatinsert97, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader35.lr.ph
  %wide.trip.count68 = zext i32 %1 to i64
  %wide.trip.count75 = zext i32 %0 to i64
  %broadcast.splatinsert141 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat142 = shufflevector <2 x double> %broadcast.splatinsert141, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert166 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat167 = shufflevector <2 x double> %broadcast.splatinsert166, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge44.us:                                 ; preds = %._crit_edge44.us.._crit_edge44.us_crit_edge, %._crit_edge44.us.preheader169
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge44.us.._crit_edge44.us_crit_edge ], [ %indvars.iv.ph, %._crit_edge44.us.preheader169 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv71
  br i1 %exitcond.3, label %.preheader.us47.preheader.loopexit, label %._crit_edge44.us.._crit_edge44.us_crit_edge, !llvm.loop !1

._crit_edge44.us.._crit_edge44.us_crit_edge:      ; preds = %._crit_edge44.us
  br label %._crit_edge44.us

.preheader.us47.preheader.loopexit:               ; preds = %._crit_edge44.us
  br label %.preheader.us47.preheader

.preheader.us47.preheader:                        ; preds = %middle.block144..preheader.us47.preheader_crit_edge, %._crit_edge44.us.prol.loopexit..preheader.us47.preheader_crit_edge, %.preheader.us47.preheader.loopexit
  %min.iters.check102 = icmp ult i64 %71, 2
  %n.vec105 = and i64 %71, -2
  %cmp.zero106 = icmp eq i64 %n.vec105, 0
  %cmp.n137 = icmp eq i64 %71, %n.vec105
  br label %.preheader.us47

._crit_edge45.us52:                               ; preds = %._crit_edge45.us52.._crit_edge45.us52_crit_edge, %._crit_edge45.us52.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge45.us52.._crit_edge45.us52_crit_edge ], [ %indvars.iv60.ph, %._crit_edge45.us52.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %indvars.iv66
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv60, i64 %indvars.iv66
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv60
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next61, %indvars.iv71
  br i1 %exitcond65, label %._crit_edge.us50.loopexit, label %._crit_edge45.us52.._crit_edge45.us52_crit_edge, !llvm.loop !5

._crit_edge45.us52.._crit_edge45.us52_crit_edge:  ; preds = %._crit_edge45.us52
  br label %._crit_edge45.us52

.preheader.us47:                                  ; preds = %._crit_edge.us50..preheader.us47_crit_edge, %.preheader.us47.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge.us50..preheader.us47_crit_edge ], [ 0, %.preheader.us47.preheader ]
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv66
  %36 = add i64 %indvars.iv66, 1
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv73, i64 %36
  %scevgep115 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv66
  %scevgep117 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv73, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv73, i64 %indvars.iv66
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv73, i64 %indvars.iv66
  br i1 %min.iters.check102, label %.preheader.us47.._crit_edge45.us52.preheader_crit_edge, label %min.iters.checked103

.preheader.us47.._crit_edge45.us52.preheader_crit_edge: ; preds = %.preheader.us47
  br label %._crit_edge45.us52.preheader

._crit_edge45.us52.preheader:                     ; preds = %middle.block100.._crit_edge45.us52.preheader_crit_edge, %vector.memcheck.._crit_edge45.us52.preheader_crit_edge, %min.iters.checked103.._crit_edge45.us52.preheader_crit_edge, %.preheader.us47.._crit_edge45.us52.preheader_crit_edge
  %indvars.iv60.ph = phi i64 [ 0, %vector.memcheck.._crit_edge45.us52.preheader_crit_edge ], [ 0, %min.iters.checked103.._crit_edge45.us52.preheader_crit_edge ], [ 0, %.preheader.us47.._crit_edge45.us52.preheader_crit_edge ], [ %n.vec105, %middle.block100.._crit_edge45.us52.preheader_crit_edge ]
  br label %._crit_edge45.us52

min.iters.checked103:                             ; preds = %.preheader.us47
  br i1 %cmp.zero106, label %min.iters.checked103.._crit_edge45.us52.preheader_crit_edge, label %vector.memcheck

min.iters.checked103.._crit_edge45.us52.preheader_crit_edge: ; preds = %min.iters.checked103
  br label %._crit_edge45.us52.preheader

vector.memcheck:                                  ; preds = %min.iters.checked103
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep109
  %found.conflict = and i1 %bound0, %bound1
  %bound0120 = icmp ult double* %scevgep, %scevgep113
  %bound1121 = icmp ult double* %scevgep111, %scevgep109
  %found.conflict122 = and i1 %bound0120, %bound1121
  %conflict.rdx = or i1 %found.conflict, %found.conflict122
  %bound0123 = icmp ult double* %scevgep, %scevgep117
  %bound1124 = icmp ult double* %scevgep115, %scevgep109
  %found.conflict125 = and i1 %bound0123, %bound1124
  %conflict.rdx126 = or i1 %conflict.rdx, %found.conflict125
  %bound0129 = icmp ult double* %scevgep, %37
  %bound1130 = icmp ult double* %37, %scevgep109
  %found.conflict131 = and i1 %bound0129, %bound1130
  %conflict.rdx132 = or i1 %conflict.rdx126, %found.conflict131
  br i1 %conflict.rdx132, label %vector.memcheck.._crit_edge45.us52.preheader_crit_edge, label %vector.ph133

vector.memcheck.._crit_edge45.us52.preheader_crit_edge: ; preds = %vector.memcheck
  br label %._crit_edge45.us52.preheader

vector.ph133:                                     ; preds = %vector.memcheck
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99.vector.body99_crit_edge, %vector.ph133
  %index134 = phi i64 [ 0, %vector.ph133 ], [ %index.next135, %vector.body99.vector.body99_crit_edge ]
  %39 = or i64 %index134, 1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index134, i64 %indvars.iv66
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %39, i64 %indvars.iv66
  %42 = load double, double* %40, align 8, !alias.scope !6
  %43 = load double, double* %41, align 8, !alias.scope !6
  %44 = insertelement <2 x double> undef, double %42, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fmul <2 x double> %45, %broadcast.splat142
  %47 = load double, double* %37, align 8, !alias.scope !9
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %46, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index134, i64 %indvars.iv66
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %39, i64 %indvars.iv66
  %53 = load double, double* %51, align 8, !alias.scope !11
  %54 = load double, double* %52, align 8, !alias.scope !11
  %55 = insertelement <2 x double> undef, double %53, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %56, %broadcast.splat142
  %58 = load double, double* %38, align 8, !alias.scope !13
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = fmul <2 x double> %57, %60
  %62 = fadd <2 x double> %50, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %index134
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next135 = add i64 %index134, 2
  %67 = icmp eq i64 %index.next135, %n.vec105
  br i1 %67, label %middle.block100, label %vector.body99.vector.body99_crit_edge, !llvm.loop !18

vector.body99.vector.body99_crit_edge:            ; preds = %vector.body99
  br label %vector.body99

middle.block100:                                  ; preds = %vector.body99
  br i1 %cmp.n137, label %middle.block100.._crit_edge.us50_crit_edge, label %middle.block100.._crit_edge45.us52.preheader_crit_edge

middle.block100.._crit_edge45.us52.preheader_crit_edge: ; preds = %middle.block100
  br label %._crit_edge45.us52.preheader

middle.block100.._crit_edge.us50_crit_edge:       ; preds = %middle.block100
  br label %._crit_edge.us50

.lr.ph.us:                                        ; preds = %._crit_edge40.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge40.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge40.us..lr.ph.us_crit_edge ], [ 1, %.lr.ph.us.preheader ]
  %68 = add i64 %indvars.iv73, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 0
  %69 = mul i64 %indvars.iv73, 1201
  %70 = add i64 %69, 1
  %scevgep109 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %70
  %71 = add i64 %indvars.iv73, 1
  %72 = add i64 %indvars.iv73, 1
  %xtraiter = and i64 %72, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.._crit_edge44.us.prol.loopexit_crit_edge, label %._crit_edge44.us.prol.preheader

.lr.ph.us.._crit_edge44.us.prol.loopexit_crit_edge: ; preds = %.lr.ph.us
  br label %._crit_edge44.us.prol.loopexit

._crit_edge44.us.prol.preheader:                  ; preds = %.lr.ph.us
  br label %._crit_edge44.us.prol

._crit_edge44.us.prol:                            ; preds = %._crit_edge44.us.prol.._crit_edge44.us.prol_crit_edge, %._crit_edge44.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge44.us.prol.._crit_edge44.us.prol_crit_edge ], [ 0, %._crit_edge44.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge44.us.prol.._crit_edge44.us.prol_crit_edge ], [ %xtraiter, %._crit_edge44.us.prol.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  store double %75, double* %73, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge44.us.prol.loopexit.loopexit, label %._crit_edge44.us.prol.._crit_edge44.us.prol_crit_edge, !llvm.loop !19

._crit_edge44.us.prol.._crit_edge44.us.prol_crit_edge: ; preds = %._crit_edge44.us.prol
  br label %._crit_edge44.us.prol

._crit_edge44.us.prol.loopexit.loopexit:          ; preds = %._crit_edge44.us.prol
  br label %._crit_edge44.us.prol.loopexit

._crit_edge44.us.prol.loopexit:                   ; preds = %.lr.ph.us.._crit_edge44.us.prol.loopexit_crit_edge, %._crit_edge44.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us.._crit_edge44.us.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %._crit_edge44.us.prol.loopexit.loopexit ]
  %76 = icmp ult i64 %indvars.iv73, 3
  br i1 %76, label %._crit_edge44.us.prol.loopexit..preheader.us47.preheader_crit_edge, label %._crit_edge44.us.preheader

._crit_edge44.us.prol.loopexit..preheader.us47.preheader_crit_edge: ; preds = %._crit_edge44.us.prol.loopexit
  br label %.preheader.us47.preheader

._crit_edge44.us.preheader:                       ; preds = %._crit_edge44.us.prol.loopexit
  %77 = sub i64 %68, %indvars.iv.unr
  %78 = lshr i64 %77, 2
  %79 = add nuw nsw i64 %78, 1
  %min.iters.check146 = icmp ult i64 %79, 2
  br i1 %min.iters.check146, label %._crit_edge44.us.preheader.._crit_edge44.us.preheader169_crit_edge, label %min.iters.checked147

._crit_edge44.us.preheader.._crit_edge44.us.preheader169_crit_edge: ; preds = %._crit_edge44.us.preheader
  br label %._crit_edge44.us.preheader169

._crit_edge44.us.preheader169:                    ; preds = %middle.block144.._crit_edge44.us.preheader169_crit_edge, %min.iters.checked147.._crit_edge44.us.preheader169_crit_edge, %._crit_edge44.us.preheader.._crit_edge44.us.preheader169_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked147.._crit_edge44.us.preheader169_crit_edge ], [ %indvars.iv.unr, %._crit_edge44.us.preheader.._crit_edge44.us.preheader169_crit_edge ], [ %ind.end155, %middle.block144.._crit_edge44.us.preheader169_crit_edge ]
  br label %._crit_edge44.us

min.iters.checked147:                             ; preds = %._crit_edge44.us.preheader
  %n.mod.vf148 = and i64 %79, 1
  %n.vec149 = sub nsw i64 %79, %n.mod.vf148
  %cmp.zero150 = icmp eq i64 %n.vec149, 0
  %80 = add i64 %indvars.iv.unr, 4
  %81 = shl nuw i64 %78, 2
  %82 = add i64 %80, %81
  %83 = shl nuw nsw i64 %n.mod.vf148, 2
  %ind.end155 = sub i64 %82, %83
  br i1 %cmp.zero150, label %min.iters.checked147.._crit_edge44.us.preheader169_crit_edge, label %vector.ph151

min.iters.checked147.._crit_edge44.us.preheader169_crit_edge: ; preds = %min.iters.checked147
  br label %._crit_edge44.us.preheader169

vector.ph151:                                     ; preds = %min.iters.checked147
  br label %vector.body143

vector.body143:                                   ; preds = %vector.body143.vector.body143_crit_edge, %vector.ph151
  %index152 = phi i64 [ 0, %vector.ph151 ], [ %index.next153, %vector.body143.vector.body143_crit_edge ]
  %84 = shl i64 %index152, 2
  %85 = add i64 %indvars.iv.unr, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %85
  %87 = bitcast double* %86 to <8 x double>*
  %wide.vec161 = load <8 x double>, <8 x double>* %87, align 8
  %strided.vec162 = shufflevector <8 x double> %wide.vec161, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec163 = shufflevector <8 x double> %wide.vec161, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec164 = shufflevector <8 x double> %wide.vec161, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec165 = shufflevector <8 x double> %wide.vec161, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %88 = fmul <2 x double> %strided.vec162, %broadcast.splat167
  %89 = fmul <2 x double> %strided.vec163, %broadcast.splat167
  %90 = fmul <2 x double> %strided.vec164, %broadcast.splat167
  %91 = add nsw i64 %85, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %91
  %93 = fmul <2 x double> %strided.vec165, %broadcast.splat167
  %94 = getelementptr double, double* %92, i64 -3
  %95 = bitcast double* %94 to <8 x double>*
  %96 = shufflevector <2 x double> %88, <2 x double> %89, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %97 = shufflevector <2 x double> %90, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec168 = shufflevector <4 x double> %96, <4 x double> %97, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec168, <8 x double>* %95, align 8
  %index.next153 = add i64 %index152, 2
  %98 = icmp eq i64 %index.next153, %n.vec149
  br i1 %98, label %middle.block144, label %vector.body143.vector.body143_crit_edge, !llvm.loop !21

vector.body143.vector.body143_crit_edge:          ; preds = %vector.body143
  br label %vector.body143

middle.block144:                                  ; preds = %vector.body143
  %cmp.n156 = icmp eq i64 %n.mod.vf148, 0
  br i1 %cmp.n156, label %middle.block144..preheader.us47.preheader_crit_edge, label %middle.block144.._crit_edge44.us.preheader169_crit_edge

middle.block144.._crit_edge44.us.preheader169_crit_edge: ; preds = %middle.block144
  br label %._crit_edge44.us.preheader169

middle.block144..preheader.us47.preheader_crit_edge: ; preds = %middle.block144
  br label %.preheader.us47.preheader

._crit_edge.us50.loopexit:                        ; preds = %._crit_edge45.us52
  br label %._crit_edge.us50

._crit_edge.us50:                                 ; preds = %middle.block100.._crit_edge.us50_crit_edge, %._crit_edge.us50.loopexit
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %._crit_edge40.us, label %._crit_edge.us50..preheader.us47_crit_edge

._crit_edge.us50..preheader.us47_crit_edge:       ; preds = %._crit_edge.us50
  br label %.preheader.us47

._crit_edge40.us:                                 ; preds = %._crit_edge.us50
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond76, label %._crit_edge43.loopexit, label %._crit_edge40.us..lr.ph.us_crit_edge

._crit_edge40.us..lr.ph.us_crit_edge:             ; preds = %._crit_edge40.us
  br label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader34._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %.preheader34._crit_edge..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %.preheader34._crit_edge..lr.ph_crit_edge ], [ 1, %.lr.ph.preheader ]
  %99 = add i64 %indvars.iv84, -3
  %100 = add i64 %indvars.iv84, 1
  %xtraiter88 = and i64 %100, 3
  %lcmp.mod89 = icmp eq i64 %xtraiter88, 0
  br i1 %lcmp.mod89, label %.lr.ph.._crit_edge44.prol.loopexit_crit_edge, label %._crit_edge44.prol.preheader

.lr.ph.._crit_edge44.prol.loopexit_crit_edge:     ; preds = %.lr.ph
  br label %._crit_edge44.prol.loopexit

._crit_edge44.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge44.prol

._crit_edge44.prol:                               ; preds = %._crit_edge44.prol.._crit_edge44.prol_crit_edge, %._crit_edge44.prol.preheader
  %indvars.iv77.prol = phi i64 [ %indvars.iv.next78.prol, %._crit_edge44.prol.._crit_edge44.prol_crit_edge ], [ 0, %._crit_edge44.prol.preheader ]
  %prol.iter90 = phi i64 [ %prol.iter90.sub, %._crit_edge44.prol.._crit_edge44.prol_crit_edge ], [ %xtraiter88, %._crit_edge44.prol.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv77.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, %3
  store double %103, double* %101, align 8
  %indvars.iv.next78.prol = add nuw nsw i64 %indvars.iv77.prol, 1
  %prol.iter90.sub = add i64 %prol.iter90, -1
  %prol.iter90.cmp = icmp eq i64 %prol.iter90.sub, 0
  br i1 %prol.iter90.cmp, label %._crit_edge44.prol.loopexit.loopexit, label %._crit_edge44.prol.._crit_edge44.prol_crit_edge, !llvm.loop !22

._crit_edge44.prol.._crit_edge44.prol_crit_edge:  ; preds = %._crit_edge44.prol
  br label %._crit_edge44.prol

._crit_edge44.prol.loopexit.loopexit:             ; preds = %._crit_edge44.prol
  br label %._crit_edge44.prol.loopexit

._crit_edge44.prol.loopexit:                      ; preds = %.lr.ph.._crit_edge44.prol.loopexit_crit_edge, %._crit_edge44.prol.loopexit.loopexit
  %indvars.iv77.unr = phi i64 [ 0, %.lr.ph.._crit_edge44.prol.loopexit_crit_edge ], [ %indvars.iv.next78.prol, %._crit_edge44.prol.loopexit.loopexit ]
  %104 = icmp ult i64 %indvars.iv84, 3
  br i1 %104, label %._crit_edge44.prol.loopexit..preheader34._crit_edge_crit_edge, label %._crit_edge44.preheader

._crit_edge44.prol.loopexit..preheader34._crit_edge_crit_edge: ; preds = %._crit_edge44.prol.loopexit
  br label %.preheader34._crit_edge

._crit_edge44.preheader:                          ; preds = %._crit_edge44.prol.loopexit
  %105 = sub i64 %99, %indvars.iv77.unr
  %106 = lshr i64 %105, 2
  %107 = add nuw nsw i64 %106, 1
  %min.iters.check = icmp ult i64 %107, 2
  br i1 %min.iters.check, label %._crit_edge44.preheader.._crit_edge44.preheader170_crit_edge, label %min.iters.checked

._crit_edge44.preheader.._crit_edge44.preheader170_crit_edge: ; preds = %._crit_edge44.preheader
  br label %._crit_edge44.preheader170

min.iters.checked:                                ; preds = %._crit_edge44.preheader
  %n.mod.vf = and i64 %107, 1
  %n.vec = sub nsw i64 %107, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %108 = add i64 %indvars.iv77.unr, 4
  %109 = shl nuw i64 %106, 2
  %110 = add i64 %108, %109
  %111 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %110, %111
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge44.preheader170_crit_edge, label %vector.ph

min.iters.checked.._crit_edge44.preheader170_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge44.preheader170

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %112 = shl i64 %index, 2
  %113 = add i64 %indvars.iv77.unr, %112
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %113
  %115 = bitcast double* %114 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %115, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec94 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec95 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec96 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %116 = fmul <2 x double> %strided.vec, %broadcast.splat98
  %117 = fmul <2 x double> %strided.vec94, %broadcast.splat98
  %118 = fmul <2 x double> %strided.vec95, %broadcast.splat98
  %119 = add nsw i64 %113, 3
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %119
  %121 = fmul <2 x double> %strided.vec96, %broadcast.splat98
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
  br i1 %cmp.n, label %middle.block..preheader34._crit_edge_crit_edge, label %middle.block.._crit_edge44.preheader170_crit_edge

middle.block.._crit_edge44.preheader170_crit_edge: ; preds = %middle.block
  br label %._crit_edge44.preheader170

middle.block..preheader34._crit_edge_crit_edge:   ; preds = %middle.block
  br label %.preheader34._crit_edge

._crit_edge44.preheader170:                       ; preds = %middle.block.._crit_edge44.preheader170_crit_edge, %min.iters.checked.._crit_edge44.preheader170_crit_edge, %._crit_edge44.preheader.._crit_edge44.preheader170_crit_edge
  %indvars.iv77.ph = phi i64 [ %indvars.iv77.unr, %min.iters.checked.._crit_edge44.preheader170_crit_edge ], [ %indvars.iv77.unr, %._crit_edge44.preheader.._crit_edge44.preheader170_crit_edge ], [ %ind.end, %middle.block.._crit_edge44.preheader170_crit_edge ]
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.._crit_edge44_crit_edge, %._crit_edge44.preheader170
  %indvars.iv77 = phi i64 [ %indvars.iv.next78.3, %._crit_edge44.._crit_edge44_crit_edge ], [ %indvars.iv77.ph, %._crit_edge44.preheader170 ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv77
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %3
  store double %129, double* %127, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next78
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %3
  store double %132, double* %130, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next78.1
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, %3
  store double %135, double* %133, align 8
  %indvars.iv.next78.2 = add nsw i64 %indvars.iv77, 3
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next78.2
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, %3
  store double %138, double* %136, align 8
  %indvars.iv.next78.3 = add nsw i64 %indvars.iv77, 4
  %exitcond81.3 = icmp eq i64 %indvars.iv.next78.3, %indvars.iv82
  br i1 %exitcond81.3, label %.preheader34._crit_edge.loopexit, label %._crit_edge44.._crit_edge44_crit_edge, !llvm.loop !24

._crit_edge44.._crit_edge44_crit_edge:            ; preds = %._crit_edge44
  br label %._crit_edge44

.preheader34._crit_edge.loopexit:                 ; preds = %._crit_edge44
  br label %.preheader34._crit_edge

.preheader34._crit_edge:                          ; preds = %middle.block..preheader34._crit_edge_crit_edge, %._crit_edge44.prol.loopexit..preheader34._crit_edge_crit_edge, %.preheader34._crit_edge.loopexit
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  br i1 %exitcond87, label %._crit_edge43.loopexit171, label %.preheader34._crit_edge..lr.ph_crit_edge

.preheader34._crit_edge..lr.ph_crit_edge:         ; preds = %.preheader34._crit_edge
  br label %.lr.ph

._crit_edge43.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge43

._crit_edge43.loopexit171:                        ; preds = %.preheader34._crit_edge
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %.._crit_edge43_crit_edge, %._crit_edge43.loopexit171, %._crit_edge43.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %2
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count19 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next18, %._crit_edge.us..preheader.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv17, %8
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge15.us.._crit_edge16.us_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge15.us.._crit_edge16.us_crit_edge ], [ 0, %.preheader.us ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge16.us.._crit_edge15.us_crit_edge

._crit_edge16.us.._crit_edge15.us_crit_edge:      ; preds = %._crit_edge16.us
  br label %._crit_edge15.us

; <label>:14:                                     ; preds = %._crit_edge16.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge16.us.._crit_edge15.us_crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge15.us.._crit_edge16.us_crit_edge

._crit_edge15.us.._crit_edge16.us_crit_edge:      ; preds = %._crit_edge15.us
  br label %._crit_edge16.us

._crit_edge.us:                                   ; preds = %._crit_edge15.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  br i1 %exitcond20, label %._crit_edge14.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.._crit_edge14_crit_edge, %._crit_edge14.loopexit
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
