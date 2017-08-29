; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1200 x double]*
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %15
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %19

; <label>:19:                                     ; preds = %15, %18, %2
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader7.lr.ph, label %._crit_edge16

.preheader7.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader7.us.preheader, label %.preheader5.lr.ph

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge22.us
  %indvars.iv44 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next45, %._crit_edge22.us ]
  %13 = add nsw i64 %indvars.iv44, %11
  %14 = trunc i64 %13 to i32
  br label %15

; <label>:15:                                     ; preds = %.preheader7.us, %15
  %indvars.iv42 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next43, %15 ]
  %16 = add nsw i64 %indvars.iv44, %indvars.iv42
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %10
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv42
  store double %20, double* %21, align 8
  %22 = trunc i64 %indvars.iv42 to i32
  %23 = sub i32 %14, %22
  %24 = srem i32 %23, 100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %10
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv44, i64 %indvars.iv42
  store double %26, double* %27, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %28 = icmp slt i64 %indvars.iv.next43, %11
  br i1 %28, label %15, label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %15
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %29 = icmp slt i64 %indvars.iv.next45, %12
  br i1 %29, label %.preheader7.us, label %.preheader6

.preheader6:                                      ; preds = %._crit_edge22.us
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge16

.preheader5.lr.ph:                                ; preds = %.preheader7.lr.ph, %.preheader6
  %30 = sitofp i32 %0 to double
  %31 = add i32 %0, 7
  %32 = add i32 %0, -2
  %33 = sext i32 %0 to i64
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %._crit_edge
  %indvars.iv40 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next41, %._crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %indvar.next, %._crit_edge ]
  %indvars.iv35 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next36, %._crit_edge ]
  %indvars.iv33 = phi i32 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next34, %._crit_edge ]
  %34 = sub i32 %31, %indvar
  %35 = sub i32 %32, %indvar
  %36 = icmp slt i64 %indvars.iv40, 0
  br i1 %36, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv33 to i64
  %37 = and i64 %indvars.iv40, 1
  %lcmp.mod51 = icmp eq i64 %37, 0
  br i1 %lcmp.mod51, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %38 = trunc i64 %indvars.iv40 to i32
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %30
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 0
  store double %41, double* %42, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %43 = icmp eq i64 %indvars.iv40, 0
  br i1 %43, label %.preheader.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader5
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %44 = icmp slt i64 %indvars.iv.next41, %33
  br i1 %44, label %.lr.ph13, label %._crit_edge16.loopexit

.lr.ph13:                                         ; preds = %.preheader
  %xtraiter = and i32 %34, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader ], [ %indvars.iv35, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %45, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph13
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph13 ], [ %indvars.iv.next38.prol, %.prol.loopexit.loopexit ]
  %46 = icmp ult i32 %35, 7
  br i1 %46, label %._crit_edge, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph13.new

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %47 = add nsw i64 %indvars.iv40, %indvars.iv
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 100
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %30
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv
  store double %51, double* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = add nsw i64 %indvars.iv40, %indvars.iv.next
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 100
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %30
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %57, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader, %.lr.ph13.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph13.new ], [ %indvars.iv37.unr, %.lr.ph13.new.preheader ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37
  store double -9.990000e+02, double* %59, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond39.7 = icmp eq i32 %lftr.wideiv.7, %0
  br i1 %exitcond39.7, label %._crit_edge.loopexit, label %.lr.ph13.new

._crit_edge.loopexit:                             ; preds = %.lr.ph13.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %44, label %.preheader5, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %._crit_edge, %.preheader
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %7, %.preheader6
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %12 = fmul double %2, 0.000000e+00
  %min.iters.check = icmp ult i32 %1, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %12, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %10, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge8
  %indvars.iv36 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next37, %._crit_edge8 ]
  %indvars.iv34 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next35, %._crit_edge8 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %10
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 0
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %10
  br i1 %9, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %.preheader
  %13 = icmp sgt i64 %indvars.iv36, 0
  br i1 %13, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.lr.ph7
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  br i1 %min.iters.check, label %.lr.ph7.split.preheader62, label %min.iters.checked

.lr.ph7.split.preheader62:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph7.split.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph7.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph7.split

min.iters.checked:                                ; preds = %.lr.ph7.split.preheader
  br i1 %cmp.zero, label %.lr.ph7.split.preheader62, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %found.conflict = and i1 %bound0, %bound1
  %bound049 = icmp ult double* %scevgep, %14
  %bound150 = icmp ult double* %14, %scevgep42
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx = or i1 %found.conflict, %found.conflict51
  br i1 %conflict.rdx, label %.lr.ph7.split.preheader62, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %15 = load double, double* %14, align 8, !alias.scope !3
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %15, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !6, !noalias !8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !6, !noalias !8
  %24 = fmul <2 x double> %wide.load, %broadcast.splat55
  %25 = fmul <2 x double> %wide.load53, %broadcast.splat55
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !10
  %30 = fmul <2 x double> %wide.load56, %broadcast.splat59
  %31 = fmul <2 x double> %wide.load57, %broadcast.splat59
  %32 = fmul <2 x double> %30, %17
  %33 = fmul <2 x double> %31, %19
  %34 = fadd <2 x double> %24, %32
  %35 = fadd <2 x double> %25, %33
  %36 = fadd <2 x double> %34, %broadcast.splat61
  %37 = fadd <2 x double> %35, %broadcast.splat61
  %38 = bitcast double* %20 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %39 = bitcast double* %22 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge8, label %.lr.ph7.split.preheader62

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv32
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph7.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next27, %43 ]
  %44 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %57, %43 ]
  %45 = load double, double* %42, align 8
  %46 = fmul double %45, %2
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv26
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv32
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  store double %52, double* %50, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv32
  %54 = load double, double* %53, align 8
  %55 = load double, double* %47, align 8
  %56 = fmul double %54, %55
  %57 = fadd double %44, %56
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %43

._crit_edge.us:                                   ; preds = %43
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv32
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %3
  %61 = load double, double* %42, align 8
  %62 = fmul double %61, %2
  %63 = load double, double* %41, align 8
  %64 = fmul double %62, %63
  %65 = fadd double %60, %64
  %66 = fmul double %57, %2
  %67 = fadd double %65, %66
  store double %67, double* %58, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %68 = icmp slt i64 %indvars.iv.next33, %10
  br i1 %68, label %.lr.ph7.split.us, label %._crit_edge8.loopexit

.lr.ph7.split:                                    ; preds = %.lr.ph7.split.preheader62, %.lr.ph7.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph7.split ], [ %indvars.iv.ph, %.lr.ph7.split.preheader62 ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %3
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %2
  %75 = load double, double* %14, align 8
  %76 = fmul double %74, %75
  %77 = fadd double %71, %76
  %78 = fadd double %77, %12
  store double %78, double* %69, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %79 = icmp slt i64 %indvars.iv.next, %10
  br i1 %79, label %.lr.ph7.split, label %._crit_edge8.loopexit63, !llvm.loop !14

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit63:                          ; preds = %.lr.ph7.split
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit63, %._crit_edge8.loopexit, %middle.block, %.preheader
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %80 = icmp slt i64 %indvars.iv.next37, %11
  br i1 %80, label %.preheader, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %._crit_edge8
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %11 = mul nsw i64 %10, %indvars.iv11
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #4
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %24 = icmp slt i64 %indvars.iv.next12, %10
  br i1 %24, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #4
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
