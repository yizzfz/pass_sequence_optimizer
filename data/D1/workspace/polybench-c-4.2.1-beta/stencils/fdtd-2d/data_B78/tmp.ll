; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) #2 {
.lr.ph7.preheader:
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7..lr.ph7_crit_edge, %.lr.ph7.preheader
  %indvars.iv16 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next17, %.lr.ph7..lr.ph7_crit_edge ]
  %4 = trunc i64 %indvars.iv16 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  store double %5, double* %6, align 8
  %exitcond = icmp eq i64 %indvars.iv16, 499
  br i1 %exitcond, label %.lr.ph2.split.us.preheader, label %.lr.ph7..lr.ph7_crit_edge

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph7
  br label %.lr.ph2.split.us

.lr.ph7..lr.ph7_crit_edge:                        ; preds = %.lr.ph7
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  br label %.lr.ph7

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %7 = trunc i64 %indvars.iv11 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge21 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv
  %14 = add nuw nsw i64 %indvars.iv, 2
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fmul <2 x double> %10, %18
  %20 = fdiv <2 x double> %19, <double 1.000000e+03, double 1.200000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv, 3
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = fmul double %8, %26
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %28, double* %29, align 8
  %exitcond22 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond22, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge21
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond14, label %._crit_edge20, label %.lr.ph2.split.us

._crit_edge20:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.lr.ph64:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge59, %.lr.ph64
  %indvars.iv105 = phi i64 [ 0, %.lr.ph64 ], [ %indvars.iv.next106, %._crit_edge59 ]
  %sunkaddr121 = shl i64 %indvars.iv105, 3
  %sunkaddr122 = add i64 %sunkaddr, %sunkaddr121
  %sunkaddr123 = inttoptr i64 %sunkaddr122 to i64*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %4 = load i64, i64* %sunkaddr123, align 8
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %6 = bitcast double* %5 to i64*
  store i64 %4, i64* %6, align 8
  %exitcond114 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond114, label %.lr.ph28.split.us.preheader, label %.lr.ph..lr.ph_crit_edge

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph
  br label %.lr.ph28.split.us

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.lr.ph

.lr.ph28.split.us:                                ; preds = %.lr.ph28.split.us.preheader, %._crit_edge22.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge22.us ], [ 1, %.lr.ph28.split.us.preheader ]
  %7 = add nsw i64 %indvars.iv83, -1
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.lr.ph28.split.us
  %indvars.iv79 = phi i64 [ 0, %.lr.ph28.split.us ], [ %indvars.iv.next80, %._crit_edge ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv79
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv83, i64 %indvars.iv79
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %7, i64 %indvars.iv79
  %14 = load double, double* %13, align 8
  %15 = fsub double %12, %14
  %16 = fmul double %15, 5.000000e-01
  %17 = fsub double %10, %16
  store double %17, double* %9, align 8
  %exitcond = icmp eq i64 %indvars.iv79, 1199
  br i1 %exitcond, label %._crit_edge22.us, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  br label %8

._crit_edge22.us:                                 ; preds = %8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 1000
  br i1 %exitcond86, label %.lr.ph45.split.us.preheader, label %.lr.ph28.split.us

.lr.ph45.split.us.preheader:                      ; preds = %._crit_edge22.us
  br label %.lr.ph45.split.us

.lr.ph45.split.us:                                ; preds = %.lr.ph45.split.us.preheader, %._crit_edge40.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge40.us ], [ 0, %.lr.ph45.split.us.preheader ]
  br label %18

; <label>:18:                                     ; preds = %._crit_edge124, %.lr.ph45.split.us
  %indvars.iv88 = phi i64 [ 1, %.lr.ph45.split.us ], [ %indvars.iv.next89, %._crit_edge124 ]
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv88
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv88
  %22 = load double, double* %21, align 8
  %23 = add nsw i64 %indvars.iv88, -1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %23
  %25 = load double, double* %24, align 8
  %26 = fsub double %22, %25
  %27 = fmul double %26, 5.000000e-01
  %28 = fsub double %20, %27
  store double %28, double* %19, align 8
  %exitcond115 = icmp eq i64 %indvars.iv88, 1199
  br i1 %exitcond115, label %._crit_edge40.us, label %._crit_edge124

._crit_edge124:                                   ; preds = %18
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  br label %18

._crit_edge40.us:                                 ; preds = %18
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, 1000
  br i1 %exitcond95, label %.lr.ph58.split.us.preheader, label %.lr.ph45.split.us

.lr.ph58.split.us.preheader:                      ; preds = %._crit_edge40.us
  br label %.lr.ph58.split.us

.lr.ph58.split.us:                                ; preds = %.lr.ph58.split.us.preheader, %._crit_edge55.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge55.us ], [ 0, %.lr.ph58.split.us.preheader ]
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113, %.lr.ph58.split.us
  %indvars.iv97 = phi i64 [ 0, %.lr.ph58.split.us ], [ %indvars.iv.next98, %._crit_edge113 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv101, i64 %indvars.iv97
  %30 = load double, double* %29, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv97
  %34 = load double, double* %33, align 8
  %35 = fsub double %32, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next102, i64 %indvars.iv97
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv97
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 7.000000e-01
  %43 = fsub double %30, %42
  store double %43, double* %29, align 8
  %exitcond116 = icmp eq i64 %indvars.iv97, 1198
  br i1 %exitcond116, label %._crit_edge55.us, label %._crit_edge113

._crit_edge55.us:                                 ; preds = %._crit_edge113
  %exitcond104 = icmp eq i64 %indvars.iv.next102, 999
  br i1 %exitcond104, label %._crit_edge59, label %.lr.ph58.split.us

._crit_edge59:                                    ; preds = %._crit_edge55.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 500
  br i1 %exitcond108, label %._crit_edge109, label %.lr.ph.preheader

._crit_edge109:                                   ; preds = %._crit_edge59
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.lr.ph20.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge17.us, %.lr.ph20.split.us.preheader
  %indvars.iv51 = phi i64 [ 0, %.lr.ph20.split.us.preheader ], [ %indvars.iv.next52, %._crit_edge17.us ]
  %7 = mul nuw nsw i64 %indvars.iv51, 1000
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge56, %.lr.ph20.split.us
  %indvars.iv47 = phi i64 [ 0, %.lr.ph20.split.us ], [ %indvars.iv.next48, %._crit_edge56 ]
  %8 = add nuw nsw i64 %indvars.iv47, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge56

; <label>:12:                                     ; preds = %._crit_edge57
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc29 = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge57, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv47
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond50, label %._crit_edge17.us, label %._crit_edge57

._crit_edge17.us:                                 ; preds = %._crit_edge56
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, 1000
  br i1 %exitcond54, label %.lr.ph11.split.us.preheader, label %.lr.ph20.split.us

.lr.ph11.split.us.preheader:                      ; preds = %._crit_edge17.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge8.us, %.lr.ph11.split.us.preheader
  %indvars.iv42 = phi i64 [ 0, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next43, %._crit_edge8.us ]
  %24 = mul nuw nsw i64 %indvars.iv42, 1000
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %._crit_edge59, %.lr.ph11.split.us
  %indvars.iv38 = phi i64 [ 0, %.lr.ph11.split.us ], [ %indvars.iv.next39, %._crit_edge59 ]
  %25 = add nuw nsw i64 %indvars.iv38, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge59

; <label>:29:                                     ; preds = %._crit_edge60
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc26 = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge60, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv38
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 1200
  br i1 %exitcond41, label %._crit_edge8.us, label %._crit_edge60

._crit_edge8.us:                                  ; preds = %._crit_edge59
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 1000
  br i1 %exitcond45, label %.lr.ph2.split.us.preheader, label %.lr.ph11.split.us

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge8.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next34, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv33, 1000
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge62, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge62 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge62

; <label>:44:                                     ; preds = %._crit_edge63
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge63, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge63

._crit_edge.us:                                   ; preds = %._crit_edge62
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond36, label %._crit_edge61, label %.lr.ph2.split.us

._crit_edge61:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
