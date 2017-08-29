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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %22)
  br label %23

; <label>:23:                                     ; preds = %18, %2, %21
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.lr.ph32.split.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %._crit_edge29.us, %.lr.ph32.split.us.preheader
  %indvars.iv72 = phi i64 [ 0, %.lr.ph32.split.us.preheader ], [ %indvars.iv.next73, %._crit_edge29.us ]
  br label %6

; <label>:6:                                      ; preds = %6, %.lr.ph32.split.us
  %indvars.iv53 = phi i64 [ 0, %.lr.ph32.split.us ], [ %indvars.iv.next54, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv72, %indvars.iv53
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 800
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 8.000000e+02
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv72, i64 %indvars.iv53
  store double %12, double* %13, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next54, 1100
  br i1 %exitcond60, label %._crit_edge29.us, label %6

._crit_edge29.us:                                 ; preds = %6
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next73, 800
  br i1 %exitcond79, label %._crit_edge29.us..lr.ph24.split.us_crit_edge, label %.lr.ph32.split.us

._crit_edge29.us..lr.ph24.split.us_crit_edge:     ; preds = %._crit_edge29.us
  br label %.lr.ph24.split.us

.lr.ph24.split.us:                                ; preds = %._crit_edge21.us, %._crit_edge29.us..lr.ph24.split.us_crit_edge
  %indvars.iv68 = phi i64 [ 0, %._crit_edge29.us..lr.ph24.split.us_crit_edge ], [ %indvars.iv.next69, %._crit_edge21.us ]
  br label %14

; <label>:14:                                     ; preds = %14, %.lr.ph24.split.us
  %indvars.iv48 = phi i64 [ 0, %.lr.ph24.split.us ], [ %indvars.iv.next49, %14 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %15 = mul nuw nsw i64 %indvars.iv68, %indvars.iv.next49
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 900
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 9.000000e+02
  %20 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv48
  store double %19, double* %20, align 8
  %exitcond59 = icmp eq i64 %indvars.iv.next49, 900
  br i1 %exitcond59, label %._crit_edge21.us, label %14

._crit_edge21.us:                                 ; preds = %14
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next69, 1100
  br i1 %exitcond78, label %._crit_edge21.us..lr.ph16.split.us_crit_edge, label %.lr.ph24.split.us

._crit_edge21.us..lr.ph16.split.us_crit_edge:     ; preds = %._crit_edge21.us
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge13.us, %._crit_edge21.us..lr.ph16.split.us_crit_edge
  %indvars.iv64 = phi i64 [ 0, %._crit_edge21.us..lr.ph16.split.us_crit_edge ], [ %indvars.iv.next65, %._crit_edge13.us ]
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph16.split.us
  %indvars.iv43 = phi i64 [ 0, %.lr.ph16.split.us ], [ %indvars.iv.next44, %21 ]
  %22 = add nuw nsw i64 %indvars.iv43, 3
  %23 = mul nuw nsw i64 %indvars.iv64, %22
  %24 = add nuw nsw i64 %23, 1
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 1200
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.200000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv43
  store double %28, double* %29, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond, label %._crit_edge13.us, label %21

._crit_edge13.us:                                 ; preds = %21
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next65, 900
  br i1 %exitcond77, label %._crit_edge13.us..lr.ph8.split.us_crit_edge, label %.lr.ph16.split.us

._crit_edge13.us..lr.ph8.split.us_crit_edge:      ; preds = %._crit_edge13.us
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %._crit_edge13.us..lr.ph8.split.us_crit_edge
  %indvars.iv61 = phi i64 [ 0, %._crit_edge13.us..lr.ph8.split.us_crit_edge ], [ %indvars.iv.next62, %._crit_edge.us ]
  br label %30

; <label>:30:                                     ; preds = %30, %.lr.ph8.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next, %30 ]
  %31 = add nuw nsw i64 %indvars.iv, 2
  %32 = mul nuw nsw i64 %indvars.iv61, %31
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1100
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.100000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond58, label %._crit_edge.us, label %30

._crit_edge.us:                                   ; preds = %30
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next62, 800
  br i1 %exitcond76, label %._crit_edge9, label %.lr.ph8.split.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.lr.ph30.split.us.preheader:
  br label %.lr.ph22.us.us.preheader

.lr.ph22.us.us.preheader:                         ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next83, %._crit_edge27.us ]
  br label %.lr.ph22.us.us.new.preheader

._crit_edge27.us:                                 ; preds = %._crit_edge23.us.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next83, 800
  br i1 %exitcond68, label %._crit_edge27.us..lr.ph.us.us.preheader_crit_edge, label %.lr.ph22.us.us.preheader

._crit_edge27.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge27.us
  br label %.lr.ph.us.us.preheader

.lr.ph22.us.us.new.preheader:                     ; preds = %._crit_edge23.us.us, %.lr.ph22.us.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.lr.ph22.us.us.preheader ], [ %indvars.iv.next81, %._crit_edge23.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv80
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph22.us.us.new

._crit_edge23.us.us:                              ; preds = %.lr.ph22.us.us.new
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next81, 900
  br i1 %exitcond84, label %._crit_edge27.us, label %.lr.ph22.us.us.new.preheader

.lr.ph22.us.us.new:                               ; preds = %.lr.ph22.us.us.new, %.lr.ph22.us.us.new.preheader
  %8 = phi double [ 0.000000e+00, %.lr.ph22.us.us.new.preheader ], [ %22, %.lr.ph22.us.us.new ]
  %indvars.iv56 = phi i64 [ 0, %.lr.ph22.us.us.new.preheader ], [ %indvars.iv.next57.1, %.lr.ph22.us.us.new ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv56
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv56, i64 %indvars.iv80
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %8, %14
  store double %15, double* %7, align 8
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv.next57
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %0
  %19 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next57, i64 %indvars.iv80
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %15, %21
  store double %22, double* %7, align 8
  %indvars.iv.next57.1 = add nuw nsw i64 %indvars.iv56, 2
  %exitcond.164 = icmp eq i64 %indvars.iv.next57.1, 1100
  br i1 %exitcond.164, label %._crit_edge23.us.us, label %.lr.ph22.us.us.new

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge9.us, %._crit_edge27.us..lr.ph.us.us.preheader_crit_edge
  %indvars.iv78 = phi i64 [ 0, %._crit_edge27.us..lr.ph.us.us.preheader_crit_edge ], [ %indvars.iv.next79, %._crit_edge9.us ]
  br label %.lr.ph.us.us.new.preheader

._crit_edge9.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond1 = icmp ne i64 %indvars.iv.next79, 800
  br i1 %exitcond1, label %.lr.ph.us.us.preheader, label %._crit_edge13

.lr.ph.us.us.new.preheader:                       ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv76 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next77, %._crit_edge.us.us ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv78, i64 %indvars.iv76
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  store double %25, double* %23, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond = icmp ne i64 %indvars.iv.next77, 1200
  br i1 %exitcond, label %.lr.ph.us.us.new.preheader, label %._crit_edge9.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %26 = phi double [ %25, %.lr.ph.us.us.new.preheader ], [ %38, %.lr.ph.us.us.new ]
  %indvars.iv46 = phi i64 [ 0, %.lr.ph.us.us.new.preheader ], [ %indvars.iv.next47.1, %.lr.ph.us.us.new ]
  %27 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv46
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %indvars.iv76
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %26, %31
  store double %32, double* %23, align 8
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv.next47
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next47, i64 %indvars.iv76
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %32, %37
  store double %38, double* %23, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge13:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv11, 800
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond10, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 800
  br i1 %exitcond13, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
