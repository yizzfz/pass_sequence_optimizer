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
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
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
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge13.us, %.preheader6.lr.ph
  %indvars.iv45 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next46, %._crit_edge13.us ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader6.us
  %indvars.iv41 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next42, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %indvars.iv41
  store double %15, double* %16, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond55, label %._crit_edge13.us, label %9

._crit_edge13.us:                                 ; preds = %9
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next46, 800
  br i1 %exitcond56, label %.preheader4.us.preheader, label %.preheader6.us

.preheader4.us.preheader:                         ; preds = %._crit_edge13.us
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader4.us
  %indvars.iv32 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next33, %17 ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %18 = mul nuw nsw i64 %indvars.iv.next33, %indvars.iv36
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 4.500000e+03
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv32
  store double %23, double* %24, align 8
  %exitcond53 = icmp eq i64 %indvars.iv.next33, 900
  br i1 %exitcond53, label %._crit_edge11.us, label %17

._crit_edge11.us:                                 ; preds = %17
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond54, label %.preheader2.us.preheader, label %.preheader4.us

.preheader2.us.preheader:                         ; preds = %._crit_edge11.us
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge9.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 0, %.preheader2.us.preheader ]
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader2.us
  %indvars.iv23 = phi i64 [ 0, %.preheader2.us ], [ %indvars.iv.next24, %25 ]
  %26 = add nuw nsw i64 %indvars.iv23, 3
  %27 = mul nuw nsw i64 %26, %indvars.iv27
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.500000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv27, i64 %indvars.iv23
  store double %31, double* %32, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond51, label %._crit_edge9.us, label %25

._crit_edge9.us:                                  ; preds = %25
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next28, 900
  br i1 %exitcond52, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %33

; <label>:33:                                     ; preds = %33, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %33 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv18
  %36 = add nuw nsw i64 %35, 2
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 1000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 5.000000e+03
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv18, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond50, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge25.us, %.preheader4.lr.ph
  %indvars.iv94 = phi i64 [ 0, %.preheader4.lr.ph ], [ %indvars.iv.next95, %._crit_edge25.us ]
  br label %.lr.ph22.us.us

._crit_edge25.us:                                 ; preds = %._crit_edge23.us.us
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next95, 800
  br i1 %exitcond103, label %.preheader2.us.preheader, label %.preheader4.us

.preheader2.us.preheader:                         ; preds = %._crit_edge25.us
  br label %.preheader2.us

.lr.ph22.us.us:                                   ; preds = %.preheader4.us, %._crit_edge23.us.us
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge23.us.us ], [ 0, %.preheader4.us ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv94, i64 %indvars.iv88
  store double 0.000000e+00, double* %12, align 8
  br label %.lr.ph22.us.us.new

._crit_edge23.us.us:                              ; preds = %.lr.ph22.us.us.new
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next89, 900
  br i1 %exitcond102, label %._crit_edge25.us, label %.lr.ph22.us.us

.lr.ph22.us.us.new:                               ; preds = %.lr.ph22.us.us, %.lr.ph22.us.us.new
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %.lr.ph22.us.us.new ], [ 0, %.lr.ph22.us.us ]
  %13 = phi double [ %25, %.lr.ph22.us.us.new ], [ 0.000000e+00, %.lr.ph22.us.us ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv94, i64 %indvars.iv79
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv79, i64 %indvars.iv88
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %12, align 8
  %indvars.iv.next80 = or i64 %indvars.iv79, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv94, i64 %indvars.iv.next80
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next80, i64 %indvars.iv88
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next80.1 = add nuw nsw i64 %indvars.iv79, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next80.1, 1000
  br i1 %exitcond82.1, label %._crit_edge23.us.us, label %.lr.ph22.us.us.new

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge16.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge16.us ], [ 0, %.preheader2.us.preheader ]
  br label %.lr.ph13.us.us

._crit_edge16.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next69, 900
  br i1 %exitcond101, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge16.us
  br label %.preheader.us

.lr.ph13.us.us:                                   ; preds = %.preheader2.us, %._crit_edge14.us.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge14.us.us ], [ 0, %.preheader2.us ]
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv68, i64 %indvars.iv62
  store double 0.000000e+00, double* %26, align 8
  br label %.lr.ph13.us.us.new

._crit_edge14.us.us:                              ; preds = %.lr.ph13.us.us.new
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next63, 1100
  br i1 %exitcond100, label %._crit_edge16.us, label %.lr.ph13.us.us

.lr.ph13.us.us.new:                               ; preds = %.lr.ph13.us.us, %.lr.ph13.us.us.new
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.lr.ph13.us.us.new ], [ 0, %.lr.ph13.us.us ]
  %27 = phi double [ %39, %.lr.ph13.us.us.new ], [ 0.000000e+00, %.lr.ph13.us.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv68, i64 %indvars.iv53
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv53, i64 %indvars.iv62
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %27, %32
  store double %33, double* %26, align 8
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv68, i64 %indvars.iv.next54
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next54, i64 %indvars.iv62
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %26, align 8
  %indvars.iv.next54.1 = add nuw nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, 1200
  br i1 %exitcond56.1, label %._crit_edge14.us.us, label %.lr.ph13.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge6.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge6.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, 800
  br i1 %exitcond, label %._crit_edge7, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.preheader.us, %._crit_edge.us.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv42, i64 %indvars.iv37
  store double 0.000000e+00, double* %40, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next38, 1100
  br i1 %exitcond99, label %._crit_edge6.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %41 = phi double [ %53, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %42 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv37
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %41, %46
  store double %47, double* %40, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %48 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv42, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv37
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %47, %52
  store double %53, double* %40, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge7:                                     ; preds = %._crit_edge6.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge1.us, %.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5, %._crit_edge1.us ]
  %7 = mul nsw i64 %indvars.iv4, 800
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond9, label %._crit_edge1.us, label %8

._crit_edge1.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond, label %._crit_edge2, label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge1.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
