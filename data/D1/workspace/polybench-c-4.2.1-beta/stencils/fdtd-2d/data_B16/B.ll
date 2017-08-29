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
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph29.preheader:
  br label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.preheader, %.lr.ph29.prol
  %indvars.iv36.prol = phi i64 [ %indvars.iv.next37.prol, %.lr.ph29.prol ], [ 0, %.lr.ph29.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph29.prol ], [ 4, %.lr.ph29.preheader ]
  %4 = trunc i64 %indvars.iv36.prol to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.prol
  store double %5, double* %6, align 8
  %indvars.iv.next37.prol = add nuw nsw i64 %indvars.iv36.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph29.preheader1, label %.lr.ph29.prol, !llvm.loop !1

.lr.ph29.preheader1:                              ; preds = %.lr.ph29.prol
  br label %.lr.ph29

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv31 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %11 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv
  %15 = add nuw nsw i64 %indvars.iv, 2
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %13, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  %20 = fmul <2 x double> %10, %19
  %21 = fdiv <2 x double> %20, <double 1.000000e+03, double 1.200000e+03>
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  store double %22, double* %14, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv
  store double %23, double* %24, align 8
  %25 = add nuw nsw i64 %indvars.iv, 3
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = fmul double %8, %27
  %29 = fdiv double %28, 1.000000e+03
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv
  store double %29, double* %30, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %11

._crit_edge.us:                                   ; preds = %11
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %._crit_edge26, label %.preheader.us

.lr.ph29:                                         ; preds = %.lr.ph29.preheader1, %.lr.ph29
  %indvars.iv36 = phi i64 [ %indvars.iv.next37.7, %.lr.ph29 ], [ %indvars.iv.next37.prol, %.lr.ph29.preheader1 ]
  %31 = trunc i64 %indvars.iv36 to i32
  %32 = sitofp i32 %31 to double
  %33 = getelementptr inbounds double, double* %3, i64 %indvars.iv36
  %34 = bitcast double* %33 to <2 x double>*
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %35 = trunc i64 %indvars.iv.next37 to i32
  %36 = sitofp i32 %35 to double
  %37 = insertelement <2 x double> undef, double %32, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  store <2 x double> %38, <2 x double>* %34, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %39 = trunc i64 %indvars.iv.next37.1 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next37.1
  %42 = bitcast double* %41 to <2 x double>*
  %indvars.iv.next37.2 = add nsw i64 %indvars.iv36, 3
  %43 = trunc i64 %indvars.iv.next37.2 to i32
  %44 = sitofp i32 %43 to double
  %45 = insertelement <2 x double> undef, double %40, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  store <2 x double> %46, <2 x double>* %42, align 8
  %indvars.iv.next37.3 = add nsw i64 %indvars.iv36, 4
  %47 = trunc i64 %indvars.iv.next37.3 to i32
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next37.3
  %50 = bitcast double* %49 to <2 x double>*
  %indvars.iv.next37.4 = add nsw i64 %indvars.iv36, 5
  %51 = trunc i64 %indvars.iv.next37.4 to i32
  %52 = sitofp i32 %51 to double
  %53 = insertelement <2 x double> undef, double %48, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  store <2 x double> %54, <2 x double>* %50, align 8
  %indvars.iv.next37.5 = add nsw i64 %indvars.iv36, 6
  %55 = trunc i64 %indvars.iv.next37.5 to i32
  %56 = sitofp i32 %55 to double
  %57 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next37.5
  %58 = bitcast double* %57 to <2 x double>*
  %indvars.iv.next37.6 = add nsw i64 %indvars.iv36, 7
  %59 = trunc i64 %indvars.iv.next37.6 to i32
  %60 = sitofp i32 %59 to double
  %61 = insertelement <2 x double> undef, double %56, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  store <2 x double> %62, <2 x double>* %58, align 8
  %indvars.iv.next37.7 = add nsw i64 %indvars.iv36, 8
  %exitcond39.7 = icmp eq i64 %indvars.iv.next37.7, 500
  br i1 %exitcond39.7, label %.preheader.us.preheader, label %.lr.ph29

.preheader.us.preheader:                          ; preds = %.lr.ph29
  br label %.preheader.us

._crit_edge26:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader73.lr.ph:
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge86, %.preheader73.lr.ph
  %indvars.iv125 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next126, %._crit_edge86 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv125
  %5 = bitcast double* %4 to i64*
  br label %.lr.ph.new

.preheader69.us:                                  ; preds = %.preheader69.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %6, %._crit_edge.us ], [ 0, %.preheader69.us.preheader ]
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge.us ], [ 1, %.preheader69.us.preheader ]
  %6 = add i64 %indvar, 1
  %7 = add nsw i64 %indvars.iv100, -1
  %scevgep207 = getelementptr [1200 x double], [1200 x double]* %1, i64 %6, i64 0
  %scevgep210 = getelementptr [1200 x double], [1200 x double]* %1, i64 %6, i64 1200
  %scevgep213 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep216 = getelementptr [1200 x double], [1200 x double]* %2, i64 %6, i64 1200
  %bound0218 = icmp ult double* %scevgep207, %scevgep216
  %bound1219 = icmp ult double* %scevgep213, %scevgep210
  %memcheck.conflict221 = and i1 %bound0218, %bound1219
  br i1 %memcheck.conflict221, label %.preheader69.us.new.preheader, label %vector.body197.preheader

vector.body197.preheader:                         ; preds = %.preheader69.us
  br label %vector.body197

vector.body197:                                   ; preds = %vector.body197.preheader, %vector.body197
  %index224 = phi i64 [ %index.next225, %vector.body197 ], [ 0, %vector.body197.preheader ]
  %8 = shl i64 %index224, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv100, i64 %8
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec233 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !3, !noalias !6
  %strided.vec234 = shufflevector <4 x double> %wide.vec233, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec235 = shufflevector <4 x double> %wide.vec233, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %8
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec236 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !6
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %7, i64 %8
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec239 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !6
  %15 = fsub <4 x double> %wide.vec236, %wide.vec239
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec234, %17
  %19 = or i64 %8, 1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv100, i64 %19
  %21 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fmul <2 x double> %21, <double 5.000000e-01, double 5.000000e-01>
  %23 = fsub <2 x double> %strided.vec235, %22
  %24 = getelementptr double, double* %20, i64 -1
  %25 = bitcast double* %24 to <4 x double>*
  %interleaved.vec242 = shufflevector <2 x double> %18, <2 x double> %23, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec242, <4 x double>* %25, align 8, !alias.scope !3, !noalias !6
  %index.next225 = add i64 %index224, 2
  %26 = icmp eq i64 %index.next225, 600
  br i1 %26, label %middle.block198, label %vector.body197, !llvm.loop !8

middle.block198:                                  ; preds = %vector.body197
  br i1 true, label %._crit_edge.us, label %middle.block198..preheader69.us.new.preheader_crit_edge

middle.block198..preheader69.us.new.preheader_crit_edge: ; preds = %middle.block198
  br label %.preheader69.us.new.preheader

.preheader69.us.new.preheader:                    ; preds = %middle.block198..preheader69.us.new.preheader_crit_edge, %.preheader69.us
  br label %.preheader69.us.new

.preheader69.us.new:                              ; preds = %.preheader69.us.new.preheader, %.preheader69.us.new
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.preheader69.us.new ], [ 0, %.preheader69.us.new.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv92
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv92
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %7, i64 %indvars.iv92
  %32 = load double, double* %31, align 8
  %33 = fsub double %30, %32
  %34 = fmul double %33, 5.000000e-01
  %35 = fsub double %28, %34
  store double %35, double* %27, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv.next93
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv.next93
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %7, i64 %indvars.iv.next93
  %41 = load double, double* %40, align 8
  %42 = fsub double %39, %41
  %43 = fmul double %42, 5.000000e-01
  %44 = fsub double %37, %43
  store double %44, double* %36, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader69.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader69.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block198
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond = icmp eq i64 %indvars.iv.next101, 1000
  br i1 %exitcond, label %.preheader68.us.preheader, label %.preheader69.us

.preheader68.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader68.us

.lr.ph.new:                                       ; preds = %.preheader73, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader73 ]
  %45 = load i64, i64* %5, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %48 = load i64, i64* %5, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %51 = load i64, i64* %5, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %54 = load i64, i64* %5, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %57 = load i64, i64* %5, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %60 = load i64, i64* %5, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %63 = load i64, i64* %5, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %66 = load i64, i64* %5, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader69.us.preheader, label %.lr.ph.new

.preheader69.us.preheader:                        ; preds = %.lr.ph.new
  br label %.preheader69.us

.preheader68.us:                                  ; preds = %.preheader68.us.preheader, %._crit_edge80.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge80.us ], [ 0, %.preheader68.us.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 1
  %70 = load double, double* %69, align 8
  %71 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 1
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 0
  %74 = load double, double* %73, align 8
  %75 = fsub double %72, %74
  %76 = fmul double %75, 5.000000e-01
  %77 = fsub double %70, %76
  store double %77, double* %69, align 8
  %scevgep166 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 2
  %scevgep169 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 1200
  %scevgep175 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 1200
  %bound0177 = icmp ult double* %scevgep166, %scevgep175
  %bound1178 = icmp ult double* %71, %scevgep169
  %memcheck.conflict180 = and i1 %bound0177, %bound1178
  br i1 %memcheck.conflict180, label %.preheader68.us.new.preheader, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %.preheader68.us
  br label %vector.body160

vector.body160:                                   ; preds = %vector.body160.preheader, %vector.body160
  %index183 = phi i64 [ %index.next184, %vector.body160 ], [ 0, %vector.body160.preheader ]
  %78 = shl i64 %index183, 1
  %offset.idx = or i64 %78, 2
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %offset.idx
  %80 = bitcast double* %79 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %80, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec190 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %offset.idx
  %82 = getelementptr double, double* %81, i64 -1
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec191 = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !15
  %strided.vec192 = shufflevector <4 x double> %wide.vec191, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec193 = shufflevector <4 x double> %wide.vec191, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = fsub <2 x double> %strided.vec193, %strided.vec192
  %85 = fmul <2 x double> %84, <double 5.000000e-01, double 5.000000e-01>
  %86 = fsub <2 x double> %strided.vec, %85
  %87 = or i64 %78, 3
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %87
  %90 = getelementptr double, double* %89, i64 -1
  %91 = bitcast double* %90 to <4 x double>*
  %wide.vec194 = load <4 x double>, <4 x double>* %91, align 8, !alias.scope !15
  %strided.vec195 = shufflevector <4 x double> %wide.vec194, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec196 = shufflevector <4 x double> %wide.vec194, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %92 = fsub <2 x double> %strided.vec196, %strided.vec195
  %93 = fmul <2 x double> %92, <double 5.000000e-01, double 5.000000e-01>
  %94 = fsub <2 x double> %strided.vec190, %93
  %95 = getelementptr double, double* %88, i64 -1
  %96 = bitcast double* %95 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %86, <2 x double> %94, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %96, align 8, !alias.scope !12, !noalias !15
  %index.next184 = add i64 %index183, 2
  %97 = icmp eq i64 %index.next184, 598
  br i1 %97, label %middle.block161, label %vector.body160, !llvm.loop !17

middle.block161:                                  ; preds = %vector.body160
  br i1 false, label %middle.block161.._crit_edge80.us_crit_edge, label %.preheader68.us.new.preheader

middle.block161.._crit_edge80.us_crit_edge:       ; preds = %middle.block161
  br label %._crit_edge80.us

.preheader68.us.new.preheader:                    ; preds = %middle.block161, %.preheader68.us
  %indvars.iv104.ph = phi i64 [ 2, %.preheader68.us ], [ 1198, %middle.block161 ]
  br label %.preheader68.us.new

.preheader68.us.new:                              ; preds = %.preheader68.us.new.preheader, %.preheader68.us.new
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.preheader68.us.new ], [ %indvars.iv104.ph, %.preheader68.us.new.preheader ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv104
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv104
  %101 = load double, double* %100, align 8
  %102 = add nsw i64 %indvars.iv104, -1
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fsub double %101, %104
  %106 = fmul double %105, 5.000000e-01
  %107 = fsub double %99, %106
  store double %107, double* %98, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv.next105
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv.next105
  %111 = load double, double* %110, align 8
  %112 = load double, double* %100, align 8
  %113 = fsub double %111, %112
  %114 = fmul double %113, 5.000000e-01
  %115 = fsub double %109, %114
  store double %115, double* %108, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next105.1, 1200
  br i1 %exitcond107.1, label %._crit_edge80.us.loopexit, label %.preheader68.us.new, !llvm.loop !18

._crit_edge80.us.loopexit:                        ; preds = %.preheader68.us.new
  br label %._crit_edge80.us

._crit_edge80.us:                                 ; preds = %middle.block161.._crit_edge80.us_crit_edge, %._crit_edge80.us.loopexit
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 1000
  br i1 %exitcond115, label %.preheader.us.preheader, label %.preheader68.us

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge84.us
  %indvars.iv121 = phi i64 [ %116, %._crit_edge84.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv121, i64 0
  %scevgep137 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv121, i64 1199
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv121, i64 0
  %116 = add i64 %indvars.iv121, 1
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %0, i64 %116, i64 0
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 0
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %1, i64 %116, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep141
  %bound1 = icmp ult double* %scevgep139, %scevgep137
  %found.conflict = and i1 %bound0, %bound1
  %bound0147 = icmp ult double* %scevgep, %scevgep145
  %bound1148 = icmp ult double* %scevgep143, %scevgep137
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv121, i64 %index
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !19, !noalias !22
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !19, !noalias !22
  %121 = or i64 %index, 1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv121, i64 %121
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !25
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !25
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv121, i64 %index
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !25
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !25
  %130 = fsub <2 x double> %wide.load152, %wide.load154
  %131 = fsub <2 x double> %wide.load153, %wide.load155
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %116, i64 %index
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !26
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !26
  %136 = fadd <2 x double> %130, %wide.load156
  %137 = fadd <2 x double> %131, %wide.load157
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %index
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !26
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %141, align 8, !alias.scope !26
  %142 = fsub <2 x double> %136, %wide.load158
  %143 = fsub <2 x double> %137, %wide.load159
  %144 = fmul <2 x double> %142, <double 7.000000e-01, double 7.000000e-01>
  %145 = fmul <2 x double> %143, <double 7.000000e-01, double 7.000000e-01>
  %146 = fsub <2 x double> %wide.load, %144
  %147 = fsub <2 x double> %wide.load151, %145
  store <2 x double> %146, <2 x double>* %118, align 8, !alias.scope !19, !noalias !22
  store <2 x double> %147, <2 x double>* %120, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %148 = icmp eq i64 %index.next, 1196
  br i1 %148, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv117.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %scalar.ph ], [ %indvars.iv117.ph, %scalar.ph.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv121, i64 %indvars.iv117
  %150 = load double, double* %149, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv121, i64 %indvars.iv.next118
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv121, i64 %indvars.iv117
  %154 = load double, double* %153, align 8
  %155 = fsub double %152, %154
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %116, i64 %indvars.iv117
  %157 = load double, double* %156, align 8
  %158 = fadd double %155, %157
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv117
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = fmul double %161, 7.000000e-01
  %163 = fsub double %150, %162
  store double %163, double* %149, align 8
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 1199
  br i1 %exitcond120, label %._crit_edge84.us, label %scalar.ph, !llvm.loop !28

._crit_edge84.us:                                 ; preds = %scalar.ph
  %exitcond124 = icmp eq i64 %116, 999
  br i1 %exitcond124, label %._crit_edge86, label %.preheader.us

._crit_edge86:                                    ; preds = %._crit_edge84.us
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 500
  br i1 %exitcond128, label %._crit_edge88, label %.preheader73

._crit_edge88:                                    ; preds = %._crit_edge86
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader41.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge52.us, %.preheader41.us.preheader
  %indvars.iv76 = phi i64 [ 0, %.preheader41.us.preheader ], [ %indvars.iv.next77, %._crit_edge52.us ]
  %7 = mul nsw i64 %indvars.iv76, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader41.us
  %indvars.iv72 = phi i64 [ 0, %.preheader41.us ], [ %indvars.iv.next73, %15 ]
  %9 = add nsw i64 %indvars.iv72, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #4
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv72
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond75, label %._crit_edge52.us, label %8

._crit_edge52.us:                                 ; preds = %15
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, 1000
  br i1 %exitcond79, label %._crit_edge54, label %.preheader41.us

._crit_edge54:                                    ; preds = %._crit_edge52.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge47.us, %._crit_edge54
  %indvars.iv67 = phi i64 [ 0, %._crit_edge54 ], [ %indvars.iv.next68, %._crit_edge47.us ]
  %26 = mul nsw i64 %indvars.iv67, 1000
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader40.us
  %indvars.iv63 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next64, %34 ]
  %28 = add nsw i64 %indvars.iv63, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #4
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv67, i64 %indvars.iv63
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #5
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond66, label %._crit_edge47.us, label %27

._crit_edge47.us:                                 ; preds = %34
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond70, label %._crit_edge49, label %.preheader40.us

._crit_edge49:                                    ; preds = %._crit_edge47.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge49
  %indvars.iv58 = phi i64 [ 0, %._crit_edge49 ], [ %indvars.iv.next59, %._crit_edge.us ]
  %43 = mul nsw i64 %indvars.iv58, 1000
  br label %44

; <label>:44:                                     ; preds = %51, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %51 ]
  %45 = add nsw i64 %indvars.iv, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #4
  br label %51

; <label>:51:                                     ; preds = %49, %44
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv58, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %54) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %51
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond61, label %._crit_edge44, label %.preheader.us

._crit_edge44:                                    ; preds = %._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
