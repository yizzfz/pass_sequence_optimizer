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
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %2, %18
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader7.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge21.us, %.preheader7.lr.ph
  %indvars.iv42 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next43, %._crit_edge21.us ]
  %7 = add nuw nsw i64 %indvars.iv42, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader7.us
  %indvars.iv40 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next41, %9 ]
  %10 = add nuw nsw i64 %indvars.iv42, %indvars.iv40
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv40
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv40 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv42, i64 %indvars.iv40
  store double %20, double* %21, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond53, label %._crit_edge21.us, label %9

._crit_edge21.us:                                 ; preds = %9
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next43, 1000
  br i1 %exitcond54, label %.preheader5.preheader, label %.preheader7.us

.preheader5.preheader:                            ; preds = %._crit_edge21.us
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge, %.preheader5.preheader
  %indvars.iv51 = phi i64 [ 1, %.preheader5.preheader ], [ %indvars.iv.next52, %._crit_edge ]
  %indvars.iv49 = phi i3 [ -1, %.preheader5.preheader ], [ %indvars.iv.next50, %._crit_edge ]
  %indvars.iv47 = phi i64 [ 2, %.preheader5.preheader ], [ %indvars.iv.next48, %._crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv38 = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next39, %._crit_edge ]
  %22 = zext i3 %indvars.iv49 to i64
  %23 = add nuw nsw i64 %22, 4294967295
  %24 = and i64 %23, 4294967295
  %25 = add i64 %indvars.iv47, %24
  %26 = sub nuw nsw i32 1007, %indvar
  %27 = sub nsw i32 998, %indvar
  br i1 false, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %28 = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %28, 0
  br i1 %lcmp.mod, label %.lr.ph.prol, label %.lr.ph.prol.loopexit

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %29 = trunc i64 %indvars.iv38 to i32
  %30 = srem i32 %29, 100
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 0
  store double %32, double* %33, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %34 = icmp eq i32 %indvar, 0
  br i1 %34, label %.preheader, label %.lr.ph.preheader46

.lr.ph.preheader46:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph.prol.loopexit, %.preheader5
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %35 = icmp slt i64 %indvars.iv.next39, 1000
  br i1 %35, label %.lr.ph12, label %._crit_edge

.lr.ph12:                                         ; preds = %.preheader
  %xtraiter44 = and i32 %26, 7
  %lcmp.mod45 = icmp eq i32 %xtraiter44, 0
  br i1 %lcmp.mod45, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph12
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv35.prol = phi i64 [ %indvars.iv.next36.prol, %.prol.preheader ], [ %indvars.iv51, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter44, %.prol.preheader.preheader ]
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv35.prol
  store double -9.990000e+02, double* %36, align 8
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv35.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph12
  %indvars.iv35.unr = phi i64 [ %indvars.iv51, %.lr.ph12 ], [ %25, %.prol.loopexit.loopexit ]
  %37 = icmp ult i32 %27, 7
  br i1 %37, label %._crit_edge, label %.lr.ph12.new.preheader

.lr.ph12.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph12.new

.lr.ph:                                           ; preds = %.lr.ph.preheader46, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader46 ]
  %38 = add nsw i64 %indvars.iv38, %indvars.iv
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 100
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = add nsw i64 %indvars.iv38, %indvars.iv.next
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 100
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %41, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fdiv <2 x double> %48, <double 1.000000e+03, double 1.000000e+03>
  %50 = bitcast double* %42 to <2 x double>*
  store <2 x double> %49, <2 x double>* %50, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph

.lr.ph12.new:                                     ; preds = %.lr.ph12.new.preheader, %.lr.ph12.new
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.7, %.lr.ph12.new ], [ %indvars.iv35.unr, %.lr.ph12.new.preheader ]
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv35
  store double -9.990000e+02, double* %51, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36
  store double -9.990000e+02, double* %52, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.1
  store double -9.990000e+02, double* %53, align 8
  %indvars.iv.next36.2 = add nsw i64 %indvars.iv35, 3
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.2
  store double -9.990000e+02, double* %54, align 8
  %indvars.iv.next36.3 = add nsw i64 %indvars.iv35, 4
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.3
  store double -9.990000e+02, double* %55, align 8
  %indvars.iv.next36.4 = add nsw i64 %indvars.iv35, 5
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.4
  store double -9.990000e+02, double* %56, align 8
  %indvars.iv.next36.5 = add nsw i64 %indvars.iv35, 6
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.5
  store double -9.990000e+02, double* %57, align 8
  %indvars.iv.next36.6 = add nsw i64 %indvars.iv35, 7
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.6
  store double -9.990000e+02, double* %58, align 8
  %indvars.iv.next36.7 = add nsw i64 %indvars.iv35, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next36.7 to i32
  %exitcond37.7 = icmp eq i32 %lftr.wideiv.7, 1000
  br i1 %exitcond37.7, label %._crit_edge.loopexit, label %.lr.ph12.new

._crit_edge.loopexit:                             ; preds = %.lr.ph12.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %indvars.iv.next50 = add i3 %indvars.iv49, -1
  %exitcond = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond, label %._crit_edge15, label %.preheader5

._crit_edge15:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = insertelement <2 x double> %8, double %3, i32 1
  %broadcast.splatinsert52 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat53 = shufflevector <2 x double> %broadcast.splatinsert52, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge7, %.preheader.lr.ph
  %indvars.iv65 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next66, %._crit_edge7 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 0
  %10 = add nuw nsw i64 %indvars.iv65, 1
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %4, i64 %10, i64 0
  %11 = icmp sgt i64 %indvars.iv65, 0
  br i1 %11, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %.preheader
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %6, i64 %10, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 0
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv65
  %bound0 = icmp ult double* %scevgep, %scevgep44
  %bound1 = icmp ult double* %scevgep42, %scevgep40
  %found.conflict = and i1 %bound0, %bound1
  %bound047 = icmp ult double* %scevgep, %12
  %bound148 = icmp ult double* %12, %scevgep40
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx = or i1 %found.conflict, %found.conflict49
  br i1 %conflict.rdx, label %.lr.ph6.split.preheader60, label %vector.ph

.lr.ph6.split.preheader60:                        ; preds = %.lr.ph6.split.preheader
  br label %.lr.ph6.split

vector.ph:                                        ; preds = %.lr.ph6.split.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %index
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !3, !noalias !6
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !3, !noalias !6
  %17 = fmul <2 x double> %broadcast.splat53, %wide.load
  %18 = fmul <2 x double> %broadcast.splat53, %wide.load51
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %index
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !9
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !9
  %23 = fmul <2 x double> %broadcast.splat57, %wide.load54
  %24 = fmul <2 x double> %broadcast.splat57, %wide.load55
  %25 = load double, double* %12, align 8, !alias.scope !10
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %25, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = fmul <2 x double> %23, %27
  %31 = fmul <2 x double> %24, %29
  %32 = fadd <2 x double> %17, %30
  %33 = fadd <2 x double> %18, %31
  %34 = fadd <2 x double> %32, %broadcast.splat59
  %35 = fadd <2 x double> %33, %broadcast.splat59
  %36 = bitcast double* %13 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !3, !noalias !6
  %37 = bitcast double* %15 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8, !alias.scope !3, !noalias !6
  %index.next = add nuw nsw i64 %index, 4
  %38 = icmp eq i64 %index.next, 1200
  br i1 %38, label %._crit_edge7.loopexit62, label %vector.body, !llvm.loop !11

.lr.ph6.split.us.preheader:                       ; preds = %.preheader
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv65
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph6.split.us.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us ], [ 0, %.lr.ph6.split.us.preheader ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv31
  br label %41

; <label>:41:                                     ; preds = %41, %.lr.ph6.split.us
  %indvars.iv25 = phi i64 [ 0, %.lr.ph6.split.us ], [ %indvars.iv.next26, %41 ]
  %42 = phi double [ 0.000000e+00, %.lr.ph6.split.us ], [ %55, %41 ]
  %43 = load double, double* %40, align 8
  %44 = fmul double %43, %2
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv25
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv31
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  store double %50, double* %48, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv31
  %52 = load double, double* %51, align 8
  %53 = load double, double* %45, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %42, %54
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv65
  br i1 %exitcond, label %._crit_edge.us, label %41

._crit_edge.us:                                   ; preds = %41
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv31
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %3
  %59 = load double, double* %40, align 8
  %60 = fmul double %59, %2
  %61 = load double, double* %39, align 8
  %62 = fmul double %60, %61
  %63 = fadd double %58, %62
  %64 = fmul double %55, %2
  %65 = fadd double %63, %64
  store double %65, double* %56, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond64, label %._crit_edge7.loopexit, label %.lr.ph6.split.us

.lr.ph6.split:                                    ; preds = %.lr.ph6.split, %.lr.ph6.split.preheader60
  %indvars.iv = phi i64 [ 0, %.lr.ph6.split.preheader60 ], [ %indvars.iv.next.1, %.lr.ph6.split ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  %67 = bitcast double* %66 to <2 x double>*
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %2
  %71 = load double, double* %12, align 8
  %72 = fmul double %70, %71
  %indvars.iv.next = or i64 %indvars.iv, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next
  %74 = load <2 x double>, <2 x double>* %67, align 8
  %75 = fmul <2 x double> %74, %9
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fadd double %76, %72
  %79 = fadd double %78, %7
  store double %79, double* %66, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv.next
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %2
  %83 = load double, double* %12, align 8
  %84 = fmul double %82, %83
  %85 = fadd double %77, %84
  %86 = fadd double %85, %7
  store double %86, double* %73, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond63.1, label %._crit_edge7.loopexit61, label %.lr.ph6.split, !llvm.loop !14

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit61:                          ; preds = %.lr.ph6.split
  br label %._crit_edge7

._crit_edge7.loopexit62:                          ; preds = %vector.body
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit62, %._crit_edge7.loopexit61, %._crit_edge7.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next66, 1000
  br i1 %exitcond67, label %._crit_edge13, label %.preheader

._crit_edge13:                                    ; preds = %._crit_edge7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next13, %._crit_edge3.us ]
  %7 = mul nuw nsw i64 %indvars.iv12, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %8

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
