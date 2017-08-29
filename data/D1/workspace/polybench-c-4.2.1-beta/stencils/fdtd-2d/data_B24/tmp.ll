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
.lr.ph5.preheader:
  br label %.lr.ph5

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv7 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %8 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %12 = add nuw nsw i64 %indvars.iv, 2
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %7, %16
  %18 = fdiv <2 x double> %17, <double 1.000000e+03, double 1.200000e+03>
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  store double %19, double* %11, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = add nuw nsw i64 %indvars.iv, 3
  %23 = trunc i64 %22 to i32
  %24 = sitofp i32 %23 to double
  %25 = fmul double %5, %24
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %26, double* %27, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next13.4, %.lr.ph5 ]
  %28 = trunc i64 %indvars.iv12 to i32
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv12
  %31 = bitcast double* %30 to <2 x double>*
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %32 = trunc i64 %indvars.iv.next13 to i32
  %33 = sitofp i32 %32 to double
  %34 = insertelement <2 x double> undef, double %29, i32 0
  %35 = insertelement <2 x double> %34, double %33, i32 1
  store <2 x double> %35, <2 x double>* %31, align 8
  %indvars.iv.next13.1 = add nuw nsw i64 %indvars.iv12, 2
  %36 = trunc i64 %indvars.iv.next13.1 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.1
  %39 = bitcast double* %38 to <2 x double>*
  %indvars.iv.next13.2 = add nuw nsw i64 %indvars.iv12, 3
  %40 = trunc i64 %indvars.iv.next13.2 to i32
  %41 = sitofp i32 %40 to double
  %42 = insertelement <2 x double> undef, double %37, i32 0
  %43 = insertelement <2 x double> %42, double %41, i32 1
  store <2 x double> %43, <2 x double>* %39, align 8
  %indvars.iv.next13.3 = add nuw nsw i64 %indvars.iv12, 4
  %44 = trunc i64 %indvars.iv.next13.3 to i32
  %45 = sitofp i32 %44 to double
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.3
  store double %45, double* %46, align 8
  %indvars.iv.next13.4 = add nuw nsw i64 %indvars.iv12, 5
  %exitcond15.4 = icmp eq i64 %indvars.iv.next13.4, 500
  br i1 %exitcond15.4, label %.preheader.us.preheader, label %.lr.ph5

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
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader6.lr.ph, %._crit_edge12
  %indvars.iv44 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next45, %._crit_edge12 ]
  %sunkaddr1 = shl i64 %indvars.iv44, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i64*
  br label %44

vector.memcheck130:                               ; preds = %vector.memcheck130.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %vector.memcheck130.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 1, %vector.memcheck130.preheader ]
  %4 = add i64 %indvar, 1
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %5 = add i64 %indvar, 2
  %scevgep120 = getelementptr [1200 x double], [1200 x double]* %1, i64 %5, i64 0
  %scevgep122 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %2, i64 %5, i64 0
  %6 = add nsw i64 %indvars.iv22, -1
  %bound0126 = icmp ult double* %scevgep118, %scevgep124
  %bound1127 = icmp ult double* %scevgep122, %scevgep120
  %memcheck.conflict129 = and i1 %bound0126, %bound1127
  br i1 %memcheck.conflict129, label %scalar.ph115.preheader, label %vector.body113.preheader

vector.body113.preheader:                         ; preds = %vector.memcheck130
  br label %vector.body113

scalar.ph115.preheader:                           ; preds = %vector.memcheck130
  br label %scalar.ph115

vector.body113:                                   ; preds = %vector.body113.preheader, %vector.body113
  %index132 = phi i64 [ %index.next133, %vector.body113 ], [ 0, %vector.body113.preheader ]
  %offset.idx136 = shl i64 %index132, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %offset.idx136
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec140 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !1, !noalias !4
  %strided.vec141 = shufflevector <4 x double> %wide.vec140, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec142 = shufflevector <4 x double> %wide.vec140, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %offset.idx136
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec143 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !4
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %offset.idx136
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec146 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !4
  %13 = fsub <4 x double> %wide.vec143, %wide.vec146
  %14 = shufflevector <4 x double> %13, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %15 = fmul <2 x double> %14, <double 5.000000e-01, double 5.000000e-01>
  %16 = fsub <2 x double> %strided.vec141, %15
  %17 = or i64 %offset.idx136, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %17
  %19 = fsub <4 x double> %wide.vec143, %wide.vec146
  %20 = shufflevector <4 x double> %19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %22 = fsub <2 x double> %strided.vec142, %21
  %23 = getelementptr double, double* %18, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %interleaved.vec149 = shufflevector <2 x double> %16, <2 x double> %22, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec149, <4 x double>* %24, align 8, !alias.scope !1, !noalias !4
  %index.next133 = add i64 %index132, 2
  %25 = icmp eq i64 %index.next133, 600
  br i1 %25, label %._crit_edge.us.loopexit4, label %vector.body113, !llvm.loop !6

scalar.ph115:                                     ; preds = %scalar.ph115.preheader, %scalar.ph115
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.1, %scalar.ph115 ], [ 0, %scalar.ph115.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv18
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv18
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv18
  %31 = load double, double* %30, align 8
  %32 = fsub double %29, %31
  %33 = fmul double %32, 5.000000e-01
  %34 = fsub double %27, %33
  store double %34, double* %26, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv.next19
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next19
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 5.000000e-01
  %43 = fsub double %36, %42
  store double %43, double* %35, align 8
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond21.1 = icmp eq i64 %indvars.iv.next19.1, 1200
  br i1 %exitcond21.1, label %._crit_edge.us.loopexit, label %scalar.ph115, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph115
  br label %._crit_edge.us

._crit_edge.us.loopexit4:                         ; preds = %vector.body113
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit4, %._crit_edge.us.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond25, label %vector.memcheck91.preheader, label %vector.memcheck130

vector.memcheck91.preheader:                      ; preds = %._crit_edge.us
  br label %vector.memcheck91

; <label>:44:                                     ; preds = %44, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.7, %44 ]
  %45 = load i64, i64* %sunkaddr3, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %48 = load i64, i64* %sunkaddr3, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %51 = load i64, i64* %sunkaddr3, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %54 = load i64, i64* %sunkaddr3, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %57 = load i64, i64* %sunkaddr3, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %60 = load i64, i64* %sunkaddr3, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %63 = load i64, i64* %sunkaddr3, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %66 = load i64, i64* %sunkaddr3, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %vector.memcheck130.preheader, label %44

vector.memcheck130.preheader:                     ; preds = %44
  br label %vector.memcheck130

vector.memcheck91:                                ; preds = %vector.memcheck91.preheader, %._crit_edge9.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge9.us ], [ 0, %vector.memcheck91.preheader ]
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 2
  %69 = add i64 %indvars.iv31, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %0, i64 %69, i64 0
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 1
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %2, i64 %69, i64 0
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 1
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 1
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 0
  %75 = load double, double* %74, align 8
  %76 = fsub double %73, %75
  %77 = fmul double %76, 5.000000e-01
  %78 = fsub double %71, %77
  store double %78, double* %70, align 8
  %bound087 = icmp ult double* %scevgep79, %scevgep85
  %bound188 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict90 = and i1 %bound087, %bound188
  %ind.end = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 1197
  br i1 %memcheck.conflict90, label %scalar.ph76.preheader, label %vector.body74.preheader

vector.body74.preheader:                          ; preds = %vector.memcheck91
  br label %vector.body74

scalar.ph76.preheader.loopexit:                   ; preds = %vector.body74
  br label %scalar.ph76.preheader

scalar.ph76.preheader:                            ; preds = %scalar.ph76.preheader.loopexit, %vector.memcheck91
  %indvars.iv.next2849.ph = phi i64 [ 2, %vector.memcheck91 ], [ 1198, %scalar.ph76.preheader.loopexit ]
  %.ph = phi double* [ %72, %vector.memcheck91 ], [ %ind.end, %scalar.ph76.preheader.loopexit ]
  %indvars.iv2748.ph = phi i64 [ 1, %vector.memcheck91 ], [ 1197, %scalar.ph76.preheader.loopexit ]
  br label %scalar.ph76

vector.body74:                                    ; preds = %vector.body74.preheader, %vector.body74
  %index93 = phi i64 [ %index.next94, %vector.body74 ], [ 0, %vector.body74.preheader ]
  %79 = shl i64 %index93, 1
  %offset.idx = or i64 %79, 2
  %80 = shl i64 %index93, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %offset.idx
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec106 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %offset.idx
  %84 = getelementptr double, double* %83, i64 -1
  %85 = bitcast double* %84 to <4 x double>*
  %wide.vec107 = load <4 x double>, <4 x double>* %85, align 8, !alias.scope !13
  %strided.vec108 = shufflevector <4 x double> %wide.vec107, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec109 = shufflevector <4 x double> %wide.vec107, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %86 = fsub <2 x double> %strided.vec109, %strided.vec108
  %87 = fmul <2 x double> %86, <double 5.000000e-01, double 5.000000e-01>
  %88 = fsub <2 x double> %strided.vec, %87
  %89 = or i64 %80, 3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %89
  %92 = getelementptr double, double* %91, i64 -1
  %93 = bitcast double* %92 to <4 x double>*
  %wide.vec110 = load <4 x double>, <4 x double>* %93, align 8, !alias.scope !13
  %strided.vec111 = shufflevector <4 x double> %wide.vec110, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec112 = shufflevector <4 x double> %wide.vec110, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %94 = fsub <2 x double> %strided.vec112, %strided.vec111
  %95 = fmul <2 x double> %94, <double 5.000000e-01, double 5.000000e-01>
  %96 = fsub <2 x double> %strided.vec106, %95
  %97 = getelementptr double, double* %90, i64 -1
  %98 = bitcast double* %97 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %88, <2 x double> %96, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %98, align 8, !alias.scope !10, !noalias !13
  %index.next94 = add i64 %index93, 2
  %99 = icmp eq i64 %index.next94, 598
  br i1 %99, label %scalar.ph76.preheader.loopexit, label %vector.body74, !llvm.loop !15

._crit_edge9.us:                                  ; preds = %scalar.ph76
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %vector.memcheck.preheader, label %vector.memcheck91

vector.memcheck.preheader:                        ; preds = %._crit_edge9.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.preheader, %._crit_edge11.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge11.us ], [ 0, %vector.memcheck.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 0
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 1199
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 0
  %100 = add i64 %indvars.iv40, 1
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %0, i64 %100, i64 0
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv40, i64 0
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %1, i64 %100, i64 1199
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %bound0 = icmp ult double* %scevgep, %scevgep55
  %bound1 = icmp ult double* %scevgep53, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bound061 = icmp ult double* %scevgep, %scevgep59
  %bound162 = icmp ult double* %scevgep57, %scevgep51
  %found.conflict63 = and i1 %bound061, %bound162
  %conflict.rdx = or i1 %found.conflict, %found.conflict63
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %index
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !16, !noalias !19
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !16, !noalias !19
  %105 = or i64 %index, 1
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !22
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !22
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %index
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !22
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !22
  %114 = fsub <2 x double> %wide.load66, %wide.load68
  %115 = fsub <2 x double> %wide.load67, %wide.load69
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next41, i64 %index
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !23
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !23
  %120 = fadd <2 x double> %114, %wide.load70
  %121 = fadd <2 x double> %115, %wide.load71
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv40, i64 %index
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !23
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !23
  %126 = fsub <2 x double> %120, %wide.load72
  %127 = fsub <2 x double> %121, %wide.load73
  %128 = fmul <2 x double> %126, <double 7.000000e-01, double 7.000000e-01>
  %129 = fmul <2 x double> %127, <double 7.000000e-01, double 7.000000e-01>
  %130 = fsub <2 x double> %wide.load, %128
  %131 = fsub <2 x double> %wide.load65, %129
  %132 = bitcast double* %101 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !16, !noalias !19
  %133 = bitcast double* %103 to <2 x double>*
  store <2 x double> %131, <2 x double>* %133, align 8, !alias.scope !16, !noalias !19
  %index.next = add i64 %index, 4
  %134 = icmp eq i64 %index.next, 1196
  br i1 %134, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !24

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %vector.memcheck
  %indvars.iv36.ph = phi i64 [ 0, %vector.memcheck ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %scalar.ph ], [ %indvars.iv36.ph, %scalar.ph.preheader ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv36
  %136 = load double, double* %135, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv.next37
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv36
  %140 = load double, double* %139, align 8
  %141 = fsub double %138, %140
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next41, i64 %indvars.iv36
  %143 = load double, double* %142, align 8
  %144 = fadd double %141, %143
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv40, i64 %indvars.iv36
  %146 = load double, double* %145, align 8
  %147 = fsub double %144, %146
  %148 = fmul double %147, 7.000000e-01
  %149 = fsub double %136, %148
  store double %149, double* %135, align 8
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1199
  br i1 %exitcond39, label %._crit_edge11.us, label %scalar.ph, !llvm.loop !25

._crit_edge11.us:                                 ; preds = %scalar.ph
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 999
  br i1 %exitcond43, label %._crit_edge12, label %vector.memcheck

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 500
  br i1 %exitcond47, label %._crit_edge13, label %.lr.ph

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void

scalar.ph76:                                      ; preds = %scalar.ph76.preheader, %scalar.ph76
  %indvars.iv.next2849 = phi i64 [ %indvars.iv.next28, %scalar.ph76 ], [ %indvars.iv.next2849.ph, %scalar.ph76.preheader ]
  %150 = phi double* [ %161, %scalar.ph76 ], [ %.ph, %scalar.ph76.preheader ]
  %indvars.iv2748 = phi i64 [ %indvars.iv.next28.1, %scalar.ph76 ], [ %indvars.iv2748.ph, %scalar.ph76.preheader ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv.next2849
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv.next2849
  %154 = load double, double* %153, align 8
  %155 = load double, double* %150, align 8
  %156 = fsub double %154, %155
  %157 = fmul double %156, 5.000000e-01
  %158 = fsub double %152, %157
  store double %158, double* %151, align 8
  %indvars.iv.next28.1 = add nuw nsw i64 %indvars.iv2748, 2
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv.next28.1
  %160 = load double, double* %159, align 8
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv.next28.1
  %162 = load double, double* %161, align 8
  %163 = add nsw i64 %indvars.iv2748, 1
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %163
  %165 = load double, double* %164, align 8
  %166 = fsub double %162, %165
  %167 = fmul double %166, 5.000000e-01
  %168 = fsub double %160, %167
  store double %168, double* %159, align 8
  %indvars.iv.next28 = add nsw i64 %indvars.iv2748, 3
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond30, label %._crit_edge9.us, label %scalar.ph76, !llvm.loop !26
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
  %7 = mul nuw nsw i64 %indvars.iv37, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %15 ]
  %9 = add nuw nsw i64 %indvars.iv33, %7
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
  br i1 %exitcond40, label %.preheader7.us.preheader, label %.preheader8.us

.preheader7.us.preheader:                         ; preds = %._crit_edge14.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %26 = mul nuw nsw i64 %indvars.iv28, 1000
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %34 ]
  %28 = add nuw nsw i64 %indvars.iv24, %26
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
  br i1 %exitcond31, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us ]
  %43 = mul nuw nsw i64 %indvars.iv19, 1000
  br label %44

; <label>:44:                                     ; preds = %51, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %51 ]
  %45 = add nuw nsw i64 %indvars.iv, %43
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
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20, !21}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
