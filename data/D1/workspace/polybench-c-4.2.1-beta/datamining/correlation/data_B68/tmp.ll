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
  %storemerge7 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %3 = sitofp i32 %storemerge7 to double
  %4 = sext i32 %storemerge7 to i64
  %5 = insertelement <2 x double> undef, double %3, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %4
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
  %20 = add nsw i32 %storemerge7, 1
  %21 = icmp slt i32 %20, 1400
  br i1 %21, label %.._crit_edge_crit_edge, label %22

; <label>:22:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph134.split.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph134.split.us

.lr.ph134.split.us:                               ; preds = %._crit_edge.us, %.lr.ph134.split.us.preheader
  %storemerge132.us = phi i32 [ %22, %._crit_edge.us ], [ 0, %.lr.ph134.split.us.preheader ]
  %5 = sext i32 %storemerge132.us to i64
  %6 = getelementptr inbounds double, double* %3, i64 %5
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr141 = shl nsw i64 %5, 3
  %sunkaddr142 = add i64 %sunkaddr, %sunkaddr141
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to double*
  br label %7

; <label>:7:                                      ; preds = %7, %.lr.ph134.split.us
  %indvars.iv170 = phi i64 [ 0, %.lr.ph134.split.us ], [ %indvars.iv.next171.1.1, %7 ]
  %8 = phi double [ 0.000000e+00, %.lr.ph134.split.us ], [ %20, %7 ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv170, i64 %5
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr143, align 8
  %indvars.iv.next171 = or i64 %indvars.iv170, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next171, i64 %5
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr143, align 8
  %indvars.iv.next171.1 = or i64 %indvars.iv170, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next171.1, i64 %5
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr143, align 8
  %indvars.iv.next171.13 = or i64 %indvars.iv170, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next171.13, i64 %5
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr143, align 8
  %indvars.iv.next171.1.1 = add nsw i64 %indvars.iv170, 4
  %exitcond172.1.1 = icmp eq i64 %indvars.iv.next171.1.1, 1400
  br i1 %exitcond172.1.1, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %7
  %21 = fdiv double %20, %0
  store double %21, double* %sunkaddr143, align 8
  %22 = add nsw i32 %storemerge132.us, 1
  %23 = icmp slt i32 %22, 1200
  br i1 %23, label %.lr.ph134.split.us, label %.lr.ph128.split.us.preheader

.lr.ph128.split.us.preheader:                     ; preds = %._crit_edge.us
  %sunkaddr152 = ptrtoint double* %4 to i64
  br label %.lr.ph128.split.us

.lr.ph128.split.us:                               ; preds = %._crit_edge125.us, %.lr.ph128.split.us.preheader
  %storemerge1127.us = phi i32 [ %44, %._crit_edge125.us ], [ 0, %.lr.ph128.split.us.preheader ]
  %24 = sext i32 %storemerge1127.us to i64
  %25 = getelementptr inbounds double, double* %4, i64 %24
  store double 0.000000e+00, double* %25, align 8
  %sunkaddr149 = shl nsw i64 %24, 3
  %sunkaddr150 = add i64 %sunkaddr, %sunkaddr149
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to double*
  %sunkaddr154 = add i64 %sunkaddr152, %sunkaddr149
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to double*
  br label %26

; <label>:26:                                     ; preds = %26, %.lr.ph128.split.us
  %indvars.iv167 = phi i64 [ 0, %.lr.ph128.split.us ], [ %indvars.iv.next168.1, %26 ]
  %27 = phi double [ 0.000000e+00, %.lr.ph128.split.us ], [ %39, %26 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv167, i64 %24
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr151, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr155, align 8
  %indvars.iv.next168 = or i64 %indvars.iv167, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next168, i64 %24
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr151, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr155, align 8
  %indvars.iv.next168.1 = add nsw i64 %indvars.iv167, 2
  %exitcond169.1 = icmp eq i64 %indvars.iv.next168.1, 1400
  br i1 %exitcond169.1, label %._crit_edge125.us, label %26

._crit_edge125.us:                                ; preds = %26
  %40 = fdiv double %39, %0
  store double %40, double* %sunkaddr155, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %43 = select i1 %42, double %41, double 1.000000e+00
  store double %43, double* %sunkaddr155, align 8
  %44 = add nsw i32 %storemerge1127.us, 1
  %45 = icmp slt i32 %44, 1200
  br i1 %45, label %.lr.ph128.split.us, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge125.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %storemerge2121.us = phi i32 [ %58, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %46 = sext i32 %storemerge2121.us to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv164 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next165, %._crit_edge11.us ]
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv164
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %46, i64 %indvars.iv164
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %52 = tail call double @sqrt(double %0) #4
  %53 = getelementptr inbounds double, double* %4, i64 %indvars.iv164
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = load double, double* %49, align 8
  %57 = fdiv double %56, %55
  store double %57, double* %49, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next165, 1200
  br i1 %exitcond166, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %58 = add nsw i32 %storemerge2121.us, 1
  %59 = icmp slt i32 %58, 1400
  br i1 %59, label %._crit_edge9.._crit_edge11_crit_edge.us, label %.lr.ph.us.us.preheader.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge12.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge12.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %storemerge3108.us = phi i32 [ %storemerge4103.us, %._crit_edge12.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %60 = sext i32 %storemerge3108.us to i64
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %60, i64 %60
  store double 1.000000e+00, double* %61, align 8
  %storemerge4103.us = add nsw i32 %storemerge3108.us, 1
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge101.us.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 1199
  br i1 %exitcond, label %._crit_edge12._crit_edge, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge101.us.us, %.lr.ph.us.us.preheader
  %storemerge4104.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge101.us.us ], [ %storemerge4103.us, %.lr.ph.us.us.preheader ]
  %62 = sext i32 %storemerge4104.us.us to i64
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %60, i64 %62
  store double 0.000000e+00, double* %63, align 8
  br label %66

._crit_edge101.us.us:                             ; preds = %66
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %62, i64 %60
  store double %79, double* %64, align 8
  %storemerge4.us.us = add nsw i32 %storemerge4104.us.us, 1
  %65 = icmp slt i32 %storemerge4.us.us, 1200
  br i1 %65, label %.lr.ph.us.us, label %._crit_edge12.us

; <label>:66:                                     ; preds = %66, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %66 ]
  %67 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %79, %66 ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %60
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %62
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %63, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %60
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %62
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %73, %78
  store double %79, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge101.us.us, label %66

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %80, align 8
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
  %storemerge11.us = phi i32 [ %19, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %5 = mul nuw nsw i32 %storemerge11.us, 1200
  %6 = sext i32 %storemerge11.us to i64
  %7 = zext i32 %5 to i64
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %9 = add i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %6, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %8

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %19 = add nsw i32 %storemerge11.us, 1
  %20 = icmp slt i32 %19, 1200
  br i1 %20, label %.._crit_edge_crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
