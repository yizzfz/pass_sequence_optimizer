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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array([1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader2

.preheader2:                                      ; preds = %23, %5
  %indvars.iv13 = phi i64 [ 0, %5 ], [ %indvars.iv.next14, %23 ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader2
  %indvars.iv10 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next11, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv10, %indvars.iv13
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv10
  %13 = add nuw nsw i64 %7, 2
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.000000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %12, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv10
  store double %21, double* %22, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond12, label %23, label %6

; <label>:23:                                     ; preds = %6
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %.preheader.preheader, label %.preheader2

.preheader.preheader:                             ; preds = %23
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %32
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %32 ], [ 0, %.preheader.preheader ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %24 ]
  %25 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %26 = add nuw nsw i64 %25, 3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %32, label %24

; <label>:32:                                     ; preds = %24
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond9, label %33, label %.preheader

; <label>:33:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %6 = insertelement <2 x double> undef, double %1, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert51 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat52 = shufflevector <2 x double> %broadcast.splatinsert51, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %5, %.us-lcssa.us
  %indvars.iv53 = phi i2 [ 1, %5 ], [ %indvars.iv.next, %.us-lcssa.us ]
  %indvars.iv23 = phi i64 [ 0, %5 ], [ %15, %.us-lcssa.us ]
  %indvars.iv21 = phi i64 [ 1, %5 ], [ %indvars.iv.next22, %.us-lcssa.us ]
  %8 = add nsw i64 %indvars.iv23, -3
  %9 = zext i2 %indvars.iv53 to i64
  %10 = add nuw nsw i64 %9, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = add nuw nsw i64 %11, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 0
  %13 = mul nuw nsw i64 %indvars.iv23, 1201
  %14 = add nuw nsw i64 %13, 1
  %scevgep27 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %14
  %15 = add nuw nsw i64 %indvars.iv23, 1
  %16 = trunc i64 %15 to i32
  %xtraiter = and i32 %16, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv.prol
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %1
  store double %19, double* %17, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %12, %.prol.loopexit.loopexit ]
  %20 = icmp ult i64 %indvars.iv23, 3
  br i1 %20, label %.preheader.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %21 = sub i64 %8, %indvars.iv.unr
  %22 = lshr i64 %21, 2
  %23 = and i64 %22, 1
  %lcmp.mod55 = icmp eq i64 %23, 0
  br i1 %lcmp.mod55, label %.lr.ph.new.prol.preheader, label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.preheader:                        ; preds = %.lr.ph.new.preheader
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv.unr
  %25 = bitcast double* %24 to <2 x double>*
  %26 = load <2 x double>, <2 x double>* %25, align 8
  %27 = fmul <2 x double> %26, %7
  store <2 x double> %27, <2 x double>* %25, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv.next.1.prol
  %29 = bitcast double* %28 to <2 x double>*
  %30 = load <2 x double>, <2 x double>* %29, align 8
  %31 = fmul <2 x double> %30, %7
  store <2 x double> %31, <2 x double>* %29, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph.new.preheader, %.lr.ph.new.prol.preheader
  %indvars.iv.unr57.ph = phi i64 [ %indvars.iv.next.3.prol, %.lr.ph.new.prol.preheader ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %32 = icmp eq i64 %22, 0
  br i1 %32, label %.preheader.preheader.loopexit, label %.lr.ph.new.preheader.new

.lr.ph.new.preheader.new:                         ; preds = %.lr.ph.new.prol.loopexit.unr-lcssa
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr57.ph, %.lr.ph.new.preheader.new ], [ %indvars.iv.next.3.1, %.lr.ph.new ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv
  %34 = bitcast double* %33 to <2 x double>*
  %35 = load <2 x double>, <2 x double>* %34, align 8
  %36 = fmul <2 x double> %35, %7
  store <2 x double> %36, <2 x double>* %34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv.next.1
  %38 = bitcast double* %37 to <2 x double>*
  %39 = load <2 x double>, <2 x double>* %38, align 8
  %40 = fmul <2 x double> %39, %7
  store <2 x double> %40, <2 x double>* %38, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv.next.3
  %42 = bitcast double* %41 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %42, align 8
  %44 = fmul <2 x double> %43, %7
  store <2 x double> %44, <2 x double>* %42, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv.next.1.1
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = fmul <2 x double> %47, %7
  store <2 x double> %48, <2 x double>* %46, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv21
  br i1 %exitcond.3.1, label %.preheader.preheader.loopexit.unr-lcssa, label %.lr.ph.new

.preheader.preheader.loopexit.unr-lcssa:          ; preds = %.lr.ph.new
  br label %.preheader.preheader.loopexit

.preheader.preheader.loopexit:                    ; preds = %.lr.ph.new.prol.loopexit.unr-lcssa, %.preheader.preheader.loopexit.unr-lcssa
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %.prol.loopexit
  %min.iters.check = icmp ult i64 %15, 2
  %n.vec = and i64 %15, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %15, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv17 = phi i64 [ %49, %._crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv17
  %49 = add nuw nsw i64 %indvars.iv17, 1
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %49
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv17
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv23, i64 %49
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv17
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv17
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %51
  %bound1 = icmp ult double* %51, %scevgep27
  %found.conflict = and i1 %bound0, %bound1
  %bound038 = icmp ult double* %scevgep, %scevgep31
  %bound139 = icmp ult double* %scevgep29, %scevgep27
  %found.conflict40 = and i1 %bound038, %bound139
  %conflict.rdx = or i1 %found.conflict, %found.conflict40
  %bound041 = icmp ult double* %scevgep, %scevgep35
  %bound142 = icmp ult double* %scevgep33, %scevgep27
  %found.conflict43 = and i1 %bound041, %bound142
  %conflict.rdx44 = or i1 %conflict.rdx, %found.conflict43
  %bound047 = icmp ult double* %scevgep, %50
  %bound148 = icmp ult double* %50, %scevgep27
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx50 = or i1 %conflict.rdx44, %found.conflict49
  br i1 %conflict.rdx50, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %50, align 8, !alias.scope !3
  %.pre58 = load double, double* %51, align 8, !alias.scope !6
  %52 = insertelement <2 x double> undef, double %.pre, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = insertelement <2 x double> undef, double %.pre58, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %56 = or i64 %index, 1
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv17
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %56, i64 %indvars.iv17
  %59 = load double, double* %57, align 8, !alias.scope !8
  %60 = load double, double* %58, align 8, !alias.scope !8
  %61 = insertelement <2 x double> undef, double %59, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  %63 = fmul <2 x double> %62, %broadcast.splat52
  %64 = fmul <2 x double> %63, %53
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv17
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %56, i64 %indvars.iv17
  %67 = load double, double* %65, align 8, !alias.scope !10
  %68 = load double, double* %66, align 8, !alias.scope !10
  %69 = insertelement <2 x double> undef, double %67, i32 0
  %70 = insertelement <2 x double> %69, double %68, i32 1
  %71 = fmul <2 x double> %70, %broadcast.splat52
  %72 = fmul <2 x double> %71, %55
  %73 = fadd <2 x double> %64, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !12, !noalias !14
  %76 = fadd <2 x double> %wide.load, %73
  store <2 x double> %76, <2 x double>* %75, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 2
  %77 = icmp eq i64 %index.next, %n.vec
  br i1 %77, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv12.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %scalar.ph ], [ %indvars.iv12.ph, %scalar.ph.preheader ]
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv17
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %0
  %81 = load double, double* %50, align 8
  %82 = fmul double %80, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv12, i64 %indvars.iv17
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, %0
  %86 = load double, double* %51, align 8
  %87 = fmul double %85, %86
  %88 = fadd double %82, %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv12
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, %indvars.iv21
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !18

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %exitcond19 = icmp eq i64 %49, 1000
  br i1 %exitcond19, label %.us-lcssa.us, label %.preheader

.us-lcssa.us:                                     ; preds = %._crit_edge
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond25 = icmp eq i64 %15, 1200
  %indvars.iv.next = add i2 %indvars.iv53, 1
  br i1 %exitcond25, label %92, label %.lr.ph

; <label>:92:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!11}
!11 = distinct !{!11, !5}
!12 = !{!13}
!13 = distinct !{!13, !5}
!14 = !{!7, !9, !11, !4}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !16, !17}
