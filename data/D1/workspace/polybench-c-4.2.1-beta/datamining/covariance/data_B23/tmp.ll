; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %17, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %17 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %10 = or i32 %7, 1
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %8, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fmul <2 x double> %6, %13
  %15 = fdiv <2 x double> %14, <double 1.200000e+03, double 1.200000e+03>
  %16 = bitcast double* %9 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.lr.ph37.split.us.preheader:
  br label %.lr.ph37.split.us

.lr.ph37.split.us:                                ; preds = %._crit_edge34.us, %.lr.ph37.split.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.lr.ph37.split.us.preheader ], [ %indvars.iv.next68, %._crit_edge34.us ]
  %4 = ptrtoint double* %3 to i64
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv67
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr8.us = shl i64 %indvars.iv67, 3
  %sunkaddr9.us = add i64 %4, %sunkaddr8.us
  %sunkaddr10.us = inttoptr i64 %sunkaddr9.us to double*
  %.pre = load double, double* %sunkaddr10.us, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph37.split.us
  %6 = phi double [ %.pre, %.lr.ph37.split.us ], [ %18, %._crit_edge ]
  %indvars.iv64 = phi i64 [ 0, %.lr.ph37.split.us ], [ %indvars.iv.next65.3, %._crit_edge ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv67
  %8 = load double, double* %7, align 8
  %9 = fadd double %8, %6
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr14 = mul i64 %indvars.iv67, 8
  %sunkaddr15 = add i64 %sunkaddr, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  store double %9, double* %sunkaddr16, align 8
  %indvars.iv.next65 = or i64 %indvars.iv64, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next65, i64 %indvars.iv67
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr16, align 8
  %indvars.iv.next65.1 = or i64 %indvars.iv64, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next65.1, i64 %indvars.iv67
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr16, align 8
  %indvars.iv.next65.2 = or i64 %indvars.iv64, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next65.2, i64 %indvars.iv67
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr16, align 8
  %indvars.iv.next65.3 = add nuw nsw i64 %indvars.iv64, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next65.3, 1400
  br i1 %exitcond66.3, label %._crit_edge34.us, label %._crit_edge

._crit_edge34.us:                                 ; preds = %._crit_edge
  %19 = fdiv double %18, %0
  %sunkaddr17 = ptrtoint double* %3 to i64
  %sunkaddr18 = mul i64 %indvars.iv67, 8
  %sunkaddr19 = add i64 %sunkaddr17, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  store double %19, double* %sunkaddr20, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 1200
  br i1 %exitcond69, label %._crit_edge34.us..preheader6.us_crit_edge, label %.lr.ph37.split.us

._crit_edge34.us..preheader6.us_crit_edge:        ; preds = %._crit_edge34.us
  %scevgep89 = getelementptr double, double* %3, i64 1200
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge29.us, %._crit_edge34.us..preheader6.us_crit_edge
  %indvars.iv60 = phi i64 [ 0, %._crit_edge34.us..preheader6.us_crit_edge ], [ %20, %._crit_edge29.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv60, i64 0
  %20 = add nuw nsw i64 %indvars.iv60, 1
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %1, i64 %20, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep89
  %bound1 = icmp ugt double* %scevgep87, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge74.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader6.us
  br label %vector.body

._crit_edge74.preheader:                          ; preds = %.preheader6.us
  br label %._crit_edge74

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %21 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %22 = bitcast double* %21 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv60, i64 %offset.idx
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec94 = load <8 x double>, <8 x double>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = fsub <8 x double> %wide.vec94, %wide.vec
  %26 = shufflevector <8 x double> %25, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %27 = shufflevector <8 x double> %25, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %28 = shufflevector <8 x double> %25, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %29 = or i64 %offset.idx, 3
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv60, i64 %29
  %31 = shufflevector <8 x double> %25, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = shufflevector <2 x double> %26, <2 x double> %27, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %35 = shufflevector <2 x double> %28, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %34, <4 x double> %35, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %36 = icmp eq i64 %index.next, 300
  br i1 %36, label %._crit_edge29.us.loopexit21, label %vector.body, !llvm.loop !6

._crit_edge74:                                    ; preds = %._crit_edge74.preheader, %._crit_edge74
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.3, %._crit_edge74 ], [ 0, %._crit_edge74.preheader ]
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv57
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv57
  %40 = load double, double* %39, align 8
  %41 = fsub double %40, %38
  store double %41, double* %39, align 8
  %indvars.iv.next58 = or i64 %indvars.iv57, 1
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next58
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv.next58
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next58.1 = or i64 %indvars.iv57, 2
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next58.1
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv.next58.1
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next58.2 = or i64 %indvars.iv57, 3
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next58.2
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv.next58.2
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next58.3 = add nuw nsw i64 %indvars.iv57, 4
  %exitcond59.3 = icmp eq i64 %indvars.iv.next58.3, 1200
  br i1 %exitcond59.3, label %._crit_edge29.us.loopexit, label %._crit_edge74, !llvm.loop !9

._crit_edge29.us.loopexit:                        ; preds = %._crit_edge74
  br label %._crit_edge29.us

._crit_edge29.us.loopexit21:                      ; preds = %vector.body
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit21, %._crit_edge29.us.loopexit
  %exitcond62 = icmp eq i64 %20, 1400
  br i1 %exitcond62, label %.preheader.us.preheader, label %.preheader6.us

.preheader.us.preheader:                          ; preds = %._crit_edge29.us
  %57 = fadd double %0, -1.000000e+00
  br label %.lr.ph17.us

._crit_edge18.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond48, label %._crit_edge20, label %.lr.ph17.us

.lr.ph17.us:                                      ; preds = %._crit_edge18.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge18.us-lcssa.us.us ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph17.us
  %indvars.iv43 = phi i64 [ %indvars.iv46, %.lr.ph17.us ], [ %indvars.iv.next44, %._crit_edge.us.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv43
  store double 0.000000e+00, double* %58, align 8
  br label %._crit_edge75

._crit_edge.us.us:                                ; preds = %._crit_edge75
  %59 = fdiv double %73, %57
  store double %59, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv46
  store double %59, double* %60, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond45, label %._crit_edge18.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge75:                                    ; preds = %._crit_edge75, %.lr.ph.us.us
  %61 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %73, %._crit_edge75 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge75 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv46
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv43
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv46
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv43
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %58, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge75

._crit_edge20:                                    ; preds = %._crit_edge18.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge8

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
