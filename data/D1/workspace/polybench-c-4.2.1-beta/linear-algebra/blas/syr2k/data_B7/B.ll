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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  br i1 %8, label %.preheader28.lr.ph, label %._crit_edge32

.preheader28.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader28.us.preheader, label %.preheader.lr.ph

.preheader28.us.preheader:                        ; preds = %.preheader28.lr.ph
  %wide.trip.count45 = zext i32 %1 to i64
  %wide.trip.count49 = zext i32 %0 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %.preheader28.us.preheader, %._crit_edge35.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge35.us ], [ 0, %.preheader28.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader28.us
  %indvars.iv43 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv43, %indvars.iv47
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv47, i64 %indvars.iv43
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %13, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %11
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv47, i64 %indvars.iv43
  store double %24, double* %25, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge35.us, label %12

._crit_edge35.us:                                 ; preds = %12
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %.preheader27, label %.preheader28.us

.preheader27:                                     ; preds = %._crit_edge35.us
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader.lr.ph, label %._crit_edge32

.preheader.lr.ph:                                 ; preds = %.preheader28.lr.ph, %.preheader27
  %27 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count41 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %28

; <label>:28:                                     ; preds = %28, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %28 ]
  %29 = mul nuw nsw i64 %indvars.iv, %indvars.iv39
  %30 = add nuw nsw i64 %29, 3
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %0
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %27
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %28

._crit_edge.us:                                   ; preds = %28
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge32.loopexit, label %.preheader.us

._crit_edge32.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %7, %.preheader27
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]* readonly, [1000 x double]* readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader32.lr.ph, label %._crit_edge41

.preheader32.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader32.lr.ph
  %wide.trip.count79 = zext i32 %0 to i64
  %broadcast.splatinsert91 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat92 = shufflevector <2 x double> %broadcast.splatinsert91, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader32.lr.ph
  %wide.trip.count61 = zext i32 %1 to i64
  %wide.trip.count68 = zext i32 %0 to i64
  %broadcast.splatinsert160 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat161 = shufflevector <2 x double> %broadcast.splatinsert160, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert135 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat136 = shufflevector <2 x double> %broadcast.splatinsert135, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader163, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader163 ]
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
  br i1 %exitcond.3, label %.preheader.us43.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us43.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us43.preheader

.preheader.us43.preheader:                        ; preds = %.preheader.us43.preheader.loopexit, %middle.block138, %.prol.loopexit
  %min.iters.check96 = icmp ult i64 %71, 2
  %n.vec99 = and i64 %71, -2
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  %cmp.n131 = icmp eq i64 %71, %n.vec99
  br label %.preheader.us43

scalar.ph95:                                      ; preds = %scalar.ph95.preheader, %scalar.ph95
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %scalar.ph95 ], [ %indvars.iv53.ph, %scalar.ph95.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv59
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv53, i64 %indvars.iv59
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv53
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, %indvars.iv64
  br i1 %exitcond58, label %._crit_edge.us46.loopexit, label %scalar.ph95, !llvm.loop !5

.preheader.us43:                                  ; preds = %.preheader.us43.preheader, %._crit_edge.us46
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us46 ], [ 0, %.preheader.us43.preheader ]
  %scevgep105 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv59
  %36 = add i64 %indvars.iv59, 1
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv66, i64 %36
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv59
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv66, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv59
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv66, i64 %indvars.iv59
  br i1 %min.iters.check96, label %scalar.ph95.preheader, label %min.iters.checked97

scalar.ph95.preheader:                            ; preds = %middle.block94, %vector.memcheck, %min.iters.checked97, %.preheader.us43
  %indvars.iv53.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked97 ], [ 0, %.preheader.us43 ], [ %n.vec99, %middle.block94 ]
  br label %scalar.ph95

min.iters.checked97:                              ; preds = %.preheader.us43
  br i1 %cmp.zero100, label %scalar.ph95.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked97
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep103
  %found.conflict = and i1 %bound0, %bound1
  %bound0114 = icmp ult double* %scevgep, %scevgep107
  %bound1115 = icmp ult double* %scevgep105, %scevgep103
  %found.conflict116 = and i1 %bound0114, %bound1115
  %conflict.rdx = or i1 %found.conflict, %found.conflict116
  %bound0117 = icmp ult double* %scevgep, %scevgep111
  %bound1118 = icmp ult double* %scevgep109, %scevgep103
  %found.conflict119 = and i1 %bound0117, %bound1118
  %conflict.rdx120 = or i1 %conflict.rdx, %found.conflict119
  %bound0123 = icmp ult double* %scevgep, %37
  %bound1124 = icmp ult double* %37, %scevgep103
  %found.conflict125 = and i1 %bound0123, %bound1124
  %conflict.rdx126 = or i1 %conflict.rdx120, %found.conflict125
  br i1 %conflict.rdx126, label %scalar.ph95.preheader, label %vector.ph127

vector.ph127:                                     ; preds = %vector.memcheck
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93, %vector.ph127
  %index128 = phi i64 [ 0, %vector.ph127 ], [ %index.next129, %vector.body93 ]
  %45 = or i64 %index128, 1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index128, i64 %indvars.iv59
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %45, i64 %indvars.iv59
  %48 = load double, double* %46, align 8, !alias.scope !11
  %49 = load double, double* %47, align 8, !alias.scope !11
  %50 = insertelement <2 x double> undef, double %48, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %51, %broadcast.splat136
  %53 = fmul <2 x double> %52, %41
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index128, i64 %indvars.iv59
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %45, i64 %indvars.iv59
  %56 = load double, double* %54, align 8, !alias.scope !13
  %57 = load double, double* %55, align 8, !alias.scope !13
  %58 = insertelement <2 x double> undef, double %56, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %59, %broadcast.splat136
  %61 = fmul <2 x double> %60, %44
  %62 = fadd <2 x double> %53, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %index128
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next129 = add i64 %index128, 2
  %67 = icmp eq i64 %index.next129, %n.vec99
  br i1 %67, label %middle.block94, label %vector.body93, !llvm.loop !18

middle.block94:                                   ; preds = %vector.body93
  br i1 %cmp.n131, label %._crit_edge.us46, label %scalar.ph95.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge37.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge37.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge37.us ], [ 1, %.lr.ph.us.preheader ]
  %68 = add i64 %indvars.iv66, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 0
  %69 = mul i64 %indvars.iv66, 1201
  %70 = add i64 %69, 1
  %scevgep103 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %70
  %71 = add i64 %indvars.iv66, 1
  %72 = add i64 %indvars.iv66, 1
  %xtraiter = and i64 %72, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  store double %75, double* %73, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %76 = icmp ult i64 %indvars.iv66, 3
  br i1 %76, label %.preheader.us43.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %77 = sub i64 %68, %indvars.iv.unr
  %78 = lshr i64 %77, 2
  %79 = add nuw nsw i64 %78, 1
  %min.iters.check140 = icmp ult i64 %79, 2
  br i1 %min.iters.check140, label %.lr.ph.us.new.preheader163, label %min.iters.checked141

.lr.ph.us.new.preheader163:                       ; preds = %middle.block138, %min.iters.checked141, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked141 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end149, %middle.block138 ]
  br label %.lr.ph.us.new

min.iters.checked141:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf142 = and i64 %79, 1
  %n.vec143 = sub nsw i64 %79, %n.mod.vf142
  %cmp.zero144 = icmp eq i64 %n.vec143, 0
  %80 = add i64 %indvars.iv.unr, 4
  %81 = shl nuw i64 %78, 2
  %82 = add i64 %80, %81
  %83 = shl nuw nsw i64 %n.mod.vf142, 2
  %ind.end149 = sub i64 %82, %83
  br i1 %cmp.zero144, label %.lr.ph.us.new.preheader163, label %vector.ph145

vector.ph145:                                     ; preds = %min.iters.checked141
  br label %vector.body137

vector.body137:                                   ; preds = %vector.body137, %vector.ph145
  %index146 = phi i64 [ 0, %vector.ph145 ], [ %index.next147, %vector.body137 ]
  %84 = shl i64 %index146, 2
  %85 = add i64 %indvars.iv.unr, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %85
  %87 = bitcast double* %86 to <8 x double>*
  %wide.vec155 = load <8 x double>, <8 x double>* %87, align 8
  %strided.vec156 = shufflevector <8 x double> %wide.vec155, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec157 = shufflevector <8 x double> %wide.vec155, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec158 = shufflevector <8 x double> %wide.vec155, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec159 = shufflevector <8 x double> %wide.vec155, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %88 = fmul <2 x double> %strided.vec156, %broadcast.splat161
  %89 = fmul <2 x double> %strided.vec157, %broadcast.splat161
  %90 = fmul <2 x double> %strided.vec158, %broadcast.splat161
  %91 = add nsw i64 %85, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %91
  %93 = fmul <2 x double> %strided.vec159, %broadcast.splat161
  %94 = getelementptr double, double* %92, i64 -3
  %95 = bitcast double* %94 to <8 x double>*
  %96 = shufflevector <2 x double> %88, <2 x double> %89, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %97 = shufflevector <2 x double> %90, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec162 = shufflevector <4 x double> %96, <4 x double> %97, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec162, <8 x double>* %95, align 8
  %index.next147 = add i64 %index146, 2
  %98 = icmp eq i64 %index.next147, %n.vec143
  br i1 %98, label %middle.block138, label %vector.body137, !llvm.loop !21

middle.block138:                                  ; preds = %vector.body137
  %cmp.n150 = icmp eq i64 %n.mod.vf142, 0
  br i1 %cmp.n150, label %.preheader.us43.preheader, label %.lr.ph.us.new.preheader163

._crit_edge.us46.loopexit:                        ; preds = %scalar.ph95
  br label %._crit_edge.us46

._crit_edge.us46:                                 ; preds = %._crit_edge.us46.loopexit, %middle.block94
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %._crit_edge37.us, label %.preheader.us43

._crit_edge37.us:                                 ; preds = %._crit_edge.us46
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %._crit_edge41.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader31
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %.preheader31 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %.preheader31 ], [ 1, %.lr.ph.preheader ]
  %99 = add i64 %indvars.iv77, -3
  %100 = add i64 %indvars.iv77, 1
  %xtraiter83 = and i64 %100, 3
  %lcmp.mod84 = icmp eq i64 %xtraiter83, 0
  br i1 %lcmp.mod84, label %.prol.loopexit82, label %.prol.preheader81.preheader

.prol.preheader81.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader81

.prol.preheader81:                                ; preds = %.prol.preheader81.preheader, %.prol.preheader81
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %.prol.preheader81 ], [ 0, %.prol.preheader81.preheader ]
  %prol.iter85 = phi i64 [ %prol.iter85.sub, %.prol.preheader81 ], [ %xtraiter83, %.prol.preheader81.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv70.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, %3
  store double %103, double* %101, align 8
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter85.sub = add i64 %prol.iter85, -1
  %prol.iter85.cmp = icmp eq i64 %prol.iter85.sub, 0
  br i1 %prol.iter85.cmp, label %.prol.loopexit82.loopexit, label %.prol.preheader81, !llvm.loop !22

.prol.loopexit82.loopexit:                        ; preds = %.prol.preheader81
  br label %.prol.loopexit82

.prol.loopexit82:                                 ; preds = %.prol.loopexit82.loopexit, %.lr.ph
  %indvars.iv70.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next71.prol, %.prol.loopexit82.loopexit ]
  %104 = icmp ult i64 %indvars.iv77, 3
  br i1 %104, label %.preheader31, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit82
  %105 = sub i64 %99, %indvars.iv70.unr
  %106 = lshr i64 %105, 2
  %107 = add nuw nsw i64 %106, 1
  %min.iters.check = icmp ult i64 %107, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader164, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %107, 1
  %n.vec = sub nsw i64 %107, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %108 = add i64 %indvars.iv70.unr, 4
  %109 = shl nuw i64 %106, 2
  %110 = add i64 %108, %109
  %111 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %110, %111
  br i1 %cmp.zero, label %.lr.ph.new.preheader164, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %112 = shl i64 %index, 2
  %113 = add i64 %indvars.iv70.unr, %112
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %113
  %115 = bitcast double* %114 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %115, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec88 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec89 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec90 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %116 = fmul <2 x double> %strided.vec, %broadcast.splat92
  %117 = fmul <2 x double> %strided.vec88, %broadcast.splat92
  %118 = fmul <2 x double> %strided.vec89, %broadcast.splat92
  %119 = add nsw i64 %113, 3
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %119
  %121 = fmul <2 x double> %strided.vec90, %broadcast.splat92
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
  br i1 %cmp.n, label %.preheader31, label %.lr.ph.new.preheader164

.lr.ph.new.preheader164:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv70.ph = phi i64 [ %indvars.iv70.unr, %min.iters.checked ], [ %indvars.iv70.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader164, %.lr.ph.new
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.3, %.lr.ph.new ], [ %indvars.iv70.ph, %.lr.ph.new.preheader164 ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv70
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %3
  store double %129, double* %127, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv.next71
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %3
  store double %132, double* %130, align 8
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv.next71.1
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, %3
  store double %135, double* %133, align 8
  %indvars.iv.next71.2 = add nsw i64 %indvars.iv70, 3
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv.next71.2
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, %3
  store double %138, double* %136, align 8
  %indvars.iv.next71.3 = add nsw i64 %indvars.iv70, 4
  %exitcond74.3 = icmp eq i64 %indvars.iv.next71.3, %indvars.iv75
  br i1 %exitcond74.3, label %.preheader31.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader31.loopexit:                            ; preds = %.lr.ph.new
  br label %.preheader31

.preheader31:                                     ; preds = %.preheader31.loopexit, %middle.block, %.prol.loopexit82
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, %wide.trip.count79
  br i1 %exitcond80, label %._crit_edge41.loopexit165, label %.lr.ph

._crit_edge41.loopexit:                           ; preds = %._crit_edge37.us
  br label %._crit_edge41

._crit_edge41.loopexit165:                        ; preds = %.preheader31
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit165, %._crit_edge41.loopexit, %7
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
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %2
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
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
