; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  %11 = bitcast i8* %7 to double*
  %12 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %8, double* %9)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph4, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %5
  br label %._crit_edge

.lr.ph4:                                          ; preds = %5
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us, %.lr.ph4
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us ], [ 0, %.lr.ph4 ]
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %0, i64 %indvars.iv5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %9 = icmp eq i64 %indvars.iv.next6, 2000
  %10 = trunc i64 %indvars.iv.next6 to i32
  %11 = sitofp i32 %10 to double
  %12 = select i1 %9, double 0.000000e+00, double %11
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 2.000000e+03, double 2.000000e+03>
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  store double %16, double* %8, align 8
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  store double %17, double* %18, align 8
  %19 = add nuw nsw i64 %indvars.iv5, 3
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 2000
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  %24 = add nuw nsw i64 %indvars.iv5, 4
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2000
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 2.000000e+03, double 2.000000e+03>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  store double %31, double* %23, align 8
  %33 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  store double %32, double* %33, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  br i1 false, label %.prol.loopexit...loopexit_crit_edge.us_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit...loopexit_crit_edge.us_crit_edge: ; preds = %.prol.loopexit
  br label %..loopexit_crit_edge.us

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ 0, %.lr.ph.us.new.preheader ]
  %34 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %39 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 2000
  %42 = sitofp i32 %41 to double
  %43 = insertelement <2 x double> undef, double %37, i32 0
  %44 = insertelement <2 x double> %43, double %42, i32 1
  %45 = fdiv <2 x double> %44, <double 2.000000e+03, double 2.000000e+03>
  %46 = bitcast double* %38 to <2 x double>*
  store <2 x double> %45, <2 x double>* %46, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %.prol.loopexit...loopexit_crit_edge.us_crit_edge, %..loopexit_crit_edge.us.loopexit
  br i1 %9, label %._crit_edge.loopexit, label %.lr.ph.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader4.us.preheader, label %.._crit_edge7_crit_edge

.._crit_edge7_crit_edge:                          ; preds = %5
  br label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %5
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge10.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge10.us ], [ 0, %.preheader4.us.preheader ]
  %6 = getelementptr inbounds double, double* %0, i64 %indvars.iv23
  br i1 true, label %.prol.loopexit20, label %.prol.preheader19

.prol.preheader19:                                ; preds = %.preheader4.us
  br label %.prol.loopexit20

.prol.loopexit20:                                 ; preds = %.prol.preheader19, %.preheader4.us
  br i1 false, label %.prol.loopexit20.._crit_edge10.us_crit_edge, label %.preheader4.us.new.preheader

.prol.loopexit20.._crit_edge10.us_crit_edge:      ; preds = %.prol.loopexit20
  br label %._crit_edge10.us

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit20
  %.pre = load double, double* %6, align 8
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new.preheader, %.preheader4.us.new
  %7 = phi double [ %19, %.preheader4.us.new ], [ %.pre, %.preheader4.us.new.preheader ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.preheader4.us.new ], [ 0, %.preheader4.us.new.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv15
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv15
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fadd double %7, %12
  store double %13, double* %6, align 8
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv.next16
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %6, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, 2000
  br i1 %exitcond18.1, label %._crit_edge10.us.loopexit, label %.preheader4.us.new

._crit_edge10.us.loopexit:                        ; preds = %.preheader4.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %.prol.loopexit20.._crit_edge10.us_crit_edge, %._crit_edge10.us.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond26, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv12
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  br i1 false, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %.pre27 = load double, double* %20, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %21 = phi double [ %33, %.preheader.us.new ], [ %.pre27, %.preheader.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv, i64 %indvars.iv12
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %20, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv12
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %27, %32
  store double %33, double* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.._crit_edge7_crit_edge, %._crit_edge7.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph7.preheader, label %._crit_edge.critedge

.lr.ph7.preheader:                                ; preds = %2
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %12
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %12 ], [ 0, %.lr.ph7.preheader ]
  %7 = trunc i64 %indvars.iv9 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %.lr.ph7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %.lr.ph7, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv9
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond12, label %._crit_edge8, label %.lr.ph7

._crit_edge8:                                     ; preds = %12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge8.._crit_edge_crit_edge

._crit_edge8.._crit_edge_crit_edge:               ; preds = %._crit_edge8
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %26
  %indvars.iv = phi i64 [ %indvars.iv.next, %26 ], [ 0, %.lr.ph.preheader ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %.lr.ph
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %26

; <label>:26:                                     ; preds = %.lr.ph, %24
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.critedge:                             ; preds = %2
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %26
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8.._crit_edge_crit_edge, %._crit_edge.loopexit, %._crit_edge.critedge
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
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
