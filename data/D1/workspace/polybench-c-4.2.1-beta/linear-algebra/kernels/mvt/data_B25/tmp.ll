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
  tail call fastcc void @init_array(i32 2000, double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(i32 2000, double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
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
  tail call fastcc void @print_array(i32 2000, double* %8, double* %9)
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
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph7.split.preheader, label %._crit_edge

.lr.ph7.split.preheader:                          ; preds = %6
  %7 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph7.split

.loopexit.loopexit:                               ; preds = %.lr.ph7.split.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.prol.loopexit.unr-lcssa
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph7.split

.lr.ph7.split:                                    ; preds = %.loopexit, %.lr.ph7.split.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.loopexit ], [ 0, %.lr.ph7.split.preheader ]
  %8 = trunc i64 %indvars.iv26 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv26
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %12 = trunc i64 %indvars.iv.next3 to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %11, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv26
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv26, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv26
  %26 = add nuw nsw i64 %indvars.iv26, 4
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 2.000000e+03, double 2.000000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv26
  store double %34, double* %35, align 8
  br i1 true, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph7.split
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv26, i64 0
  store double %7, double* %36, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph7.split, %.prol.preheader
  %indvars.iv5.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph7.split ]
  br i1 false, label %.loopexit, label %.lr.ph7.split.new.preheader

.lr.ph7.split.new.preheader:                      ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph7.split.new

.lr.ph7.split.new:                                ; preds = %.lr.ph7.split.new.preheader, %.lr.ph7.split.new
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %.lr.ph7.split.new ], [ %indvars.iv5.unr.ph, %.lr.ph7.split.new.preheader ]
  %37 = mul nuw nsw i64 %indvars.iv5, %indvars.iv26
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %42 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv26
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 2000
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %40, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  %48 = fdiv <2 x double> %47, <double 2.000000e+03, double 2.000000e+03>
  %49 = bitcast double* %41 to <2 x double>*
  store <2 x double> %48, <2 x double>* %49, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit.loopexit, label %.lr.ph7.split.new

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader12.preheader, label %._crit_edge17

.preheader12.preheader:                           ; preds = %6
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge21, %.preheader12.preheader
  %indvars.iv922 = phi i64 [ %indvars.iv.next10, %._crit_edge21 ], [ 0, %.preheader12.preheader ]
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv922
  br i1 true, label %.prol.loopexit27.unr-lcssa, label %.prol.preheader26

.prol.preheader26:                                ; preds = %.preheader12
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv922, i64 0
  %10 = load double, double* %9, align 8
  %11 = load double, double* %3, align 8
  %12 = fmul double %10, %11
  %13 = fadd double %8, %12
  store double %13, double* %7, align 8
  br label %.prol.loopexit27.unr-lcssa

.prol.loopexit27.unr-lcssa:                       ; preds = %.preheader12, %.prol.preheader26
  %indvars.iv519.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.preheader12 ]
  br i1 false, label %._crit_edge21, label %.preheader12.new

.preheader12.new:                                 ; preds = %.prol.loopexit27.unr-lcssa
  %.pre = load double, double* %7, align 8
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader12.new
  %15 = phi double [ %.pre, %.preheader12.new ], [ %27, %14 ]
  %indvars.iv519 = phi i64 [ %indvars.iv519.unr.ph, %.preheader12.new ], [ %indvars.iv.next6.1, %14 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv922, i64 %indvars.iv519
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv519
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %7, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv519, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv922, i64 %indvars.iv.next6
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %7, align 8
  %indvars.iv.next6.1 = add nuw nsw i64 %indvars.iv519, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next6.1, 2000
  br i1 %exitcond8.1, label %._crit_edge21.loopexit, label %14

._crit_edge21.loopexit:                           ; preds = %14
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.prol.loopexit27.unr-lcssa
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv922, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond30, label %.preheader.preheader, label %.preheader12

.preheader.preheader:                             ; preds = %._crit_edge21
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv315 = phi i64 [ %indvars.iv.next4, %._crit_edge ], [ 0, %.preheader.preheader ]
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv315
  br i1 true, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv315
  %31 = load double, double* %30, align 8
  %32 = load double, double* %4, align 8
  %33 = fmul double %31, %32
  %34 = fadd double %29, %33
  store double %34, double* %28, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader, %.prol.preheader
  %indvars.iv14.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader ]
  br i1 false, label %._crit_edge, label %.preheader.new

.preheader.new:                                   ; preds = %.prol.loopexit.unr-lcssa
  %.pre31 = load double, double* %28, align 8
  br label %35

; <label>:35:                                     ; preds = %35, %.preheader.new
  %36 = phi double [ %.pre31, %.preheader.new ], [ %48, %35 ]
  %indvars.iv14 = phi i64 [ %indvars.iv14.unr.ph, %.preheader.new ], [ %indvars.iv.next.1, %35 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv14, i64 %indvars.iv315
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds double, double* %4, i64 %indvars.iv14
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv315
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv14, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %35

._crit_edge.loopexit:                             ; preds = %35
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit.unr-lcssa
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv315, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.preheader

._crit_edge17.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph9.preheader, label %._crit_edge.critedge

.lr.ph9.preheader:                                ; preds = %3
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %13
  %indvars.iv17 = phi i64 [ %indvars.iv.next2, %13 ], [ 0, %.lr.ph9.preheader ]
  %8 = trunc i64 %indvars.iv17 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc5 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %.lr.ph9, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv17
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond11, label %._crit_edge10, label %.lr.ph9

._crit_edge10:                                    ; preds = %13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge10, %27
  %indvars.iv6 = phi i64 [ %indvars.iv.next, %27 ], [ 0, %._crit_edge10 ]
  %22 = trunc i64 %indvars.iv6 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %.lr.ph
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %27

; <label>:27:                                     ; preds = %.lr.ph, %25
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv6
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.critedge:                             ; preds = %3
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %27
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge.critedge
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
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
