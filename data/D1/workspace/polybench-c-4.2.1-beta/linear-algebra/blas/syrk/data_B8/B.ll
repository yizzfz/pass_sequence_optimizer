; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.preheader.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader4._crit_edge.us, %.preheader4.preheader.lr.ph
  %indvars.iv917.us = phi i64 [ %indvars.iv.next10.us, %.preheader4._crit_edge.us ], [ 0, %.preheader4.preheader.lr.ph ]
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us, %.preheader4.preheader.us
  %indvars.iv715.us = phi i64 [ 0, %.preheader4.preheader.us ], [ %indvars.iv.next8.us, %.preheader4.us ]
  %6 = mul nuw nsw i64 %indvars.iv715.us, %indvars.iv917.us
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv917.us, i64 %indvars.iv715.us
  store double %11, double* %12, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv715.us, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next8.us, 1000
  br i1 %exitcond22, label %.preheader4._crit_edge.us, label %.preheader4.us

.preheader4._crit_edge.us:                        ; preds = %.preheader4.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv917.us, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next10.us, 1200
  br i1 %exitcond23, label %.preheader.preheader.preheader, label %.preheader4.preheader.us

.preheader.preheader.preheader:                   ; preds = %.preheader4._crit_edge.us
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader._crit_edge
  %indvars.iv513 = phi i64 [ %indvars.iv.next6, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv12, %indvars.iv513
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv513, i64 %indvars.iv12
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.preheader._crit_edge, label %.preheader

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond21, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.preheader.lr.ph:
  %6 = insertelement <2 x double> undef, double %3, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader3._crit_edge.us..preheader4.preheader.us_crit_edge, %.preheader4.preheader.lr.ph
  %indvars.iv = phi i2 [ %indvars.iv.next36, %.preheader3._crit_edge.us..preheader4.preheader.us_crit_edge ], [ 1, %.preheader4.preheader.lr.ph ]
  %indvars.iv1524.us = phi i64 [ %indvars.iv.next16.us, %.preheader3._crit_edge.us..preheader4.preheader.us_crit_edge ], [ 1, %.preheader4.preheader.lr.ph ]
  %indvars.iv1722.us = phi i64 [ %indvars.iv.next18.us, %.preheader3._crit_edge.us..preheader4.preheader.us_crit_edge ], [ 0, %.preheader4.preheader.lr.ph ]
  %10 = zext i2 %indvars.iv to i64
  %11 = add nuw nsw i64 %indvars.iv1722.us, 1
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader4.us.prol.loopexit, label %.preheader4.us.prol.preheader

.preheader4.us.prol.preheader:                    ; preds = %.preheader4.preheader.us
  br label %.preheader4.us.prol

.preheader4.us.prol:                              ; preds = %.preheader4.us.prol.preheader, %.preheader4.us.prol
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.preheader4.us.prol ], [ 0, %.preheader4.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader4.us.prol ], [ %xtraiter, %.preheader4.us.prol.preheader ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us.prol
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  br i1 %prol.iter.cmp, label %.preheader4.us.prol.loopexit.loopexit, label %.preheader4.us.prol, !llvm.loop !1

.preheader4.us.prol.loopexit.loopexit:            ; preds = %.preheader4.us.prol
  br label %.preheader4.us.prol.loopexit

.preheader4.us.prol.loopexit:                     ; preds = %.preheader4.us.prol.loopexit.loopexit, %.preheader4.preheader.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader4.preheader.us ], [ %10, %.preheader4.us.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %indvars.iv1722.us, 3
  br i1 %15, label %.preheader.preheader.us.preheader, label %.preheader4.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader4.us.prol.loopexit
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %.preheader4.us
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader4.us ], [ %indvars.iv19.us.unr, %.preheader4.us.preheader ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us
  %17 = bitcast double* %16 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %19 = fmul <2 x double> %18, %7
  %20 = bitcast double* %16 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us.1
  %22 = bitcast double* %21 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, %9
  %25 = bitcast double* %21 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1524.us
  br i1 %exitcond.us.3, label %.preheader.preheader.us.preheader.loopexit, label %.preheader4.us

.preheader.preheader.us.preheader.loopexit:       ; preds = %.preheader4.us
  br label %.preheader.preheader.us.preheader

.preheader.preheader.us.preheader:                ; preds = %.preheader.preheader.us.preheader.loopexit, %.preheader4.us.prol.loopexit
  %26 = and i64 %indvars.iv1722.us, 1
  %lcmp.mod28 = icmp eq i64 %26, 0
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 0
  %28 = icmp eq i64 %indvars.iv1722.us, 0
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader3.us, %.preheader.preheader.us.preheader
  %indvars.iv1321.us = phi i64 [ %indvars.iv.next14.us, %.preheader3.us ], [ 0, %.preheader.preheader.us.preheader ]
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  br i1 %lcmp.mod28, label %.preheader.us.prol, label %.preheader.us.prol.loopexit

.preheader.us.prol:                               ; preds = %.preheader.preheader.us
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %2
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1321.us
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %27, align 8
  %36 = fadd double %35, %34
  store double %36, double* %27, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.preheader.us, %.preheader.us.prol
  %indvars.iv720.us.unr.ph = phi i64 [ 1, %.preheader.us.prol ], [ 0, %.preheader.preheader.us ]
  br i1 %28, label %.preheader3.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us.1, %.preheader.us ], [ %indvars.iv720.us.unr.ph, %.preheader.us.preheader ]
  %37 = load double, double* %29, align 8
  %38 = fmul double %37, %2
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv720.us
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %45 = load double, double* %29, align 8
  %46 = fmul double %45, %2
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next8.us, i64 %indvars.iv1321.us
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next8.us
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next8.us.1 = add nuw nsw i64 %indvars.iv720.us, 2
  %exitcond12.us.1 = icmp eq i64 %indvars.iv.next8.us.1, %indvars.iv1524.us
  br i1 %exitcond12.us.1, label %.preheader3.us.loopexit, label %.preheader.us

.preheader3.us.loopexit:                          ; preds = %.preheader.us
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1321.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next14.us, 1000
  br i1 %exitcond29, label %.preheader3._crit_edge.us, label %.preheader.preheader.us

.preheader3._crit_edge.us:                        ; preds = %.preheader3.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1722.us, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next18.us, 1200
  br i1 %exitcond30, label %._crit_edge, label %.preheader3._crit_edge.us..preheader4.preheader.us_crit_edge

.preheader3._crit_edge.us..preheader4.preheader.us_crit_edge: ; preds = %.preheader3._crit_edge.us
  %indvars.iv.next36 = add i2 %indvars.iv, 1
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1524.us, 1
  br label %.preheader4.preheader.us

._crit_edge:                                      ; preds = %.preheader3._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %6 = mul nsw i64 %indvars.iv26, 1200
  br label %7

; <label>:7:                                      ; preds = %.preheader, %.preheader.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nsw i64 %indvars.iv5, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.preheader

.preheader:                                       ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.preheader._crit_edge, label %7

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond9, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
