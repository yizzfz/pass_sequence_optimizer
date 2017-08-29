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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %18 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %10 = trunc i64 %indvars.iv to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %6, %14
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph87.split.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr26 = ptrtoint double* %3 to i64
  br label %.lr.ph87.split.us

.lr.ph87.split.us:                                ; preds = %._crit_edge84.us, %.lr.ph87.split.us.preheader
  %indvars.iv117 = phi i64 [ 0, %.lr.ph87.split.us.preheader ], [ %indvars.iv.next118, %._crit_edge84.us ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv117
  store double 0.000000e+00, double* %4, align 8
  %sunkaddr2 = shl i64 %indvars.iv117, 3
  %sunkaddr3 = add i64 %sunkaddr, %sunkaddr2
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph87.split.us
  %5 = phi double [ 0.000000e+00, %.lr.ph87.split.us ], [ %17, %._crit_edge ]
  %indvars.iv114 = phi i64 [ 0, %.lr.ph87.split.us ], [ %indvars.iv.next115.3, %._crit_edge ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv117
  %7 = load double, double* %6, align 8
  %8 = fadd double %7, %5
  store double %8, double* %sunkaddr4, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115, i64 %indvars.iv117
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr4, align 8
  %indvars.iv.next115.1 = or i64 %indvars.iv114, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115.1, i64 %indvars.iv117
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr4, align 8
  %indvars.iv.next115.2 = or i64 %indvars.iv114, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115.2, i64 %indvars.iv117
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr4, align 8
  %indvars.iv.next115.3 = add nuw nsw i64 %indvars.iv114, 4
  %exitcond116.3 = icmp eq i64 %indvars.iv.next115.3, 1400
  br i1 %exitcond116.3, label %._crit_edge84.us, label %._crit_edge

._crit_edge84.us:                                 ; preds = %._crit_edge
  %18 = fdiv double %17, %0
  %sunkaddr27 = shl i64 %indvars.iv117, 3
  %sunkaddr28 = add i64 %sunkaddr26, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  store double %18, double* %sunkaddr29, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next118, 1200
  br i1 %exitcond119, label %._crit_edge84.us..preheader63.us_crit_edge, label %.lr.ph87.split.us

._crit_edge84.us..preheader63.us_crit_edge:       ; preds = %._crit_edge84.us
  %scevgep13 = getelementptr double, double* %3, i64 1200
  br label %.preheader63.us

.preheader63.us:                                  ; preds = %._crit_edge79.us, %._crit_edge84.us..preheader63.us_crit_edge
  %indvars.iv110 = phi i64 [ 0, %._crit_edge84.us..preheader63.us_crit_edge ], [ %19, %._crit_edge79.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 0
  %19 = add nuw nsw i64 %indvars.iv110, 1
  %scevgep11 = getelementptr [1200 x double], [1200 x double]* %1, i64 %19, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep13
  %bound1 = icmp ugt double* %scevgep11, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge124.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader63.us
  br label %vector.body

._crit_edge124.preheader:                         ; preds = %.preheader63.us
  br label %._crit_edge124

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %20 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %21 = bitcast double* %20 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 %offset.idx
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec18 = load <8 x double>, <8 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = fsub <8 x double> %wide.vec18, %wide.vec
  %25 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %26 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %27 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %28 = or i64 %offset.idx, 3
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 %28
  %30 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %31 = getelementptr double, double* %29, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  %33 = shufflevector <2 x double> %25, <2 x double> %26, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %34 = shufflevector <2 x double> %27, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %33, <4 x double> %34, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %35 = icmp eq i64 %index.next, 300
  br i1 %35, label %._crit_edge79.us.loopexit30, label %vector.body, !llvm.loop !6

._crit_edge124:                                   ; preds = %._crit_edge124.preheader, %._crit_edge124
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.3, %._crit_edge124 ], [ 0, %._crit_edge124.preheader ]
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv107
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv107
  %39 = load double, double* %38, align 8
  %40 = fsub double %39, %37
  store double %40, double* %38, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next108
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next108
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next108.1 = or i64 %indvars.iv107, 2
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next108.1
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next108.1
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next108.2 = or i64 %indvars.iv107, 3
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next108.2
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next108.2
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next108.3 = add nuw nsw i64 %indvars.iv107, 4
  %exitcond109.3 = icmp eq i64 %indvars.iv.next108.3, 1200
  br i1 %exitcond109.3, label %._crit_edge79.us.loopexit, label %._crit_edge124, !llvm.loop !9

._crit_edge79.us.loopexit:                        ; preds = %._crit_edge124
  br label %._crit_edge79.us

._crit_edge79.us.loopexit30:                      ; preds = %vector.body
  br label %._crit_edge79.us

._crit_edge79.us:                                 ; preds = %._crit_edge79.us.loopexit30, %._crit_edge79.us.loopexit
  %exitcond112 = icmp eq i64 %19, 1400
  br i1 %exitcond112, label %.preheader.us.preheader, label %.preheader63.us

.preheader.us.preheader:                          ; preds = %._crit_edge79.us
  %56 = fadd double %0, -1.000000e+00
  br label %.lr.ph67.us

._crit_edge68.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next97, 1200
  br i1 %exitcond98, label %._crit_edge70, label %.lr.ph67.us

.lr.ph67.us:                                      ; preds = %._crit_edge68.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv96 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next97, %._crit_edge68.us-lcssa.us.us ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph67.us
  %indvars.iv93 = phi i64 [ %indvars.iv96, %.lr.ph67.us ], [ %indvars.iv.next94, %._crit_edge.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv96, i64 %indvars.iv93
  store double 0.000000e+00, double* %57, align 8
  br label %._crit_edge125

._crit_edge.us.us:                                ; preds = %._crit_edge125
  %58 = fdiv double %72, %56
  store double %58, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv93, i64 %indvars.iv96
  store double %58, double* %59, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next94, 1200
  br i1 %exitcond95, label %._crit_edge68.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge125:                                   ; preds = %._crit_edge125, %.lr.ph.us.us
  %60 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %72, %._crit_edge125 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge125 ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv96
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv93
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %57, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv96
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv93
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %57, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge125

._crit_edge70:                                    ; preds = %._crit_edge68.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv15, 1200
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge18
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
