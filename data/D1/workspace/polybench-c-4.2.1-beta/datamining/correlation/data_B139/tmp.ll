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
.lr.ph131.split.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph131.split.us

.lr.ph131.split.us:                               ; preds = %._crit_edge127.us, %.lr.ph131.split.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.lr.ph131.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge127.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv13
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr197 = shl nsw i64 %indvars.iv13, 3
  %sunkaddr198 = add i64 %sunkaddr, %sunkaddr197
  %sunkaddr199 = inttoptr i64 %sunkaddr198 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph131.split.us
  %indvars.iv185 = phi i64 [ 0, %.lr.ph131.split.us ], [ %indvars.iv.next186.1.1, %._crit_edge ]
  %6 = phi double [ 0.000000e+00, %.lr.ph131.split.us ], [ %18, %._crit_edge ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv13
  %8 = load double, double* %7, align 8
  %9 = fadd double %8, %6
  store double %9, double* %sunkaddr199, align 8
  %indvars.iv.next186 = or i64 %indvars.iv185, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next186, i64 %indvars.iv13
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr199, align 8
  %indvars.iv.next186.1 = or i64 %indvars.iv185, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next186.1, i64 %indvars.iv13
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr199, align 8
  %indvars.iv.next186.122 = or i64 %indvars.iv185, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next186.122, i64 %indvars.iv13
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr199, align 8
  %indvars.iv.next186.1.1 = add nsw i64 %indvars.iv185, 4
  %exitcond187.1.1 = icmp eq i64 %indvars.iv.next186.1.1, 1400
  br i1 %exitcond187.1.1, label %._crit_edge127.us, label %._crit_edge

._crit_edge127.us:                                ; preds = %._crit_edge
  %19 = fdiv double %18, %0
  store double %19, double* %sunkaddr199, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond19, label %.lr.ph123.split.us.preheader, label %.lr.ph131.split.us

.lr.ph123.split.us.preheader:                     ; preds = %._crit_edge127.us
  %sunkaddr208 = ptrtoint double* %4 to i64
  br label %.lr.ph123.split.us

.lr.ph123.split.us:                               ; preds = %._crit_edge121.us, %.lr.ph123.split.us.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge121.us ], [ 0, %.lr.ph123.split.us.preheader ]
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv11
  store double 0.000000e+00, double* %20, align 8
  %sunkaddr205 = shl nsw i64 %indvars.iv11, 3
  %sunkaddr206 = add i64 %sunkaddr, %sunkaddr205
  %sunkaddr207 = inttoptr i64 %sunkaddr206 to double*
  %sunkaddr210 = add i64 %sunkaddr208, %sunkaddr205
  %sunkaddr211 = inttoptr i64 %sunkaddr210 to double*
  br label %._crit_edge218

._crit_edge218:                                   ; preds = %._crit_edge218, %.lr.ph123.split.us
  %indvars.iv179 = phi i64 [ 0, %.lr.ph123.split.us ], [ %indvars.iv.next180.1, %._crit_edge218 ]
  %21 = phi double [ 0.000000e+00, %.lr.ph123.split.us ], [ %33, %._crit_edge218 ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv11
  %23 = load double, double* %22, align 8
  %24 = load double, double* %sunkaddr207, align 8
  %25 = fsub double %23, %24
  %26 = fmul double %25, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr211, align 8
  %indvars.iv.next180 = or i64 %indvars.iv179, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next180, i64 %indvars.iv11
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr207, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr211, align 8
  %indvars.iv.next180.1 = add nuw nsw i64 %indvars.iv179, 2
  %exitcond181.1 = icmp eq i64 %indvars.iv.next180.1, 1400
  br i1 %exitcond181.1, label %._crit_edge121.us, label %._crit_edge218

._crit_edge121.us:                                ; preds = %._crit_edge218
  %34 = fdiv double %33, %0
  store double %34, double* %sunkaddr211, align 8
  %35 = tail call double @sqrt(double %34) #4
  %36 = fcmp ugt double %35, 1.000000e-01
  %37 = select i1 %36, double %35, double 1.000000e+00
  store double %37, double* %sunkaddr211, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond18, label %._crit_edge88.._crit_edge89_crit_edge.us.preheader, label %.lr.ph123.split.us

._crit_edge88.._crit_edge89_crit_edge.us.preheader: ; preds = %._crit_edge121.us
  br label %._crit_edge88.._crit_edge89_crit_edge.us

._crit_edge88.._crit_edge89_crit_edge.us:         ; preds = %._crit_edge89._crit_edge.us, %._crit_edge88.._crit_edge89_crit_edge.us.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge89._crit_edge.us ], [ 0, %._crit_edge88.._crit_edge89_crit_edge.us.preheader ]
  br label %._crit_edge89.us

._crit_edge89.us:                                 ; preds = %._crit_edge89.us, %._crit_edge88.._crit_edge89_crit_edge.us
  %indvars.iv175 = phi i64 [ 0, %._crit_edge88.._crit_edge89_crit_edge.us ], [ %indvars.iv.next176, %._crit_edge89.us ]
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv175
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv175
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %39
  store double %42, double* %40, align 8
  %43 = tail call double @sqrt(double %0) #4
  %44 = getelementptr inbounds double, double* %4, i64 %indvars.iv175
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %40, align 8
  %48 = fdiv double %47, %46
  store double %48, double* %40, align 8
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next176, 1200
  br i1 %exitcond177, label %._crit_edge89._crit_edge.us, label %._crit_edge89.us

._crit_edge89._crit_edge.us:                      ; preds = %._crit_edge89.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond17, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge88.._crit_edge89_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge89._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge90.us..lr.ph.us.us.preheader_crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge90.us..lr.ph.us.us.preheader_crit_edge ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv3 = phi i32 [ %indvars.iv.next4, %._crit_edge90.us..lr.ph.us.us.preheader_crit_edge ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %49 = sext i32 %indvars.iv3 to i64
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv7
  store double 1.000000e+00, double* %50, align 8
  br label %.lr.ph.us.us

._crit_edge90.us:                                 ; preds = %._crit_edge97.us.us
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1199
  br i1 %exitcond, label %._crit_edge90._crit_edge, label %._crit_edge90.us..lr.ph.us.us.preheader_crit_edge

._crit_edge90.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge90.us
  %indvars.iv.next4 = add nuw i32 %indvars.iv3, 1
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge97.us.us, %.lr.ph.us.us.preheader
  %indvars.iv5 = phi i64 [ %49, %.lr.ph.us.us.preheader ], [ %indvars.iv.next6, %._crit_edge97.us.us ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv5
  store double 0.000000e+00, double* %51, align 8
  br label %._crit_edge219

._crit_edge97.us.us:                              ; preds = %._crit_edge219
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv7
  store double %66, double* %52, align 8
  %indvars.iv.next6 = add nsw i64 %indvars.iv5, 1
  %53 = icmp slt i64 %indvars.iv.next6, 1200
  br i1 %53, label %.lr.ph.us.us, label %._crit_edge90.us

._crit_edge219:                                   ; preds = %._crit_edge219, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge219 ]
  %54 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %66, %._crit_edge219 ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv7
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv5
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %54, %59
  store double %60, double* %51, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv7
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv5
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge97.us.us, label %._crit_edge219

._crit_edge90._crit_edge:                         ; preds = %._crit_edge90.us
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %67, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge9_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge9_crit_edge.us

.._crit_edge9_crit_edge.us:                       ; preds = %._crit_edge9._crit_edge.us, %.._crit_edge9_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.._crit_edge9_crit_edge.us.preheader ], [ %indvars.iv.next2, %._crit_edge9._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.._crit_edge9_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge9_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %6 = add i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge9._crit_edge.us, label %._crit_edge.us._crit_edge

._crit_edge9._crit_edge.us:                       ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge12, label %.._crit_edge9_crit_edge.us

._crit_edge12:                                    ; preds = %._crit_edge9._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
