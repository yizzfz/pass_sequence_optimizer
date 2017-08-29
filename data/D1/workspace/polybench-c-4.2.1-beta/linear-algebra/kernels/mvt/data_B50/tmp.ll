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
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge1

._crit_edge1:                                     ; preds = %14
  br label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 2000, double* %8, double* %9)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge1, %._crit_edge, %17
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
  br i1 true, label %.lr.ph4, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %6
  br label %._crit_edge

.lr.ph4:                                          ; preds = %6
  %7 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us..lr.ph.us_crit_edge, %.lr.ph4
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph4 ]
  %8 = trunc i64 %indvars.iv5 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %11 = icmp eq i64 %indvars.iv.next6, 2000
  %12 = trunc i64 %indvars.iv.next6 to i32
  %13 = sitofp i32 %12 to double
  %14 = select i1 %11, double 0.000000e+00, double %13
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv5, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  %26 = add nuw nsw i64 %indvars.iv5, 4
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 2.000000e+03, double 2.000000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %34, double* %35, align 8
  br i1 true, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 0
  store double %7, double* %36, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit...loopexit_crit_edge.us_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit...loopexit_crit_edge.us_crit_edge: ; preds = %.prol.loopexit
  br label %..loopexit_crit_edge.us

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %37 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 2000
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %40, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  %48 = fdiv <2 x double> %47, <double 2.000000e+03, double 2.000000e+03>
  %49 = bitcast double* %41 to <2 x double>*
  store <2 x double> %48, <2 x double>* %49, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %.prol.loopexit...loopexit_crit_edge.us_crit_edge, %..loopexit_crit_edge.us.loopexit
  br i1 %11, label %._crit_edge.loopexit, label %..loopexit_crit_edge.us..lr.ph.us_crit_edge

..loopexit_crit_edge.us..lr.ph.us_crit_edge:      ; preds = %..loopexit_crit_edge.us
  br label %.lr.ph.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader4.us.preheader, label %.._crit_edge7_crit_edge

.._crit_edge7_crit_edge:                          ; preds = %6
  br label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge10.us..preheader4.us_crit_edge ], [ 0, %.preheader4.us.preheader ]
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv23
  br i1 true, label %.preheader4.us..prol.loopexit20_crit_edge, label %.prol.preheader19

.preheader4.us..prol.loopexit20_crit_edge:        ; preds = %.preheader4.us
  br label %.prol.loopexit20

.prol.preheader19:                                ; preds = %.preheader4.us
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 0
  %10 = load double, double* %9, align 8
  %11 = load double, double* %3, align 8
  %12 = fmul double %10, %11
  %13 = fadd double %8, %12
  store double %13, double* %7, align 8
  br label %.prol.loopexit20

.prol.loopexit20:                                 ; preds = %.preheader4.us..prol.loopexit20_crit_edge, %.prol.preheader19
  %indvars.iv15.unr.ph = phi i64 [ 1, %.prol.preheader19 ], [ 0, %.preheader4.us..prol.loopexit20_crit_edge ]
  br i1 false, label %.prol.loopexit20.._crit_edge10.us_crit_edge, label %.preheader4.us.new.preheader

.prol.loopexit20.._crit_edge10.us_crit_edge:      ; preds = %.prol.loopexit20
  br label %._crit_edge10.us

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit20
  %.pre = load double, double* %7, align 8
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new..preheader4.us.new_crit_edge, %.preheader4.us.new.preheader
  %14 = phi double [ %26, %.preheader4.us.new..preheader4.us.new_crit_edge ], [ %.pre, %.preheader4.us.new.preheader ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.preheader4.us.new..preheader4.us.new_crit_edge ], [ %indvars.iv15.unr.ph, %.preheader4.us.new.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv15
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  store double %20, double* %7, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv.next16
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %20, %25
  store double %26, double* %7, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, 2000
  br i1 %exitcond18.1, label %._crit_edge10.us.loopexit, label %.preheader4.us.new..preheader4.us.new_crit_edge

.preheader4.us.new..preheader4.us.new_crit_edge:  ; preds = %.preheader4.us.new
  br label %.preheader4.us.new

._crit_edge10.us.loopexit:                        ; preds = %.preheader4.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %.prol.loopexit20.._crit_edge10.us_crit_edge, %._crit_edge10.us.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond26, label %.preheader.us.preheader, label %._crit_edge10.us..preheader4.us_crit_edge

._crit_edge10.us..preheader4.us_crit_edge:        ; preds = %._crit_edge10.us
  br label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv12
  br i1 true, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv12
  %30 = load double, double* %29, align 8
  %31 = load double, double* %4, align 8
  %32 = fmul double %30, %31
  %33 = fadd double %28, %32
  store double %33, double* %27, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %.pre27 = load double, double* %27, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %34 = phi double [ %46, %.preheader.us.new..preheader.us.new_crit_edge ], [ %.pre27, %.preheader.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv12
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv12
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %27, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond, label %._crit_edge7.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.._crit_edge7_crit_edge, %._crit_edge7.loopexit
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
  br i1 true, label %.lr.ph7.preheader, label %._crit_edge.critedge

.lr.ph7.preheader:                                ; preds = %3
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %..lr.ph7_crit_edge, %.lr.ph7.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %..lr.ph7_crit_edge ], [ 0, %.lr.ph7.preheader ]
  %8 = trunc i64 %indvars.iv9 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph7._crit_edge

.lr.ph7._crit_edge:                               ; preds = %.lr.ph7
  br label %13

; <label>:11:                                     ; preds = %.lr.ph7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %.lr.ph7._crit_edge, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond12, label %._crit_edge8, label %..lr.ph7_crit_edge

..lr.ph7_crit_edge:                               ; preds = %13
  br label %.lr.ph7

._crit_edge8:                                     ; preds = %13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge8.._crit_edge_crit_edge

._crit_edge8.._crit_edge_crit_edge:               ; preds = %._crit_edge8
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge8
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %22 = trunc i64 %indvars.iv to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  br label %27

; <label>:25:                                     ; preds = %.lr.ph
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %27

; <label>:27:                                     ; preds = %.lr.ph._crit_edge, %25
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %27
  br label %.lr.ph

._crit_edge.critedge:                             ; preds = %3
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %27
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8.._crit_edge_crit_edge, %._crit_edge.loopexit, %._crit_edge.critedge
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
