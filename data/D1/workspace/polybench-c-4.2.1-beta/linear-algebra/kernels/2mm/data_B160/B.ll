; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call fastcc void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  %22 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.lr.ph26.split.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge23.us, %.lr.ph26.split.us.preheader
  %indvars.iv78 = phi i64 [ 0, %.lr.ph26.split.us.preheader ], [ %indvars.iv.next79, %._crit_edge23.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph26.split.us
  %indvars.iv54.us = phi i64 [ 0, %.lr.ph26.split.us ], [ %indvars.iv.next55.us, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv54.us, %indvars.iv78
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 8.000000e+02
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv54.us
  store double %11, double* %12, align 8
  %indvars.iv.next55.us = add nuw nsw i64 %indvars.iv54.us, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next55.us, 1100
  br i1 %exitcond77, label %._crit_edge23.us, label %._crit_edge

._crit_edge23.us:                                 ; preds = %._crit_edge
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next79, 800
  br i1 %exitcond96, label %.lr.ph19.split.us.new.preheader.preheader, label %.lr.ph26.split.us

.lr.ph19.split.us.new.preheader.preheader:        ; preds = %._crit_edge23.us
  br label %.lr.ph19.split.us.new.preheader

.lr.ph19.split.us.new.preheader:                  ; preds = %.lr.ph19.split.us.new.preheader.preheader, %._crit_edge16.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge16.us ], [ 0, %.lr.ph19.split.us.new.preheader.preheader ]
  br label %.lr.ph19.split.us.new

.lr.ph19.split.us.new:                            ; preds = %.lr.ph19.split.us.new, %.lr.ph19.split.us.new.preheader
  %indvars.iv52.us = phi i64 [ 0, %.lr.ph19.split.us.new.preheader ], [ %indvars.iv.next53.us.1, %.lr.ph19.split.us.new ]
  %indvars.iv.next53.us = or i64 %indvars.iv52.us, 1
  %13 = mul nuw nsw i64 %indvars.iv.next53.us, %indvars.iv73
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 9.000000e+02
  %18 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv52.us
  store double %17, double* %18, align 8
  %indvars.iv.next53.us.1 = add nuw nsw i64 %indvars.iv52.us, 2
  %19 = mul nuw nsw i64 %indvars.iv.next53.us.1, %indvars.iv73
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 9.000000e+02
  %24 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv.next53.us
  store double %23, double* %24, align 8
  %exitcond72.1 = icmp eq i64 %indvars.iv.next53.us.1, 900
  br i1 %exitcond72.1, label %._crit_edge16.us, label %.lr.ph19.split.us.new

._crit_edge16.us:                                 ; preds = %.lr.ph19.split.us.new
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next74, 1100
  br i1 %exitcond95, label %.lr.ph12.split.us.preheader, label %.lr.ph19.split.us.new.preheader

.lr.ph12.split.us.preheader:                      ; preds = %._crit_edge16.us
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %.lr.ph12.split.us.preheader, %._crit_edge9.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge9.us ], [ 0, %.lr.ph12.split.us.preheader ]
  br label %._crit_edge97

._crit_edge97:                                    ; preds = %._crit_edge97, %.lr.ph12.split.us
  %indvars.iv50.us = phi i64 [ 0, %.lr.ph12.split.us ], [ %indvars.iv.next51.us, %._crit_edge97 ]
  %25 = add nuw nsw i64 %indvars.iv50.us, 3
  %26 = mul nuw nsw i64 %25, %indvars.iv68
  %27 = add nuw nsw i64 %26, 1
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1200
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.200000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv50.us
  store double %31, double* %32, align 8
  %indvars.iv.next51.us = add nuw nsw i64 %indvars.iv50.us, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next51.us, 1200
  br i1 %exitcond67, label %._crit_edge9.us, label %._crit_edge97

._crit_edge9.us:                                  ; preds = %._crit_edge97
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next69, 900
  br i1 %exitcond94, label %.lr.ph5.split.us.preheader, label %.lr.ph12.split.us

.lr.ph5.split.us.preheader:                       ; preds = %._crit_edge9.us
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98, %.lr.ph5.split.us
  %indvars.iv.us = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next.us, %._crit_edge98 ]
  %33 = add nuw nsw i64 %indvars.iv.us, 2
  %34 = mul nuw nsw i64 %33, %indvars.iv
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.100000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv, i64 %indvars.iv.us
  store double %38, double* %39, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge98

._crit_edge.us:                                   ; preds = %._crit_edge98
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next, 800
  br i1 %exitcond93, label %40, label %.lr.ph5.split.us

; <label>:40:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.lr.ph14.split.us:
  br label %.lr.ph8.us.us.preheader

.lr.ph8.us.us.preheader:                          ; preds = %._crit_edge12.us, %.lr.ph14.split.us
  %indvar = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvar.next, %._crit_edge12.us ]
  br label %.lr.ph8.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge9.us.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond99 = icmp eq i64 %indvar.next, 800
  br i1 %exitcond99, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph8.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge12.us
  br label %.lr.ph.us.us.preheader

.lr.ph8.us.us:                                    ; preds = %._crit_edge9.us.us, %.lr.ph8.us.us.preheader
  %indvars.iv55.us.us = phi i64 [ 0, %.lr.ph8.us.us.preheader ], [ %indvars.iv.next56.us.us, %._crit_edge9.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvar, i64 %indvars.iv55.us.us
  store double 0.000000e+00, double* %7, align 8
  br label %._crit_edge

._crit_edge9.us.us:                               ; preds = %._crit_edge
  %indvars.iv.next56.us.us = add nuw nsw i64 %indvars.iv55.us.us, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next56.us.us, 900
  br i1 %exitcond79, label %._crit_edge12.us, label %.lr.ph8.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph8.us.us
  %8 = phi double [ 0.000000e+00, %.lr.ph8.us.us ], [ %22, %._crit_edge ]
  %indvars.iv53.us.us = phi i64 [ 0, %.lr.ph8.us.us ], [ %indvars.iv.next54.us.us.1, %._crit_edge ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvar, i64 %indvars.iv53.us.us
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv53.us.us, i64 %indvars.iv55.us.us
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %14, %8
  store double %15, double* %7, align 8
  %indvars.iv.next54.us.us = or i64 %indvars.iv53.us.us, 1
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvar, i64 %indvars.iv.next54.us.us
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %0
  %19 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next54.us.us, i64 %indvars.iv55.us.us
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %21, %15
  store double %22, double* %7, align 8
  %indvars.iv.next54.us.us.1 = add nsw i64 %indvars.iv53.us.us, 2
  %exitcond98.1 = icmp eq i64 %indvars.iv.next54.us.us.1, 1100
  br i1 %exitcond98.1, label %._crit_edge9.us.us, label %._crit_edge

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge3.us.loopexit
  %indvars.iv39.us = phi i64 [ %indvars.iv.next40.us, %._crit_edge3.us.loopexit ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge3.us.loopexit:                         ; preds = %._crit_edge.us.us
  %indvars.iv.next40.us = add nuw nsw i64 %indvars.iv39.us, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next40.us, 800
  br i1 %exitcond97, label %45, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv37.us.us = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next38.us.us, %._crit_edge.us.us ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv39.us, i64 %indvars.iv37.us.us
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  store double %25, double* %23, align 8
  br label %._crit_edge127

._crit_edge.us.us:                                ; preds = %._crit_edge127
  %indvars.iv.next38.us.us = add nuw nsw i64 %indvars.iv37.us.us, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next38.us.us, 1200
  br i1 %exitcond76, label %._crit_edge3.us.loopexit, label %.lr.ph.us.us

._crit_edge127:                                   ; preds = %._crit_edge127, %.lr.ph.us.us
  %26 = phi double [ %25, %.lr.ph.us.us ], [ %44, %._crit_edge127 ]
  %indvars.iv.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.2, %._crit_edge127 ]
  %27 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv39.us, i64 %indvars.iv.us.us
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.us.us, i64 %indvars.iv37.us.us
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %31, %26
  store double %32, double* %23, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv39.us, i64 %indvars.iv.next.us.us
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next.us.us, i64 %indvars.iv37.us.us
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %37, %32
  store double %38, double* %23, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv.us.us, 2
  %39 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv39.us, i64 %indvars.iv.next.us.us.1
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next.us.us.1, i64 %indvars.iv37.us.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, %38
  store double %44, double* %23, align 8
  %indvars.iv.next.us.us.2 = add nsw i64 %indvars.iv.us.us, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.us.us.2, 900
  br i1 %exitcond.2, label %._crit_edge.us.us, label %._crit_edge127

; <label>:45:                                     ; preds = %._crit_edge3.us.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.lr.ph4.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge2.us, %.lr.ph4.split.us.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next, %._crit_edge2.us ]
  %5 = mul nuw nsw i64 %indvars.iv, 800
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.lr.ph4.split.us
  %indvars.iv.us = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv.us
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
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.us
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 800
  br i1 %exitcond14, label %16, label %.lr.ph4.split.us

; <label>:16:                                     ; preds = %._crit_edge2.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
