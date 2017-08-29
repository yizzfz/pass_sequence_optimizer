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
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge4._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %._crit_edge.preheader.us.preheader, label %._crit_edge5.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count41 = zext i32 %1 to i64
  %wide.trip.count45 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.us.preheader, %._crit_edge._crit_edge.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.us.preheader ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv39 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next40, %._crit_edge.us ]
  %12 = mul nuw nsw i64 %indvars.iv39, %indvars.iv43
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %10
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  store double %17, double* %18, align 8
  %19 = add nuw nsw i64 %12, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %11
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv39
  store double %23, double* %24, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge4.preheader, label %._crit_edge.preheader.us

._crit_edge4.preheader:                           ; preds = %._crit_edge._crit_edge.us
  %25 = icmp sgt i32 %0, 0
  br i1 %25, label %._crit_edge5.preheader.lr.ph, label %._crit_edge4._crit_edge

._crit_edge5.preheader.lr.ph:                     ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge4.preheader
  %26 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  br label %._crit_edge5.preheader.us

._crit_edge5.preheader.us:                        ; preds = %._crit_edge5._crit_edge.us, %._crit_edge5.preheader.lr.ph
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge5._crit_edge.us ], [ 0, %._crit_edge5.preheader.lr.ph ]
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us, %._crit_edge5.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge5.preheader.us ], [ %indvars.iv.next, %._crit_edge5.us ]
  %27 = mul nuw nsw i64 %indvars.iv, %indvars.iv35
  %28 = add nuw nsw i64 %27, 3
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %0
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %26
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge5._crit_edge.us, label %._crit_edge5.us

._crit_edge5._crit_edge.us:                       ; preds = %._crit_edge5.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %._crit_edge4._crit_edge.loopexit, label %._crit_edge5.preheader.us

._crit_edge4._crit_edge.loopexit:                 ; preds = %._crit_edge5._crit_edge.us
  br label %._crit_edge4._crit_edge

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4._crit_edge.loopexit, %7, %._crit_edge4.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge40

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count82 = zext i32 %0 to i64
  %broadcast.splatinsert93 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat94 = shufflevector <2 x double> %broadcast.splatinsert93, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count61 = zext i32 %1 to i64
  %wide.trip.count68 = zext i32 %0 to i64
  %broadcast.splatinsert162 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat163 = shufflevector <2 x double> %broadcast.splatinsert162, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert137 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat138 = shufflevector <2 x double> %broadcast.splatinsert137, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader165, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge.us ], [ %indvars.iv.ph, %._crit_edge.us.preheader165 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv64
  br i1 %exitcond.3, label %._crit_edge5.preheader.us44.preheader.loopexit, label %._crit_edge.us, !llvm.loop !1

._crit_edge5.preheader.us44.preheader.loopexit:   ; preds = %._crit_edge.us
  br label %._crit_edge5.preheader.us44.preheader

._crit_edge5.preheader.us44.preheader:            ; preds = %._crit_edge5.preheader.us44.preheader.loopexit, %middle.block140, %._crit_edge.us.prol.loopexit
  %min.iters.check98 = icmp ult i64 %71, 2
  %n.vec101 = and i64 %71, -2
  %cmp.zero102 = icmp eq i64 %n.vec101, 0
  %cmp.n133 = icmp eq i64 %71, %n.vec101
  br label %._crit_edge5.preheader.us44

._crit_edge5.us41:                                ; preds = %._crit_edge5.us41.preheader, %._crit_edge5.us41
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge5.us41 ], [ %indvars.iv54.ph, %._crit_edge5.us41.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv59
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv54, i64 %indvars.iv59
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv54
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond = icmp eq i64 %indvars.iv.next55, %indvars.iv64
  br i1 %exitcond, label %._crit_edge5._crit_edge.us47.loopexit, label %._crit_edge5.us41, !llvm.loop !5

._crit_edge5.preheader.us44:                      ; preds = %._crit_edge5.preheader.us44.preheader, %._crit_edge5._crit_edge.us47
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge5._crit_edge.us47 ], [ 0, %._crit_edge5.preheader.us44.preheader ]
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv59
  %36 = add i64 %indvars.iv59, 1
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv66, i64 %36
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv59
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv66, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv59
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv66, i64 %indvars.iv59
  br i1 %min.iters.check98, label %._crit_edge5.us41.preheader, label %min.iters.checked99

._crit_edge5.us41.preheader:                      ; preds = %middle.block96, %vector.memcheck, %min.iters.checked99, %._crit_edge5.preheader.us44
  %indvars.iv54.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked99 ], [ 0, %._crit_edge5.preheader.us44 ], [ %n.vec101, %middle.block96 ]
  br label %._crit_edge5.us41

min.iters.checked99:                              ; preds = %._crit_edge5.preheader.us44
  br i1 %cmp.zero102, label %._crit_edge5.us41.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked99
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep105
  %found.conflict = and i1 %bound0, %bound1
  %bound0116 = icmp ult double* %scevgep, %scevgep109
  %bound1117 = icmp ult double* %scevgep107, %scevgep105
  %found.conflict118 = and i1 %bound0116, %bound1117
  %conflict.rdx = or i1 %found.conflict, %found.conflict118
  %bound0119 = icmp ult double* %scevgep, %scevgep113
  %bound1120 = icmp ult double* %scevgep111, %scevgep105
  %found.conflict121 = and i1 %bound0119, %bound1120
  %conflict.rdx122 = or i1 %conflict.rdx, %found.conflict121
  %bound0125 = icmp ult double* %scevgep, %37
  %bound1126 = icmp ult double* %37, %scevgep105
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx128 = or i1 %conflict.rdx122, %found.conflict127
  br i1 %conflict.rdx128, label %._crit_edge5.us41.preheader, label %vector.ph129

vector.ph129:                                     ; preds = %vector.memcheck
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95, %vector.ph129
  %index130 = phi i64 [ 0, %vector.ph129 ], [ %index.next131, %vector.body95 ]
  %39 = or i64 %index130, 1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index130, i64 %indvars.iv59
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %39, i64 %indvars.iv59
  %42 = load double, double* %40, align 8, !alias.scope !6
  %43 = load double, double* %41, align 8, !alias.scope !6
  %44 = insertelement <2 x double> undef, double %42, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fmul <2 x double> %45, %broadcast.splat138
  %47 = load double, double* %37, align 8, !alias.scope !9
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %46, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index130, i64 %indvars.iv59
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %39, i64 %indvars.iv59
  %53 = load double, double* %51, align 8, !alias.scope !11
  %54 = load double, double* %52, align 8, !alias.scope !11
  %55 = insertelement <2 x double> undef, double %53, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %56, %broadcast.splat138
  %58 = load double, double* %38, align 8, !alias.scope !13
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = fmul <2 x double> %57, %60
  %62 = fadd <2 x double> %50, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %index130
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next131 = add i64 %index130, 2
  %67 = icmp eq i64 %index.next131, %n.vec101
  br i1 %67, label %middle.block96, label %vector.body95, !llvm.loop !18

middle.block96:                                   ; preds = %vector.body95
  br i1 %cmp.n133, label %._crit_edge5._crit_edge.us47, label %._crit_edge5.us41.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge4._crit_edge.us
  %indvars.iv86 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next87, %._crit_edge4._crit_edge.us ]
  %indvars.iv66 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next67, %._crit_edge4._crit_edge.us ]
  %indvars.iv64 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next65, %._crit_edge4._crit_edge.us ]
  %68 = add i64 %indvars.iv66, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 0
  %69 = mul i64 %indvars.iv66, 1201
  %70 = add i64 %69, 1
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %70
  %71 = add i64 %indvars.iv66, 1
  %72 = zext i2 %indvars.iv86 to i64
  %73 = add nuw nsw i64 %72, 4294967295
  %74 = and i64 %73, 4294967295
  %75 = add nuw nsw i64 %74, 1
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %76 = trunc i64 %indvars.iv.next67 to i32
  %xtraiter = and i32 %76, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  store double %79, double* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !19

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %75, %._crit_edge.us.prol.loopexit.loopexit ]
  %80 = icmp ult i64 %indvars.iv66, 3
  br i1 %80, label %._crit_edge5.preheader.us44.preheader, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %81 = sub i64 %68, %indvars.iv.unr
  %82 = lshr i64 %81, 2
  %83 = add nuw nsw i64 %82, 1
  %min.iters.check142 = icmp ult i64 %83, 2
  br i1 %min.iters.check142, label %._crit_edge.us.preheader165, label %min.iters.checked143

._crit_edge.us.preheader165:                      ; preds = %middle.block140, %min.iters.checked143, %._crit_edge.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked143 ], [ %indvars.iv.unr, %._crit_edge.us.preheader ], [ %ind.end151, %middle.block140 ]
  br label %._crit_edge.us

min.iters.checked143:                             ; preds = %._crit_edge.us.preheader
  %n.mod.vf144 = and i64 %83, 1
  %n.vec145 = sub nsw i64 %83, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  %84 = add nsw i64 %indvars.iv.unr, 4
  %85 = shl nuw i64 %82, 2
  %86 = add i64 %84, %85
  %87 = shl nuw nsw i64 %n.mod.vf144, 2
  %ind.end151 = sub i64 %86, %87
  br i1 %cmp.zero146, label %._crit_edge.us.preheader165, label %vector.ph147

vector.ph147:                                     ; preds = %min.iters.checked143
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139, %vector.ph147
  %index148 = phi i64 [ 0, %vector.ph147 ], [ %index.next149, %vector.body139 ]
  %88 = shl i64 %index148, 2
  %89 = add i64 %indvars.iv.unr, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %89
  %91 = bitcast double* %90 to <8 x double>*
  %wide.vec157 = load <8 x double>, <8 x double>* %91, align 8
  %strided.vec158 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec159 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec160 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec161 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %92 = fmul <2 x double> %strided.vec158, %broadcast.splat163
  %93 = fmul <2 x double> %strided.vec159, %broadcast.splat163
  %94 = fmul <2 x double> %strided.vec160, %broadcast.splat163
  %95 = add nsw i64 %89, 3
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %95
  %97 = fmul <2 x double> %strided.vec161, %broadcast.splat163
  %98 = getelementptr double, double* %96, i64 -3
  %99 = bitcast double* %98 to <8 x double>*
  %100 = shufflevector <2 x double> %92, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %101 = shufflevector <2 x double> %94, <2 x double> %97, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec164 = shufflevector <4 x double> %100, <4 x double> %101, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec164, <8 x double>* %99, align 8
  %index.next149 = add i64 %index148, 2
  %102 = icmp eq i64 %index.next149, %n.vec145
  br i1 %102, label %middle.block140, label %vector.body139, !llvm.loop !21

middle.block140:                                  ; preds = %vector.body139
  %cmp.n152 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n152, label %._crit_edge5.preheader.us44.preheader, label %._crit_edge.us.preheader165

._crit_edge5._crit_edge.us47.loopexit:            ; preds = %._crit_edge5.us41
  br label %._crit_edge5._crit_edge.us47

._crit_edge5._crit_edge.us47:                     ; preds = %._crit_edge5._crit_edge.us47.loopexit, %middle.block96
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %._crit_edge4._crit_edge.us, label %._crit_edge5.preheader.us44

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge5._crit_edge.us47
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  %indvars.iv.next87 = add i2 %indvars.iv86, 1
  br i1 %exitcond69, label %._crit_edge40.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge4.preheader
  %indvars.iv88 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next89, %._crit_edge4.preheader ]
  %indvars.iv80 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next81, %._crit_edge4.preheader ]
  %indvars.iv78 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next79, %._crit_edge4.preheader ]
  %103 = add i64 %indvars.iv80, -3
  %104 = zext i2 %indvars.iv88 to i64
  %105 = add nuw nsw i64 %104, 4294967295
  %106 = and i64 %105, 4294967295
  %107 = add nuw nsw i64 %106, 1
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %108 = trunc i64 %indvars.iv.next81 to i32
  %xtraiter75 = and i32 %108, 3
  %lcmp.mod76 = icmp eq i32 %xtraiter75, 0
  br i1 %lcmp.mod76, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter77 = phi i32 [ %prol.iter77.sub, %._crit_edge.prol ], [ %xtraiter75, %._crit_edge.prol.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv70.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter77.sub = add nsw i32 %prol.iter77, -1
  %prol.iter77.cmp = icmp eq i32 %prol.iter77.sub, 0
  br i1 %prol.iter77.cmp, label %._crit_edge.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !22

._crit_edge.prol.loopexit.loopexit:               ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv70.unr = phi i64 [ 0, %.lr.ph ], [ %107, %._crit_edge.prol.loopexit.loopexit ]
  %112 = icmp ult i64 %indvars.iv80, 3
  br i1 %112, label %._crit_edge4.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.prol.loopexit
  %113 = sub i64 %103, %indvars.iv70.unr
  %114 = lshr i64 %113, 2
  %115 = add nuw nsw i64 %114, 1
  %min.iters.check = icmp ult i64 %115, 2
  br i1 %min.iters.check, label %._crit_edge.preheader166, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge.preheader
  %n.mod.vf = and i64 %115, 1
  %n.vec = sub nsw i64 %115, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %116 = add nsw i64 %indvars.iv70.unr, 4
  %117 = shl nuw i64 %114, 2
  %118 = add i64 %116, %117
  %119 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %118, %119
  br i1 %cmp.zero, label %._crit_edge.preheader166, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %120 = shl i64 %index, 2
  %121 = add i64 %indvars.iv70.unr, %120
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %121
  %123 = bitcast double* %122 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %123, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec90 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec91 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec92 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %124 = fmul <2 x double> %strided.vec, %broadcast.splat94
  %125 = fmul <2 x double> %strided.vec90, %broadcast.splat94
  %126 = fmul <2 x double> %strided.vec91, %broadcast.splat94
  %127 = add nsw i64 %121, 3
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %127
  %129 = fmul <2 x double> %strided.vec92, %broadcast.splat94
  %130 = getelementptr double, double* %128, i64 -3
  %131 = bitcast double* %130 to <8 x double>*
  %132 = shufflevector <2 x double> %124, <2 x double> %125, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %133 = shufflevector <2 x double> %126, <2 x double> %129, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %132, <4 x double> %133, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %131, align 8
  %index.next = add i64 %index, 2
  %134 = icmp eq i64 %index.next, %n.vec
  br i1 %134, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge4.preheader, label %._crit_edge.preheader166

._crit_edge.preheader166:                         ; preds = %middle.block, %min.iters.checked, %._crit_edge.preheader
  %indvars.iv70.ph = phi i64 [ %indvars.iv70.unr, %min.iters.checked ], [ %indvars.iv70.unr, %._crit_edge.preheader ], [ %ind.end, %middle.block ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader166, %._crit_edge
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.3, %._crit_edge ], [ %indvars.iv70.ph, %._crit_edge.preheader166 ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv70
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv.next71
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv.next71.1
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %3
  store double %143, double* %141, align 8
  %indvars.iv.next71.2 = add nsw i64 %indvars.iv70, 3
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv.next71.2
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, %3
  store double %146, double* %144, align 8
  %indvars.iv.next71.3 = add nsw i64 %indvars.iv70, 4
  %exitcond74.3 = icmp eq i64 %indvars.iv.next71.3, %indvars.iv78
  br i1 %exitcond74.3, label %._crit_edge4.preheader.loopexit, label %._crit_edge, !llvm.loop !24

._crit_edge4.preheader.loopexit:                  ; preds = %._crit_edge
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader.loopexit, %middle.block, %._crit_edge.prol.loopexit
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  %indvars.iv.next89 = add i2 %indvars.iv88, 1
  br i1 %exitcond83, label %._crit_edge40.loopexit167, label %.lr.ph

._crit_edge40.loopexit:                           ; preds = %._crit_edge4._crit_edge.us
  br label %._crit_edge40

._crit_edge40.loopexit167:                        ; preds = %._crit_edge4.preheader
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit167, %._crit_edge40.loopexit, %7
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
  br i1 %7, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count14 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv12, %8
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
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  br i1 %exitcond15, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

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
