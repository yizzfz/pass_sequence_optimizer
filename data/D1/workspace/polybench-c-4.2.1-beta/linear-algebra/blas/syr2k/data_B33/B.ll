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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  br i1 %8, label %.preheader35.lr.ph, label %._crit_edge39

.preheader35.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader35.us.preheader, label %.preheader.lr.ph

.preheader35.us.preheader:                        ; preds = %.preheader35.lr.ph
  %wide.trip.count52 = zext i32 %1 to i64
  %wide.trip.count56 = zext i32 %0 to i64
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %.preheader35.us.preheader, %._crit_edge42.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge42.us ], [ 0, %.preheader35.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader35.us
  %indvars.iv50 = phi i64 [ 0, %.preheader35.us ], [ %indvars.iv.next51, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv50, %indvars.iv54
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv50
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %13, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %11
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv54, i64 %indvars.iv50
  store double %24, double* %25, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge42.us, label %12

._crit_edge42.us:                                 ; preds = %12
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %.preheader34, label %.preheader35.us

.preheader34:                                     ; preds = %._crit_edge42.us
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader.lr.ph, label %._crit_edge39

.preheader.lr.ph:                                 ; preds = %.preheader35.lr.ph, %.preheader34
  %27 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count48 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %28

; <label>:28:                                     ; preds = %28, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %28 ]
  %29 = mul nuw nsw i64 %indvars.iv, %indvars.iv46
  %30 = add nuw nsw i64 %29, 3
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %0
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %27
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %28

._crit_edge.us:                                   ; preds = %28
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge39.loopexit, label %.preheader.us

._crit_edge39.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %7, %.preheader34
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader35.lr.ph, label %._crit_edge44

.preheader35.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader35.lr.ph
  %wide.trip.count86 = zext i32 %0 to i64
  %broadcast.splatinsert93 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat94 = shufflevector <2 x double> %broadcast.splatinsert93, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader35.lr.ph
  %wide.trip.count63 = zext i32 %1 to i64
  %wide.trip.count70 = zext i32 %0 to i64
  %broadcast.splatinsert162 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat163 = shufflevector <2 x double> %broadcast.splatinsert162, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert137 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat138 = shufflevector <2 x double> %broadcast.splatinsert137, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader165, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader165 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv66
  br i1 %exitcond.3, label %.preheader.us45.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us45.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us45.preheader

.preheader.us45.preheader:                        ; preds = %.preheader.us45.preheader.loopexit, %middle.block140, %.prol.loopexit
  %min.iters.check98 = icmp ult i64 %71, 2
  %n.vec101 = and i64 %71, -2
  %cmp.zero102 = icmp eq i64 %n.vec101, 0
  %cmp.n133 = icmp eq i64 %71, %n.vec101
  br label %.preheader.us45

.preheader.us45:                                  ; preds = %.preheader.us45.preheader, %._crit_edge.us49
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us49 ], [ 0, %.preheader.us45.preheader ]
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv61
  %22 = add i64 %indvars.iv61, 1
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %22
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv61
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %22
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv61
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv61
  br i1 %min.iters.check98, label %scalar.ph97.preheader, label %min.iters.checked99

min.iters.checked99:                              ; preds = %.preheader.us45
  br i1 %cmp.zero102, label %scalar.ph97.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked99
  %bound0 = icmp ult double* %scevgep, %24
  %bound1 = icmp ult double* %24, %scevgep105
  %found.conflict = and i1 %bound0, %bound1
  %bound0116 = icmp ult double* %scevgep, %scevgep109
  %bound1117 = icmp ult double* %scevgep107, %scevgep105
  %found.conflict118 = and i1 %bound0116, %bound1117
  %conflict.rdx = or i1 %found.conflict, %found.conflict118
  %bound0119 = icmp ult double* %scevgep, %scevgep113
  %bound1120 = icmp ult double* %scevgep111, %scevgep105
  %found.conflict121 = and i1 %bound0119, %bound1120
  %conflict.rdx122 = or i1 %conflict.rdx, %found.conflict121
  %bound0125 = icmp ult double* %scevgep, %23
  %bound1126 = icmp ult double* %23, %scevgep105
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx128 = or i1 %conflict.rdx122, %found.conflict127
  br i1 %conflict.rdx128, label %scalar.ph97.preheader, label %vector.ph129

vector.ph129:                                     ; preds = %vector.memcheck
  %25 = load double, double* %23, align 8, !alias.scope !5
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = load double, double* %24, align 8, !alias.scope !8
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95, %vector.ph129
  %index130 = phi i64 [ 0, %vector.ph129 ], [ %index.next131, %vector.body95 ]
  %31 = or i64 %index130, 1
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index130, i64 %indvars.iv61
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %31, i64 %indvars.iv61
  %34 = load double, double* %32, align 8, !alias.scope !10
  %35 = load double, double* %33, align 8, !alias.scope !10
  %36 = insertelement <2 x double> undef, double %34, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fmul <2 x double> %37, %broadcast.splat138
  %39 = fmul <2 x double> %38, %27
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index130, i64 %indvars.iv61
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %31, i64 %indvars.iv61
  %42 = load double, double* %40, align 8, !alias.scope !12
  %43 = load double, double* %41, align 8, !alias.scope !12
  %44 = insertelement <2 x double> undef, double %42, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fmul <2 x double> %45, %broadcast.splat138
  %47 = fmul <2 x double> %46, %30
  %48 = fadd <2 x double> %39, %47
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %index130
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !14, !noalias !16
  %51 = fadd <2 x double> %wide.load, %48
  %52 = bitcast double* %49 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8, !alias.scope !14, !noalias !16
  %index.next131 = add i64 %index130, 2
  %53 = icmp eq i64 %index.next131, %n.vec101
  br i1 %53, label %middle.block96, label %vector.body95, !llvm.loop !17

middle.block96:                                   ; preds = %vector.body95
  br i1 %cmp.n133, label %._crit_edge.us49, label %scalar.ph97.preheader

scalar.ph97.preheader:                            ; preds = %middle.block96, %vector.memcheck, %min.iters.checked99, %.preheader.us45
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked99 ], [ 0, %.preheader.us45 ], [ %n.vec101, %middle.block96 ]
  br label %scalar.ph97

scalar.ph97:                                      ; preds = %scalar.ph97.preheader, %scalar.ph97
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %scalar.ph97 ], [ %indvars.iv56.ph, %scalar.ph97.preheader ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv61
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %2
  %57 = load double, double* %23, align 8
  %58 = fmul double %56, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv61
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %2
  %62 = load double, double* %24, align 8
  %63 = fmul double %61, %62
  %64 = fadd double %58, %63
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv56
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %65, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv66
  br i1 %exitcond, label %._crit_edge.us49.loopexit, label %scalar.ph97, !llvm.loop !18

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge40.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge40.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge40.us ], [ 1, %.lr.ph.us.preheader ]
  %68 = add i64 %indvars.iv68, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 0
  %69 = mul i64 %indvars.iv68, 1201
  %70 = add i64 %69, 1
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %70
  %71 = add i64 %indvars.iv68, 1
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %72 = trunc i64 %indvars.iv.next69 to i32
  %xtraiter = and i32 %72, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  store double %75, double* %73, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %76 = icmp ult i64 %indvars.iv68, 3
  br i1 %76, label %.preheader.us45.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %77 = sub i64 %68, %indvars.iv.unr
  %78 = lshr i64 %77, 2
  %79 = add nuw nsw i64 %78, 1
  %min.iters.check142 = icmp ult i64 %79, 2
  br i1 %min.iters.check142, label %.lr.ph.us.new.preheader165, label %min.iters.checked143

.lr.ph.us.new.preheader165:                       ; preds = %middle.block140, %min.iters.checked143, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked143 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end151, %middle.block140 ]
  br label %.lr.ph.us.new

min.iters.checked143:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf144 = and i64 %79, 1
  %n.vec145 = sub nsw i64 %79, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  %80 = add i64 %indvars.iv.unr, 4
  %81 = shl nuw i64 %78, 2
  %82 = add i64 %80, %81
  %83 = shl nuw nsw i64 %n.mod.vf144, 2
  %ind.end151 = sub i64 %82, %83
  br i1 %cmp.zero146, label %.lr.ph.us.new.preheader165, label %vector.ph147

vector.ph147:                                     ; preds = %min.iters.checked143
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139, %vector.ph147
  %index148 = phi i64 [ 0, %vector.ph147 ], [ %index.next149, %vector.body139 ]
  %84 = shl i64 %index148, 2
  %85 = add i64 %indvars.iv.unr, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %85
  %87 = bitcast double* %86 to <8 x double>*
  %wide.vec157 = load <8 x double>, <8 x double>* %87, align 8
  %strided.vec158 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec159 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec160 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec161 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %88 = fmul <2 x double> %strided.vec158, %broadcast.splat163
  %89 = fmul <2 x double> %strided.vec159, %broadcast.splat163
  %90 = fmul <2 x double> %strided.vec160, %broadcast.splat163
  %91 = add nsw i64 %85, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %91
  %93 = fmul <2 x double> %strided.vec161, %broadcast.splat163
  %94 = getelementptr double, double* %92, i64 -3
  %95 = bitcast double* %94 to <8 x double>*
  %96 = shufflevector <2 x double> %88, <2 x double> %89, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %97 = shufflevector <2 x double> %90, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec164 = shufflevector <4 x double> %96, <4 x double> %97, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec164, <8 x double>* %95, align 8
  %index.next149 = add i64 %index148, 2
  %98 = icmp eq i64 %index.next149, %n.vec145
  br i1 %98, label %middle.block140, label %vector.body139, !llvm.loop !21

middle.block140:                                  ; preds = %vector.body139
  %cmp.n152 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n152, label %.preheader.us45.preheader, label %.lr.ph.us.new.preheader165

._crit_edge.us49.loopexit:                        ; preds = %scalar.ph97
  br label %._crit_edge.us49

._crit_edge.us49:                                 ; preds = %._crit_edge.us49.loopexit, %middle.block96
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge40.us, label %.preheader.us45

._crit_edge40.us:                                 ; preds = %._crit_edge.us49
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge44.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader34
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %.preheader34 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %.preheader34 ], [ 1, %.lr.ph.preheader ]
  %99 = add i64 %indvars.iv84, -3
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %100 = trunc i64 %indvars.iv.next85 to i32
  %xtraiter79 = and i32 %100, 3
  %lcmp.mod80 = icmp eq i32 %xtraiter79, 0
  br i1 %lcmp.mod80, label %.prol.loopexit78, label %.prol.preheader77.preheader

.prol.preheader77.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader77

.prol.preheader77:                                ; preds = %.prol.preheader77.preheader, %.prol.preheader77
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %.prol.preheader77 ], [ 0, %.prol.preheader77.preheader ]
  %prol.iter81 = phi i32 [ %prol.iter81.sub, %.prol.preheader77 ], [ %xtraiter79, %.prol.preheader77.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv72.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, %3
  store double %103, double* %101, align 8
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter81.sub = add i32 %prol.iter81, -1
  %prol.iter81.cmp = icmp eq i32 %prol.iter81.sub, 0
  br i1 %prol.iter81.cmp, label %.prol.loopexit78.loopexit, label %.prol.preheader77, !llvm.loop !22

.prol.loopexit78.loopexit:                        ; preds = %.prol.preheader77
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.loopexit78.loopexit, %.lr.ph
  %indvars.iv72.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next73.prol, %.prol.loopexit78.loopexit ]
  %104 = icmp ult i64 %indvars.iv84, 3
  br i1 %104, label %.preheader34, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit78
  %105 = sub i64 %99, %indvars.iv72.unr
  %106 = lshr i64 %105, 2
  %107 = add nuw nsw i64 %106, 1
  %min.iters.check = icmp ult i64 %107, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader166, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %107, 1
  %n.vec = sub nsw i64 %107, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %108 = add i64 %indvars.iv72.unr, 4
  %109 = shl nuw i64 %106, 2
  %110 = add i64 %108, %109
  %111 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %110, %111
  br i1 %cmp.zero, label %.lr.ph.new.preheader166, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %112 = shl i64 %index, 2
  %113 = add i64 %indvars.iv72.unr, %112
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %113
  %115 = bitcast double* %114 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %115, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec90 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec91 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec92 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %116 = fmul <2 x double> %strided.vec, %broadcast.splat94
  %117 = fmul <2 x double> %strided.vec90, %broadcast.splat94
  %118 = fmul <2 x double> %strided.vec91, %broadcast.splat94
  %119 = add nsw i64 %113, 3
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %119
  %121 = fmul <2 x double> %strided.vec92, %broadcast.splat94
  %122 = getelementptr double, double* %120, i64 -3
  %123 = bitcast double* %122 to <8 x double>*
  %124 = shufflevector <2 x double> %116, <2 x double> %117, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %125 = shufflevector <2 x double> %118, <2 x double> %121, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %124, <4 x double> %125, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %123, align 8
  %index.next = add i64 %index, 2
  %126 = icmp eq i64 %index.next, %n.vec
  br i1 %126, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader34, label %.lr.ph.new.preheader166

.lr.ph.new.preheader166:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv72.ph = phi i64 [ %indvars.iv72.unr, %min.iters.checked ], [ %indvars.iv72.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader166, %.lr.ph.new
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.3, %.lr.ph.new ], [ %indvars.iv72.ph, %.lr.ph.new.preheader166 ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv72
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %3
  store double %129, double* %127, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %3
  store double %132, double* %130, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.1
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, %3
  store double %135, double* %133, align 8
  %indvars.iv.next73.2 = add nsw i64 %indvars.iv72, 3
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.2
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, %3
  store double %138, double* %136, align 8
  %indvars.iv.next73.3 = add nsw i64 %indvars.iv72, 4
  %exitcond76.3 = icmp eq i64 %indvars.iv.next73.3, %indvars.iv82
  br i1 %exitcond76.3, label %.preheader34.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader34.loopexit:                            ; preds = %.lr.ph.new
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %middle.block, %.prol.loopexit78
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  br i1 %exitcond87, label %._crit_edge44.loopexit167, label %.lr.ph

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge44

._crit_edge44.loopexit167:                        ; preds = %.preheader34
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit167, %._crit_edge44.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
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
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
