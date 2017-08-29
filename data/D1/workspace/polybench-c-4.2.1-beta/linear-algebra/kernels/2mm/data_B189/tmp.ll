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
  %5 = call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 960000, i32 8) #4
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
  call fastcc void @print_array([1200 x double]* %13)
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
  %indvars.iv83 = phi i64 [ 0, %.lr.ph26.split.us.preheader ], [ %indvars.iv.next84, %._crit_edge23.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph26.split.us
  %indvars.iv79 = phi i64 [ 0, %.lr.ph26.split.us ], [ %indvars.iv.next80, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv79, %indvars.iv83
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 8.000000e+02
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv83, i64 %indvars.iv79
  store double %11, double* %12, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 1100
  br i1 %exitcond82, label %._crit_edge23.us, label %._crit_edge

._crit_edge23.us:                                 ; preds = %._crit_edge
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next84, 800
  br i1 %exitcond106, label %.lr.ph19.split.us.new.preheader.preheader, label %.lr.ph26.split.us

.lr.ph19.split.us.new.preheader.preheader:        ; preds = %._crit_edge23.us
  br label %.lr.ph19.split.us.new.preheader

.lr.ph19.split.us.new.preheader:                  ; preds = %._crit_edge16.us, %.lr.ph19.split.us.new.preheader.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge16.us ], [ 0, %.lr.ph19.split.us.new.preheader.preheader ]
  br label %.lr.ph19.split.us.new

.lr.ph19.split.us.new:                            ; preds = %.lr.ph19.split.us.new, %.lr.ph19.split.us.new.preheader
  %indvars.iv71 = phi i64 [ 0, %.lr.ph19.split.us.new.preheader ], [ %indvars.iv.next72.1, %.lr.ph19.split.us.new ]
  %indvars.iv.next72 = or i64 %indvars.iv71, 1
  %13 = mul nuw nsw i64 %indvars.iv.next72, %indvars.iv75
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv75, i64 %indvars.iv71
  %indvars.iv.next72.1 = add nuw nsw i64 %indvars.iv71, 2
  %18 = mul nuw nsw i64 %indvars.iv.next72.1, %indvars.iv75
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %16, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fdiv <2 x double> %23, <double 9.000000e+02, double 9.000000e+02>
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %exitcond74.1 = icmp eq i64 %indvars.iv.next72.1, 900
  br i1 %exitcond74.1, label %._crit_edge16.us, label %.lr.ph19.split.us.new

._crit_edge16.us:                                 ; preds = %.lr.ph19.split.us.new
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next76, 1100
  br i1 %exitcond105, label %.lr.ph12.split.us.preheader, label %.lr.ph19.split.us.new.preheader

.lr.ph12.split.us.preheader:                      ; preds = %._crit_edge16.us
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge9.us, %.lr.ph12.split.us.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge9.us ], [ 0, %.lr.ph12.split.us.preheader ]
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101, %.lr.ph12.split.us
  %indvars.iv63 = phi i64 [ 0, %.lr.ph12.split.us ], [ %indvars.iv.next64, %._crit_edge101 ]
  %26 = add nuw nsw i64 %indvars.iv63, 3
  %27 = mul nuw nsw i64 %26, %indvars.iv67
  %28 = add nuw nsw i64 %27, 1
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1200
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.200000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv63
  store double %32, double* %33, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond66, label %._crit_edge9.us, label %._crit_edge101

._crit_edge9.us:                                  ; preds = %._crit_edge101
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next68, 900
  br i1 %exitcond104, label %.lr.ph5.split.us.preheader, label %.lr.ph12.split.us

.lr.ph5.split.us.preheader:                       ; preds = %._crit_edge9.us
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge102 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv61
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.100000e+03
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge102

._crit_edge.us:                                   ; preds = %._crit_edge102
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next62, 800
  br i1 %exitcond103, label %41, label %.lr.ph5.split.us

; <label>:41:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.lr.ph14.split.us:
  br label %.lr.ph8.us.us.preheader

.lr.ph8.us.us.preheader:                          ; preds = %._crit_edge12.us, %.lr.ph14.split.us
  %indvars.iv81 = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next82, %._crit_edge12.us ]
  br label %.lr.ph8.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge9.us.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next82, 800
  br i1 %exitcond102, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph8.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge12.us
  br label %.lr.ph.us.us.preheader

.lr.ph8.us.us:                                    ; preds = %._crit_edge9.us.us, %.lr.ph8.us.us.preheader
  %indvars.iv77 = phi i64 [ 0, %.lr.ph8.us.us.preheader ], [ %indvars.iv.next78, %._crit_edge9.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv81, i64 %indvars.iv77
  store double 0.000000e+00, double* %7, align 8
  br label %._crit_edge

._crit_edge9.us.us:                               ; preds = %._crit_edge
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond80, label %._crit_edge12.us, label %.lr.ph8.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph8.us.us
  %8 = phi double [ 0.000000e+00, %.lr.ph8.us.us ], [ %22, %._crit_edge ]
  %indvars.iv74 = phi i64 [ 0, %.lr.ph8.us.us ], [ %indvars.iv.next75.1, %._crit_edge ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv81, i64 %indvars.iv74
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv77
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %14, %8
  store double %15, double* %7, align 8
  %indvars.iv.next75 = or i64 %indvars.iv74, 1
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv81, i64 %indvars.iv.next75
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %0
  %19 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next75, i64 %indvars.iv77
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %21, %15
  store double %22, double* %7, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next75.1, 1100
  br i1 %exitcond93.1, label %._crit_edge9.us.us, label %._crit_edge

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge3.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge3.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next69, 800
  br i1 %exitcond101, label %45, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next65, %._crit_edge.us.us ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv64
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  store double %25, double* %23, align 8
  br label %._crit_edge100

._crit_edge.us.us:                                ; preds = %._crit_edge100
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond67, label %._crit_edge3.us, label %.lr.ph.us.us

._crit_edge100:                                   ; preds = %._crit_edge100, %.lr.ph.us.us
  %26 = phi double [ %25, %.lr.ph.us.us ], [ %44, %._crit_edge100 ]
  %indvars.iv62 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next63.2, %._crit_edge100 ]
  %27 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv68, i64 %indvars.iv62
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv64
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %31, %26
  store double %32, double* %23, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv68, i64 %indvars.iv.next63
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next63, i64 %indvars.iv64
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %37, %32
  store double %38, double* %23, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %39 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv68, i64 %indvars.iv.next63.1
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next63.1, i64 %indvars.iv64
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, %38
  store double %44, double* %23, align 8
  %indvars.iv.next63.2 = add nsw i64 %indvars.iv62, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next63.2, 900
  br i1 %exitcond.2, label %._crit_edge.us.us, label %._crit_edge100

; <label>:45:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.lr.ph2.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv10, 800
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge16
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge16, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond17, label %16, label %.lr.ph2.split.us

; <label>:16:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
