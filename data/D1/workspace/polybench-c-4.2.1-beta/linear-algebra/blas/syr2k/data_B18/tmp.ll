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
  %wide.trip.count30 = zext i32 %1 to i64
  %wide.trip.count32 = zext i32 %0 to i64
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
  %exitcond31 = icmp eq i64 %indvars.iv.next20, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge11.us, label %12

._crit_edge11.us:                                 ; preds = %12
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next24, %wide.trip.count32
  br i1 %exitcond33, label %.preheader.lr.ph.loopexit, label %.preheader4.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge11.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count28.pre-phi = phi i64 [ %.pre, %.preheader4.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count32, %.preheader.lr.ph.loopexit ]
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
  %exitcond29 = icmp eq i64 %indvars.iv.next, %wide.trip.count28.pre-phi
  br i1 %exitcond29, label %._crit_edge.us, label %26

._crit_edge.us:                                   ; preds = %26
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %wide.trip.count28.pre-phi
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %10 = zext i32 %0 to i64
  %broadcast.splatinsert65 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat66 = shufflevector <2 x double> %broadcast.splatinsert65, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %broadcast.splatinsert134 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat135 = shufflevector <2 x double> %broadcast.splatinsert134, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert109 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat110 = shufflevector <2 x double> %broadcast.splatinsert109, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader137, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader137 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %3
  store double %24, double* %22, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv36
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block112, %.prol.loopexit
  %min.iters.check70 = icmp ult i64 %73, 2
  %n.vec73 = and i64 %73, -2
  %cmp.zero74 = icmp eq i64 %n.vec73, 0
  %cmp.n105 = icmp eq i64 %73, %n.vec73
  br label %.preheader.us15

scalar.ph69:                                      ; preds = %scalar.ph69.preheader, %scalar.ph69
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph69 ], [ %indvars.iv25.ph, %scalar.ph69.preheader ]
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv31
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %2
  %28 = load double, double* %40, align 8
  %29 = fmul double %27, %28
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %2
  %33 = load double, double* %41, align 8
  %34 = fmul double %32, %33
  %35 = fadd double %29, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv25
  %37 = load double, double* %36, align 8
  %38 = fadd double %37, %35
  store double %38, double* %36, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, %indvars.iv36
  br i1 %exitcond30, label %._crit_edge.us18.loopexit, label %scalar.ph69, !llvm.loop !5

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv31 = phi i64 [ %39, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep79 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %39 = add i64 %indvars.iv31, 1
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %39
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %39
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %min.iters.check70, label %scalar.ph69.preheader, label %min.iters.checked71

scalar.ph69.preheader:                            ; preds = %middle.block68, %vector.memcheck, %min.iters.checked71, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked71 ], [ 0, %.preheader.us15 ], [ %n.vec73, %middle.block68 ]
  br label %scalar.ph69

min.iters.checked71:                              ; preds = %.preheader.us15
  br i1 %cmp.zero74, label %scalar.ph69.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked71
  %bound0 = icmp ult double* %scevgep, %41
  %bound1 = icmp ult double* %41, %scevgep77
  %found.conflict = and i1 %bound0, %bound1
  %bound088 = icmp ult double* %scevgep, %scevgep81
  %bound189 = icmp ult double* %scevgep79, %scevgep77
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx = or i1 %found.conflict, %found.conflict90
  %bound091 = icmp ult double* %scevgep, %scevgep85
  %bound192 = icmp ult double* %scevgep83, %scevgep77
  %found.conflict93 = and i1 %bound091, %bound192
  %conflict.rdx94 = or i1 %conflict.rdx, %found.conflict93
  %bound097 = icmp ult double* %scevgep, %40
  %bound198 = icmp ult double* %40, %scevgep77
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx100 = or i1 %conflict.rdx94, %found.conflict99
  br i1 %conflict.rdx100, label %scalar.ph69.preheader, label %vector.ph101

vector.ph101:                                     ; preds = %vector.memcheck
  br label %vector.body67

vector.body67:                                    ; preds = %vector.body67, %vector.ph101
  %index102 = phi i64 [ 0, %vector.ph101 ], [ %index.next103, %vector.body67 ]
  %42 = or i64 %index102, 1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index102, i64 %indvars.iv31
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %42, i64 %indvars.iv31
  %45 = load double, double* %43, align 8, !alias.scope !6
  %46 = load double, double* %44, align 8, !alias.scope !6
  %47 = insertelement <2 x double> undef, double %45, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fmul <2 x double> %48, %broadcast.splat110
  %50 = load double, double* %40, align 8, !alias.scope !9
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = fmul <2 x double> %49, %52
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index102, i64 %indvars.iv31
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %42, i64 %indvars.iv31
  %56 = load double, double* %54, align 8, !alias.scope !11
  %57 = load double, double* %55, align 8, !alias.scope !11
  %58 = insertelement <2 x double> undef, double %56, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %59, %broadcast.splat110
  %61 = load double, double* %41, align 8, !alias.scope !13
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = fmul <2 x double> %60, %63
  %65 = fadd <2 x double> %53, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index102
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !15, !noalias !17
  %68 = fadd <2 x double> %wide.load, %65
  store <2 x double> %68, <2 x double>* %67, align 8, !alias.scope !15, !noalias !17
  %index.next103 = add i64 %index102, 2
  %69 = icmp eq i64 %index.next103, %n.vec73
  br i1 %69, label %middle.block68, label %vector.body67, !llvm.loop !18

middle.block68:                                   ; preds = %vector.body67
  br i1 %cmp.n105, label %._crit_edge.us18, label %scalar.ph69.preheader

.lr.ph.us:                                        ; preds = %.preheader4.us.preheader, %._crit_edge9.us
  %indvars.iv38 = phi i64 [ 0, %.preheader4.us.preheader ], [ %73, %._crit_edge9.us ]
  %indvars.iv36 = phi i64 [ 1, %.preheader4.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us ]
  %70 = add i64 %indvars.iv38, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %71 = mul i64 %indvars.iv38, 1201
  %72 = add i64 %71, 1
  %scevgep77 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %72
  %73 = add i64 %indvars.iv38, 1
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
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %77 = icmp ult i64 %indvars.iv38, 3
  br i1 %77, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %78 = sub i64 %70, %indvars.iv.unr
  %79 = lshr i64 %78, 2
  %80 = add nuw nsw i64 %79, 1
  %min.iters.check114 = icmp ult i64 %80, 2
  br i1 %min.iters.check114, label %.lr.ph.us.new.preheader137, label %min.iters.checked115

.lr.ph.us.new.preheader137:                       ; preds = %middle.block112, %min.iters.checked115, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked115 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end123, %middle.block112 ]
  br label %.lr.ph.us.new

min.iters.checked115:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf116 = and i64 %80, 1
  %n.vec117 = sub nsw i64 %80, %n.mod.vf116
  %cmp.zero118 = icmp eq i64 %n.vec117, 0
  %81 = add i64 %indvars.iv.unr, 4
  %82 = shl nuw i64 %79, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf116, 2
  %ind.end123 = sub i64 %83, %84
  br i1 %cmp.zero118, label %.lr.ph.us.new.preheader137, label %vector.ph119

vector.ph119:                                     ; preds = %min.iters.checked115
  br label %vector.body111

vector.body111:                                   ; preds = %vector.body111, %vector.ph119
  %index120 = phi i64 [ 0, %vector.ph119 ], [ %index.next121, %vector.body111 ]
  %85 = shl i64 %index120, 2
  %86 = add i64 %indvars.iv.unr, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec129 = load <8 x double>, <8 x double>* %88, align 8
  %strided.vec130 = shufflevector <8 x double> %wide.vec129, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec131 = shufflevector <8 x double> %wide.vec129, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec132 = shufflevector <8 x double> %wide.vec129, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec133 = shufflevector <8 x double> %wide.vec129, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %89 = fmul <2 x double> %strided.vec130, %broadcast.splat135
  %90 = fmul <2 x double> %strided.vec131, %broadcast.splat135
  %91 = fmul <2 x double> %strided.vec132, %broadcast.splat135
  %92 = add nsw i64 %86, 3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %92
  %94 = fmul <2 x double> %strided.vec133, %broadcast.splat135
  %95 = getelementptr double, double* %93, i64 -3
  %96 = bitcast double* %95 to <8 x double>*
  %97 = shufflevector <2 x double> %89, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %98 = shufflevector <2 x double> %91, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec136 = shufflevector <4 x double> %97, <4 x double> %98, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec136, <8 x double>* %96, align 8
  %index.next121 = add i64 %index120, 2
  %99 = icmp eq i64 %index.next121, %n.vec117
  br i1 %99, label %middle.block112, label %vector.body111, !llvm.loop !21

middle.block112:                                  ; preds = %vector.body111
  %cmp.n124 = icmp eq i64 %n.mod.vf116, 0
  br i1 %cmp.n124, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader137

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph69
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block68
  %exitcond = icmp eq i64 %39, %11
  br i1 %exitcond, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond53 = icmp eq i64 %73, %12
  br i1 %exitcond53, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader4.preheader, %.preheader3
  %indvars.iv49 = phi i64 [ 0, %.preheader4.preheader ], [ %101, %.preheader3 ]
  %indvars.iv47 = phi i64 [ 1, %.preheader4.preheader ], [ %indvars.iv.next48, %.preheader3 ]
  %100 = add i64 %indvars.iv49, -3
  %101 = add nuw nsw i64 %indvars.iv49, 1
  %xtraiter56 = and i64 %101, 3
  %lcmp.mod57 = icmp eq i64 %xtraiter56, 0
  br i1 %lcmp.mod57, label %.prol.loopexit55, label %.prol.preheader54.preheader

.prol.preheader54.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader54

.prol.preheader54:                                ; preds = %.prol.preheader54.preheader, %.prol.preheader54
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader54 ], [ 0, %.prol.preheader54.preheader ]
  %prol.iter58 = phi i64 [ %prol.iter58.sub, %.prol.preheader54 ], [ %xtraiter56, %.prol.preheader54.preheader ]
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42.prol
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, %3
  store double %104, double* %102, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter58.sub = add i64 %prol.iter58, -1
  %prol.iter58.cmp = icmp eq i64 %prol.iter58.sub, 0
  br i1 %prol.iter58.cmp, label %.prol.loopexit55.loopexit, label %.prol.preheader54, !llvm.loop !22

.prol.loopexit55.loopexit:                        ; preds = %.prol.preheader54
  br label %.prol.loopexit55

.prol.loopexit55:                                 ; preds = %.prol.loopexit55.loopexit, %.lr.ph
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next43.prol, %.prol.loopexit55.loopexit ]
  %105 = icmp ult i64 %indvars.iv49, 3
  br i1 %105, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit55
  %106 = sub i64 %100, %indvars.iv42.unr
  %107 = lshr i64 %106, 2
  %108 = add nuw nsw i64 %107, 1
  %min.iters.check = icmp ult i64 %108, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader138, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %108, 1
  %n.vec = sub nsw i64 %108, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %109 = add i64 %indvars.iv42.unr, 4
  %110 = shl nuw i64 %107, 2
  %111 = add i64 %109, %110
  %112 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %111, %112
  br i1 %cmp.zero, label %.lr.ph.new.preheader138, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %113 = shl i64 %index, 2
  %114 = add i64 %indvars.iv42.unr, %113
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %114
  %116 = bitcast double* %115 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %116, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %117 = fmul <2 x double> %strided.vec, %broadcast.splat66
  %118 = fmul <2 x double> %strided.vec62, %broadcast.splat66
  %119 = fmul <2 x double> %strided.vec63, %broadcast.splat66
  %120 = add nsw i64 %114, 3
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %120
  %122 = fmul <2 x double> %strided.vec64, %broadcast.splat66
  %123 = getelementptr double, double* %121, i64 -3
  %124 = bitcast double* %123 to <8 x double>*
  %125 = shufflevector <2 x double> %117, <2 x double> %118, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %126 = shufflevector <2 x double> %119, <2 x double> %122, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %125, <4 x double> %126, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %124, align 8
  %index.next = add i64 %index, 2
  %127 = icmp eq i64 %index.next, %n.vec
  br i1 %127, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader138

.lr.ph.new.preheader138:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv42.ph = phi i64 [ %indvars.iv42.unr, %min.iters.checked ], [ %indvars.iv42.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader138, %.lr.ph.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.3, %.lr.ph.new ], [ %indvars.iv42.ph, %.lr.ph.new.preheader138 ]
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv42
  %129 = load double, double* %128, align 8
  %130 = fmul double %129, %3
  store double %130, double* %128, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, %3
  store double %133, double* %131, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.1
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, %3
  store double %136, double* %134, align 8
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv42, 3
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next43.2
  %138 = load double, double* %137, align 8
  %139 = fmul double %138, %3
  store double %139, double* %137, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next43.3, %indvars.iv47
  br i1 %exitcond46.3, label %.preheader3.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit55
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond59 = icmp eq i64 %101, %10
  br i1 %exitcond59, label %._crit_edge13.loopexit139, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit139:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit139, %._crit_edge13.loopexit, %7
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
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count9 = zext i32 %0 to i64
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
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %wide.trip.count9
  br i1 %exitcond10, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count9
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
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
