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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  call void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  call void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  call void @print_array([1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
.lr.ph42:
  br label %.lr.ph42.split.us

.lr.ph42.split.us:                                ; preds = %._crit_edge39.us, %.lr.ph42
  %indvars.iv79 = phi i64 [ 0, %.lr.ph42 ], [ %indvars.iv.next80, %._crit_edge39.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph42.split.us
  %indvars.iv75 = phi i64 [ 0, %.lr.ph42.split.us ], [ %indvars.iv.next76, %._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv75, %indvars.iv79
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 800
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 4.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv75
  store double %9, double* %10, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 1000
  br i1 %exitcond78, label %._crit_edge39.us, label %._crit_edge

._crit_edge39.us:                                 ; preds = %._crit_edge
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 800
  br i1 %exitcond82, label %.lr.ph31.split.us.preheader, label %.lr.ph42.split.us

.lr.ph31.split.us.preheader:                      ; preds = %._crit_edge39.us
  br label %.lr.ph31.split.us

.lr.ph31.split.us:                                ; preds = %.lr.ph31.split.us.preheader, %._crit_edge28.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge28.us ], [ 0, %.lr.ph31.split.us.preheader ]
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84, %.lr.ph31.split.us
  %indvars.iv66 = phi i64 [ 0, %.lr.ph31.split.us ], [ %indvars.iv.next67, %._crit_edge84 ]
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %11 = mul nuw nsw i64 %indvars.iv.next67, %indvars.iv70
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 900
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 4.500000e+03
  %17 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv66
  store double %16, double* %17, align 8
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 900
  br i1 %exitcond69, label %._crit_edge28.us, label %._crit_edge84

._crit_edge28.us:                                 ; preds = %._crit_edge84
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 1000
  br i1 %exitcond73, label %.lr.ph20.split.us.preheader, label %.lr.ph31.split.us

.lr.ph20.split.us.preheader:                      ; preds = %._crit_edge28.us
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %._crit_edge17.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85, %.lr.ph20.split.us
  %indvars.iv57 = phi i64 [ 0, %.lr.ph20.split.us ], [ %indvars.iv.next58, %._crit_edge85 ]
  %18 = add nuw nsw i64 %indvars.iv57, 3
  %19 = mul nuw nsw i64 %18, %indvars.iv61
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 5.500000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv61, i64 %indvars.iv57
  store double %23, double* %24, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 1200
  br i1 %exitcond60, label %._crit_edge17.us, label %._crit_edge85

._crit_edge17.us:                                 ; preds = %._crit_edge85
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 900
  br i1 %exitcond64, label %.lr.ph9.split.us.preheader, label %.lr.ph20.split.us

.lr.ph9.split.us.preheader:                       ; preds = %._crit_edge17.us
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %._crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.lr.ph9.split.us.preheader ]
  br label %._crit_edge86

._crit_edge86:                                    ; preds = %._crit_edge86, %.lr.ph9.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next, %._crit_edge86 ]
  %25 = add nuw nsw i64 %indvars.iv, 2
  %26 = mul nuw nsw i64 %25, %indvars.iv52
  %27 = add nuw nsw i64 %26, 2
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.000000e+03
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge86

._crit_edge.us:                                   ; preds = %._crit_edge86
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond55, label %._crit_edge10, label %.lr.ph9.split.us

._crit_edge10:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) #2 {
.lr.ph72:
  br label %.lr.ph72.split.us

.lr.ph72.split.us:                                ; preds = %._crit_edge67.us, %.lr.ph72
  %indvars.iv155 = phi i64 [ 0, %.lr.ph72 ], [ %indvars.iv.next156, %._crit_edge67.us ]
  br label %.lr.ph62.us.us

._crit_edge67.us:                                 ; preds = %._crit_edge63.us.us
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, 800
  br i1 %exitcond158, label %.lr.ph44.split.us.preheader, label %.lr.ph72.split.us

.lr.ph44.split.us.preheader:                      ; preds = %._crit_edge67.us
  br label %.lr.ph44.split.us

.lr.ph62.us.us:                                   ; preds = %._crit_edge63.us.us, %.lr.ph72.split.us
  %indvars.iv149 = phi i64 [ 0, %.lr.ph72.split.us ], [ %indvars.iv.next150, %._crit_edge63.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv155, i64 %indvars.iv149
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph62.us.us.new

._crit_edge63.us.us:                              ; preds = %.lr.ph62.us.us.new
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next150, 900
  br i1 %exitcond152, label %._crit_edge67.us, label %.lr.ph62.us.us

.lr.ph62.us.us.new:                               ; preds = %.lr.ph62.us.us.new, %.lr.ph62.us.us
  %indvars.iv140 = phi i64 [ 0, %.lr.ph62.us.us ], [ %indvars.iv.next141.1, %.lr.ph62.us.us.new ]
  %8 = phi double [ 0.000000e+00, %.lr.ph62.us.us ], [ %20, %.lr.ph62.us.us.new ]
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv155, i64 %indvars.iv140
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv140, i64 %indvars.iv149
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %13, %8
  store double %14, double* %7, align 8
  %indvars.iv.next141 = or i64 %indvars.iv140, 1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv155, i64 %indvars.iv.next141
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next141, i64 %indvars.iv149
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %19, %14
  store double %20, double* %7, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %exitcond143.1 = icmp eq i64 %indvars.iv.next141.1, 1000
  br i1 %exitcond143.1, label %._crit_edge63.us.us, label %.lr.ph62.us.us.new

.lr.ph44.split.us:                                ; preds = %.lr.ph44.split.us.preheader, %._crit_edge39.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge39.us ], [ 0, %.lr.ph44.split.us.preheader ]
  br label %.lr.ph34.us.us

._crit_edge39.us:                                 ; preds = %._crit_edge35.us.us
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 900
  br i1 %exitcond132, label %.lr.ph16.split.us.preheader, label %.lr.ph44.split.us

.lr.ph16.split.us.preheader:                      ; preds = %._crit_edge39.us
  br label %.lr.ph16.split.us

.lr.ph34.us.us:                                   ; preds = %._crit_edge35.us.us, %.lr.ph44.split.us
  %indvars.iv123 = phi i64 [ 0, %.lr.ph44.split.us ], [ %indvars.iv.next124, %._crit_edge35.us.us ]
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv129, i64 %indvars.iv123
  store double 0.000000e+00, double* %21, align 8
  br label %.lr.ph34.us.us.new

._crit_edge35.us.us:                              ; preds = %.lr.ph34.us.us.new
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next124, 1100
  br i1 %exitcond126, label %._crit_edge39.us, label %.lr.ph34.us.us

.lr.ph34.us.us.new:                               ; preds = %.lr.ph34.us.us.new, %.lr.ph34.us.us
  %indvars.iv114 = phi i64 [ 0, %.lr.ph34.us.us ], [ %indvars.iv.next115.1, %.lr.ph34.us.us.new ]
  %22 = phi double [ 0.000000e+00, %.lr.ph34.us.us ], [ %34, %.lr.ph34.us.us.new ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv129, i64 %indvars.iv114
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv123
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %27, %22
  store double %28, double* %21, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv129, i64 %indvars.iv.next115
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next115, i64 %indvars.iv123
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %33, %28
  store double %34, double* %21, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %exitcond117.1 = icmp eq i64 %indvars.iv.next115.1, 1200
  br i1 %exitcond117.1, label %._crit_edge35.us.us, label %.lr.ph34.us.us.new

.lr.ph16.split.us:                                ; preds = %.lr.ph16.split.us.preheader, %._crit_edge11.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge11.us ], [ 0, %.lr.ph16.split.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge11.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 800
  br i1 %exitcond106, label %._crit_edge17, label %.lr.ph16.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph16.split.us
  %indvars.iv98 = phi i64 [ 0, %.lr.ph16.split.us ], [ %indvars.iv.next99, %._crit_edge.us.us ]
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv103, i64 %indvars.iv98
  store double 0.000000e+00, double* %35, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond = icmp eq i64 %indvars.iv.next99, 1100
  br i1 %exitcond, label %._crit_edge11.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %36 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %48, %.lr.ph.us.us.new ]
  %37 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv98
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %41, %36
  store double %42, double* %35, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %43 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv98
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %47, %42
  store double %48, double* %35, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge17:                                    ; preds = %._crit_edge11.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]* nocapture readonly) #0 {
.lr.ph3.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv10, 800
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge15
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge15, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge15

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond13, label %._crit_edge4, label %.lr.ph3.split.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
