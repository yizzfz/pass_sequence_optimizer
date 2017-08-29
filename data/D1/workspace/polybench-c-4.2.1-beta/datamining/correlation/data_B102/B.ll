; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2, %19
  %indvars.iv62 = phi i64 [ 0, %2 ], [ %indvars.iv.next7, %19 ]
  %3 = trunc i64 %indvars.iv62 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv1 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv1, %indvars.iv62
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv1
  %indvars.iv.next = or i64 %indvars.iv1, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv62
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond8, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph145:
  %sunkaddr34 = ptrtoint double* %3 to i64
  %sunkaddr38 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph140.us

.lr.ph140.us:                                     ; preds = %.lr.ph145, %.unr-lcssa238
  %indvars.iv112142.us = phi i64 [ %indvars.iv.next113.us, %.unr-lcssa238 ], [ 0, %.lr.ph145 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv112142.us
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr35 = mul i64 %indvars.iv112142.us, 8
  %sunkaddr36 = add i64 %sunkaddr34, %sunkaddr35
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %sunkaddr39 = mul i64 %indvars.iv112142.us, 8
  %sunkaddr40 = add i64 %sunkaddr38, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  br label %.lr.ph140.us.new

.lr.ph140.us.new:                                 ; preds = %.lr.ph140.us.new, %.lr.ph140.us
  %6 = phi double [ 0.000000e+00, %.lr.ph140.us ], [ %18, %.lr.ph140.us.new ]
  %indvars.iv110139.us = phi i64 [ 0, %.lr.ph140.us ], [ %indvars.iv.next111.us.1.1, %.lr.ph140.us.new ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110139.us, i64 %indvars.iv112142.us
  %8 = load double, double* %7, align 8
  %9 = fadd double %8, %6
  store double %9, double* %sunkaddr37, align 8
  %indvars.iv.next111.us = or i64 %indvars.iv110139.us, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next111.us, i64 %indvars.iv112142.us
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr37, align 8
  %indvars.iv.next111.us.1 = or i64 %indvars.iv110139.us, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next111.us.1, i64 %indvars.iv112142.us
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr41, align 8
  %indvars.iv.next111.us.117 = or i64 %indvars.iv110139.us, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next111.us.117, i64 %indvars.iv112142.us
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr41, align 8
  %indvars.iv.next111.us.1.1 = add nsw i64 %indvars.iv110139.us, 4
  %exitcond232.1.1 = icmp eq i64 %indvars.iv.next111.us.1.1, 1400
  br i1 %exitcond232.1.1, label %.unr-lcssa238, label %.lr.ph140.us.new

.unr-lcssa238:                                    ; preds = %.lr.ph140.us.new
  %19 = fdiv double %18, %0
  %sunkaddr23 = mul i64 %indvars.iv112142.us, 8
  %sunkaddr24 = add i64 %sunkaddr, %sunkaddr23
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to double*
  store double %19, double* %sunkaddr25, align 8
  %indvars.iv.next113.us = add nuw nsw i64 %indvars.iv112142.us, 1
  %exitcond239 = icmp eq i64 %indvars.iv.next113.us, 1200
  br i1 %exitcond239, label %.lr.ph133.us.preheader, label %.lr.ph140.us

.lr.ph133.us.preheader:                           ; preds = %.unr-lcssa238
  %sunkaddr26 = ptrtoint double* %3 to i64
  %sunkaddr42 = ptrtoint double* %4 to i64
  %sunkaddr30 = ptrtoint double* %4 to i64
  br label %.lr.ph133.us

.lr.ph133.us:                                     ; preds = %.lr.ph133.us.preheader, %._crit_edge10.us
  %indvars.iv108136.us = phi i64 [ %indvars.iv.next109.us, %._crit_edge10.us ], [ 0, %.lr.ph133.us.preheader ]
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv108136.us
  store double 0.000000e+00, double* %20, align 8
  %sunkaddr27 = mul i64 %indvars.iv108136.us, 8
  %sunkaddr28 = add i64 %sunkaddr26, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %sunkaddr43 = mul i64 %indvars.iv108136.us, 8
  %sunkaddr44 = add i64 %sunkaddr42, %sunkaddr43
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to double*
  br label %.lr.ph133.us.new

.lr.ph133.us.new:                                 ; preds = %.lr.ph133.us, %.lr.ph133.us.new
  %21 = phi double [ %33, %.lr.ph133.us.new ], [ 0.000000e+00, %.lr.ph133.us ]
  %indvars.iv106131.us = phi i64 [ %indvars.iv.next107.us.1, %.lr.ph133.us.new ], [ 0, %.lr.ph133.us ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv106131.us, i64 %indvars.iv108136.us
  %23 = load double, double* %22, align 8
  %24 = load double, double* %sunkaddr29, align 8
  %25 = fsub double %23, %24
  %26 = fmul double %25, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr45, align 8
  %indvars.iv.next107.us = or i64 %indvars.iv106131.us, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next107.us, i64 %indvars.iv108136.us
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr29, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr45, align 8
  %indvars.iv.next107.us.1 = add nuw nsw i64 %indvars.iv106131.us, 2
  %exitcond224.1 = icmp eq i64 %indvars.iv.next107.us.1, 1400
  br i1 %exitcond224.1, label %._crit_edge10.us, label %.lr.ph133.us.new

._crit_edge10.us:                                 ; preds = %.lr.ph133.us.new
  %34 = fdiv double %33, %0
  %sunkaddr31 = mul i64 %indvars.iv108136.us, 8
  %sunkaddr32 = add i64 %sunkaddr30, %sunkaddr31
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  store double %34, double* %sunkaddr33, align 8
  %35 = tail call double @sqrt(double %34) #4
  %36 = fcmp ugt double %35, 1.000000e-01
  %37 = select i1 %36, double %35, double 1.000000e+00
  store double %37, double* %sunkaddr33, align 8
  %indvars.iv.next109.us = add nuw nsw i64 %indvars.iv108136.us, 1
  %exitcond230 = icmp eq i64 %indvars.iv.next109.us, 1200
  br i1 %exitcond230, label %.lr.ph128.us.preheader, label %.lr.ph133.us

.lr.ph128.us.preheader:                           ; preds = %._crit_edge10.us
  br label %.lr.ph128.us

.lr.ph128.us:                                     ; preds = %.lr.ph128.us.preheader, %._crit_edge9.us
  %indvars.iv104129.us = phi i64 [ %indvars.iv.next105.us, %._crit_edge9.us ], [ 0, %.lr.ph128.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %.lr.ph128.us
  %indvars.iv102127.us = phi i64 [ 0, %.lr.ph128.us ], [ %indvars.iv.next103.us, %._crit_edge11.us ]
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv102127.us
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv104129.us, i64 %indvars.iv102127.us
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %39
  store double %42, double* %40, align 8
  %43 = tail call double @sqrt(double %0) #4
  %44 = getelementptr inbounds double, double* %4, i64 %indvars.iv102127.us
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %40, align 8
  %48 = fdiv double %47, %46
  store double %48, double* %40, align 8
  %indvars.iv.next103.us = add nuw nsw i64 %indvars.iv102127.us, 1
  %exitcond221 = icmp eq i64 %indvars.iv.next103.us, 1200
  br i1 %exitcond221, label %._crit_edge9.us, label %._crit_edge11.us

._crit_edge9.us:                                  ; preds = %._crit_edge11.us
  %indvars.iv.next105.us = add nuw nsw i64 %indvars.iv104129.us, 1
  %exitcond222 = icmp eq i64 %indvars.iv.next105.us, 1400
  br i1 %exitcond222, label %.lr.ph126.split.us.preheader, label %.lr.ph128.us

.lr.ph126.split.us.preheader:                     ; preds = %._crit_edge9.us
  br label %.lr.ph126.split.us

.lr.ph126.split.us:                               ; preds = %.lr.ph126.split.us.preheader, %._crit_edge12.us
  %indvars.iv100124.us = phi i64 [ %indvars.iv.next99119.us, %._crit_edge12.us ], [ 0, %.lr.ph126.split.us.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100124.us, i64 %indvars.iv100124.us
  store double 1.000000e+00, double* %49, align 8
  %indvars.iv.next99119.us = add nuw nsw i64 %indvars.iv100124.us, 1
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %.unr-lcssa
  %exitcond11 = icmp eq i64 %indvars.iv.next99119.us, 1199
  br i1 %exitcond11, label %.loopexit, label %.lr.ph126.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph126.split.us, %.unr-lcssa
  %indvars.iv.next99120.us.us = phi i64 [ %indvars.iv.next99.us.us, %.unr-lcssa ], [ %indvars.iv.next99119.us, %.lr.ph126.split.us ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100124.us, i64 %indvars.iv.next99120.us.us
  store double 0.000000e+00, double* %50, align 8
  br label %.lr.ph.us.us.new

.unr-lcssa:                                       ; preds = %.lr.ph.us.us.new
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next99120.us.us, i64 %indvars.iv100124.us
  store double %64, double* %51, align 8
  %indvars.iv.next99.us.us = add nuw nsw i64 %indvars.iv.next99120.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next99.us.us, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %52 = phi double [ %64, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv116.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv116.us.us, i64 %indvars.iv100124.us
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv116.us.us, i64 %indvars.iv.next99120.us.us
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %50, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv116.us.us, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv100124.us
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv.next99120.us.us
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %50, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv116.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %.unr-lcssa, label %.lr.ph.us.us.new

.loopexit:                                        ; preds = %._crit_edge12.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %65, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %17, %.._crit_edge_crit_edge.lr.ph
  %indvars.iv1014 = phi i64 [ %indvars.iv.next11, %17 ], [ 0, %.._crit_edge_crit_edge.lr.ph ]
  %5 = mul nuw nsw i64 %indvars.iv1014, 1200
  br label %6

; <label>:6:                                      ; preds = %.lr.ph, %._crit_edge2
  %indvars.iv13 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %7 = add nuw nsw i64 %indvars.iv13, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1014, i64 %indvars.iv13
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %._crit_edge2
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1014, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond16, label %.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %17
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
