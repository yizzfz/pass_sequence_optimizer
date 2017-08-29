; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call fastcc void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array([1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
.lr.ph86:
  br label %.lr.ph86.split.us

.lr.ph86.split.us:                                ; preds = %._crit_edge82.us, %.lr.ph86
  %indvars.iv119 = phi i64 [ 0, %.lr.ph86 ], [ %indvars.iv.next120, %._crit_edge82.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph86.split.us
  %indvars.iv115 = phi i64 [ 0, %.lr.ph86.split.us ], [ %indvars.iv.next116, %._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv115, %indvars.iv119
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 800
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 4.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv115
  store double %9, double* %10, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, 1000
  br i1 %exitcond118, label %._crit_edge82.us, label %._crit_edge

._crit_edge82.us:                                 ; preds = %._crit_edge
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next120, 800
  br i1 %exitcond122, label %.lr.ph77.split.us.preheader, label %.lr.ph86.split.us

.lr.ph77.split.us.preheader:                      ; preds = %._crit_edge82.us
  br label %.lr.ph77.split.us

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %._crit_edge73.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge73.us ], [ 0, %.lr.ph77.split.us.preheader ]
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %._crit_edge127, %.lr.ph77.split.us
  %indvars.iv106 = phi i64 [ 0, %.lr.ph77.split.us ], [ %indvars.iv.next107, %._crit_edge127 ]
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %11 = mul nuw nsw i64 %indvars.iv.next107, %indvars.iv110
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 900
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 4.500000e+03
  %17 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv106
  store double %16, double* %17, align 8
  %exitcond109 = icmp eq i64 %indvars.iv.next107, 900
  br i1 %exitcond109, label %._crit_edge73.us, label %._crit_edge127

._crit_edge73.us:                                 ; preds = %._crit_edge127
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, 1000
  br i1 %exitcond113, label %.lr.ph68.split.us.preheader, label %.lr.ph77.split.us

.lr.ph68.split.us.preheader:                      ; preds = %._crit_edge73.us
  br label %.lr.ph68.split.us

.lr.ph68.split.us:                                ; preds = %.lr.ph68.split.us.preheader, %._crit_edge64.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge64.us ], [ 0, %.lr.ph68.split.us.preheader ]
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128, %.lr.ph68.split.us
  %indvars.iv97 = phi i64 [ 0, %.lr.ph68.split.us ], [ %indvars.iv.next98, %._crit_edge128 ]
  %18 = add nuw nsw i64 %indvars.iv97, 3
  %19 = mul nuw nsw i64 %18, %indvars.iv101
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 5.500000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv101, i64 %indvars.iv97
  store double %23, double* %24, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 1200
  br i1 %exitcond100, label %._crit_edge64.us, label %._crit_edge128

._crit_edge64.us:                                 ; preds = %._crit_edge128
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, 900
  br i1 %exitcond104, label %.lr.ph59.split.us.preheader, label %.lr.ph68.split.us

.lr.ph59.split.us.preheader:                      ; preds = %._crit_edge64.us
  br label %.lr.ph59.split.us

.lr.ph59.split.us:                                ; preds = %.lr.ph59.split.us.preheader, %._crit_edge.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge.us ], [ 0, %.lr.ph59.split.us.preheader ]
  br label %._crit_edge129

._crit_edge129:                                   ; preds = %._crit_edge129, %.lr.ph59.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph59.split.us ], [ %indvars.iv.next, %._crit_edge129 ]
  %25 = add nuw nsw i64 %indvars.iv, 2
  %26 = mul nuw nsw i64 %25, %indvars.iv92
  %27 = add nuw nsw i64 %26, 2
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.000000e+03
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv92, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge129

._crit_edge.us:                                   ; preds = %._crit_edge129
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, 1200
  br i1 %exitcond95, label %._crit_edge60, label %.lr.ph59.split.us

._crit_edge60:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
.lr.ph111:
  br label %.lr.ph111.split.us

.lr.ph111.split.us:                               ; preds = %._crit_edge108.us, %.lr.ph111
  %indvars.iv183 = phi i64 [ 0, %.lr.ph111 ], [ %indvars.iv.next184, %._crit_edge108.us ]
  br label %.lr.ph103.us.us

._crit_edge108.us:                                ; preds = %._crit_edge104.us.us
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next184, 800
  br i1 %exitcond186, label %.lr.ph93.split.us.preheader, label %.lr.ph111.split.us

.lr.ph93.split.us.preheader:                      ; preds = %._crit_edge108.us
  br label %.lr.ph93.split.us

.lr.ph103.us.us:                                  ; preds = %._crit_edge104.us.us, %.lr.ph111.split.us
  %indvars.iv177 = phi i64 [ 0, %.lr.ph111.split.us ], [ %indvars.iv.next178, %._crit_edge104.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv177
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph103.us.us.new

._crit_edge104.us.us:                             ; preds = %.lr.ph103.us.us.new
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, 900
  br i1 %exitcond180, label %._crit_edge108.us, label %.lr.ph103.us.us

.lr.ph103.us.us.new:                              ; preds = %.lr.ph103.us.us.new, %.lr.ph103.us.us
  %indvars.iv168 = phi i64 [ 0, %.lr.ph103.us.us ], [ %indvars.iv.next169.1, %.lr.ph103.us.us.new ]
  %8 = phi double [ 0.000000e+00, %.lr.ph103.us.us ], [ %20, %.lr.ph103.us.us.new ]
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv183, i64 %indvars.iv168
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv168, i64 %indvars.iv177
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %8, %13
  store double %14, double* %7, align 8
  %indvars.iv.next169 = or i64 %indvars.iv168, 1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv183, i64 %indvars.iv.next169
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next169, i64 %indvars.iv177
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  store double %20, double* %7, align 8
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  %exitcond171.1 = icmp eq i64 %indvars.iv.next169.1, 1000
  br i1 %exitcond171.1, label %._crit_edge104.us.us, label %.lr.ph103.us.us.new

.lr.ph93.split.us:                                ; preds = %.lr.ph93.split.us.preheader, %._crit_edge90.us
  %indvars.iv157 = phi i64 [ %indvars.iv.next158, %._crit_edge90.us ], [ 0, %.lr.ph93.split.us.preheader ]
  br label %.lr.ph85.us.us

._crit_edge90.us:                                 ; preds = %._crit_edge86.us.us
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next158, 900
  br i1 %exitcond160, label %.lr.ph75.split.us.preheader, label %.lr.ph93.split.us

.lr.ph75.split.us.preheader:                      ; preds = %._crit_edge90.us
  br label %.lr.ph75.split.us

.lr.ph85.us.us:                                   ; preds = %._crit_edge86.us.us, %.lr.ph93.split.us
  %indvars.iv151 = phi i64 [ 0, %.lr.ph93.split.us ], [ %indvars.iv.next152, %._crit_edge86.us.us ]
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv157, i64 %indvars.iv151
  store double 0.000000e+00, double* %21, align 8
  br label %.lr.ph85.us.us.new

._crit_edge86.us.us:                              ; preds = %.lr.ph85.us.us.new
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next152, 1100
  br i1 %exitcond154, label %._crit_edge90.us, label %.lr.ph85.us.us

.lr.ph85.us.us.new:                               ; preds = %.lr.ph85.us.us.new, %.lr.ph85.us.us
  %indvars.iv142 = phi i64 [ 0, %.lr.ph85.us.us ], [ %indvars.iv.next143.1, %.lr.ph85.us.us.new ]
  %22 = phi double [ 0.000000e+00, %.lr.ph85.us.us ], [ %34, %.lr.ph85.us.us.new ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv157, i64 %indvars.iv142
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv142, i64 %indvars.iv151
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %21, align 8
  %indvars.iv.next143 = or i64 %indvars.iv142, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv157, i64 %indvars.iv.next143
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next143, i64 %indvars.iv151
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %21, align 8
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  %exitcond145.1 = icmp eq i64 %indvars.iv.next143.1, 1200
  br i1 %exitcond145.1, label %._crit_edge86.us.us, label %.lr.ph85.us.us.new

.lr.ph75.split.us:                                ; preds = %.lr.ph75.split.us.preheader, %._crit_edge72.us
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge72.us ], [ 0, %.lr.ph75.split.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge72.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next132, 800
  br i1 %exitcond134, label %._crit_edge76, label %.lr.ph75.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph75.split.us
  %indvars.iv126 = phi i64 [ 0, %.lr.ph75.split.us ], [ %indvars.iv.next127, %._crit_edge.us.us ]
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv131, i64 %indvars.iv126
  store double 0.000000e+00, double* %35, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond = icmp eq i64 %indvars.iv.next127, 1100
  br i1 %exitcond, label %._crit_edge72.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %36 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %48, %.lr.ph.us.us.new ]
  %37 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv126
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %35, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %43 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv126
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %35, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge76:                                    ; preds = %._crit_edge72.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph17.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph17.split.us

.lr.ph17.split.us:                                ; preds = %._crit_edge14.us, %.lr.ph17.split.us.preheader
  %indvars.iv20 = phi i64 [ 0, %.lr.ph17.split.us.preheader ], [ %indvars.iv.next21, %._crit_edge14.us ]
  %5 = mul nsw i64 %indvars.iv20, 800
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.lr.ph17.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph17.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge14.us, label %._crit_edge.us._crit_edge

._crit_edge14.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 800
  br i1 %exitcond23, label %._crit_edge18, label %.lr.ph17.split.us

._crit_edge18:                                    ; preds = %._crit_edge14.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
