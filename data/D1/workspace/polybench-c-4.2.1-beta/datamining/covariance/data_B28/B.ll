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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.lr.ph37.split.us.preheader:
  %6 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr105 = ptrtoint double* %5 to i64
  br label %.lr.ph37.split.us

.lr.ph37.split.us:                                ; preds = %._crit_edge34.us, %.lr.ph37.split.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.lr.ph37.split.us.preheader ], [ %indvars.iv.next68, %._crit_edge34.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv67
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr5.us = shl i64 %indvars.iv67, 3
  %sunkaddr6.us = add i64 %sunkaddr5.us, %6
  %sunkaddr7.us = inttoptr i64 %sunkaddr6.us to double*
  %.pre = load double, double* %sunkaddr7.us, align 8
  %sunkaddr102 = shl i64 %indvars.iv67, 3
  %sunkaddr103 = add i64 %sunkaddr, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph37.split.us
  %8 = phi double [ %.pre, %.lr.ph37.split.us ], [ %20, %._crit_edge ]
  %indvars.iv64 = phi i64 [ 0, %.lr.ph37.split.us ], [ %indvars.iv.next65.3, %._crit_edge ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv67
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr104, align 8
  %indvars.iv.next65 = or i64 %indvars.iv64, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next65, i64 %indvars.iv67
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr104, align 8
  %indvars.iv.next65.1 = or i64 %indvars.iv64, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next65.1, i64 %indvars.iv67
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr104, align 8
  %indvars.iv.next65.2 = or i64 %indvars.iv64, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next65.2, i64 %indvars.iv67
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr104, align 8
  %indvars.iv.next65.3 = add nsw i64 %indvars.iv64, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next65.3, 1400
  br i1 %exitcond66.3, label %._crit_edge34.us, label %._crit_edge

._crit_edge34.us:                                 ; preds = %._crit_edge
  %21 = fdiv double %20, %2
  %sunkaddr106 = shl i64 %indvars.iv67, 3
  %sunkaddr107 = add i64 %sunkaddr105, %sunkaddr106
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to double*
  store double %21, double* %sunkaddr108, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 1200
  br i1 %exitcond69, label %._crit_edge34.us..preheader13.us_crit_edge, label %.lr.ph37.split.us

._crit_edge34.us..preheader13.us_crit_edge:       ; preds = %._crit_edge34.us
  %scevgep90 = getelementptr double, double* %5, i64 1200
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge29.us, %._crit_edge34.us..preheader13.us_crit_edge
  %indvars.iv60 = phi i64 [ 0, %._crit_edge34.us..preheader13.us_crit_edge ], [ %22, %._crit_edge29.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 0
  %22 = add i64 %indvars.iv60, 1
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %3, i64 %22, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep90
  %bound1 = icmp ugt double* %scevgep88, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge74.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader13.us
  br label %vector.body

._crit_edge74.preheader:                          ; preds = %.preheader13.us
  br label %._crit_edge74

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %23 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec95 = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = fsub <8 x double> %wide.vec95, %wide.vec
  %28 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %29 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %30 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %31 = or i64 %offset.idx, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %31
  %33 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 2
  %38 = icmp eq i64 %index.next, 300
  br i1 %38, label %._crit_edge29.us.loopexit109, label %vector.body, !llvm.loop !6

._crit_edge74:                                    ; preds = %._crit_edge74.preheader, %._crit_edge74
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.3, %._crit_edge74 ], [ 0, %._crit_edge74.preheader ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv57
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv57
  %42 = load double, double* %41, align 8
  %43 = fsub double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next58 = or i64 %indvars.iv57, 1
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next58
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv.next58
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next58.1 = or i64 %indvars.iv57, 2
  %49 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next58.1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv.next58.1
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next58.2 = or i64 %indvars.iv57, 3
  %54 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next58.2
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv.next58.2
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %exitcond59.3 = icmp eq i64 %indvars.iv.next58.3, 1200
  br i1 %exitcond59.3, label %._crit_edge29.us.loopexit, label %._crit_edge74, !llvm.loop !9

._crit_edge29.us.loopexit:                        ; preds = %._crit_edge74
  br label %._crit_edge29.us

._crit_edge29.us.loopexit109:                     ; preds = %vector.body
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit109, %._crit_edge29.us.loopexit
  %exitcond62 = icmp eq i64 %22, 1400
  br i1 %exitcond62, label %.preheader.us.preheader, label %.preheader13.us

.preheader.us.preheader:                          ; preds = %._crit_edge29.us
  %59 = fadd double %2, -1.000000e+00
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
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv43
  store double 0.000000e+00, double* %60, align 8
  br label %._crit_edge75

._crit_edge.us.us:                                ; preds = %._crit_edge75
  %61 = fdiv double %75, %59
  store double %61, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv46
  store double %61, double* %62, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond45, label %._crit_edge18.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge75:                                    ; preds = %._crit_edge75, %.lr.ph.us.us
  %63 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %75, %._crit_edge75 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge75 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv46
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv43
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %60, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv46
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv43
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %60, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge75

._crit_edge20:                                    ; preds = %._crit_edge18.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge8

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
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
