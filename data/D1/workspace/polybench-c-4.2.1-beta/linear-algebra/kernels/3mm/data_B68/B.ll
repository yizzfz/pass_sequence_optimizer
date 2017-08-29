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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %4 = call i8* @polybench_alloc_data(i64 800000, i32 8) #3
  %5 = call i8* @polybench_alloc_data(i64 900000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %7 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %8 = call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %9 = call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  call fastcc void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  call void (...) @polybench_timer_start() #3
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  call fastcc void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1100 x double]*
  call fastcc void @print_array([1100 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %3) #3
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  call void @free(i8* %8) #3
  call void @free(i8* %9) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #0 {
.preheader10.us.preheader:
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next62, %._crit_edge27.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 800
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 4.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv57
  store double %9, double* %10, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next58, 1000
  br i1 %exitcond71, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next62, 800
  br i1 %exitcond72, label %.preheader8.us.preheader, label %.preheader10.us

.preheader8.us.preheader:                         ; preds = %._crit_edge27.us
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge22.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %.preheader8.us
  %indvars.iv48 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next49, %._crit_edge4 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %11 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 900
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 4.500000e+03
  %17 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv48
  store double %16, double* %17, align 8
  %exitcond69 = icmp eq i64 %indvars.iv.next49, 900
  br i1 %exitcond69, label %._crit_edge22.us, label %._crit_edge4

._crit_edge22.us:                                 ; preds = %._crit_edge4
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next53, 1000
  br i1 %exitcond70, label %.preheader6.us.preheader, label %.preheader8.us

.preheader6.us.preheader:                         ; preds = %._crit_edge22.us
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge17.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge5 ]
  %18 = add nuw nsw i64 %indvars.iv39, 3
  %19 = mul nuw nsw i64 %18, %indvars.iv43
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 5.500000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv39
  store double %23, double* %24, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond67, label %._crit_edge17.us, label %._crit_edge5

._crit_edge17.us:                                 ; preds = %._crit_edge5
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next44, 900
  br i1 %exitcond68, label %.preheader.us.preheader, label %.preheader6.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge6 ]
  %25 = add nuw nsw i64 %indvars.iv, 2
  %26 = mul nuw nsw i64 %25, %indvars.iv34
  %27 = add nuw nsw i64 %26, 2
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.000000e+03
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv34, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond66, label %._crit_edge.us, label %._crit_edge6

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) unnamed_addr #0 {
.preheader10.us.preheader:
  br label %.lr.ph27.us.us.preheader

.lr.ph27.us.us.preheader:                         ; preds = %._crit_edge31.us, %.preheader10.us.preheader
  %indvars.iv99 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next100, %._crit_edge31.us ]
  br label %.lr.ph27.us.us

._crit_edge31.us:                                 ; preds = %._crit_edge28.us.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next100, 800
  br i1 %exitcond114, label %.lr.ph19.us.us.preheader.preheader, label %.lr.ph27.us.us.preheader

.lr.ph19.us.us.preheader.preheader:               ; preds = %._crit_edge31.us
  br label %.lr.ph19.us.us.preheader

.lr.ph27.us.us:                                   ; preds = %._crit_edge28.us.us, %.lr.ph27.us.us.preheader
  %indvars.iv95 = phi i64 [ 0, %.lr.ph27.us.us.preheader ], [ %indvars.iv.next96, %._crit_edge28.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv95
  store double 0.000000e+00, double* %7, align 8
  br label %._crit_edge

._crit_edge28.us.us:                              ; preds = %._crit_edge
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next96, 900
  br i1 %exitcond113, label %._crit_edge31.us, label %.lr.ph27.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph27.us.us
  %indvars.iv91 = phi i64 [ 0, %.lr.ph27.us.us ], [ %indvars.iv.next92.1, %._crit_edge ]
  %8 = phi double [ 0.000000e+00, %.lr.ph27.us.us ], [ %20, %._crit_edge ]
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv91
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv91, i64 %indvars.iv95
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %8, %13
  store double %14, double* %7, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next92
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next92, i64 %indvars.iv95
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  store double %20, double* %7, align 8
  %indvars.iv.next92.1 = add nuw nsw i64 %indvars.iv91, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next92.1, 1000
  br i1 %exitcond112.1, label %._crit_edge28.us.us, label %._crit_edge

.lr.ph19.us.us.preheader:                         ; preds = %.lr.ph19.us.us.preheader.preheader, %._crit_edge23.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge23.us ], [ 0, %.lr.ph19.us.us.preheader.preheader ]
  br label %.lr.ph19.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next83, 900
  br i1 %exitcond110, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph19.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge23.us
  br label %.lr.ph.us.us.preheader

.lr.ph19.us.us:                                   ; preds = %._crit_edge20.us.us, %.lr.ph19.us.us.preheader
  %indvars.iv78 = phi i64 [ 0, %.lr.ph19.us.us.preheader ], [ %indvars.iv.next79, %._crit_edge20.us.us ]
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv78
  store double 0.000000e+00, double* %21, align 8
  br label %._crit_edge3

._crit_edge20.us.us:                              ; preds = %._crit_edge3
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next79, 1100
  br i1 %exitcond109, label %._crit_edge23.us, label %.lr.ph19.us.us

._crit_edge3:                                     ; preds = %._crit_edge3, %.lr.ph19.us.us
  %indvars.iv74 = phi i64 [ 0, %.lr.ph19.us.us ], [ %indvars.iv.next75.2, %._crit_edge3 ]
  %22 = phi double [ 0.000000e+00, %.lr.ph19.us.us ], [ %40, %._crit_edge3 ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv74
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv78
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %21, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next75
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next75, i64 %indvars.iv78
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %21, align 8
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv74, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next75.1
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next75.1, i64 %indvars.iv78
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %21, align 8
  %indvars.iv.next75.2 = add nuw nsw i64 %indvars.iv74, 3
  %exitcond108.2 = icmp eq i64 %indvars.iv.next75.2, 1200
  br i1 %exitcond108.2, label %._crit_edge20.us.us, label %._crit_edge3

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge14.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge14.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge14.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next66, 800
  br i1 %exitcond106, label %._crit_edge16, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next62, %._crit_edge.us.us ]
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv61
  store double 0.000000e+00, double* %41, align 8
  br label %._crit_edge4

._crit_edge.us.us:                                ; preds = %._crit_edge4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next62, 1100
  br i1 %exitcond105, label %._crit_edge14.us, label %.lr.ph.us.us

._crit_edge4:                                     ; preds = %._crit_edge4, %.lr.ph.us.us
  %indvars.iv57 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next58.2, %._crit_edge4 ]
  %42 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %60, %._crit_edge4 ]
  %43 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv57
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv61
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %41, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %49 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next58, i64 %indvars.iv61
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %41, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %55 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58.1
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next58.1, i64 %indvars.iv61
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %54, %59
  store double %60, double* %41, align 8
  %indvars.iv.next58.2 = add nuw nsw i64 %indvars.iv57, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next58.2, 900
  br i1 %exitcond.2, label %._crit_edge.us.us, label %._crit_edge4

._crit_edge16:                                    ; preds = %._crit_edge14.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv6, 800
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond11, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 800
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
