; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
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
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %22

; <label>:22:                                     ; preds = %18, %21, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) #2 {
.preheader51.lr.ph:
  br label %.preheader51.us

.preheader51.us:                                  ; preds = %.preheader51.lr.ph, %._crit_edge68.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge68.us ], [ 0, %.preheader51.lr.ph ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader51.us
  %indvars.iv98 = phi i64 [ 0, %.preheader51.us ], [ %indvars.iv.next99, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv98, %indvars.iv102
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv102, i64 %indvars.iv98
  store double %15, double* %16, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, 1000
  br i1 %exitcond101, label %._crit_edge68.us, label %9

._crit_edge68.us:                                 ; preds = %9
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 800
  br i1 %exitcond105, label %.preheader49.us.preheader, label %.preheader51.us

.preheader49.us.preheader:                        ; preds = %._crit_edge68.us
  br label %.preheader49.us

.preheader49.us:                                  ; preds = %.preheader49.us.preheader, %._crit_edge63.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge63.us ], [ 0, %.preheader49.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader49.us
  %indvars.iv89 = phi i64 [ 0, %.preheader49.us ], [ %indvars.iv.next90, %17 ]
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %18 = mul nuw nsw i64 %indvars.iv.next90, %indvars.iv93
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 4.500000e+03
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv93, i64 %indvars.iv89
  store double %23, double* %24, align 8
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 900
  br i1 %exitcond92, label %._crit_edge63.us, label %17

._crit_edge63.us:                                 ; preds = %17
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, 1000
  br i1 %exitcond96, label %.preheader47.us.preheader, label %.preheader49.us

.preheader47.us.preheader:                        ; preds = %._crit_edge63.us
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %.preheader47.us.preheader, %._crit_edge58.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge58.us ], [ 0, %.preheader47.us.preheader ]
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader47.us
  %indvars.iv80 = phi i64 [ 0, %.preheader47.us ], [ %indvars.iv.next81, %25 ]
  %26 = add nuw nsw i64 %indvars.iv80, 3
  %27 = mul nuw nsw i64 %26, %indvars.iv84
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.500000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv84, i64 %indvars.iv80
  store double %31, double* %32, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, 1200
  br i1 %exitcond83, label %._crit_edge58.us, label %25

._crit_edge58.us:                                 ; preds = %25
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, 900
  br i1 %exitcond87, label %.preheader.us.preheader, label %.preheader47.us

.preheader.us.preheader:                          ; preds = %._crit_edge58.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %33

; <label>:33:                                     ; preds = %33, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %33 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv75
  %36 = add nuw nsw i64 %35, 2
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 1000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 5.000000e+03
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv75, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 1200
  br i1 %exitcond78, label %._crit_edge55, label %.preheader.us

._crit_edge55:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) #2 {
.preheader61.lr.ph:
  br label %.preheader61.us

.preheader61.us:                                  ; preds = %._crit_edge94.us, %.preheader61.lr.ph
  %indvars.iv164 = phi i64 [ 0, %.preheader61.lr.ph ], [ %indvars.iv.next165, %._crit_edge94.us ]
  br label %.lr.ph90.us.us

._crit_edge94.us:                                 ; preds = %._crit_edge91.us.us
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, 800
  br i1 %exitcond167, label %.preheader59.us.preheader, label %.preheader61.us

.preheader59.us.preheader:                        ; preds = %._crit_edge94.us
  br label %.preheader59.us

.lr.ph90.us.us:                                   ; preds = %.preheader61.us, %._crit_edge91.us.us
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge91.us.us ], [ 0, %.preheader61.us ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv164, i64 %indvars.iv158
  store double 0.000000e+00, double* %12, align 8
  br label %.lr.ph90.us.us.new

._crit_edge91.us.us:                              ; preds = %.lr.ph90.us.us.new
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 900
  br i1 %exitcond161, label %._crit_edge94.us, label %.lr.ph90.us.us

.lr.ph90.us.us.new:                               ; preds = %.lr.ph90.us.us, %.lr.ph90.us.us.new
  %indvars.iv150 = phi i64 [ %indvars.iv.next151.1, %.lr.ph90.us.us.new ], [ 0, %.lr.ph90.us.us ]
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv164, i64 %indvars.iv150
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv150, i64 %indvars.iv158
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = load double, double* %12, align 8
  %19 = fadd double %18, %17
  store double %19, double* %12, align 8
  %indvars.iv.next151 = or i64 %indvars.iv150, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv164, i64 %indvars.iv.next151
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next151, i64 %indvars.iv158
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = load double, double* %12, align 8
  %26 = fadd double %25, %24
  store double %26, double* %12, align 8
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, 2
  %exitcond153.1 = icmp eq i64 %indvars.iv.next151.1, 1000
  br i1 %exitcond153.1, label %._crit_edge91.us.us, label %.lr.ph90.us.us.new

.preheader59.us:                                  ; preds = %.preheader59.us.preheader, %._crit_edge80.us
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge80.us ], [ 0, %.preheader59.us.preheader ]
  br label %.lr.ph76.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next140, 900
  br i1 %exitcond142, label %.preheader.us.preheader, label %.preheader59.us

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  br label %.preheader.us

.lr.ph76.us.us:                                   ; preds = %.preheader59.us, %._crit_edge77.us.us
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge77.us.us ], [ 0, %.preheader59.us ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv139, i64 %indvars.iv133
  store double 0.000000e+00, double* %27, align 8
  br label %.lr.ph76.us.us.new

._crit_edge77.us.us:                              ; preds = %.lr.ph76.us.us.new
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, 1100
  br i1 %exitcond136, label %._crit_edge80.us, label %.lr.ph76.us.us

.lr.ph76.us.us.new:                               ; preds = %.lr.ph76.us.us, %.lr.ph76.us.us.new
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.1, %.lr.ph76.us.us.new ], [ 0, %.lr.ph76.us.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv139, i64 %indvars.iv125
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv125, i64 %indvars.iv133
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = load double, double* %27, align 8
  %34 = fadd double %33, %32
  store double %34, double* %27, align 8
  %indvars.iv.next126 = or i64 %indvars.iv125, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv139, i64 %indvars.iv.next126
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next126, i64 %indvars.iv133
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %27, align 8
  %41 = fadd double %40, %39
  store double %41, double* %27, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %exitcond128.1 = icmp eq i64 %indvars.iv.next126.1, 1200
  br i1 %exitcond128.1, label %._crit_edge77.us.us, label %.lr.ph76.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge65.us
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge65.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge65.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, 800
  br i1 %exitcond117, label %._crit_edge67, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.preheader.us, %._crit_edge.us.us
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv109
  store double 0.000000e+00, double* %42, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond = icmp eq i64 %indvars.iv.next110, 1100
  br i1 %exitcond, label %._crit_edge65.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %43 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv109
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %42, align 8
  %49 = fadd double %48, %47
  store double %49, double* %42, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %50 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv109
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %42, align 8
  %56 = fadd double %55, %54
  store double %56, double* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge67:                                    ; preds = %._crit_edge65.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]*) #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv14, 800
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond17, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
