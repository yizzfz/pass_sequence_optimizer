; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge24

._crit_edge24:                                    ; preds = %12
  br label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %._crit_edge24, %._crit_edge, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
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
  br i1 %prol.iter.cmp, label %.lr.ph29.prol..lr.ph29_crit_edge, label %.lr.ph29.prol..lr.ph29.prol_crit_edge, !llvm.loop !1

.lr.ph29.prol..lr.ph29.prol_crit_edge:            ; preds = %.lr.ph29.prol
  br label %.lr.ph29.prol

.lr.ph29.prol..lr.ph29_crit_edge:                 ; preds = %.lr.ph29.prol
  br label %.lr.ph29

.preheader.us:                                    ; preds = %.lr.ph29..preheader.us_crit_edge, %._crit_edge.us..preheader.us_crit_edge
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.lr.ph29..preheader.us_crit_edge ]
  %10 = trunc i64 %indvars.iv31 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
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

.lr.ph29:                                         ; preds = %.lr.ph29..lr.ph29_crit_edge, %.lr.ph29.prol..lr.ph29_crit_edge
  %indvars.iv36 = phi i64 [ %indvars.iv.next37.7, %.lr.ph29..lr.ph29_crit_edge ], [ %indvars.iv.next37.prol, %.lr.ph29.prol..lr.ph29_crit_edge ]
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
  br i1 %exitcond39.7, label %.lr.ph29..preheader.us_crit_edge, label %.lr.ph29..lr.ph29_crit_edge

.lr.ph29..lr.ph29_crit_edge:                      ; preds = %.lr.ph29
  br label %.lr.ph29

.lr.ph29..preheader.us_crit_edge:                 ; preds = %.lr.ph29
  br label %.preheader.us

._crit_edge26:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader73.lr.ph:
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge86..preheader73_crit_edge, %.preheader73.lr.ph
  %indvars.iv125 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next126, %._crit_edge86..preheader73_crit_edge ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv125
  %8 = bitcast double* %7 to i64*
  br label %.lr.ph.new

.preheader69.us:                                  ; preds = %.lr.ph.new..preheader69.us_crit_edge, %._crit_edge.us..preheader69.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us..preheader69.us_crit_edge ], [ 0, %.lr.ph.new..preheader69.us_crit_edge ]
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge.us..preheader69.us_crit_edge ], [ 1, %.lr.ph.new..preheader69.us_crit_edge ]
  %9 = add i64 %indvar, 1
  %10 = add nsw i64 %indvars.iv100, -1
  %scevgep207 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %scevgep210 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 1200
  %scevgep213 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep216 = getelementptr [1200 x double], [1200 x double]* %5, i64 %9, i64 1200
  %bound0218 = icmp ult double* %scevgep207, %scevgep216
  %bound1219 = icmp ult double* %scevgep213, %scevgep210
  %memcheck.conflict221 = and i1 %bound0218, %bound1219
  br i1 %memcheck.conflict221, label %.preheader69.us..preheader69.us.new_crit_edge, label %.preheader69.us.vector.body197_crit_edge

.preheader69.us.vector.body197_crit_edge:         ; preds = %.preheader69.us
  br label %vector.body197

.preheader69.us..preheader69.us.new_crit_edge:    ; preds = %.preheader69.us
  br label %.preheader69.us.new.preheader

vector.body197:                                   ; preds = %vector.body197.vector.body197_crit_edge, %.preheader69.us.vector.body197_crit_edge
  %index224 = phi i64 [ %index.next225, %vector.body197.vector.body197_crit_edge ], [ 0, %.preheader69.us.vector.body197_crit_edge ]
  %11 = shl i64 %index224, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec233 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec234 = shufflevector <4 x double> %wide.vec233, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec235 = shufflevector <4 x double> %wide.vec233, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec236 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec239 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec236, %wide.vec239
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec234, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %22
  %24 = fsub <4 x double> %wide.vec236, %wide.vec239
  %25 = shufflevector <4 x double> %24, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %27 = fsub <2 x double> %strided.vec235, %26
  %28 = getelementptr double, double* %23, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %interleaved.vec242 = shufflevector <2 x double> %21, <2 x double> %27, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec242, <4 x double>* %29, align 8, !alias.scope !3, !noalias !6
  %index.next225 = add i64 %index224, 2
  %30 = icmp eq i64 %index.next225, 600
  br i1 %30, label %middle.block198, label %vector.body197.vector.body197_crit_edge, !llvm.loop !8

vector.body197.vector.body197_crit_edge:          ; preds = %vector.body197
  br label %vector.body197

middle.block198:                                  ; preds = %vector.body197
  br i1 true, label %middle.block198.._crit_edge.us_crit_edge, label %middle.block198..preheader69.us.new_crit_edge

middle.block198..preheader69.us.new_crit_edge:    ; preds = %middle.block198
  br label %.preheader69.us.new.preheader

.preheader69.us.new.preheader:                    ; preds = %.preheader69.us..preheader69.us.new_crit_edge, %middle.block198..preheader69.us.new_crit_edge
  %indvars.iv92.ph = phi i64 [ 0, %.preheader69.us..preheader69.us.new_crit_edge ], [ 1200, %middle.block198..preheader69.us.new_crit_edge ]
  br label %.preheader69.us.new

middle.block198.._crit_edge.us_crit_edge:         ; preds = %middle.block198
  br label %._crit_edge.us

.preheader69.us.new:                              ; preds = %.preheader69.us.new.preheader, %.preheader69.us.new..preheader69.us.new_crit_edge
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.preheader69.us.new..preheader69.us.new_crit_edge ], [ %indvars.iv92.ph, %.preheader69.us.new.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv92
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %indvars.iv92
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv92
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv.next93
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %indvars.iv.next93
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next93
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, 1200
  br i1 %exitcond.1, label %.preheader69.us.new.._crit_edge.us_crit_edge, label %.preheader69.us.new..preheader69.us.new_crit_edge, !llvm.loop !11

.preheader69.us.new..preheader69.us.new_crit_edge: ; preds = %.preheader69.us.new
  br label %.preheader69.us.new

.preheader69.us.new.._crit_edge.us_crit_edge:     ; preds = %.preheader69.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.preheader69.us.new.._crit_edge.us_crit_edge, %middle.block198.._crit_edge.us_crit_edge
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond = icmp eq i64 %indvars.iv.next101, 1000
  br i1 %exitcond, label %._crit_edge.us..preheader68.us_crit_edge, label %._crit_edge.us..preheader69.us_crit_edge

._crit_edge.us..preheader69.us_crit_edge:         ; preds = %._crit_edge.us
  %indvar.next = add i64 %indvar, 1
  br label %.preheader69.us

._crit_edge.us..preheader68.us_crit_edge:         ; preds = %._crit_edge.us
  br label %.preheader68.us

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.preheader73
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new..lr.ph.new_crit_edge ], [ 0, %.preheader73 ]
  %49 = load i64, i64* %8, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %52 = load i64, i64* %8, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %55 = load i64, i64* %8, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %58 = load i64, i64* %8, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %61 = load i64, i64* %8, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %64 = load i64, i64* %8, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %67 = load i64, i64* %8, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %70 = load i64, i64* %8, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.lr.ph.new..preheader69.us_crit_edge, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph.new..preheader69.us_crit_edge:             ; preds = %.lr.ph.new
  br label %.preheader69.us

.preheader68.us:                                  ; preds = %._crit_edge80.us..preheader68.us_crit_edge, %._crit_edge.us..preheader68.us_crit_edge
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge80.us..preheader68.us_crit_edge ], [ 0, %._crit_edge.us..preheader68.us_crit_edge ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 0
  %78 = load double, double* %77, align 8
  %79 = fsub double %76, %78
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double %74, %80
  store double %81, double* %73, align 8
  %scevgep166 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 2
  %scevgep169 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 1200
  %scevgep172 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 1
  %scevgep175 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 1200
  %bound0177 = icmp ult double* %scevgep166, %scevgep175
  %bound1178 = icmp ult double* %scevgep172, %scevgep169
  %memcheck.conflict180 = and i1 %bound0177, %bound1178
  br i1 %memcheck.conflict180, label %.preheader68.us..preheader68.us.new_crit_edge, label %.preheader68.us.vector.body160_crit_edge

.preheader68.us.vector.body160_crit_edge:         ; preds = %.preheader68.us
  br label %vector.body160

.preheader68.us..preheader68.us.new_crit_edge:    ; preds = %.preheader68.us
  br label %.preheader68.us.new.preheader

vector.body160:                                   ; preds = %vector.body160.vector.body160_crit_edge, %.preheader68.us.vector.body160_crit_edge
  %index183 = phi i64 [ %index.next184, %vector.body160.vector.body160_crit_edge ], [ 0, %.preheader68.us.vector.body160_crit_edge ]
  %82 = shl i64 %index183, 1
  %offset.idx = or i64 %82, 2
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec190 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %offset.idx
  %86 = getelementptr double, double* %85, i64 -1
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec191 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !15
  %strided.vec192 = shufflevector <4 x double> %wide.vec191, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec193 = shufflevector <4 x double> %wide.vec191, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fsub <2 x double> %strided.vec193, %strided.vec192
  %89 = fmul <2 x double> %88, <double 5.000000e-01, double 5.000000e-01>
  %90 = fsub <2 x double> %strided.vec, %89
  %91 = or i64 %82, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %91
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec194 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !15
  %strided.vec195 = shufflevector <4 x double> %wide.vec194, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec196 = shufflevector <4 x double> %wide.vec194, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fsub <2 x double> %strided.vec196, %strided.vec195
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fsub <2 x double> %strided.vec190, %97
  %99 = getelementptr double, double* %92, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %98, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8, !alias.scope !12, !noalias !15
  %index.next184 = add i64 %index183, 2
  %101 = icmp eq i64 %index.next184, 598
  br i1 %101, label %middle.block161, label %vector.body160.vector.body160_crit_edge, !llvm.loop !17

vector.body160.vector.body160_crit_edge:          ; preds = %vector.body160
  br label %vector.body160

middle.block161:                                  ; preds = %vector.body160
  br i1 false, label %middle.block161.._crit_edge80.us_crit_edge, label %middle.block161..preheader68.us.new_crit_edge

middle.block161..preheader68.us.new_crit_edge:    ; preds = %middle.block161
  br label %.preheader68.us.new.preheader

.preheader68.us.new.preheader:                    ; preds = %.preheader68.us..preheader68.us.new_crit_edge, %middle.block161..preheader68.us.new_crit_edge
  %indvars.iv104.ph = phi i64 [ 2, %.preheader68.us..preheader68.us.new_crit_edge ], [ 1198, %middle.block161..preheader68.us.new_crit_edge ]
  br label %.preheader68.us.new

middle.block161.._crit_edge80.us_crit_edge:       ; preds = %middle.block161
  br label %._crit_edge80.us

.preheader68.us.new:                              ; preds = %.preheader68.us.new.preheader, %.preheader68.us.new..preheader68.us.new_crit_edge
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.preheader68.us.new..preheader68.us.new_crit_edge ], [ %indvars.iv104.ph, %.preheader68.us.new.preheader ]
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %indvars.iv104
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv104
  %105 = load double, double* %104, align 8
  %106 = add nsw i64 %indvars.iv104, -1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fsub double %105, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %103, %110
  store double %111, double* %102, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %indvars.iv.next105
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv.next105
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv104
  %117 = load double, double* %116, align 8
  %118 = fsub double %115, %117
  %119 = fmul double %118, 5.000000e-01
  %120 = fsub double %113, %119
  store double %120, double* %112, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next105.1, 1200
  br i1 %exitcond107.1, label %.preheader68.us.new.._crit_edge80.us_crit_edge, label %.preheader68.us.new..preheader68.us.new_crit_edge, !llvm.loop !18

.preheader68.us.new..preheader68.us.new_crit_edge: ; preds = %.preheader68.us.new
  br label %.preheader68.us.new

.preheader68.us.new.._crit_edge80.us_crit_edge:   ; preds = %.preheader68.us.new
  br label %._crit_edge80.us

._crit_edge80.us:                                 ; preds = %.preheader68.us.new.._crit_edge80.us_crit_edge, %middle.block161.._crit_edge80.us_crit_edge
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 1000
  br i1 %exitcond115, label %._crit_edge80.us..preheader.us_crit_edge, label %._crit_edge80.us..preheader68.us_crit_edge

._crit_edge80.us..preheader68.us_crit_edge:       ; preds = %._crit_edge80.us
  br label %.preheader68.us

._crit_edge80.us..preheader.us_crit_edge:         ; preds = %._crit_edge80.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge84.us..preheader.us_crit_edge, %._crit_edge80.us..preheader.us_crit_edge
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge84.us..preheader.us_crit_edge ], [ 0, %._crit_edge80.us..preheader.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 0
  %scevgep137 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 1199
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 0
  %121 = add i64 %indvars.iv121, 1
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %3, i64 %121, i64 0
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv121, i64 0
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %4, i64 %121, i64 1199
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %bound0 = icmp ult double* %scevgep, %scevgep141
  %bound1 = icmp ult double* %scevgep139, %scevgep137
  %found.conflict = and i1 %bound0, %bound1
  %bound0147 = icmp ult double* %scevgep, %scevgep145
  %bound1148 = icmp ult double* %scevgep143, %scevgep137
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  br i1 %conflict.rdx, label %.preheader.us.scalar.ph_crit_edge, label %.preheader.us.vector.body_crit_edge

.preheader.us.vector.body_crit_edge:              ; preds = %.preheader.us
  br label %vector.body

.preheader.us.scalar.ph_crit_edge:                ; preds = %.preheader.us
  br label %scalar.ph.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %.preheader.us.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %.preheader.us.vector.body_crit_edge ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 %index
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !19, !noalias !22
  %126 = or i64 %index, 1
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %126
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !25
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !25
  %135 = fsub <2 x double> %wide.load152, %wide.load154
  %136 = fsub <2 x double> %wide.load153, %wide.load155
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next122, i64 %index
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !26
  %141 = fadd <2 x double> %135, %wide.load156
  %142 = fadd <2 x double> %136, %wide.load157
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv121, i64 %index
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !26
  %145 = getelementptr double, double* %143, i64 2
  %146 = bitcast double* %145 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %146, align 8, !alias.scope !26
  %147 = fsub <2 x double> %141, %wide.load158
  %148 = fsub <2 x double> %142, %wide.load159
  %149 = fmul <2 x double> %147, <double 7.000000e-01, double 7.000000e-01>
  %150 = fmul <2 x double> %148, <double 7.000000e-01, double 7.000000e-01>
  %151 = fsub <2 x double> %wide.load, %149
  %152 = fsub <2 x double> %wide.load151, %150
  %153 = bitcast double* %122 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !19, !noalias !22
  %154 = bitcast double* %124 to <2 x double>*
  store <2 x double> %152, <2 x double>* %154, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %155 = icmp eq i64 %index.next, 1196
  br i1 %155, label %vector.body.scalar.ph_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !27

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body.scalar.ph_crit_edge:                  ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us.scalar.ph_crit_edge, %vector.body.scalar.ph_crit_edge
  %indvars.iv117.ph = phi i64 [ 1196, %vector.body.scalar.ph_crit_edge ], [ 0, %.preheader.us.scalar.ph_crit_edge ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph.scalar.ph_crit_edge
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv117.ph, %scalar.ph.preheader ]
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 %indvars.iv117
  %157 = load double, double* %156, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv.next118
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv117
  %161 = load double, double* %160, align 8
  %162 = fsub double %159, %161
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next122, i64 %indvars.iv117
  %164 = load double, double* %163, align 8
  %165 = fadd double %162, %164
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv121, i64 %indvars.iv117
  %167 = load double, double* %166, align 8
  %168 = fsub double %165, %167
  %169 = fmul double %168, 7.000000e-01
  %170 = fsub double %157, %169
  store double %170, double* %156, align 8
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 1199
  br i1 %exitcond120, label %._crit_edge84.us, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !28

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge84.us:                                 ; preds = %scalar.ph
  %exitcond124 = icmp eq i64 %indvars.iv.next122, 999
  br i1 %exitcond124, label %._crit_edge86, label %._crit_edge84.us..preheader.us_crit_edge

._crit_edge84.us..preheader.us_crit_edge:         ; preds = %._crit_edge84.us
  br label %.preheader.us

._crit_edge86:                                    ; preds = %._crit_edge84.us
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 500
  br i1 %exitcond128, label %._crit_edge88, label %._crit_edge86..preheader73_crit_edge

._crit_edge86..preheader73_crit_edge:             ; preds = %._crit_edge86
  br label %.preheader73

._crit_edge88:                                    ; preds = %._crit_edge86
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader41.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge52.us..preheader41.us_crit_edge, %.preheader41.us.preheader
  %indvars.iv76 = phi i64 [ 0, %.preheader41.us.preheader ], [ %indvars.iv.next77, %._crit_edge52.us..preheader41.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv76, 1000
  br label %10

; <label>:10:                                     ; preds = %._crit_edge83, %.preheader41.us
  %indvars.iv72 = phi i64 [ 0, %.preheader41.us ], [ %indvars.iv.next73, %._crit_edge83 ]
  %11 = add nsw i64 %indvars.iv72, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %10
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %15
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv76, i64 %indvars.iv72
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond75, label %._crit_edge52.us, label %._crit_edge83

._crit_edge83:                                    ; preds = %17
  br label %10

._crit_edge52.us:                                 ; preds = %17
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, 1000
  br i1 %exitcond79, label %._crit_edge54, label %._crit_edge52.us..preheader41.us_crit_edge

._crit_edge52.us..preheader41.us_crit_edge:       ; preds = %._crit_edge52.us
  br label %.preheader41.us

._crit_edge54:                                    ; preds = %._crit_edge52.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge47.us..preheader40.us_crit_edge, %._crit_edge54
  %indvars.iv67 = phi i64 [ 0, %._crit_edge54 ], [ %indvars.iv.next68, %._crit_edge47.us..preheader40.us_crit_edge ]
  %28 = mul nsw i64 %indvars.iv67, 1000
  br label %29

; <label>:29:                                     ; preds = %._crit_edge85, %.preheader40.us
  %indvars.iv63 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next64, %._crit_edge85 ]
  %30 = add nsw i64 %indvars.iv63, %28
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %._crit_edge84

._crit_edge84:                                    ; preds = %29
  br label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #4
  br label %36

; <label>:36:                                     ; preds = %._crit_edge84, %34
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv67, i64 %indvars.iv63
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #5
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond66, label %._crit_edge47.us, label %._crit_edge85

._crit_edge85:                                    ; preds = %36
  br label %29

._crit_edge47.us:                                 ; preds = %36
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond70, label %._crit_edge49, label %._crit_edge47.us..preheader40.us_crit_edge

._crit_edge47.us..preheader40.us_crit_edge:       ; preds = %._crit_edge47.us
  br label %.preheader40.us

._crit_edge49:                                    ; preds = %._crit_edge47.us
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %._crit_edge49
  %indvars.iv58 = phi i64 [ 0, %._crit_edge49 ], [ %indvars.iv.next59, %._crit_edge.us..preheader.us_crit_edge ]
  %45 = mul nsw i64 %indvars.iv58, 1000
  br label %46

; <label>:46:                                     ; preds = %._crit_edge87, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge87 ]
  %47 = add nsw i64 %indvars.iv, %45
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 20
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %._crit_edge86

._crit_edge86:                                    ; preds = %46
  br label %53

; <label>:51:                                     ; preds = %46
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %52) #4
  br label %53

; <label>:53:                                     ; preds = %._crit_edge86, %51
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %56) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge87

._crit_edge87:                                    ; preds = %53
  br label %46

._crit_edge.us:                                   ; preds = %53
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond61, label %._crit_edge44, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge44:                                    ; preds = %._crit_edge.us
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
