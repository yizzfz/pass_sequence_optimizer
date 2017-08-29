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
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #3
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
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %17, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %17 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge2
  %indvars.iv = phi i64 [ 0, %._crit_edge2 ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
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
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond5, label %18, label %._crit_edge2

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph51.split.us.preheader:
  %4 = alloca double, align 8
  %5 = alloca [1200 x double]*, align 8
  %6 = alloca [1200 x double]*, align 8
  store double %0, double* %4, align 8
  store [1200 x double]* %1, [1200 x double]** %5, align 8
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  %7 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph51.split.us

.lr.ph51.split.us:                                ; preds = %._crit_edge46.us, %.lr.ph51.split.us.preheader
  %indvars.iv122 = phi i64 [ 0, %.lr.ph51.split.us.preheader ], [ %indvars.iv.next123, %._crit_edge46.us ]
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv122
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr160 = shl i64 %indvars.iv122, 3
  %sunkaddr161 = add i64 %7, %sunkaddr160
  %sunkaddr162 = inttoptr i64 %sunkaddr161 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph51.split.us
  %indvars.iv118 = phi i64 [ 0, %.lr.ph51.split.us ], [ %indvars.iv.next119.4, %._crit_edge ]
  %9 = phi double [ 0.000000e+00, %.lr.ph51.split.us ], [ %24, %._crit_edge ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv118, i64 %indvars.iv122
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  store double %12, double* %sunkaddr162, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119, i64 %indvars.iv122
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %sunkaddr162, align 8
  %indvars.iv.next119.1 = add nuw nsw i64 %indvars.iv118, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119.1, i64 %indvars.iv122
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %sunkaddr162, align 8
  %indvars.iv.next119.2 = add nuw nsw i64 %indvars.iv118, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119.2, i64 %indvars.iv122
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  store double %21, double* %sunkaddr162, align 8
  %indvars.iv.next119.3 = add nuw nsw i64 %indvars.iv118, 4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119.3, i64 %indvars.iv122
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  store double %24, double* %sunkaddr162, align 8
  %indvars.iv.next119.4 = add nuw nsw i64 %indvars.iv118, 5
  %exitcond140.4 = icmp eq i64 %indvars.iv.next119.4, 1400
  br i1 %exitcond140.4, label %._crit_edge46.us, label %._crit_edge

._crit_edge46.us:                                 ; preds = %._crit_edge
  %25 = fdiv double %24, %0
  %sunkaddr26 = shl i64 %indvars.iv122, 3
  %sunkaddr27 = add i64 %sunkaddr, %sunkaddr26
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to double*
  store double %25, double* %sunkaddr28, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next123, 1200
  br i1 %exitcond141, label %._crit_edge46.us..lr.ph38.split.us_crit_edge, label %.lr.ph51.split.us

._crit_edge46.us..lr.ph38.split.us_crit_edge:     ; preds = %._crit_edge46.us
  %scevgep11 = getelementptr double, double* %3, i64 1200
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge33.us, %._crit_edge46.us..lr.ph38.split.us_crit_edge
  %indvars.iv113 = phi i64 [ 0, %._crit_edge46.us..lr.ph38.split.us_crit_edge ], [ %26, %._crit_edge33.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 0
  %26 = add nuw nsw i64 %indvars.iv113, 1
  %scevgep9 = getelementptr [1200 x double], [1200 x double]* %1, i64 %26, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep11
  %bound1 = icmp ugt double* %scevgep9, %3
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %27 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %28 = bitcast double* %27 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 %offset.idx
  %30 = bitcast double* %29 to <8 x double>*
  %wide.vec16 = load <8 x double>, <8 x double>* %30, align 8, !alias.scope !4, !noalias !1
  %31 = fsub <8 x double> %wide.vec16, %wide.vec
  %32 = shufflevector <8 x double> %31, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %33 = shufflevector <8 x double> %31, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %34 = shufflevector <8 x double> %31, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %35 = or i64 %offset.idx, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 %35
  %37 = shufflevector <8 x double> %31, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %32, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %34, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %42 = icmp eq i64 %index.next, 300
  br i1 %42, label %._crit_edge33.us.loopexit29, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.3, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv109
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv109
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next110
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv.next110
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next110.1 = or i64 %indvars.iv109, 2
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next110.1
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv.next110.1
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next110.2 = or i64 %indvars.iv109, 3
  %58 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next110.2
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv.next110.2
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next110.3 = add nuw nsw i64 %indvars.iv109, 4
  %exitcond138.3 = icmp eq i64 %indvars.iv.next110.3, 1200
  br i1 %exitcond138.3, label %._crit_edge33.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge33.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge33.us

._crit_edge33.us.loopexit29:                      ; preds = %vector.body
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us.loopexit29, %._crit_edge33.us.loopexit
  %exitcond139 = icmp eq i64 %26, 1400
  br i1 %exitcond139, label %.lr.ph18.us.preheader, label %vector.memcheck

.lr.ph18.us.preheader:                            ; preds = %._crit_edge33.us
  br label %.lr.ph18.us

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader, %._crit_edge19.us-lcssa.us.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge19.us-lcssa.us.us ], [ 0, %.lr.ph18.us.preheader ]
  %63 = phi [1200 x double]* [ %67, %._crit_edge19.us-lcssa.us.us ], [ %2, %.lr.ph18.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge19.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 1200
  br i1 %exitcond94, label %._crit_edge24, label %.lr.ph18.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph18.us
  %indvars.iv83 = phi i64 [ %indvars.iv91, %.lr.ph18.us ], [ %indvars.iv.next84, %._crit_edge.us.us ]
  %64 = phi [1200 x double]* [ %63, %.lr.ph18.us ], [ %67, %._crit_edge.us.us ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv91, i64 %indvars.iv83
  store double 0.000000e+00, double* %65, align 8
  %66 = load [1200 x double]*, [1200 x double]** %5, align 8
  %67 = load [1200 x double]*, [1200 x double]** %6, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv91, i64 %indvars.iv83
  %.pre = load double, double* %68, align 8
  br label %._crit_edge22

._crit_edge.us.us:                                ; preds = %._crit_edge22
  %69 = load double, double* %4, align 8
  %70 = fadd double %69, -1.000000e+00
  %71 = fdiv double %85, %70
  store double %71, double* %68, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv83, i64 %indvars.iv91
  store double %71, double* %72, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond = icmp eq i64 %indvars.iv.next84, 1200
  br i1 %exitcond, label %._crit_edge19.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge22:                                    ; preds = %._crit_edge22, %.lr.ph.us.us
  %73 = phi double [ %.pre, %.lr.ph.us.us ], [ %85, %._crit_edge22 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge22 ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv, i64 %indvars.iv91
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv, i64 %indvars.iv83
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %78, %73
  store double %79, double* %68, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv.next, i64 %indvars.iv91
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv.next, i64 %indvars.iv83
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %84, %79
  store double %85, double* %68, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond136.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond136.1, label %._crit_edge.us.us, label %._crit_edge22

._crit_edge24:                                    ; preds = %._crit_edge19.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.lr.ph4.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 1200
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond12, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond11, label %16, label %.lr.ph4.split.us

; <label>:16:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
