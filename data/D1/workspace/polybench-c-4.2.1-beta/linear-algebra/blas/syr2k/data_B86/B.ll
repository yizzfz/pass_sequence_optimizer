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
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %12 ]
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
  br i1 %exitcond22, label %._crit_edge11.us, label %12

._crit_edge11.us:                                 ; preds = %12
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader.lr.ph.loopexit, label %.preheader4.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge11.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %.preheader4.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count25, %.preheader.lr.ph.loopexit ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %26

; <label>:26:                                     ; preds = %26, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %26 ]
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
  br i1 %exitcond, label %._crit_edge.us, label %26

._crit_edge.us:                                   ; preds = %26
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count.pre-phi
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge11

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count53 = zext i32 %0 to i64
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count30 = zext i32 %1 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert133 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat134 = shufflevector <2 x double> %broadcast.splatinsert133, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader136, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader136 ]
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
  br i1 %exitcond.3, label %.preheader.us12.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us12.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us12.preheader

.preheader.us12.preheader:                        ; preds = %.preheader.us12.preheader.loopexit, %middle.block111, %.prol.loopexit
  %min.iters.check69 = icmp ult i64 %68, 2
  %n.vec72 = and i64 %68, -2
  %cmp.zero73 = icmp eq i64 %n.vec72, 0
  %cmp.n104 = icmp eq i64 %68, %n.vec72
  br label %.preheader.us12

.preheader.us12:                                  ; preds = %.preheader.us12.preheader, %._crit_edge.us16
  %indvars.iv28 = phi i64 [ %22, %._crit_edge.us16 ], [ 0, %.preheader.us12.preheader ]
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv28
  %22 = add i64 %indvars.iv28, 1
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %22
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv28
  %scevgep84 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv35, i64 %22
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv28
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv28
  br i1 %min.iters.check69, label %scalar.ph68.preheader, label %min.iters.checked70

min.iters.checked70:                              ; preds = %.preheader.us12
  br i1 %cmp.zero73, label %scalar.ph68.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked70
  %bound0 = icmp ult double* %scevgep, %24
  %bound1 = icmp ult double* %24, %scevgep76
  %found.conflict = and i1 %bound0, %bound1
  %bound087 = icmp ult double* %scevgep, %scevgep80
  %bound188 = icmp ult double* %scevgep78, %scevgep76
  %found.conflict89 = and i1 %bound087, %bound188
  %conflict.rdx = or i1 %found.conflict, %found.conflict89
  %bound090 = icmp ult double* %scevgep, %scevgep84
  %bound191 = icmp ult double* %scevgep82, %scevgep76
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx93 = or i1 %conflict.rdx, %found.conflict92
  %bound096 = icmp ult double* %scevgep, %23
  %bound197 = icmp ult double* %23, %scevgep76
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx99 = or i1 %conflict.rdx93, %found.conflict98
  br i1 %conflict.rdx99, label %scalar.ph68.preheader, label %vector.ph100

vector.ph100:                                     ; preds = %vector.memcheck
  %.pre = load double, double* %23, align 8, !alias.scope !5
  %.pre139 = load double, double* %24, align 8, !alias.scope !8
  %25 = insertelement <2 x double> undef, double %.pre, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = insertelement <2 x double> undef, double %.pre139, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %vector.ph100
  %index101 = phi i64 [ 0, %vector.ph100 ], [ %index.next102, %vector.body66 ]
  %29 = or i64 %index101, 1
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index101, i64 %indvars.iv28
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %29, i64 %indvars.iv28
  %32 = load double, double* %30, align 8, !alias.scope !10
  %33 = load double, double* %31, align 8, !alias.scope !10
  %34 = insertelement <2 x double> undef, double %32, i32 0
  %35 = insertelement <2 x double> %34, double %33, i32 1
  %36 = fmul <2 x double> %35, %broadcast.splat109
  %37 = fmul <2 x double> %36, %26
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index101, i64 %indvars.iv28
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %29, i64 %indvars.iv28
  %40 = load double, double* %38, align 8, !alias.scope !12
  %41 = load double, double* %39, align 8, !alias.scope !12
  %42 = insertelement <2 x double> undef, double %40, i32 0
  %43 = insertelement <2 x double> %42, double %41, i32 1
  %44 = fmul <2 x double> %43, %broadcast.splat109
  %45 = fmul <2 x double> %44, %28
  %46 = fadd <2 x double> %37, %45
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %index101
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !14, !noalias !16
  %49 = fadd <2 x double> %wide.load, %46
  store <2 x double> %49, <2 x double>* %48, align 8, !alias.scope !14, !noalias !16
  %index.next102 = add i64 %index101, 2
  %50 = icmp eq i64 %index.next102, %n.vec72
  br i1 %50, label %middle.block67, label %vector.body66, !llvm.loop !17

middle.block67:                                   ; preds = %vector.body66
  br i1 %cmp.n104, label %._crit_edge.us16, label %scalar.ph68.preheader

scalar.ph68.preheader:                            ; preds = %middle.block67, %vector.memcheck, %min.iters.checked70, %.preheader.us12
  %indvars.iv23.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked70 ], [ 0, %.preheader.us12 ], [ %n.vec72, %middle.block67 ]
  br label %scalar.ph68

scalar.ph68:                                      ; preds = %scalar.ph68.preheader, %scalar.ph68
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %scalar.ph68 ], [ %indvars.iv23.ph, %scalar.ph68.preheader ]
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv28
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %2
  %54 = load double, double* %23, align 8
  %55 = fmul double %53, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv28
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %24, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %55, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv23
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %62, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, %indvars.iv33
  br i1 %exitcond, label %._crit_edge.us16.loopexit, label %scalar.ph68, !llvm.loop !18

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge9.us
  %indvars.iv57 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next58, %._crit_edge9.us ]
  %indvars.iv35 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %68, %._crit_edge9.us ]
  %indvars.iv33 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next34, %._crit_edge9.us ]
  %65 = add i64 %indvars.iv35, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 0
  %66 = mul i64 %indvars.iv35, 1201
  %67 = add i64 %66, 1
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %67
  %68 = add nuw i64 %indvars.iv35, 1
  %69 = zext i2 %indvars.iv57 to i64
  %70 = add nuw nsw i64 %69, 4294967295
  %71 = and i64 %70, 4294967295
  %72 = add nuw nsw i64 %71, 1
  %73 = trunc i64 %68 to i32
  %xtraiter = and i32 %73, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  store double %76, double* %74, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %72, %.prol.loopexit.loopexit ]
  %77 = icmp ult i64 %indvars.iv35, 3
  br i1 %77, label %.preheader.us12.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %78 = sub i64 %65, %indvars.iv.unr
  %79 = lshr i64 %78, 2
  %80 = add nuw nsw i64 %79, 1
  %min.iters.check113 = icmp ult i64 %80, 2
  br i1 %min.iters.check113, label %.lr.ph.us.new.preheader136, label %min.iters.checked114

.lr.ph.us.new.preheader136:                       ; preds = %middle.block111, %min.iters.checked114, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked114 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end122, %middle.block111 ]
  br label %.lr.ph.us.new

min.iters.checked114:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf115 = and i64 %80, 1
  %n.vec116 = sub nsw i64 %80, %n.mod.vf115
  %cmp.zero117 = icmp eq i64 %n.vec116, 0
  %81 = add nsw i64 %indvars.iv.unr, 4
  %82 = shl nuw i64 %79, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf115, 2
  %ind.end122 = sub i64 %83, %84
  br i1 %cmp.zero117, label %.lr.ph.us.new.preheader136, label %vector.ph118

vector.ph118:                                     ; preds = %min.iters.checked114
  br label %vector.body110

vector.body110:                                   ; preds = %vector.body110, %vector.ph118
  %index119 = phi i64 [ 0, %vector.ph118 ], [ %index.next120, %vector.body110 ]
  %85 = shl i64 %index119, 2
  %86 = add i64 %indvars.iv.unr, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec128 = load <8 x double>, <8 x double>* %88, align 8
  %strided.vec129 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec130 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec131 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec132 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %89 = fmul <2 x double> %strided.vec129, %broadcast.splat134
  %90 = fmul <2 x double> %strided.vec130, %broadcast.splat134
  %91 = fmul <2 x double> %strided.vec131, %broadcast.splat134
  %92 = add nsw i64 %86, 3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %92
  %94 = fmul <2 x double> %strided.vec132, %broadcast.splat134
  %95 = getelementptr double, double* %93, i64 -3
  %96 = bitcast double* %95 to <8 x double>*
  %97 = shufflevector <2 x double> %89, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %98 = shufflevector <2 x double> %91, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec135 = shufflevector <4 x double> %97, <4 x double> %98, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec135, <8 x double>* %96, align 8
  %index.next120 = add i64 %index119, 2
  %99 = icmp eq i64 %index.next120, %n.vec116
  br i1 %99, label %middle.block111, label %vector.body110, !llvm.loop !21

middle.block111:                                  ; preds = %vector.body110
  %cmp.n123 = icmp eq i64 %n.mod.vf115, 0
  br i1 %cmp.n123, label %.preheader.us12.preheader, label %.lr.ph.us.new.preheader136

._crit_edge.us16.loopexit:                        ; preds = %scalar.ph68
  br label %._crit_edge.us16

._crit_edge.us16:                                 ; preds = %._crit_edge.us16.loopexit, %middle.block67
  %exitcond31 = icmp eq i64 %22, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge9.us, label %.preheader.us12

._crit_edge9.us:                                  ; preds = %._crit_edge.us16
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %68, %wide.trip.count37
  %indvars.iv.next58 = add i2 %indvars.iv57, 1
  br i1 %exitcond38, label %._crit_edge11.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader3
  %indvars.iv59 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next60, %.preheader3 ]
  %indvars.iv51 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next52, %.preheader3 ]
  %indvars.iv49 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next50, %.preheader3 ]
  %100 = add nsw i64 %indvars.iv51, -3
  %101 = zext i2 %indvars.iv59 to i64
  %102 = add nuw nsw i64 %101, 4294967295
  %103 = and i64 %102, 4294967295
  %104 = add nuw nsw i64 %103, 1
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %105 = trunc i64 %indvars.iv.next52 to i32
  %xtraiter46 = and i32 %105, 3
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.prol.loopexit45, label %.prol.preheader44.preheader

.prol.preheader44.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader44

.prol.preheader44:                                ; preds = %.prol.preheader44.preheader, %.prol.preheader44
  %indvars.iv39.prol = phi i64 [ %indvars.iv.next40.prol, %.prol.preheader44 ], [ 0, %.prol.preheader44.preheader ]
  %prol.iter48 = phi i32 [ %prol.iter48.sub, %.prol.preheader44 ], [ %xtraiter46, %.prol.preheader44.preheader ]
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv39.prol
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %3
  store double %108, double* %106, align 8
  %indvars.iv.next40.prol = add nuw nsw i64 %indvars.iv39.prol, 1
  %prol.iter48.sub = add nsw i32 %prol.iter48, -1
  %prol.iter48.cmp = icmp eq i32 %prol.iter48.sub, 0
  br i1 %prol.iter48.cmp, label %.prol.loopexit45.loopexit, label %.prol.preheader44, !llvm.loop !22

.prol.loopexit45.loopexit:                        ; preds = %.prol.preheader44
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.prol.loopexit45.loopexit, %.lr.ph
  %indvars.iv39.unr = phi i64 [ 0, %.lr.ph ], [ %104, %.prol.loopexit45.loopexit ]
  %109 = icmp ult i64 %indvars.iv51, 3
  br i1 %109, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit45
  %110 = sub i64 %100, %indvars.iv39.unr
  %111 = lshr i64 %110, 2
  %112 = add nuw nsw i64 %111, 1
  %min.iters.check = icmp ult i64 %112, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader137, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %112, 1
  %n.vec = sub nsw i64 %112, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %113 = add nsw i64 %indvars.iv39.unr, 4
  %114 = shl nuw i64 %111, 2
  %115 = add i64 %113, %114
  %116 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %115, %116
  br i1 %cmp.zero, label %.lr.ph.new.preheader137, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %117 = shl i64 %index, 2
  %118 = add i64 %indvars.iv39.unr, %117
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %118
  %120 = bitcast double* %119 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %120, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %121 = fmul <2 x double> %strided.vec, %broadcast.splat65
  %122 = fmul <2 x double> %strided.vec61, %broadcast.splat65
  %123 = fmul <2 x double> %strided.vec62, %broadcast.splat65
  %124 = add nsw i64 %118, 3
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %124
  %126 = fmul <2 x double> %strided.vec63, %broadcast.splat65
  %127 = getelementptr double, double* %125, i64 -3
  %128 = bitcast double* %127 to <8 x double>*
  %129 = shufflevector <2 x double> %121, <2 x double> %122, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %130 = shufflevector <2 x double> %123, <2 x double> %126, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %129, <4 x double> %130, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %128, align 8
  %index.next = add i64 %index, 2
  %131 = icmp eq i64 %index.next, %n.vec
  br i1 %131, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader137

.lr.ph.new.preheader137:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv39.ph = phi i64 [ %indvars.iv39.unr, %min.iters.checked ], [ %indvars.iv39.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader137, %.lr.ph.new
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.3, %.lr.ph.new ], [ %indvars.iv39.ph, %.lr.ph.new.preheader137 ]
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv39
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %3
  store double %134, double* %132, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next40
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next40.1
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next40.2 = add nsw i64 %indvars.iv39, 3
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next40.2
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %3
  store double %143, double* %141, align 8
  %indvars.iv.next40.3 = add nsw i64 %indvars.iv39, 4
  %exitcond43.3 = icmp eq i64 %indvars.iv.next40.3, %indvars.iv49
  br i1 %exitcond43.3, label %.preheader3.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit45
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  %indvars.iv.next60 = add i2 %indvars.iv59, 1
  br i1 %exitcond54, label %._crit_edge11.loopexit138, label %.lr.ph

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11.loopexit138:                        ; preds = %.preheader3
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit138, %._crit_edge11.loopexit, %7
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
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
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
