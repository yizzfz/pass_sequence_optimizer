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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %8, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br i1 true, label %.lr.ph6, label %._crit_edge7

.lr.ph6:                                          ; preds = %5
  %6 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.._crit_edge_crit_edge.us, %.lr.ph6
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %.._crit_edge_crit_edge.us ], [ 0, %.lr.ph6 ]
  %7 = trunc i64 %indvars.iv8 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %0, i64 %indvars.iv8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %10 = icmp eq i64 %indvars.iv.next9, 2000
  %11 = trunc i64 %indvars.iv.next9 to i32
  %12 = sitofp i32 %11 to double
  %13 = select i1 %10, double 0.000000e+00, double %12
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  store double %17, double* %9, align 8
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv8
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %indvars.iv8, 3
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2000
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv8
  %25 = add nuw nsw i64 %indvars.iv8, 4
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 2000
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 2.000000e+03, double 2.000000e+03>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  store double %32, double* %24, align 8
  %34 = getelementptr inbounds double, double* %3, i64 %indvars.iv8
  store double %33, double* %34, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv8, i64 0
  store double %6, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  br i1 false, label %.._crit_edge_crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %36 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 2000
  %44 = sitofp i32 %43 to double
  %45 = insertelement <2 x double> undef, double %39, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fdiv <2 x double> %46, <double 2.000000e+03, double 2.000000e+03>
  %48 = bitcast double* %40 to <2 x double>*
  store <2 x double> %47, <2 x double>* %48, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.._crit_edge_crit_edge.us.loopexit, label %.lr.ph.us.new

.._crit_edge_crit_edge.us.loopexit:               ; preds = %.lr.ph.us.new
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %.._crit_edge_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %10, label %._crit_edge7.loopexit, label %.lr.ph.us

._crit_edge7.loopexit:                            ; preds = %.._crit_edge_crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge8

._crit_edge.us.preheader:                         ; preds = %5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge11.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge11.us ], [ 0, %._crit_edge.us.preheader ]
  %6 = getelementptr inbounds double, double* %0, i64 %indvars.iv24
  br i1 true, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %._crit_edge.us
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv24, i64 0
  %9 = load double, double* %8, align 8
  %10 = load double, double* %2, align 8
  %11 = fmul double %9, %10
  %12 = fadd double %7, %11
  store double %12, double* %6, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %.prol.preheader20, %._crit_edge.us
  %indvars.iv16.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %._crit_edge.us ]
  br i1 false, label %._crit_edge11.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit21
  %.pre = load double, double* %6, align 8
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %13 = phi double [ %25, %._crit_edge.us.new ], [ %.pre, %._crit_edge.us.new.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %._crit_edge.us.new ], [ %indvars.iv16.unr.ph, %._crit_edge.us.new.preheader ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv16
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv16
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %6, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv.next17
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next17
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %6, align 8
  %indvars.iv.next17.1 = add nuw nsw i64 %indvars.iv16, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next17.1, 2000
  br i1 %exitcond19.1, label %._crit_edge11.us.loopexit, label %._crit_edge.us.new

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.prol.loopexit21
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond27, label %._crit_edge4.us.preheader, label %._crit_edge.us

._crit_edge4.us.preheader:                        ; preds = %._crit_edge11.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.preheader, %._crit_edge6.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge6.us ], [ 0, %._crit_edge4.us.preheader ]
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv13
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %._crit_edge4.us
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv13
  %29 = load double, double* %28, align 8
  %30 = load double, double* %3, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %27, %31
  store double %32, double* %26, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %._crit_edge4.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %._crit_edge4.us ]
  br i1 false, label %._crit_edge6.us, label %._crit_edge4.us.new.preheader

._crit_edge4.us.new.preheader:                    ; preds = %.prol.loopexit
  %.pre28 = load double, double* %26, align 8
  br label %._crit_edge4.us.new

._crit_edge4.us.new:                              ; preds = %._crit_edge4.us.new.preheader, %._crit_edge4.us.new
  %33 = phi double [ %45, %._crit_edge4.us.new ], [ %.pre28, %._crit_edge4.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge4.us.new ], [ %indvars.iv.unr.ph, %._crit_edge4.us.new.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv, i64 %indvars.iv13
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv13
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %39, %44
  store double %45, double* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge6.us.loopexit, label %._crit_edge4.us.new

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge4.us.new
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.prol.loopexit
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond, label %._crit_edge8.loopexit, label %._crit_edge4.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %5
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
  br i1 true, label %.lr.ph10.preheader, label %._crit_edge7.critedge

.lr.ph10.preheader:                               ; preds = %2
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10.preheader, %._crit_edge
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge ], [ 0, %.lr.ph10.preheader ]
  %7 = trunc i64 %indvars.iv12 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %.lr.ph10
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph10, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv12
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond15, label %._crit_edge11, label %.lr.ph10

._crit_edge11:                                    ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge11.._crit_edge7_crit_edge

._crit_edge11.._crit_edge7_crit_edge:             ; preds = %._crit_edge11
  br label %._crit_edge7

.lr.ph.preheader:                                 ; preds = %._crit_edge11
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge4
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge4 ], [ 0, %.lr.ph.preheader ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %._crit_edge4

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.lr.ph, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.lr.ph

._crit_edge7.critedge:                            ; preds = %2
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge7

._crit_edge7.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge11.._crit_edge7_crit_edge, %._crit_edge7.loopexit, %._crit_edge7.critedge
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #5
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
