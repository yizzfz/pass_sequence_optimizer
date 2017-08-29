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
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br i1 true, label %.preheader4.lr.ph, label %.._crit_edge8_crit_edge

.._crit_edge8_crit_edge:                          ; preds = %7
  br label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %7
  br i1 true, label %.preheader4.lr.ph..preheader4.us_crit_edge, label %.preheader4.lr.ph..preheader.lr.ph_crit_edge

.preheader4.lr.ph..preheader.lr.ph_crit_edge:     ; preds = %.preheader4.lr.ph
  br label %.preheader.lr.ph

.preheader4.lr.ph..preheader4.us_crit_edge:       ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.lr.ph..preheader4.us_crit_edge
  %indvars.iv23 = phi i64 [ 0, %.preheader4.lr.ph..preheader4.us_crit_edge ], [ %indvars.iv.next24, %._crit_edge11.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %8, 2
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %19, double* %20, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge11.us, label %._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond26, label %.preheader.lr.ph.loopexit, label %.preheader4.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge11.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge.us ]
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge29 ]
  %21 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %22 = add nuw nsw i64 %21, 3
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1200
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %26, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge29

._crit_edge.us:                                   ; preds = %._crit_edge29
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader4.lr.ph, label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %7
  br label %._crit_edge11

.preheader4.lr.ph:                                ; preds = %7
  br i1 true, label %.preheader4.lr.ph..lr.ph.us_crit_edge, label %.preheader4.lr.ph..lr.ph_crit_edge

.preheader4.lr.ph..lr.ph_crit_edge:               ; preds = %.preheader4.lr.ph
  br i1 undef, label %.prol.loopexit45, label %.prol.preheader44.preheader

.preheader4.lr.ph..lr.ph.us_crit_edge:            ; preds = %.preheader4.lr.ph
  %broadcast.splatinsert103 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat104 = shufflevector <2 x double> %broadcast.splatinsert103, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert128 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat129 = shufflevector <2 x double> %broadcast.splatinsert128, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader131, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader131 ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %3
  store double %10, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.next
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %3
  store double %13, double* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.next.1
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %3
  store double %16, double* %14, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.next.2
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  store double %19, double* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %.preheader.us13.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us13.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us13.preheader

.preheader.us13.preheader:                        ; preds = %.preheader.us13.preheader.loopexit, %middle.block106, %.prol.loopexit
  %min.iters.check64 = icmp ult i64 %70, 2
  %n.vec67 = and i64 %70, -2
  %cmp.zero68 = icmp eq i64 %n.vec67, 0
  %cmp.n99 = icmp eq i64 %70, %n.vec67
  br label %.preheader.us13

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge ], [ %indvars.iv23.ph, %._crit_edge.preheader ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv28
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %2
  %23 = load double, double* %35, align 8
  %24 = fmul double %22, %23
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv28
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %2
  %28 = load double, double* %36, align 8
  %29 = fmul double %27, %28
  %30 = fadd double %24, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv23
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, %indvars.iv33
  br i1 %exitcond, label %._crit_edge.us16.loopexit, label %._crit_edge, !llvm.loop !5

.preheader.us13:                                  ; preds = %.preheader.us13.preheader, %._crit_edge.us16
  %indvars.iv28 = phi i64 [ %34, %._crit_edge.us16 ], [ 0, %.preheader.us13.preheader ]
  %scevgep73 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv28
  %34 = add nuw nsw i64 %indvars.iv28, 1
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %34
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv28
  %scevgep79 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv35, i64 %34
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv28
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv28
  br i1 %min.iters.check64, label %._crit_edge.preheader, label %min.iters.checked65

._crit_edge.preheader:                            ; preds = %middle.block62, %vector.memcheck, %min.iters.checked65, %.preheader.us13
  %indvars.iv23.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked65 ], [ 0, %.preheader.us13 ], [ %n.vec67, %middle.block62 ]
  br label %._crit_edge

min.iters.checked65:                              ; preds = %.preheader.us13
  br i1 %cmp.zero68, label %._crit_edge.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked65
  %bound0 = icmp ult double* %scevgep, %36
  %bound1 = icmp ult double* %36, %scevgep71
  %found.conflict = and i1 %bound0, %bound1
  %bound082 = icmp ult double* %scevgep, %scevgep75
  %bound183 = icmp ult double* %scevgep73, %scevgep71
  %found.conflict84 = and i1 %bound082, %bound183
  %conflict.rdx = or i1 %found.conflict, %found.conflict84
  %bound085 = icmp ult double* %scevgep, %scevgep79
  %bound186 = icmp ult double* %scevgep77, %scevgep71
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx88 = or i1 %conflict.rdx, %found.conflict87
  %bound091 = icmp ult double* %scevgep, %35
  %bound192 = icmp ult double* %35, %scevgep71
  %found.conflict93 = and i1 %bound091, %bound192
  %conflict.rdx94 = or i1 %conflict.rdx88, %found.conflict93
  br i1 %conflict.rdx94, label %._crit_edge.preheader, label %vector.ph95

vector.ph95:                                      ; preds = %vector.memcheck
  %.pre = load double, double* %35, align 8, !alias.scope !6
  %.pre136 = load double, double* %36, align 8, !alias.scope !9
  %37 = insertelement <2 x double> undef, double %.pre, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = insertelement <2 x double> undef, double %.pre136, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body61

vector.body61:                                    ; preds = %vector.body61, %vector.ph95
  %index96 = phi i64 [ 0, %vector.ph95 ], [ %index.next97, %vector.body61 ]
  %41 = or i64 %index96, 1
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index96, i64 %indvars.iv28
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %41, i64 %indvars.iv28
  %44 = load double, double* %42, align 8, !alias.scope !11
  %45 = load double, double* %43, align 8, !alias.scope !11
  %46 = insertelement <2 x double> undef, double %44, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  %48 = fmul <2 x double> %47, %broadcast.splat104
  %49 = fmul <2 x double> %48, %38
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index96, i64 %indvars.iv28
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %41, i64 %indvars.iv28
  %52 = load double, double* %50, align 8, !alias.scope !13
  %53 = load double, double* %51, align 8, !alias.scope !13
  %54 = insertelement <2 x double> undef, double %52, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fmul <2 x double> %55, %broadcast.splat104
  %57 = fmul <2 x double> %56, %40
  %58 = fadd <2 x double> %49, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %index96
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !15, !noalias !17
  %61 = fadd <2 x double> %wide.load, %58
  store <2 x double> %61, <2 x double>* %60, align 8, !alias.scope !15, !noalias !17
  %index.next97 = add i64 %index96, 2
  %62 = icmp eq i64 %index.next97, %n.vec67
  br i1 %62, label %middle.block62, label %vector.body61, !llvm.loop !18

middle.block62:                                   ; preds = %vector.body61
  br i1 %cmp.n99, label %._crit_edge.us16, label %._crit_edge.preheader

.lr.ph.us:                                        ; preds = %._crit_edge9.us, %.preheader4.lr.ph..lr.ph.us_crit_edge
  %indvars.iv134 = phi i2 [ %indvars.iv.next135, %._crit_edge9.us ], [ 1, %.preheader4.lr.ph..lr.ph.us_crit_edge ]
  %indvars.iv35 = phi i64 [ %70, %._crit_edge9.us ], [ 0, %.preheader4.lr.ph..lr.ph.us_crit_edge ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge9.us ], [ 1, %.preheader4.lr.ph..lr.ph.us_crit_edge ]
  %63 = zext i2 %indvars.iv134 to i64
  %64 = add nuw nsw i64 %63, 4294967295
  %65 = and i64 %64, 4294967295
  %66 = add nuw nsw i64 %65, 1
  %67 = add nsw i64 %indvars.iv35, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 0
  %68 = mul nuw nsw i64 %indvars.iv35, 1201
  %69 = add nuw nsw i64 %68, 1
  %scevgep71 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %69
  %70 = add nuw nsw i64 %indvars.iv35, 1
  %71 = trunc i64 %70 to i32
  %xtraiter = and i32 %71, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.prol
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %3
  store double %74, double* %72, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %66, %.prol.loopexit.loopexit ]
  %75 = icmp ult i64 %indvars.iv35, 3
  br i1 %75, label %.preheader.us13.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %76 = sub i64 %67, %indvars.iv.unr
  %77 = lshr i64 %76, 2
  %78 = add nuw nsw i64 %77, 1
  %min.iters.check108 = icmp ult i64 %78, 2
  br i1 %min.iters.check108, label %.lr.ph.us.new.preheader131, label %min.iters.checked109

.lr.ph.us.new.preheader131:                       ; preds = %middle.block106, %min.iters.checked109, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked109 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end117, %middle.block106 ]
  br label %.lr.ph.us.new

min.iters.checked109:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf110 = and i64 %78, 1
  %n.vec111 = sub nsw i64 %78, %n.mod.vf110
  %cmp.zero112 = icmp eq i64 %n.vec111, 0
  %79 = add nsw i64 %indvars.iv.unr, 4
  %80 = shl nuw i64 %77, 2
  %81 = add i64 %79, %80
  %82 = shl nuw nsw i64 %n.mod.vf110, 2
  %ind.end117 = sub i64 %81, %82
  br i1 %cmp.zero112, label %.lr.ph.us.new.preheader131, label %vector.ph113

vector.ph113:                                     ; preds = %min.iters.checked109
  br label %vector.body105

vector.body105:                                   ; preds = %vector.body105, %vector.ph113
  %index114 = phi i64 [ 0, %vector.ph113 ], [ %index.next115, %vector.body105 ]
  %83 = shl i64 %index114, 2
  %84 = add i64 %indvars.iv.unr, %83
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %84
  %86 = bitcast double* %85 to <8 x double>*
  %wide.vec123 = load <8 x double>, <8 x double>* %86, align 8
  %strided.vec124 = shufflevector <8 x double> %wide.vec123, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec125 = shufflevector <8 x double> %wide.vec123, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec126 = shufflevector <8 x double> %wide.vec123, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec127 = shufflevector <8 x double> %wide.vec123, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %87 = fmul <2 x double> %strided.vec124, %broadcast.splat129
  %88 = fmul <2 x double> %strided.vec125, %broadcast.splat129
  %89 = fmul <2 x double> %strided.vec126, %broadcast.splat129
  %90 = add nsw i64 %84, 3
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %90
  %92 = fmul <2 x double> %strided.vec127, %broadcast.splat129
  %93 = getelementptr double, double* %91, i64 -3
  %94 = bitcast double* %93 to <8 x double>*
  %95 = shufflevector <2 x double> %87, <2 x double> %88, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %96 = shufflevector <2 x double> %89, <2 x double> %92, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec130 = shufflevector <4 x double> %95, <4 x double> %96, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec130, <8 x double>* %94, align 8
  %index.next115 = add i64 %index114, 2
  %97 = icmp eq i64 %index.next115, %n.vec111
  br i1 %97, label %middle.block106, label %vector.body105, !llvm.loop !21

middle.block106:                                  ; preds = %vector.body105
  %cmp.n118 = icmp eq i64 %n.mod.vf110, 0
  br i1 %cmp.n118, label %.preheader.us13.preheader, label %.lr.ph.us.new.preheader131

._crit_edge.us16.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge.us16

._crit_edge.us16:                                 ; preds = %._crit_edge.us16.loopexit, %middle.block62
  %exitcond31 = icmp eq i64 %34, 1000
  br i1 %exitcond31, label %._crit_edge9.us, label %.preheader.us13

._crit_edge9.us:                                  ; preds = %._crit_edge.us16
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %70, 1200
  %indvars.iv.next135 = add i2 %indvars.iv134, 1
  br i1 %exitcond38, label %._crit_edge11.loopexit, label %.lr.ph.us

.prol.preheader44.preheader:                      ; preds = %.preheader4.lr.ph..lr.ph_crit_edge
  br label %.prol.preheader44

.prol.preheader44:                                ; preds = %.prol.preheader44.preheader, %.prol.preheader44
  br i1 true, label %.prol.loopexit45.loopexit, label %.prol.preheader44, !llvm.loop !22

.prol.loopexit45.loopexit:                        ; preds = %.prol.preheader44
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.prol.loopexit45.loopexit, %.preheader4.lr.ph..lr.ph_crit_edge
  br i1 undef, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit45
  br i1 undef, label %.lr.ph.new.preheader132, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  br i1 undef, label %.lr.ph.new.preheader132, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 undef, label %.preheader3, label %.lr.ph.new.preheader132

.lr.ph.new.preheader132:                          ; preds = %vector.ph, %min.iters.checked, %.lr.ph.new.preheader
  br label %.preheader3

.preheader3:                                      ; preds = %.lr.ph.new.preheader132, %vector.ph, %.prol.loopexit45
  br label %._crit_edge11

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %.preheader3, %._crit_edge11.loopexit
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
  br i1 true, label %.preheader.us.preheader, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
