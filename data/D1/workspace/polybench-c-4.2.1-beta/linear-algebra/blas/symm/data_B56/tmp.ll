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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader7.lr.ph, label %.preheader6.thread

.preheader6.thread:                               ; preds = %7
  br label %67

.preheader7.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader7.us.preheader, label %.preheader6

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %11 = sext i32 %1 to i64
  %12 = zext i32 %1 to i64
  %13 = sext i32 %0 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge19.us
  %indvars.iv46 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next47, %._crit_edge19.us ]
  %14 = add i64 %indvars.iv46, %12
  %15 = trunc i64 %14 to i32
  br label %16

; <label>:16:                                     ; preds = %.preheader7.us, %16
  %indvars.iv44 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next45, %16 ]
  %17 = add nsw i64 %indvars.iv44, %indvars.iv46
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 100
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %10
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv44
  store double %21, double* %22, align 8
  %23 = trunc i64 %indvars.iv44 to i32
  %24 = sub i32 %15, %23
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %10
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv44
  store double %27, double* %28, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %29 = icmp slt i64 %indvars.iv.next45, %11
  br i1 %29, label %16, label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %16
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %30 = icmp slt i64 %indvars.iv.next47, %13
  br i1 %30, label %.preheader7.us, label %.preheader6.loopexit

.preheader6.loopexit:                             ; preds = %._crit_edge19.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader7.lr.ph
  br i1 true, label %.preheader5.lr.ph, label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6
  br label %67

.preheader5.lr.ph:                                ; preds = %.preheader6
  %31 = add i32 %0, 7
  %32 = add i32 %0, -2
  %33 = sext i32 %0 to i64
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %._crit_edge
  %indvars.iv42 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next43, %._crit_edge ]
  %indvars.iv32 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next33, %._crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %indvar.next, %._crit_edge ]
  %indvars.iv30 = phi i32 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next31, %._crit_edge ]
  %34 = sub i32 %31, %indvar
  %35 = sub i32 %32, %indvar
  %36 = icmp slt i64 %indvars.iv42, 0
  br i1 %36, label %.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %37 = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %37, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %38 = trunc i64 %indvars.iv42 to i32
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %10
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 0
  store double %41, double* %42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %43 = icmp eq i32 %indvar, 0
  br i1 %43, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv30 to i64
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit, %.preheader5
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, 1
  %44 = icmp slt i64 %indvars.iv.next43, %33
  br i1 %44, label %.lr.ph11, label %._crit_edge

.lr.ph11:                                         ; preds = %.preheader
  %xtraiter38 = and i32 %34, 7
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.prol.loopexit37, label %.prol.preheader36.preheader

.prol.preheader36.preheader:                      ; preds = %.lr.ph11
  br label %.prol.preheader36

.prol.preheader36:                                ; preds = %.prol.preheader36.preheader, %.prol.preheader36
  %indvars.iv34.prol = phi i64 [ %indvars.iv.next35.prol, %.prol.preheader36 ], [ %indvars.iv32, %.prol.preheader36.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader36 ], [ %xtraiter38, %.prol.preheader36.preheader ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv34.prol
  store double -9.990000e+02, double* %45, align 8
  %indvars.iv.next35.prol = add nsw i64 %indvars.iv34.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit37.loopexit, label %.prol.preheader36, !llvm.loop !1

.prol.loopexit37.loopexit:                        ; preds = %.prol.preheader36
  br label %.prol.loopexit37

.prol.loopexit37:                                 ; preds = %.prol.loopexit37.loopexit, %.lr.ph11
  %indvars.iv34.unr = phi i64 [ %indvars.iv32, %.lr.ph11 ], [ %indvars.iv.next35.prol, %.prol.loopexit37.loopexit ]
  %46 = icmp ult i32 %35, 7
  br i1 %46, label %._crit_edge, label %.lr.ph11.new.preheader

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit37
  br label %.lr.ph11.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %47 = add nsw i64 %indvars.iv, %indvars.iv42
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 100
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %10
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv
  store double %51, double* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = add nsw i64 %indvars.iv.next, %indvars.iv42
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 100
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %10
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next
  store double %57, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new.preheader, %.lr.ph11.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.7, %.lr.ph11.new ], [ %indvars.iv34.unr, %.lr.ph11.new.preheader ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv34
  store double -9.990000e+02, double* %59, align 8
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next35
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next35.1
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next35.2 = add nsw i64 %indvars.iv34, 3
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next35.2
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next35.3 = add nsw i64 %indvars.iv34, 4
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next35.3
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next35.4 = add nsw i64 %indvars.iv34, 5
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next35.4
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next35.5 = add nsw i64 %indvars.iv34, 6
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next35.5
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next35.6 = add nsw i64 %indvars.iv34, 7
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next35.6
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next35.7 = add nsw i64 %indvars.iv34, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next35.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %0
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph11.new

._crit_edge.loopexit:                             ; preds = %.lr.ph11.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit37, %.preheader
  %indvars.iv.next31 = add i32 %indvars.iv30, 1
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  br i1 %44, label %.preheader5, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge
  br label %67

; <label>:67:                                     ; preds = %.preheader6._crit_edge, %.preheader6.thread, %._crit_edge14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %76

.preheader.lr.ph:                                 ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %12 = fmul double %2, 0.000000e+00
  %13 = icmp sgt i64 %10, 1
  %smax = select i1 %13, i64 %10, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert53 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat54 = shufflevector <2 x double> %broadcast.splatinsert53, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert57 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat58 = shufflevector <2 x double> %broadcast.splatinsert57, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %12, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge6
  %indvar = phi i64 [ 0, %.preheader.lr.ph ], [ %indvar.next, %._crit_edge6 ]
  %indvars.iv35 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next36, %._crit_edge6 ]
  %indvars.iv33 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next34, %._crit_edge6 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 0
  %scevgep41 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 %smax
  %scevgep43 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 0
  %scevgep45 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 %smax
  br i1 %9, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %14 = icmp sgt i64 %indvars.iv35, 0
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv35
  br i1 %14, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  br i1 %min.iters.check, label %.lr.ph5.split.preheader61, label %min.iters.checked

.lr.ph5.split.preheader61:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph5.split.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph5.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph5.split

min.iters.checked:                                ; preds = %.lr.ph5.split.preheader
  br i1 %cmp.zero, label %.lr.ph5.split.preheader61, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %found.conflict = and i1 %bound0, %bound1
  %bound048 = icmp ult double* %scevgep, %15
  %bound149 = icmp ult double* %15, %scevgep41
  %found.conflict50 = and i1 %bound048, %bound149
  %conflict.rdx = or i1 %found.conflict, %found.conflict50
  br i1 %conflict.rdx, label %.lr.ph5.split.preheader61, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %15, align 8, !alias.scope !3
  %16 = insertelement <2 x double> undef, double %.pre, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %index
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !6, !noalias !8
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !6, !noalias !8
  %22 = fmul <2 x double> %broadcast.splat54, %wide.load
  %23 = fmul <2 x double> %broadcast.splat54, %wide.load52
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %index
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !10
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = fmul <2 x double> %broadcast.splat58, %wide.load55
  %29 = fmul <2 x double> %broadcast.splat58, %wide.load56
  %30 = fmul <2 x double> %28, %17
  %31 = fmul <2 x double> %29, %17
  %32 = fadd <2 x double> %22, %30
  %33 = fadd <2 x double> %23, %31
  %34 = fadd <2 x double> %32, %broadcast.splat60
  %35 = fadd <2 x double> %33, %broadcast.splat60
  store <2 x double> %34, <2 x double>* %19, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %35, <2 x double>* %21, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, %n.vec
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge6, label %.lr.ph5.split.preheader61

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %wide.trip.count = zext i32 %indvars.iv33 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv31
  br label %38

; <label>:38:                                     ; preds = %38, %.lr.ph5.split.us
  %indvars.iv25 = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next26, %38 ]
  %39 = phi double [ 0.000000e+00, %.lr.ph5.split.us ], [ %52, %38 ]
  %40 = load double, double* %37, align 8
  %41 = fmul double %40, %2
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv25
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv31
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  store double %47, double* %45, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %49 = load double, double* %48, align 8
  %50 = load double, double* %42, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %39, %51
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %38

._crit_edge.us:                                   ; preds = %38
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv31
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = load double, double* %37, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %15, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %55, %59
  %61 = fmul double %52, %2
  %62 = fadd double %60, %61
  store double %62, double* %53, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %63 = icmp slt i64 %indvars.iv.next32, %10
  br i1 %63, label %.lr.ph5.split.us, label %._crit_edge6.loopexit

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader61, %.lr.ph5.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph5.split ], [ %indvars.iv.ph, %.lr.ph5.split.preheader61 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %2
  %70 = load double, double* %15, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %66, %71
  %73 = fadd double %72, %12
  store double %73, double* %64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %74 = icmp slt i64 %indvars.iv.next, %10
  br i1 %74, label %.lr.ph5.split, label %._crit_edge6.loopexit62, !llvm.loop !14

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6.loopexit62:                          ; preds = %.lr.ph5.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit62, %._crit_edge6.loopexit, %middle.block, %.preheader
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %75 = icmp slt i64 %indvars.iv.next36, %11
  %indvar.next = add i64 %indvar, 1
  br i1 %75, label %.preheader, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge6
  br label %76

; <label>:76:                                     ; preds = %._crit_edge12, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %24

.preheader.lr.ph:                                 ; preds = %3
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge4.loopexit8

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge2.us
  %indvars.iv10 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11, %._crit_edge2.us ]
  %11 = mul nsw i64 %10, %indvars.iv10
  br label %12

; <label>:12:                                     ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #4
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %17, %12
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge2.us, label %12

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %23 = icmp slt i64 %indvars.iv.next11, %10
  br i1 %23, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge2.us
  br label %._crit_edge4

._crit_edge4.loopexit8:                           ; preds = %.preheader.lr.ph
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit8, %._crit_edge4.loopexit
  br label %24

; <label>:24:                                     ; preds = %._crit_edge4, %3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9, !4}
!9 = distinct !{!9, !5}
!10 = !{!9}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
