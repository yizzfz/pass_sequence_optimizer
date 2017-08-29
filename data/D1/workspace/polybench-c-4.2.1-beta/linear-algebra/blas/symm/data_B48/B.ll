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
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %17
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
._crit_edge.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge20.us.._crit_edge.us_crit_edge, %._crit_edge.lr.ph
  %indvars.iv42 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next43, %._crit_edge20.us.._crit_edge.us_crit_edge ]
  %7 = add i64 %indvars.iv42, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %._crit_edge.us
  %indvars.iv40 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next41, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv40, %indvars.iv42
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
  %22 = icmp slt i64 %indvars.iv.next41, 1200
  br i1 %22, label %._crit_edge, label %._crit_edge20.us

._crit_edge:                                      ; preds = %9
  br label %9

._crit_edge20.us:                                 ; preds = %9
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, 1
  %23 = icmp slt i64 %indvars.iv.next43, 1000
  br i1 %23, label %._crit_edge20.us.._crit_edge.us_crit_edge, label %._crit_edge6.preheader

._crit_edge20.us.._crit_edge.us_crit_edge:        ; preds = %._crit_edge20.us
  br label %._crit_edge.us

._crit_edge6.preheader:                           ; preds = %._crit_edge20.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge12.._crit_edge6_crit_edge, %._crit_edge6.preheader
  %indvar = phi i32 [ %indvar.next, %._crit_edge12.._crit_edge6_crit_edge ], [ 0, %._crit_edge6.preheader ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge12.._crit_edge6_crit_edge ], [ 0, %._crit_edge6.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge12.._crit_edge6_crit_edge ], [ 1, %._crit_edge6.preheader ]
  %indvars.iv31 = phi i32 [ %indvars.iv.next32, %._crit_edge12.._crit_edge6_crit_edge ], [ 1, %._crit_edge6.preheader ]
  %24 = sub i32 1007, %indvar
  %25 = sub i32 998, %indvar
  %26 = icmp slt i64 %indvars.iv38, 0
  br i1 %26, label %._crit_edge6.._crit_edge7_crit_edge, label %.lr.ph

._crit_edge6.._crit_edge7_crit_edge:              ; preds = %._crit_edge6
  br label %._crit_edge7

.lr.ph:                                           ; preds = %._crit_edge6
  %27 = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %27, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.lr.ph..prol.loopexit_crit_edge

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %28 = trunc i64 %indvars.iv38 to i32
  %29 = srem i32 %28, 100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 0
  store double %31, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %33 = icmp eq i32 %indvar, 0
  br i1 %33, label %.prol.loopexit.._crit_edge7_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge7_crit_edge:            ; preds = %.prol.loopexit
  br label %._crit_edge7

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv31 to i64
  br label %.lr.ph.new

._crit_edge7.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.prol.loopexit.._crit_edge7_crit_edge, %._crit_edge6.._crit_edge7_crit_edge, %._crit_edge7.loopexit
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  %34 = icmp slt i64 %indvars.iv.next39, 1000
  br i1 %34, label %.lr.ph11, label %._crit_edge7.._crit_edge12_crit_edge

._crit_edge7.._crit_edge12_crit_edge:             ; preds = %._crit_edge7
  br label %._crit_edge12

.lr.ph11:                                         ; preds = %._crit_edge7
  %xtraiter46 = and i32 %24, 7
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.lr.ph11..prol.loopexit45_crit_edge, label %.prol.preheader44.preheader

.lr.ph11..prol.loopexit45_crit_edge:              ; preds = %.lr.ph11
  br label %.prol.loopexit45

.prol.preheader44.preheader:                      ; preds = %.lr.ph11
  br label %.prol.preheader44

.prol.preheader44:                                ; preds = %.prol.preheader44..prol.preheader44_crit_edge, %.prol.preheader44.preheader
  %indvars.iv35.prol = phi i64 [ %indvars.iv.next36.prol, %.prol.preheader44..prol.preheader44_crit_edge ], [ %indvars.iv33, %.prol.preheader44.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader44..prol.preheader44_crit_edge ], [ %xtraiter46, %.prol.preheader44.preheader ]
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv35.prol
  store double -9.990000e+02, double* %35, align 8
  %indvars.iv.next36.prol = add nsw i64 %indvars.iv35.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit45.loopexit, label %.prol.preheader44..prol.preheader44_crit_edge, !llvm.loop !1

.prol.preheader44..prol.preheader44_crit_edge:    ; preds = %.prol.preheader44
  br label %.prol.preheader44

.prol.loopexit45.loopexit:                        ; preds = %.prol.preheader44
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.lr.ph11..prol.loopexit45_crit_edge, %.prol.loopexit45.loopexit
  %indvars.iv35.unr = phi i64 [ %indvars.iv33, %.lr.ph11..prol.loopexit45_crit_edge ], [ %indvars.iv.next36.prol, %.prol.loopexit45.loopexit ]
  %36 = icmp ult i32 %25, 7
  br i1 %36, label %.prol.loopexit45.._crit_edge12_crit_edge, label %.lr.ph11.new.preheader

.prol.loopexit45.._crit_edge12_crit_edge:         ; preds = %.prol.loopexit45
  br label %._crit_edge12

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit45
  br label %.lr.ph11.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %37 = add nsw i64 %indvars.iv, %indvars.iv38
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = add nsw i64 %indvars.iv.next, %indvars.iv38
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 1.000000e+03
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %47, double* %48, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge7.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new..lr.ph11.new_crit_edge, %.lr.ph11.new.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.7, %.lr.ph11.new..lr.ph11.new_crit_edge ], [ %indvars.iv35.unr, %.lr.ph11.new.preheader ]
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv35
  store double -9.990000e+02, double* %49, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36
  store double -9.990000e+02, double* %50, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.1
  store double -9.990000e+02, double* %51, align 8
  %indvars.iv.next36.2 = add nsw i64 %indvars.iv35, 3
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.2
  store double -9.990000e+02, double* %52, align 8
  %indvars.iv.next36.3 = add nsw i64 %indvars.iv35, 4
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.3
  store double -9.990000e+02, double* %53, align 8
  %indvars.iv.next36.4 = add nsw i64 %indvars.iv35, 5
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.4
  store double -9.990000e+02, double* %54, align 8
  %indvars.iv.next36.5 = add nsw i64 %indvars.iv35, 6
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.5
  store double -9.990000e+02, double* %55, align 8
  %indvars.iv.next36.6 = add nsw i64 %indvars.iv35, 7
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next36.6
  store double -9.990000e+02, double* %56, align 8
  %indvars.iv.next36.7 = add nsw i64 %indvars.iv35, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next36.7 to i32
  %exitcond37.7 = icmp eq i32 %lftr.wideiv.7, 1000
  br i1 %exitcond37.7, label %._crit_edge12.loopexit, label %.lr.ph11.new..lr.ph11.new_crit_edge

.lr.ph11.new..lr.ph11.new_crit_edge:              ; preds = %.lr.ph11.new
  br label %.lr.ph11.new

._crit_edge12.loopexit:                           ; preds = %.lr.ph11.new
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.prol.loopexit45.._crit_edge12_crit_edge, %._crit_edge7.._crit_edge12_crit_edge, %._crit_edge12.loopexit
  %indvars.iv.next32 = add i32 %indvars.iv31, 1
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %34, label %._crit_edge12.._crit_edge6_crit_edge, label %._crit_edge15

._crit_edge12.._crit_edge6_crit_edge:             ; preds = %._crit_edge12
  br label %._crit_edge6

._crit_edge15:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
._crit_edge.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert55 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat56 = shufflevector <2 x double> %broadcast.splatinsert55, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert61 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat62 = shufflevector <2 x double> %broadcast.splatinsert61, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8.._crit_edge_crit_edge, %._crit_edge.lr.ph
  %indvars.iv37 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next38, %._crit_edge8.._crit_edge_crit_edge ]
  %indvars.iv35 = phi i32 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next36, %._crit_edge8.._crit_edge_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %8 = add i64 %indvars.iv37, 1
  %scevgep43 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv37, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv37
  br i1 %9, label %.lr.ph7.split.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge
  %scevgep47 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep45 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep47
  %bound1 = icmp ult double* %scevgep45, %scevgep43
  %found.conflict = and i1 %bound0, %bound1
  %bound050 = icmp ult double* %scevgep, %10
  %bound151 = icmp ult double* %10, %scevgep43
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx = or i1 %found.conflict, %found.conflict52
  br i1 %conflict.rdx, label %.lr.ph7.split.preheader, label %vector.ph

.lr.ph7.split.preheader:                          ; preds = %vector.memcheck
  br label %.lr.ph7.split

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !3, !noalias !6
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !3, !noalias !6
  %15 = fmul <2 x double> %broadcast.splat56, %wide.load
  %16 = fmul <2 x double> %broadcast.splat56, %wide.load54
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !9
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !9
  %21 = fmul <2 x double> %broadcast.splat60, %wide.load57
  %22 = fmul <2 x double> %broadcast.splat60, %wide.load58
  %23 = load double, double* %10, align 8, !alias.scope !10
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %30, %broadcast.splat62
  %33 = fadd <2 x double> %31, %broadcast.splat62
  %34 = bitcast double* %11 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !3, !noalias !6
  %35 = bitcast double* %13 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge8.loopexit64, label %vector.body.vector.body_crit_edge, !llvm.loop !11

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge
  %wide.trip.count = zext i32 %indvars.iv35 to i64
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %._crit_edge4.us..lr.ph7.split.us_crit_edge, %.lr.ph7.split.us.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge4.us..lr.ph7.split.us_crit_edge ], [ 0, %.lr.ph7.split.us.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv33
  br label %38

; <label>:38:                                     ; preds = %._crit_edge65, %.lr.ph7.split.us
  %indvars.iv27 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next28, %._crit_edge65 ]
  %39 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %52, %._crit_edge65 ]
  %40 = load double, double* %37, align 8
  %41 = fmul double %40, %2
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv27
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv33
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  store double %47, double* %45, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv27, i64 %indvars.iv33
  %49 = load double, double* %48, align 8
  %50 = load double, double* %42, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %39, %51
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %._crit_edge65

._crit_edge65:                                    ; preds = %38
  br label %38

._crit_edge4.us:                                  ; preds = %38
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv33
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = load double, double* %37, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %10, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %55, %59
  %61 = fmul double %52, %2
  %62 = fadd double %60, %61
  store double %62, double* %53, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %63 = icmp slt i64 %indvars.iv.next34, 1200
  br i1 %63, label %._crit_edge4.us..lr.ph7.split.us_crit_edge, label %._crit_edge8.loopexit

._crit_edge4.us..lr.ph7.split.us_crit_edge:       ; preds = %._crit_edge4.us
  br label %.lr.ph7.split.us

.lr.ph7.split:                                    ; preds = %.lr.ph7.split..lr.ph7.split_crit_edge, %.lr.ph7.split.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.preheader ], [ %indvars.iv.next.1, %.lr.ph7.split..lr.ph7.split_crit_edge ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %2
  %70 = load double, double* %10, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %66, %71
  %73 = fadd double %72, %7
  store double %73, double* %64, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv.next
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %2
  %80 = load double, double* %10, align 8
  %81 = fmul double %79, %80
  %82 = fadd double %76, %81
  %83 = fadd double %82, %7
  store double %83, double* %74, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %84 = icmp slt i64 %indvars.iv.next.1, 1200
  br i1 %84, label %.lr.ph7.split..lr.ph7.split_crit_edge, label %._crit_edge8.loopexit63, !llvm.loop !14

.lr.ph7.split..lr.ph7.split_crit_edge:            ; preds = %.lr.ph7.split
  br label %.lr.ph7.split

._crit_edge8.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge8

._crit_edge8.loopexit63:                          ; preds = %.lr.ph7.split
  br label %._crit_edge8

._crit_edge8.loopexit64:                          ; preds = %vector.body
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit64, %._crit_edge8.loopexit63, %._crit_edge8.loopexit
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %indvars.iv.next36 = add i32 %indvars.iv35, 1
  %85 = icmp slt i64 %indvars.iv.next38, 1000
  br i1 %85, label %._crit_edge8.._crit_edge_crit_edge, label %._crit_edge14

._crit_edge8.._crit_edge_crit_edge:               ; preds = %._crit_edge8
  br label %._crit_edge

._crit_edge14:                                    ; preds = %._crit_edge8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
._crit_edge.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us.._crit_edge.us_crit_edge, %._crit_edge.lr.ph
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge3.us.._crit_edge.us_crit_edge ], [ 0, %._crit_edge.lr.ph ]
  %7 = mul nsw i64 %indvars.iv11, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2.us._crit_edge, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us._crit_edge ]
  %9 = add nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.._crit_edge2.us_crit_edge

.._crit_edge2.us_crit_edge:                       ; preds = %8
  br label %._crit_edge2.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %.._crit_edge2.us_crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us
  br label %8

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %19 = icmp slt i64 %indvars.iv.next12, 1000
  br i1 %19, label %._crit_edge3.us.._crit_edge.us_crit_edge, label %._crit_edge5

._crit_edge3.us.._crit_edge.us_crit_edge:         ; preds = %._crit_edge3.us
  br label %._crit_edge.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
