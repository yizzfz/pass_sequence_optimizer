; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
._crit_edge.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge54.us, %._crit_edge.lr.ph
  %indvars.iv76 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next77, %._crit_edge54.us ]
  %7 = add nuw nsw i64 %indvars.iv76, 1200
  %8 = trunc i64 %7 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.us
  %indvars.iv72 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next73, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv72, %indvars.iv76
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv72
  store double %13, double* %14, align 8
  %15 = sub nsw i64 0, %indvars.iv72
  %16 = trunc i64 %15 to i32
  %17 = add i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 %indvars.iv72
  store double %20, double* %21, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond87, label %._crit_edge54.us, label %._crit_edge

._crit_edge54.us:                                 ; preds = %._crit_edge
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next77, 1000
  br i1 %exitcond88, label %.lr.ph.preheader, label %._crit_edge.us

.lr.ph.preheader:                                 ; preds = %._crit_edge54.us
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge43..lr.ph_crit_edge
  %indvars.iv93 = phi i3 [ -1, %.lr.ph.preheader ], [ %indvars.iv.next94, %._crit_edge43..lr.ph_crit_edge ]
  %indvars.iv91 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next92, %._crit_edge43..lr.ph_crit_edge ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge43..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %22 = zext i3 %indvars.iv93 to i64
  %23 = add i64 %indvars.iv91, %22
  %24 = sub i64 1007, %indvars.iv68
  %25 = sub i64 998, %indvars.iv68
  %26 = and i64 %indvars.iv68, 1
  %lcmp.mod = icmp eq i64 %26, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %27 = trunc i64 %indvars.iv68 to i32
  %28 = srem i32 %27, 100
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 0
  store double %30, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %32 = icmp eq i64 %indvars.iv68, 0
  br i1 %32, label %._crit_edge45, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %33 = add nuw nsw i64 %indvars.iv, %indvars.iv68
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 100
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.000000e+03
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = add nuw nsw i64 %indvars.iv.next, %indvars.iv68
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.000000e+03
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next
  store double %43, double* %44, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv91
  br i1 %exitcond.1, label %._crit_edge45.loopexit, label %.lr.ph.new

._crit_edge45.loopexit:                           ; preds = %.lr.ph.new
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %.prol.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %45 = icmp slt i64 %indvars.iv.next69, 1000
  br i1 %45, label %.lr.ph48, label %._crit_edge43

.lr.ph48:                                         ; preds = %._crit_edge45
  %xtraiter83 = and i64 %24, 7
  %lcmp.mod84 = icmp eq i64 %xtraiter83, 0
  br i1 %lcmp.mod84, label %.prol.loopexit82, label %.prol.preheader81.preheader

.prol.preheader81.preheader:                      ; preds = %.lr.ph48
  br label %.prol.preheader81

.prol.preheader81:                                ; preds = %.prol.preheader81.preheader, %.prol.preheader81
  %indvars.iv62.prol = phi i64 [ %indvars.iv.next63.prol, %.prol.preheader81 ], [ %indvars.iv91, %.prol.preheader81.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader81 ], [ %xtraiter83, %.prol.preheader81.preheader ]
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv62.prol
  store double -9.990000e+02, double* %46, align 8
  %indvars.iv.next63.prol = add nuw nsw i64 %indvars.iv62.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit82.loopexit, label %.prol.preheader81, !llvm.loop !1

.prol.loopexit82.loopexit:                        ; preds = %.prol.preheader81
  br label %.prol.loopexit82

.prol.loopexit82:                                 ; preds = %.prol.loopexit82.loopexit, %.lr.ph48
  %indvars.iv62.unr = phi i64 [ %indvars.iv91, %.lr.ph48 ], [ %23, %.prol.loopexit82.loopexit ]
  %47 = icmp ult i64 %25, 7
  br i1 %47, label %._crit_edge43, label %.lr.ph48.new.preheader

.lr.ph48.new.preheader:                           ; preds = %.prol.loopexit82
  %48 = sub i64 992, %indvars.iv62.unr
  %49 = lshr i64 %48, 3
  %50 = add nuw nsw i64 %49, 1
  %min.iters.check = icmp ult i64 %50, 2
  br i1 %min.iters.check, label %.lr.ph48.new.preheader90, label %min.iters.checked

.lr.ph48.new.preheader90:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph48.new.preheader
  %indvars.iv62.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv62.unr, %min.iters.checked ], [ %indvars.iv62.unr, %.lr.ph48.new.preheader ]
  br label %.lr.ph48.new

min.iters.checked:                                ; preds = %.lr.ph48.new.preheader
  %n.mod.vf = and i64 %50, 1
  %n.vec = sub nsw i64 %50, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %51 = add i64 %indvars.iv62.unr, 8
  %52 = shl nuw i64 %49, 3
  %53 = add i64 %51, %52
  %54 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %53, %54
  br i1 %cmp.zero, label %.lr.ph48.new.preheader90, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %55 = shl i64 %index, 3
  %56 = add i64 %indvars.iv62.unr, %55
  %57 = add nsw i64 %56, 7
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %57
  %59 = getelementptr double, double* %58, i64 -7
  %60 = bitcast double* %59 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %60, align 8
  %index.next = add i64 %index, 2
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge43, label %.lr.ph48.new.preheader90

._crit_edge43.loopexit:                           ; preds = %.lr.ph48.new
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit, %middle.block, %.prol.loopexit82, %._crit_edge45
  %exitcond = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond, label %._crit_edge51, label %._crit_edge43..lr.ph_crit_edge

._crit_edge43..lr.ph_crit_edge:                   ; preds = %._crit_edge43
  %indvars.iv.next92 = add nuw i64 %indvars.iv91, 1
  %indvars.iv.next94 = add i3 %indvars.iv93, -1
  br label %.lr.ph

.lr.ph48.new:                                     ; preds = %.lr.ph48.new.preheader90, %.lr.ph48.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.7, %.lr.ph48.new ], [ %indvars.iv62.ph, %.lr.ph48.new.preheader90 ]
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv62
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next63
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next63.1
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next63.2 = add nsw i64 %indvars.iv62, 3
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next63.2
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next63.3 = add nsw i64 %indvars.iv62, 4
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next63.3
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next63.4 = add nsw i64 %indvars.iv62, 5
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next63.4
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next63.5 = add nsw i64 %indvars.iv62, 6
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next63.5
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next63.6 = add nsw i64 %indvars.iv62, 7
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next63.6
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next63.7 = add nsw i64 %indvars.iv62, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next63.7, 1000
  br i1 %exitcond.7, label %._crit_edge43.loopexit, label %.lr.ph48.new, !llvm.loop !6

._crit_edge51:                                    ; preds = %._crit_edge43
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #2 {
._crit_edge.us.preheader:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert104 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat105 = shufflevector <2 x double> %broadcast.splatinsert104, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat111 = shufflevector <2 x double> %broadcast.splatinsert110, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge52.us, %._crit_edge.us.preheader
  %indvars.iv86 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next87, %._crit_edge52.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 0
  %8 = add nuw nsw i64 %indvars.iv86, 1
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv86, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv86, i64 %indvars.iv86
  br i1 %9, label %._crit_edge44.us.us.preheader, label %vector.memcheck

._crit_edge44.us.us.preheader:                    ; preds = %._crit_edge.us
  br label %._crit_edge44.us.us

vector.memcheck:                                  ; preds = %._crit_edge.us
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv86, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep96
  %bound1 = icmp ult double* %scevgep94, %scevgep92
  %found.conflict = and i1 %bound0, %bound1
  %bound099 = icmp ult double* %scevgep, %10
  %bound1100 = icmp ult double* %10, %scevgep92
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx = or i1 %found.conflict, %found.conflict101
  br i1 %conflict.rdx, label %._crit_edge44.us57.preheader, label %vector.ph

._crit_edge44.us57.preheader:                     ; preds = %vector.memcheck
  br label %._crit_edge44.us57

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !8, !noalias !11
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !8, !noalias !11
  %15 = fmul <2 x double> %wide.load, %broadcast.splat105
  %16 = fmul <2 x double> %wide.load103, %broadcast.splat105
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv86, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !14
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !14
  %21 = fmul <2 x double> %wide.load106, %broadcast.splat109
  %22 = fmul <2 x double> %wide.load107, %broadcast.splat109
  %23 = load double, double* %10, align 8, !alias.scope !15
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %broadcast.splat111, %30
  %33 = fadd <2 x double> %broadcast.splat111, %31
  %34 = bitcast double* %11 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %35 = bitcast double* %13 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !8, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge52.us.loopexit113, label %vector.body, !llvm.loop !16

._crit_edge44.us57:                               ; preds = %._crit_edge44.us57, %._crit_edge44.us57.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge44.us57.preheader ], [ %indvars.iv.next.1, %._crit_edge44.us57 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv86, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  %43 = load double, double* %10, align 8
  %44 = fmul double %42, %43
  %45 = fadd double %39, %44
  %46 = fadd double %7, %45
  store double %46, double* %37, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv86, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %2
  %53 = load double, double* %10, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %49, %54
  %56 = fadd double %7, %55
  store double %56, double* %47, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond82.1, label %._crit_edge52.us.loopexit112, label %._crit_edge44.us57, !llvm.loop !17

._crit_edge52.us.loopexit:                        ; preds = %._crit_edge48.us.us
  br label %._crit_edge52.us

._crit_edge52.us.loopexit112:                     ; preds = %._crit_edge44.us57
  br label %._crit_edge52.us

._crit_edge52.us.loopexit113:                     ; preds = %vector.body
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit113, %._crit_edge52.us.loopexit112, %._crit_edge52.us.loopexit
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 1000
  br i1 %exitcond88, label %._crit_edge56, label %._crit_edge.us

._crit_edge44.us.us:                              ; preds = %._crit_edge44.us.us.preheader, %._crit_edge48.us.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge48.us.us ], [ 0, %._crit_edge44.us.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv86, i64 %indvars.iv77
  br label %._crit_edge

._crit_edge48.us.us:                              ; preds = %._crit_edge
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv77
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %3
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv86, i64 %indvars.iv77
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %2
  %64 = load double, double* %10, align 8
  %65 = fmul double %63, %64
  %66 = fadd double %60, %65
  %67 = fmul double %81, %2
  %68 = fadd double %67, %66
  store double %68, double* %58, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next78, 1200
  br i1 %exitcond85, label %._crit_edge52.us.loopexit, label %._crit_edge44.us.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge44.us.us
  %indvars.iv73 = phi i64 [ 0, %._crit_edge44.us.us ], [ %indvars.iv.next74, %._crit_edge ]
  %.047.us.us = phi double [ 0.000000e+00, %._crit_edge44.us.us ], [ %81, %._crit_edge ]
  %69 = load double, double* %57, align 8
  %70 = fmul double %69, %2
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv86, i64 %indvars.iv73
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv77
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv73, i64 %indvars.iv77
  %78 = load double, double* %77, align 8
  %79 = load double, double* %71, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %.047.us.us, %80
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond = icmp eq i64 %indvars.iv.next74, %indvars.iv86
  br i1 %exitcond, label %._crit_edge48.us.us, label %._crit_edge

._crit_edge56:                                    ; preds = %._crit_edge52.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly) #0 {
._crit_edge.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge14.us, %._crit_edge.us.preheader
  %indvars.iv18 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next19, %._crit_edge14.us ]
  %7 = mul nuw nsw i64 %indvars.iv18, 1000
  br label %._crit_edge12.us._crit_edge

._crit_edge12.us._crit_edge:                      ; preds = %._crit_edge12.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge12.us ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge12.us

; <label>:12:                                     ; preds = %._crit_edge12.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond23, label %._crit_edge14.us, label %._crit_edge12.us._crit_edge

._crit_edge14.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond, label %._crit_edge16, label %._crit_edge.us

._crit_edge16:                                    ; preds = %._crit_edge14.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
