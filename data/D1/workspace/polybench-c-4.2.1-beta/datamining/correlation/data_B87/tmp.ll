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
  tail call fastcc void @print_array([1200 x double]* %10)
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

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %19 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph153:
  %5 = ptrtoint double* %3 to i64
  br label %.lr.ph153.split.us

.lr.ph153.split.us:                               ; preds = %._crit_edge.us, %.lr.ph153
  %indvars.iv19 = phi i64 [ 0, %.lr.ph153 ], [ %indvars.iv.next20, %._crit_edge.us ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv19
  store double 0.000000e+00, double* %6, align 8
  %.pre223 = shl nsw i64 %indvars.iv19, 3
  %sunkaddr155 = add i64 %5, %.pre223
  %7 = inttoptr i64 %sunkaddr155 to double*
  %8 = inttoptr i64 %sunkaddr155 to double*
  br label %.lr.ph153.split.us.new

.lr.ph153.split.us.new:                           ; preds = %.lr.ph153.split.us.new, %.lr.ph153.split.us
  %indvars.iv207 = phi i64 [ 0, %.lr.ph153.split.us ], [ %indvars.iv.next208.1.1, %.lr.ph153.split.us.new ]
  %9 = phi double [ 0.000000e+00, %.lr.ph153.split.us ], [ %21, %.lr.ph153.split.us.new ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv207, i64 %indvars.iv19
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %7, align 8
  %indvars.iv.next208 = or i64 %indvars.iv207, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next208, i64 %indvars.iv19
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %7, align 8
  %indvars.iv.next208.1 = or i64 %indvars.iv207, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next208.1, i64 %indvars.iv19
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %8, align 8
  %indvars.iv.next208.127 = or i64 %indvars.iv207, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next208.127, i64 %indvars.iv19
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %8, align 8
  %indvars.iv.next208.1.1 = add nsw i64 %indvars.iv207, 4
  %exitcond210.1.1 = icmp eq i64 %indvars.iv.next208.1.1, 1400
  br i1 %exitcond210.1.1, label %._crit_edge.us, label %.lr.ph153.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph153.split.us.new
  %22 = fdiv double %21, %0
  store double %22, double* %8, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond21, label %.lr.ph147.split.us.preheader, label %.lr.ph153.split.us

.lr.ph147.split.us.preheader:                     ; preds = %._crit_edge.us
  %23 = ptrtoint double* %4 to i64
  br label %.lr.ph147.split.us

.lr.ph147.split.us:                               ; preds = %.lr.ph147.split.us.preheader, %._crit_edge144.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge144.us ], [ 0, %.lr.ph147.split.us.preheader ]
  %24 = getelementptr inbounds double, double* %4, i64 %indvars.iv16
  store double 0.000000e+00, double* %24, align 8
  %.pre228 = shl nsw i64 %indvars.iv16, 3
  %sunkaddr163 = add i64 %23, %.pre228
  %25 = inttoptr i64 %sunkaddr163 to double*
  %sunkaddr247 = add i64 %5, %.pre228
  %sunkaddr248 = inttoptr i64 %sunkaddr247 to double*
  br label %.lr.ph147.split.us.new

.lr.ph147.split.us.new:                           ; preds = %.lr.ph147.split.us, %.lr.ph147.split.us.new
  %indvars.iv194 = phi i64 [ %indvars.iv.next195.1, %.lr.ph147.split.us.new ], [ 0, %.lr.ph147.split.us ]
  %26 = phi double [ %38, %.lr.ph147.split.us.new ], [ 0.000000e+00, %.lr.ph147.split.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv194, i64 %indvars.iv16
  %28 = load double, double* %27, align 8
  %29 = load double, double* %sunkaddr248, align 8
  %30 = fsub double %28, %29
  %31 = fmul double %30, %30
  %32 = fadd double %26, %31
  store double %32, double* %25, align 8
  %indvars.iv.next195 = or i64 %indvars.iv194, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next195, i64 %indvars.iv16
  %34 = load double, double* %33, align 8
  %35 = load double, double* %sunkaddr248, align 8
  %36 = fsub double %34, %35
  %37 = fmul double %36, %36
  %38 = fadd double %32, %37
  store double %38, double* %25, align 8
  %indvars.iv.next195.1 = add nuw nsw i64 %indvars.iv194, 2
  %exitcond197.1 = icmp eq i64 %indvars.iv.next195.1, 1400
  br i1 %exitcond197.1, label %._crit_edge144.us, label %.lr.ph147.split.us.new

._crit_edge144.us:                                ; preds = %.lr.ph147.split.us.new
  %39 = fdiv double %38, %0
  store double %39, double* %25, align 8
  %40 = tail call double @sqrt(double %39) #4
  %41 = fcmp ugt double %40, 1.000000e-01
  %42 = select i1 %41, double %40, double 1.000000e+00
  store double %42, double* %25, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph147.split.us

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge144.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv189 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next190, %._crit_edge11.us ]
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv189
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv189
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %48 = tail call double @sqrt(double %0) #4
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv189
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %45, align 8
  %53 = fdiv double %52, %51
  store double %53, double* %45, align 8
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next190, 1200
  br i1 %exitcond192, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond15, label %.lr.ph128.split.us.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph128.split.us.preheader:                     ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph128.split.us

.lr.ph128.split.us:                               ; preds = %.lr.ph128.split.us.preheader, %._crit_edge12.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge12.us ], [ 0, %.lr.ph128.split.us.preheader ]
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge12.us ], [ 1, %.lr.ph128.split.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv10
  store double 1.000000e+00, double* %54, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge120.us.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1199
  br i1 %exitcond12, label %._crit_edge12._crit_edge, label %.lr.ph128.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge120.us.us, %.lr.ph128.split.us
  %indvars.iv8 = phi i64 [ %indvars.iv6, %.lr.ph128.split.us ], [ %indvars.iv.next9, %._crit_edge120.us.us ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  store double 0.000000e+00, double* %55, align 8
  br label %.lr.ph.us.us.new

._crit_edge120.us.us:                             ; preds = %.lr.ph.us.us.new
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv10
  store double %69, double* %56, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %57 = phi double [ %69, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv10
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv8
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %55, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv10
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv8
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge120.us.us, label %.lr.ph.us.us.new

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %70, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.._crit_edge_crit_edge.us.preheader ], [ %indvars.iv.next2, %._crit_edge._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %11, %6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
