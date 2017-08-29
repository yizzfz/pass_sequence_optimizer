; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %13, %5
  %indvars.iv11 = phi i64 [ 0, %5 ], [ %indvars.iv.next12, %13 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge ], [ 0, %._crit_edge.preheader ]
  %6 = mul nsw i64 %indvars.iv8, %indvars.iv11
  %7 = add nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv8
  store double %11, double* %12, align 8
  %exitcond10 = icmp eq i64 %indvars.iv8, 1099
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br i1 %exitcond10, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw i64 %indvars.iv11, 1
  %14 = icmp slt i64 %indvars.iv.next12, 1000
  br i1 %14, label %._crit_edge.preheader, label %._crit_edge5.preheader.preheader

._crit_edge5.preheader.preheader:                 ; preds = %13
  br label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %._crit_edge5.preheader.preheader, %._crit_edge4
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge4 ], [ 0, %._crit_edge5.preheader.preheader ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %._crit_edge5.preheader
  %indvars.iv3 = phi i64 [ 0, %._crit_edge5.preheader ], [ %indvars.iv.next4.1, %._crit_edge5 ]
  %indvars.iv.next4 = or i64 %indvars.iv3, 1
  %15 = mul nuw nsw i64 %indvars.iv.next4, %indvars.iv6
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1200
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.200000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv3
  store double %19, double* %20, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv3, 2
  %21 = mul nuw nsw i64 %indvars.iv.next4.1, %indvars.iv6
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1200
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.200000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv.next4
  store double %25, double* %26, align 8
  %exitcond5.1 = icmp eq i64 %indvars.iv.next4, 1199
  br i1 %exitcond5.1, label %._crit_edge4, label %._crit_edge5

._crit_edge4:                                     ; preds = %._crit_edge5
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %27 = icmp slt i64 %indvars.iv.next7, 1000
  br i1 %27, label %._crit_edge5.preheader, label %._crit_edge7.preheader.preheader

._crit_edge7.preheader.preheader:                 ; preds = %._crit_edge4
  br label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge7.preheader.preheader, %._crit_edge6
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge6 ], [ 0, %._crit_edge7.preheader.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %._crit_edge7.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge7 ], [ 0, %._crit_edge7.preheader ]
  %28 = add nuw nsw i64 %indvars.iv, 2
  %29 = mul nsw i64 %28, %indvars.iv1
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 1100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.100000e+03
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv1, i64 %indvars.iv
  store double %33, double* %34, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge7

._crit_edge6:                                     ; preds = %._crit_edge7
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %35 = icmp slt i64 %indvars.iv.next2, 1200
  br i1 %35, label %._crit_edge7.preheader, label %36

; <label>:36:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert40 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat41 = shufflevector <2 x double> %broadcast.splatinsert40, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert20 = insertelement <2 x double> undef, double %0, i32 0
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %49, %5
  %indvars.iv6 = phi i64 [ 0, %5 ], [ %6, %49 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 0
  %6 = add i64 %indvars.iv6, 1
  %scevgep9 = getelementptr [1100 x double], [1100 x double]* %2, i64 %6, i64 0
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.1, %._crit_edge.preheader
  %index30 = phi i64 [ 0, %._crit_edge.preheader ], [ %index.next31.1, %vector.body25.1 ]
  %7 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %index30
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load38, %broadcast.splat41
  %12 = fmul <2 x double> %wide.load39, %broadcast.splat41
  store <2 x double> %11, <2 x double>* %8, align 8
  store <2 x double> %12, <2 x double>* %10, align 8
  %index.next31 = or i64 %index30, 4
  %13 = icmp eq i64 %index.next31, 1100
  br i1 %13, label %._crit_edge4.preheader.preheader, label %vector.body25.1, !llvm.loop !1

._crit_edge4.preheader.preheader:                 ; preds = %vector.body25
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader.preheader, %._crit_edge3
  %indvars.iv4 = phi i64 [ %14, %._crit_edge3 ], [ 0, %._crit_edge4.preheader.preheader ]
  %scevgep11 = getelementptr [1100 x double], [1100 x double]* %4, i64 %indvars.iv4, i64 0
  %14 = add i64 %indvars.iv4, 1
  %scevgep13 = getelementptr [1100 x double], [1100 x double]* %4, i64 %14, i64 0
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv4
  %bound0 = icmp ult double* %scevgep, %15
  %bound1 = icmp ult double* %15, %scevgep9
  %found.conflict = and i1 %bound0, %bound1
  %bound016 = icmp ult double* %scevgep, %scevgep13
  %bound117 = icmp ult double* %scevgep11, %scevgep9
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict18
  br i1 %conflict.rdx, label %._crit_edge4.preheader42, label %vector.ph

._crit_edge4.preheader42:                         ; preds = %._crit_edge4.preheader
  br label %._crit_edge4

vector.ph:                                        ; preds = %._crit_edge4.preheader
  %.pre = load double, double* %15, align 8, !alias.scope !4
  %16 = insertelement <2 x double> undef, double %.pre, i32 0
  %17 = fmul <2 x double> %16, %broadcast.splatinsert20
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv4, i64 %index
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !7
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !7
  %23 = fmul <2 x double> %18, %wide.load
  %24 = fmul <2 x double> %18, %wide.load22
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %index
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !9, !noalias !11
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !9, !noalias !11
  %29 = fadd <2 x double> %wide.load23, %23
  %30 = fadd <2 x double> %wide.load24, %24
  store <2 x double> %29, <2 x double>* %26, align 8, !alias.scope !9, !noalias !11
  store <2 x double> %30, <2 x double>* %28, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %31 = icmp eq i64 %index.next, 1100
  br i1 %31, label %._crit_edge3.loopexit43, label %vector.body, !llvm.loop !12

._crit_edge4:                                     ; preds = %._crit_edge4, %._crit_edge4.preheader42
  %indvars.iv1 = phi i64 [ 0, %._crit_edge4.preheader42 ], [ %indvars.iv.next2.1, %._crit_edge4 ]
  %32 = load double, double* %15, align 8
  %33 = fmul double %32, %0
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv4, i64 %indvars.iv1
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv1
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %37, align 8
  %indvars.iv.next2 = or i64 %indvars.iv1, 1
  %40 = load double, double* %15, align 8
  %41 = fmul double %40, %0
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv4, i64 %indvars.iv.next2
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv.next2
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %exitcond3.1 = icmp eq i64 %indvars.iv.next2, 1099
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, 2
  br i1 %exitcond3.1, label %._crit_edge3.loopexit, label %._crit_edge4, !llvm.loop !13

._crit_edge3.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge3

._crit_edge3.loopexit43:                          ; preds = %vector.body
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit43, %._crit_edge3.loopexit
  %48 = icmp slt i64 %14, 1200
  br i1 %48, label %._crit_edge4.preheader, label %49

; <label>:49:                                     ; preds = %._crit_edge3
  %50 = icmp slt i64 %6, 1000
  br i1 %50, label %._crit_edge.preheader, label %51

; <label>:51:                                     ; preds = %49
  ret void

vector.body25.1:                                  ; preds = %vector.body25
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %index.next31
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load38.1 = load <2 x double>, <2 x double>* %53, align 8
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load39.1 = load <2 x double>, <2 x double>* %55, align 8
  %56 = fmul <2 x double> %wide.load38.1, %broadcast.splat41
  %57 = fmul <2 x double> %wide.load39.1, %broadcast.splat41
  store <2 x double> %56, <2 x double>* %53, align 8
  store <2 x double> %57, <2 x double>* %55, align 8
  %index.next31.1 = add nsw i64 %index30, 8
  br label %vector.body25
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %18, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nsw i64 %indvars.iv1, 1000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2

; <label>:11:                                     ; preds = %._crit_edge2._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %17 = icmp slt i64 %indvars.iv.next, 1100
  br i1 %17, label %._crit_edge2._crit_edge, label %18

; <label>:18:                                     ; preds = %._crit_edge2
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %19 = icmp slt i64 %indvars.iv.next2, 1000
  br i1 %19, label %._crit_edge.preheader, label %20

; <label>:20:                                     ; preds = %18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
