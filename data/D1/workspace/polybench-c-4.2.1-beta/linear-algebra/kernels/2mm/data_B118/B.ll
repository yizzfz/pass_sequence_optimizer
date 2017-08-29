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
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1200 x double]*
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %22)
  br label %23

; <label>:23:                                     ; preds = %18, %21, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader47.us.preheader:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %._crit_edge64.us, %.preheader47.us.preheader
  %indvars.iv89 = phi i64 [ 0, %.preheader47.us.preheader ], [ %indvars.iv.next90, %._crit_edge64.us ]
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader47.us
  %indvars.iv86 = phi i64 [ 0, %.preheader47.us ], [ %indvars.iv.next87, %10 ]
  %11 = mul nuw nsw i64 %indvars.iv86, %indvars.iv89
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv89, i64 %indvars.iv86
  store double %16, double* %17, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 1100
  br i1 %exitcond88, label %._crit_edge64.us, label %10

._crit_edge64.us:                                 ; preds = %10
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next90, 800
  br i1 %exitcond91, label %.preheader45.us.preheader, label %.preheader47.us

.preheader45.us.preheader:                        ; preds = %._crit_edge64.us
  br label %.preheader45.us

.preheader45.us:                                  ; preds = %.preheader45.us.preheader, %._crit_edge59.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge59.us ], [ 0, %.preheader45.us.preheader ]
  br label %18

; <label>:18:                                     ; preds = %18, %.preheader45.us
  %indvars.iv80 = phi i64 [ 0, %.preheader45.us ], [ %indvars.iv.next81.1, %18 ]
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %19 = mul nuw nsw i64 %indvars.iv.next81, %indvars.iv83
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 9.000000e+02
  %24 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv83, i64 %indvars.iv80
  store double %23, double* %24, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %25 = mul nuw nsw i64 %indvars.iv.next81.1, %indvars.iv83
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 900
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 9.000000e+02
  %30 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv83, i64 %indvars.iv.next81
  store double %29, double* %30, align 8
  %exitcond82.1 = icmp eq i64 %indvars.iv.next81.1, 900
  br i1 %exitcond82.1, label %._crit_edge59.us, label %18

._crit_edge59.us:                                 ; preds = %18
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next84, 1100
  br i1 %exitcond85, label %.preheader43.us.preheader, label %.preheader45.us

.preheader43.us.preheader:                        ; preds = %._crit_edge59.us
  br label %.preheader43.us

.preheader43.us:                                  ; preds = %.preheader43.us.preheader, %._crit_edge54.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge54.us ], [ 0, %.preheader43.us.preheader ]
  br label %31

; <label>:31:                                     ; preds = %31, %.preheader43.us
  %indvars.iv74 = phi i64 [ 0, %.preheader43.us ], [ %indvars.iv.next75, %31 ]
  %32 = add nuw nsw i64 %indvars.iv74, 3
  %33 = mul nuw nsw i64 %32, %indvars.iv77
  %34 = add nuw nsw i64 %33, 1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1200
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.200000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv77, i64 %indvars.iv74
  store double %38, double* %39, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond76, label %._crit_edge54.us, label %31

._crit_edge54.us:                                 ; preds = %31
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond79, label %.preheader.us.preheader, label %.preheader43.us

.preheader.us.preheader:                          ; preds = %._crit_edge54.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %40 ]
  %41 = add nuw nsw i64 %indvars.iv, 2
  %42 = mul nuw nsw i64 %41, %indvars.iv71
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 1100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, 1.100000e+03
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv71, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %40

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next72, 800
  br i1 %exitcond73, label %._crit_edge51, label %.preheader.us

._crit_edge51:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader41.us.preheader:
  br label %.lr.ph56.us.us.preheader

.lr.ph56.us.us.preheader:                         ; preds = %.preheader41.us.preheader, %._crit_edge60.us
  %indvars.iv84 = phi i64 [ 0, %.preheader41.us.preheader ], [ %indvars.iv.next85, %._crit_edge60.us ]
  br label %.lr.ph56.us.us

._crit_edge60.us:                                 ; preds = %._crit_edge57.us.us
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next85, 800
  br i1 %exitcond86, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph56.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge60.us
  br label %.lr.ph.us.us.preheader

.lr.ph56.us.us:                                   ; preds = %._crit_edge57.us.us, %.lr.ph56.us.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.lr.ph56.us.us.preheader ], [ %indvars.iv.next81, %._crit_edge57.us.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv84, i64 %indvars.iv80
  store double 0.000000e+00, double* %11, align 8
  br label %12

._crit_edge57.us.us:                              ; preds = %12
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next81, 900
  br i1 %exitcond82, label %._crit_edge60.us, label %.lr.ph56.us.us

; <label>:12:                                     ; preds = %12, %.lr.ph56.us.us
  %indvars.iv77 = phi i64 [ 0, %.lr.ph56.us.us ], [ %indvars.iv.next78.1, %12 ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv84, i64 %indvars.iv77
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv77, i64 %indvars.iv80
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = load double, double* %11, align 8
  %20 = fadd double %19, %18
  store double %20, double* %11, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv84, i64 %indvars.iv.next78
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next78, i64 %indvars.iv80
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %11, align 8
  %28 = fadd double %27, %26
  store double %28, double* %11, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %exitcond79.1 = icmp eq i64 %indvars.iv.next78.1, 1100
  br i1 %exitcond79.1, label %._crit_edge57.us.us, label %12

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge45.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge45.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge45.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next75, 800
  br i1 %exitcond76, label %._crit_edge47, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv72 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next73, %._crit_edge.us.us ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv74, i64 %indvars.iv72
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %5
  store double %31, double* %29, align 8
  br label %32

._crit_edge.us.us:                                ; preds = %32
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond, label %._crit_edge45.us, label %.lr.ph.us.us

; <label>:32:                                     ; preds = %32, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %32 ]
  %33 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv, i64 %indvars.iv72
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = load double, double* %29, align 8
  %39 = fadd double %38, %37
  store double %39, double* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next, i64 %indvars.iv72
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = load double, double* %29, align 8
  %46 = fadd double %45, %44
  store double %46, double* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %32

._crit_edge47:                                    ; preds = %._crit_edge45.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv13, 800
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
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
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond15, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
