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

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge3._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %1 to double
  br i1 %9, label %._crit_edge.preheader.us.preheader, label %._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge

._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge: ; preds = %._crit_edge.preheader.lr.ph
  %.pre27 = zext i32 %0 to i64
  br label %._crit_edge4.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %11 = sitofp i32 %0 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = insertelement <2 x double> %12, double %10, i32 1
  %wide.trip.count19 = zext i32 %1 to i64
  %wide.trip.count23 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.us.preheader, %._crit_edge._crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.us.preheader ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next18, %._crit_edge.us ]
  %14 = mul nuw nsw i64 %indvars.iv17, %indvars.iv21
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv17
  %20 = add nuw nsw i64 %14, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %18, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fdiv <2 x double> %25, %13
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  store double %27, double* %19, align 8
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv21, i64 %indvars.iv17
  store double %28, double* %29, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  br i1 %exitcond20, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge4.preheader.lr.ph.loopexit, label %._crit_edge.preheader.us

._crit_edge4.preheader.lr.ph.loopexit:            ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge4.preheader.lr.ph

._crit_edge4.preheader.lr.ph:                     ; preds = %._crit_edge4.preheader.lr.ph.loopexit, %._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre27, %._crit_edge.preheader.lr.ph.._crit_edge4.preheader.lr.ph_crit_edge ], [ %wide.trip.count23, %._crit_edge4.preheader.lr.ph.loopexit ]
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4._crit_edge.us, %._crit_edge4.preheader.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4._crit_edge.us ], [ 0, %._crit_edge4.preheader.lr.ph ]
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us, %._crit_edge4.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge4.preheader.us ], [ %indvars.iv.next, %._crit_edge4.us ]
  %30 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %31 = add nuw nsw i64 %30, 3
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %0
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %10
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count.pre-phi
  br i1 %exitcond16, label %._crit_edge3._crit_edge.loopexit, label %._crit_edge4.preheader.us

._crit_edge3._crit_edge.loopexit:                 ; preds = %._crit_edge4._crit_edge.us
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3._crit_edge.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge12

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count54 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %3, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count33 = zext i32 %1 to i64
  %wide.trip.count40 = zext i32 %0 to i64
  %12 = insertelement <2 x double> undef, double %3, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert83 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat84 = shufflevector <2 x double> %broadcast.splatinsert83, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr95.ph, %._crit_edge.us.preheader.new ], [ %indvars.iv.next.3.1, %._crit_edge.us ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %15 = bitcast double* %14 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %17 = fmul <2 x double> %16, %13
  store <2 x double> %17, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %19 = bitcast double* %18 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %21 = fmul <2 x double> %20, %13
  store <2 x double> %21, <2 x double>* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.3
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, %13
  store <2 x double> %25, <2 x double>* %23, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1.1
  %27 = bitcast double* %26 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, %13
  store <2 x double> %29, <2 x double>* %27, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv36
  br i1 %exitcond.3.1, label %._crit_edge4.preheader.us16.preheader.loopexit.unr-lcssa, label %._crit_edge.us

._crit_edge4.us13:                                ; preds = %._crit_edge4.us13.preheader, %._crit_edge4.us13
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge4.us13 ], [ %indvars.iv26.ph, %._crit_edge4.us13.preheader ]
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv31
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %2
  %33 = load double, double* %45, align 8
  %34 = fmul double %32, %33
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv31
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %2
  %38 = load double, double* %46, align 8
  %39 = fmul double %37, %38
  %40 = fadd double %34, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv26
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %indvars.iv36
  br i1 %exitcond, label %._crit_edge4._crit_edge.us19.loopexit, label %._crit_edge4.us13, !llvm.loop !1

._crit_edge4.preheader.us16:                      ; preds = %._crit_edge4.preheader.us16.preheader, %._crit_edge4._crit_edge.us19
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge4._crit_edge.us19 ], [ 0, %._crit_edge4.preheader.us16.preheader ]
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %44 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %44
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %44
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %min.iters.check, label %._crit_edge4.us13.preheader, label %min.iters.checked

._crit_edge4.us13.preheader:                      ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge4.preheader.us16
  %indvars.iv26.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge4.preheader.us16 ], [ %n.vec, %middle.block ]
  br label %._crit_edge4.us13

min.iters.checked:                                ; preds = %._crit_edge4.preheader.us16
  br i1 %cmp.zero, label %._crit_edge4.us13.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %46
  %bound1 = icmp ult double* %46, %scevgep59
  %found.conflict = and i1 %bound0, %bound1
  %bound070 = icmp ult double* %scevgep, %scevgep63
  %bound171 = icmp ult double* %scevgep61, %scevgep59
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx = or i1 %found.conflict, %found.conflict72
  %bound073 = icmp ult double* %scevgep, %scevgep67
  %bound174 = icmp ult double* %scevgep65, %scevgep59
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx76 = or i1 %conflict.rdx, %found.conflict75
  %bound079 = icmp ult double* %scevgep, %45
  %bound180 = icmp ult double* %45, %scevgep59
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx82 = or i1 %conflict.rdx76, %found.conflict81
  br i1 %conflict.rdx82, label %._crit_edge4.us13.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %47 = load double, double* %45, align 8, !alias.scope !4
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = load double, double* %46, align 8, !alias.scope !7
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %53 = or i64 %index, 1
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv31
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %53, i64 %indvars.iv31
  %56 = load double, double* %54, align 8, !alias.scope !9
  %57 = load double, double* %55, align 8, !alias.scope !9
  %58 = insertelement <2 x double> undef, double %56, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %59, %broadcast.splat84
  %61 = fmul <2 x double> %60, %49
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv31
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %53, i64 %indvars.iv31
  %64 = load double, double* %62, align 8, !alias.scope !11
  %65 = load double, double* %63, align 8, !alias.scope !11
  %66 = insertelement <2 x double> undef, double %64, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = fmul <2 x double> %67, %broadcast.splat84
  %69 = fmul <2 x double> %68, %52
  %70 = fadd <2 x double> %61, %69
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !13, !noalias !15
  %73 = fadd <2 x double> %wide.load, %70
  %74 = bitcast double* %71 to <2 x double>*
  store <2 x double> %73, <2 x double>* %74, align 8, !alias.scope !13, !noalias !15
  %index.next = add i64 %index, 2
  %75 = icmp eq i64 %index.next, %n.vec
  br i1 %75, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge4._crit_edge.us19, label %._crit_edge4.us13.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge3._crit_edge.us
  %indvars.iv86 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next, %._crit_edge3._crit_edge.us ]
  %indvars.iv38 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next39, %._crit_edge3._crit_edge.us ]
  %indvars.iv36 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next37, %._crit_edge3._crit_edge.us ]
  %76 = add i64 %indvars.iv38, -3
  %77 = zext i2 %indvars.iv86 to i64
  %78 = add nuw nsw i64 %77, 4294967295
  %79 = and i64 %78, 4294967295
  %80 = add nuw nsw i64 %79, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %81 = mul i64 %indvars.iv38, 1201
  %82 = add i64 %81, 1
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %82
  %83 = add nuw nsw i64 %indvars.iv38, 1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %84 = trunc i64 %indvars.iv.next39 to i32
  %xtraiter = and i32 %84, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.prol
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %3
  store double %87, double* %85, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !17

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %80, %._crit_edge.us.prol.loopexit.loopexit ]
  %88 = icmp ult i64 %indvars.iv38, 3
  br i1 %88, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %89 = sub i64 %76, %indvars.iv.unr
  %90 = lshr i64 %89, 2
  %91 = and i64 %90, 1
  %lcmp.mod92 = icmp eq i64 %91, 0
  br i1 %lcmp.mod92, label %._crit_edge.us.prol.preheader89, label %._crit_edge.us.prol.loopexit90.unr-lcssa

._crit_edge.us.prol.preheader89:                  ; preds = %._crit_edge.us.preheader
  br label %._crit_edge.us.prol93

._crit_edge.us.prol93:                            ; preds = %._crit_edge.us.prol.preheader89
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.unr
  %93 = bitcast double* %92 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %93, align 8
  %95 = fmul <2 x double> %94, %13
  store <2 x double> %95, <2 x double>* %93, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1.prol
  %97 = bitcast double* %96 to <2 x double>*
  %98 = load <2 x double>, <2 x double>* %97, align 8
  %99 = fmul <2 x double> %98, %13
  store <2 x double> %99, <2 x double>* %97, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %._crit_edge.us.prol.loopexit90.unr-lcssa

._crit_edge.us.prol.loopexit90.unr-lcssa:         ; preds = %._crit_edge.us.preheader, %._crit_edge.us.prol93
  %indvars.iv.unr95.ph = phi i64 [ %indvars.iv.next.3.prol, %._crit_edge.us.prol93 ], [ %indvars.iv.unr, %._crit_edge.us.preheader ]
  br label %._crit_edge.us.prol.loopexit90

._crit_edge.us.prol.loopexit90:                   ; preds = %._crit_edge.us.prol.loopexit90.unr-lcssa
  %100 = icmp eq i64 %90, 0
  br i1 %100, label %._crit_edge4.preheader.us16.preheader.loopexit, label %._crit_edge.us.preheader.new

._crit_edge.us.preheader.new:                     ; preds = %._crit_edge.us.prol.loopexit90
  br label %._crit_edge.us

._crit_edge4.preheader.us16.preheader.loopexit.unr-lcssa: ; preds = %._crit_edge.us
  br label %._crit_edge4.preheader.us16.preheader.loopexit

._crit_edge4.preheader.us16.preheader.loopexit:   ; preds = %._crit_edge.us.prol.loopexit90, %._crit_edge4.preheader.us16.preheader.loopexit.unr-lcssa
  br label %._crit_edge4.preheader.us16.preheader

._crit_edge4.preheader.us16.preheader:            ; preds = %._crit_edge4.preheader.us16.preheader.loopexit, %._crit_edge.us.prol.loopexit
  %min.iters.check = icmp ult i64 %83, 2
  %n.vec = and i64 %83, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %83, %n.vec
  br label %._crit_edge4.preheader.us16

._crit_edge4._crit_edge.us19.loopexit:            ; preds = %._crit_edge4.us13
  br label %._crit_edge4._crit_edge.us19

._crit_edge4._crit_edge.us19:                     ; preds = %._crit_edge4._crit_edge.us19.loopexit, %middle.block
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge3._crit_edge.us, label %._crit_edge4.preheader.us16

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge4._crit_edge.us19
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  %indvars.iv.next = add i2 %indvars.iv86, 1
  br i1 %exitcond41, label %._crit_edge12.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge3.preheader
  %indvars.iv87 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next88, %._crit_edge3.preheader ]
  %indvars.iv52 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next53, %._crit_edge3.preheader ]
  %indvars.iv50 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next51, %._crit_edge3.preheader ]
  %101 = add i64 %indvars.iv52, -3
  %102 = zext i2 %indvars.iv87 to i64
  %103 = add nuw nsw i64 %102, 4294967295
  %104 = and i64 %103, 4294967295
  %105 = add nuw nsw i64 %104, 1
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %106 = trunc i64 %indvars.iv.next53 to i32
  %xtraiter47 = and i32 %106, 3
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  br i1 %lcmp.mod48, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter49 = phi i32 [ %prol.iter49.sub, %._crit_edge.prol ], [ %xtraiter47, %._crit_edge.prol.preheader ]
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv42.prol
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %3
  store double %109, double* %107, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter49.sub = add nsw i32 %prol.iter49, -1
  %prol.iter49.cmp = icmp eq i32 %prol.iter49.sub, 0
  br i1 %prol.iter49.cmp, label %._crit_edge.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !19

._crit_edge.prol.loopexit.loopexit:               ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph ], [ %105, %._crit_edge.prol.loopexit.loopexit ]
  %110 = icmp ult i64 %indvars.iv52, 3
  br i1 %110, label %._crit_edge3.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.prol.loopexit
  %111 = sub i64 %101, %indvars.iv42.unr
  %112 = lshr i64 %111, 2
  %113 = and i64 %112, 1
  %lcmp.mod99 = icmp eq i64 %113, 0
  br i1 %lcmp.mod99, label %._crit_edge.prol.preheader96, label %._crit_edge.prol.loopexit97.unr-lcssa

._crit_edge.prol.preheader96:                     ; preds = %._crit_edge.preheader
  br label %._crit_edge.prol100

._crit_edge.prol100:                              ; preds = %._crit_edge.prol.preheader96
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv42.unr
  %115 = bitcast double* %114 to <2 x double>*
  %116 = load <2 x double>, <2 x double>* %115, align 8
  %117 = fmul <2 x double> %116, %11
  store <2 x double> %117, <2 x double>* %115, align 8
  %indvars.iv.next43.1.prol = add nsw i64 %indvars.iv42.unr, 2
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next43.1.prol
  %119 = bitcast double* %118 to <2 x double>*
  %120 = load <2 x double>, <2 x double>* %119, align 8
  %121 = fmul <2 x double> %120, %11
  store <2 x double> %121, <2 x double>* %119, align 8
  %indvars.iv.next43.3.prol = add nsw i64 %indvars.iv42.unr, 4
  br label %._crit_edge.prol.loopexit97.unr-lcssa

._crit_edge.prol.loopexit97.unr-lcssa:            ; preds = %._crit_edge.preheader, %._crit_edge.prol100
  %indvars.iv42.unr102.ph = phi i64 [ %indvars.iv.next43.3.prol, %._crit_edge.prol100 ], [ %indvars.iv42.unr, %._crit_edge.preheader ]
  br label %._crit_edge.prol.loopexit97

._crit_edge.prol.loopexit97:                      ; preds = %._crit_edge.prol.loopexit97.unr-lcssa
  %122 = icmp eq i64 %112, 0
  br i1 %122, label %._crit_edge3.preheader.loopexit, label %._crit_edge.preheader.new

._crit_edge.preheader.new:                        ; preds = %._crit_edge.prol.loopexit97
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr102.ph, %._crit_edge.preheader.new ], [ %indvars.iv.next43.3.1, %._crit_edge ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv42
  %124 = bitcast double* %123 to <2 x double>*
  %125 = load <2 x double>, <2 x double>* %124, align 8
  %126 = fmul <2 x double> %125, %11
  store <2 x double> %126, <2 x double>* %124, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next43.1
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %128, align 8
  %130 = fmul <2 x double> %129, %11
  store <2 x double> %130, <2 x double>* %128, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next43.3
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8
  %134 = fmul <2 x double> %133, %11
  store <2 x double> %134, <2 x double>* %132, align 8
  %indvars.iv.next43.1.1 = add nsw i64 %indvars.iv42, 6
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next43.1.1
  %136 = bitcast double* %135 to <2 x double>*
  %137 = load <2 x double>, <2 x double>* %136, align 8
  %138 = fmul <2 x double> %137, %11
  store <2 x double> %138, <2 x double>* %136, align 8
  %indvars.iv.next43.3.1 = add nsw i64 %indvars.iv42, 8
  %exitcond46.3.1 = icmp eq i64 %indvars.iv.next43.3.1, %indvars.iv50
  br i1 %exitcond46.3.1, label %._crit_edge3.preheader.loopexit.unr-lcssa, label %._crit_edge

._crit_edge3.preheader.loopexit.unr-lcssa:        ; preds = %._crit_edge
  br label %._crit_edge3.preheader.loopexit

._crit_edge3.preheader.loopexit:                  ; preds = %._crit_edge.prol.loopexit97, %._crit_edge3.preheader.loopexit.unr-lcssa
  br label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.loopexit, %._crit_edge.prol.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  %indvars.iv.next88 = add i2 %indvars.iv87, 1
  br i1 %exitcond55, label %._crit_edge12.loopexit85, label %.lr.ph

._crit_edge12.loopexit:                           ; preds = %._crit_edge3._crit_edge.us
  br label %._crit_edge12

._crit_edge12.loopexit85:                         ; preds = %._crit_edge3.preheader
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit85, %._crit_edge12.loopexit, %7
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
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
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!12}
!12 = distinct !{!12, !6}
!13 = !{!14}
!14 = distinct !{!14, !6}
!15 = !{!8, !10, !12, !5}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !18}
