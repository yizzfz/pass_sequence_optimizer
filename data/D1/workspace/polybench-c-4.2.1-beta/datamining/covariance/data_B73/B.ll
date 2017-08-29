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
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %1, align 8
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %19, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %19 ]
  %4 = trunc i64 %indvars.iv4 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge10
  %indvars.iv = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next.1, %._crit_edge ]
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
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %20, label %._crit_edge10

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.lr.ph38.split.us.preheader:
  %sunkaddr94 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph38.split.us

.lr.ph38.split.us:                                ; preds = %._crit_edge34.us, %.lr.ph38.split.us.preheader
  %indvars.iv78 = phi i64 [ 0, %.lr.ph38.split.us.preheader ], [ %indvars.iv.next79, %._crit_edge34.us ]
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv78
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr95 = shl i64 %indvars.iv78, 3
  %sunkaddr96 = add i64 %sunkaddr94, %sunkaddr95
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph38.split.us
  %indvars.iv75 = phi i64 [ 0, %.lr.ph38.split.us ], [ %indvars.iv.next76.4, %._crit_edge ]
  %7 = phi double [ 0.000000e+00, %.lr.ph38.split.us ], [ %22, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv75, i64 %indvars.iv78
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %sunkaddr97, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next76, i64 %indvars.iv78
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr97, align 8
  %indvars.iv.next76.1 = add nuw nsw i64 %indvars.iv75, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next76.1, i64 %indvars.iv78
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  store double %16, double* %sunkaddr97, align 8
  %indvars.iv.next76.2 = add nuw nsw i64 %indvars.iv75, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next76.2, i64 %indvars.iv78
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %sunkaddr97, align 8
  %indvars.iv.next76.3 = add nuw nsw i64 %indvars.iv75, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next76.3, i64 %indvars.iv78
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  store double %22, double* %sunkaddr97, align 8
  %indvars.iv.next76.4 = add nuw nsw i64 %indvars.iv75, 5
  %exitcond77.4 = icmp eq i64 %indvars.iv.next76.4, 1400
  br i1 %exitcond77.4, label %._crit_edge34.us, label %._crit_edge

._crit_edge34.us:                                 ; preds = %._crit_edge
  %23 = fdiv double %22, %2
  %sunkaddr125 = shl i64 %indvars.iv78, 3
  %sunkaddr126 = add i64 %sunkaddr, %sunkaddr125
  %sunkaddr127 = inttoptr i64 %sunkaddr126 to double*
  store double %23, double* %sunkaddr127, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next79, 1200
  br i1 %exitcond80, label %._crit_edge34.us..lr.ph29.split.us_crit_edge, label %.lr.ph38.split.us

._crit_edge34.us..lr.ph29.split.us_crit_edge:     ; preds = %._crit_edge34.us
  %scevgep111 = getelementptr double, double* %5, i64 1200
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %._crit_edge26.us, %._crit_edge34.us..lr.ph29.split.us_crit_edge
  %indvars.iv71 = phi i64 [ 0, %._crit_edge34.us..lr.ph29.split.us_crit_edge ], [ %24, %._crit_edge26.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 0
  %24 = add nuw nsw i64 %indvars.iv71, 1
  %scevgep109 = getelementptr [1200 x double], [1200 x double]* %3, i64 %24, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep111
  %bound1 = icmp ugt double* %scevgep109, %5
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph29.split.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph29.split.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 2
  %25 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %offset.idx
  %28 = bitcast double* %27 to <8 x double>*
  %wide.vec116 = load <8 x double>, <8 x double>* %28, align 8, !alias.scope !4, !noalias !1
  %29 = fsub <8 x double> %wide.vec116, %wide.vec
  %30 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %31 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %32 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %33 = or i64 %offset.idx, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %33
  %35 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %36 = getelementptr double, double* %34, i64 -3
  %37 = bitcast double* %36 to <8 x double>*
  %38 = shufflevector <2 x double> %30, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %39 = shufflevector <2 x double> %32, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %38, <4 x double> %39, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %40 = icmp eq i64 %index.next, 300
  br i1 %40, label %._crit_edge26.us.loopexit128, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv68 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next69.3, %scalar.ph ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv68
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv68
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next69 = or i64 %indvars.iv68, 1
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next69
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv.next69
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next69.1 = or i64 %indvars.iv68, 2
  %51 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next69.1
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv.next69.1
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next69.2 = or i64 %indvars.iv68, 3
  %56 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next69.2
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv.next69.2
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next69.3 = add nuw nsw i64 %indvars.iv68, 4
  %exitcond70.3 = icmp eq i64 %indvars.iv.next69.3, 1200
  br i1 %exitcond70.3, label %._crit_edge26.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge26.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge26.us

._crit_edge26.us.loopexit128:                     ; preds = %vector.body
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit128, %._crit_edge26.us.loopexit
  %exitcond73 = icmp eq i64 %24, 1400
  br i1 %exitcond73, label %.lr.ph21.split.us.preheader, label %.lr.ph29.split.us

.lr.ph21.split.us.preheader:                      ; preds = %._crit_edge26.us
  %61 = fadd double %2, -1.000000e+00
  br label %.lr.ph17.us

.lr.ph17.us:                                      ; preds = %._crit_edge18.us-lcssa.us.us, %.lr.ph21.split.us.preheader
  %indvars.iv57 = phi i64 [ 0, %.lr.ph21.split.us.preheader ], [ %indvars.iv.next58, %._crit_edge18.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge18.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next58, 1200
  br i1 %exitcond59, label %._crit_edge22, label %.lr.ph17.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph17.us
  %indvars.iv54 = phi i64 [ %indvars.iv57, %.lr.ph17.us ], [ %indvars.iv.next55, %._crit_edge.us.us ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv54
  store double 0.000000e+00, double* %62, align 8
  br label %._crit_edge122

._crit_edge.us.us:                                ; preds = %._crit_edge122
  %63 = fdiv double %77, %61
  store double %63, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv57
  store double %63, double* %64, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond56, label %._crit_edge18.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge122:                                   ; preds = %._crit_edge122, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge122 ]
  %65 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %77, %._crit_edge122 ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv57
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv54
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %62, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv57
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv54
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %71, %76
  store double %77, double* %62, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge122

._crit_edge22:                                    ; preds = %._crit_edge18.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next8, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv7, 1200
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge13
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge13

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond9, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
