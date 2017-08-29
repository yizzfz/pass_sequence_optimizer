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
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %21
  %3 = phi i32 [ 0, %2 ], [ %22, %21 ]
  %4 = sitofp i32 %3 to double
  %5 = sext i32 %3 to i64
  %6 = insertelement <2 x double> undef, double %4, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %8

; <label>:8:                                      ; preds = %8, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %8 ]
  %9 = mul nuw nsw i64 %indvars.iv, %5
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv.next, %5
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %11, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.200000e+03, double 1.200000e+03>
  %19 = fadd <2 x double> %7, %18
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %21, label %8

; <label>:21:                                     ; preds = %8
  %22 = add nsw i32 %3, 1
  %23 = icmp slt i32 %22, 1400
  br i1 %23, label %._crit_edge, label %24

; <label>:24:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double* nocapture, double*) unnamed_addr #0 {
.lr.ph47:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %.lr.ph47, %._crit_edge43.us
  %storemerge45.us = phi i32 [ %25, %._crit_edge43.us ], [ 0, %.lr.ph47 ]
  %9 = sext i32 %storemerge45.us to i64
  %10 = getelementptr inbounds double, double* %3, i64 %9
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr147 = shl nsw i64 %9, 3
  %sunkaddr148 = add i64 %sunkaddr, %sunkaddr147
  %sunkaddr149 = inttoptr i64 %sunkaddr148 to double*
  %sunkaddr147.1 = shl nsw i64 %9, 3
  %sunkaddr148.1 = add i64 %sunkaddr.1, %sunkaddr147.1
  %sunkaddr149.1 = inttoptr i64 %sunkaddr148.1 to double*
  br label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.lr.ph47.split.us.new, %.lr.ph47.split.us
  %indvars.iv120 = phi i64 [ 0, %.lr.ph47.split.us ], [ %indvars.iv.next121.1.1, %.lr.ph47.split.us.new ]
  %11 = phi double [ 0.000000e+00, %.lr.ph47.split.us ], [ %23, %.lr.ph47.split.us.new ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv120, i64 %9
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  store double %14, double* %sunkaddr149, align 8
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next121, i64 %9
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  store double %17, double* %sunkaddr149, align 8
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next121.1, i64 %9
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  store double %20, double* %sunkaddr149.1, align 8
  %indvars.iv.next121.113 = or i64 %indvars.iv120, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next121.113, i64 %9
  %22 = load double, double* %21, align 8
  %23 = fadd double %20, %22
  store double %23, double* %sunkaddr149.1, align 8
  %indvars.iv.next121.1.1 = add nsw i64 %indvars.iv120, 4
  %exitcond123.1.1 = icmp eq i64 %indvars.iv.next121.1.1, 1400
  br i1 %exitcond123.1.1, label %._crit_edge43.us, label %.lr.ph47.split.us.new

._crit_edge43.us:                                 ; preds = %.lr.ph47.split.us.new
  %24 = fdiv double %23, %0
  store double %24, double* %sunkaddr149.1, align 8
  %25 = add nsw i32 %storemerge45.us, 1
  %26 = icmp slt i32 %25, 1200
  br i1 %26, label %.lr.ph47.split.us, label %.lr.ph40.split.us.preheader

.lr.ph40.split.us.preheader:                      ; preds = %._crit_edge43.us
  %sunkaddr158 = ptrtoint double* %4 to i64
  br label %.lr.ph40.split.us

.lr.ph40.split.us:                                ; preds = %.lr.ph40.split.us.preheader, %._crit_edge38.us
  %27 = phi i32 [ %46, %._crit_edge38.us ], [ 0, %.lr.ph40.split.us.preheader ]
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double* %4, i64 %28
  store double 0.000000e+00, double* %29, align 8
  %sunkaddr155 = shl nsw i64 %28, 3
  %sunkaddr156 = add i64 %sunkaddr.1, %sunkaddr155
  %sunkaddr157 = inttoptr i64 %sunkaddr156 to double*
  %sunkaddr160 = add i64 %sunkaddr158, %sunkaddr155
  %sunkaddr161 = inttoptr i64 %sunkaddr160 to double*
  br label %.lr.ph40.split.us.new

.lr.ph40.split.us.new:                            ; preds = %.lr.ph40.split.us, %.lr.ph40.split.us.new
  %indvars.iv105 = phi i64 [ %indvars.iv.next106.1, %.lr.ph40.split.us.new ], [ 0, %.lr.ph40.split.us ]
  %30 = phi double [ %42, %.lr.ph40.split.us.new ], [ 0.000000e+00, %.lr.ph40.split.us ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv105, i64 %28
  %32 = load double, double* %31, align 8
  %33 = load double, double* %sunkaddr157, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %30, %35
  store double %36, double* %sunkaddr161, align 8
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next106, i64 %28
  %38 = load double, double* %37, align 8
  %39 = load double, double* %sunkaddr157, align 8
  %40 = fsub double %38, %39
  %41 = fmul double %40, %40
  %42 = fadd double %36, %41
  store double %42, double* %sunkaddr161, align 8
  %indvars.iv.next106.1 = add nsw i64 %indvars.iv105, 2
  %exitcond108.1 = icmp eq i64 %indvars.iv.next106.1, 1400
  br i1 %exitcond108.1, label %._crit_edge38.us, label %.lr.ph40.split.us.new

._crit_edge38.us:                                 ; preds = %.lr.ph40.split.us.new
  %43 = fdiv double %42, %0
  store double %43, double* %sunkaddr161, align 8
  %44 = tail call double @sqrt(double %43) #4
  %45 = fcmp ole double %44, 1.000000e-01
  %..us = select i1 %45, double 1.000000e+00, double %44
  store double %..us, double* %sunkaddr161, align 8
  %46 = add nsw i32 %27, 1
  %47 = icmp slt i32 %46, 1200
  br i1 %47, label %.lr.ph40.split.us, label %._crit_edge5.us.preheader

._crit_edge5.us.preheader:                        ; preds = %._crit_edge38.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.preheader, %._crit_edge34.us
  %48 = phi i32 [ %68, %._crit_edge34.us ], [ 0, %._crit_edge5.us.preheader ]
  %49 = phi [1200 x double]* [ %64, %._crit_edge34.us ], [ %1, %._crit_edge5.us.preheader ]
  %50 = sext i32 %48 to i64
  br label %51

; <label>:51:                                     ; preds = %51, %._crit_edge5.us
  %indvars.iv100 = phi i64 [ 0, %._crit_edge5.us ], [ %indvars.iv.next101, %51 ]
  %52 = phi [1200 x double]* [ %49, %._crit_edge5.us ], [ %64, %51 ]
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv100
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %50, i64 %indvars.iv100
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %58 = load double, double* %5, align 8
  %59 = tail call double @sqrt(double %58) #4
  %60 = load double*, double** %8, align 8
  %61 = getelementptr inbounds double, double* %60, i64 %indvars.iv100
  %62 = load double, double* %61, align 8
  %63 = fmul double %59, %62
  %64 = load [1200 x double]*, [1200 x double]** %6, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %50, i64 %indvars.iv100
  %66 = load double, double* %65, align 8
  %67 = fdiv double %66, %63
  store double %67, double* %65, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next101, 1200
  br i1 %exitcond103, label %._crit_edge34.us, label %51

._crit_edge34.us:                                 ; preds = %51
  %68 = add nsw i32 %48, 1
  %69 = icmp slt i32 %68, 1400
  br i1 %69, label %._crit_edge5.us, label %.lr.ph23.split.us.preheader

.lr.ph23.split.us.preheader:                      ; preds = %._crit_edge34.us
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %._crit_edge7.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge7.us ], [ 0, %.lr.ph23.split.us.preheader ]
  %70 = phi [1200 x double]* [ %.lcssa.us, %._crit_edge7.us ], [ %2, %.lr.ph23.split.us.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv85, i64 %indvars.iv85
  store double 1.000000e+00, double* %71, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %72 = icmp slt i64 %indvars.iv.next86, 1200
  br i1 %72, label %.lr.ph.us.us.preheader, label %._crit_edge7.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph23.split.us
  %73 = trunc i64 %indvars.iv.next86 to i32
  br label %.lr.ph.us.us

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge19.us.us
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %.lr.ph23.split.us
  %.lcssa.us = phi [1200 x double]* [ %70, %.lr.ph23.split.us ], [ %78, %._crit_edge7.us.loopexit ]
  %exitcond = icmp eq i64 %indvars.iv.next86, 1199
  br i1 %exitcond, label %._crit_edge24, label %.lr.ph23.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge19.us.us
  %74 = phi [1200 x double]* [ %78, %._crit_edge19.us.us ], [ %70, %.lr.ph.us.us.preheader ]
  %storemerge220.us.us = phi i32 [ %81, %._crit_edge19.us.us ], [ %73, %.lr.ph.us.us.preheader ]
  %75 = sext i32 %storemerge220.us.us to i64
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 %indvars.iv85, i64 %75
  store double 0.000000e+00, double* %76, align 8
  %77 = load [1200 x double]*, [1200 x double]** %6, align 8
  %78 = load [1200 x double]*, [1200 x double]** %7, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %78, i64 %indvars.iv85, i64 %75
  %.pre = load double, double* %79, align 8
  br label %.lr.ph.us.us.new

._crit_edge19.us.us:                              ; preds = %.lr.ph.us.us.new
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %78, i64 %75, i64 %indvars.iv85
  store double %95, double* %80, align 8
  %81 = add nsw i32 %storemerge220.us.us, 1
  %82 = icmp slt i32 %81, 1200
  br i1 %82, label %.lr.ph.us.us, label %._crit_edge7.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %83 = phi double [ %95, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv, i64 %indvars.iv85
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv, i64 %75
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %88, %83
  store double %89, double* %79, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv.next, i64 %indvars.iv85
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv.next, i64 %75
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fadd double %94, %89
  store double %95, double* %79, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge19.us.us, label %.lr.ph.us.us.new

._crit_edge24:                                    ; preds = %._crit_edge7.us
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %.lcssa.us, i64 1199, i64 1199
  store double 1.000000e+00, double* %96, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge1.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %._crit_edge1.us.preheader, %._crit_edge2.us
  %5 = phi i32 [ %20, %._crit_edge2.us ], [ 0, %._crit_edge1.us.preheader ]
  %6 = mul nsw i32 %5, 1200
  %7 = sext i32 %5 to i64
  %8 = zext i32 %6 to i64
  br label %9

; <label>:9:                                      ; preds = %._crit_edge.us, %._crit_edge1.us
  %indvars.iv = phi i64 [ 0, %._crit_edge1.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %7, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge2.us, label %9

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %20 = add nsw i32 %5, 1
  %21 = icmp slt i32 %20, 1200
  br i1 %21, label %._crit_edge1.us, label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
