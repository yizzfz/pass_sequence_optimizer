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
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
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
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.lr.ph36.split.us.preheader:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.lr.ph36.split.us

.lr.ph36.split.us:                                ; preds = %._crit_edge33.us, %.lr.ph36.split.us.preheader
  %indvars.iv93 = phi i64 [ 0, %.lr.ph36.split.us.preheader ], [ %indvars.iv.next94, %._crit_edge33.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36.split.us
  %indvars.iv89 = phi i64 [ 0, %.lr.ph36.split.us ], [ %indvars.iv.next90, %._crit_edge ]
  %10 = mul nuw nsw i64 %indvars.iv89, %indvars.iv93
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 8.000000e+02
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv93, i64 %indvars.iv89
  store double %15, double* %16, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 1100
  br i1 %exitcond92, label %._crit_edge33.us, label %._crit_edge

._crit_edge33.us:                                 ; preds = %._crit_edge
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next94, 800
  br i1 %exitcond116, label %.lr.ph29.split.us.new.preheader.preheader, label %.lr.ph36.split.us

.lr.ph29.split.us.new.preheader.preheader:        ; preds = %._crit_edge33.us
  br label %.lr.ph29.split.us.new.preheader

.lr.ph29.split.us.new.preheader:                  ; preds = %._crit_edge26.us, %.lr.ph29.split.us.new.preheader.preheader
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge26.us ], [ 0, %.lr.ph29.split.us.new.preheader.preheader ]
  br label %.lr.ph29.split.us.new

.lr.ph29.split.us.new:                            ; preds = %.lr.ph29.split.us.new, %.lr.ph29.split.us.new.preheader
  %indvars.iv81 = phi i64 [ 0, %.lr.ph29.split.us.new.preheader ], [ %indvars.iv.next82.1, %.lr.ph29.split.us.new ]
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %17 = mul nuw nsw i64 %indvars.iv.next82, %indvars.iv85
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 900
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv85, i64 %indvars.iv81
  %indvars.iv.next82.1 = add nuw nsw i64 %indvars.iv81, 2
  %22 = mul nuw nsw i64 %indvars.iv.next82.1, %indvars.iv85
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 900
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, <double 9.000000e+02, double 9.000000e+02>
  %29 = bitcast double* %21 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %exitcond84.1 = icmp eq i64 %indvars.iv.next82.1, 900
  br i1 %exitcond84.1, label %._crit_edge26.us, label %.lr.ph29.split.us.new

._crit_edge26.us:                                 ; preds = %.lr.ph29.split.us.new
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next86, 1100
  br i1 %exitcond115, label %.lr.ph22.split.us.preheader, label %.lr.ph29.split.us.new.preheader

.lr.ph22.split.us.preheader:                      ; preds = %._crit_edge26.us
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %._crit_edge19.us, %.lr.ph22.split.us.preheader
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge19.us ], [ 0, %.lr.ph22.split.us.preheader ]
  br label %._crit_edge111

._crit_edge111:                                   ; preds = %._crit_edge111, %.lr.ph22.split.us
  %indvars.iv73 = phi i64 [ 0, %.lr.ph22.split.us ], [ %indvars.iv.next74, %._crit_edge111 ]
  %30 = add nuw nsw i64 %indvars.iv73, 3
  %31 = mul nuw nsw i64 %30, %indvars.iv77
  %32 = add nuw nsw i64 %31, 1
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv77, i64 %indvars.iv73
  store double %36, double* %37, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1200
  br i1 %exitcond76, label %._crit_edge19.us, label %._crit_edge111

._crit_edge19.us:                                 ; preds = %._crit_edge111
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond114, label %.lr.ph15.split.us.preheader, label %.lr.ph22.split.us

.lr.ph15.split.us.preheader:                      ; preds = %._crit_edge19.us
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %._crit_edge.us, %.lr.ph15.split.us.preheader
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge.us ], [ 0, %.lr.ph15.split.us.preheader ]
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112, %.lr.ph15.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph15.split.us ], [ %indvars.iv.next, %._crit_edge112 ]
  %38 = add nuw nsw i64 %indvars.iv, 2
  %39 = mul nuw nsw i64 %38, %indvars.iv71
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 1100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.100000e+03
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv71, i64 %indvars.iv
  store double %43, double* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge112

._crit_edge.us:                                   ; preds = %._crit_edge112
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next72, 800
  br i1 %exitcond113, label %45, label %.lr.ph15.split.us

; <label>:45:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.lr.ph19.split.us.preheader:
  br label %.lr.ph13.us.us.preheader

.lr.ph13.us.us.preheader:                         ; preds = %._crit_edge17.us, %.lr.ph19.split.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.lr.ph19.split.us.preheader ], [ %indvars.iv.next83, %._crit_edge17.us ]
  br label %.lr.ph13.us.us.new.preheader

._crit_edge17.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next83, 800
  br i1 %exitcond107, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph13.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge17.us
  br label %.lr.ph.us.us.preheader

.lr.ph13.us.us.new.preheader:                     ; preds = %._crit_edge14.us.us, %.lr.ph13.us.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.lr.ph13.us.us.preheader ], [ %indvars.iv.next81, %._crit_edge14.us.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv80
  store double 0.000000e+00, double* %11, align 8
  br label %.lr.ph13.us.us.new

._crit_edge14.us.us:                              ; preds = %.lr.ph13.us.us.new
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next81, 900
  br i1 %exitcond106, label %._crit_edge17.us, label %.lr.ph13.us.us.new.preheader

.lr.ph13.us.us.new:                               ; preds = %.lr.ph13.us.us.new, %.lr.ph13.us.us.new.preheader
  %12 = phi double [ 0.000000e+00, %.lr.ph13.us.us.new.preheader ], [ %26, %.lr.ph13.us.us.new ]
  %indvars.iv76 = phi i64 [ 0, %.lr.ph13.us.us.new.preheader ], [ %indvars.iv.next77.1, %.lr.ph13.us.us.new ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv82, i64 %indvars.iv76
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv76, i64 %indvars.iv80
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %18, %12
  store double %19, double* %11, align 8
  %indvars.iv.next77 = or i64 %indvars.iv76, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv82, i64 %indvars.iv.next77
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next77, i64 %indvars.iv80
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %25, %19
  store double %26, double* %11, align 8
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv76, 2
  %exitcond79.1 = icmp eq i64 %indvars.iv.next77.1, 1100
  br i1 %exitcond79.1, label %._crit_edge14.us.us, label %.lr.ph13.us.us.new

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge8.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge8.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us.new.preheader

._crit_edge8.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next72, 800
  br i1 %exitcond105, label %43, label %.lr.ph.us.us.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv69 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next70, %._crit_edge.us.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv71, i64 %indvars.iv69
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %5
  store double %29, double* %27, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond, label %._crit_edge8.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %30 = phi double [ %29, %.lr.ph.us.us.new.preheader ], [ %42, %.lr.ph.us.us.new ]
  %indvars.iv67 = phi i64 [ 0, %.lr.ph.us.us.new.preheader ], [ %indvars.iv.next68.1, %.lr.ph.us.us.new ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv71, i64 %indvars.iv67
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv67, i64 %indvars.iv69
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %35, %30
  store double %36, double* %27, align 8
  %indvars.iv.next68 = or i64 %indvars.iv67, 1
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv71, i64 %indvars.iv.next68
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next68, i64 %indvars.iv69
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %41, %36
  store double %42, double* %27, align 8
  %indvars.iv.next68.1 = add nuw nsw i64 %indvars.iv67, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next68.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

; <label>:43:                                     ; preds = %._crit_edge8.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph5.split.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge3.us ]
  %7 = mul nuw nsw i64 %indvars.iv13, 800
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %._crit_edge.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge.us._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond17, label %18, label %.lr.ph5.split.us

; <label>:18:                                     ; preds = %._crit_edge3.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
