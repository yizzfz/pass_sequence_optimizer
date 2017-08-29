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

.preheader:                                       ; preds = %18, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %18 ]
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
  %10 = trunc i64 %indvars.iv to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %6, %14
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr64 = ptrtoint double* %3 to i64
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %19, %4
  %indvars.iv28 = phi i64 [ 0, %4 ], [ %indvars.iv.next29, %19 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv28
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr41 = shl i64 %indvars.iv28, 3
  %sunkaddr42 = add i64 %sunkaddr, %sunkaddr41
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32, %._crit_edge33
  %6 = phi double [ 0.000000e+00, %._crit_edge33 ], [ %18, %._crit_edge32 ]
  %indvars.iv25 = phi i64 [ 0, %._crit_edge33 ], [ %indvars.iv.next26.3, %._crit_edge32 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv28
  %8 = load double, double* %7, align 8
  %9 = fadd double %8, %6
  store double %9, double* %sunkaddr43, align 8
  %indvars.iv.next26 = or i64 %indvars.iv25, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next26, i64 %indvars.iv28
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr43, align 8
  %indvars.iv.next26.1 = or i64 %indvars.iv25, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next26.1, i64 %indvars.iv28
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr43, align 8
  %indvars.iv.next26.2 = or i64 %indvars.iv25, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next26.2, i64 %indvars.iv28
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr43, align 8
  %indvars.iv.next26.3 = add nsw i64 %indvars.iv25, 4
  %exitcond27.3 = icmp eq i64 %indvars.iv.next26.3, 1400
  br i1 %exitcond27.3, label %19, label %._crit_edge32

; <label>:19:                                     ; preds = %._crit_edge32
  %20 = fdiv double %18, %0
  %sunkaddr65 = shl i64 %indvars.iv28, 3
  %sunkaddr66 = add i64 %sunkaddr64, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  store double %20, double* %sunkaddr67, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %..preheader6_crit_edge, label %._crit_edge33

..preheader6_crit_edge:                           ; preds = %19
  %scevgep52 = getelementptr double, double* %3, i64 1200
  br label %.preheader6

.preheader6:                                      ; preds = %middle.block, %..preheader6_crit_edge
  %indvars.iv22 = phi i64 [ 0, %..preheader6_crit_edge ], [ %21, %middle.block ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 0
  %21 = add i64 %indvars.iv22, 1
  %scevgep50 = getelementptr [1200 x double], [1200 x double]* %1, i64 %21, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep52
  %bound1 = icmp ugt double* %scevgep50, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge34.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader6
  br label %vector.body

._crit_edge34.preheader:                          ; preds = %.preheader6
  br label %._crit_edge34

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %22 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec57 = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = fsub <8 x double> %wide.vec57, %wide.vec
  %27 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %28 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %29 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %30 = or i64 %offset.idx, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %30
  %32 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 2
  %37 = icmp eq i64 %index.next, 300
  br i1 %37, label %middle.block.loopexit68, label %vector.body, !llvm.loop !6

.preheader5:                                      ; preds = %middle.block
  %38 = fadd double %0, -1.000000e+00
  br label %.lr.ph

._crit_edge34:                                    ; preds = %._crit_edge34.preheader, %._crit_edge34
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.3, %._crit_edge34 ], [ 0, %._crit_edge34.preheader ]
  %39 = getelementptr inbounds double, double* %3, i64 %indvars.iv19
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv19
  %42 = load double, double* %41, align 8
  %43 = fsub double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next20 = or i64 %indvars.iv19, 1
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next20
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next20.1 = or i64 %indvars.iv19, 2
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20.1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next20.1
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next20.2 = or i64 %indvars.iv19, 3
  %54 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20.2
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next20.2
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  %exitcond21.3 = icmp eq i64 %indvars.iv.next20.3, 1200
  br i1 %exitcond21.3, label %middle.block.loopexit, label %._crit_edge34, !llvm.loop !9

middle.block.loopexit:                            ; preds = %._crit_edge34
  br label %middle.block

middle.block.loopexit68:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit68, %middle.block.loopexit
  %exitcond24 = icmp eq i64 %21, 1400
  br i1 %exitcond24, label %.preheader5, label %.preheader6

.lr.ph:                                           ; preds = %._crit_edge, %.preheader5
  %indvars.iv16 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next17, %._crit_edge ]
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %73, %.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv16, %.lr.ph ], [ %indvars.iv.next14, %73 ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  store double 0.000000e+00, double* %59, align 8
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36, %._crit_edge37
  %60 = phi double [ 0.000000e+00, %._crit_edge37 ], [ %72, %._crit_edge36 ]
  %indvars.iv = phi i64 [ 0, %._crit_edge37 ], [ %indvars.iv.next.1, %._crit_edge36 ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv16
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv13
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %59, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv16
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv13
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %59, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %73, label %._crit_edge36

; <label>:73:                                     ; preds = %._crit_edge36
  %74 = fdiv double %72, %38
  store double %74, double* %59, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv16
  store double %74, double* %75, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %._crit_edge, label %._crit_edge37

._crit_edge:                                      ; preds = %73
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %76, label %.lr.ph

; <label>:76:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge7

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
