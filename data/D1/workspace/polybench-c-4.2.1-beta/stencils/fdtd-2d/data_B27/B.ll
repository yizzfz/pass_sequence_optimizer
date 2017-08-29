; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %19

; <label>:19:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture, [1200 x double]*, [1200 x double]*, double* nocapture) #2 {
.lr.ph4.preheader:
  %4 = alloca [1200 x double]*, align 8
  store [1200 x double]* %2, [1200 x double]** %4, align 8
  br label %.lr.ph4.prol

.lr.ph4.prol:                                     ; preds = %.lr.ph4.preheader, %.lr.ph4.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %.lr.ph4.prol ], [ 0, %.lr.ph4.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph4.prol ], [ 4, %.lr.ph4.preheader ]
  %5 = trunc i64 %indvars.iv11.prol to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv11.prol
  store double %6, double* %7, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph4.preheader1, label %.lr.ph4.prol, !llvm.loop !1

.lr.ph4.preheader1:                               ; preds = %.lr.ph4.prol
  br label %.lr.ph4

.preheader.lr.ph:                                 ; preds = %.lr.ph4
  %8 = load [1200 x double]*, [1200 x double]** %4, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %9 = trunc i64 %indvars.iv6 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %13 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fmul <2 x double> %12, %21
  %23 = fdiv <2 x double> %22, <double 1.000000e+03, double 1.200000e+03>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  store double %24, double* %16, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %25, double* %26, align 8
  %27 = add nuw nsw i64 %indvars.iv, 3
  %28 = trunc i64 %27 to i32
  %29 = sitofp i32 %28 to double
  %30 = fmul double %10, %29
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv6, i64 %indvars.iv
  store double %31, double* %32, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond9, label %._crit_edge2, label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4.preheader1, %.lr.ph4
  %indvars.iv11 = phi i64 [ %indvars.iv.next12.7, %.lr.ph4 ], [ %indvars.iv.next12.prol, %.lr.ph4.preheader1 ]
  %33 = trunc i64 %indvars.iv11 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  %36 = bitcast double* %35 to <2 x double>*
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %37 = trunc i64 %indvars.iv.next12 to i32
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %34, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  store <2 x double> %40, <2 x double>* %36, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %41 = trunc i64 %indvars.iv.next12.1 to i32
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.1
  %44 = bitcast double* %43 to <2 x double>*
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %45 = trunc i64 %indvars.iv.next12.2 to i32
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %42, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  store <2 x double> %48, <2 x double>* %44, align 8
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %49 = trunc i64 %indvars.iv.next12.3 to i32
  %50 = sitofp i32 %49 to double
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.3
  %52 = bitcast double* %51 to <2 x double>*
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv11, 5
  %53 = trunc i64 %indvars.iv.next12.4 to i32
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %50, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  store <2 x double> %56, <2 x double>* %52, align 8
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv11, 6
  %57 = trunc i64 %indvars.iv.next12.5 to i32
  %58 = sitofp i32 %57 to double
  %59 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.5
  %60 = bitcast double* %59 to <2 x double>*
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv11, 7
  %61 = trunc i64 %indvars.iv.next12.6 to i32
  %62 = sitofp i32 %61 to double
  %63 = insertelement <2 x double> undef, double %58, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  store <2 x double> %64, <2 x double>* %60, align 8
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv11, 8
  %exitcond14.7 = icmp eq i64 %indvars.iv.next12.7, 500
  br i1 %exitcond14.7, label %.preheader.lr.ph, label %.lr.ph4

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.preheader6.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12 ]
  %sunkaddr96 = shl i64 %indvars.iv50, 3
  %sunkaddr97 = add i64 %sunkaddr, %sunkaddr96
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to i64*
  br label %.lr.ph.new

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %4 = add i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %5 = add i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %1, i64 %5, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %2, i64 %5, i64 0
  %6 = add nsw i64 %indvars.iv25, -1
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
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %offset.idx82
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec86 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !3, !noalias !6
  %strided.vec87 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec88 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %offset.idx82
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !6
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %offset.idx82
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec92 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !6
  %13 = fsub <4 x double> %wide.vec89, %wide.vec92
  %14 = shufflevector <4 x double> %13, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %15 = fmul <2 x double> %14, <double 5.000000e-01, double 5.000000e-01>
  %16 = fsub <2 x double> %strided.vec87, %15
  %17 = or i64 %offset.idx82, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %17
  %19 = fsub <4 x double> %wide.vec89, %wide.vec92
  %20 = shufflevector <4 x double> %19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %22 = fsub <2 x double> %strided.vec88, %21
  %23 = getelementptr double, double* %18, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %interleaved.vec95 = shufflevector <2 x double> %16, <2 x double> %22, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec95, <4 x double>* %24, align 8, !alias.scope !3, !noalias !6
  %index.next79 = add i64 %index78, 2
  %25 = icmp eq i64 %index.next79, 600
  br i1 %25, label %._crit_edge.us.loopexit99, label %vector.body58, !llvm.loop !8

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader, %.preheader2.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.preheader2.us.new ], [ 0, %.preheader2.us.new.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv17
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv17
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv17
  %31 = load double, double* %30, align 8
  %32 = fsub double %29, %31
  %33 = fmul double %32, 5.000000e-01
  %34 = fsub double %27, %33
  store double %34, double* %26, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next18
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next18
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next18
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 5.000000e-01
  %43 = fsub double %36, %42
  store double %43, double* %35, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader2.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit99:                        ; preds = %vector.body58
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit99, %._crit_edge.us.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

.lr.ph.new:                                       ; preds = %.preheader6, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader6 ]
  %44 = load i64, i64* %sunkaddr98, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %47 = load i64, i64* %sunkaddr98, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %50 = load i64, i64* %sunkaddr98, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %53 = load i64, i64* %sunkaddr98, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %56 = load i64, i64* %sunkaddr98, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %59 = load i64, i64* %sunkaddr98, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %62 = load i64, i64* %sunkaddr98, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %65 = load i64, i64* %sunkaddr98, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.us.preheader, label %.lr.ph.new

.preheader2.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 2
  %68 = add i64 %indvars.iv37, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %0, i64 %68, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 1
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %2, i64 %68, i64 0
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 1
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 1
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 0
  %74 = load double, double* %73, align 8
  %75 = fsub double %72, %74
  %76 = fmul double %75, 5.000000e-01
  %77 = fsub double %70, %76
  store double %77, double* %69, align 8
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %.preheader1.us.new.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %.preheader1.us
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %78 = shl i64 %index44, 1
  %offset.idx = or i64 %78, 2
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %offset.idx
  %80 = bitcast double* %79 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %80, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec51 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %offset.idx
  %82 = getelementptr double, double* %81, i64 -1
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec52 = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !15
  %strided.vec53 = shufflevector <4 x double> %wide.vec52, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec54 = shufflevector <4 x double> %wide.vec52, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = fsub <2 x double> %strided.vec54, %strided.vec53
  %85 = fmul <2 x double> %84, <double 5.000000e-01, double 5.000000e-01>
  %86 = fsub <2 x double> %strided.vec, %85
  %87 = or i64 %78, 3
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %87
  %90 = getelementptr double, double* %89, i64 -1
  %91 = bitcast double* %90 to <4 x double>*
  %wide.vec55 = load <4 x double>, <4 x double>* %91, align 8, !alias.scope !15
  %strided.vec56 = shufflevector <4 x double> %wide.vec55, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec57 = shufflevector <4 x double> %wide.vec55, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %92 = fsub <2 x double> %strided.vec57, %strided.vec56
  %93 = fmul <2 x double> %92, <double 5.000000e-01, double 5.000000e-01>
  %94 = fsub <2 x double> %strided.vec51, %93
  %95 = getelementptr double, double* %88, i64 -1
  %96 = bitcast double* %95 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %86, <2 x double> %94, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %96, align 8, !alias.scope !12, !noalias !15
  %index.next45 = add i64 %index44, 2
  %97 = icmp eq i64 %index.next45, 598
  br i1 %97, label %.preheader1.us.new.preheader.loopexit, label %vector.body25, !llvm.loop !17

.preheader1.us.new.preheader.loopexit:            ; preds = %vector.body25
  br label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %.preheader1.us.new.preheader.loopexit, %.preheader1.us
  %indvars.iv29.ph = phi i64 [ 2, %.preheader1.us ], [ 1198, %.preheader1.us.new.preheader.loopexit ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader, %.preheader1.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader1.us.new ], [ %indvars.iv29.ph, %.preheader1.us.new.preheader ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv29
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv29
  %101 = load double, double* %100, align 8
  %102 = add nsw i64 %indvars.iv29, -1
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fsub double %101, %104
  %106 = fmul double %105, 5.000000e-01
  %107 = fsub double %99, %106
  store double %107, double* %98, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv.next30
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next30
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv29
  %113 = load double, double* %112, align 8
  %114 = fsub double %111, %113
  %115 = fmul double %114, 5.000000e-01
  %116 = fsub double %109, %115
  store double %116, double* %108, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 1200
  br i1 %exitcond32.1, label %._crit_edge9.us, label %.preheader1.us.new, !llvm.loop !18

._crit_edge9.us:                                  ; preds = %.preheader1.us.new
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 0
  %117 = add i64 %indvars.iv46, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %0, i64 %117, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv46, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %1, i64 %117, i64 1199
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %index
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !19, !noalias !22
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  %122 = or i64 %index, 1
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %122
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !25
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !25
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %index
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = fsub <2 x double> %wide.load17, %wide.load19
  %132 = fsub <2 x double> %wide.load18, %wide.load20
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next47, i64 %index
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !26
  %135 = getelementptr double, double* %133, i64 2
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !26
  %137 = fadd <2 x double> %131, %wide.load21
  %138 = fadd <2 x double> %132, %wide.load22
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv46, i64 %index
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !26
  %141 = getelementptr double, double* %139, i64 2
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !26
  %143 = fsub <2 x double> %137, %wide.load23
  %144 = fsub <2 x double> %138, %wide.load24
  %145 = fmul <2 x double> %143, <double 7.000000e-01, double 7.000000e-01>
  %146 = fmul <2 x double> %144, <double 7.000000e-01, double 7.000000e-01>
  %147 = fsub <2 x double> %wide.load, %145
  %148 = fsub <2 x double> %wide.load16, %146
  %149 = bitcast double* %118 to <2 x double>*
  store <2 x double> %147, <2 x double>* %149, align 8, !alias.scope !19, !noalias !22
  %150 = bitcast double* %120 to <2 x double>*
  store <2 x double> %148, <2 x double>* %150, align 8, !alias.scope !19, !noalias !22
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
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  %153 = load double, double* %152, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next43
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv42
  %157 = load double, double* %156, align 8
  %158 = fsub double %155, %157
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next47, i64 %indvars.iv42
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv42
  %163 = load double, double* %162, align 8
  %164 = fsub double %161, %163
  %165 = fmul double %164, 7.000000e-01
  %166 = fsub double %153, %165
  store double %166, double* %152, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 1199
  br i1 %exitcond45, label %._crit_edge11.us, label %scalar.ph, !llvm.loop !28

._crit_edge11.us:                                 ; preds = %scalar.ph
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 999
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
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader8.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %7 = mul nsw i64 %indvars.iv37, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %15 ]
  %9 = add nsw i64 %indvars.iv33, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv33
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond36, label %._crit_edge14.us, label %8

._crit_edge14.us:                                 ; preds = %15
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %._crit_edge15, label %.preheader8.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %._crit_edge15
  %indvars.iv28 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %26 = mul nsw i64 %indvars.iv28, 1000
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %34 ]
  %28 = add nsw i64 %indvars.iv24, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv24
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %._crit_edge11.us, label %27

._crit_edge11.us:                                 ; preds = %34
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond31, label %._crit_edge12, label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge12
  %indvars.iv19 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next20, %._crit_edge.us ]
  %43 = mul nsw i64 %indvars.iv19, 1000
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %51

; <label>:51:                                     ; preds = %49, %44
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %54) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %51
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
