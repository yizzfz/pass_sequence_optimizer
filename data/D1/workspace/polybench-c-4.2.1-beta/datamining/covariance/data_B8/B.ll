; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  call void @print_array([1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(double*, [1200 x double]*) #0 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %17, %2
  %indvars.iv711 = phi i64 [ 0, %2 ], [ %indvars.iv.next8, %17 ]
  %3 = trunc i64 %indvars.iv711 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv10 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv711, i64 %indvars.iv10
  %10 = or i32 %7, 1
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %8, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fmul <2 x double> %6, %13
  %15 = fdiv <2 x double> %14, <double 1.200000e+03, double 1.200000e+03>
  %16 = bitcast double* %9 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv711, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1400
  br i1 %exitcond9, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph104.split.us.preheader:
  br label %.lr.ph104.split.us

.lr.ph104.split.us:                               ; preds = %._crit_edge100.us, %.lr.ph104.split.us.preheader
  %indvars.iv70101.us = phi i64 [ 0, %.lr.ph104.split.us.preheader ], [ %indvars.iv.next71.us, %._crit_edge100.us ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv70101.us
  store double 0.000000e+00, double* %4, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph104.split.us
  %5 = phi double [ 0.000000e+00, %.lr.ph104.split.us ], [ %17, %._crit_edge ]
  %indvars.iv6897.us = phi i64 [ 0, %.lr.ph104.split.us ], [ %indvars.iv.next69.us.3, %._crit_edge ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6897.us, i64 %indvars.iv70101.us
  %7 = load double, double* %6, align 8
  %8 = fadd double %7, %5
  store double %8, double* %4, align 8
  %indvars.iv.next69.us = or i64 %indvars.iv6897.us, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next69.us, i64 %indvars.iv70101.us
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %4, align 8
  %indvars.iv.next69.us.1 = or i64 %indvars.iv6897.us, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next69.us.1, i64 %indvars.iv70101.us
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %4, align 8
  %indvars.iv.next69.us.2 = or i64 %indvars.iv6897.us, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next69.us.2, i64 %indvars.iv70101.us
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %4, align 8
  %indvars.iv.next69.us.3 = add nsw i64 %indvars.iv6897.us, 4
  %exitcond114.3 = icmp eq i64 %indvars.iv.next69.us.3, 1400
  br i1 %exitcond114.3, label %._crit_edge100.us, label %._crit_edge

._crit_edge100.us:                                ; preds = %._crit_edge
  %18 = fdiv double %17, %0
  store double %18, double* %4, align 8
  %indvars.iv.next71.us = add nuw nsw i64 %indvars.iv70101.us, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next71.us, 1200
  br i1 %exitcond115, label %._crit_edge100.us..preheader56.us_crit_edge, label %.lr.ph104.split.us

._crit_edge100.us..preheader56.us_crit_edge:      ; preds = %._crit_edge100.us
  %scevgep4 = getelementptr double, double* %3, i64 1200
  br label %.preheader56.us

.preheader56.us:                                  ; preds = %._crit_edge94.us, %._crit_edge100.us..preheader56.us_crit_edge
  %indvars.iv6695.us = phi i64 [ 0, %._crit_edge100.us..preheader56.us_crit_edge ], [ %19, %._crit_edge94.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv6695.us, i64 0
  %19 = add i64 %indvars.iv6695.us, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %1, i64 %19, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep4
  %bound1 = icmp ugt double* %scevgep2, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge117.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader56.us
  br label %vector.body

._crit_edge117.preheader:                         ; preds = %.preheader56.us
  br label %._crit_edge117

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %20 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %21 = bitcast double* %20 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6695.us, i64 %offset.idx
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec9 = load <8 x double>, <8 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = fsub <8 x double> %wide.vec9, %wide.vec
  %25 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %26 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %27 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %28 = or i64 %offset.idx, 3
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6695.us, i64 %28
  %30 = shufflevector <8 x double> %24, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %31 = getelementptr double, double* %29, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  %33 = shufflevector <2 x double> %25, <2 x double> %26, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %34 = shufflevector <2 x double> %27, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %33, <4 x double> %34, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 2
  %35 = icmp eq i64 %index.next, 300
  br i1 %35, label %._crit_edge94.us.loopexit14, label %vector.body, !llvm.loop !6

._crit_edge117:                                   ; preds = %._crit_edge117.preheader, %._crit_edge117
  %indvars.iv6492.us = phi i64 [ %indvars.iv.next65.us.3, %._crit_edge117 ], [ 0, %._crit_edge117.preheader ]
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv6492.us
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6695.us, i64 %indvars.iv6492.us
  %39 = load double, double* %38, align 8
  %40 = fsub double %39, %37
  store double %40, double* %38, align 8
  %indvars.iv.next65.us = or i64 %indvars.iv6492.us, 1
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next65.us
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6695.us, i64 %indvars.iv.next65.us
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next65.us.1 = or i64 %indvars.iv6492.us, 2
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next65.us.1
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6695.us, i64 %indvars.iv.next65.us.1
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next65.us.2 = or i64 %indvars.iv6492.us, 3
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next65.us.2
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6695.us, i64 %indvars.iv.next65.us.2
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next65.us.3 = add nsw i64 %indvars.iv6492.us, 4
  %exitcond111.3 = icmp eq i64 %indvars.iv.next65.us.3, 1200
  br i1 %exitcond111.3, label %._crit_edge94.us.loopexit, label %._crit_edge117, !llvm.loop !9

._crit_edge94.us.loopexit:                        ; preds = %._crit_edge117
  br label %._crit_edge94.us

._crit_edge94.us.loopexit14:                      ; preds = %vector.body
  br label %._crit_edge94.us

._crit_edge94.us:                                 ; preds = %._crit_edge94.us.loopexit14, %._crit_edge94.us.loopexit
  %exitcond112 = icmp eq i64 %19, 1400
  br i1 %exitcond112, label %.preheader.us.preheader, label %.preheader56.us

.preheader.us.preheader:                          ; preds = %._crit_edge94.us
  %56 = fadd double %0, -1.000000e+00
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge77.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv6278.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next63.us, %._crit_edge77.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge77.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next63.us = add nuw nsw i64 %indvars.iv6278.us, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next63.us, 1200
  br i1 %exitcond110, label %._crit_edge81, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv6074.us.us = phi i64 [ %indvars.iv6278.us, %.lr.ph.us.us.preheader ], [ %indvars.iv.next61.us.us, %._crit_edge.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6278.us, i64 %indvars.iv6074.us.us
  store double 0.000000e+00, double* %57, align 8
  br label %._crit_edge118

._crit_edge.us.us:                                ; preds = %._crit_edge118
  %58 = fdiv double %72, %56
  store double %58, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6074.us.us, i64 %indvars.iv6278.us
  store double %58, double* %59, align 8
  %indvars.iv.next61.us.us = add nuw nsw i64 %indvars.iv6074.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next61.us.us, 1200
  br i1 %exitcond.us.us, label %._crit_edge77.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge118:                                   ; preds = %._crit_edge118, %.lr.ph.us.us
  %60 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %72, %._crit_edge118 ]
  %indvars.iv72.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %._crit_edge118 ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv72.us.us, i64 %indvars.iv6278.us
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv72.us.us, i64 %indvars.iv6074.us.us
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %57, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv72.us.us, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv6278.us
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv6074.us.us
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %57, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv72.us.us, 2
  %exitcond108.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond108.1, label %._crit_edge.us.us, label %._crit_edge118

._crit_edge81:                                    ; preds = %._crit_edge77.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv1014.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11.us, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv1014.us, 1200
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv13.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv13.us, %5
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
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1014.us, i64 %indvars.iv13.us
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1014.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next11.us, 1200
  br i1 %exitcond, label %._crit_edge16, label %.preheader.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
