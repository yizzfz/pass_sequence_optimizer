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
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) #2 {
..lr.ph5_crit_edge:
  br label %.lr.ph5

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv6 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond1, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5, %..lr.ph5_crit_edge
  %indvars.iv9 = phi i64 [ 0, %..lr.ph5_crit_edge ], [ %indvars.iv.next10.4, %.lr.ph5 ]
  %27 = trunc i64 %indvars.iv9 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  store double %28, double* %29, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %30 = trunc i64 %indvars.iv.next10 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10
  store double %31, double* %32, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %33 = trunc i64 %indvars.iv.next10.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.1
  store double %34, double* %35, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv9, 3
  %36 = trunc i64 %indvars.iv.next10.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.2
  store double %37, double* %38, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv9, 4
  %39 = trunc i64 %indvars.iv.next10.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.3
  store double %40, double* %41, align 8
  %exitcond12.4 = icmp eq i64 %indvars.iv.next10.3, 499
  %indvars.iv.next10.4 = add nsw i64 %indvars.iv9, 5
  br i1 %exitcond12.4, label %.preheader.us.preheader, label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.preheader6.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr.2 = ptrtoint double* %3 to i64
  %sunkaddr.3 = ptrtoint double* %3 to i64
  %sunkaddr.4 = ptrtoint double* %3 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv38 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next39, %._crit_edge12 ]
  %sunkaddr47 = shl i64 %indvars.iv38, 3
  %sunkaddr48 = add i64 %sunkaddr, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i64*
  %sunkaddr47.1 = shl i64 %indvars.iv38, 3
  %sunkaddr48.1 = add i64 %sunkaddr.1, %sunkaddr47.1
  %sunkaddr49.1 = inttoptr i64 %sunkaddr48.1 to i64*
  %sunkaddr47.2 = shl i64 %indvars.iv38, 3
  %sunkaddr48.2 = add i64 %sunkaddr.2, %sunkaddr47.2
  %sunkaddr49.2 = inttoptr i64 %sunkaddr48.2 to i64*
  %sunkaddr47.3 = shl i64 %indvars.iv38, 3
  %sunkaddr48.3 = add i64 %sunkaddr.3, %sunkaddr47.3
  %sunkaddr49.3 = inttoptr i64 %sunkaddr48.3 to i64*
  %sunkaddr47.4 = shl i64 %indvars.iv38, 3
  %sunkaddr48.4 = add i64 %sunkaddr.4, %sunkaddr47.4
  %sunkaddr49.4 = inttoptr i64 %sunkaddr48.4 to i64*
  br label %46

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %4 = add nuw nsw i64 %indvar, 1
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %5 = add nuw nsw i64 %indvar, 2
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %1, i64 %5, i64 0
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %2, i64 %5, i64 0
  %6 = add nsw i64 %indvars.iv22, -1
  %bound0120 = icmp ult double* %scevgep112, %scevgep118
  %bound1121 = icmp ult double* %scevgep116, %scevgep114
  %memcheck.conflict123 = and i1 %bound0120, %bound1121
  br i1 %memcheck.conflict123, label %scalar.ph109.preheader, label %vector.body107.preheader

vector.body107.preheader:                         ; preds = %.preheader2.us
  br label %vector.body107

scalar.ph109.preheader:                           ; preds = %.preheader2.us
  br label %scalar.ph109

vector.body107:                                   ; preds = %vector.body107.preheader, %vector.body107
  %index126 = phi i64 [ %index.next127, %vector.body107 ], [ 0, %vector.body107.preheader ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %index126
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1, !noalias !4
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1, !noalias !4
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %index126
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !4
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !4
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %index126
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !4
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !4
  %19 = fsub <2 x double> %wide.load136, %wide.load138
  %20 = fsub <2 x double> %wide.load137, %wide.load139
  %21 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %22 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %23 = fsub <2 x double> %wide.load134, %21
  %24 = fsub <2 x double> %wide.load135, %22
  %25 = bitcast double* %7 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !1, !noalias !4
  %26 = bitcast double* %9 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8, !alias.scope !1, !noalias !4
  %index.next127 = add nuw nsw i64 %index126, 4
  %27 = icmp eq i64 %index.next127, 1200
  br i1 %27, label %._crit_edge.us.loopexit1, label %vector.body107, !llvm.loop !6

scalar.ph109:                                     ; preds = %scalar.ph109, %scalar.ph109.preheader
  %indvars.iv18 = phi i64 [ 0, %scalar.ph109.preheader ], [ %indvars.iv.next19.1, %scalar.ph109 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv18
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv18
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv18
  %33 = load double, double* %32, align 8
  %34 = fsub double %31, %33
  %35 = fmul double %34, 5.000000e-01
  %36 = fsub double %29, %35
  store double %36, double* %28, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv.next19
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next19
  %42 = load double, double* %41, align 8
  %43 = fsub double %40, %42
  %44 = fmul double %43, 5.000000e-01
  %45 = fsub double %38, %44
  store double %45, double* %37, align 8
  %exitcond21.1 = icmp eq i64 %indvars.iv.next19, 1199
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  br i1 %exitcond21.1, label %._crit_edge.us.loopexit, label %scalar.ph109, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph109
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body107
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond2 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond2, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

; <label>:46:                                     ; preds = %46, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %46 ]
  %47 = load i64, i64* %sunkaddr49, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = load i64, i64* %sunkaddr49.1, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %53 = load i64, i64* %sunkaddr49.2, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %56 = load i64, i64* %sunkaddr49.3, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %59 = load i64, i64* %sunkaddr49.4, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %.preheader2.us.preheader, label %46

.preheader2.us.preheader:                         ; preds = %46
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %._crit_edge9.us, %.preheader1.us.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv29, i64 1
  %62 = add nuw nsw i64 %indvars.iv29, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %0, i64 %62, i64 0
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %2, i64 %62, i64 0
  %bound087 = icmp ult double* %scevgep79, %scevgep85
  %bound188 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict90 = and i1 %bound087, %bound188
  br i1 %memcheck.conflict90, label %scalar.ph76.preheader, label %vector.body74.preheader

vector.body74.preheader:                          ; preds = %.preheader1.us
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74.preheader, %vector.body74
  %index93 = phi i64 [ %index.next94, %vector.body74 ], [ 0, %vector.body74.preheader ]
  %offset.idx = or i64 %index93, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv29, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10, !noalias !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10, !noalias !13
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !13
  %71 = add nsw i64 %offset.idx, -1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !13
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !13
  %76 = fsub <2 x double> %wide.load103, %wide.load105
  %77 = fsub <2 x double> %wide.load104, %wide.load106
  %78 = fmul <2 x double> %76, <double 5.000000e-01, double 5.000000e-01>
  %79 = fmul <2 x double> %77, <double 5.000000e-01, double 5.000000e-01>
  %80 = fsub <2 x double> %wide.load101, %78
  %81 = fsub <2 x double> %wide.load102, %79
  %82 = bitcast double* %63 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8, !alias.scope !10, !noalias !13
  %83 = bitcast double* %65 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8, !alias.scope !10, !noalias !13
  %index.next94 = add nuw nsw i64 %index93, 4
  %84 = icmp eq i64 %index.next94, 1196
  br i1 %84, label %scalar.ph76.preheader.loopexit, label %vector.body74, !llvm.loop !15

scalar.ph76.preheader.loopexit:                   ; preds = %vector.body74
  br label %scalar.ph76.preheader

scalar.ph76.preheader:                            ; preds = %scalar.ph76.preheader.loopexit, %.preheader1.us
  %indvars.iv25.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph76.preheader.loopexit ]
  br i1 true, label %scalar.ph76.prol.preheader, label %scalar.ph76.prol.loopexit.unr-lcssa

scalar.ph76.prol.preheader:                       ; preds = %scalar.ph76.preheader
  br label %scalar.ph76.prol

scalar.ph76.prol:                                 ; preds = %scalar.ph76.prol.preheader
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv25.ph
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv25.ph
  %88 = load double, double* %87, align 8
  %89 = add nsw i64 %indvars.iv25.ph, -1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %89
  %91 = load double, double* %90, align 8
  %92 = fsub double %88, %91
  %93 = fmul double %92, 5.000000e-01
  %94 = fsub double %86, %93
  store double %94, double* %85, align 8
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.ph, 1
  br label %scalar.ph76.prol.loopexit.unr-lcssa

scalar.ph76.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph76.preheader, %scalar.ph76.prol
  %indvars.iv25.unr.ph = phi i64 [ %indvars.iv.next26.prol, %scalar.ph76.prol ], [ %indvars.iv25.ph, %scalar.ph76.preheader ]
  br label %scalar.ph76.prol.loopexit

scalar.ph76.prol.loopexit:                        ; preds = %scalar.ph76.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge9.us, label %scalar.ph76.preheader.new

scalar.ph76.preheader.new:                        ; preds = %scalar.ph76.prol.loopexit
  br label %scalar.ph76

scalar.ph76:                                      ; preds = %scalar.ph76, %scalar.ph76.preheader.new
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %scalar.ph76.preheader.new ], [ %indvars.iv.next26.1, %scalar.ph76 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv25
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv25
  %98 = load double, double* %97, align 8
  %99 = add nsw i64 %indvars.iv25, -1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %99
  %101 = load double, double* %100, align 8
  %102 = fsub double %98, %101
  %103 = fmul double %102, 5.000000e-01
  %104 = fsub double %96, %103
  store double %104, double* %95, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv.next26
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next26
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv25
  %110 = load double, double* %109, align 8
  %111 = fsub double %108, %110
  %112 = fmul double %111, 5.000000e-01
  %113 = fsub double %106, %112
  store double %113, double* %105, align 8
  %exitcond28.1 = icmp eq i64 %indvars.iv.next26, 1199
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  br i1 %exitcond28.1, label %._crit_edge9.us.unr-lcssa, label %scalar.ph76, !llvm.loop !16

._crit_edge9.us.unr-lcssa:                        ; preds = %scalar.ph76
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %scalar.ph76.prol.loopexit, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 0
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 1199
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv36, i64 0
  %114 = add nuw nsw i64 %indvars.iv36, 1
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %0, i64 %114, i64 0
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 0
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %1, i64 %114, i64 1199
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %bound0 = icmp ult double* %scevgep, %scevgep55
  %bound1 = icmp ult double* %scevgep53, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bound061 = icmp ult double* %scevgep, %scevgep59
  %bound162 = icmp ult double* %scevgep57, %scevgep51
  %found.conflict63 = and i1 %bound061, %bound162
  %conflict.rdx = or i1 %found.conflict, %found.conflict63
  br i1 %conflict.rdx, label %._crit_edge16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %index
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !17, !noalias !20
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !17, !noalias !20
  %119 = or i64 %index, 1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv36, i64 %119
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !23
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !23
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv36, i64 %index
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !23
  %126 = getelementptr double, double* %124, i64 2
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !23
  %128 = fsub <2 x double> %wide.load66, %wide.load68
  %129 = fsub <2 x double> %wide.load67, %wide.load69
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37, i64 %index
  %131 = bitcast double* %130 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !24
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !24
  %134 = fadd <2 x double> %128, %wide.load70
  %135 = fadd <2 x double> %129, %wide.load71
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %index
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !24
  %138 = getelementptr double, double* %136, i64 2
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !24
  %140 = fsub <2 x double> %134, %wide.load72
  %141 = fsub <2 x double> %135, %wide.load73
  %142 = fmul <2 x double> %140, <double 7.000000e-01, double 7.000000e-01>
  %143 = fmul <2 x double> %141, <double 7.000000e-01, double 7.000000e-01>
  %144 = fsub <2 x double> %wide.load, %142
  %145 = fsub <2 x double> %wide.load65, %143
  %146 = bitcast double* %115 to <2 x double>*
  store <2 x double> %144, <2 x double>* %146, align 8, !alias.scope !17, !noalias !20
  %147 = bitcast double* %117 to <2 x double>*
  store <2 x double> %145, <2 x double>* %147, align 8, !alias.scope !17, !noalias !20
  %index.next = add nuw nsw i64 %index, 4
  %148 = icmp eq i64 %index.next, 1196
  br i1 %148, label %._crit_edge16.preheader.loopexit, label %vector.body, !llvm.loop !25

._crit_edge16.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge16.preheader

._crit_edge16.preheader:                          ; preds = %._crit_edge16.preheader.loopexit, %.preheader.us
  %indvars.iv32.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge16.preheader.loopexit ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.preheader, %._crit_edge16
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge16 ], [ %indvars.iv32.ph, %._crit_edge16.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv32
  %150 = load double, double* %149, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next33
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv32
  %154 = load double, double* %153, align 8
  %155 = fsub double %152, %154
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37, i64 %indvars.iv32
  %157 = load double, double* %156, align 8
  %158 = fadd double %155, %157
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv32
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = fmul double %161, 7.000000e-01
  %163 = fsub double %150, %162
  store double %163, double* %149, align 8
  %exitcond35 = icmp eq i64 %indvars.iv32, 1198
  br i1 %exitcond35, label %._crit_edge11.us, label %._crit_edge16, !llvm.loop !26

._crit_edge11.us:                                 ; preds = %._crit_edge16
  %exitcond4 = icmp eq i64 %indvars.iv.next37, 999
  br i1 %exitcond4, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next39, 500
  br i1 %exitcond5, label %._crit_edge13, label %.lr.ph

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader8.lr.ph..preheader8.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.lr.ph..preheader8.us_crit_edge
  %indvars.iv30 = phi i64 [ 0, %.preheader8.lr.ph..preheader8.us_crit_edge ], [ %indvars.iv.next31, %._crit_edge14.us ]
  %7 = mul nuw nsw i64 %indvars.iv30, 1000
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge, %.preheader8.us
  %indvars.iv28 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next29, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv28, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge16
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge16, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv28
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond4, label %._crit_edge14.us, label %._crit_edge16

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond5, label %.preheader7.lr.ph..preheader7.us_crit_edge, label %.preheader8.us

.preheader7.lr.ph..preheader7.us_crit_edge:       ; preds = %._crit_edge14.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.lr.ph..preheader7.us_crit_edge
  %indvars.iv25 = phi i64 [ 0, %.preheader7.lr.ph..preheader7.us_crit_edge ], [ %indvars.iv.next26, %._crit_edge11.us ]
  %24 = mul nuw nsw i64 %indvars.iv25, 1000
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17, %.preheader7.us
  %indvars.iv23 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next24, %._crit_edge17 ]
  %25 = add nuw nsw i64 %indvars.iv23, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge17

; <label>:29:                                     ; preds = %._crit_edge18
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge18, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv23
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond2, label %._crit_edge11.us, label %._crit_edge18

._crit_edge11.us:                                 ; preds = %._crit_edge17
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond3, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader7.us

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %._crit_edge11.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv21 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next22, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv21, 1000
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge19 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge19

; <label>:44:                                     ; preds = %._crit_edge20
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge20, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge20

._crit_edge.us:                                   ; preds = %._crit_edge19
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond1, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
