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
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %19 ]
  %4 = trunc i64 %indvars.iv4 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %11 = trunc i64 %indvars.iv to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph30.split.us.preheader:
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr94 = ptrtoint double* %5 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv60 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next61, %._crit_edge27.us ]
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv60
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr71 = shl i64 %indvars.iv60, 3
  %sunkaddr72 = add i64 %sunkaddr, %sunkaddr71
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph30.split.us
  %7 = phi double [ 0.000000e+00, %.lr.ph30.split.us ], [ %19, %._crit_edge ]
  %indvars.iv57 = phi i64 [ 0, %.lr.ph30.split.us ], [ %indvars.iv.next58.3, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv60
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %sunkaddr73, align 8
  %indvars.iv.next58 = or i64 %indvars.iv57, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next58, i64 %indvars.iv60
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr73, align 8
  %indvars.iv.next58.1 = or i64 %indvars.iv57, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next58.1, i64 %indvars.iv60
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr73, align 8
  %indvars.iv.next58.2 = or i64 %indvars.iv57, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next58.2, i64 %indvars.iv60
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr73, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %exitcond59.3 = icmp eq i64 %indvars.iv.next58.3, 1400
  br i1 %exitcond59.3, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %20 = fdiv double %19, %2
  %sunkaddr95 = shl i64 %indvars.iv60, 3
  %sunkaddr96 = add i64 %sunkaddr94, %sunkaddr95
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to double*
  store double %20, double* %sunkaddr97, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond62, label %._crit_edge27.us..preheader6.us_crit_edge, label %.lr.ph30.split.us

._crit_edge27.us..preheader6.us_crit_edge:        ; preds = %._crit_edge27.us
  %scevgep82 = getelementptr double, double* %5, i64 1200
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge22.us, %._crit_edge27.us..preheader6.us_crit_edge
  %indvars.iv53 = phi i64 [ 0, %._crit_edge27.us..preheader6.us_crit_edge ], [ %21, %._crit_edge22.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv53, i64 0
  %21 = add i64 %indvars.iv53, 1
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %3, i64 %21, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep82
  %bound1 = icmp ugt double* %scevgep80, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge67.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader6.us
  br label %vector.body

._crit_edge67.preheader:                          ; preds = %.preheader6.us
  br label %._crit_edge67

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %22 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv53, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec87 = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = fsub <8 x double> %wide.vec87, %wide.vec
  %27 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %28 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %29 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %30 = or i64 %offset.idx, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv53, i64 %30
  %32 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 2
  %37 = icmp eq i64 %index.next, 300
  br i1 %37, label %._crit_edge22.us.loopexit98, label %vector.body, !llvm.loop !6

._crit_edge67:                                    ; preds = %._crit_edge67.preheader, %._crit_edge67
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %._crit_edge67 ], [ 0, %._crit_edge67.preheader ]
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv50
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv53, i64 %indvars.iv50
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %39
  store double %42, double* %40, align 8
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next51
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv53, i64 %indvars.iv.next51
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next51.1 = or i64 %indvars.iv50, 2
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next51.1
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv53, i64 %indvars.iv.next51.1
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next51.2 = or i64 %indvars.iv50, 3
  %53 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next51.2
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv53, i64 %indvars.iv.next51.2
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %exitcond52.3 = icmp eq i64 %indvars.iv.next51.3, 1200
  br i1 %exitcond52.3, label %._crit_edge22.us.loopexit, label %._crit_edge67, !llvm.loop !9

._crit_edge22.us.loopexit:                        ; preds = %._crit_edge67
  br label %._crit_edge22.us

._crit_edge22.us.loopexit98:                      ; preds = %vector.body
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit98, %._crit_edge22.us.loopexit
  %exitcond55 = icmp eq i64 %21, 1400
  br i1 %exitcond55, label %.preheader.us.preheader, label %.preheader6.us

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  %58 = fadd double %2, -1.000000e+00
  br label %.lr.ph10.us

._crit_edge11.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond41, label %._crit_edge13, label %.lr.ph10.us

.lr.ph10.us:                                      ; preds = %._crit_edge11.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv39 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next40, %._crit_edge11.us-lcssa.us.us ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph10.us
  %indvars.iv36 = phi i64 [ %indvars.iv39, %.lr.ph10.us ], [ %indvars.iv.next37, %._crit_edge.us.us ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv36
  store double 0.000000e+00, double* %59, align 8
  br label %._crit_edge68

._crit_edge.us.us:                                ; preds = %._crit_edge68
  %60 = fdiv double %74, %58
  store double %60, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv39
  store double %60, double* %61, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond38, label %._crit_edge11.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge68:                                    ; preds = %._crit_edge68, %.lr.ph.us.us
  %62 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %74, %._crit_edge68 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge68 ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv39
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv36
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %59, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv39
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv36
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %68, %73
  store double %74, double* %59, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge68

._crit_edge13:                                    ; preds = %._crit_edge11.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge8

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
 <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec144 = shufflevector <4 x double> %99, <4 x double> %100, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec144, <8 x double>* %98, align 8, !alias.scope !11, !noalias !8
  %index.next128 = add i64 %index127, 2
  %101 = icmp eq i64 %index.next128, %n.vec113
  br i1 %101, label %middle.block108, label %vector.body107, !llvm.loop !13

middle.block108:                                  ; preds = %vector.body107
  %cmp.n131 = icmp eq i64 %n.mod.vf112, 0
  br i1 %cmp.n131, label %._crit_edge22.us, label %.preheader6.us.new.preheader146

.preheader6.us.new.preheader146:                  ; preds = %middle.block108, %vector.memcheck, %min.iters.checked111, %.preheader6.us.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %vector.memcheck ], [ %indvars.iv58.unr, %min.iters.checked111 ], [ %indvars.iv58.unr, %.preheader6.us.new.preheader ], [ %ind.end130, %middle.block108 ]
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new, %.preheader6.us.new.preheader146
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %.preheader6.us.new ], [ %indvars.iv58.ph, %.preheader6.us.new.preheader146 ]
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58
  %105 = load double, double* %104, align 8
  %106 = fsub double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.1
  %115 = load double, double* %114, align 8
  %116 = fsub double %115, %113
  store double %116, double* %114, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %117 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.2
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.2
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %118
  store double %121, double* %119, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next59.3, %wide.trip.count60.3
  br i1 %exitcond61.3, label %._crit_edge22.us.loopexit, label %.preheader6.us.new, !llvm.loop !14

._crit_edge22.us.loopexit:                        ; preds = %.preheader6.us.new
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %middle.block108, %.prol.loopexit63
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %.preheader5.loopexit, label %.preheader6.us

.lr.ph30.split:                                   ; preds = %.lr.ph30.split, %.lr.ph30.split.preheader147
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.3, %.lr.ph30.split ], [ %indvars.iv84.ph, %.lr.ph30.split.preheader147 ]
  %122 = getelementptr inbounds double, double* %5, i64 %indvars.iv84
  store double %13, double* %122, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %123 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85
  store double %14, double* %123, align 8
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %124 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.1
  store double %15, double* %124, align 8
  %indvars.iv.next85.2 = add nsw i64 %indvars.iv84, 3
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.2
  store double %16, double* %125, align 8
  %indvars.iv.next85.3 = add nsw i64 %indvars.iv84, 4
  %exitcond87.3 = icmp eq i64 %indvars.iv.next85.3, %wide.trip.count86.3
  br i1 %exitcond87.3, label %.preheader7.loopexit148, label %.lr.ph30.split, !llvm.loop !15

.preheader5.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7
  %126 = icmp sgt i32 %0, 0
  br i1 %126, label %.preheader.lr.ph, label %._crit_edge13

.preheader.lr.ph:                                 ; preds = %.preheader5
  %127 = icmp sgt i32 %1, 0
  %128 = fadd double %2, -1.000000e+00
  br i1 %127, label %.lr.ph10.us.preheader, label %.preheader.preheader

.lr.ph10.us.preheader:                            ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %129 = icmp eq i32 %1, 1
  %wide.trip.count38 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  br label %.lr.ph10.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %130 = zext i32 %0 to i64
  %131 = add i32 %0, -1
  %132 = zext i32 %131 to i64
  %wide.trip.count56 = zext i32 %0 to i64
  %133 = fdiv double 0.000000e+00, %128
  %134 = fdiv double 0.000000e+00, %128
  %wide.trip.count48.1 = zext i32 %0 to i64
  %135 = fdiv double 0.000000e+00, %128
  %136 = add nsw i64 %wide.trip.count56, -2
  br label %.lr.ph10

._crit_edge11.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge13.loopexit, label %.lr.ph10.us

.lr.ph10.us:                                      ; preds = %._crit_edge11.us-lcssa.us.us, %.lr.ph10.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge11.us-lcssa.us.us ], [ 0, %.lr.ph10.us.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv40
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph10.us
  %indvars.iv36 = phi i64 [ %indvars.iv40, %.lr.ph10.us ], [ %indvars.iv.next37, %._crit_edge.us.us ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv36
  store double 0.000000e+00, double* %138, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %139 = load double, double* %137, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv36
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = load double, double* %138, align 8
  %144 = fadd double %143, %142
  store double %144, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %129, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %145 = load double, double* %138, align 8
  %146 = fdiv double %145, %128
  store double %146, double* %138, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv40
  store double %146, double* %147, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %._crit_edge11.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv40
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv36
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = load double, double* %138, align 8
  %154 = fadd double %153, %152
  store double %154, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv40
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv36
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = load double, double* %138, align 8
  %161 = fadd double %160, %159
  store double %161, double* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph10:                                         ; preds = %._crit_edge11, %.preheader.preheader
  %indvars.iv54 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next55, %._crit_edge11 ]
  %162 = sub i64 %132, %indvars.iv54
  %163 = trunc i64 %162 to i32
  %164 = sub i64 %130, %indvars.iv54
  %xtraiter5291 = and i64 %164, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter5291, 0
  br i1 %lcmp.mod53, label %.prol.loopexit51, label %.prol.preheader50

.prol.preheader50:                                ; preds = %.lr.ph10
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv54
  store double %135, double* %165, align 8
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv54, 1
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.prol.preheader50, %.lr.ph10
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader50 ], [ %indvars.iv54, %.lr.ph10 ]
  %166 = icmp eq i32 %163, 0
  br i1 %166, label %._crit_edge11, label %.lr.ph10.new.preheader

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit51
  %167 = sub i64 %136, %indvars.iv46.unr.ph
  %168 = lshr i64 %167, 1
  %169 = and i64 %168, 1
  %lcmp.mod150 = icmp eq i64 %169, 0
  br i1 %lcmp.mod150, label %.lr.ph10.new.prol.preheader, label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.preheader:                      ; preds = %.lr.ph10.new.preheader
  br label %.lr.ph10.new.prol

.lr.ph10.new.prol:                                ; preds = %.lr.ph10.new.prol.preheader
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46.unr.ph
  store double %133, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46.unr.ph, i64 %indvars.iv54
  store double %133, double* %171, align 8
  %indvars.iv.next47.prol151 = add nuw nsw i64 %indvars.iv46.unr.ph, 1
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.prol151
  store double %134, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.prol151, i64 %indvars.iv54
  store double %134, double* %173, align 8
  %indvars.iv.next47.1.prol = add nsw i64 %indvars.iv46.unr.ph, 2
  br label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph10.new.prol, %.lr.ph10.new.preheader
  %indvars.iv46.unr.ph152 = phi i64 [ %indvars.iv.next47.1.prol, %.lr.ph10.new.prol ], [ %indvars.iv46.unr.ph, %.lr.ph10.new.preheader ]
  br label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.loopexit:                       ; preds = %.lr.ph10.new.prol.loopexit.unr-lcssa
  %174 = icmp eq i64 %168, 0
  br i1 %174, label %._crit_edge11.loopexit, label %.lr.ph10.new.preheader.new

.lr.ph10.new.preheader.new:                       ; preds = %.lr.ph10.new.prol.loopexit
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %.lr.ph10.new, %.lr.ph10.new.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr.ph152, %.lr.ph10.new.preheader.new ], [ %indvars.iv.next47.1.1, %.lr.ph10.new ]
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46
  store double %133, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv54
  store double %133, double* %176, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47
  store double %134, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %indvars.iv54
  store double %134, double* %178, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1
  store double %133, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1, i64 %indvars.iv54
  store double %133, double* %180, align 8
  %indvars.iv.next47.1153 = add nsw i64 %indvars.iv46, 3
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1153
  store double %134, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1153, i64 %indvars.iv54
  store double %134, double* %182, align 8
  %indvars.iv.next47.1.1 = add nsw i64 %indvars.iv46, 4
  %exitcond49.1.1 = icmp eq i64 %indvars.iv.next47.1.1, %wide.trip.count48.1
  br i1 %exitcond49.1.1, label %._crit_edge11.loopexit.unr-lcssa, label %.lr.ph10.new

._crit_edge11.loopexit.unr-lcssa:                 ; preds = %.lr.ph10.new
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge11.loopexit.unr-lcssa, %.lr.ph10.new.prol.loopexit
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.prol.loopexit51
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge13.loopexit145, label %.lr.ph10

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us-lcssa.us.us
  br label %._crit_edge13

._crit_edge13.loopexit145:                        ; preds = %._crit_edge11
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit145, %._crit_edge13.loopexit, %.preheader5, %.preheader6.lr.ph
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
!15 = distinct !{!15, !16, !4, !5}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
