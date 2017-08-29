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

.preheader:                                       ; preds = %15, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %15 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sitofp i32 %5 to double
  %7 = fmul double %4, %6
  %8 = fdiv double %7, 1.200000e+03
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  store double %8, double* %9, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %4, %11
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv.next
  store double %13, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond5, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph80.split.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr22 = ptrtoint double* %3 to i64
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %._crit_edge77.us, %.lr.ph80.split.us.preheader
  %indvars.iv110 = phi i64 [ 0, %.lr.ph80.split.us.preheader ], [ %indvars.iv.next111, %._crit_edge77.us ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv110
  store double 0.000000e+00, double* %4, align 8
  %sunkaddr3 = shl nuw nsw i64 %indvars.iv110, 3
  %sunkaddr4 = add i64 %sunkaddr, %sunkaddr3
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to double*
  %sunkaddr3.1 = shl nuw nsw i64 %indvars.iv110, 3
  %sunkaddr4.1 = add i64 %sunkaddr.1, %sunkaddr3.1
  %sunkaddr5.1 = inttoptr i64 %sunkaddr4.1 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph80.split.us
  %5 = phi double [ 0.000000e+00, %.lr.ph80.split.us ], [ %11, %._crit_edge ]
  %indvars.iv107 = phi i64 [ 0, %.lr.ph80.split.us ], [ %indvars.iv.next108.1, %._crit_edge ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv110
  %7 = load double, double* %6, align 8
  %8 = fadd double %7, %5
  store double %8, double* %sunkaddr5, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next108, i64 %indvars.iv110
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr5.1, align 8
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next108.1, 1400
  br i1 %exitcond109.1, label %._crit_edge77.us, label %._crit_edge

._crit_edge77.us:                                 ; preds = %._crit_edge
  %12 = fdiv double %11, %0
  %sunkaddr23 = shl i64 %indvars.iv110, 3
  %sunkaddr24 = add i64 %sunkaddr22, %sunkaddr23
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to double*
  store double %12, double* %sunkaddr25, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next111, 1200
  br i1 %exitcond112, label %._crit_edge77.us..preheader56.us_crit_edge, label %.lr.ph80.split.us

._crit_edge77.us..preheader56.us_crit_edge:       ; preds = %._crit_edge77.us
  %scevgep14 = getelementptr double, double* %3, i64 1200
  br label %.preheader56.us

.preheader56.us:                                  ; preds = %._crit_edge72.us, %._crit_edge77.us..preheader56.us_crit_edge
  %indvars.iv103 = phi i64 [ 0, %._crit_edge77.us..preheader56.us_crit_edge ], [ %13, %._crit_edge72.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 0
  %13 = add nuw nsw i64 %indvars.iv103, 1
  %scevgep12 = getelementptr [1200 x double], [1200 x double]* %1, i64 %13, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep14
  %bound1 = icmp ugt double* %scevgep12, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge116.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader56.us
  br label %vector.body

._crit_edge116.preheader:                         ; preds = %.preheader56.us
  br label %._crit_edge116

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %14 = getelementptr inbounds double, double* %3, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 %index
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %22 = fsub <2 x double> %wide.load18, %wide.load
  %23 = fsub <2 x double> %wide.load19, %wide.load17
  store <2 x double> %22, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  store <2 x double> %23, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %24 = getelementptr inbounds double, double* %3, i64 %index.next
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load17.1 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 %index.next
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load18.1 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !4, !noalias !1
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load19.1 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !4, !noalias !1
  %32 = fsub <2 x double> %wide.load18.1, %wide.load.1
  %33 = fsub <2 x double> %wide.load19.1, %wide.load17.1
  store <2 x double> %32, <2 x double>* %29, align 8, !alias.scope !4, !noalias !1
  store <2 x double> %33, <2 x double>* %31, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nsw i64 %index, 8
  %34 = icmp eq i64 %index.next.1, 1200
  br i1 %34, label %._crit_edge72.us.loopexit26, label %vector.body, !llvm.loop !6

._crit_edge116:                                   ; preds = %._crit_edge116, %._crit_edge116.preheader
  %indvars.iv100 = phi i64 [ 0, %._crit_edge116.preheader ], [ %indvars.iv.next101.3, %._crit_edge116 ]
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv100
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv100
  %38 = load double, double* %37, align 8
  %39 = fsub double %38, %36
  store double %39, double* %37, align 8
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next101
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next101
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next101.1 = or i64 %indvars.iv100, 2
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next101.1
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next101.1
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next101.2 = or i64 %indvars.iv100, 3
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next101.2
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next101.2
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next101.3 = add nsw i64 %indvars.iv100, 4
  %exitcond102.3 = icmp eq i64 %indvars.iv.next101.3, 1200
  br i1 %exitcond102.3, label %._crit_edge72.us.loopexit, label %._crit_edge116, !llvm.loop !9

._crit_edge72.us.loopexit:                        ; preds = %._crit_edge116
  br label %._crit_edge72.us

._crit_edge72.us.loopexit26:                      ; preds = %vector.body
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %._crit_edge72.us.loopexit26, %._crit_edge72.us.loopexit
  %exitcond105 = icmp eq i64 %13, 1400
  br i1 %exitcond105, label %.preheader.us.preheader, label %.preheader56.us

.preheader.us.preheader:                          ; preds = %._crit_edge72.us
  %55 = fadd double %0, -1.000000e+00
  br label %.lr.ph60.us

._crit_edge61.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next90, 1200
  br i1 %exitcond91, label %._crit_edge63, label %.lr.ph60.us

.lr.ph60.us:                                      ; preds = %._crit_edge61.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv89 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next90, %._crit_edge61.us-lcssa.us.us ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph60.us
  %indvars.iv86 = phi i64 [ %indvars.iv89, %.lr.ph60.us ], [ %indvars.iv.next87, %._crit_edge.us.us ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv89, i64 %indvars.iv86
  store double 0.000000e+00, double* %56, align 8
  br label %._crit_edge117

._crit_edge.us.us:                                ; preds = %._crit_edge117
  %57 = fdiv double %71, %55
  store double %57, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv86, i64 %indvars.iv89
  store double %57, double* %58, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 1200
  br i1 %exitcond88, label %._crit_edge61.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge117:                                   ; preds = %._crit_edge117, %.lr.ph.us.us
  %59 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %71, %._crit_edge117 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge117 ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv89
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv86
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %56, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv89
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv86
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %56, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge117

._crit_edge63:                                    ; preds = %._crit_edge61.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv13, 1200
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge16
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge16, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
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
