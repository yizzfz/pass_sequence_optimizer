; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge25

.._crit_edge_crit_edge25:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge25, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph29.preheader:
  br label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.prol..lr.ph29.prol_crit_edge, %.lr.ph29.preheader
  %indvars.iv36.prol = phi i64 [ %indvars.iv.next37.prol, %.lr.ph29.prol..lr.ph29.prol_crit_edge ], [ 0, %.lr.ph29.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph29.prol..lr.ph29.prol_crit_edge ], [ 4, %.lr.ph29.preheader ]
  %7 = trunc i64 %indvars.iv36.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv36.prol
  store double %8, double* %9, align 8
  %indvars.iv.next37.prol = add nuw nsw i64 %indvars.iv36.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph29.preheader41, label %.lr.ph29.prol..lr.ph29.prol_crit_edge, !llvm.loop !1

.lr.ph29.prol..lr.ph29.prol_crit_edge:            ; preds = %.lr.ph29.prol
  br label %.lr.ph29.prol

.lr.ph29.preheader41:                             ; preds = %.lr.ph29.prol
  br label %.lr.ph29

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %10 = trunc i64 %indvars.iv31 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv
  %18 = add nuw nsw i64 %indvars.iv, 2
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %13, %22
  %24 = fdiv <2 x double> %23, <double 1.000000e+03, double 1.200000e+03>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  store double %25, double* %17, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  store double %26, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv, 3
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = fmul double %11, %30
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv
  store double %32, double* %33, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %14
  br label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %._crit_edge26, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.lr.ph29:                                         ; preds = %.lr.ph29..lr.ph29_crit_edge, %.lr.ph29.preheader41
  %indvars.iv36 = phi i64 [ %indvars.iv.next37.7, %.lr.ph29..lr.ph29_crit_edge ], [ %indvars.iv.next37.prol, %.lr.ph29.preheader41 ]
  %34 = trunc i64 %indvars.iv36 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %6, i64 %indvars.iv36
  %37 = bitcast double* %36 to <2 x double>*
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %38 = trunc i64 %indvars.iv.next37 to i32
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %35, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  store <2 x double> %41, <2 x double>* %37, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %42 = trunc i64 %indvars.iv.next37.1 to i32
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.1
  %45 = bitcast double* %44 to <2 x double>*
  %indvars.iv.next37.2 = add nsw i64 %indvars.iv36, 3
  %46 = trunc i64 %indvars.iv.next37.2 to i32
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %43, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  store <2 x double> %49, <2 x double>* %45, align 8
  %indvars.iv.next37.3 = add nsw i64 %indvars.iv36, 4
  %50 = trunc i64 %indvars.iv.next37.3 to i32
  %51 = sitofp i32 %50 to double
  %52 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.3
  %53 = bitcast double* %52 to <2 x double>*
  %indvars.iv.next37.4 = add nsw i64 %indvars.iv36, 5
  %54 = trunc i64 %indvars.iv.next37.4 to i32
  %55 = sitofp i32 %54 to double
  %56 = insertelement <2 x double> undef, double %51, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  store <2 x double> %57, <2 x double>* %53, align 8
  %indvars.iv.next37.5 = add nsw i64 %indvars.iv36, 6
  %58 = trunc i64 %indvars.iv.next37.5 to i32
  %59 = sitofp i32 %58 to double
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.5
  %61 = bitcast double* %60 to <2 x double>*
  %indvars.iv.next37.6 = add nsw i64 %indvars.iv36, 7
  %62 = trunc i64 %indvars.iv.next37.6 to i32
  %63 = sitofp i32 %62 to double
  %64 = insertelement <2 x double> undef, double %59, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  store <2 x double> %65, <2 x double>* %61, align 8
  %indvars.iv.next37.7 = add nsw i64 %indvars.iv36, 8
  %exitcond39.7 = icmp eq i64 %indvars.iv.next37.7, 500
  br i1 %exitcond39.7, label %.preheader.us.preheader, label %.lr.ph29..lr.ph29_crit_edge

.lr.ph29..lr.ph29_crit_edge:                      ; preds = %.lr.ph29
  br label %.lr.ph29

.preheader.us.preheader:                          ; preds = %.lr.ph29
  br label %.preheader.us

._crit_edge26:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.preheader73.lr.ph:
  %sunkaddr133 = ptrtoint double* %6 to i64
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge86..preheader73_crit_edge, %.preheader73.lr.ph
  %indvars.iv126 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next127, %._crit_edge86..preheader73_crit_edge ]
  %sunkaddr134 = shl i64 %indvars.iv126, 3
  %sunkaddr135 = add i64 %sunkaddr133, %sunkaddr134
  %sunkaddr136 = inttoptr i64 %sunkaddr135 to i64*
  br label %.lr.ph.new

.preheader69.us:                                  ; preds = %._crit_edge.us..preheader69.us_crit_edge, %.preheader69.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us..preheader69.us_crit_edge ], [ 0, %.preheader69.us.preheader ]
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge.us..preheader69.us_crit_edge ], [ 1, %.preheader69.us.preheader ]
  %7 = add i64 %indvar, 1
  %scevgep206 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %8 = add i64 %indvar, 2
  %scevgep208 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %scevgep210 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep212 = getelementptr [1200 x double], [1200 x double]* %5, i64 %8, i64 0
  %9 = add nsw i64 %indvars.iv101, -1
  %bound0214 = icmp ult double* %scevgep206, %scevgep212
  %bound1215 = icmp ult double* %scevgep210, %scevgep208
  %memcheck.conflict217 = and i1 %bound0214, %bound1215
  br i1 %memcheck.conflict217, label %.preheader69.us.new.preheader, label %vector.body201.preheader

vector.body201.preheader:                         ; preds = %.preheader69.us
  br label %vector.body201

.preheader69.us.new.preheader:                    ; preds = %.preheader69.us
  br label %.preheader69.us.new

vector.body201:                                   ; preds = %vector.body201.vector.body201_crit_edge, %vector.body201.preheader
  %index220 = phi i64 [ %index.next221, %vector.body201.vector.body201_crit_edge ], [ 0, %vector.body201.preheader ]
  %offset.idx224 = shl i64 %index220, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv101, i64 %offset.idx224
  %11 = bitcast double* %10 to <4 x double>*
  %wide.vec228 = load <4 x double>, <4 x double>* %11, align 8, !alias.scope !3, !noalias !6
  %strided.vec229 = shufflevector <4 x double> %wide.vec228, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec230 = shufflevector <4 x double> %wide.vec228, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv101, i64 %offset.idx224
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec231 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !6
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %offset.idx224
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec234 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = fsub <4 x double> %wide.vec231, %wide.vec234
  %17 = shufflevector <4 x double> %16, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fsub <2 x double> %strided.vec229, %18
  %20 = or i64 %offset.idx224, 1
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv101, i64 %20
  %22 = fsub <4 x double> %wide.vec231, %wide.vec234
  %23 = shufflevector <4 x double> %22, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %24 = fmul <2 x double> %23, <double 5.000000e-01, double 5.000000e-01>
  %25 = fsub <2 x double> %strided.vec230, %24
  %26 = getelementptr double, double* %21, i64 -1
  %27 = bitcast double* %26 to <4 x double>*
  %interleaved.vec237 = shufflevector <2 x double> %19, <2 x double> %25, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec237, <4 x double>* %27, align 8, !alias.scope !3, !noalias !6
  %index.next221 = add i64 %index220, 2
  %28 = icmp eq i64 %index.next221, 600
  br i1 %28, label %._crit_edge.us.loopexit266, label %vector.body201.vector.body201_crit_edge, !llvm.loop !8

vector.body201.vector.body201_crit_edge:          ; preds = %vector.body201
  br label %vector.body201

.preheader69.us.new:                              ; preds = %.preheader69.us.new..preheader69.us.new_crit_edge, %.preheader69.us.new.preheader
  %indvars.iv93 = phi i64 [ %indvars.iv.next94.1, %.preheader69.us.new..preheader69.us.new_crit_edge ], [ 0, %.preheader69.us.new.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv101, i64 %indvars.iv93
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv101, i64 %indvars.iv93
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv93
  %34 = load double, double* %33, align 8
  %35 = fsub double %32, %34
  %36 = fmul double %35, 5.000000e-01
  %37 = fsub double %30, %36
  store double %37, double* %29, align 8
  %indvars.iv.next94 = or i64 %indvars.iv93, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv101, i64 %indvars.iv.next94
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv101, i64 %indvars.iv.next94
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv.next94
  %43 = load double, double* %42, align 8
  %44 = fsub double %41, %43
  %45 = fmul double %44, 5.000000e-01
  %46 = fsub double %39, %45
  store double %46, double* %38, align 8
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next94.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader69.us.new..preheader69.us.new_crit_edge, !llvm.loop !11

.preheader69.us.new..preheader69.us.new_crit_edge: ; preds = %.preheader69.us.new
  br label %.preheader69.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader69.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit266:                       ; preds = %vector.body201
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit266, %._crit_edge.us.loopexit
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond = icmp eq i64 %indvars.iv.next102, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader68.us.preheader, label %._crit_edge.us..preheader69.us_crit_edge

._crit_edge.us..preheader69.us_crit_edge:         ; preds = %._crit_edge.us
  br label %.preheader69.us

.preheader68.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader68.us

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.preheader73
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new..lr.ph.new_crit_edge ], [ 0, %.preheader73 ]
  %47 = load i64, i64* %sunkaddr136, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %50 = load i64, i64* %sunkaddr136, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %53 = load i64, i64* %sunkaddr136, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %56 = load i64, i64* %sunkaddr136, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %59 = load i64, i64* %sunkaddr136, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %62 = load i64, i64* %sunkaddr136, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %65 = load i64, i64* %sunkaddr136, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %68 = load i64, i64* %sunkaddr136, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader69.us.preheader, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.preheader69.us.preheader:                        ; preds = %.lr.ph.new
  br label %.preheader69.us

.preheader68.us:                                  ; preds = %._crit_edge80.us..preheader68.us_crit_edge, %.preheader68.us.preheader
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %._crit_edge80.us..preheader68.us_crit_edge ], [ 0, %.preheader68.us.preheader ]
  %scevgep173 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv113, i64 2
  %71 = add i64 %indvars.iv113, 1
  %scevgep175 = getelementptr [1200 x double], [1200 x double]* %3, i64 %71, i64 0
  %scevgep177 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 1
  %scevgep179 = getelementptr [1200 x double], [1200 x double]* %5, i64 %71, i64 0
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv113, i64 1
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 1
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 0
  %77 = load double, double* %76, align 8
  %78 = fsub double %75, %77
  %79 = fmul double %78, 5.000000e-01
  %80 = fsub double %73, %79
  store double %80, double* %72, align 8
  %bound0181 = icmp ult double* %scevgep173, %scevgep179
  %bound1182 = icmp ult double* %scevgep177, %scevgep175
  %memcheck.conflict184 = and i1 %bound0181, %bound1182
  br i1 %memcheck.conflict184, label %.preheader68.us..preheader68.us.new.preheader_crit_edge, label %vector.body168.preheader

.preheader68.us..preheader68.us.new.preheader_crit_edge: ; preds = %.preheader68.us
  br label %.preheader68.us.new.preheader

vector.body168.preheader:                         ; preds = %.preheader68.us
  br label %vector.body168

vector.body168:                                   ; preds = %vector.body168.vector.body168_crit_edge, %vector.body168.preheader
  %index187 = phi i64 [ %index.next188, %vector.body168.vector.body168_crit_edge ], [ 0, %vector.body168.preheader ]
  %81 = shl i64 %index187, 1
  %offset.idx = or i64 %81, 2
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv113, i64 %offset.idx
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec194 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 %offset.idx
  %85 = getelementptr double, double* %84, i64 -1
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec195 = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !15
  %strided.vec196 = shufflevector <4 x double> %wide.vec195, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec197 = shufflevector <4 x double> %wide.vec195, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fsub <2 x double> %strided.vec197, %strided.vec196
  %88 = fmul <2 x double> %87, <double 5.000000e-01, double 5.000000e-01>
  %89 = fsub <2 x double> %strided.vec, %88
  %90 = or i64 %81, 3
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv113, i64 %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 %90
  %93 = getelementptr double, double* %92, i64 -1
  %94 = bitcast double* %93 to <4 x double>*
  %wide.vec198 = load <4 x double>, <4 x double>* %94, align 8, !alias.scope !15
  %strided.vec199 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec200 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %95 = fsub <2 x double> %strided.vec200, %strided.vec199
  %96 = fmul <2 x double> %95, <double 5.000000e-01, double 5.000000e-01>
  %97 = fsub <2 x double> %strided.vec194, %96
  %98 = getelementptr double, double* %91, i64 -1
  %99 = bitcast double* %98 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %89, <2 x double> %97, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %99, align 8, !alias.scope !12, !noalias !15
  %index.next188 = add i64 %index187, 2
  %100 = icmp eq i64 %index.next188, 598
  br i1 %100, label %.preheader68.us.new.preheader.loopexit, label %vector.body168.vector.body168_crit_edge, !llvm.loop !17

vector.body168.vector.body168_crit_edge:          ; preds = %vector.body168
  br label %vector.body168

.preheader68.us.new.preheader.loopexit:           ; preds = %vector.body168
  br label %.preheader68.us.new.preheader

.preheader68.us.new.preheader:                    ; preds = %.preheader68.us..preheader68.us.new.preheader_crit_edge, %.preheader68.us.new.preheader.loopexit
  %indvars.iv105.ph = phi i64 [ 2, %.preheader68.us..preheader68.us.new.preheader_crit_edge ], [ 1198, %.preheader68.us.new.preheader.loopexit ]
  br label %.preheader68.us.new

.preheader68.us.new:                              ; preds = %.preheader68.us.new..preheader68.us.new_crit_edge, %.preheader68.us.new.preheader
  %indvars.iv105 = phi i64 [ %indvars.iv.next106.1, %.preheader68.us.new..preheader68.us.new_crit_edge ], [ %indvars.iv105.ph, %.preheader68.us.new.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv113, i64 %indvars.iv105
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 %indvars.iv105
  %104 = load double, double* %103, align 8
  %105 = add nsw i64 %indvars.iv105, -1
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 %105
  %107 = load double, double* %106, align 8
  %108 = fsub double %104, %107
  %109 = fmul double %108, 5.000000e-01
  %110 = fsub double %102, %109
  store double %110, double* %101, align 8
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv113, i64 %indvars.iv.next106
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 %indvars.iv.next106
  %114 = load double, double* %113, align 8
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv113, i64 %indvars.iv105
  %116 = load double, double* %115, align 8
  %117 = fsub double %114, %116
  %118 = fmul double %117, 5.000000e-01
  %119 = fsub double %112, %118
  store double %119, double* %111, align 8
  %indvars.iv.next106.1 = add nsw i64 %indvars.iv105, 2
  %exitcond108.1 = icmp eq i64 %indvars.iv.next106.1, 1200
  br i1 %exitcond108.1, label %._crit_edge80.us, label %.preheader68.us.new..preheader68.us.new_crit_edge, !llvm.loop !18

.preheader68.us.new..preheader68.us.new_crit_edge: ; preds = %.preheader68.us.new
  br label %.preheader68.us.new

._crit_edge80.us:                                 ; preds = %.preheader68.us.new
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, 1000
  br i1 %exitcond116, label %.preheader.us.preheader, label %._crit_edge80.us..preheader68.us_crit_edge

._crit_edge80.us..preheader68.us_crit_edge:       ; preds = %._crit_edge80.us
  br label %.preheader68.us

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge84.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge84.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv122, i64 0
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv122, i64 1199
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv122, i64 0
  %120 = add i64 %indvars.iv122, 1
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %3, i64 %120, i64 0
  %scevgep151 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv122, i64 0
  %scevgep153 = getelementptr [1200 x double], [1200 x double]* %4, i64 %120, i64 1199
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %bound0 = icmp ult double* %scevgep, %scevgep149
  %bound1 = icmp ult double* %scevgep147, %scevgep145
  %found.conflict = and i1 %bound0, %bound1
  %bound0155 = icmp ult double* %scevgep, %scevgep153
  %bound1156 = icmp ult double* %scevgep151, %scevgep145
  %found.conflict157 = and i1 %bound0155, %bound1156
  %conflict.rdx = or i1 %found.conflict, %found.conflict157
  br i1 %conflict.rdx, label %.preheader.us.scalar.ph.preheader_crit_edge, label %vector.body.preheader

.preheader.us.scalar.ph.preheader_crit_edge:      ; preds = %.preheader.us
  br label %scalar.ph.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv122, i64 %index
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !19, !noalias !22
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !19, !noalias !22
  %125 = or i64 %index, 1
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv122, i64 %125
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !25
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !25
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv122, i64 %index
  %131 = bitcast double* %130 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !25
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !25
  %134 = fsub <2 x double> %wide.load160, %wide.load162
  %135 = fsub <2 x double> %wide.load161, %wide.load163
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next123, i64 %index
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !26
  %138 = getelementptr double, double* %136, i64 2
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !26
  %140 = fadd <2 x double> %134, %wide.load164
  %141 = fadd <2 x double> %135, %wide.load165
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv122, i64 %index
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !26
  %144 = getelementptr double, double* %142, i64 2
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !26
  %146 = fsub <2 x double> %140, %wide.load166
  %147 = fsub <2 x double> %141, %wide.load167
  %148 = fmul <2 x double> %146, <double 7.000000e-01, double 7.000000e-01>
  %149 = fmul <2 x double> %147, <double 7.000000e-01, double 7.000000e-01>
  %150 = fsub <2 x double> %wide.load, %148
  %151 = fsub <2 x double> %wide.load159, %149
  %152 = bitcast double* %121 to <2 x double>*
  store <2 x double> %150, <2 x double>* %152, align 8, !alias.scope !19, !noalias !22
  %153 = bitcast double* %123 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %154 = icmp eq i64 %index.next, 1196
  br i1 %154, label %scalar.ph.preheader.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !27

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us.scalar.ph.preheader_crit_edge, %scalar.ph.preheader.loopexit
  %indvars.iv118.ph = phi i64 [ 0, %.preheader.us.scalar.ph.preheader_crit_edge ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv118.ph, %scalar.ph.preheader ]
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv122, i64 %indvars.iv118
  %156 = load double, double* %155, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv122, i64 %indvars.iv.next119
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv122, i64 %indvars.iv118
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next123, i64 %indvars.iv118
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv122, i64 %indvars.iv118
  %166 = load double, double* %165, align 8
  %167 = fsub double %164, %166
  %168 = fmul double %167, 7.000000e-01
  %169 = fsub double %156, %168
  store double %169, double* %155, align 8
  %exitcond121 = icmp eq i64 %indvars.iv.next119, 1199
  br i1 %exitcond121, label %._crit_edge84.us, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !28

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge84.us:                                 ; preds = %scalar.ph
  %exitcond125 = icmp eq i64 %indvars.iv.next123, 999
  br i1 %exitcond125, label %._crit_edge86, label %._crit_edge84.us..preheader.us_crit_edge

._crit_edge84.us..preheader.us_crit_edge:         ; preds = %._crit_edge84.us
  br label %.preheader.us

._crit_edge86:                                    ; preds = %._crit_edge84.us
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next127, 500
  br i1 %exitcond129, label %._crit_edge89, label %._crit_edge86..preheader73_crit_edge

._crit_edge86..preheader73_crit_edge:             ; preds = %._crit_edge86
  br label %.preheader73

._crit_edge89:                                    ; preds = %._crit_edge86
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader43.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader43.us

.preheader43.us:                                  ; preds = %._crit_edge57.us..preheader43.us_crit_edge, %.preheader43.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader43.us.preheader ], [ %indvars.iv.next83, %._crit_edge57.us..preheader43.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv82, 1000
  br label %10

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge, %.preheader43.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us._crit_edge ], [ 0, %.preheader43.us ]
  %11 = add nsw i64 %indvars.iv78, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %10
  br label %._crit_edge.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc13.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv78
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, 1200
  br i1 %exitcond81, label %._crit_edge57.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %10

._crit_edge57.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, 1000
  br i1 %exitcond85, label %._crit_edge60, label %._crit_edge57.us..preheader43.us_crit_edge

._crit_edge57.us..preheader43.us_crit_edge:       ; preds = %._crit_edge57.us
  br label %.preheader43.us

._crit_edge60:                                    ; preds = %._crit_edge57.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #4
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader42.us

.preheader42.us:                                  ; preds = %._crit_edge51.us..preheader42.us_crit_edge, %._crit_edge60
  %indvars.iv73 = phi i64 [ 0, %._crit_edge60 ], [ %indvars.iv.next74, %._crit_edge51.us..preheader42.us_crit_edge ]
  %27 = mul nsw i64 %indvars.iv73, 1000
  br label %28

; <label>:28:                                     ; preds = %._crit_edge1.us._crit_edge, %.preheader42.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge1.us._crit_edge ], [ 0, %.preheader42.us ]
  %29 = add nsw i64 %indvars.iv69, %27
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %.._crit_edge1.us_crit_edge

.._crit_edge1.us_crit_edge:                       ; preds = %28
  br label %._crit_edge1.us

; <label>:33:                                     ; preds = %28
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc10.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #4
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %.._crit_edge1.us_crit_edge, %33
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv69
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #5
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond72, label %._crit_edge51.us, label %._crit_edge1.us._crit_edge

._crit_edge1.us._crit_edge:                       ; preds = %._crit_edge1.us
  br label %28

._crit_edge51.us:                                 ; preds = %._crit_edge1.us
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1000
  br i1 %exitcond76, label %._crit_edge54, label %._crit_edge51.us..preheader42.us_crit_edge

._crit_edge51.us..preheader42.us_crit_edge:       ; preds = %._crit_edge51.us
  br label %.preheader42.us

._crit_edge54:                                    ; preds = %._crit_edge51.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge45.us..preheader.us_crit_edge, %._crit_edge54
  %indvars.iv64 = phi i64 [ 0, %._crit_edge54 ], [ %indvars.iv.next65, %._crit_edge45.us..preheader.us_crit_edge ]
  %43 = mul nsw i64 %indvars.iv64, 1000
  br label %44

; <label>:44:                                     ; preds = %._crit_edge2.us._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us._crit_edge ], [ 0, %.preheader.us ]
  %45 = add nsw i64 %indvars.iv, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %.._crit_edge2.us_crit_edge

.._crit_edge2.us_crit_edge:                       ; preds = %44
  br label %._crit_edge2.us

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %.._crit_edge2.us_crit_edge, %49
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %53) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge45.us, label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us
  br label %44

._crit_edge45.us:                                 ; preds = %._crit_edge2.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond67, label %._crit_edge48, label %._crit_edge45.us..preheader.us_crit_edge

._crit_edge45.us..preheader.us_crit_edge:         ; preds = %._crit_edge45.us
  br label %.preheader.us

._crit_edge48:                                    ; preds = %._crit_edge45.us
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
!25 = !{!23}
!26 = !{!24}
!27 = distinct !{!27, !9, !10}
!28 = distinct !{!28, !9, !10}
