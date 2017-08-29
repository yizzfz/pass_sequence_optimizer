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
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
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
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %17 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
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
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]* nocapture, [1200 x double]*, double*) unnamed_addr #2 {
.lr.ph42:
  %4 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph37.us

.lr.ph37.us:                                      ; preds = %._crit_edge38.us, %.lr.ph42
  %indvars.iv34 = phi i64 [ 0, %.lr.ph42 ], [ %indvars.iv.next35, %._crit_edge38.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv34
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr71 = shl i64 %indvars.iv34, 3
  %sunkaddr72 = add i64 %4, %sunkaddr71
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph37.us
  %indvars.iv31 = phi i64 [ 0, %.lr.ph37.us ], [ %indvars.iv.next32.4, %._crit_edge ]
  %6 = phi double [ 0.000000e+00, %.lr.ph37.us ], [ %21, %._crit_edge ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv34
  %8 = load double, double* %7, align 8
  %9 = fadd double %6, %8
  store double %9, double* %sunkaddr73, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next32, i64 %indvars.iv34
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  store double %12, double* %sunkaddr73, align 8
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next32.1, i64 %indvars.iv34
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %sunkaddr73, align 8
  %indvars.iv.next32.2 = add nuw nsw i64 %indvars.iv31, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next32.2, i64 %indvars.iv34
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %sunkaddr73, align 8
  %indvars.iv.next32.3 = add nuw nsw i64 %indvars.iv31, 4
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next32.3, i64 %indvars.iv34
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  store double %21, double* %sunkaddr73, align 8
  %indvars.iv.next32.4 = add nuw nsw i64 %indvars.iv31, 5
  %exitcond33.4 = icmp eq i64 %indvars.iv.next32.4, 1400
  br i1 %exitcond33.4, label %._crit_edge38.us, label %._crit_edge

._crit_edge38.us:                                 ; preds = %._crit_edge
  %22 = fdiv double %21, %0
  %sunkaddr109 = shl i64 %indvars.iv34, 3
  %sunkaddr110 = add i64 %sunkaddr, %sunkaddr109
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to double*
  store double %22, double* %sunkaddr111, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond36, label %._crit_edge38.us..preheader6.us_crit_edge, label %.lr.ph37.us

._crit_edge38.us..preheader6.us_crit_edge:        ; preds = %._crit_edge38.us
  %scevgep92 = getelementptr double, double* %3, i64 1200
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge33.us, %._crit_edge38.us..preheader6.us_crit_edge
  %indvars.iv27 = phi i64 [ 0, %._crit_edge38.us..preheader6.us_crit_edge ], [ %23, %._crit_edge33.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 0
  %23 = add nuw nsw i64 %indvars.iv27, 1
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %1, i64 %23, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep92
  %bound1 = icmp ugt double* %scevgep90, %3
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %24 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 %offset.idx
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec97 = load <8 x double>, <8 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %28 = fsub <8 x double> %wide.vec97, %wide.vec
  %29 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %30 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %31 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %32 = or i64 %offset.idx, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 %32
  %34 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %35 = getelementptr double, double* %33, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  %37 = shufflevector <2 x double> %29, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %38 = shufflevector <2 x double> %31, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %37, <4 x double> %38, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %39 = icmp eq i64 %index.next, 300
  br i1 %39, label %._crit_edge33.us.loopexit118, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.3, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv24
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv24
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next25
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv.next25
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next25.1 = or i64 %indvars.iv24, 2
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next25.1
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv.next25.1
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next25.2 = or i64 %indvars.iv24, 3
  %55 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next25.2
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv.next25.2
  %58 = load double, double* %57, align 8
  %59 = fsub double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next25.3 = add nuw nsw i64 %indvars.iv24, 4
  %exitcond26.3 = icmp eq i64 %indvars.iv.next25.3, 1200
  br i1 %exitcond26.3, label %._crit_edge33.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge33.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge33.us

._crit_edge33.us.loopexit118:                     ; preds = %vector.body
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us.loopexit118, %._crit_edge33.us.loopexit
  %exitcond29 = icmp eq i64 %23, 1400
  br i1 %exitcond29, label %.preheader.lr.ph, label %vector.memcheck

.preheader.lr.ph:                                 ; preds = %._crit_edge33.us
  %60 = fadd double %0, -1.000000e+00
  br label %.lr.ph27.us

.lr.ph27.us:                                      ; preds = %._crit_edge28.us-lcssa.us.us, %.preheader.lr.ph
  %indvars.iv21 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next22, %._crit_edge28.us-lcssa.us.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21
  %sunkaddr66 = ptrtoint [1200 x double]* %61 to i64
  %sunkaddr112 = ptrtoint [1200 x double]* %61 to i64
  br label %.lr.ph.us.us

._crit_edge28.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond23, label %._crit_edge30, label %.lr.ph27.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph27.us
  %indvars.iv18 = phi i64 [ %indvars.iv21, %.lr.ph27.us ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv18
  store double 0.000000e+00, double* %62, align 8
  %sunkaddr67 = shl i64 %indvars.iv18, 3
  %sunkaddr68 = add i64 %sunkaddr66, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  br label %._crit_edge106

._crit_edge.us.us:                                ; preds = %._crit_edge106
  %63 = fdiv double %77, %60
  %sunkaddr113 = shl i64 %indvars.iv18, 3
  %sunkaddr114 = add i64 %sunkaddr112, %sunkaddr113
  %sunkaddr115 = inttoptr i64 %sunkaddr114 to double*
  store double %63, double* %sunkaddr115, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv21
  store double %63, double* %64, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond20, label %._crit_edge28.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge106:                                   ; preds = %._crit_edge106, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge106 ]
  %65 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %77, %._crit_edge106 ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv21
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv18
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %sunkaddr69, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv21
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv18
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %71, %76
  store double %77, double* %sunkaddr69, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge106

._crit_edge30:                                    ; preds = %._crit_edge28.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next2, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge8

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
