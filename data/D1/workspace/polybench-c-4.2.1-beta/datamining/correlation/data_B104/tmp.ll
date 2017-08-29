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
.lr.ph134:
  %5 = ptrtoint double* %3 to i64
  br label %.lr.ph134.split.us

.lr.ph134.split.us:                               ; preds = %._crit_edge.us, %.lr.ph134
  %indvars.iv44 = phi i64 [ 0, %.lr.ph134 ], [ %indvars.iv.next45, %._crit_edge.us ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv44
  store double 0.000000e+00, double* %6, align 8
  %.pre215 = shl nsw i64 %indvars.iv44, 3
  %sunkaddr136 = add i64 %5, %.pre215
  %7 = inttoptr i64 %sunkaddr136 to double*
  %8 = inttoptr i64 %sunkaddr136 to double*
  br label %.lr.ph134.split.us.new

.lr.ph134.split.us.new:                           ; preds = %.lr.ph134.split.us.new, %.lr.ph134.split.us
  %indvars.iv198 = phi i64 [ 0, %.lr.ph134.split.us ], [ %indvars.iv.next199.1.1, %.lr.ph134.split.us.new ]
  %9 = phi double [ 0.000000e+00, %.lr.ph134.split.us ], [ %21, %.lr.ph134.split.us.new ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv198, i64 %indvars.iv44
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %7, align 8
  %indvars.iv.next199 = or i64 %indvars.iv198, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next199, i64 %indvars.iv44
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %7, align 8
  %indvars.iv.next199.1 = or i64 %indvars.iv198, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next199.1, i64 %indvars.iv44
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %8, align 8
  %indvars.iv.next199.152 = or i64 %indvars.iv198, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next199.152, i64 %indvars.iv44
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %8, align 8
  %indvars.iv.next199.1.1 = add nsw i64 %indvars.iv198, 4
  %exitcond201.1.1 = icmp eq i64 %indvars.iv.next199.1.1, 1400
  br i1 %exitcond201.1.1, label %._crit_edge.us, label %.lr.ph134.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph134.split.us.new
  %22 = fdiv double %21, %0
  store double %22, double* %8, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next45, 1200
  br i1 %exitcond46, label %.lr.ph128.split.us.preheader, label %.lr.ph134.split.us

.lr.ph128.split.us.preheader:                     ; preds = %._crit_edge.us
  %23 = ptrtoint double* %4 to i64
  br label %.lr.ph128.split.us

.lr.ph128.split.us:                               ; preds = %.lr.ph128.split.us.preheader, %._crit_edge125.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge125.us ], [ 0, %.lr.ph128.split.us.preheader ]
  %24 = getelementptr inbounds double, double* %4, i64 %indvars.iv41
  store double 0.000000e+00, double* %24, align 8
  %.pre219 = shl nsw i64 %indvars.iv41, 3
  %sunkaddr148 = add i64 %23, %.pre219
  %25 = inttoptr i64 %sunkaddr148 to double*
  %sunkaddr232 = add i64 %5, %.pre219
  %sunkaddr233 = inttoptr i64 %sunkaddr232 to double*
  br label %.lr.ph128.split.us.new

.lr.ph128.split.us.new:                           ; preds = %.lr.ph128.split.us, %.lr.ph128.split.us.new
  %indvars.iv183 = phi i64 [ %indvars.iv.next184.1, %.lr.ph128.split.us.new ], [ 0, %.lr.ph128.split.us ]
  %26 = phi double [ %38, %.lr.ph128.split.us.new ], [ 0.000000e+00, %.lr.ph128.split.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv183, i64 %indvars.iv41
  %28 = load double, double* %27, align 8
  %29 = load double, double* %sunkaddr233, align 8
  %30 = fsub double %28, %29
  %31 = fmul double %30, %30
  %32 = fadd double %26, %31
  store double %32, double* %25, align 8
  %indvars.iv.next184 = or i64 %indvars.iv183, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next184, i64 %indvars.iv41
  %34 = load double, double* %33, align 8
  %35 = load double, double* %sunkaddr233, align 8
  %36 = fsub double %34, %35
  %37 = fmul double %36, %36
  %38 = fadd double %32, %37
  store double %38, double* %25, align 8
  %indvars.iv.next184.1 = add nuw nsw i64 %indvars.iv183, 2
  %exitcond186.1 = icmp eq i64 %indvars.iv.next184.1, 1400
  br i1 %exitcond186.1, label %._crit_edge125.us, label %.lr.ph128.split.us.new

._crit_edge125.us:                                ; preds = %.lr.ph128.split.us.new
  %39 = fdiv double %38, %0
  store double %39, double* %25, align 8
  %40 = tail call double @sqrt(double %39) #4
  %41 = fcmp ugt double %40, 1.000000e-01
  %42 = select i1 %41, double %40, double 1.000000e+00
  store double %42, double* %25, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond43, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph128.split.us

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge125.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv178 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next179, %._crit_edge11.us ]
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv178
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv178
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %48 = tail call double @sqrt(double %0) #4
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv178
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %45, align 8
  %53 = fdiv double %52, %51
  store double %53, double* %45, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next179, 1200
  br i1 %exitcond181, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 1400
  br i1 %exitcond40, label %.lr.ph109.split.us.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph109.split.us.preheader:                     ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph109.split.us

.lr.ph109.split.us:                               ; preds = %.lr.ph109.split.us.preheader, %._crit_edge12.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge12.us ], [ 0, %.lr.ph109.split.us.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge12.us ], [ 1, %.lr.ph109.split.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv35, i64 %indvars.iv35
  store double 1.000000e+00, double* %54, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge101.us.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 1199
  br i1 %exitcond37, label %._crit_edge12._crit_edge, label %.lr.ph109.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge101.us.us, %.lr.ph109.split.us
  %indvars.iv33 = phi i64 [ %indvars.iv31, %.lr.ph109.split.us ], [ %indvars.iv.next34, %._crit_edge101.us.us ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv35, i64 %indvars.iv33
  store double 0.000000e+00, double* %55, align 8
  br label %.lr.ph.us.us.new

._crit_edge101.us.us:                             ; preds = %.lr.ph.us.us.new
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv35
  store double %69, double* %56, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %57 = phi double [ %69, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv35
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv33
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %55, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv35
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv33
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge101.us.us, label %.lr.ph.us.us.new

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

._crit_edge2.us:                                  ; preds = %6, %11
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
