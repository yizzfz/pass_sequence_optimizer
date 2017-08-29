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
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %2, %15
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

.preheader:                                       ; preds = %19, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %3 = trunc i64 %indvars.iv15 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = trunc i64 %indvars.iv4 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv4
  %11 = trunc i64 %indvars.iv4 to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %6, %15
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %7

; <label>:19:                                     ; preds = %7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.lr.ph53.split.us.preheader:
  %4 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %._crit_edge49.us, %.lr.ph53.split.us.preheader
  %indvars.iv1750.us = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next18.us, %._crit_edge49.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv1750.us
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr1 = shl i64 %indvars.iv1750.us, 3
  %sunkaddr2 = add i64 %4, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br label %6

; <label>:6:                                      ; preds = %6, %.lr.ph53.split.us
  %7 = phi double [ 0.000000e+00, %.lr.ph53.split.us ], [ %19, %6 ]
  %indvars.iv1546.us = phi i64 [ 0, %.lr.ph53.split.us ], [ %indvars.iv.next16.us.3, %6 ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1546.us, i64 %indvars.iv1750.us
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %sunkaddr3, align 8
  %indvars.iv.next16.us = or i64 %indvars.iv1546.us, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next16.us, i64 %indvars.iv1750.us
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr3, align 8
  %indvars.iv.next16.us.1 = or i64 %indvars.iv1546.us, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next16.us.1, i64 %indvars.iv1750.us
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr3, align 8
  %indvars.iv.next16.us.2 = or i64 %indvars.iv1546.us, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next16.us.2, i64 %indvars.iv1750.us
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr3, align 8
  %indvars.iv.next16.us.3 = add nuw nsw i64 %indvars.iv1546.us, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next16.us.3, 1400
  br i1 %exitcond64.3, label %._crit_edge49.us, label %6

._crit_edge49.us:                                 ; preds = %6
  %20 = fdiv double %19, %0
  %sunkaddr18 = shl i64 %indvars.iv1750.us, 3
  %sunkaddr19 = add i64 %sunkaddr, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  store double %20, double* %sunkaddr20, align 8
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1750.us, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next18.us, 1200
  br i1 %exitcond65, label %._crit_edge49.us..preheader19.us_crit_edge, label %.lr.ph53.split.us

._crit_edge49.us..preheader19.us_crit_edge:       ; preds = %._crit_edge49.us
  %scevgep8 = getelementptr double, double* %3, i64 1200
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge42.us, %._crit_edge49.us..preheader19.us_crit_edge
  %indvars.iv1343.us = phi i64 [ %21, %._crit_edge42.us ], [ 0, %._crit_edge49.us..preheader19.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv1343.us, i64 0
  %21 = add nuw nsw i64 %indvars.iv1343.us, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %1, i64 %21, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ugt double* %scevgep6, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %22 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1343.us, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec13 = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = fsub <8 x double> %wide.vec13, %wide.vec
  %27 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %28 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %29 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %30 = or i64 %offset.idx, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1343.us, i64 %30
  %32 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %37 = icmp eq i64 %index.next, 300
  br i1 %37, label %._crit_edge42.us.loopexit23, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1140.us = phi i64 [ %indvars.iv.next12.us.3, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv1140.us
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1343.us, i64 %indvars.iv1140.us
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %39
  store double %42, double* %40, align 8
  %indvars.iv.next12.us = or i64 %indvars.iv1140.us, 1
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.us
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1343.us, i64 %indvars.iv.next12.us
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next12.us.1 = or i64 %indvars.iv1140.us, 2
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.us.1
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1343.us, i64 %indvars.iv.next12.us.1
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next12.us.2 = or i64 %indvars.iv1140.us, 3
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.us.2
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1343.us, i64 %indvars.iv.next12.us.2
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next12.us.3 = add nuw nsw i64 %indvars.iv1140.us, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next12.us.3, 1200
  br i1 %exitcond61.3, label %._crit_edge42.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge42.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge42.us

._crit_edge42.us.loopexit23:                      ; preds = %vector.body
  br label %._crit_edge42.us

._crit_edge42.us:                                 ; preds = %._crit_edge42.us.loopexit23, %._crit_edge42.us.loopexit
  %exitcond62 = icmp eq i64 %21, 1400
  br i1 %exitcond62, label %.preheader.us.preheader, label %vector.memcheck

.preheader.us.preheader:                          ; preds = %._crit_edge42.us
  %58 = fadd double %0, -1.000000e+00
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge25.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv926.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10.us, %._crit_edge25.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge25.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv926.us, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next10.us, 1200
  br i1 %exitcond59, label %._crit_edge29, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv722.us.us = phi i64 [ %indvars.iv926.us, %.lr.ph.us.us.preheader ], [ %indvars.iv.next8.us.us, %._crit_edge.us.us ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv926.us, i64 %indvars.iv722.us.us
  store double 0.000000e+00, double* %59, align 8
  br label %62

._crit_edge.us.us:                                ; preds = %62
  %60 = fdiv double %75, %58
  store double %60, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv722.us.us, i64 %indvars.iv926.us
  store double %60, double* %61, align 8
  %indvars.iv.next8.us.us = add nuw nsw i64 %indvars.iv722.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next8.us.us, 1200
  br i1 %exitcond.us.us, label %._crit_edge25.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:62:                                     ; preds = %62, %.lr.ph.us.us
  %63 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %75, %62 ]
  %indvars.iv20.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %62 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv20.us.us, i64 %indvars.iv926.us
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv20.us.us, i64 %indvars.iv722.us.us
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %59, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv20.us.us, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv926.us
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv722.us.us
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %59, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv20.us.us, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond58.1, label %._crit_edge.us.us, label %62

._crit_edge29:                                    ; preds = %._crit_edge25.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next3, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv26, 1200
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %indvars.iv5, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv5
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %13
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond10, label %._crit_edge8, label %.preheader

._crit_edge8:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
