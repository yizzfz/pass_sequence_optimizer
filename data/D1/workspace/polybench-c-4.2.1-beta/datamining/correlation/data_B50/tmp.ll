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
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv9 = phi i64 [ 0, %2 ], [ %indvars.iv.next10, %20 ]
  %3 = trunc i64 %indvars.iv9 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph138:
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph138.split.us

.lr.ph138.split.us:                               ; preds = %._crit_edge134.us, %.lr.ph138
  %indvars.iv206 = phi i64 [ 0, %.lr.ph138 ], [ %indvars.iv.next207, %._crit_edge134.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv206
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr246 = shl i64 %indvars.iv206, 3
  %sunkaddr247 = add i64 %sunkaddr, %sunkaddr246
  %sunkaddr248 = inttoptr i64 %sunkaddr247 to double*
  br label %.lr.ph138.split.us.new

.lr.ph138.split.us.new:                           ; preds = %.lr.ph138.split.us, %.lr.ph138.split.us.new
  %indvars.iv196 = phi i64 [ %indvars.iv.next197.3, %.lr.ph138.split.us.new ], [ 0, %.lr.ph138.split.us ]
  %8 = phi double [ %20, %.lr.ph138.split.us.new ], [ 0.000000e+00, %.lr.ph138.split.us ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv196, i64 %indvars.iv206
  %10 = load double, double* %9, align 8
  %11 = fadd double %8, %10
  store double %11, double* %sunkaddr248, align 8
  %indvars.iv.next197 = or i64 %indvars.iv196, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next197, i64 %indvars.iv206
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  store double %14, double* %sunkaddr248, align 8
  %indvars.iv.next197.1 = or i64 %indvars.iv196, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next197.1, i64 %indvars.iv206
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  store double %17, double* %sunkaddr248, align 8
  %indvars.iv.next197.2 = or i64 %indvars.iv196, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next197.2, i64 %indvars.iv206
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  store double %20, double* %sunkaddr248, align 8
  %indvars.iv.next197.3 = add nsw i64 %indvars.iv196, 4
  %exitcond199.3 = icmp eq i64 %indvars.iv.next197.3, 1400
  br i1 %exitcond199.3, label %._crit_edge134.us, label %.lr.ph138.split.us.new

._crit_edge134.us:                                ; preds = %.lr.ph138.split.us.new
  %21 = fdiv double %20, %2
  store double %21, double* %sunkaddr248, align 8
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 1
  %exitcond209 = icmp eq i64 %indvars.iv.next207, 1200
  br i1 %exitcond209, label %.lr.ph130.split.us.preheader, label %.lr.ph138.split.us

.lr.ph130.split.us.preheader:                     ; preds = %._crit_edge134.us
  %sunkaddr257 = ptrtoint double* %6 to i64
  br label %.lr.ph130.split.us

.lr.ph130.split.us:                               ; preds = %.lr.ph130.split.us.preheader, %._crit_edge127.us
  %indvars.iv186 = phi i64 [ %indvars.iv.next187, %._crit_edge127.us ], [ 0, %.lr.ph130.split.us.preheader ]
  %22 = getelementptr inbounds double, double* %6, i64 %indvars.iv186
  store double 0.000000e+00, double* %22, align 8
  %sunkaddr254 = shl i64 %indvars.iv186, 3
  %sunkaddr255 = add i64 %sunkaddr, %sunkaddr254
  %sunkaddr256 = inttoptr i64 %sunkaddr255 to double*
  %sunkaddr259 = add i64 %sunkaddr257, %sunkaddr254
  %sunkaddr260 = inttoptr i64 %sunkaddr259 to double*
  br label %.lr.ph130.split.us.new

.lr.ph130.split.us.new:                           ; preds = %.lr.ph130.split.us, %.lr.ph130.split.us.new
  %indvars.iv177 = phi i64 [ %indvars.iv.next178.1, %.lr.ph130.split.us.new ], [ 0, %.lr.ph130.split.us ]
  %23 = phi double [ %35, %.lr.ph130.split.us.new ], [ 0.000000e+00, %.lr.ph130.split.us ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv177, i64 %indvars.iv186
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr256, align 8
  %27 = fsub double %25, %26
  %28 = fmul double %27, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr260, align 8
  %indvars.iv.next178 = or i64 %indvars.iv177, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next178, i64 %indvars.iv186
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr256, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %sunkaddr260, align 8
  %indvars.iv.next178.1 = add nsw i64 %indvars.iv177, 2
  %exitcond180.1 = icmp eq i64 %indvars.iv.next178.1, 1400
  br i1 %exitcond180.1, label %._crit_edge127.us, label %.lr.ph130.split.us.new

._crit_edge127.us:                                ; preds = %.lr.ph130.split.us.new
  %36 = fdiv double %35, %2
  store double %36, double* %sunkaddr260, align 8
  %37 = tail call double @sqrt(double %36) #4
  %38 = fcmp ugt double %37, 1.000000e-01
  %39 = select i1 %38, double %37, double 1.000000e+00
  store double %39, double* %sunkaddr260, align 8
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %exitcond189 = icmp eq i64 %indvars.iv.next187, 1200
  br i1 %exitcond189, label %._crit_edge91.us.preheader, label %.lr.ph130.split.us

._crit_edge91.us.preheader:                       ; preds = %._crit_edge127.us
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.preheader, %._crit_edge122.us
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge122.us ], [ 0, %._crit_edge91.us.preheader ]
  br label %40

; <label>:40:                                     ; preds = %40, %._crit_edge91.us
  %indvars.iv168 = phi i64 [ 0, %._crit_edge91.us ], [ %indvars.iv.next169, %40 ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv168
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv172, i64 %indvars.iv168
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %2) #4
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv168
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, 1200
  br i1 %exitcond171, label %._crit_edge122.us, label %40

._crit_edge122.us:                                ; preds = %40
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1
  %exitcond175 = icmp eq i64 %indvars.iv.next173, 1400
  br i1 %exitcond175, label %.lr.ph109.split.us.preheader, label %._crit_edge91.us

.lr.ph109.split.us.preheader:                     ; preds = %._crit_edge122.us
  br label %.lr.ph109.split.us

.lr.ph109.split.us:                               ; preds = %.lr.ph109.split.us.preheader, %._crit_edge107.us-lcssa.us.us
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %._crit_edge107.us-lcssa.us.us ], [ 0, %.lr.ph109.split.us.preheader ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge107.us-lcssa.us.us ], [ 1, %.lr.ph109.split.us.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv151
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %53 = icmp slt i64 %indvars.iv.next152, 1200
  br i1 %53, label %.lr.ph.us.us.preheader, label %._crit_edge107.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph109.split.us
  br label %.lr.ph.us.us

._crit_edge107.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge101.us.us
  br label %._crit_edge107.us-lcssa.us.us

._crit_edge107.us-lcssa.us.us:                    ; preds = %._crit_edge107.us-lcssa.us.us.loopexit, %.lr.ph109.split.us
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next152, 1199
  br i1 %exitcond154, label %._crit_edge110, label %.lr.ph109.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge101.us.us
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge101.us.us ], [ %indvars.iv145, %.lr.ph.us.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv147
  store double 0.000000e+00, double* %54, align 8
  br label %.lr.ph.us.us.new

._crit_edge101.us.us:                             ; preds = %.lr.ph.us.us.new
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv147, i64 %indvars.iv151
  store double %68, double* %55, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %exitcond = icmp eq i64 %indvars.iv.next148, 1200
  br i1 %exitcond, label %._crit_edge107.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %56 = phi double [ %68, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv151
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv147
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %54, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv151
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv147
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %54, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge101.us.us, label %.lr.ph.us.us.new

._crit_edge110:                                   ; preds = %._crit_edge107.us-lcssa.us.us
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %69, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge12.us, %._crit_edge.us.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us ]
  %6 = mul nsw i64 %indvars.iv15, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge10.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge10.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %7

._crit_edge12.us:                                 ; preds = %._crit_edge10.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge14, label %._crit_edge.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
