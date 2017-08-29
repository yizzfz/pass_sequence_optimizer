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
  %12 = zext i32 %1 to i64
  %13 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %14 ]
  %15 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %10
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %20, double* %21, align 8
  %22 = add nuw nsw i64 %15, 2
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %11
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %26, double* %27, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next20, %12
  br i1 %exitcond30, label %._crit_edge11.us, label %14

._crit_edge11.us:                                 ; preds = %14
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next24, %13
  br i1 %exitcond31, label %.preheader.lr.ph.loopexit, label %.preheader4.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge11.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  %.pre-phi = phi i64 [ %.pre, %.preheader4.lr.ph..preheader.lr.ph_crit_edge ], [ %13, %.preheader.lr.ph.loopexit ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %28

; <label>:28:                                     ; preds = %28, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %28 ]
  %29 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %30 = add nuw nsw i64 %29, 3
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %0
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %11
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %.pre-phi
  br i1 %exitcond29, label %._crit_edge.us, label %28

._crit_edge.us:                                   ; preds = %28
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %.pre-phi
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

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
  %10 = zext i32 %0 to i64
  %broadcast.splatinsert69 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat70 = shufflevector <2 x double> %broadcast.splatinsert69, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %broadcast.splatinsert113 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat114 = shufflevector <2 x double> %broadcast.splatinsert113, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert138 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat139 = shufflevector <2 x double> %broadcast.splatinsert138, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader141, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader141 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.2
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %3
  store double %24, double* %22, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv35
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block116, %.prol.loopexit
  %min.iters.check74 = icmp ult i64 %74, 2
  %n.vec77 = and i64 %74, -2
  %cmp.zero78 = icmp eq i64 %n.vec77, 0
  %cmp.n109 = icmp eq i64 %74, %n.vec77
  br label %.preheader.us15

scalar.ph73:                                      ; preds = %scalar.ph73.preheader, %scalar.ph73
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph73 ], [ %indvars.iv25.ph, %scalar.ph73.preheader ]
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv30
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %2
  %28 = load double, double* %40, align 8
  %29 = fmul double %27, %28
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv30
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %2
  %33 = load double, double* %41, align 8
  %34 = fmul double %32, %33
  %35 = fadd double %29, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv25
  %37 = load double, double* %36, align 8
  %38 = fadd double %37, %35
  store double %38, double* %36, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv35
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %scalar.ph73, !llvm.loop !5

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv30
  %39 = add nuw nsw i64 %indvars.iv30, 1
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %39
  %scevgep87 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv30
  %scevgep89 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %39
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv30
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv30
  br i1 %min.iters.check74, label %scalar.ph73.preheader, label %min.iters.checked75

scalar.ph73.preheader:                            ; preds = %middle.block72, %vector.memcheck, %min.iters.checked75, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked75 ], [ 0, %.preheader.us15 ], [ %n.vec77, %middle.block72 ]
  br label %scalar.ph73

min.iters.checked75:                              ; preds = %.preheader.us15
  br i1 %cmp.zero78, label %scalar.ph73.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked75
  %bound0 = icmp ult double* %scevgep, %41
  %bound1 = icmp ult double* %41, %scevgep81
  %found.conflict = and i1 %bound0, %bound1
  %bound092 = icmp ult double* %scevgep, %scevgep85
  %bound193 = icmp ult double* %scevgep83, %scevgep81
  %found.conflict94 = and i1 %bound092, %bound193
  %conflict.rdx = or i1 %found.conflict, %found.conflict94
  %bound095 = icmp ult double* %scevgep, %scevgep89
  %bound196 = icmp ult double* %scevgep87, %scevgep81
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx98 = or i1 %conflict.rdx, %found.conflict97
  %bound0101 = icmp ult double* %scevgep, %40
  %bound1102 = icmp ult double* %40, %scevgep81
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx104 = or i1 %conflict.rdx98, %found.conflict103
  br i1 %conflict.rdx104, label %scalar.ph73.preheader, label %vector.ph105

vector.ph105:                                     ; preds = %vector.memcheck
  %42 = load double, double* %40, align 8, !alias.scope !6
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = load double, double* %41, align 8, !alias.scope !9
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body71

vector.body71:                                    ; preds = %vector.body71, %vector.ph105
  %index106 = phi i64 [ 0, %vector.ph105 ], [ %index.next107, %vector.body71 ]
  %48 = or i64 %index106, 1
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index106, i64 %indvars.iv30
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %48, i64 %indvars.iv30
  %51 = load double, double* %49, align 8, !alias.scope !11
  %52 = load double, double* %50, align 8, !alias.scope !11
  %53 = insertelement <2 x double> undef, double %51, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %54, %broadcast.splat114
  %56 = fmul <2 x double> %55, %44
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index106, i64 %indvars.iv30
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %48, i64 %indvars.iv30
  %59 = load double, double* %57, align 8, !alias.scope !13
  %60 = load double, double* %58, align 8, !alias.scope !13
  %61 = insertelement <2 x double> undef, double %59, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  %63 = fmul <2 x double> %62, %broadcast.splat114
  %64 = fmul <2 x double> %63, %47
  %65 = fadd <2 x double> %56, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index106
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !15, !noalias !17
  %68 = fadd <2 x double> %wide.load, %65
  %69 = bitcast double* %66 to <2 x double>*
  store <2 x double> %68, <2 x double>* %69, align 8, !alias.scope !15, !noalias !17
  %index.next107 = add i64 %index106, 2
  %70 = icmp eq i64 %index.next107, %n.vec77
  br i1 %70, label %middle.block72, label %vector.body71, !llvm.loop !18

middle.block72:                                   ; preds = %vector.body71
  br i1 %cmp.n109, label %._crit_edge.us18, label %scalar.ph73.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge9.us
  %indvars.iv58 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next59, %._crit_edge9.us ]
  %indvars.iv37 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next38, %._crit_edge9.us ]
  %indvars.iv35 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next36, %._crit_edge9.us ]
  %71 = add nsw i64 %indvars.iv37, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %72 = mul i64 %indvars.iv37, 1201
  %73 = add i64 %72, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %73
  %74 = add nuw nsw i64 %indvars.iv37, 1
  %75 = zext i2 %indvars.iv58 to i64
  %76 = add nuw nsw i64 %75, 4294967295
  %77 = and i64 %76, 4294967295
  %78 = add nuw nsw i64 %77, 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %79 = trunc i64 %indvars.iv.next38 to i32
  %xtraiter = and i32 %79, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.prol
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %3
  store double %82, double* %80, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %78, %.prol.loopexit.loopexit ]
  %83 = icmp ult i64 %indvars.iv37, 3
  br i1 %83, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %84 = sub i64 %71, %indvars.iv.unr
  %85 = lshr i64 %84, 2
  %86 = add nuw nsw i64 %85, 1
  %min.iters.check118 = icmp ult i64 %86, 2
  br i1 %min.iters.check118, label %.lr.ph.us.new.preheader141, label %min.iters.checked119

.lr.ph.us.new.preheader141:                       ; preds = %middle.block116, %min.iters.checked119, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked119 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end127, %middle.block116 ]
  br label %.lr.ph.us.new

min.iters.checked119:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf120 = and i64 %86, 1
  %n.vec121 = sub nsw i64 %86, %n.mod.vf120
  %cmp.zero122 = icmp eq i64 %n.vec121, 0
  %87 = add nsw i64 %indvars.iv.unr, 4
  %88 = shl nuw i64 %85, 2
  %89 = add i64 %87, %88
  %90 = shl nuw nsw i64 %n.mod.vf120, 2
  %ind.end127 = sub i64 %89, %90
  br i1 %cmp.zero122, label %.lr.ph.us.new.preheader141, label %vector.ph123

vector.ph123:                                     ; preds = %min.iters.checked119
  br label %vector.body115

vector.body115:                                   ; preds = %vector.body115, %vector.ph123
  %index124 = phi i64 [ 0, %vector.ph123 ], [ %index.next125, %vector.body115 ]
  %91 = shl i64 %index124, 2
  %92 = add i64 %indvars.iv.unr, %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %92
  %94 = bitcast double* %93 to <8 x double>*
  %wide.vec133 = load <8 x double>, <8 x double>* %94, align 8
  %strided.vec134 = shufflevector <8 x double> %wide.vec133, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec135 = shufflevector <8 x double> %wide.vec133, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec136 = shufflevector <8 x double> %wide.vec133, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec137 = shufflevector <8 x double> %wide.vec133, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %95 = fmul <2 x double> %strided.vec134, %broadcast.splat139
  %96 = fmul <2 x double> %strided.vec135, %broadcast.splat139
  %97 = fmul <2 x double> %strided.vec136, %broadcast.splat139
  %98 = add nsw i64 %92, 3
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %98
  %100 = fmul <2 x double> %strided.vec137, %broadcast.splat139
  %101 = getelementptr double, double* %99, i64 -3
  %102 = bitcast double* %101 to <8 x double>*
  %103 = shufflevector <2 x double> %95, <2 x double> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %104 = shufflevector <2 x double> %97, <2 x double> %100, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec140 = shufflevector <4 x double> %103, <4 x double> %104, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec140, <8 x double>* %102, align 8
  %index.next125 = add i64 %index124, 2
  %105 = icmp eq i64 %index.next125, %n.vec121
  br i1 %105, label %middle.block116, label %vector.body115, !llvm.loop !21

middle.block116:                                  ; preds = %vector.body115
  %cmp.n128 = icmp eq i64 %n.mod.vf120, 0
  br i1 %cmp.n128, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader141

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph73
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block72
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next31, %11
  br i1 %exitcond60, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %indvars.iv.next59 = add i2 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next38, %12
  br i1 %exitcond61, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader3
  %indvars.iv62 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next63, %.preheader3 ]
  %indvars.iv53 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next54, %.preheader3 ]
  %indvars.iv51 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next52, %.preheader3 ]
  %106 = add nsw i64 %indvars.iv53, -3
  %107 = zext i2 %indvars.iv62 to i64
  %108 = add nuw nsw i64 %107, 4294967295
  %109 = and i64 %108, 4294967295
  %110 = add nuw nsw i64 %109, 1
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %111 = trunc i64 %indvars.iv.next54 to i32
  %xtraiter48 = and i32 %111, 3
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  br i1 %lcmp.mod49, label %.prol.loopexit47, label %.prol.preheader46.preheader

.prol.preheader46.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader46

.prol.preheader46:                                ; preds = %.prol.preheader46.preheader, %.prol.preheader46
  %indvars.iv41.prol = phi i64 [ %indvars.iv.next42.prol, %.prol.preheader46 ], [ 0, %.prol.preheader46.preheader ]
  %prol.iter50 = phi i32 [ %prol.iter50.sub, %.prol.preheader46 ], [ %xtraiter48, %.prol.preheader46.preheader ]
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41.prol
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %3
  store double %114, double* %112, align 8
  %indvars.iv.next42.prol = add nuw nsw i64 %indvars.iv41.prol, 1
  %prol.iter50.sub = add nsw i32 %prol.iter50, -1
  %prol.iter50.cmp = icmp eq i32 %prol.iter50.sub, 0
  br i1 %prol.iter50.cmp, label %.prol.loopexit47.loopexit, label %.prol.preheader46, !llvm.loop !22

.prol.loopexit47.loopexit:                        ; preds = %.prol.preheader46
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.prol.loopexit47.loopexit, %.lr.ph
  %indvars.iv41.unr = phi i64 [ 0, %.lr.ph ], [ %110, %.prol.loopexit47.loopexit ]
  %115 = icmp ult i64 %indvars.iv53, 3
  br i1 %115, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit47
  %116 = sub i64 %106, %indvars.iv41.unr
  %117 = lshr i64 %116, 2
  %118 = add nuw nsw i64 %117, 1
  %min.iters.check = icmp ult i64 %118, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader142, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %118, 1
  %n.vec = sub nsw i64 %118, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %119 = add nsw i64 %indvars.iv41.unr, 4
  %120 = shl nuw i64 %117, 2
  %121 = add i64 %119, %120
  %122 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %121, %122
  br i1 %cmp.zero, label %.lr.ph.new.preheader142, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %123 = shl i64 %index, 2
  %124 = add i64 %indvars.iv41.unr, %123
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %124
  %126 = bitcast double* %125 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %126, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec68 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %127 = fmul <2 x double> %strided.vec, %broadcast.splat70
  %128 = fmul <2 x double> %strided.vec66, %broadcast.splat70
  %129 = fmul <2 x double> %strided.vec67, %broadcast.splat70
  %130 = add nsw i64 %124, 3
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %130
  %132 = fmul <2 x double> %strided.vec68, %broadcast.splat70
  %133 = getelementptr double, double* %131, i64 -3
  %134 = bitcast double* %133 to <8 x double>*
  %135 = shufflevector <2 x double> %127, <2 x double> %128, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %136 = shufflevector <2 x double> %129, <2 x double> %132, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %135, <4 x double> %136, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %134, align 8
  %index.next = add i64 %index, 2
  %137 = icmp eq i64 %index.next, %n.vec
  br i1 %137, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader142

.lr.ph.new.preheader142:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv41.ph = phi i64 [ %indvars.iv41.unr, %min.iters.checked ], [ %indvars.iv41.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader142, %.lr.ph.new
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.3, %.lr.ph.new ], [ %indvars.iv41.ph, %.lr.ph.new.preheader142 ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %3
  store double %143, double* %141, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.1
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, %3
  store double %146, double* %144, align 8
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv41, 3
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.2
  %148 = load double, double* %147, align 8
  %149 = fmul double %148, %3
  store double %149, double* %147, align 8
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next42.3, %indvars.iv51
  br i1 %exitcond45.3, label %.preheader3.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit47
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %indvars.iv.next63 = add i2 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next54, %10
  br i1 %exitcond64, label %._crit_edge13.loopexit143, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit143:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit143, %._crit_edge13.loopexit, %7
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
  %9 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %10 = mul nsw i64 %indvars.iv5, %8
  br label %11

; <label>:11:                                     ; preds = %18, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %18 ]
  %12 = add nsw i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #4
  br label %18

; <label>:18:                                     ; preds = %16, %11
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond9, label %._crit_edge.us, label %11

._crit_edge.us:                                   ; preds = %18
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %9
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #4
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
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
