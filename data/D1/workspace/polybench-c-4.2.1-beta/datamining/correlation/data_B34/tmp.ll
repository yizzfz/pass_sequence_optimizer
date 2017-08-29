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
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
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
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %4
  %indvars.iv6 = phi i64 [ 0, %4 ], [ %indvars.iv.next7, %21 ]
  %5 = trunc i64 %indvars.iv6 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge9 ]
  %9 = mul nuw nsw i64 %indvars.iv6, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv6, %indvars.iv.next
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %11, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.200000e+03, double 1.200000e+03>
  %19 = fadd <2 x double> %8, %18
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %21, label %._crit_edge9

; <label>:21:                                     ; preds = %._crit_edge9
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond8, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph67:
  br label %.lr.ph67.split.us

.lr.ph67.split.us:                                ; preds = %._crit_edge62.us, %.lr.ph67
  %indvars.iv130 = phi i64 [ 0, %.lr.ph67 ], [ %indvars.iv.next131, %._crit_edge62.us ]
  %sext152 = shl i64 %indvars.iv130, 32
  %7 = ashr exact i64 %sext152, 32
  %8 = getelementptr inbounds double, double* %5, i64 %7
  store double 0.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv130
  %.pre154 = load double, double* %9, align 8
  br label %.lr.ph67.split.us.new

.lr.ph67.split.us.new:                            ; preds = %.lr.ph67.split.us.new, %.lr.ph67.split.us
  %10 = phi double [ %.pre154, %.lr.ph67.split.us ], [ %22, %.lr.ph67.split.us.new ]
  %indvars.iv126 = phi i64 [ 0, %.lr.ph67.split.us ], [ %indvars.iv.next127.3, %.lr.ph67.split.us.new ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv126, i64 %indvars.iv130
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %9, align 8
  %indvars.iv.next127 = or i64 %indvars.iv126, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next127, i64 %indvars.iv130
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %9, align 8
  %indvars.iv.next127.1 = or i64 %indvars.iv126, 2
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next127.1, i64 %indvars.iv130
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %9, align 8
  %indvars.iv.next127.2 = or i64 %indvars.iv126, 3
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next127.2, i64 %indvars.iv130
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %9, align 8
  %indvars.iv.next127.3 = add nsw i64 %indvars.iv126, 4
  %exitcond129.3 = icmp eq i64 %indvars.iv.next127.3, 1400
  br i1 %exitcond129.3, label %._crit_edge62.us, label %.lr.ph67.split.us.new

._crit_edge62.us:                                 ; preds = %.lr.ph67.split.us.new
  %23 = fdiv double %22, %2
  store double %23, double* %9, align 8
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, 1
  %24 = icmp slt i64 %indvars.iv.next131, 1200
  br i1 %24, label %.lr.ph67.split.us, label %.lr.ph54.split.us.preheader

.lr.ph54.split.us.preheader:                      ; preds = %._crit_edge62.us
  br label %.lr.ph54.split.us

.lr.ph54.split.us:                                ; preds = %.lr.ph54.split.us.preheader, %._crit_edge50.us
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %._crit_edge50.us ], [ 0, %.lr.ph54.split.us.preheader ]
  %sext150 = shl i64 %indvars.iv120, 32
  %25 = ashr exact i64 %sext150, 32
  %26 = getelementptr inbounds double, double* %6, i64 %25
  store double 0.000000e+00, double* %26, align 8
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv120
  %28 = getelementptr inbounds double, double* %6, i64 %indvars.iv120
  %.pre155 = load double, double* %28, align 8
  br label %._crit_edge172

._crit_edge172:                                   ; preds = %._crit_edge172, %.lr.ph54.split.us
  %29 = phi double [ %.pre155, %.lr.ph54.split.us ], [ %41, %._crit_edge172 ]
  %indvars.iv117 = phi i64 [ 0, %.lr.ph54.split.us ], [ %indvars.iv.next118.1, %._crit_edge172 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv120
  %31 = load double, double* %30, align 8
  %32 = load double, double* %27, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %28, align 8
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next118, i64 %indvars.iv120
  %37 = load double, double* %36, align 8
  %38 = load double, double* %27, align 8
  %39 = fsub double %37, %38
  %40 = fmul double %39, %39
  %41 = fadd double %35, %40
  store double %41, double* %28, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %42 = icmp slt i64 %indvars.iv.next118.1, 1400
  br i1 %42, label %._crit_edge172, label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %._crit_edge172
  %43 = fdiv double %41, %2
  store double %43, double* %28, align 8
  %44 = tail call double @sqrt(double %43) #4
  %45 = fcmp ugt double %44, 1.000000e-01
  %46 = select i1 %45, double %44, double 1.000000e+00
  store double %46, double* %28, align 8
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  %47 = icmp slt i64 %indvars.iv.next121, 1200
  br i1 %47, label %.lr.ph54.split.us, label %._crit_edge11.us.preheader

._crit_edge11.us.preheader:                       ; preds = %._crit_edge50.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge40.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge40.us ], [ 0, %._crit_edge11.us.preheader ]
  br label %._crit_edge173

._crit_edge173:                                   ; preds = %._crit_edge173, %._crit_edge11.us
  %indvars.iv113 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next114, %._crit_edge173 ]
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv113
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv115, i64 %indvars.iv113
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %53 = tail call double @sqrt(double %2) #4
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv113
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = load double, double* %50, align 8
  %58 = fdiv double %57, %56
  store double %58, double* %50, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %59 = icmp slt i64 %indvars.iv.next114, 1200
  br i1 %59, label %._crit_edge173, label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge173
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %60 = icmp slt i64 %indvars.iv.next116, 1400
  br i1 %60, label %._crit_edge11.us, label %.lr.ph29.split.us.preheader

.lr.ph29.split.us.preheader:                      ; preds = %._crit_edge40.us
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %.lr.ph29.split.us.preheader, %._crit_edge23.us-lcssa.us.us..lr.ph29.split.us_crit_edge
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge23.us-lcssa.us.us..lr.ph29.split.us_crit_edge ], [ 0, %.lr.ph29.split.us.preheader ]
  %storemerge328.us = phi i32 [ %66, %._crit_edge23.us-lcssa.us.us..lr.ph29.split.us_crit_edge ], [ 0, %.lr.ph29.split.us.preheader ]
  %61 = sext i32 %storemerge328.us to i64
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %61, i64 %61
  store double 1.000000e+00, double* %62, align 8
  %storemerge419.us = add nsw i32 %storemerge328.us, 1
  %63 = icmp slt i32 %storemerge419.us, 1200
  br i1 %63, label %.lr.ph22.us, label %._crit_edge23.us-lcssa.us.us

.lr.ph22.us:                                      ; preds = %.lr.ph29.split.us
  %64 = sext i32 %storemerge419.us to i64
  br label %.lr.ph.us.us

._crit_edge23.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge17.us.us.loopexit
  br label %._crit_edge23.us-lcssa.us.us

._crit_edge23.us-lcssa.us.us:                     ; preds = %._crit_edge23.us-lcssa.us.us.loopexit, %.lr.ph29.split.us
  %indvars.iv.next106 = add nsw i64 %indvars.iv105, 1
  %65 = icmp slt i64 %indvars.iv.next106, 1199
  br i1 %65, label %._crit_edge23.us-lcssa.us.us..lr.ph29.split.us_crit_edge, label %._crit_edge30

._crit_edge23.us-lcssa.us.us..lr.ph29.split.us_crit_edge: ; preds = %._crit_edge23.us-lcssa.us.us
  %66 = trunc i64 %indvars.iv.next106 to i32
  br label %.lr.ph29.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge17.us.us.loopexit, %.lr.ph22.us
  %indvars.iv102 = phi i64 [ %64, %.lr.ph22.us ], [ %indvars.iv.next103, %._crit_edge17.us.us.loopexit ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv105, i64 %indvars.iv102
  store double 0.000000e+00, double* %67, align 8
  br label %.lr.ph.us.us.new

._crit_edge17.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv105
  store double %81, double* %68, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next103 to i32
  %exitcond104 = icmp eq i32 %lftr.wideiv, 1200
  br i1 %exitcond104, label %._crit_edge23.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %69 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %81, %.lr.ph.us.us.new ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv105
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv102
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %74, %69
  store double %75, double* %67, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv105
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv102
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %67, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge17.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge30:                                    ; preds = %._crit_edge23.us-lcssa.us.us
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %82, align 8
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

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %6 = mul nsw i64 %indvars.iv13, 1200
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %7 = add nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2.us

; <label>:11:                                     ; preds = %._crit_edge2.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge4.us, label %._crit_edge2.us._crit_edge

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %17 = icmp slt i64 %indvars.iv.next14, 1200
  br i1 %17, label %._crit_edge.us, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge4.us
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
