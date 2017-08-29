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
  %indvars.iv7 = phi i64 [ 0, %2 ], [ %indvars.iv.next8, %19 ]
  %3 = trunc i64 %indvars.iv7 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv7
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1400
  br i1 %exitcond9, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph165.split.us.preheader:
  %5 = ptrtoint double* %3 to i64
  br label %.lr.ph165.split.us.new.preheader

.lr.ph165.split.us.new.preheader:                 ; preds = %.lr.ph165.split.us.preheader, %._crit_edge.us
  %indvars.iv166.us = phi i64 [ %indvars.iv.next167.us, %._crit_edge.us ], [ 0, %.lr.ph165.split.us.preheader ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv166.us
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr250 = shl i64 %indvars.iv166.us, 3
  %sunkaddr251 = add i64 %5, %sunkaddr250
  %sunkaddr252 = inttoptr i64 %sunkaddr251 to double*
  %sunkaddr250.1 = shl i64 %indvars.iv166.us, 3
  %sunkaddr251.1 = add i64 %5, %sunkaddr250.1
  %sunkaddr252.1 = inttoptr i64 %sunkaddr251.1 to double*
  br label %.lr.ph165.split.us.new

.lr.ph165.split.us.new:                           ; preds = %.lr.ph165.split.us.new, %.lr.ph165.split.us.new.preheader
  %indvars.iv159.us = phi i64 [ 0, %.lr.ph165.split.us.new.preheader ], [ %indvars.iv.next160.us.1.1, %.lr.ph165.split.us.new ]
  %7 = phi double [ 0.000000e+00, %.lr.ph165.split.us.new.preheader ], [ %19, %.lr.ph165.split.us.new ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv159.us, i64 %indvars.iv166.us
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %sunkaddr252, align 8
  %indvars.iv.next160.us = or i64 %indvars.iv159.us, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next160.us, i64 %indvars.iv166.us
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr252, align 8
  %indvars.iv.next160.us.1 = or i64 %indvars.iv159.us, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next160.us.1, i64 %indvars.iv166.us
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr252.1, align 8
  %indvars.iv.next160.us.13 = or i64 %indvars.iv159.us, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next160.us.13, i64 %indvars.iv166.us
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr252.1, align 8
  %indvars.iv.next160.us.1.1 = add nsw i64 %indvars.iv159.us, 4
  %exitcond162.us.1.1 = icmp eq i64 %indvars.iv.next160.us.1.1, 1400
  br i1 %exitcond162.us.1.1, label %._crit_edge.us, label %.lr.ph165.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph165.split.us.new
  %20 = fdiv double %19, %0
  store double %20, double* %sunkaddr252.1, align 8
  %indvars.iv.next167.us = add nuw nsw i64 %indvars.iv166.us, 1
  %exitcond169.us = icmp eq i64 %indvars.iv.next167.us, 1200
  br i1 %exitcond169.us, label %.lr.ph151.split.us.preheader, label %.lr.ph165.split.us.new.preheader

.lr.ph151.split.us.preheader:                     ; preds = %._crit_edge.us
  %21 = ptrtoint double* %4 to i64
  br label %.lr.ph151.split.us.new.preheader

.lr.ph151.split.us.new.preheader:                 ; preds = %.lr.ph151.split.us.preheader, %._crit_edge144.us
  %indvars.iv152.us = phi i64 [ %indvars.iv.next153.us, %._crit_edge144.us ], [ 0, %.lr.ph151.split.us.preheader ]
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv152.us
  store double 0.000000e+00, double* %22, align 8
  %sunkaddr258 = shl i64 %indvars.iv152.us, 3
  %sunkaddr259 = add i64 %5, %sunkaddr258
  %sunkaddr260 = inttoptr i64 %sunkaddr259 to double*
  %sunkaddr263 = add i64 %21, %sunkaddr258
  %sunkaddr264 = inttoptr i64 %sunkaddr263 to double*
  br label %.lr.ph151.split.us.new

.lr.ph151.split.us.new:                           ; preds = %.lr.ph151.split.us.new.preheader, %.lr.ph151.split.us.new
  %indvars.iv146.us = phi i64 [ %indvars.iv.next147.us.1, %.lr.ph151.split.us.new ], [ 0, %.lr.ph151.split.us.new.preheader ]
  %23 = phi double [ %35, %.lr.ph151.split.us.new ], [ 0.000000e+00, %.lr.ph151.split.us.new.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv146.us, i64 %indvars.iv152.us
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr260, align 8
  %27 = fsub double %25, %26
  %28 = fmul double %27, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr264, align 8
  %indvars.iv.next147.us = or i64 %indvars.iv146.us, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next147.us, i64 %indvars.iv152.us
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr260, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %sunkaddr264, align 8
  %indvars.iv.next147.us.1 = add nsw i64 %indvars.iv146.us, 2
  %exitcond149.us.1 = icmp eq i64 %indvars.iv.next147.us.1, 1400
  br i1 %exitcond149.us.1, label %._crit_edge144.us, label %.lr.ph151.split.us.new

._crit_edge144.us:                                ; preds = %.lr.ph151.split.us.new
  %36 = fdiv double %35, %0
  store double %36, double* %sunkaddr264, align 8
  %37 = tail call double @sqrt(double %36) #4
  %38 = fcmp ugt double %37, 1.000000e-01
  %39 = select i1 %38, double %37, double 1.000000e+00
  store double %39, double* %sunkaddr264, align 8
  %indvars.iv.next153.us = add nuw nsw i64 %indvars.iv152.us, 1
  %exitcond155.us = icmp eq i64 %indvars.iv.next153.us, 1200
  br i1 %exitcond155.us, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph151.split.us.new.preheader

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge144.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %indvars.iv137.us = phi i64 [ %indvars.iv.next138.us, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv132.us = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next133.us, %._crit_edge11.us ]
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv132.us
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137.us, i64 %indvars.iv132.us
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %45 = tail call double @sqrt(double %0) #4
  %46 = getelementptr inbounds double, double* %4, i64 %indvars.iv132.us
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %42, align 8
  %50 = fdiv double %49, %48
  store double %50, double* %42, align 8
  %indvars.iv.next133.us = add nuw nsw i64 %indvars.iv132.us, 1
  %exitcond135.us = icmp eq i64 %indvars.iv.next133.us, 1200
  br i1 %exitcond135.us, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next138.us = add nuw nsw i64 %indvars.iv137.us, 1
  %exitcond140.us = icmp eq i64 %indvars.iv.next138.us, 1400
  br i1 %exitcond140.us, label %.lr.ph116.split.us.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph116.split.us.preheader:                     ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph116.split.us

.lr.ph116.split.us:                               ; preds = %.lr.ph116.split.us.preheader, %._crit_edge12.us
  %indvars.iv170 = phi i32 [ %indvars.iv.next171, %._crit_edge12.us ], [ 1, %.lr.ph116.split.us.preheader ]
  %indvars.iv117.us = phi i64 [ %indvars.iv.next118.us, %._crit_edge12.us ], [ 0, %.lr.ph116.split.us.preheader ]
  %51 = phi i64 [ %54, %._crit_edge12.us ], [ 1, %.lr.ph116.split.us.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv117.us, i64 %indvars.iv117.us
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next118.us = add nuw nsw i64 %indvars.iv117.us, 1
  %53 = icmp slt i64 %indvars.iv.next118.us, 1200
  br i1 %53, label %.lr.ph.us.us.new.preheader.preheader, label %._crit_edge12.us

.lr.ph.us.us.new.preheader.preheader:             ; preds = %.lr.ph116.split.us
  br label %.lr.ph.us.us.new.preheader

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge101.us.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.lr.ph116.split.us
  %indvars.iv.next171 = add i32 %indvars.iv170, 1
  %54 = sext i32 %indvars.iv.next171 to i64
  %exitcond120.us = icmp eq i64 %indvars.iv.next118.us, 1199
  br i1 %exitcond120.us, label %._crit_edge12._crit_edge, label %.lr.ph116.split.us

.lr.ph.us.us.new.preheader:                       ; preds = %.lr.ph.us.us.new.preheader.preheader, %._crit_edge101.us.us
  %indvars.iv111.us = phi i64 [ %indvars.iv.next112.us, %._crit_edge101.us.us ], [ %51, %.lr.ph.us.us.new.preheader.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv117.us, i64 %indvars.iv111.us
  store double 0.000000e+00, double* %55, align 8
  br label %.lr.ph.us.us.new

._crit_edge101.us.us:                             ; preds = %.lr.ph.us.us.new
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv111.us, i64 %indvars.iv117.us
  store double %69, double* %56, align 8
  %indvars.iv.next112.us = add nsw i64 %indvars.iv111.us, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next112.us to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 1200
  br i1 %exitcond, label %._crit_edge12.us.loopexit, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us.new.preheader ]
  %57 = phi double [ %69, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us.new.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.us.us, i64 %indvars.iv117.us
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.us.us, i64 %indvars.iv111.us
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %55, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv.us.us, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv117.us
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv111.us
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %55, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.us.us.1, label %._crit_edge101.us.us, label %.lr.ph.us.us.new

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %70, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge2_crit_edge.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge2_crit_edge.us

.._crit_edge2_crit_edge.us:                       ; preds = %._crit_edge2._crit_edge.us, %.._crit_edge2_crit_edge.lr.ph
  %indvars.iv13.us = phi i64 [ 0, %.._crit_edge2_crit_edge.lr.ph ], [ %indvars.iv.next14.us, %._crit_edge2._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv13.us, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.._crit_edge2_crit_edge.us
  %indvars.iv.us = phi i64 [ 0, %.._crit_edge2_crit_edge.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %7 = add nsw i64 %indvars.iv.us, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13.us, i64 %indvars.iv.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge2._crit_edge.us, label %6

._crit_edge2._crit_edge.us:                       ; preds = %._crit_edge.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond16.us = icmp eq i64 %indvars.iv.next14.us, 1200
  br i1 %exitcond16.us, label %._crit_edge12, label %.._crit_edge2_crit_edge.us

._crit_edge12:                                    ; preds = %._crit_edge2._crit_edge.us
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
