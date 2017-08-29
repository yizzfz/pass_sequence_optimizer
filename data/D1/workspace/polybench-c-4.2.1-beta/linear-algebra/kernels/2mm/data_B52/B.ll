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
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  %17 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %17)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %18 = icmp sgt i32 %0, 42
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %2
  %20 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %20, align 1
  %21 = icmp eq i8 %strcmpload, 0
  br i1 %21, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %19
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %17)
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2, %22
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
.preheader13.lr.ph:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge38.us, %.preheader13.lr.ph
  %indvars.iv77 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next78, %._crit_edge38.us ]
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader13.us
  %indvars.iv73 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next74, %10 ]
  %11 = mul nuw nsw i64 %indvars.iv77, %indvars.iv73
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv77, i64 %indvars.iv73
  store double %16, double* %17, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1100
  br i1 %exitcond76, label %._crit_edge38.us, label %10

._crit_edge38.us:                                 ; preds = %10
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next78, 800
  br i1 %exitcond84, label %.preheader11.us.preheader, label %.preheader13.us

.preheader11.us.preheader:                        ; preds = %._crit_edge38.us
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge30.us, %.preheader11.us.preheader
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge30.us ], [ 0, %.preheader11.us.preheader ]
  br label %18

; <label>:18:                                     ; preds = %18, %.preheader11.us
  %indvars.iv65 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next66.1, %18 ]
  %indvars.iv.next66 = or i64 %indvars.iv65, 1
  %19 = mul nuw nsw i64 %indvars.iv69, %indvars.iv.next66
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv69, i64 %indvars.iv65
  %indvars.iv.next66.1 = add nsw i64 %indvars.iv65, 2
  %24 = mul nuw nsw i64 %indvars.iv69, %indvars.iv.next66.1
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 900
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 9.000000e+02, double 9.000000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %exitcond68.1 = icmp eq i64 %indvars.iv.next66.1, 900
  br i1 %exitcond68.1, label %._crit_edge30.us, label %18

._crit_edge30.us:                                 ; preds = %18
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next70, 1100
  br i1 %exitcond83, label %.preheader9.us.preheader, label %.preheader11.us

.preheader9.us.preheader:                         ; preds = %._crit_edge30.us
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge22.us, %.preheader9.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge22.us ], [ 0, %.preheader9.us.preheader ]
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader9.us
  %indvars.iv57 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next58, %32 ]
  %33 = add nuw nsw i64 %indvars.iv57, 3
  %34 = mul nuw nsw i64 %indvars.iv61, %33
  %35 = add nuw nsw i64 %34, 1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1200
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.200000e+03
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv61, i64 %indvars.iv57
  store double %39, double* %40, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 1200
  br i1 %exitcond60, label %._crit_edge22.us, label %32

._crit_edge22.us:                                 ; preds = %32
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next62, 900
  br i1 %exitcond82, label %.preheader.us.preheader, label %.preheader9.us

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %41

; <label>:41:                                     ; preds = %41, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %41 ]
  %42 = add nuw nsw i64 %indvars.iv, 2
  %43 = mul nuw nsw i64 %indvars.iv55, %42
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 1100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 1.100000e+03
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv55, i64 %indvars.iv
  store double %47, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %41

._crit_edge.us:                                   ; preds = %41
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next56, 800
  br i1 %exitcond81, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge38.us, %.preheader7.lr.ph
  %indvars.iv91 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next92, %._crit_edge38.us ]
  br label %.lr.ph32.us.us

._crit_edge38.us:                                 ; preds = %._crit_edge33.us.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next92, 800
  br i1 %exitcond118, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge38.us
  br label %.preheader.us

.lr.ph32.us.us:                                   ; preds = %.preheader7.us, %._crit_edge33.us.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge33.us.us ], [ 0, %.preheader7.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv91, i64 %indvars.iv87
  store double 0.000000e+00, double* %11, align 8
  br label %.lr.ph32.us.us.new

._crit_edge33.us.us:                              ; preds = %.lr.ph32.us.us.new
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next88, 900
  br i1 %exitcond90, label %._crit_edge38.us, label %.lr.ph32.us.us

.lr.ph32.us.us.new:                               ; preds = %.lr.ph32.us.us, %.lr.ph32.us.us.new
  %12 = phi double [ %26, %.lr.ph32.us.us.new ], [ 0.000000e+00, %.lr.ph32.us.us ]
  %indvars.iv83 = phi i64 [ %indvars.iv.next84.1, %.lr.ph32.us.us.new ], [ 0, %.lr.ph32.us.us ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv91, i64 %indvars.iv83
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv83, i64 %indvars.iv87
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %18, %12
  store double %19, double* %11, align 8
  %indvars.iv.next84 = or i64 %indvars.iv83, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv91, i64 %indvars.iv.next84
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next84, i64 %indvars.iv87
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %25, %19
  store double %26, double* %11, align 8
  %indvars.iv.next84.1 = add nuw nsw i64 %indvars.iv83, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next84.1, 1100
  br i1 %exitcond86.1, label %._crit_edge33.us.us, label %.lr.ph32.us.us.new

.preheader.us:                                    ; preds = %._crit_edge10.us, %.preheader.us.preheader
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge10.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge10.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond = icmp eq i64 %indvars.iv.next77, 800
  br i1 %exitcond, label %._crit_edge15, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.preheader.us, %._crit_edge.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv76, i64 %indvars.iv72
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %5
  store double %29, double* %27, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond75, label %._crit_edge10.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %30 = phi double [ %42, %.lr.ph.us.us.new ], [ %29, %.lr.ph.us.us ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv76, i64 %indvars.iv68
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv68, i64 %indvars.iv72
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %35, %30
  store double %36, double* %27, align 8
  %indvars.iv.next69 = or i64 %indvars.iv68, 1
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv76, i64 %indvars.iv.next69
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next69, i64 %indvars.iv72
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %41, %36
  store double %42, double* %27, align 8
  %indvars.iv.next69.1 = add nuw nsw i64 %indvars.iv68, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next69.1, 900
  br i1 %exitcond71.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge15:                                    ; preds = %._crit_edge10.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next13, %._crit_edge3.us ]
  %7 = mul nuw nsw i64 %indvars.iv12, 800
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %8

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 800
  br i1 %exitcond14, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
