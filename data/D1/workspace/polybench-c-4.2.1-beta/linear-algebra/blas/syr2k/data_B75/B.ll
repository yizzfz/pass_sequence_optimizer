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
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #0 {
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

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

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

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader134, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader134 ]
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
  br i1 %exitcond.3, label %.preheader.us14.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us14.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us14.preheader

.preheader.us14.preheader:                        ; preds = %.preheader.us14.preheader.loopexit, %middle.block109, %.prol.loopexit
  %min.iters.check67 = icmp ult i64 %75, 2
  %n.vec70 = and i64 %75, -2
  %cmp.zero71 = icmp eq i64 %n.vec70, 0
  %cmp.n102 = icmp eq i64 %75, %n.vec70
  br label %.preheader.us14

.preheader.us14:                                  ; preds = %.preheader.us14.preheader, %._crit_edge.us18
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us18 ], [ 0, %.preheader.us14.preheader ]
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv30
  %22 = add nuw nsw i64 %indvars.iv30, 1
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %22
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv30
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %22
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv30
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv30
  br i1 %min.iters.check67, label %scalar.ph66.preheader, label %min.iters.checked68

min.iters.checked68:                              ; preds = %.preheader.us14
  br i1 %cmp.zero71, label %scalar.ph66.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked68
  %bound0 = icmp ult double* %scevgep, %24
  %bound1 = icmp ult double* %24, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound085 = icmp ult double* %scevgep, %scevgep78
  %bound186 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx = or i1 %found.conflict, %found.conflict87
  %bound088 = icmp ult double* %scevgep, %scevgep82
  %bound189 = icmp ult double* %scevgep80, %scevgep74
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx91 = or i1 %conflict.rdx, %found.conflict90
  %bound094 = icmp ult double* %scevgep, %23
  %bound195 = icmp ult double* %23, %scevgep74
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx97 = or i1 %conflict.rdx91, %found.conflict96
  br i1 %conflict.rdx97, label %scalar.ph66.preheader, label %vector.ph98

vector.ph98:                                      ; preds = %vector.memcheck
  br label %vector.body64

vector.body64:                                    ; preds = %vector.body64, %vector.ph98
  %index99 = phi i64 [ 0, %vector.ph98 ], [ %index.next100, %vector.body64 ]
  %25 = or i64 %index99, 1
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index99, i64 %indvars.iv30
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %25, i64 %indvars.iv30
  %28 = load double, double* %26, align 8, !alias.scope !5
  %29 = load double, double* %27, align 8, !alias.scope !5
  %30 = insertelement <2 x double> undef, double %28, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fmul <2 x double> %31, %broadcast.splat107
  %33 = load double, double* %23, align 8, !alias.scope !8
  %34 = insertelement <2 x double> undef, double %33, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = fmul <2 x double> %32, %35
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index99, i64 %indvars.iv30
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %25, i64 %indvars.iv30
  %39 = load double, double* %37, align 8, !alias.scope !10
  %40 = load double, double* %38, align 8, !alias.scope !10
  %41 = insertelement <2 x double> undef, double %39, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %42, %broadcast.splat107
  %44 = load double, double* %24, align 8, !alias.scope !12
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %43, %46
  %48 = fadd <2 x double> %36, %47
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index99
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !14, !noalias !16
  %51 = fadd <2 x double> %wide.load, %48
  %52 = bitcast double* %49 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8, !alias.scope !14, !noalias !16
  %index.next100 = add i64 %index99, 2
  %53 = icmp eq i64 %index.next100, %n.vec70
  br i1 %53, label %middle.block65, label %vector.body64, !llvm.loop !17

middle.block65:                                   ; preds = %vector.body64
  br i1 %cmp.n102, label %._crit_edge.us18, label %scalar.ph66.preheader

scalar.ph66.preheader:                            ; preds = %middle.block65, %vector.memcheck, %min.iters.checked68, %.preheader.us14
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked68 ], [ 0, %.preheader.us14 ], [ %n.vec70, %middle.block65 ]
  br label %scalar.ph66

scalar.ph66:                                      ; preds = %scalar.ph66.preheader, %scalar.ph66
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph66 ], [ %indvars.iv25.ph, %scalar.ph66.preheader ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv30
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %2
  %57 = load double, double* %23, align 8
  %58 = fmul double %56, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv30
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %2
  %62 = load double, double* %24, align 8
  %63 = fmul double %61, %62
  %64 = fadd double %58, %63
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv25
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %65, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv35
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %scalar.ph66, !llvm.loop !18

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge9.us
  %indvars.iv137 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next138, %._crit_edge9.us ]
  %indvars.iv37 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next38, %._crit_edge9.us ]
  %indvars.iv35 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next36, %._crit_edge9.us ]
  %68 = zext i2 %indvars.iv137 to i64
  %69 = add nuw nsw i64 %68, 4294967295
  %70 = and i64 %69, 4294967295
  %71 = add nuw nsw i64 %70, 1
  %72 = add nsw i64 %indvars.iv37, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %73 = mul i64 %indvars.iv37, 1201
  %74 = add i64 %73, 1
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %74
  %75 = add nuw nsw i64 %indvars.iv37, 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %76 = trunc i64 %indvars.iv.next38 to i32
  %xtraiter = and i32 %76, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  store double %79, double* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %71, %.prol.loopexit.loopexit ]
  %80 = icmp ult i64 %indvars.iv37, 3
  br i1 %80, label %.preheader.us14.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %81 = sub i64 %72, %indvars.iv.unr
  %82 = lshr i64 %81, 2
  %83 = add nuw nsw i64 %82, 1
  %min.iters.check111 = icmp ult i64 %83, 2
  br i1 %min.iters.check111, label %.lr.ph.us.new.preheader134, label %min.iters.checked112

.lr.ph.us.new.preheader134:                       ; preds = %middle.block109, %min.iters.checked112, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked112 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end120, %middle.block109 ]
  br label %.lr.ph.us.new

min.iters.checked112:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf113 = and i64 %83, 1
  %n.vec114 = sub nsw i64 %83, %n.mod.vf113
  %cmp.zero115 = icmp eq i64 %n.vec114, 0
  %84 = add nsw i64 %indvars.iv.unr, 4
  %85 = shl nuw i64 %82, 2
  %86 = add i64 %84, %85
  %87 = shl nuw nsw i64 %n.mod.vf113, 2
  %ind.end120 = sub i64 %86, %87
  br i1 %cmp.zero115, label %.lr.ph.us.new.preheader134, label %vector.ph116

vector.ph116:                                     ; preds = %min.iters.checked112
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108, %vector.ph116
  %index117 = phi i64 [ 0, %vector.ph116 ], [ %index.next118, %vector.body108 ]
  %88 = shl i64 %index117, 2
  %89 = add i64 %indvars.iv.unr, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %89
  %91 = bitcast double* %90 to <8 x double>*
  %wide.vec126 = load <8 x double>, <8 x double>* %91, align 8
  %strided.vec127 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec128 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec129 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec130 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %92 = fmul <2 x double> %strided.vec127, %broadcast.splat132
  %93 = fmul <2 x double> %strided.vec128, %broadcast.splat132
  %94 = fmul <2 x double> %strided.vec129, %broadcast.splat132
  %95 = add nsw i64 %89, 3
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %95
  %97 = fmul <2 x double> %strided.vec130, %broadcast.splat132
  %98 = getelementptr double, double* %96, i64 -3
  %99 = bitcast double* %98 to <8 x double>*
  %100 = shufflevector <2 x double> %92, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %101 = shufflevector <2 x double> %94, <2 x double> %97, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec133 = shufflevector <4 x double> %100, <4 x double> %101, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec133, <8 x double>* %99, align 8
  %index.next118 = add i64 %index117, 2
  %102 = icmp eq i64 %index.next118, %n.vec114
  br i1 %102, label %middle.block109, label %vector.body108, !llvm.loop !21

middle.block109:                                  ; preds = %vector.body108
  %cmp.n121 = icmp eq i64 %n.mod.vf113, 0
  br i1 %cmp.n121, label %.preheader.us14.preheader, label %.lr.ph.us.new.preheader134

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph66
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block65
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge9.us, label %.preheader.us14

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  %indvars.iv.next138 = add i2 %indvars.iv137, 1
  br i1 %exitcond40, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader3
  %indvars.iv139 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next140, %.preheader3 ]
  %indvars.iv53 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next54, %.preheader3 ]
  %indvars.iv51 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next52, %.preheader3 ]
  %103 = zext i2 %indvars.iv139 to i64
  %104 = add nuw nsw i64 %103, 4294967295
  %105 = and i64 %104, 4294967295
  %106 = add nuw nsw i64 %105, 1
  %107 = add nsw i64 %indvars.iv53, -3
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %108 = trunc i64 %indvars.iv.next54 to i32
  %xtraiter48 = and i32 %108, 3
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  br i1 %lcmp.mod49, label %.prol.loopexit47, label %.prol.preheader46.preheader

.prol.preheader46.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader46

.prol.preheader46:                                ; preds = %.prol.preheader46.preheader, %.prol.preheader46
  %indvars.iv41.prol = phi i64 [ %indvars.iv.next42.prol, %.prol.preheader46 ], [ 0, %.prol.preheader46.preheader ]
  %prol.iter50 = phi i32 [ %prol.iter50.sub, %.prol.preheader46 ], [ %xtraiter48, %.prol.preheader46.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next42.prol = add nuw nsw i64 %indvars.iv41.prol, 1
  %prol.iter50.sub = add nsw i32 %prol.iter50, -1
  %prol.iter50.cmp = icmp eq i32 %prol.iter50.sub, 0
  br i1 %prol.iter50.cmp, label %.prol.loopexit47.loopexit, label %.prol.preheader46, !llvm.loop !22

.prol.loopexit47.loopexit:                        ; preds = %.prol.preheader46
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.prol.loopexit47.loopexit, %.lr.ph
  %indvars.iv41.unr = phi i64 [ 0, %.lr.ph ], [ %106, %.prol.loopexit47.loopexit ]
  %112 = icmp ult i64 %indvars.iv53, 3
  br i1 %112, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit47
  %113 = sub i64 %107, %indvars.iv41.unr
  %114 = lshr i64 %113, 2
  %115 = add nuw nsw i64 %114, 1
  %min.iters.check = icmp ult i64 %115, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader135, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %115, 1
  %n.vec = sub nsw i64 %115, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %116 = add nsw i64 %indvars.iv41.unr, 4
  %117 = shl nuw i64 %114, 2
  %118 = add i64 %116, %117
  %119 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %118, %119
  br i1 %cmp.zero, label %.lr.ph.new.preheader135, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %120 = shl i64 %index, 2
  %121 = add i64 %indvars.iv41.unr, %120
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %121
  %123 = bitcast double* %122 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %123, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec59 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec60 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %124 = fmul <2 x double> %strided.vec, %broadcast.splat63
  %125 = fmul <2 x double> %strided.vec59, %broadcast.splat63
  %126 = fmul <2 x double> %strided.vec60, %broadcast.splat63
  %127 = add nsw i64 %121, 3
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %127
  %129 = fmul <2 x double> %strided.vec61, %broadcast.splat63
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
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader135

.lr.ph.new.preheader135:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv41.ph = phi i64 [ %indvars.iv41.unr, %min.iters.checked ], [ %indvars.iv41.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader135, %.lr.ph.new
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.3, %.lr.ph.new ], [ %indvars.iv41.ph, %.lr.ph.new.preheader135 ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.1
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %3
  store double %143, double* %141, align 8
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv41, 3
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.2
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, %3
  store double %146, double* %144, align 8
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next42.3, %indvars.iv51
  br i1 %exitcond45.3, label %.preheader3.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit47
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  %indvars.iv.next140 = add i2 %indvars.iv139, 1
  br i1 %exitcond56, label %._crit_edge13.loopexit136, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit136:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit136, %._crit_edge13.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #4
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
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

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
!16 = !{!13, !6, !11, !9}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
