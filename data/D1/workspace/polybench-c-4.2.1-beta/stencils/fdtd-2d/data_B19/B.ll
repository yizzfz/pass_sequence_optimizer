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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph5.preheader:
  br label %.lr.ph5.prol

.lr.ph5.prol:                                     ; preds = %.lr.ph5.prol, %.lr.ph5.preheader
  %indvars.iv12.prol = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next13.prol, %.lr.ph5.prol ]
  %prol.iter = phi i32 [ 4, %.lr.ph5.preheader ], [ %prol.iter.sub, %.lr.ph5.prol ]
  %4 = trunc i64 %indvars.iv12.prol to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv12.prol
  store double %5, double* %6, align 8
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv12.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph5.preheader1, label %.lr.ph5.prol, !llvm.loop !1

.lr.ph5.preheader1:                               ; preds = %.lr.ph5.prol
  br label %.lr.ph5

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv7 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %14 = add nuw nsw i64 %indvars.iv, 2
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fmul <2 x double> %10, %18
  %20 = fdiv <2 x double> %19, <double 1.000000e+03, double 1.200000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv, 3
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = fmul double %8, %26
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %28, double* %29, align 8
  %exitcond16 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond16, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5.preheader1, %.lr.ph5
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.7, %.lr.ph5 ], [ 4, %.lr.ph5.preheader1 ]
  %30 = trunc i64 %indvars.iv12 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv12
  %33 = bitcast double* %32 to <2 x double>*
  %34 = trunc i64 %indvars.iv12 to i32
  %35 = or i32 %34, 1
  %36 = sitofp i32 %35 to double
  %37 = insertelement <2 x double> undef, double %31, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  store <2 x double> %38, <2 x double>* %33, align 8
  %indvars.iv.next13.1 = or i64 %indvars.iv12, 2
  %39 = trunc i64 %indvars.iv.next13.1 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.1
  %42 = bitcast double* %41 to <2 x double>*
  %43 = trunc i64 %indvars.iv12 to i32
  %44 = or i32 %43, 3
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %40, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  store <2 x double> %47, <2 x double>* %42, align 8
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv12, 4
  %48 = trunc i64 %indvars.iv.next13.3 to i32
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.3
  %51 = bitcast double* %50 to <2 x double>*
  %indvars.iv.next13.4 = add nsw i64 %indvars.iv12, 5
  %52 = trunc i64 %indvars.iv.next13.4 to i32
  %53 = sitofp i32 %52 to double
  %54 = insertelement <2 x double> undef, double %49, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  store <2 x double> %55, <2 x double>* %51, align 8
  %indvars.iv.next13.5 = add nsw i64 %indvars.iv12, 6
  %56 = trunc i64 %indvars.iv.next13.5 to i32
  %57 = sitofp i32 %56 to double
  %58 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.5
  %59 = bitcast double* %58 to <2 x double>*
  %indvars.iv.next13.6 = add nsw i64 %indvars.iv12, 7
  %60 = trunc i64 %indvars.iv.next13.6 to i32
  %61 = sitofp i32 %60 to double
  %62 = insertelement <2 x double> undef, double %57, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  store <2 x double> %63, <2 x double>* %59, align 8
  %indvars.iv.next13.7 = add nsw i64 %indvars.iv12, 8
  %exitcond15.7 = icmp eq i64 %indvars.iv.next13.7, 500
  br i1 %exitcond15.7, label %.preheader.us.preheader, label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %5 = bitcast double* %4 to i64*
  br label %.lr.ph.new

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %6 = add i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %1, i64 %6, i64 0
  %7 = add i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %1, i64 %7, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %2, i64 %7, i64 0
  %8 = add nsw i64 %indvars.iv25, -1
  %bound072 = icmp ult double* %scevgep63, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep65
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %.preheader2.us.new.preheader, label %vector.body58.preheader

vector.body58.preheader:                          ; preds = %.preheader2.us
  br label %vector.body58

.preheader2.us.new.preheader:                     ; preds = %.preheader2.us
  br label %.preheader2.us.new

vector.body58:                                    ; preds = %vector.body58.preheader, %vector.body58
  %index78 = phi i64 [ %index.next79, %vector.body58 ], [ 0, %vector.body58.preheader ]
  %offset.idx82 = shl i64 %index78, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %offset.idx82
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec86 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !3, !noalias !6
  %strided.vec87 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec88 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %offset.idx82
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !6
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %offset.idx82
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec92 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !6
  %15 = fsub <4 x double> %wide.vec89, %wide.vec92
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec87, %17
  %19 = or i64 %offset.idx82, 1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %19
  %21 = fsub <4 x double> %wide.vec89, %wide.vec92
  %22 = shufflevector <4 x double> %21, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %23 = fmul <2 x double> %22, <double 5.000000e-01, double 5.000000e-01>
  %24 = fsub <2 x double> %strided.vec88, %23
  %25 = getelementptr double, double* %20, i64 -1
  %26 = bitcast double* %25 to <4 x double>*
  %interleaved.vec95 = shufflevector <2 x double> %18, <2 x double> %24, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec95, <4 x double>* %26, align 8, !alias.scope !3, !noalias !6
  %index.next79 = add i64 %index78, 2
  %27 = icmp eq i64 %index.next79, 600
  br i1 %27, label %._crit_edge.us.loopexit96, label %vector.body58, !llvm.loop !8

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader, %.preheader2.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.preheader2.us.new ], [ 0, %.preheader2.us.new.preheader ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv17
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv17
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %indvars.iv17
  %33 = load double, double* %32, align 8
  %34 = fsub double %31, %33
  %35 = fmul double %34, 5.000000e-01
  %36 = fsub double %29, %35
  store double %36, double* %28, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next18
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next18
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %indvars.iv.next18
  %42 = load double, double* %41, align 8
  %43 = fsub double %40, %42
  %44 = fmul double %43, 5.000000e-01
  %45 = fsub double %38, %44
  store double %45, double* %37, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader2.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit96:                        ; preds = %vector.body58
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit96, %._crit_edge.us.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next26, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond54, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.preheader6
  %indvars.iv = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next.7, %.lr.ph.new ]
  %46 = load i64, i64* %5, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %49 = load i64, i64* %5, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %52 = load i64, i64* %5, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %55 = load i64, i64* %5, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %58 = load i64, i64* %5, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %61 = load i64, i64* %5, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %64 = load i64, i64* %5, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %67 = load i64, i64* %5, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.us.preheader, label %.lr.ph.new

.preheader2.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 2
  %70 = add i64 %indvars.iv37, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %0, i64 %70, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 1
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %2, i64 %70, i64 0
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 1
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 0
  %76 = load double, double* %75, align 8
  %77 = fsub double %74, %76
  %78 = fmul double %77, 5.000000e-01
  %79 = fsub double %72, %78
  store double %79, double* %71, align 8
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %.preheader1.us.new.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %.preheader1.us
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %80 = shl i64 %index44, 1
  %offset.idx = or i64 %80, 2
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %offset.idx
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec51 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %offset.idx
  %84 = getelementptr double, double* %83, i64 -1
  %85 = bitcast double* %84 to <4 x double>*
  %wide.vec52 = load <4 x double>, <4 x double>* %85, align 8, !alias.scope !15
  %strided.vec53 = shufflevector <4 x double> %wide.vec52, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec54 = shufflevector <4 x double> %wide.vec52, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %86 = fsub <2 x double> %strided.vec54, %strided.vec53
  %87 = fmul <2 x double> %86, <double 5.000000e-01, double 5.000000e-01>
  %88 = fsub <2 x double> %strided.vec, %87
  %89 = or i64 %80, 3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %89
  %92 = getelementptr double, double* %91, i64 -1
  %93 = bitcast double* %92 to <4 x double>*
  %wide.vec55 = load <4 x double>, <4 x double>* %93, align 8, !alias.scope !15
  %strided.vec56 = shufflevector <4 x double> %wide.vec55, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec57 = shufflevector <4 x double> %wide.vec55, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %94 = fsub <2 x double> %strided.vec57, %strided.vec56
  %95 = fmul <2 x double> %94, <double 5.000000e-01, double 5.000000e-01>
  %96 = fsub <2 x double> %strided.vec51, %95
  %97 = getelementptr double, double* %90, i64 -1
  %98 = bitcast double* %97 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %88, <2 x double> %96, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %98, align 8, !alias.scope !12, !noalias !15
  %index.next45 = add i64 %index44, 2
  %99 = icmp eq i64 %index.next45, 598
  br i1 %99, label %.preheader1.us.new.preheader.loopexit, label %vector.body25, !llvm.loop !17

.preheader1.us.new.preheader.loopexit:            ; preds = %vector.body25
  br label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %.preheader1.us.new.preheader.loopexit, %.preheader1.us
  %indvars.iv29.ph = phi i64 [ 2, %.preheader1.us ], [ 1198, %.preheader1.us.new.preheader.loopexit ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader, %.preheader1.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader1.us.new ], [ %indvars.iv29.ph, %.preheader1.us.new.preheader ]
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv29
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv29
  %103 = load double, double* %102, align 8
  %104 = add nsw i64 %indvars.iv29, -1
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fsub double %103, %106
  %108 = fmul double %107, 5.000000e-01
  %109 = fsub double %101, %108
  store double %109, double* %100, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv.next30
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next30
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv29
  %115 = load double, double* %114, align 8
  %116 = fsub double %113, %115
  %117 = fmul double %116, 5.000000e-01
  %118 = fsub double %111, %117
  store double %118, double* %110, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 1200
  br i1 %exitcond32.1, label %._crit_edge9.us, label %.preheader1.us.new, !llvm.loop !18

._crit_edge9.us:                                  ; preds = %.preheader1.us.new
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 0
  %119 = add i64 %indvars.iv46, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %0, i64 %119, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv46, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %1, i64 %119, i64 1199
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %124 = or i64 %index, 1
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %124
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !25
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %index
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = getelementptr double, double* %129, i64 2
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !25
  %133 = fsub <2 x double> %wide.load17, %wide.load19
  %134 = fsub <2 x double> %wide.load18, %wide.load20
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next47, i64 %index
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !26
  %137 = getelementptr double, double* %135, i64 2
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = fadd <2 x double> %133, %wide.load21
  %140 = fadd <2 x double> %134, %wide.load22
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv46, i64 %index
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !26
  %143 = getelementptr double, double* %141, i64 2
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !26
  %145 = fsub <2 x double> %139, %wide.load23
  %146 = fsub <2 x double> %140, %wide.load24
  %147 = fmul <2 x double> %145, <double 7.000000e-01, double 7.000000e-01>
  %148 = fmul <2 x double> %146, <double 7.000000e-01, double 7.000000e-01>
  %149 = fsub <2 x double> %wide.load, %147
  %150 = fsub <2 x double> %wide.load16, %148
  %151 = bitcast double* %120 to <2 x double>*
  store <2 x double> %149, <2 x double>* %151, align 8, !alias.scope !19, !noalias !22
  %152 = bitcast double* %122 to <2 x double>*
  store <2 x double> %150, <2 x double>* %152, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %153 = icmp eq i64 %index.next, 1196
  br i1 %153, label %._crit_edge.preheader.loopexit, label %vector.body, !llvm.loop !27

._crit_edge.preheader.loopexit:                   ; preds = %vector.body
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.loopexit, %.preheader.us
  %indvars.iv42.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge.preheader.loopexit ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge ], [ %indvars.iv42.ph, %._crit_edge.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  %155 = load double, double* %154, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next43
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv42
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next47, i64 %indvars.iv42
  %162 = load double, double* %161, align 8
  %163 = fadd double %160, %162
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv42
  %165 = load double, double* %164, align 8
  %166 = fsub double %163, %165
  %167 = fmul double %166, 7.000000e-01
  %168 = fsub double %155, %167
  store double %168, double* %154, align 8
  %exitcond55 = icmp eq i64 %indvars.iv.next43, 1199
  br i1 %exitcond55, label %._crit_edge11.us, label %._crit_edge, !llvm.loop !28

._crit_edge11.us:                                 ; preds = %._crit_edge
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 999
  br i1 %exitcond49, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next51, 500
  br i1 %exitcond56, label %._crit_edge13, label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader8.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %7 = mul nsw i64 %indvars.iv37, 1000
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv33, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge47
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge47, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv33
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond45, label %._crit_edge14.us, label %._crit_edge47

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond46, label %._crit_edge15, label %.preheader8.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %._crit_edge15
  %indvars.iv28 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %24 = mul nsw i64 %indvars.iv28, 1000
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge48, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %._crit_edge48 ]
  %25 = add nsw i64 %indvars.iv24, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge48

; <label>:29:                                     ; preds = %._crit_edge49
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge49, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv24
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond43, label %._crit_edge11.us, label %._crit_edge49

._crit_edge11.us:                                 ; preds = %._crit_edge48
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond44, label %._crit_edge12, label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge12
  %indvars.iv19 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next20, %._crit_edge.us ]
  %39 = mul nsw i64 %indvars.iv19, 1000
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge50, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge50 ]
  %40 = add nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge50

; <label>:44:                                     ; preds = %._crit_edge51
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge51, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond42, label %._crit_edge.us, label %._crit_edge51

._crit_edge.us:                                   ; preds = %._crit_edge50
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
