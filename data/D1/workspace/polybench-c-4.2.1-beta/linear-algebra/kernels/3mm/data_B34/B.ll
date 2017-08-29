; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #3
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1100 x double]*
  tail call void @print_array([1100 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* %7) #3
  tail call void @free(i8* %8) #3
  tail call void @free(i8* %9) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) #0 {
.preheader6.lr.ph:
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge13.us, %.preheader6.lr.ph
  %indvars.iv42 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next43, %._crit_edge13.us ]
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader6.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %4 ], [ 0, %.preheader6.us ]
  %5 = mul nuw nsw i64 %indvars.iv38, %indvars.iv42
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 800
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 4.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv38
  store double %10, double* %11, align 8
  %exitcond41 = icmp eq i64 %indvars.iv38, 999
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  br i1 %exitcond41, label %._crit_edge13.us, label %4

._crit_edge13.us:                                 ; preds = %4
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next43, 800
  br i1 %exitcond4, label %.preheader4.us.preheader, label %.preheader6.us

.preheader4.us.preheader:                         ; preds = %._crit_edge13.us
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.preheader4.us
  %indvars.iv31 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next32, %._crit_edge18 ]
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %12 = mul nuw nsw i64 %indvars.iv.next32, %indvars.iv35
  %13 = add nuw nsw i64 %12, 2
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 4.500000e+03
  %18 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv35, i64 %indvars.iv31
  store double %17, double* %18, align 8
  %exitcond34 = icmp eq i64 %indvars.iv31, 899
  br i1 %exitcond34, label %._crit_edge11.us, label %._crit_edge18

._crit_edge11.us:                                 ; preds = %._crit_edge18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next36, 1000
  br i1 %exitcond3, label %.preheader2.us.preheader, label %.preheader4.us

.preheader2.us.preheader:                         ; preds = %._crit_edge11.us
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge9.us, %.preheader2.us.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge9.us ], [ 0, %.preheader2.us.preheader ]
  br label %19

; <label>:19:                                     ; preds = %19, %.preheader2.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %19 ], [ 0, %.preheader2.us ]
  %20 = add nuw nsw i64 %indvars.iv24, 3
  %21 = mul nuw nsw i64 %20, %indvars.iv28
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1100
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 5.500000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv24
  store double %25, double* %26, align 8
  %exitcond27 = icmp eq i64 %indvars.iv24, 1199
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  br i1 %exitcond27, label %._crit_edge9.us, label %19

._crit_edge9.us:                                  ; preds = %19
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next29, 900
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %27

; <label>:27:                                     ; preds = %27, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %27 ], [ 0, %.preheader.us ]
  %28 = add nuw nsw i64 %indvars.iv, 2
  %29 = mul nuw nsw i64 %28, %indvars.iv21
  %30 = add nuw nsw i64 %29, 2
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 1000
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 5.000000e+03
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv21, i64 %indvars.iv
  store double %34, double* %35, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us, label %27

._crit_edge.us:                                   ; preds = %27
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond1, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_3mm([900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) #0 {
.preheader9.lr.ph:
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge30.us, %.preheader9.lr.ph
  %indvars.iv75 = phi i64 [ 0, %.preheader9.lr.ph ], [ %indvars.iv.next76, %._crit_edge30.us ]
  br label %.lr.ph27.us.us

._crit_edge30.us:                                 ; preds = %._crit_edge28.us.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next76, 800
  br i1 %exitcond5, label %.preheader7.us.preheader, label %.preheader9.us

.preheader7.us.preheader:                         ; preds = %._crit_edge30.us
  br label %.preheader7.us

.lr.ph27.us.us:                                   ; preds = %._crit_edge28.us.us, %.preheader9.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge28.us.us ], [ 0, %.preheader9.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv75, i64 %indvars.iv73
  store double 0.000000e+00, double* %7, align 8
  br label %8

._crit_edge28.us.us:                              ; preds = %8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next74, 900
  br i1 %exitcond4, label %._crit_edge30.us, label %.lr.ph27.us.us

; <label>:8:                                      ; preds = %8, %.lr.ph27.us.us
  %indvars.iv69 = phi i64 [ 0, %.lr.ph27.us.us ], [ %indvars.iv.next70.1, %8 ]
  %9 = phi double [ 0.000000e+00, %.lr.ph27.us.us ], [ %21, %8 ]
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv75, i64 %indvars.iv69
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv69, i64 %indvars.iv73
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %9, %14
  store double %15, double* %7, align 8
  %indvars.iv.next70 = or i64 %indvars.iv69, 1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv75, i64 %indvars.iv.next70
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next70, i64 %indvars.iv73
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %7, align 8
  %exitcond72.1 = icmp eq i64 %indvars.iv.next70, 999
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  br i1 %exitcond72.1, label %._crit_edge28.us.us, label %8

.preheader7.us:                                   ; preds = %._crit_edge21.us, %.preheader7.us.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge21.us ], [ 0, %.preheader7.us.preheader ]
  br label %.lr.ph18.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge19.us.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next63, 900
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge21.us
  br label %.preheader.us

.lr.ph18.us.us:                                   ; preds = %._crit_edge19.us.us, %.preheader7.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge19.us.us ], [ 0, %.preheader7.us ]
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv60
  store double 0.000000e+00, double* %22, align 8
  br label %23

._crit_edge19.us.us:                              ; preds = %23
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next61, 1100
  br i1 %exitcond2, label %._crit_edge21.us, label %.lr.ph18.us.us

; <label>:23:                                     ; preds = %23, %.lr.ph18.us.us
  %indvars.iv56 = phi i64 [ 0, %.lr.ph18.us.us ], [ %indvars.iv.next57.2, %23 ]
  %24 = phi double [ 0.000000e+00, %.lr.ph18.us.us ], [ %42, %23 ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv56
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv60
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %22, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next57
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next57, i64 %indvars.iv60
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %22, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next57.1
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next57.1, i64 %indvars.iv60
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %22, align 8
  %exitcond59.2 = icmp eq i64 %indvars.iv.next57.1, 1199
  %indvars.iv.next57.2 = add nsw i64 %indvars.iv56, 3
  br i1 %exitcond59.2, label %._crit_edge19.us.us, label %23

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge11.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next50, 800
  br i1 %exitcond1, label %._crit_edge12, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv47
  store double 0.000000e+00, double* %43, align 8
  br label %44

._crit_edge.us.us:                                ; preds = %44
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, 1100
  br i1 %exitcond, label %._crit_edge11.us, label %.lr.ph.us.us

; <label>:44:                                     ; preds = %44, %.lr.ph.us.us
  %indvars.iv43 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next44.2, %44 ]
  %45 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %63, %44 ]
  %46 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv43
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv47
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %45, %50
  store double %51, double* %43, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %52 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv.next44
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next44, i64 %indvars.iv47
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %43, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %58 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv.next44.1
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next44.1, i64 %indvars.iv47
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %43, align 8
  %exitcond46.2 = icmp eq i64 %indvars.iv.next44.1, 899
  %indvars.iv.next44.2 = add nsw i64 %indvars.iv43, 3
  br i1 %exitcond46.2, label %._crit_edge.us.us, label %44

._crit_edge12:                                    ; preds = %._crit_edge11.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv4, 800
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
