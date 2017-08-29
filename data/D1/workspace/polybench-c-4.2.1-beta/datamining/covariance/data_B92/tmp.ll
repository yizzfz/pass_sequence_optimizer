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
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %17, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %17 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge10
  %indvars.iv = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
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
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %18, label %._crit_edge10

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
  %5 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %23, %4
  %indvars.iv28 = phi i64 [ 0, %4 ], [ %indvars.iv.next29, %23 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv28
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr52 = shl i64 %indvars.iv28, 3
  %sunkaddr53 = add i64 %5, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %._crit_edge87, %._crit_edge88
  %indvars.iv25 = phi i64 [ 0, %._crit_edge88 ], [ %indvars.iv.next26.4, %._crit_edge87 ]
  %7 = phi double [ 0.000000e+00, %._crit_edge88 ], [ %22, %._crit_edge87 ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv28
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %sunkaddr54, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next26, i64 %indvars.iv28
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr54, align 8
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv25, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next26.1, i64 %indvars.iv28
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  store double %16, double* %sunkaddr54, align 8
  %indvars.iv.next26.2 = add nuw nsw i64 %indvars.iv25, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next26.2, i64 %indvars.iv28
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %sunkaddr54, align 8
  %indvars.iv.next26.3 = add nuw nsw i64 %indvars.iv25, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next26.3, i64 %indvars.iv28
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  store double %22, double* %sunkaddr54, align 8
  %indvars.iv.next26.4 = add nuw nsw i64 %indvars.iv25, 5
  %exitcond27.4 = icmp eq i64 %indvars.iv.next26.4, 1400
  br i1 %exitcond27.4, label %23, label %._crit_edge87

; <label>:23:                                     ; preds = %._crit_edge87
  %24 = fdiv double %22, %0
  %sunkaddr94 = shl i64 %indvars.iv28, 3
  %sunkaddr95 = add i64 %sunkaddr, %sunkaddr94
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to double*
  store double %24, double* %sunkaddr96, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %..preheader_crit_edge, label %._crit_edge88

..preheader_crit_edge:                            ; preds = %23
  %scevgep77 = getelementptr double, double* %3, i64 1200
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %middle.block, %..preheader_crit_edge
  %indvars.iv22 = phi i64 [ 0, %..preheader_crit_edge ], [ %25, %middle.block ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 0
  %25 = add nuw nsw i64 %indvars.iv22, 1
  %scevgep75 = getelementptr [1200 x double], [1200 x double]* %1, i64 %25, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep77
  %bound1 = icmp ugt double* %scevgep75, %3
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %26 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %offset.idx
  %29 = bitcast double* %28 to <8 x double>*
  %wide.vec82 = load <8 x double>, <8 x double>* %29, align 8, !alias.scope !4, !noalias !1
  %30 = fsub <8 x double> %wide.vec82, %wide.vec
  %31 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %32 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %33 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %34 = or i64 %offset.idx, 3
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %34
  %36 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %37 = getelementptr double, double* %35, i64 -3
  %38 = bitcast double* %37 to <8 x double>*
  %39 = shufflevector <2 x double> %31, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %40 = shufflevector <2 x double> %33, <2 x double> %36, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %39, <4 x double> %40, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %41 = icmp eq i64 %index.next, 300
  br i1 %41, label %middle.block.loopexit97, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.3, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv19
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv19
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next20 = or i64 %indvars.iv19, 1
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next20
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next20.1 = or i64 %indvars.iv19, 2
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20.1
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next20.1
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next20.2 = or i64 %indvars.iv19, 3
  %57 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20.2
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next20.2
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next20.3 = add nuw nsw i64 %indvars.iv19, 4
  %exitcond21.3 = icmp eq i64 %indvars.iv.next20.3, 1200
  br i1 %exitcond21.3, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !9

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit97:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit97, %middle.block.loopexit
  %exitcond24 = icmp eq i64 %25, 1400
  br i1 %exitcond24, label %62, label %vector.memcheck

; <label>:62:                                     ; preds = %middle.block
  %63 = fadd double %0, -1.000000e+00
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %62
  %indvars.iv16 = phi i64 [ 0, %62 ], [ %indvars.iv.next17, %._crit_edge ]
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %78, %.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv16, %.lr.ph ], [ %indvars.iv.next14, %78 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  store double 0.000000e+00, double* %64, align 8
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90, %._crit_edge91
  %indvars.iv = phi i64 [ 0, %._crit_edge91 ], [ %indvars.iv.next.1, %._crit_edge90 ]
  %65 = phi double [ 0.000000e+00, %._crit_edge91 ], [ %77, %._crit_edge90 ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv16
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv13
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %64, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv16
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv13
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %71, %76
  store double %77, double* %64, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %78, label %._crit_edge90

; <label>:78:                                     ; preds = %._crit_edge90
  %79 = fdiv double %77, %63
  store double %79, double* %64, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv16
  store double %79, double* %80, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %._crit_edge, label %._crit_edge91

._crit_edge:                                      ; preds = %78
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %81, label %.lr.ph

; <label>:81:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %17, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %._crit_edge14
  %indvars.iv = phi i64 [ 0, %._crit_edge14 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge13
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge13

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %18, label %._crit_edge14

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
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
