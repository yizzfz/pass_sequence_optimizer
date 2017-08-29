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
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %17 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge2
  %indvars.iv = phi i64 [ 0, %._crit_edge2 ], [ %indvars.iv.next.1, %._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %6, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = insertelement <2 x double> undef, double %4, i32 0
  %13 = insertelement <2 x double> %12, double %4, i32 1
  %14 = fmul <2 x double> %13, %11
  %15 = fdiv <2 x double> %14, <double 1.200000e+03, double 1.200000e+03>
  %16 = bitcast double* %7 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %18, label %._crit_edge2

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph28.split.us.preheader:
  %4 = ptrtoint double* %3 to i64
  %5 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %._crit_edge25.us, %.lr.ph28.split.us.preheader
  %indvars.iv72 = phi i64 [ 0, %.lr.ph28.split.us.preheader ], [ %indvars.iv.next73, %._crit_edge25.us ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv72
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr104 = shl i64 %indvars.iv72, 3
  %sunkaddr105 = add i64 %4, %sunkaddr104
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to double*
  %sunkaddr104.1 = shl i64 %indvars.iv72, 3
  %sunkaddr105.1 = add i64 %5, %sunkaddr104.1
  %sunkaddr106.1 = inttoptr i64 %sunkaddr105.1 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph28.split.us
  %7 = phi double [ 0.000000e+00, %.lr.ph28.split.us ], [ %13, %._crit_edge ]
  %indvars.iv68 = phi i64 [ 0, %.lr.ph28.split.us ], [ %indvars.iv.next69.1, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv72
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %sunkaddr106, align 8
  %indvars.iv.next69 = or i64 %indvars.iv68, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next69, i64 %indvars.iv72
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr106.1, align 8
  %exitcond87.1 = icmp eq i64 %indvars.iv.next69, 1399
  %indvars.iv.next69.1 = add nuw nsw i64 %indvars.iv68, 2
  br i1 %exitcond87.1, label %._crit_edge25.us, label %._crit_edge

._crit_edge25.us:                                 ; preds = %._crit_edge
  %14 = fdiv double %13, %0
  %sunkaddr20 = shl i64 %indvars.iv72, 3
  %sunkaddr21 = add i64 %sunkaddr, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  store double %14, double* %sunkaddr22, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond75, label %._crit_edge25.us..lr.ph20.split.us_crit_edge, label %.lr.ph28.split.us

._crit_edge25.us..lr.ph20.split.us_crit_edge:     ; preds = %._crit_edge25.us
  %scevgep10 = getelementptr double, double* %3, i64 1200
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge17.us, %._crit_edge25.us..lr.ph20.split.us_crit_edge
  %indvars.iv63 = phi i64 [ 0, %._crit_edge25.us..lr.ph20.split.us_crit_edge ], [ %15, %._crit_edge17.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 0
  %15 = add nuw nsw i64 %indvars.iv63, 1
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %1, i64 %15, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep10
  %bound1 = icmp ugt double* %scevgep8, %3
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %16 = getelementptr inbounds double, double* %3, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = fsub <2 x double> %wide.load14, %wide.load
  %25 = fsub <2 x double> %wide.load15, %wide.load13
  store <2 x double> %24, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  store <2 x double> %25, <2 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %26 = getelementptr inbounds double, double* %3, i64 %index.next
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load13.1 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 %index.next
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load14.1 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !4, !noalias !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load15.1 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %34 = fsub <2 x double> %wide.load14.1, %wide.load.1
  %35 = fsub <2 x double> %wide.load15.1, %wide.load13.1
  store <2 x double> %34, <2 x double>* %31, align 8, !alias.scope !4, !noalias !1
  store <2 x double> %35, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nuw nsw i64 %index, 8
  %36 = icmp eq i64 %index.next.1, 1200
  br i1 %36, label %._crit_edge17.us.loopexit23, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv59 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next60.3, %scalar.ph ]
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv59
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv59
  %40 = load double, double* %39, align 8
  %41 = fsub double %40, %38
  store double %41, double* %39, align 8
  %indvars.iv.next60 = or i64 %indvars.iv59, 1
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next60
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next60
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next60.1 = or i64 %indvars.iv59, 2
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next60.1
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next60.1
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next60.2 = or i64 %indvars.iv59, 3
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next60.2
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next60.2
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %exitcond86.3 = icmp eq i64 %indvars.iv.next60.2, 1199
  %indvars.iv.next60.3 = add nuw nsw i64 %indvars.iv59, 4
  br i1 %exitcond86.3, label %._crit_edge17.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge17.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge17.us

._crit_edge17.us.loopexit23:                      ; preds = %vector.body
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit23, %._crit_edge17.us.loopexit
  %exitcond66 = icmp eq i64 %15, 1400
  br i1 %exitcond66, label %.lr.ph12.split.us.preheader, label %vector.memcheck

.lr.ph12.split.us.preheader:                      ; preds = %._crit_edge17.us
  %57 = fadd double %0, -1.000000e+00
  br label %.lr.ph8.us

.lr.ph8.us:                                       ; preds = %._crit_edge9.us-lcssa.us.us, %.lr.ph12.split.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.lr.ph12.split.us.preheader ], [ %indvars.iv.next46, %._crit_edge9.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge9.us-lcssa.us.us:                      ; preds = %._crit_edge.us.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond48, label %._crit_edge13, label %.lr.ph8.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph8.us
  %indvars.iv41 = phi i64 [ %indvars.iv45, %.lr.ph8.us ], [ %indvars.iv.next42, %._crit_edge.us.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %58, align 8
  br label %._crit_edge17

._crit_edge.us.us:                                ; preds = %._crit_edge17
  %59 = fdiv double %73, %57
  store double %59, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv41, i64 %indvars.iv45
  store double %59, double* %60, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond44, label %._crit_edge9.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge17:                                    ; preds = %._crit_edge17, %.lr.ph.us.us
  %61 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %73, %._crit_edge17 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge17 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv45
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv41
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv45
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv41
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %58, align 8
  %exitcond85.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond85.1, label %._crit_edge.us.us, label %._crit_edge17

._crit_edge13:                                    ; preds = %._crit_edge9.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next8, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv7, 1200
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv
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
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
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
