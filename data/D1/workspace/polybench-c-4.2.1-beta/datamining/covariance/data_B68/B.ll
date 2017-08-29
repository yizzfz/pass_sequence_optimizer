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
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %18 ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv2 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv2 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv2
  %10 = trunc i64 %indvars.iv2 to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %6, %14
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv2, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr49 = ptrtoint double* %3 to i64
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %19, %4
  %indvars.iv179 = phi i64 [ 0, %4 ], [ %indvars.iv.next18, %19 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv179
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr25 = shl i64 %indvars.iv179, 3
  %sunkaddr26 = add i64 %sunkaddr, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %._crit_edge18
  %6 = phi double [ 0.000000e+00, %._crit_edge18 ], [ %18, %._crit_edge17 ]
  %indvars.iv158 = phi i64 [ 0, %._crit_edge18 ], [ %indvars.iv.next16.3, %._crit_edge17 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv158, i64 %indvars.iv179
  %8 = load double, double* %7, align 8
  %9 = fadd double %8, %6
  store double %9, double* %sunkaddr27, align 8
  %indvars.iv.next16 = or i64 %indvars.iv158, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next16, i64 %indvars.iv179
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr27, align 8
  %indvars.iv.next16.1 = or i64 %indvars.iv158, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next16.1, i64 %indvars.iv179
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr27, align 8
  %indvars.iv.next16.2 = or i64 %indvars.iv158, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next16.2, i64 %indvars.iv179
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr27, align 8
  %indvars.iv.next16.3 = add nuw nsw i64 %indvars.iv158, 4
  %exitcond14.3 = icmp eq i64 %indvars.iv.next16.3, 1400
  br i1 %exitcond14.3, label %19, label %._crit_edge17

; <label>:19:                                     ; preds = %._crit_edge17
  %20 = fdiv double %18, %0
  %sunkaddr50 = shl i64 %indvars.iv179, 3
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  store double %20, double* %sunkaddr52, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond15, label %..preheader19_crit_edge, label %._crit_edge18

..preheader19_crit_edge:                          ; preds = %19
  %scevgep36 = getelementptr double, double* %3, i64 1200
  br label %.preheader19

.preheader19:                                     ; preds = %middle.block._crit_edge, %..preheader19_crit_edge
  %indvars.iv137 = phi i64 [ 0, %..preheader19_crit_edge ], [ %21, %middle.block._crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 0
  %21 = add nuw nsw i64 %indvars.iv137, 1
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %1, i64 %21, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ugt double* %scevgep34, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge19.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader19
  br label %vector.body

._crit_edge19.preheader:                          ; preds = %.preheader19
  br label %._crit_edge19

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %22 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec41 = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = fsub <8 x double> %wide.vec41, %wide.vec
  %27 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %28 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %29 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %30 = or i64 %offset.idx, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 %30
  %32 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %37 = icmp eq i64 %index.next, 300
  br i1 %37, label %middle.block._crit_edge.loopexit53, label %vector.body, !llvm.loop !6

._crit_edge19:                                    ; preds = %._crit_edge19.preheader, %._crit_edge19
  %indvars.iv116 = phi i64 [ %indvars.iv.next12.3, %._crit_edge19 ], [ 0, %._crit_edge19.preheader ]
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv116
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv116
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %39
  store double %42, double* %40, align 8
  %indvars.iv.next12 = or i64 %indvars.iv116, 1
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv.next12
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next12.1 = or i64 %indvars.iv116, 2
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.1
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv.next12.1
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next12.2 = or i64 %indvars.iv116, 3
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next12.2
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv.next12.2
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next12.3 = add nuw nsw i64 %indvars.iv116, 4
  %exitcond12.3 = icmp eq i64 %indvars.iv.next12.3, 1200
  br i1 %exitcond12.3, label %middle.block._crit_edge.loopexit, label %._crit_edge19, !llvm.loop !9

middle.block._crit_edge.loopexit:                 ; preds = %._crit_edge19
  br label %middle.block._crit_edge

middle.block._crit_edge.loopexit53:               ; preds = %vector.body
  br label %middle.block._crit_edge

middle.block._crit_edge:                          ; preds = %middle.block._crit_edge.loopexit53, %middle.block._crit_edge.loopexit
  %exitcond13 = icmp eq i64 %21, 1400
  br i1 %exitcond13, label %58, label %.preheader19

; <label>:58:                                     ; preds = %middle.block._crit_edge
  %59 = fadd double %0, -1.000000e+00
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge, %58
  %indvars.iv94 = phi i64 [ 0, %58 ], [ %indvars.iv.next10, %._crit_edge ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %74, %.lr.ph.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv94, %.lr.ph.preheader ], [ %indvars.iv.next8, %74 ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv94, i64 %indvars.iv73
  store double 0.000000e+00, double* %60, align 8
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %.lr.ph
  %61 = phi double [ 0.000000e+00, %.lr.ph ], [ %73, %._crit_edge21 ]
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %._crit_edge21 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv94
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv73
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %60, align 8
  %indvars.iv.next = or i64 %indvars.iv1, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv94
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv73
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %60, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv1, 2
  %exitcond10.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond10.1, label %74, label %._crit_edge21

; <label>:74:                                     ; preds = %._crit_edge21
  %75 = fdiv double %73, %59
  store double %75, double* %60, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv94
  store double %75, double* %76, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %74
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond11, label %77, label %.lr.ph.preheader

; <label>:77:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv22 = phi i64 [ 0, %1 ], [ %indvars.iv.next3, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv22, 1200
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv1
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
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
