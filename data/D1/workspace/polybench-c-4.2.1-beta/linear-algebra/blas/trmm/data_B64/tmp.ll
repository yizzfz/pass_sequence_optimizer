; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge39.us, %.preheader.us.preheader
  %indvars.iv3240.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next33.us, %._crit_edge39.us ]
  %exitcond34.us = icmp eq i64 %indvars.iv3240.us, 0
  br i1 %exitcond34.us, label %._crit_edge.us.new, label %.lr.ph.us

._crit_edge.us.new.loopexit:                      ; preds = %._crit_edge44.us
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.loopexit, %._crit_edge44.us.prol.loopexit, %.preheader.us
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3240.us, i64 %indvars.iv3240.us
  store double 1.000000e+00, double* %5, align 8
  %6 = add nuw nsw i64 %indvars.iv3240.us, 1200
  br label %._crit_edge46.us

._crit_edge46.us:                                 ; preds = %._crit_edge46.us, %._crit_edge.us.new
  %indvars.iv3036.us = phi i64 [ 0, %._crit_edge.us.new ], [ %indvars.iv.next31.us.1, %._crit_edge46.us ]
  %7 = sub nuw nsw i64 %6, %indvars.iv3036.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3240.us, i64 %indvars.iv3036.us
  %indvars.iv.next31.us = or i64 %indvars.iv3036.us, 1
  %12 = sub nuw nsw i64 %6, %indvars.iv.next31.us
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1200
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.200000e+03, double 1.200000e+03>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next31.us.1 = add nuw nsw i64 %indvars.iv3036.us, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next31.us.1, 1200
  br i1 %exitcond48.1, label %._crit_edge39.us, label %._crit_edge46.us

._crit_edge44.us:                                 ; preds = %._crit_edge44.us.preheader, %._crit_edge44.us
  %indvars.iv35.us = phi i64 [ %indvars.iv.next.us.1, %._crit_edge44.us ], [ %indvars.iv35.us.unr.ph, %._crit_edge44.us.preheader ]
  %20 = add nuw nsw i64 %indvars.iv35.us, %indvars.iv3240.us
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1000
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3240.us, i64 %indvars.iv35.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv35.us, 1
  %25 = add nuw nsw i64 %indvars.iv.next.us, %indvars.iv3240.us
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 1000
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.000000e+03, double 1.000000e+03>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv35.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, %indvars.iv3240.us
  br i1 %exitcond.us.1, label %._crit_edge.us.new.loopexit, label %._crit_edge44.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv3240.us, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge44.us.prol.loopexit, label %._crit_edge44.us.prol

._crit_edge44.us.prol:                            ; preds = %.lr.ph.us
  %33 = trunc i64 %indvars.iv3240.us to i32
  %34 = srem i32 %33, 1000
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.000000e+03
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3240.us, i64 0
  store double %36, double* %37, align 8
  br label %._crit_edge44.us.prol.loopexit

._crit_edge44.us.prol.loopexit:                   ; preds = %.lr.ph.us, %._crit_edge44.us.prol
  %indvars.iv35.us.unr.ph = phi i64 [ 1, %._crit_edge44.us.prol ], [ 0, %.lr.ph.us ]
  %38 = icmp eq i64 %indvars.iv3240.us, 1
  br i1 %38, label %._crit_edge.us.new, label %._crit_edge44.us.preheader

._crit_edge44.us.preheader:                       ; preds = %._crit_edge44.us.prol.loopexit
  br label %._crit_edge44.us

._crit_edge39.us:                                 ; preds = %._crit_edge46.us
  %indvars.iv.next33.us = add nuw nsw i64 %indvars.iv3240.us, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next33.us, 1000
  br i1 %exitcond49, label %._crit_edge43, label %.preheader.us

._crit_edge43:                                    ; preds = %._crit_edge39.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader27.us.preheader:
  %5 = insertelement <2 x double> undef, double %2, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us, %.preheader27.us.preheader
  %indvars.iv3035.us = phi i64 [ 0, %.preheader27.us.preheader ], [ %7, %..loopexit_crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv3035.us, 1
  %exitcond32.us = icmp eq i64 %7, 1000
  br i1 %exitcond32.us, label %.preheader.us40.preheader, label %.preheader.us.us.preheader

.preheader.us40.preheader:                        ; preds = %.preheader27.us
  br label %.preheader.us40

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %8 = sub nuw nsw i64 999, %indvars.iv3035.us
  %xtraiter = and i64 %8, 1
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %7, i64 %indvars.iv3035.us
  %indvars.iv.next.us.us.prol = add nuw nsw i64 %indvars.iv3035.us, 2
  br label %.preheader.us.us

.preheader.us40:                                  ; preds = %.preheader.us40, %.preheader.us40.preheader
  %indvars.iv2834.us41 = phi i64 [ 0, %.preheader.us40.preheader ], [ %indvars.iv.next29.us42.3.1, %.preheader.us40 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3035.us, i64 %indvars.iv2834.us41
  %11 = bitcast double* %10 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %13 = fmul <2 x double> %12, %6
  store <2 x double> %13, <2 x double>* %11, align 8
  %indvars.iv.next29.us42.1 = or i64 %indvars.iv2834.us41, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3035.us, i64 %indvars.iv.next29.us42.1
  %15 = bitcast double* %14 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %17 = fmul <2 x double> %16, %6
  store <2 x double> %17, <2 x double>* %15, align 8
  %indvars.iv.next29.us42.3 = or i64 %indvars.iv2834.us41, 4
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3035.us, i64 %indvars.iv.next29.us42.3
  %19 = bitcast double* %18 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %21 = fmul <2 x double> %20, %6
  store <2 x double> %21, <2 x double>* %19, align 8
  %indvars.iv.next29.us42.1.1 = or i64 %indvars.iv2834.us41, 6
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3035.us, i64 %indvars.iv.next29.us42.1.1
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, %6
  store <2 x double> %25, <2 x double>* %23, align 8
  %indvars.iv.next29.us42.3.1 = add nsw i64 %indvars.iv2834.us41, 8
  %exitcond55.3.1 = icmp eq i64 %indvars.iv.next29.us42.3.1, 1200
  br i1 %exitcond55.3.1, label %..loopexit_crit_edge.us.loopexit, label %.preheader.us40

..loopexit_crit_edge.us.loopexit:                 ; preds = %.preheader.us40
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit65:               ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit65, %..loopexit_crit_edge.us.loopexit
  %26 = icmp eq i64 %7, 1000
  br i1 %26, label %._crit_edge38, label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv2834.us.us = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next29.us.us, %._crit_edge.us.us ]
  %27 = icmp eq i64 %xtraiter, 0
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3035.us, i64 %indvars.iv2834.us.us
  br i1 %27, label %._crit_edge39.us.us.prol.loopexit, label %._crit_edge39.us.us.prol

._crit_edge39.us.us.prol:                         ; preds = %.preheader.us.us
  %29 = load double, double* %9, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %7, i64 %indvars.iv2834.us.us
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = load double, double* %28, align 8
  %34 = fadd double %33, %32
  store double %34, double* %28, align 8
  br label %._crit_edge39.us.us.prol.loopexit

._crit_edge39.us.us.prol.loopexit:                ; preds = %.preheader.us.us, %._crit_edge39.us.us.prol
  %indvars.iv33.us.us.unr.ph = phi i64 [ %indvars.iv.next.us.us.prol, %._crit_edge39.us.us.prol ], [ %7, %.preheader.us.us ]
  %35 = icmp eq i64 %indvars.iv3035.us, 998
  %.pre62 = load double, double* %28, align 8
  br i1 %35, label %._crit_edge.us.us, label %._crit_edge39.us.us.preheader

._crit_edge39.us.us.preheader:                    ; preds = %._crit_edge39.us.us.prol.loopexit
  br label %._crit_edge39.us.us

._crit_edge.us.us.loopexit:                       ; preds = %._crit_edge39.us.us
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %._crit_edge39.us.us.prol.loopexit
  %36 = phi double [ %.pre62, %._crit_edge39.us.us.prol.loopexit ], [ %50, %._crit_edge.us.us.loopexit ]
  %37 = fmul double %36, %2
  store double %37, double* %28, align 8
  %indvars.iv.next29.us.us = add nuw nsw i64 %indvars.iv2834.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next29.us.us, 1200
  br i1 %exitcond, label %..loopexit_crit_edge.us.loopexit65, label %.preheader.us.us

._crit_edge39.us.us:                              ; preds = %._crit_edge39.us.us.preheader, %._crit_edge39.us.us
  %38 = phi double [ %50, %._crit_edge39.us.us ], [ %.pre62, %._crit_edge39.us.us.preheader ]
  %indvars.iv33.us.us = phi i64 [ %indvars.iv.next.us.us.1, %._crit_edge39.us.us ], [ %indvars.iv33.us.us.unr.ph, %._crit_edge39.us.us.preheader ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv33.us.us, i64 %indvars.iv3035.us
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33.us.us, i64 %indvars.iv2834.us.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %28, align 8
  %indvars.iv.next.us.us = add i64 %indvars.iv33.us.us, 1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv3035.us
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next.us.us, i64 %indvars.iv2834.us.us
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %28, align 8
  %indvars.iv.next.us.us.1 = add i64 %indvars.iv33.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1000
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %._crit_edge39.us.us

._crit_edge38:                                    ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv1215.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13.us, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv1215.us, 1000
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge18.us, %.preheader.us
  %indvars.iv14.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge18.us ]
  %8 = add nuw nsw i64 %indvars.iv14.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge18.us

; <label>:12:                                     ; preds = %._crit_edge19.us
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge19.us, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1215.us, i64 %indvars.iv14.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19.us

._crit_edge.us:                                   ; preds = %._crit_edge18.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1215.us, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next13.us, 1000
  br i1 %exitcond21, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
