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
.lr.ph42..lr.ph42.split.us_crit_edge:
  br label %.lr.ph42.split.us

.lr.ph42.split.us:                                ; preds = %._crit_edge39.us, %.lr.ph42..lr.ph42.split.us_crit_edge
  %indvars.iv76 = phi i64 [ 0, %.lr.ph42..lr.ph42.split.us_crit_edge ], [ %indvars.iv.next77, %._crit_edge39.us ]
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph42.split.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge ], [ 0, %.lr.ph42.split.us ]
  %10 = mul nsw i64 %indvars.iv72, %indvars.iv76
  %11 = add nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv76, i64 %indvars.iv72
  store double %15, double* %16, align 8
  %exitcond75 = icmp eq i64 %indvars.iv72, 999
  br i1 %exitcond75, label %._crit_edge39.us, label %._crit_edge

._crit_edge:                                      ; preds = %9
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br label %9

._crit_edge39.us:                                 ; preds = %9
  %indvars.iv.next77 = add nuw i64 %indvars.iv76, 1
  %17 = icmp slt i64 %indvars.iv.next77, 800
  br i1 %17, label %.lr.ph42.split.us, label %.lr.ph31.split.us.preheader

.lr.ph31.split.us.preheader:                      ; preds = %._crit_edge39.us
  br label %.lr.ph31.split.us

.lr.ph31.split.us:                                ; preds = %.lr.ph31.split.us.preheader, %._crit_edge28.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge28.us ], [ 0, %.lr.ph31.split.us.preheader ]
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50, %.lr.ph31.split.us
  %indvars.iv65 = phi i64 [ 0, %.lr.ph31.split.us ], [ %indvars.iv.next66, %._crit_edge50 ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %18 = mul nsw i64 %indvars.iv.next66, %indvars.iv69
  %19 = add nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 4.500000e+03
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv69, i64 %indvars.iv65
  store double %23, double* %24, align 8
  %exitcond68 = icmp eq i64 %indvars.iv65, 899
  br i1 %exitcond68, label %._crit_edge28.us, label %._crit_edge50

._crit_edge28.us:                                 ; preds = %._crit_edge50
  %indvars.iv.next70 = add nuw i64 %indvars.iv69, 1
  %25 = icmp slt i64 %indvars.iv.next70, 1000
  br i1 %25, label %.lr.ph31.split.us, label %.lr.ph20.split.us.preheader

.lr.ph20.split.us.preheader:                      ; preds = %._crit_edge28.us
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %._crit_edge17.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  br label %26

; <label>:26:                                     ; preds = %._crit_edge79, %.lr.ph20.split.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge79 ], [ 0, %.lr.ph20.split.us ]
  %27 = add nuw nsw i64 %indvars.iv58, 3
  %28 = mul nsw i64 %27, %indvars.iv62
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1100
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 5.500000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv62, i64 %indvars.iv58
  store double %32, double* %33, align 8
  %exitcond61 = icmp eq i64 %indvars.iv58, 1199
  br i1 %exitcond61, label %._crit_edge17.us, label %._crit_edge79

._crit_edge79:                                    ; preds = %26
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  br label %26

._crit_edge17.us:                                 ; preds = %26
  %indvars.iv.next63 = add nuw i64 %indvars.iv62, 1
  %34 = icmp slt i64 %indvars.iv.next63, 900
  br i1 %34, label %.lr.ph20.split.us, label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %._crit_edge17.us
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %._crit_edge.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge.us ], [ 0, %.lr.ph9.split.us.preheader ]
  br label %35

; <label>:35:                                     ; preds = %._crit_edge80, %.lr.ph9.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge80 ], [ 0, %.lr.ph9.split.us ]
  %36 = add nuw nsw i64 %indvars.iv, 2
  %37 = mul nsw i64 %36, %indvars.iv55
  %38 = add nsw i64 %37, 2
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 1000
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, 5.000000e+03
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv55, i64 %indvars.iv
  store double %42, double* %43, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge80

._crit_edge80:                                    ; preds = %35
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %35

._crit_edge.us:                                   ; preds = %35
  %indvars.iv.next56 = add nuw i64 %indvars.iv55, 1
  %44 = icmp slt i64 %indvars.iv.next56, 1200
  br i1 %44, label %.lr.ph9.split.us, label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
.lr.ph72..lr.ph72.split.us_crit_edge:
  br label %.lr.ph62.us.us.preheader

.lr.ph62.us.us.preheader:                         ; preds = %._crit_edge67.us, %.lr.ph72..lr.ph72.split.us_crit_edge
  %indvars.iv129 = phi i64 [ 0, %.lr.ph72..lr.ph72.split.us_crit_edge ], [ %indvars.iv.next130, %._crit_edge67.us ]
  br label %.lr.ph62.us.us

._crit_edge67.us:                                 ; preds = %._crit_edge63.us.us
  %indvars.iv.next130 = add nuw i64 %indvars.iv129, 1
  %12 = icmp slt i64 %indvars.iv.next130, 800
  br i1 %12, label %.lr.ph62.us.us.preheader, label %.lr.ph34.us.us.preheader.preheader

.lr.ph34.us.us.preheader.preheader:               ; preds = %._crit_edge67.us
  br label %.lr.ph34.us.us.preheader

.lr.ph62.us.us:                                   ; preds = %._crit_edge63.us.us, %.lr.ph62.us.us.preheader
  %indvars.iv127 = phi i64 [ 0, %.lr.ph62.us.us.preheader ], [ %indvars.iv.next128, %._crit_edge63.us.us ]
  %13 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv129, i64 %indvars.iv127
  store double 0.000000e+00, double* %13, align 8
  br label %15

._crit_edge63.us.us:                              ; preds = %15
  %indvars.iv.next128 = add nuw i64 %indvars.iv127, 1
  %14 = icmp slt i64 %indvars.iv.next128, 900
  br i1 %14, label %.lr.ph62.us.us, label %._crit_edge67.us

; <label>:15:                                     ; preds = %._crit_edge, %.lr.ph62.us.us
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge ], [ 0, %.lr.ph62.us.us ]
  %16 = phi double [ %22, %._crit_edge ], [ 0.000000e+00, %.lr.ph62.us.us ]
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv129, i64 %indvars.iv123
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv123, i64 %indvars.iv127
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %21, %16
  store double %22, double* %13, align 8
  %exitcond126 = icmp eq i64 %indvars.iv123, 999
  br i1 %exitcond126, label %._crit_edge63.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %15
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  br label %15

.lr.ph34.us.us.preheader:                         ; preds = %.lr.ph34.us.us.preheader.preheader, %._crit_edge39.us
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge39.us ], [ 0, %.lr.ph34.us.us.preheader.preheader ]
  br label %.lr.ph34.us.us

._crit_edge39.us:                                 ; preds = %._crit_edge35.us.us
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %23 = icmp slt i64 %indvars.iv.next115, 900
  br i1 %23, label %.lr.ph34.us.us.preheader, label %.lr.ph.us.us.preheader.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge39.us
  br label %.lr.ph.us.us.preheader

.lr.ph34.us.us:                                   ; preds = %._crit_edge35.us.us, %.lr.ph34.us.us.preheader
  %indvars.iv112 = phi i64 [ 0, %.lr.ph34.us.us.preheader ], [ %indvars.iv.next113, %._crit_edge35.us.us ]
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv114, i64 %indvars.iv112
  store double 0.000000e+00, double* %24, align 8
  br label %26

._crit_edge35.us.us:                              ; preds = %26
  %indvars.iv.next113 = add nuw i64 %indvars.iv112, 1
  %25 = icmp slt i64 %indvars.iv.next113, 1100
  br i1 %25, label %.lr.ph34.us.us, label %._crit_edge39.us

; <label>:26:                                     ; preds = %._crit_edge132, %.lr.ph34.us.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge132 ], [ 0, %.lr.ph34.us.us ]
  %27 = phi double [ %33, %._crit_edge132 ], [ 0.000000e+00, %.lr.ph34.us.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv114, i64 %indvars.iv108
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv108, i64 %indvars.iv112
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %32, %27
  store double %33, double* %24, align 8
  %exitcond111 = icmp eq i64 %indvars.iv108, 1199
  br i1 %exitcond111, label %._crit_edge35.us.us, label %._crit_edge132

._crit_edge132:                                   ; preds = %26
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  br label %26

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge11.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge11.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge11.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next100 = add nuw i64 %indvars.iv99, 1
  %34 = icmp slt i64 %indvars.iv.next100, 800
  br i1 %34, label %.lr.ph.us.us.preheader, label %._crit_edge94

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv97 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next98, %._crit_edge.us.us ]
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv99, i64 %indvars.iv97
  store double 0.000000e+00, double* %35, align 8
  br label %37

._crit_edge.us.us:                                ; preds = %37
  %indvars.iv.next98 = add nuw i64 %indvars.iv97, 1
  %36 = icmp slt i64 %indvars.iv.next98, 1100
  br i1 %36, label %.lr.ph.us.us, label %._crit_edge11.us

; <label>:37:                                     ; preds = %._crit_edge133, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge133 ], [ 0, %.lr.ph.us.us ]
  %38 = phi double [ %44, %._crit_edge133 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %39 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv99, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv97
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, %38
  store double %44, double* %35, align 8
  %exitcond = icmp eq i64 %indvars.iv, 899
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge133

._crit_edge133:                                   ; preds = %37
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %37

._crit_edge94:                                    ; preds = %._crit_edge11.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph3..lr.ph3.split.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3..lr.ph3.split.us_crit_edge
  %indvars.iv11 = phi i64 [ 0, %.lr.ph3..lr.ph3.split.us_crit_edge ], [ %indvars.iv.next12, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv11, 800
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge9, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge9 ]
  %8 = add nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge9

; <label>:12:                                     ; preds = %._crit_edge10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge10, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, 1100
  br i1 %18, label %._crit_edge10, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge9
  %indvars.iv.next12 = add nuw i64 %indvars.iv11, 1
  %19 = icmp slt i64 %indvars.iv.next12, 800
  br i1 %19, label %.lr.ph3.split.us, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
