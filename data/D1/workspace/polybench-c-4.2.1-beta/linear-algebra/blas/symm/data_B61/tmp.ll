; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader42.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader42.us

.preheader42.us:                                  ; preds = %._crit_edge52.us, %.preheader42.lr.ph
  %indvars.iv73 = phi i64 [ 0, %.preheader42.lr.ph ], [ %indvars.iv.next74, %._crit_edge52.us ]
  %5 = add i64 %indvars.iv73, 1200
  %6 = trunc i64 %5 to i32
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader42.us
  %indvars.iv70 = phi i64 [ 0, %.preheader42.us ], [ %indvars.iv.next71, %7 ]
  %8 = add nuw nsw i64 %indvars.iv70, %indvars.iv73
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 100
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv70
  store double %12, double* %13, align 8
  %14 = trunc i64 %indvars.iv70 to i32
  %15 = sub i32 %6, %14
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv70
  store double %18, double* %19, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 1200
  br i1 %exitcond72, label %._crit_edge52.us, label %7

._crit_edge52.us:                                 ; preds = %7
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1000
  br i1 %exitcond76, label %.lr.ph.preheader, label %.preheader42.us

.lr.ph.preheader:                                 ; preds = %._crit_edge52.us
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph46.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit79, %._crit_edge
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond69, label %._crit_edge49, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %.loopexit ], [ 1, %.lr.ph.preheader ]
  %20 = sub i64 1007, %indvars.iv66
  %21 = sub i64 998, %indvars.iv66
  %22 = and i64 %indvars.iv66, 1
  %lcmp.mod = icmp eq i64 %22, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %23 = trunc i64 %indvars.iv66 to i32
  %24 = srem i32 %23, 100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 0
  store double %26, double* %27, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %28 = icmp eq i64 %indvars.iv66, 0
  br i1 %28, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %29 = add nuw nsw i64 %indvars.iv, %indvars.iv66
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.000000e+03
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv
  store double %33, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = add nuw nsw i64 %indvars.iv.next, %indvars.iv66
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.000000e+03
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next
  store double %39, double* %40, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv64
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %41 = icmp slt i64 %indvars.iv.next67, 1000
  br i1 %41, label %.lr.ph46, label %.loopexit

.lr.ph46:                                         ; preds = %._crit_edge
  %xtraiter80 = and i64 %20, 7
  %lcmp.mod81 = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod81, label %.prol.loopexit79, label %.prol.preheader78.preheader

.prol.preheader78.preheader:                      ; preds = %.lr.ph46
  br label %.prol.preheader78

.prol.preheader78:                                ; preds = %.prol.preheader78.preheader, %.prol.preheader78
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next61.prol, %.prol.preheader78 ], [ %indvars.iv64, %.prol.preheader78.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader78 ], [ %xtraiter80, %.prol.preheader78.preheader ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv60.prol
  store double -9.990000e+02, double* %42, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit79.loopexit, label %.prol.preheader78, !llvm.loop !1

.prol.loopexit79.loopexit:                        ; preds = %.prol.preheader78
  br label %.prol.loopexit79

.prol.loopexit79:                                 ; preds = %.prol.loopexit79.loopexit, %.lr.ph46
  %indvars.iv60.unr = phi i64 [ %indvars.iv64, %.lr.ph46 ], [ %indvars.iv.next61.prol, %.prol.loopexit79.loopexit ]
  %43 = icmp ult i64 %21, 7
  br i1 %43, label %.loopexit, label %.lr.ph46.new.preheader

.lr.ph46.new.preheader:                           ; preds = %.prol.loopexit79
  %44 = sub i64 992, %indvars.iv60.unr
  %45 = lshr i64 %44, 3
  %46 = add nuw nsw i64 %45, 1
  %min.iters.check = icmp ult i64 %46, 2
  br i1 %min.iters.check, label %.lr.ph46.new.preheader1, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph46.new.preheader
  %n.mod.vf = and i64 %46, 1
  %n.vec = sub nsw i64 %46, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %47 = add i64 %indvars.iv60.unr, 8
  %48 = shl nuw i64 %45, 3
  %49 = add i64 %47, %48
  %50 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %49, %50
  br i1 %cmp.zero, label %.lr.ph46.new.preheader1, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = shl i64 %index, 3
  %52 = add i64 %indvars.iv60.unr, %51
  %53 = add nsw i64 %52, 7
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %53
  %55 = getelementptr double, double* %54, i64 -7
  %56 = bitcast double* %55 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %56, align 8
  %index.next = add i64 %index, 2
  %57 = icmp eq i64 %index.next, %n.vec
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph46.new.preheader1

.lr.ph46.new.preheader1:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph46.new.preheader
  %indvars.iv60.ph = phi i64 [ %indvars.iv60.unr, %min.iters.checked ], [ %indvars.iv60.unr, %.lr.ph46.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph46.new

.lr.ph46.new:                                     ; preds = %.lr.ph46.new.preheader1, %.lr.ph46.new
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.7, %.lr.ph46.new ], [ %indvars.iv60.ph, %.lr.ph46.new.preheader1 ]
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv60
  store double -9.990000e+02, double* %58, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next61
  store double -9.990000e+02, double* %59, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next61.1
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next61.2
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next61.3 = add nsw i64 %indvars.iv60, 4
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next61.3
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next61.4 = add nsw i64 %indvars.iv60, 5
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next61.4
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next61.5 = add nsw i64 %indvars.iv60, 6
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next61.5
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next61.6 = add nsw i64 %indvars.iv60, 7
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next61.6
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next61.7 = add nsw i64 %indvars.iv60, 8
  %exitcond63.7 = icmp eq i64 %indvars.iv.next61.7, 1000
  br i1 %exitcond63.7, label %.loopexit.loopexit, label %.lr.ph46.new, !llvm.loop !6

._crit_edge49:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
.preheader44.us.preheader:
  %5 = fmul double %0, 0.000000e+00
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.us.preheader, %._crit_edge51.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge51.us ], [ 0, %.preheader44.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv82, i64 0
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv82, i64 1200
  %6 = icmp sgt i64 %indvars.iv82, 0
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %6, label %.preheader.us.us.preheader, label %vector.memcheck

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

vector.memcheck:                                  ; preds = %.preheader44.us
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 1200
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep92, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %7
  %bound198 = icmp ult double* %7, %scevgep90
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  br i1 %conflict.rdx, label %.preheader.us61.preheader, label %vector.ph

.preheader.us61.preheader:                        ; preds = %vector.memcheck
  br label %.preheader.us61

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv82, i64 %index
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !8, !noalias !11
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !8, !noalias !11
  %12 = fmul <2 x double> %wide.load, %broadcast.splat103
  %13 = fmul <2 x double> %wide.load101, %broadcast.splat103
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !14
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !14
  %18 = fmul <2 x double> %wide.load104, %broadcast.splat107
  %19 = fmul <2 x double> %wide.load105, %broadcast.splat107
  %20 = load double, double* %7, align 8, !alias.scope !15
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = insertelement <2 x double> undef, double %20, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = fmul <2 x double> %18, %22
  %26 = fmul <2 x double> %19, %24
  %27 = fadd <2 x double> %12, %25
  %28 = fadd <2 x double> %13, %26
  %29 = fadd <2 x double> %broadcast.splat109, %27
  %30 = fadd <2 x double> %broadcast.splat109, %28
  %31 = bitcast double* %8 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8, !alias.scope !8, !noalias !11
  %32 = bitcast double* %10 to <2 x double>*
  store <2 x double> %30, <2 x double>* %32, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %33 = icmp eq i64 %index.next, 1200
  br i1 %33, label %._crit_edge51.us.loopexit2, label %vector.body, !llvm.loop !16

.preheader.us61:                                  ; preds = %.preheader.us61, %.preheader.us61.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us61.preheader ], [ %indvars.iv.next.1, %.preheader.us61 ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %0
  %40 = load double, double* %7, align 8
  %41 = fmul double %39, %40
  %42 = fadd double %36, %41
  %43 = fadd double %5, %42
  store double %43, double* %34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %0
  %50 = load double, double* %7, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %46, %51
  %53 = fadd double %5, %52
  store double %53, double* %44, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit1, label %.preheader.us61, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit1:                       ; preds = %.preheader.us61
  br label %._crit_edge51.us

._crit_edge51.us.loopexit2:                       ; preds = %vector.body
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit2, %._crit_edge51.us.loopexit1, %._crit_edge51.us.loopexit
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, 1000
  br i1 %exitcond85, label %._crit_edge55, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  br label %65

._crit_edge.us.us:                                ; preds = %65
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv78
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %1
  %58 = load double, double* %54, align 8
  %59 = fmul double %58, %0
  %60 = load double, double* %7, align 8
  %61 = fmul double %59, %60
  %62 = fadd double %57, %61
  %63 = fmul double %78, %0
  %64 = fadd double %63, %62
  store double %64, double* %55, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, 1200
  br i1 %exitcond81, label %._crit_edge51.us.loopexit, label %.preheader.us.us

; <label>:65:                                     ; preds = %65, %.preheader.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %65 ], [ 0, %.preheader.us.us ]
  %.047.us.us = phi double [ %78, %65 ], [ 0.000000e+00, %.preheader.us.us ]
  %66 = load double, double* %54, align 8
  %67 = fmul double %66, %0
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv72
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv72, i64 %indvars.iv78
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %75 = load double, double* %74, align 8
  %76 = load double, double* %68, align 8
  %77 = fmul double %75, %76
  %78 = fadd double %.047.us.us, %77
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge.us.us, label %65

._crit_edge55:                                    ; preds = %._crit_edge51.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv16, 1000
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %13 ]
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond19, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
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
