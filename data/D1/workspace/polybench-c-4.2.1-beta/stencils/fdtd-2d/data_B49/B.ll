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
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph4.preheader:
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca [1200 x double]*, align 8
  store [1200 x double]* %4, [1200 x double]** %7, align 8
  store [1200 x double]* %5, [1200 x double]** %8, align 8
  br label %.lr.ph4.prol

.lr.ph4.prol:                                     ; preds = %.lr.ph4.preheader, %.lr.ph4.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %.lr.ph4.prol ], [ 0, %.lr.ph4.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph4.prol ], [ 4, %.lr.ph4.preheader ]
  %9 = trunc i64 %indvars.iv11.prol to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %6, i64 %indvars.iv11.prol
  store double %10, double* %11, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph4.preheader16, label %.lr.ph4.prol, !llvm.loop !1

.lr.ph4.preheader16:                              ; preds = %.lr.ph4.prol
  br label %.lr.ph4

.preheader.lr.ph:                                 ; preds = %.lr.ph4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %12 = trunc i64 %indvars.iv6 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %16 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = trunc i64 %indvars.iv.next to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %20 = add nuw nsw i64 %indvars.iv, 2
  %21 = trunc i64 %20 to i32
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fmul <2 x double> %15, %24
  %26 = fdiv <2 x double> %25, <double 1.000000e+03, double 1.200000e+03>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  store double %27, double* %19, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6, i64 %indvars.iv
  store double %28, double* %29, align 8
  %30 = add nuw nsw i64 %indvars.iv, 3
  %31 = trunc i64 %30 to i32
  %32 = sitofp i32 %31 to double
  %33 = fmul double %13, %32
  %34 = fdiv double %33, 1.000000e+03
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv
  store double %34, double* %35, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %16

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge2, label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4.preheader16, %.lr.ph4
  %indvars.iv11 = phi i64 [ %indvars.iv.next12.7, %.lr.ph4 ], [ %indvars.iv.next12.prol, %.lr.ph4.preheader16 ]
  %36 = trunc i64 %indvars.iv11 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %39 = bitcast double* %38 to <2 x double>*
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %40 = trunc i64 %indvars.iv.next12 to i32
  %41 = sitofp i32 %40 to double
  %42 = insertelement <2 x double> undef, double %37, i32 0
  %43 = insertelement <2 x double> %42, double %41, i32 1
  store <2 x double> %43, <2 x double>* %39, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %44 = trunc i64 %indvars.iv.next12.1 to i32
  %45 = sitofp i32 %44 to double
  %46 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.1
  %47 = bitcast double* %46 to <2 x double>*
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %48 = trunc i64 %indvars.iv.next12.2 to i32
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %45, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  store <2 x double> %51, <2 x double>* %47, align 8
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %52 = trunc i64 %indvars.iv.next12.3 to i32
  %53 = sitofp i32 %52 to double
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.3
  %55 = bitcast double* %54 to <2 x double>*
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv11, 5
  %56 = trunc i64 %indvars.iv.next12.4 to i32
  %57 = sitofp i32 %56 to double
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  store <2 x double> %59, <2 x double>* %55, align 8
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv11, 6
  %60 = trunc i64 %indvars.iv.next12.5 to i32
  %61 = sitofp i32 %60 to double
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.5
  %63 = bitcast double* %62 to <2 x double>*
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv11, 7
  %64 = trunc i64 %indvars.iv.next12.6 to i32
  %65 = sitofp i32 %64 to double
  %66 = insertelement <2 x double> undef, double %61, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  store <2 x double> %67, <2 x double>* %63, align 8
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv11, 8
  %exitcond14.7 = icmp eq i64 %indvars.iv.next12.7, 500
  br i1 %exitcond14.7, label %.preheader.lr.ph, label %.lr.ph4

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.preheader6.lr.ph:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12 ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv50
  %8 = bitcast double* %7 to i64*
  br label %.lr.ph.new

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %9, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %9 = add i64 %indvar, 1
  %10 = add nsw i64 %indvars.iv25, -1
  %scevgep132 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %scevgep135 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 1200
  %scevgep138 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %5, i64 %9, i64 1200
  %bound0143 = icmp ult double* %scevgep132, %scevgep141
  %bound1144 = icmp ult double* %scevgep138, %scevgep135
  %memcheck.conflict146 = and i1 %bound0143, %bound1144
  br i1 %memcheck.conflict146, label %.preheader2.us.new.preheader, label %vector.body122.preheader

vector.body122.preheader:                         ; preds = %.preheader2.us
  br label %vector.body122

vector.body122:                                   ; preds = %vector.body122.preheader, %vector.body122
  %index149 = phi i64 [ %index.next150, %vector.body122 ], [ 0, %vector.body122.preheader ]
  %11 = shl i64 %index149, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec158 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec159 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec160 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec161 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec164 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec161, %wide.vec164
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec159, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %22
  %24 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %25 = fmul <2 x double> %24, <double 5.000000e-01, double 5.000000e-01>
  %26 = fsub <2 x double> %strided.vec160, %25
  %27 = getelementptr double, double* %23, i64 -1
  %28 = bitcast double* %27 to <4 x double>*
  %interleaved.vec167 = shufflevector <2 x double> %21, <2 x double> %26, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec167, <4 x double>* %28, align 8, !alias.scope !3, !noalias !6
  %index.next150 = add i64 %index149, 2
  %29 = icmp eq i64 %index.next150, 600
  br i1 %29, label %middle.block123, label %vector.body122, !llvm.loop !8

middle.block123:                                  ; preds = %vector.body122
  br i1 true, label %._crit_edge.us, label %middle.block123..preheader2.us.new.preheader_crit_edge

middle.block123..preheader2.us.new.preheader_crit_edge: ; preds = %middle.block123
  br label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %middle.block123..preheader2.us.new.preheader_crit_edge, %.preheader2.us
  br label %.preheader2.us.new

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader, %.preheader2.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.preheader2.us.new ], [ 0, %.preheader2.us.new.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv17
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv17
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv17
  %35 = load double, double* %34, align 8
  %36 = fsub double %33, %35
  %37 = fmul double %36, 5.000000e-01
  %38 = fsub double %31, %37
  store double %38, double* %30, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next18
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next18
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next18
  %44 = load double, double* %43, align 8
  %45 = fsub double %42, %44
  %46 = fmul double %45, 5.000000e-01
  %47 = fsub double %40, %46
  store double %47, double* %39, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader2.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block123
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

.lr.ph.new:                                       ; preds = %.preheader6, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader6 ]
  %48 = load i64, i64* %8, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %51 = load i64, i64* %8, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %54 = load i64, i64* %8, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %57 = load i64, i64* %8, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %60 = load i64, i64* %8, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %63 = load i64, i64* %8, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %66 = load i64, i64* %8, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %69 = load i64, i64* %8, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.us.preheader, label %.lr.ph.new

.preheader2.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 1
  %73 = load double, double* %72, align 8
  %74 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 0
  %77 = load double, double* %76, align 8
  %78 = fsub double %75, %77
  %79 = fmul double %78, 5.000000e-01
  %80 = fsub double %73, %79
  store double %80, double* %72, align 8
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 2
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 1200
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1200
  %bound0102 = icmp ult double* %scevgep91, %scevgep100
  %bound1103 = icmp ult double* %74, %scevgep94
  %memcheck.conflict105 = and i1 %bound0102, %bound1103
  br i1 %memcheck.conflict105, label %.preheader1.us.new.preheader, label %vector.body85.preheader

vector.body85.preheader:                          ; preds = %.preheader1.us
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85.preheader, %vector.body85
  %index108 = phi i64 [ %index.next109, %vector.body85 ], [ 0, %vector.body85.preheader ]
  %81 = shl i64 %index108, 1
  %offset.idx = or i64 %81, 2
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %offset.idx
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec115 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %offset.idx
  %85 = getelementptr double, double* %84, i64 -1
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec116 = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !15
  %strided.vec117 = shufflevector <4 x double> %wide.vec116, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec118 = shufflevector <4 x double> %wide.vec116, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fsub <2 x double> %strided.vec118, %strided.vec117
  %88 = fmul <2 x double> %87, <double 5.000000e-01, double 5.000000e-01>
  %89 = fsub <2 x double> %strided.vec, %88
  %90 = or i64 %81, 3
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %90
  %93 = getelementptr double, double* %92, i64 -1
  %94 = bitcast double* %93 to <4 x double>*
  %wide.vec119 = load <4 x double>, <4 x double>* %94, align 8, !alias.scope !15
  %strided.vec120 = shufflevector <4 x double> %wide.vec119, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec121 = shufflevector <4 x double> %wide.vec119, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %95 = fsub <2 x double> %strided.vec121, %strided.vec120
  %96 = fmul <2 x double> %95, <double 5.000000e-01, double 5.000000e-01>
  %97 = fsub <2 x double> %strided.vec115, %96
  %98 = getelementptr double, double* %91, i64 -1
  %99 = bitcast double* %98 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %89, <2 x double> %97, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %99, align 8, !alias.scope !12, !noalias !15
  %index.next109 = add i64 %index108, 2
  %100 = icmp eq i64 %index.next109, 598
  br i1 %100, label %middle.block86, label %vector.body85, !llvm.loop !17

middle.block86:                                   ; preds = %vector.body85
  br i1 false, label %middle.block86.._crit_edge9.us_crit_edge, label %.preheader1.us.new.preheader

middle.block86.._crit_edge9.us_crit_edge:         ; preds = %middle.block86
  br label %._crit_edge9.us

.preheader1.us.new.preheader:                     ; preds = %middle.block86, %.preheader1.us
  %indvars.iv29.ph = phi i64 [ 2, %.preheader1.us ], [ 1198, %middle.block86 ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader, %.preheader1.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader1.us.new ], [ %indvars.iv29.ph, %.preheader1.us.new.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv29
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv29
  %104 = load double, double* %103, align 8
  %105 = add nsw i64 %indvars.iv29, -1
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %105
  %107 = load double, double* %106, align 8
  %108 = fsub double %104, %107
  %109 = fmul double %108, 5.000000e-01
  %110 = fsub double %102, %109
  store double %110, double* %101, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next30
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next30
  %114 = load double, double* %113, align 8
  %115 = load double, double* %103, align 8
  %116 = fsub double %114, %115
  %117 = fmul double %116, 5.000000e-01
  %118 = fsub double %112, %117
  store double %118, double* %111, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 1200
  br i1 %exitcond32.1, label %._crit_edge9.us.loopexit, label %.preheader1.us.new, !llvm.loop !18

._crit_edge9.us.loopexit:                         ; preds = %.preheader1.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %middle.block86.._crit_edge9.us_crit_edge, %._crit_edge9.us.loopexit
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv46 = phi i64 [ %119, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 1199
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 0
  %119 = add i64 %indvars.iv46, 1
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %3, i64 %119, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %4, i64 %119, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep66
  %bound1 = icmp ult double* %scevgep64, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep62
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %124 = or i64 %index, 1
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %124
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !25
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %index
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = getelementptr double, double* %129, i64 2
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !25
  %133 = fsub <2 x double> %wide.load77, %wide.load79
  %134 = fsub <2 x double> %wide.load78, %wide.load80
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %119, i64 %index
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !26
  %137 = getelementptr double, double* %135, i64 2
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = fadd <2 x double> %133, %wide.load81
  %140 = fadd <2 x double> %134, %wide.load82
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %index
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !26
  %143 = getelementptr double, double* %141, i64 2
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !26
  %145 = fsub <2 x double> %139, %wide.load83
  %146 = fsub <2 x double> %140, %wide.load84
  %147 = fmul <2 x double> %145, <double 7.000000e-01, double 7.000000e-01>
  %148 = fmul <2 x double> %146, <double 7.000000e-01, double 7.000000e-01>
  %149 = fsub <2 x double> %wide.load, %147
  %150 = fsub <2 x double> %wide.load76, %148
  store <2 x double> %149, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  store <2 x double> %150, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %151 = icmp eq i64 %index.next, 1196
  br i1 %151, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv42.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %scalar.ph ], [ %indvars.iv42.ph, %scalar.ph.preheader ]
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %indvars.iv42
  %153 = load double, double* %152, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv.next43
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv42
  %157 = load double, double* %156, align 8
  %158 = fsub double %155, %157
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %119, i64 %indvars.iv42
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv42
  %163 = load double, double* %162, align 8
  %164 = fsub double %161, %163
  %165 = fmul double %164, 7.000000e-01
  %166 = fsub double %153, %165
  store double %166, double* %152, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 1199
  br i1 %exitcond45, label %._crit_edge11.us, label %scalar.ph, !llvm.loop !28

._crit_edge11.us:                                 ; preds = %scalar.ph
  %exitcond49 = icmp eq i64 %119, 999
  br i1 %exitcond49, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 500
  br i1 %exitcond53, label %._crit_edge13, label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader8.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %9 = mul nsw i64 %indvars.iv37, 1000
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %17 ]
  %11 = add nsw i64 %indvars.iv33, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv33
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond36, label %._crit_edge14.us, label %10

._crit_edge14.us:                                 ; preds = %17
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %._crit_edge15, label %.preheader8.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %._crit_edge15
  %indvars.iv28 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %28 = mul nsw i64 %indvars.iv28, 1000
  br label %29

; <label>:29:                                     ; preds = %36, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %36 ]
  %30 = add nsw i64 %indvars.iv24, %28
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #5
  br label %36

; <label>:36:                                     ; preds = %34, %29
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv24
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #6
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %._crit_edge11.us, label %29

._crit_edge11.us:                                 ; preds = %36
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond31, label %._crit_edge12, label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge12
  %indvars.iv19 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next20, %._crit_edge.us ]
  %45 = mul nsw i64 %indvars.iv19, 1000
  br label %46

; <label>:46:                                     ; preds = %53, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %53 ]
  %47 = add nsw i64 %indvars.iv, %45
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 20
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %46
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %52) #5
  br label %53

; <label>:53:                                     ; preds = %51, %46
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %56) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %53
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

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
