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
  %wide.trip.count51 = zext i32 %0 to i64
  %broadcast.splatinsert63 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat64 = shufflevector <2 x double> %broadcast.splatinsert63, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count33 = zext i32 %1 to i64
  %wide.trip.count40 = zext i32 %0 to i64
  %broadcast.splatinsert107 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat108 = shufflevector <2 x double> %broadcast.splatinsert107, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert132 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat133 = shufflevector <2 x double> %broadcast.splatinsert132, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader135, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader135 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv36
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block110, %.prol.loopexit
  %min.iters.check68 = icmp ult i64 %72, 2
  %n.vec71 = and i64 %72, -2
  %cmp.zero72 = icmp eq i64 %n.vec71, 0
  %cmp.n103 = icmp eq i64 %72, %n.vec71
  br label %.preheader.us15

scalar.ph67:                                      ; preds = %scalar.ph67.preheader, %scalar.ph67
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph67 ], [ %indvars.iv25.ph, %scalar.ph67.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv31
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv25
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, %indvars.iv36
  br i1 %exitcond30, label %._crit_edge.us18.loopexit, label %scalar.ph67, !llvm.loop !5

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %36 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep79 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %36
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %min.iters.check68, label %scalar.ph67.preheader, label %min.iters.checked69

scalar.ph67.preheader:                            ; preds = %middle.block66, %vector.memcheck, %min.iters.checked69, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked69 ], [ 0, %.preheader.us15 ], [ %n.vec71, %middle.block66 ]
  br label %scalar.ph67

min.iters.checked69:                              ; preds = %.preheader.us15
  br i1 %cmp.zero72, label %scalar.ph67.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked69
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep75
  %found.conflict = and i1 %bound0, %bound1
  %bound086 = icmp ult double* %scevgep, %scevgep79
  %bound187 = icmp ult double* %scevgep77, %scevgep75
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx = or i1 %found.conflict, %found.conflict88
  %bound089 = icmp ult double* %scevgep, %scevgep83
  %bound190 = icmp ult double* %scevgep81, %scevgep75
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx92 = or i1 %conflict.rdx, %found.conflict91
  %bound095 = icmp ult double* %scevgep, %37
  %bound196 = icmp ult double* %37, %scevgep75
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx98 = or i1 %conflict.rdx92, %found.conflict97
  br i1 %conflict.rdx98, label %scalar.ph67.preheader, label %vector.ph99

vector.ph99:                                      ; preds = %vector.memcheck
  br label %vector.body65

vector.body65:                                    ; preds = %vector.body65, %vector.ph99
  %index100 = phi i64 [ 0, %vector.ph99 ], [ %index.next101, %vector.body65 ]
  %39 = or i64 %index100, 1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index100, i64 %indvars.iv31
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %39, i64 %indvars.iv31
  %42 = load double, double* %40, align 8, !alias.scope !6
  %43 = load double, double* %41, align 8, !alias.scope !6
  %44 = insertelement <2 x double> undef, double %42, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fmul <2 x double> %45, %broadcast.splat108
  %47 = load double, double* %37, align 8, !alias.scope !9
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %46, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index100, i64 %indvars.iv31
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %39, i64 %indvars.iv31
  %53 = load double, double* %51, align 8, !alias.scope !11
  %54 = load double, double* %52, align 8, !alias.scope !11
  %55 = insertelement <2 x double> undef, double %53, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %56, %broadcast.splat108
  %58 = load double, double* %38, align 8, !alias.scope !13
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = fmul <2 x double> %57, %60
  %62 = fadd <2 x double> %50, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index100
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next101 = add i64 %index100, 2
  %67 = icmp eq i64 %index.next101, %n.vec71
  br i1 %67, label %middle.block66, label %vector.body65, !llvm.loop !18

middle.block66:                                   ; preds = %vector.body65
  br i1 %cmp.n103, label %._crit_edge.us18, label %scalar.ph67.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge9.us
  %indvars.iv138 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next139, %._crit_edge9.us ]
  %indvars.iv38 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %73, %._crit_edge9.us ]
  %indvars.iv36 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us ]
  %68 = zext i2 %indvars.iv138 to i64
  %69 = add i64 %indvars.iv38, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %70 = mul i64 %indvars.iv38, 1201
  %71 = add i64 %70, 1
  %scevgep75 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %71
  %72 = add nuw i64 %indvars.iv38, 1
  %73 = add nuw i64 %indvars.iv38, 1
  %xtraiter = and i64 %73, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  store double %76, double* %74, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %68, %.prol.loopexit.loopexit ]
  %77 = icmp ult i64 %indvars.iv38, 3
  br i1 %77, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %78 = sub i64 %69, %indvars.iv.unr
  %79 = lshr i64 %78, 2
  %80 = add nuw nsw i64 %79, 1
  %min.iters.check112 = icmp ult i64 %80, 2
  br i1 %min.iters.check112, label %.lr.ph.us.new.preheader135, label %min.iters.checked113

.lr.ph.us.new.preheader135:                       ; preds = %middle.block110, %min.iters.checked113, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked113 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end121, %middle.block110 ]
  br label %.lr.ph.us.new

min.iters.checked113:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf114 = and i64 %80, 1
  %n.vec115 = sub nsw i64 %80, %n.mod.vf114
  %cmp.zero116 = icmp eq i64 %n.vec115, 0
  %81 = or i64 %indvars.iv.unr, 4
  %82 = shl nuw i64 %79, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf114, 2
  %ind.end121 = sub i64 %83, %84
  br i1 %cmp.zero116, label %.lr.ph.us.new.preheader135, label %vector.ph117

vector.ph117:                                     ; preds = %min.iters.checked113
  br label %vector.body109

vector.body109:                                   ; preds = %vector.body109, %vector.ph117
  %index118 = phi i64 [ 0, %vector.ph117 ], [ %index.next119, %vector.body109 ]
  %85 = shl i64 %index118, 2
  %86 = or i64 %indvars.iv.unr, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec127 = load <8 x double>, <8 x double>* %88, align 8
  %strided.vec128 = shufflevector <8 x double> %wide.vec127, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec129 = shufflevector <8 x double> %wide.vec127, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec130 = shufflevector <8 x double> %wide.vec127, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec131 = shufflevector <8 x double> %wide.vec127, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %89 = fmul <2 x double> %strided.vec128, %broadcast.splat133
  %90 = fmul <2 x double> %strided.vec129, %broadcast.splat133
  %91 = fmul <2 x double> %strided.vec130, %broadcast.splat133
  %92 = add nsw i64 %86, 3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %92
  %94 = fmul <2 x double> %strided.vec131, %broadcast.splat133
  %95 = getelementptr double, double* %93, i64 -3
  %96 = bitcast double* %95 to <8 x double>*
  %97 = shufflevector <2 x double> %89, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %98 = shufflevector <2 x double> %91, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec134 = shufflevector <4 x double> %97, <4 x double> %98, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec134, <8 x double>* %96, align 8
  %index.next119 = add i64 %index118, 2
  %99 = icmp eq i64 %index.next119, %n.vec115
  br i1 %99, label %middle.block110, label %vector.body109, !llvm.loop !21

middle.block110:                                  ; preds = %vector.body109
  %cmp.n122 = icmp eq i64 %n.mod.vf114, 0
  br i1 %cmp.n122, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader135

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph67
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block66
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %73, %wide.trip.count40
  %indvars.iv.next139 = add i2 %indvars.iv138, 1
  br i1 %exitcond41, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader3
  %indvars.iv140 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next141, %.preheader3 ]
  %indvars.iv49 = phi i64 [ 0, %.lr.ph.preheader ], [ %102, %.preheader3 ]
  %indvars.iv47 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next48, %.preheader3 ]
  %100 = zext i2 %indvars.iv140 to i64
  %101 = add i64 %indvars.iv49, -3
  %102 = add nuw i64 %indvars.iv49, 1
  %xtraiter55 = and i64 %102, 3
  %lcmp.mod56 = icmp eq i64 %xtraiter55, 0
  br i1 %lcmp.mod56, label %.prol.loopexit54, label %.prol.preheader53.preheader

.prol.preheader53.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader53

.prol.preheader53:                                ; preds = %.prol.preheader53.preheader, %.prol.preheader53
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader53 ], [ 0, %.prol.preheader53.preheader ]
  %prol.iter57 = phi i64 [ %prol.iter57.sub, %.prol.preheader53 ], [ %xtraiter55, %.prol.preheader53.preheader ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42.prol
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %3
  store double %105, double* %103, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter57.sub = add nsw i64 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i64 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %.prol.loopexit54.loopexit, label %.prol.preheader53, !llvm.loop !22

.prol.loopexit54.loopexit:                        ; preds = %.prol.preheader53
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.prol.loopexit54.loopexit, %.lr.ph
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph ], [ %100, %.prol.loopexit54.loopexit ]
  %106 = icmp ult i64 %indvars.iv49, 3
  br i1 %106, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit54
  %107 = sub i64 %101, %indvars.iv42.unr
  %108 = lshr i64 %107, 2
  %109 = add nuw nsw i64 %108, 1
  %min.iters.check = icmp ult i64 %109, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader136, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %109, 1
  %n.vec = sub nsw i64 %109, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %110 = or i64 %indvars.iv42.unr, 4
  %111 = shl nuw i64 %108, 2
  %112 = add i64 %110, %111
  %113 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %112, %113
  br i1 %cmp.zero, label %.lr.ph.new.preheader136, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %114 = shl i64 %index, 2
  %115 = or i64 %indvars.iv42.unr, %114
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %115
  %117 = bitcast double* %116 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %117, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec60 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %118 = fmul <2 x double> %strided.vec, %broadcast.splat64
  %119 = fmul <2 x double> %strided.vec60, %broadcast.splat64
  %120 = fmul <2 x double> %strided.vec61, %broadcast.splat64
  %121 = add nsw i64 %115, 3
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %121
  %123 = fmul <2 x double> %strided.vec62, %broadcast.splat64
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
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader136

.lr.ph.new.preheader136:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv42.ph = phi i64 [ %indvars.iv42.unr, %min.iters.checked ], [ %indvars.iv42.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader136, %.lr.ph.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.3, %.lr.ph.new ], [ %indvars.iv42.ph, %.lr.ph.new.preheader136 ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %3
  store double %131, double* %129, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %3
  store double %134, double* %132, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.1
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv42, 3
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.2
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next43.3, %indvars.iv47
  br i1 %exitcond46.3, label %.preheader3.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit54
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %102, %wide.trip.count51
  %indvars.iv.next141 = add i2 %indvars.iv140, 1
  br i1 %exitcond52, label %._crit_edge13.loopexit137, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit137:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit137, %._crit_edge13.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
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
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
