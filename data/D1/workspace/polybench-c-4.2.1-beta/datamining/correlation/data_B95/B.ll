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
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %20 = icmp slt i64 %indvars.iv.next4, 1400
  br i1 %20, label %.._crit_edge_crit_edge, label %21

; <label>:21:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph134:
  %5 = ptrtoint double* %3 to i64
  br label %.lr.ph134.split.us

.lr.ph134.split.us:                               ; preds = %._crit_edge.us, %.lr.ph134
  %indvars.iv14 = phi i64 [ 0, %.lr.ph134 ], [ %indvars.iv.next15, %._crit_edge.us ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double 0.000000e+00, double* %6, align 8
  %.pre221 = shl nsw i64 %indvars.iv14, 3
  %sunkaddr139 = add i64 %5, %.pre221
  %7 = inttoptr i64 %sunkaddr139 to double*
  %8 = inttoptr i64 %sunkaddr139 to double*
  br label %.lr.ph134.split.us.new

.lr.ph134.split.us.new:                           ; preds = %.lr.ph134.split.us.new, %.lr.ph134.split.us
  %indvars.iv205 = phi i64 [ 0, %.lr.ph134.split.us ], [ %indvars.iv.next206.1.1, %.lr.ph134.split.us.new ]
  %9 = phi double [ 0.000000e+00, %.lr.ph134.split.us ], [ %21, %.lr.ph134.split.us.new ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv205, i64 %indvars.iv14
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %7, align 8
  %indvars.iv.next206 = or i64 %indvars.iv205, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next206, i64 %indvars.iv14
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %7, align 8
  %indvars.iv.next206.1 = or i64 %indvars.iv205, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next206.1, i64 %indvars.iv14
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %8, align 8
  %indvars.iv.next206.121 = or i64 %indvars.iv205, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next206.121, i64 %indvars.iv14
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %8, align 8
  %indvars.iv.next206.1.1 = add nsw i64 %indvars.iv205, 4
  %exitcond208.1.1 = icmp eq i64 %indvars.iv.next206.1.1, 1400
  br i1 %exitcond208.1.1, label %._crit_edge.us, label %.lr.ph134.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph134.split.us.new
  %22 = fdiv double %21, %0
  store double %22, double* %8, align 8
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %23 = icmp slt i64 %indvars.iv.next15, 1200
  br i1 %23, label %.lr.ph134.split.us, label %.lr.ph128.split.us.preheader

.lr.ph128.split.us.preheader:                     ; preds = %._crit_edge.us
  %24 = ptrtoint double* %4 to i64
  br label %.lr.ph128.split.us

.lr.ph128.split.us:                               ; preds = %.lr.ph128.split.us.preheader, %._crit_edge125.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge125.us ], [ 0, %.lr.ph128.split.us.preheader ]
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv12
  store double 0.000000e+00, double* %25, align 8
  %.pre225 = shl nsw i64 %indvars.iv12, 3
  %sunkaddr151 = add i64 %24, %.pre225
  %26 = inttoptr i64 %sunkaddr151 to double*
  %sunkaddr239 = add i64 %5, %.pre225
  %sunkaddr240 = inttoptr i64 %sunkaddr239 to double*
  br label %.lr.ph128.split.us.new

.lr.ph128.split.us.new:                           ; preds = %.lr.ph128.split.us.new, %.lr.ph128.split.us
  %indvars.iv190 = phi i64 [ 0, %.lr.ph128.split.us ], [ %indvars.iv.next191.1, %.lr.ph128.split.us.new ]
  %27 = phi double [ 0.000000e+00, %.lr.ph128.split.us ], [ %39, %.lr.ph128.split.us.new ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv190, i64 %indvars.iv12
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr240, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %26, align 8
  %indvars.iv.next191 = or i64 %indvars.iv190, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next191, i64 %indvars.iv12
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr240, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %26, align 8
  %indvars.iv.next191.1 = add nuw nsw i64 %indvars.iv190, 2
  %exitcond193.1 = icmp eq i64 %indvars.iv.next191.1, 1400
  br i1 %exitcond193.1, label %._crit_edge125.us, label %.lr.ph128.split.us.new

._crit_edge125.us:                                ; preds = %.lr.ph128.split.us.new
  %40 = fdiv double %39, %0
  store double %40, double* %26, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %43 = select i1 %42, double %41, double 1.000000e+00
  store double %43, double* %26, align 8
  %indvars.iv.next13 = add nuw i64 %indvars.iv12, 1
  %44 = icmp slt i64 %indvars.iv.next13, 1200
  br i1 %44, label %.lr.ph128.split.us, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge125.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv185 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next186, %._crit_edge11.us ]
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv185
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv185
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %50 = tail call double @sqrt(double %0) #4
  %51 = getelementptr inbounds double, double* %4, i64 %indvars.iv185
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = load double, double* %47, align 8
  %55 = fdiv double %54, %53
  store double %55, double* %47, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond188 = icmp eq i64 %indvars.iv.next186, 1200
  br i1 %exitcond188, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next11 = add nuw i64 %indvars.iv10, 1
  %56 = icmp slt i64 %indvars.iv.next11, 1400
  br i1 %56, label %._crit_edge9.._crit_edge11_crit_edge.us, label %.lr.ph109.split.us.preheader

.lr.ph109.split.us.preheader:                     ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph109.split.us

.lr.ph109.split.us:                               ; preds = %.lr.ph109.split.us.preheader, %._crit_edge12.us..lr.ph109.split.us_crit_edge
  %indvars.iv6 = phi i32 [ %indvars.iv.next7, %._crit_edge12.us..lr.ph109.split.us_crit_edge ], [ 1, %.lr.ph109.split.us.preheader ]
  %indvars.iv169 = phi i64 [ %indvars.iv.next170, %._crit_edge12.us..lr.ph109.split.us_crit_edge ], [ 0, %.lr.ph109.split.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv169, i64 %indvars.iv169
  store double 1.000000e+00, double* %57, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %58 = icmp slt i64 %indvars.iv.next170, 1200
  br i1 %58, label %.lr.ph.us.us.preheader, label %._crit_edge12.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph109.split.us
  %59 = sext i32 %indvars.iv6 to i64
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge101.us.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.lr.ph109.split.us
  %exitcond = icmp eq i64 %indvars.iv.next170, 1199
  br i1 %exitcond, label %._crit_edge12._crit_edge, label %._crit_edge12.us..lr.ph109.split.us_crit_edge

._crit_edge12.us..lr.ph109.split.us_crit_edge:    ; preds = %._crit_edge12.us
  %indvars.iv.next7 = add i32 %indvars.iv6, 1
  br label %.lr.ph109.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge101.us.us
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge101.us.us ], [ %59, %.lr.ph.us.us.preheader ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv169, i64 %indvars.iv8
  store double 0.000000e+00, double* %60, align 8
  br label %.lr.ph.us.us.new

._crit_edge101.us.us:                             ; preds = %.lr.ph.us.us.new
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv169
  store double %75, double* %61, align 8
  %indvars.iv.next9 = add i64 %indvars.iv8, 1
  %62 = icmp slt i64 %indvars.iv.next9, 1200
  br i1 %62, label %.lr.ph.us.us, label %._crit_edge12.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %63 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %75, %.lr.ph.us.us.new ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv169
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv8
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %60, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv169
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv8
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %60, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge101.us.us, label %.lr.ph.us.us.new

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %76, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
..._crit_edge_crit_edge.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %..._crit_edge_crit_edge.us_crit_edge
  %indvars.iv1 = phi i64 [ 0, %..._crit_edge_crit_edge.us_crit_edge ], [ %indvars.iv.next2, %._crit_edge._crit_edge.us ]
  %5 = mul i64 %indvars.iv1, 1200
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %6 = add i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2.us

; <label>:10:                                     ; preds = %._crit_edge2.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge2.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %16 = trunc i64 %indvars.iv.next2 to i32
  %17 = icmp slt i32 %16, 1200
  br i1 %17, label %.._crit_edge_crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
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
