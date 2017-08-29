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
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge3._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %._crit_edge.preheader.us.preheader, label %._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge

._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge: ; preds = %._crit_edge.preheader.lr.ph
  %.pre = zext i32 %0 to i64
  br label %._crit_edge4.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count28 = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.us.preheader, %._crit_edge._crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.us.preheader ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next18, %._crit_edge.us ]
  %12 = mul nuw nsw i64 %indvars.iv17, %indvars.iv21
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %10
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv17
  store double %17, double* %18, align 8
  %19 = add nuw nsw i64 %12, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %11
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv21, i64 %indvars.iv17
  store double %23, double* %24, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next18, %wide.trip.count28
  br i1 %exitcond29, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next22, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge4.preheader.lr.ph.loopexit, label %._crit_edge.preheader.us

._crit_edge4.preheader.lr.ph.loopexit:            ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge4.preheader.lr.ph

._crit_edge4.preheader.lr.ph:                     ; preds = %._crit_edge4.preheader.lr.ph.loopexit, %._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge
  %wide.trip.count26.pre-phi = phi i64 [ %.pre, %._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge ], [ %wide.trip.count30, %._crit_edge4.preheader.lr.ph.loopexit ]
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4._crit_edge.us, %._crit_edge4.preheader.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4._crit_edge.us ], [ 0, %._crit_edge4.preheader.lr.ph ]
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us, %._crit_edge4.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge4.preheader.us ], [ %indvars.iv.next, %._crit_edge4.us ]
  %25 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %0
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %11
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next, %wide.trip.count26.pre-phi
  br i1 %exitcond27, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %wide.trip.count26.pre-phi
  br i1 %exitcond, label %._crit_edge3._crit_edge.loopexit, label %._crit_edge4.preheader.us

._crit_edge3._crit_edge.loopexit:                 ; preds = %._crit_edge4._crit_edge.us
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3._crit_edge.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge12

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count57 = zext i32 %0 to i64
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count55 = zext i32 %0 to i64
  %broadcast.splatinsert111 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat112 = shufflevector <2 x double> %broadcast.splatinsert111, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert136 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat137 = shufflevector <2 x double> %broadcast.splatinsert136, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader139, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge.us ], [ %indvars.iv.ph, %._crit_edge.us.preheader139 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv37
  br i1 %exitcond.3, label %._crit_edge4.preheader.us16.preheader.loopexit, label %._crit_edge.us, !llvm.loop !1

._crit_edge4.preheader.us16.preheader.loopexit:   ; preds = %._crit_edge.us
  br label %._crit_edge4.preheader.us16.preheader

._crit_edge4.preheader.us16.preheader:            ; preds = %._crit_edge4.preheader.us16.preheader.loopexit, %middle.block114, %._crit_edge.us.prol.loopexit
  %min.iters.check72 = icmp ult i64 %72, 2
  %n.vec75 = and i64 %72, -2
  %cmp.zero76 = icmp eq i64 %n.vec75, 0
  %cmp.n107 = icmp eq i64 %72, %n.vec75
  br label %._crit_edge4.preheader.us16

._crit_edge4.us13:                                ; preds = %._crit_edge4.us13.preheader, %._crit_edge4.us13
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge4.us13 ], [ %indvars.iv26.ph, %._crit_edge4.us13.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv32
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv32
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv26
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next27, %indvars.iv37
  br i1 %exitcond31, label %._crit_edge4._crit_edge.us19.loopexit, label %._crit_edge4.us13, !llvm.loop !5

._crit_edge4.preheader.us16:                      ; preds = %._crit_edge4.preheader.us16.preheader, %._crit_edge4._crit_edge.us19
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge4._crit_edge.us19 ], [ 0, %._crit_edge4.preheader.us16.preheader ]
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv32
  %36 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %36
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv32
  %scevgep87 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv39, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv32
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv32
  br i1 %min.iters.check72, label %._crit_edge4.us13.preheader, label %min.iters.checked73

._crit_edge4.us13.preheader:                      ; preds = %middle.block70, %vector.memcheck, %min.iters.checked73, %._crit_edge4.preheader.us16
  %indvars.iv26.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked73 ], [ 0, %._crit_edge4.preheader.us16 ], [ %n.vec75, %middle.block70 ]
  br label %._crit_edge4.us13

min.iters.checked73:                              ; preds = %._crit_edge4.preheader.us16
  br i1 %cmp.zero76, label %._crit_edge4.us13.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked73
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep79
  %found.conflict = and i1 %bound0, %bound1
  %bound090 = icmp ult double* %scevgep, %scevgep83
  %bound191 = icmp ult double* %scevgep81, %scevgep79
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx = or i1 %found.conflict, %found.conflict92
  %bound093 = icmp ult double* %scevgep, %scevgep87
  %bound194 = icmp ult double* %scevgep85, %scevgep79
  %found.conflict95 = and i1 %bound093, %bound194
  %conflict.rdx96 = or i1 %conflict.rdx, %found.conflict95
  %bound099 = icmp ult double* %scevgep, %37
  %bound1100 = icmp ult double* %37, %scevgep79
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx102 = or i1 %conflict.rdx96, %found.conflict101
  br i1 %conflict.rdx102, label %._crit_edge4.us13.preheader, label %vector.ph103

vector.ph103:                                     ; preds = %vector.memcheck
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69, %vector.ph103
  %index104 = phi i64 [ 0, %vector.ph103 ], [ %index.next105, %vector.body69 ]
  %45 = or i64 %index104, 1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index104, i64 %indvars.iv32
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %45, i64 %indvars.iv32
  %48 = load double, double* %46, align 8, !alias.scope !11
  %49 = load double, double* %47, align 8, !alias.scope !11
  %50 = insertelement <2 x double> undef, double %48, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %51, %broadcast.splat112
  %53 = fmul <2 x double> %52, %41
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index104, i64 %indvars.iv32
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %45, i64 %indvars.iv32
  %56 = load double, double* %54, align 8, !alias.scope !13
  %57 = load double, double* %55, align 8, !alias.scope !13
  %58 = insertelement <2 x double> undef, double %56, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %59, %broadcast.splat112
  %61 = fmul <2 x double> %60, %44
  %62 = fadd <2 x double> %53, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %index104
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next105 = add i64 %index104, 2
  %67 = icmp eq i64 %index.next105, %n.vec75
  br i1 %67, label %middle.block70, label %vector.body69, !llvm.loop !18

middle.block70:                                   ; preds = %vector.body69
  br i1 %cmp.n107, label %._crit_edge4._crit_edge.us19, label %._crit_edge4.us13.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge3._crit_edge.us
  %indvars.iv142 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next143, %._crit_edge3._crit_edge.us ]
  %indvars.iv39 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %73, %._crit_edge3._crit_edge.us ]
  %indvars.iv37 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next38, %._crit_edge3._crit_edge.us ]
  %68 = zext i2 %indvars.iv142 to i64
  %69 = add i64 %indvars.iv39, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 0
  %70 = mul i64 %indvars.iv39, 1201
  %71 = add i64 %70, 1
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %71
  %72 = add nuw i64 %indvars.iv39, 1
  %73 = add nuw i64 %indvars.iv39, 1
  %xtraiter = and i64 %73, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  store double %76, double* %74, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !19

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %68, %._crit_edge.us.prol.loopexit.loopexit ]
  %77 = icmp ult i64 %indvars.iv39, 3
  br i1 %77, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %78 = sub i64 %69, %indvars.iv.unr
  %79 = lshr i64 %78, 2
  %80 = add nuw nsw i64 %79, 1
  %min.iters.check116 = icmp ult i64 %80, 2
  br i1 %min.iters.check116, label %._crit_edge.us.preheader139, label %min.iters.checked117

._crit_edge.us.preheader139:                      ; preds = %middle.block114, %min.iters.checked117, %._crit_edge.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked117 ], [ %indvars.iv.unr, %._crit_edge.us.preheader ], [ %ind.end125, %middle.block114 ]
  br label %._crit_edge.us

min.iters.checked117:                             ; preds = %._crit_edge.us.preheader
  %n.mod.vf118 = and i64 %80, 1
  %n.vec119 = sub nsw i64 %80, %n.mod.vf118
  %cmp.zero120 = icmp eq i64 %n.vec119, 0
  %81 = or i64 %indvars.iv.unr, 4
  %82 = shl nuw i64 %79, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf118, 2
  %ind.end125 = sub i64 %83, %84
  br i1 %cmp.zero120, label %._crit_edge.us.preheader139, label %vector.ph121

vector.ph121:                                     ; preds = %min.iters.checked117
  br label %vector.body113

vector.body113:                                   ; preds = %vector.body113, %vector.ph121
  %index122 = phi i64 [ 0, %vector.ph121 ], [ %index.next123, %vector.body113 ]
  %85 = shl i64 %index122, 2
  %86 = or i64 %indvars.iv.unr, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec131 = load <8 x double>, <8 x double>* %88, align 8
  %strided.vec132 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec133 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec134 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec135 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %89 = fmul <2 x double> %strided.vec132, %broadcast.splat137
  %90 = fmul <2 x double> %strided.vec133, %broadcast.splat137
  %91 = fmul <2 x double> %strided.vec134, %broadcast.splat137
  %92 = add nsw i64 %86, 3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %92
  %94 = fmul <2 x double> %strided.vec135, %broadcast.splat137
  %95 = getelementptr double, double* %93, i64 -3
  %96 = bitcast double* %95 to <8 x double>*
  %97 = shufflevector <2 x double> %89, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %98 = shufflevector <2 x double> %91, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec138 = shufflevector <4 x double> %97, <4 x double> %98, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec138, <8 x double>* %96, align 8
  %index.next123 = add i64 %index122, 2
  %99 = icmp eq i64 %index.next123, %n.vec119
  br i1 %99, label %middle.block114, label %vector.body113, !llvm.loop !21

middle.block114:                                  ; preds = %vector.body113
  %cmp.n126 = icmp eq i64 %n.mod.vf118, 0
  br i1 %cmp.n126, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.preheader139

._crit_edge4._crit_edge.us19.loopexit:            ; preds = %._crit_edge4.us13
  br label %._crit_edge4._crit_edge.us19

._crit_edge4._crit_edge.us19:                     ; preds = %._crit_edge4._crit_edge.us19.loopexit, %middle.block70
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next33, %wide.trip.count
  br i1 %exitcond54, label %._crit_edge3._crit_edge.us, label %._crit_edge4.preheader.us16

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge4._crit_edge.us19
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond56 = icmp eq i64 %73, %wide.trip.count55
  %indvars.iv.next143 = add i2 %indvars.iv142, 1
  br i1 %exitcond56, label %._crit_edge12.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge3.preheader
  %indvars.iv144 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next145, %._crit_edge3.preheader ]
  %indvars.iv50 = phi i64 [ 0, %.lr.ph.preheader ], [ %102, %._crit_edge3.preheader ]
  %indvars.iv48 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next49, %._crit_edge3.preheader ]
  %100 = zext i2 %indvars.iv144 to i64
  %101 = add i64 %indvars.iv50, -3
  %102 = add nuw i64 %indvars.iv50, 1
  %xtraiter59 = and i64 %102, 3
  %lcmp.mod60 = icmp eq i64 %xtraiter59, 0
  br i1 %lcmp.mod60, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv43.prol = phi i64 [ %indvars.iv.next44.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter61 = phi i64 [ %prol.iter61.sub, %._crit_edge.prol ], [ %xtraiter59, %._crit_edge.prol.preheader ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv43.prol
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %3
  store double %105, double* %103, align 8
  %indvars.iv.next44.prol = add nuw nsw i64 %indvars.iv43.prol, 1
  %prol.iter61.sub = add nsw i64 %prol.iter61, -1
  %prol.iter61.cmp = icmp eq i64 %prol.iter61.sub, 0
  br i1 %prol.iter61.cmp, label %._crit_edge.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !22

._crit_edge.prol.loopexit.loopexit:               ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv43.unr = phi i64 [ 0, %.lr.ph ], [ %100, %._crit_edge.prol.loopexit.loopexit ]
  %106 = icmp ult i64 %indvars.iv50, 3
  br i1 %106, label %._crit_edge3.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.prol.loopexit
  %107 = sub i64 %101, %indvars.iv43.unr
  %108 = lshr i64 %107, 2
  %109 = add nuw nsw i64 %108, 1
  %min.iters.check = icmp ult i64 %109, 2
  br i1 %min.iters.check, label %._crit_edge.preheader140, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge.preheader
  %n.mod.vf = and i64 %109, 1
  %n.vec = sub nsw i64 %109, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %110 = or i64 %indvars.iv43.unr, 4
  %111 = shl nuw i64 %108, 2
  %112 = add i64 %110, %111
  %113 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %112, %113
  br i1 %cmp.zero, label %._crit_edge.preheader140, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %114 = shl i64 %index, 2
  %115 = or i64 %indvars.iv43.unr, %114
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %115
  %117 = bitcast double* %116 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %117, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %118 = fmul <2 x double> %strided.vec, %broadcast.splat68
  %119 = fmul <2 x double> %strided.vec64, %broadcast.splat68
  %120 = fmul <2 x double> %strided.vec65, %broadcast.splat68
  %121 = add nsw i64 %115, 3
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %121
  %123 = fmul <2 x double> %strided.vec66, %broadcast.splat68
  %124 = getelementptr double, double* %122, i64 -3
  %125 = bitcast double* %124 to <8 x double>*
  %126 = shufflevector <2 x double> %118, <2 x double> %119, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %127 = shufflevector <2 x double> %120, <2 x double> %123, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %126, <4 x double> %127, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %125, align 8
  %index.next = add i64 %index, 2
  %128 = icmp eq i64 %index.next, %n.vec
  br i1 %128, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge3.preheader, label %._crit_edge.preheader140

._crit_edge.preheader140:                         ; preds = %middle.block, %min.iters.checked, %._crit_edge.preheader
  %indvars.iv43.ph = phi i64 [ %indvars.iv43.unr, %min.iters.checked ], [ %indvars.iv43.unr, %._crit_edge.preheader ], [ %ind.end, %middle.block ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader140, %._crit_edge
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.3, %._crit_edge ], [ %indvars.iv43.ph, %._crit_edge.preheader140 ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv43
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %3
  store double %131, double* %129, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next44
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %3
  store double %134, double* %132, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next44.1
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next44.2 = add nsw i64 %indvars.iv43, 3
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next44.2
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next44.3 = add nsw i64 %indvars.iv43, 4
  %exitcond47.3 = icmp eq i64 %indvars.iv.next44.3, %indvars.iv48
  br i1 %exitcond47.3, label %._crit_edge3.preheader.loopexit, label %._crit_edge, !llvm.loop !24

._crit_edge3.preheader.loopexit:                  ; preds = %._crit_edge
  br label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.loopexit, %middle.block, %._crit_edge.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond58 = icmp eq i64 %102, %wide.trip.count57
  %indvars.iv.next145 = add i2 %indvars.iv144, 1
  br i1 %exitcond58, label %._crit_edge12.loopexit141, label %.lr.ph

._crit_edge12.loopexit:                           ; preds = %._crit_edge3._crit_edge.us
  br label %._crit_edge12

._crit_edge12.loopexit141:                        ; preds = %._crit_edge3.preheader
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit141, %._crit_edge12.loopexit, %7
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count9 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %wide.trip.count9
  br i1 %exitcond10, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count9
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
