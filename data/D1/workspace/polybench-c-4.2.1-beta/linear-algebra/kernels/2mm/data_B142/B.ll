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
.preheader13.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge25.us, %.preheader13.lr.ph
  %indvars.iv82 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next83, %._crit_edge25.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader13.us
  %indvars.iv78 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next79, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv78, %indvars.iv82
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 8.000000e+02
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv82, i64 %indvars.iv78
  store double %11, double* %12, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, 1100
  br i1 %exitcond81, label %._crit_edge25.us, label %._crit_edge

._crit_edge25.us:                                 ; preds = %._crit_edge
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next83, 800
  br i1 %exitcond93, label %.preheader11.us.preheader, label %.preheader13.us

.preheader11.us.preheader:                        ; preds = %._crit_edge25.us
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %.preheader11.us.preheader, %._crit_edge22.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge22.us ], [ 0, %.preheader11.us.preheader ]
  br label %.preheader11.us.new

.preheader11.us.new:                              ; preds = %.preheader11.us.new, %.preheader11.us
  %indvars.iv70 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next71.1, %.preheader11.us.new ]
  %indvars.iv.next71 = or i64 %indvars.iv70, 1
  %13 = mul nuw nsw i64 %indvars.iv.next71, %indvars.iv74
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 9.000000e+02
  %18 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv70
  store double %17, double* %18, align 8
  %indvars.iv.next71.1 = add nuw nsw i64 %indvars.iv70, 2
  %19 = mul nuw nsw i64 %indvars.iv.next71.1, %indvars.iv74
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 9.000000e+02
  %24 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv.next71
  store double %23, double* %24, align 8
  %exitcond73.1 = icmp eq i64 %indvars.iv.next71.1, 900
  br i1 %exitcond73.1, label %._crit_edge22.us, label %.preheader11.us.new

._crit_edge22.us:                                 ; preds = %.preheader11.us.new
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next75, 1100
  br i1 %exitcond92, label %.preheader9.us.preheader, label %.preheader11.us

.preheader9.us.preheader:                         ; preds = %._crit_edge22.us
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge19.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge19.us ], [ 0, %.preheader9.us.preheader ]
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %._crit_edge95, %.preheader9.us
  %indvars.iv62 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next63, %._crit_edge95 ]
  %25 = add nuw nsw i64 %indvars.iv62, 3
  %26 = mul nuw nsw i64 %25, %indvars.iv66
  %27 = add nuw nsw i64 %26, 1
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1200
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.200000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv62
  store double %31, double* %32, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 1200
  br i1 %exitcond65, label %._crit_edge19.us, label %._crit_edge95

._crit_edge19.us:                                 ; preds = %._crit_edge95
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next67, 900
  br i1 %exitcond91, label %.preheader.us.preheader, label %.preheader9.us

.preheader.us.preheader:                          ; preds = %._crit_edge19.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge96

._crit_edge96:                                    ; preds = %._crit_edge96, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge96 ]
  %33 = add nuw nsw i64 %indvars.iv, 2
  %34 = mul nuw nsw i64 %33, %indvars.iv60
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.100000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv60, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge96

._crit_edge.us:                                   ; preds = %._crit_edge96
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next61, 800
  br i1 %exitcond90, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge15.us, %.preheader7.lr.ph
  %indvar = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvar.next, %._crit_edge15.us ]
  br label %.lr.ph12.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge13.us.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond101 = icmp eq i64 %indvar.next, 800
  br i1 %exitcond101, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge15.us
  br label %.preheader.us

.lr.ph12.us.us:                                   ; preds = %._crit_edge13.us.us, %.preheader7.us
  %indvars.iv75 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next76, %._crit_edge13.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvar, i64 %indvars.iv75
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph12.us.us.new

._crit_edge13.us.us:                              ; preds = %.lr.ph12.us.us.new
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next76, 900
  br i1 %exitcond99, label %._crit_edge15.us, label %.lr.ph12.us.us

.lr.ph12.us.us.new:                               ; preds = %.lr.ph12.us.us.new, %.lr.ph12.us.us
  %8 = phi double [ 0.000000e+00, %.lr.ph12.us.us ], [ %22, %.lr.ph12.us.us.new ]
  %indvars.iv71 = phi i64 [ 0, %.lr.ph12.us.us ], [ %indvars.iv.next72.1, %.lr.ph12.us.us.new ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvar, i64 %indvars.iv71
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv75
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %14, %8
  store double %15, double* %7, align 8
  %indvars.iv.next72 = or i64 %indvars.iv71, 1
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvar, i64 %indvars.iv.next72
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %0
  %19 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next72, i64 %indvars.iv75
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %21, %15
  store double %22, double* %7, align 8
  %indvars.iv.next72.1 = add nuw nsw i64 %indvars.iv71, 2
  %exitcond74.1 = icmp eq i64 %indvars.iv.next72.1, 1100
  br i1 %exitcond74.1, label %._crit_edge13.us.us, label %.lr.ph12.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge9.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge9.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge9.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next67, 800
  br i1 %exitcond102, label %._crit_edge10, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader.us
  %indvars.iv64 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next65, %._crit_edge.us.us ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv64
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  store double %25, double* %23, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond96, label %._crit_edge9.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %26 = phi double [ %25, %.lr.ph.us.us ], [ %38, %.lr.ph.us.us.new ]
  %indvars.iv62 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next63.1, %.lr.ph.us.us.new ]
  %27 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv62
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv64
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %31, %26
  store double %32, double* %23, align 8
  %indvars.iv.next63 = or i64 %indvars.iv62, 1
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv.next63
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next63, i64 %indvars.iv64
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %37, %32
  store double %38, double* %23, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next63.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge10:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge2.us, %.preheader.lr.ph
  %indvars.iv10 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next11, %._crit_edge2.us ]
  %5 = mul nuw nsw i64 %indvars.iv10, 800
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond13, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge2.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
