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
  br i1 true, label %.lr.ph28.split.preheader, label %._crit_edge

.lr.ph28.split.preheader:                         ; preds = %6
  br label %.lr.ph28.split

.loopexit.loopexit:                               ; preds = %.lr.ph28.split.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.prol.loopexit
  %exitcond30 = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond30, label %._crit_edge.loopexit, label %.lr.ph28.split

.lr.ph28.split:                                   ; preds = %.loopexit, %.lr.ph28.split.preheader
  %indvars.iv2327 = phi i64 [ %indvars.iv.next24, %.loopexit ], [ 0, %.lr.ph28.split.preheader ]
  %7 = trunc i64 %indvars.iv2327 to i32
  %8 = srem i32 %7, 2000
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv2327
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2327, 1
  %11 = trunc i64 %indvars.iv.next24 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  store double %17, double* %10, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv2327
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %indvars.iv2327, 3
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2000
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv2327
  %25 = add nuw nsw i64 %indvars.iv2327, 4
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 2000
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 2.000000e+03, double 2.000000e+03>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  store double %32, double* %24, align 8
  %34 = getelementptr inbounds double, double* %4, i64 %indvars.iv2327
  store double %33, double* %34, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph28.split
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph28.split
  %indvars.iv26.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph28.split ]
  br i1 false, label %.loopexit, label %.lr.ph28.split.new.preheader

.lr.ph28.split.new.preheader:                     ; preds = %.prol.loopexit
  br label %.lr.ph28.split.new

.lr.ph28.split.new:                               ; preds = %.lr.ph28.split.new.preheader, %.lr.ph28.split.new
  %indvars.iv26 = phi i64 [ %indvars.iv.next.1, %.lr.ph28.split.new ], [ %indvars.iv26.unr.ph, %.lr.ph28.split.new.preheader ]
  %35 = mul nuw nsw i64 %indvars.iv26, %indvars.iv2327
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv2327, i64 %indvars.iv26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv26, 1
  %40 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2327
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 2000
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %38, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fdiv <2 x double> %45, <double 2.000000e+03, double 2.000000e+03>
  %47 = bitcast double* %39 to <2 x double>*
  store <2 x double> %46, <2 x double>* %47, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv26, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit.loopexit, label %.lr.ph28.split.new

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader27.preheader.preheader, label %.preheader26._crit_edge

.preheader27.preheader.preheader:                 ; preds = %6
  br label %.preheader27.preheader

.preheader27.preheader:                           ; preds = %.preheader27._crit_edge, %.preheader27.preheader.preheader
  %indvars.iv3443 = phi i64 [ %indvars.iv.next35, %.preheader27._crit_edge ], [ 0, %.preheader27.preheader.preheader ]
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv3443
  br i1 true, label %.preheader27.prol.loopexit, label %.preheader27.prol

.preheader27.prol:                                ; preds = %.preheader27.preheader
  br label %.preheader27.prol.loopexit

.preheader27.prol.loopexit:                       ; preds = %.preheader27.prol, %.preheader27.preheader
  %indvars.iv3041.unr.ph = phi i64 [ 1, %.preheader27.prol ], [ 0, %.preheader27.preheader ]
  br i1 false, label %.preheader27._crit_edge, label %.preheader27.preheader54

.preheader27.preheader54:                         ; preds = %.preheader27.prol.loopexit
  %.pre = load double, double* %7, align 8
  br label %.preheader27

.preheader27:                                     ; preds = %.preheader27.preheader54, %.preheader27
  %8 = phi double [ %20, %.preheader27 ], [ %.pre, %.preheader27.preheader54 ]
  %indvars.iv3041 = phi i64 [ %indvars.iv.next31.1, %.preheader27 ], [ %indvars.iv3041.unr.ph, %.preheader27.preheader54 ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv3443, i64 %indvars.iv3041
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv3041
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %8, %13
  store double %14, double* %7, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3041, 1
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv3443, i64 %indvars.iv.next31
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next31
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  store double %20, double* %7, align 8
  %indvars.iv.next31.1 = add nuw nsw i64 %indvars.iv3041, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, 2000
  br i1 %exitcond33.1, label %.preheader27._crit_edge.loopexit, label %.preheader27

.preheader27._crit_edge.loopexit:                 ; preds = %.preheader27
  br label %.preheader27._crit_edge

.preheader27._crit_edge:                          ; preds = %.preheader27._crit_edge.loopexit, %.preheader27.prol.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3443, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond48, label %.preheader.preheader.preheader, label %.preheader27.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader27._crit_edge
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader26
  %indvars.iv2838 = phi i64 [ %indvars.iv.next29, %.preheader26 ], [ 0, %.preheader.preheader.preheader ]
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv2838
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv37.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 false, label %.preheader26, label %.preheader.preheader53

.preheader.preheader53:                           ; preds = %.preheader.prol.loopexit
  %.pre55 = load double, double* %21, align 8
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader53, %.preheader
  %22 = phi double [ %34, %.preheader ], [ %.pre55, %.preheader.preheader53 ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv37.unr.ph, %.preheader.preheader53 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv2838
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv37
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv37, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv2838
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %21, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.preheader26.loopexit, label %.preheader

.preheader26.loopexit:                            ; preds = %.preheader
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv2838, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond47, label %.preheader26._crit_edge.loopexit, label %.preheader.preheader

.preheader26._crit_edge.loopexit:                 ; preds = %.preheader26
  br label %.preheader26._crit_edge

.preheader26._crit_edge:                          ; preds = %.preheader26._crit_edge.loopexit, %6
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
  br i1 true, label %.lr.ph18.preheader, label %._crit_edge.critedge

.lr.ph18.preheader:                               ; preds = %3
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %.lr.ph18.preheader, %13
  %indvars.iv1316 = phi i64 [ %indvars.iv.next14, %13 ], [ 0, %.lr.ph18.preheader ]
  %8 = trunc i64 %indvars.iv1316 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph18
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %.lr.ph18, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv1316
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1316, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond20, label %._crit_edge19, label %.lr.ph18

._crit_edge19:                                    ; preds = %13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge19.._crit_edge_crit_edge

._crit_edge19.._crit_edge_crit_edge:              ; preds = %._crit_edge19
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge19
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %27
  %indvars.iv15 = phi i64 [ %indvars.iv.next, %27 ], [ 0, %.lr.ph.preheader ]
  %22 = trunc i64 %indvars.iv15 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %.lr.ph
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %27

; <label>:27:                                     ; preds = %.lr.ph, %25
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv15
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.critedge:                             ; preds = %3
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %27
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19.._crit_edge_crit_edge, %._crit_edge.loopexit, %._crit_edge.critedge
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
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
