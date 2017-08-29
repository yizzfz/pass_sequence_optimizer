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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  %12 = insertelement <2 x double> undef, double %10, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
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
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  %21 = add nuw nsw i64 %15, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, %13
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  store double %28, double* %20, align 8
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %29, double* %30, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge11.us, label %14

._crit_edge11.us:                                 ; preds = %14
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
  br label %31

; <label>:31:                                     ; preds = %31, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %31 ]
  %32 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %33 = add nuw nsw i64 %32, 3
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %11
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge.us, label %31

._crit_edge.us:                                   ; preds = %31
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count.pre-phi
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count51 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %3, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = insertelement <2 x double> undef, double %3, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x double> undef, double %3, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count33 = zext i32 %1 to i64
  %wide.trip.count40 = zext i32 %0 to i64
  %broadcast.splatinsert85 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat86 = shufflevector <2 x double> %broadcast.splatinsert85, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %3, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %3, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x double> undef, double %3, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr92.ph, %.lr.ph.us.new.preheader.new ], [ %indvars.iv.next.3.1, %.lr.ph.us.new ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, %19
  store <2 x double> %25, <2 x double>* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %27 = bitcast double* %26 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, %19
  store <2 x double> %29, <2 x double>* %27, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.3
  %31 = bitcast double* %30 to <2 x double>*
  %32 = load <2 x double>, <2 x double>* %31, align 8
  %33 = fmul <2 x double> %32, %21
  store <2 x double> %33, <2 x double>* %31, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1.1
  %35 = bitcast double* %34 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %35, align 8
  %37 = fmul <2 x double> %36, %21
  store <2 x double> %37, <2 x double>* %35, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv36
  br i1 %exitcond.3.1, label %.preheader.us15.preheader.loopexit.unr-lcssa, label %.lr.ph.us.new

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph ], [ %indvars.iv25.ph, %scalar.ph.preheader ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv31
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %2
  %41 = load double, double* %53, align 8
  %42 = fmul double %40, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %2
  %46 = load double, double* %54, align 8
  %47 = fmul double %45, %46
  %48 = fadd double %42, %47
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv25
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, %indvars.iv36
  br i1 %exitcond30, label %._crit_edge.us18.loopexit, label %scalar.ph, !llvm.loop !1

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %52 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %52
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %52
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us15 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader.us15
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %54
  %bound1 = icmp ult double* %54, %scevgep61
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep, %scevgep65
  %bound173 = icmp ult double* %scevgep63, %scevgep61
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  %bound075 = icmp ult double* %scevgep, %scevgep69
  %bound176 = icmp ult double* %scevgep67, %scevgep61
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx78 = or i1 %conflict.rdx, %found.conflict77
  %bound081 = icmp ult double* %scevgep, %53
  %bound182 = icmp ult double* %53, %scevgep61
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx84 = or i1 %conflict.rdx78, %found.conflict83
  br i1 %conflict.rdx84, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %55 = load double, double* %53, align 8, !alias.scope !4
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = load double, double* %54, align 8, !alias.scope !7
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %61 = or i64 %index, 1
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv31
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %61, i64 %indvars.iv31
  %64 = load double, double* %62, align 8, !alias.scope !9
  %65 = load double, double* %63, align 8, !alias.scope !9
  %66 = insertelement <2 x double> undef, double %64, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = fmul <2 x double> %67, %broadcast.splat86
  %69 = fmul <2 x double> %68, %57
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv31
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %61, i64 %indvars.iv31
  %72 = load double, double* %70, align 8, !alias.scope !11
  %73 = load double, double* %71, align 8, !alias.scope !11
  %74 = insertelement <2 x double> undef, double %72, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fmul <2 x double> %75, %broadcast.splat86
  %77 = fmul <2 x double> %76, %60
  %78 = fadd <2 x double> %69, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !13, !noalias !15
  %81 = fadd <2 x double> %wide.load, %78
  %82 = bitcast double* %79 to <2 x double>*
  store <2 x double> %81, <2 x double>* %82, align 8, !alias.scope !13, !noalias !15
  %index.next = add i64 %index, 2
  %83 = icmp eq i64 %index.next, %n.vec
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us18, label %scalar.ph.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge9.us
  %indvars.iv88 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next, %._crit_edge9.us ]
  %indvars.iv38 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %89, %._crit_edge9.us ]
  %indvars.iv36 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us ]
  %84 = add nsw i64 %indvars.iv38, -3
  %85 = zext i2 %indvars.iv88 to i64
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %86 = mul i64 %indvars.iv38, 1201
  %87 = add i64 %86, 1
  %scevgep61 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %87
  %88 = add nuw nsw i64 %indvars.iv38, 1
  %89 = add nuw nsw i64 %indvars.iv38, 1
  %xtraiter = and i64 %89, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.prol
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, %3
  store double %92, double* %90, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !17

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %85, %.prol.loopexit.loopexit ]
  %93 = icmp ult i64 %indvars.iv38, 3
  br i1 %93, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %94 = sub i64 %84, %indvars.iv.unr
  %95 = lshr i64 %94, 2
  %96 = and i64 %95, 1
  %lcmp.mod90 = icmp eq i64 %96, 0
  br i1 %lcmp.mod90, label %.lr.ph.us.new.prol.preheader, label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.preheader:                     ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.prol

.lr.ph.us.new.prol:                               ; preds = %.lr.ph.us.new.prol.preheader
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.unr
  %98 = bitcast double* %97 to <2 x double>*
  %99 = load <2 x double>, <2 x double>* %98, align 8
  %100 = fmul <2 x double> %99, %17
  store <2 x double> %100, <2 x double>* %98, align 8
  %indvars.iv.next.1.prol = add nuw nsw i64 %indvars.iv.unr, 2
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1.prol
  %102 = bitcast double* %101 to <2 x double>*
  %103 = load <2 x double>, <2 x double>* %102, align 8
  %104 = fmul <2 x double> %103, %17
  store <2 x double> %104, <2 x double>* %102, align 8
  %indvars.iv.next.3.prol = or i64 %indvars.iv.unr, 4
  br label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new.prol
  %indvars.iv.unr92.ph = phi i64 [ %indvars.iv.next.3.prol, %.lr.ph.us.new.prol ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ]
  br label %.lr.ph.us.new.prol.loopexit

.lr.ph.us.new.prol.loopexit:                      ; preds = %.lr.ph.us.new.prol.loopexit.unr-lcssa
  %105 = icmp eq i64 %95, 0
  br i1 %105, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new.preheader.new

.lr.ph.us.new.preheader.new:                      ; preds = %.lr.ph.us.new.prol.loopexit
  br label %.lr.ph.us.new

.preheader.us15.preheader.loopexit.unr-lcssa:     ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader.loopexit

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new.prol.loopexit, %.preheader.us15.preheader.loopexit.unr-lcssa
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %.prol.loopexit
  %min.iters.check = icmp ult i64 %88, 2
  %n.vec = and i64 %88, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %88, %n.vec
  br label %.preheader.us15

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %89, %wide.trip.count40
  %indvars.iv.next = add i2 %indvars.iv88, 1
  br i1 %exitcond41, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader3
  %indvars.iv93 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next94, %.preheader3 ]
  %indvars.iv49 = phi i64 [ 0, %.lr.ph.preheader ], [ %108, %.preheader3 ]
  %indvars.iv47 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next48, %.preheader3 ]
  %106 = add nsw i64 %indvars.iv49, -3
  %107 = zext i2 %indvars.iv93 to i64
  %108 = add nuw nsw i64 %indvars.iv49, 1
  %xtraiter55 = and i64 %108, 3
  %lcmp.mod56 = icmp eq i64 %xtraiter55, 0
  br i1 %lcmp.mod56, label %.prol.loopexit54, label %.prol.preheader53.preheader

.prol.preheader53.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader53

.prol.preheader53:                                ; preds = %.prol.preheader53.preheader, %.prol.preheader53
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader53 ], [ 0, %.prol.preheader53.preheader ]
  %prol.iter57 = phi i64 [ %prol.iter57.sub, %.prol.preheader53 ], [ %xtraiter55, %.prol.preheader53.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter57.sub = add nsw i64 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i64 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %.prol.loopexit54.loopexit, label %.prol.preheader53, !llvm.loop !19

.prol.loopexit54.loopexit:                        ; preds = %.prol.preheader53
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.prol.loopexit54.loopexit, %.lr.ph
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph ], [ %107, %.prol.loopexit54.loopexit ]
  %112 = icmp ult i64 %indvars.iv49, 3
  br i1 %112, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit54
  %113 = sub i64 %106, %indvars.iv42.unr
  %114 = lshr i64 %113, 2
  %115 = and i64 %114, 1
  %lcmp.mod96 = icmp eq i64 %115, 0
  br i1 %lcmp.mod96, label %.lr.ph.new.prol.preheader, label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.preheader:                        ; preds = %.lr.ph.new.preheader
  br label %.lr.ph.new.prol

.lr.ph.new.prol:                                  ; preds = %.lr.ph.new.prol.preheader
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42.unr
  %117 = bitcast double* %116 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %117, align 8
  %119 = fmul <2 x double> %118, %11
  store <2 x double> %119, <2 x double>* %117, align 8
  %indvars.iv.next43.1.prol = add nuw nsw i64 %indvars.iv42.unr, 2
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.1.prol
  %121 = bitcast double* %120 to <2 x double>*
  %122 = load <2 x double>, <2 x double>* %121, align 8
  %123 = fmul <2 x double> %122, %11
  store <2 x double> %123, <2 x double>* %121, align 8
  %indvars.iv.next43.3.prol = or i64 %indvars.iv42.unr, 4
  br label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph.new.preheader, %.lr.ph.new.prol
  %indvars.iv42.unr98.ph = phi i64 [ %indvars.iv.next43.3.prol, %.lr.ph.new.prol ], [ %indvars.iv42.unr, %.lr.ph.new.preheader ]
  br label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol.loopexit:                         ; preds = %.lr.ph.new.prol.loopexit.unr-lcssa
  %124 = icmp eq i64 %114, 0
  br i1 %124, label %.preheader3.loopexit, label %.lr.ph.new.preheader.new

.lr.ph.new.preheader.new:                         ; preds = %.lr.ph.new.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr98.ph, %.lr.ph.new.preheader.new ], [ %indvars.iv.next43.3.1, %.lr.ph.new ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %126, align 8
  %128 = fmul <2 x double> %127, %13
  store <2 x double> %128, <2 x double>* %126, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.1
  %130 = bitcast double* %129 to <2 x double>*
  %131 = load <2 x double>, <2 x double>* %130, align 8
  %132 = fmul <2 x double> %131, %13
  store <2 x double> %132, <2 x double>* %130, align 8
  %indvars.iv.next43.3 = add nuw nsw i64 %indvars.iv42, 4
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.3
  %134 = bitcast double* %133 to <2 x double>*
  %135 = load <2 x double>, <2 x double>* %134, align 8
  %136 = fmul <2 x double> %135, %15
  store <2 x double> %136, <2 x double>* %134, align 8
  %indvars.iv.next43.1.1 = add nsw i64 %indvars.iv42, 6
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.1.1
  %138 = bitcast double* %137 to <2 x double>*
  %139 = load <2 x double>, <2 x double>* %138, align 8
  %140 = fmul <2 x double> %139, %15
  store <2 x double> %140, <2 x double>* %138, align 8
  %indvars.iv.next43.3.1 = add nsw i64 %indvars.iv42, 8
  %exitcond46.3.1 = icmp eq i64 %indvars.iv.next43.3.1, %indvars.iv47
  br i1 %exitcond46.3.1, label %.preheader3.loopexit.unr-lcssa, label %.lr.ph.new

.preheader3.loopexit.unr-lcssa:                   ; preds = %.lr.ph.new
  br label %.preheader3.loopexit

.preheader3.loopexit:                             ; preds = %.lr.ph.new.prol.loopexit, %.preheader3.loopexit.unr-lcssa
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.prol.loopexit54
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %108, %wide.trip.count51
  %indvars.iv.next94 = add i2 %indvars.iv93, 1
  br i1 %exitcond52, label %._crit_edge13.loopexit87, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit87:                         ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit87, %._crit_edge13.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
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
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
