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
.preheader4.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.lr.ph, %._crit_edge11.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %.preheader4.lr.ph ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  %14 = add nuw nsw i64 %8, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %12, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  %20 = fdiv <2 x double> %19, <double 1.200000e+03, double 1.000000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %22, double* %23, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge11.us, label %7

._crit_edge11.us:                                 ; preds = %7
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond26, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %24 ]
  %25 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %24
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.lr.ph:
  %broadcast.splatinsert135 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat136 = shufflevector <2 x double> %broadcast.splatinsert135, <2 x double> undef, <2 x i32> zeroinitializer
  %7 = insertelement <2 x double> undef, double %3, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %9 = insertelement <2 x double> undef, double %3, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat111 = shufflevector <2 x double> %broadcast.splatinsert110, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader138, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader138 ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  %12 = bitcast double* %11 to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %14 = fmul <2 x double> %13, %8
  %15 = bitcast double* %11 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %17 = bitcast double* %16 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %19 = fmul <2 x double> %18, %10
  %20 = bitcast double* %16 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv35
  br i1 %exitcond.3, label %.preheader.us14.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us14.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us14.preheader

.preheader.us14.preheader:                        ; preds = %.preheader.us14.preheader.loopexit, %middle.block113, %.prol.loopexit
  %min.iters.check71 = icmp ult i64 %70, 2
  %n.vec74 = and i64 %70, -2
  %cmp.zero75 = icmp eq i64 %n.vec74, 0
  %cmp.n106 = icmp eq i64 %70, %n.vec74
  br label %.preheader.us14

.preheader.us14:                                  ; preds = %.preheader.us14.preheader, %._crit_edge.us18
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us18 ], [ 0, %.preheader.us14.preheader ]
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv30
  %21 = add i64 %indvars.iv30, 1
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %21
  %scevgep84 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv30
  %scevgep86 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %21
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv30
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv30
  br i1 %min.iters.check71, label %scalar.ph70.preheader, label %min.iters.checked72

min.iters.checked72:                              ; preds = %.preheader.us14
  br i1 %cmp.zero75, label %scalar.ph70.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked72
  %bound0 = icmp ult double* %scevgep, %23
  %bound1 = icmp ult double* %23, %scevgep78
  %found.conflict = and i1 %bound0, %bound1
  %bound089 = icmp ult double* %scevgep, %scevgep82
  %bound190 = icmp ult double* %scevgep80, %scevgep78
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx = or i1 %found.conflict, %found.conflict91
  %bound092 = icmp ult double* %scevgep, %scevgep86
  %bound193 = icmp ult double* %scevgep84, %scevgep78
  %found.conflict94 = and i1 %bound092, %bound193
  %conflict.rdx95 = or i1 %conflict.rdx, %found.conflict94
  %bound098 = icmp ult double* %scevgep, %22
  %bound199 = icmp ult double* %22, %scevgep78
  %found.conflict100 = and i1 %bound098, %bound199
  %conflict.rdx101 = or i1 %conflict.rdx95, %found.conflict100
  br i1 %conflict.rdx101, label %scalar.ph70.preheader, label %vector.ph102

vector.ph102:                                     ; preds = %vector.memcheck
  %24 = load double, double* %22, align 8, !alias.scope !5
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = load double, double* %23, align 8, !alias.scope !8
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body68

vector.body68:                                    ; preds = %vector.body68, %vector.ph102
  %index103 = phi i64 [ 0, %vector.ph102 ], [ %index.next104, %vector.body68 ]
  %30 = or i64 %index103, 1
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index103, i64 %indvars.iv30
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %30, i64 %indvars.iv30
  %33 = load double, double* %31, align 8, !alias.scope !10
  %34 = load double, double* %32, align 8, !alias.scope !10
  %35 = insertelement <2 x double> undef, double %33, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fmul <2 x double> %36, %broadcast.splat111
  %38 = fmul <2 x double> %37, %26
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index103, i64 %indvars.iv30
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %30, i64 %indvars.iv30
  %41 = load double, double* %39, align 8, !alias.scope !12
  %42 = load double, double* %40, align 8, !alias.scope !12
  %43 = insertelement <2 x double> undef, double %41, i32 0
  %44 = insertelement <2 x double> %43, double %42, i32 1
  %45 = fmul <2 x double> %44, %broadcast.splat111
  %46 = fmul <2 x double> %45, %29
  %47 = fadd <2 x double> %38, %46
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index103
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !14, !noalias !16
  %50 = fadd <2 x double> %wide.load, %47
  %51 = bitcast double* %48 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8, !alias.scope !14, !noalias !16
  %index.next104 = add i64 %index103, 2
  %52 = icmp eq i64 %index.next104, %n.vec74
  br i1 %52, label %middle.block69, label %vector.body68, !llvm.loop !17

middle.block69:                                   ; preds = %vector.body68
  br i1 %cmp.n106, label %._crit_edge.us18, label %scalar.ph70.preheader

scalar.ph70.preheader:                            ; preds = %middle.block69, %vector.memcheck, %min.iters.checked72, %.preheader.us14
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked72 ], [ 0, %.preheader.us14 ], [ %n.vec74, %middle.block69 ]
  br label %scalar.ph70

scalar.ph70:                                      ; preds = %scalar.ph70.preheader, %scalar.ph70
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph70 ], [ %indvars.iv25.ph, %scalar.ph70.preheader ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv30
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %2
  %56 = load double, double* %22, align 8
  %57 = fmul double %55, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv30
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %2
  %61 = load double, double* %23, align 8
  %62 = fmul double %60, %61
  %63 = fadd double %57, %62
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv25
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv35
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %scalar.ph70, !llvm.loop !18

.lr.ph.us:                                        ; preds = %.preheader4.lr.ph, %._crit_edge9.us
  %indvars.iv59 = phi i2 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next60, %._crit_edge9.us ]
  %indvars.iv37 = phi i64 [ 0, %.preheader4.lr.ph ], [ %indvars.iv.next38, %._crit_edge9.us ]
  %indvars.iv35 = phi i64 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next36, %._crit_edge9.us ]
  %67 = add i64 %indvars.iv37, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %68 = mul i64 %indvars.iv37, 1201
  %69 = add i64 %68, 1
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %69
  %70 = add i64 %indvars.iv37, 1
  %71 = zext i2 %indvars.iv59 to i64
  %72 = add nuw nsw i64 %71, 4294967295
  %73 = and i64 %72, 4294967295
  %74 = add nuw nsw i64 %73, 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %75 = trunc i64 %indvars.iv.next38 to i32
  %xtraiter = and i32 %75, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.prol
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %3
  store double %78, double* %76, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %74, %.prol.loopexit.loopexit ]
  %79 = icmp ult i64 %indvars.iv37, 3
  br i1 %79, label %.preheader.us14.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %80 = sub i64 %67, %indvars.iv.unr
  %81 = lshr i64 %80, 2
  %82 = add nuw nsw i64 %81, 1
  %min.iters.check115 = icmp ult i64 %82, 2
  br i1 %min.iters.check115, label %.lr.ph.us.new.preheader138, label %min.iters.checked116

.lr.ph.us.new.preheader138:                       ; preds = %middle.block113, %min.iters.checked116, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked116 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end124, %middle.block113 ]
  br label %.lr.ph.us.new

min.iters.checked116:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf117 = and i64 %82, 1
  %n.vec118 = sub nsw i64 %82, %n.mod.vf117
  %cmp.zero119 = icmp eq i64 %n.vec118, 0
  %83 = add nsw i64 %indvars.iv.unr, 4
  %84 = shl nuw i64 %81, 2
  %85 = add i64 %83, %84
  %86 = shl nuw nsw i64 %n.mod.vf117, 2
  %ind.end124 = sub i64 %85, %86
  br i1 %cmp.zero119, label %.lr.ph.us.new.preheader138, label %vector.ph120

vector.ph120:                                     ; preds = %min.iters.checked116
  br label %vector.body112

vector.body112:                                   ; preds = %vector.body112, %vector.ph120
  %index121 = phi i64 [ 0, %vector.ph120 ], [ %index.next122, %vector.body112 ]
  %87 = shl i64 %index121, 2
  %88 = add i64 %indvars.iv.unr, %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %88
  %90 = bitcast double* %89 to <8 x double>*
  %wide.vec130 = load <8 x double>, <8 x double>* %90, align 8
  %strided.vec131 = shufflevector <8 x double> %wide.vec130, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec132 = shufflevector <8 x double> %wide.vec130, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec133 = shufflevector <8 x double> %wide.vec130, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec134 = shufflevector <8 x double> %wide.vec130, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %91 = fmul <2 x double> %strided.vec131, %broadcast.splat136
  %92 = fmul <2 x double> %strided.vec132, %broadcast.splat136
  %93 = fmul <2 x double> %strided.vec133, %broadcast.splat136
  %94 = add nsw i64 %88, 3
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %94
  %96 = fmul <2 x double> %strided.vec134, %broadcast.splat136
  %97 = getelementptr double, double* %95, i64 -3
  %98 = bitcast double* %97 to <8 x double>*
  %99 = shufflevector <2 x double> %91, <2 x double> %92, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %100 = shufflevector <2 x double> %93, <2 x double> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec137 = shufflevector <4 x double> %99, <4 x double> %100, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec137, <8 x double>* %98, align 8
  %index.next122 = add i64 %index121, 2
  %101 = icmp eq i64 %index.next122, %n.vec118
  br i1 %101, label %middle.block113, label %vector.body112, !llvm.loop !21

middle.block113:                                  ; preds = %vector.body112
  %cmp.n125 = icmp eq i64 %n.mod.vf117, 0
  br i1 %cmp.n125, label %.preheader.us14.preheader, label %.lr.ph.us.new.preheader138

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph70
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block69
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond33, label %._crit_edge9.us, label %.preheader.us14

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1200
  %indvars.iv.next60 = add i2 %indvars.iv59, 1
  br i1 %exitcond40, label %._crit_edge13, label %.lr.ph.us

._crit_edge13:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
