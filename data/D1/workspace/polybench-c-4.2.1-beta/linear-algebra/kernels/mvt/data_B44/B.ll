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
  br i1 true, label %.lr.ph37, label %.._crit_edge38_crit_edge

.._crit_edge38_crit_edge:                         ; preds = %5
  br label %._crit_edge38

.lr.ph37:                                         ; preds = %5
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.._crit_edge_crit_edge.us, %.lr.ph37
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %.._crit_edge_crit_edge.us ], [ 0, %.lr.ph37 ]
  %6 = trunc i64 %indvars.iv39 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %0, i64 %indvars.iv39
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %9 = icmp eq i64 %indvars.iv.next40, 2000
  %10 = trunc i64 %indvars.iv.next40 to i32
  %11 = sitofp i32 %10 to double
  %12 = select i1 %9, double 0.000000e+00, double %11
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 2.000000e+03, double 2.000000e+03>
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  store double %16, double* %8, align 8
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv39
  store double %17, double* %18, align 8
  %19 = add nuw nsw i64 %indvars.iv39, 3
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 2000
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv39
  %24 = add nuw nsw i64 %indvars.iv39, 4
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2000
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 2.000000e+03, double 2.000000e+03>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  store double %31, double* %23, align 8
  %33 = getelementptr inbounds double, double* %3, i64 %indvars.iv39
  store double %32, double* %33, align 8
  br label %.prol.loopexit

.prol.preheader:                                  ; No predecessors!
  unreachable

.prol.loopexit:                                   ; preds = %.lr.ph.us
  br i1 false, label %.prol.loopexit..._crit_edge_crit_edge.us_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit..._crit_edge_crit_edge.us_crit_edge: ; preds = %.prol.loopexit
  br label %.._crit_edge_crit_edge.us

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ 0, %.lr.ph.us.new.preheader ]
  %34 = mul nuw nsw i64 %indvars.iv, %indvars.iv39
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %39 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv39
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
  br i1 %exitcond.1, label %.._crit_edge_crit_edge.us.loopexit, label %.lr.ph.us.new

.._crit_edge_crit_edge.us.loopexit:               ; preds = %.lr.ph.us.new
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %.prol.loopexit..._crit_edge_crit_edge.us_crit_edge, %.._crit_edge_crit_edge.us.loopexit
  br i1 %9, label %._crit_edge38.loopexit, label %.lr.ph.us

._crit_edge38.loopexit:                           ; preds = %.._crit_edge_crit_edge.us
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %.._crit_edge38_crit_edge, %._crit_edge38.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %._crit_edge.us.preheader, label %.._crit_edge36_crit_edge

.._crit_edge36_crit_edge:                         ; preds = %5
  br label %._crit_edge36

._crit_edge.us.preheader:                         ; preds = %5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge39.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge39.us ], [ 0, %._crit_edge.us.preheader ]
  %6 = getelementptr inbounds double, double* %0, i64 %indvars.iv52
  br label %.prol.loopexit49

.prol.preheader48:                                ; No predecessors!
  unreachable

.prol.loopexit49:                                 ; preds = %._crit_edge.us
  br i1 false, label %.prol.loopexit49.._crit_edge39.us_crit_edge, label %._crit_edge.us.new.preheader

.prol.loopexit49.._crit_edge39.us_crit_edge:      ; preds = %.prol.loopexit49
  br label %._crit_edge39.us

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit49
  %.pre = load double, double* %6, align 8
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %7 = phi double [ %19, %._crit_edge.us.new ], [ %.pre, %._crit_edge.us.new.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %._crit_edge.us.new ], [ 0, %._crit_edge.us.new.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv44
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fadd double %7, %12
  store double %13, double* %6, align 8
  %indvars.iv.next45 = or i64 %indvars.iv44, 1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next45
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next45
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %6, align 8
  %indvars.iv.next45.1 = add nuw nsw i64 %indvars.iv44, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next45.1, 2000
  br i1 %exitcond47.1, label %._crit_edge39.us.loopexit, label %._crit_edge.us.new

._crit_edge39.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %.prol.loopexit49.._crit_edge39.us_crit_edge, %._crit_edge39.us.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond55, label %._crit_edge32.us.preheader, label %._crit_edge.us

._crit_edge32.us.preheader:                       ; preds = %._crit_edge39.us
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.preheader, %._crit_edge34.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge34.us ], [ 0, %._crit_edge32.us.preheader ]
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv41
  br label %.prol.loopexit

.prol.preheader:                                  ; No predecessors!
  unreachable

.prol.loopexit:                                   ; preds = %._crit_edge32.us
  br i1 false, label %.prol.loopexit.._crit_edge34.us_crit_edge, label %._crit_edge32.us.new.preheader

.prol.loopexit.._crit_edge34.us_crit_edge:        ; preds = %.prol.loopexit
  br label %._crit_edge34.us

._crit_edge32.us.new.preheader:                   ; preds = %.prol.loopexit
  %.pre56 = load double, double* %20, align 8
  br label %._crit_edge32.us.new

._crit_edge32.us.new:                             ; preds = %._crit_edge32.us.new.preheader, %._crit_edge32.us.new
  %21 = phi double [ %33, %._crit_edge32.us.new ], [ %.pre56, %._crit_edge32.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge32.us.new ], [ 0, %._crit_edge32.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv, i64 %indvars.iv41
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %20, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv41
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %27, %32
  store double %33, double* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge34.us.loopexit, label %._crit_edge32.us.new

._crit_edge34.us.loopexit:                        ; preds = %._crit_edge32.us.new
  br label %._crit_edge34.us

._crit_edge34.us:                                 ; preds = %.prol.loopexit.._crit_edge34.us_crit_edge, %._crit_edge34.us.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 2000
  br i1 %exitcond, label %._crit_edge36.loopexit, label %._crit_edge32.us

._crit_edge36.loopexit:                           ; preds = %._crit_edge34.us
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %.._crit_edge36_crit_edge, %._crit_edge36.loopexit
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
  br i1 true, label %.lr.ph20.preheader, label %._crit_edge17.critedge

.lr.ph20.preheader:                               ; preds = %2
  br label %.lr.ph20

.lr.ph20:                                         ; preds = %.lr.ph20.preheader, %._crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge ], [ 0, %.lr.ph20.preheader ]
  %7 = trunc i64 %indvars.iv22 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %.lr.ph20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc13 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph20, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv22
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond25, label %._crit_edge21, label %.lr.ph20

._crit_edge21:                                    ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge21.._crit_edge17_crit_edge

._crit_edge21.._crit_edge17_crit_edge:            ; preds = %._crit_edge21
  br label %._crit_edge17

.lr.ph.preheader:                                 ; preds = %._crit_edge21
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge14
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge14 ], [ 0, %.lr.ph.preheader ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %._crit_edge14

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.lr.ph, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.lr.ph

._crit_edge17.critedge:                           ; preds = %2
  br label %._crit_edge17

._crit_edge17.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge21.._crit_edge17_crit_edge, %._crit_edge17.loopexit, %._crit_edge17.critedge
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
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
