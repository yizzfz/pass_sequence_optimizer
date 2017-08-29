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
  br i1 true, label %.lr.ph2, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %6
  br label %._crit_edge

.lr.ph2:                                          ; preds = %6
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us..lr.ph.us_crit_edge, %.lr.ph2
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph2 ]
  %7 = trunc i64 %indvars.iv5 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %10 = icmp eq i64 %indvars.iv.next6, 2000
  %11 = trunc i64 %indvars.iv.next6 to i32
  %12 = sitofp i32 %11 to double
  %13 = select i1 %10, double 0.000000e+00, double %12
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  store double %17, double* %9, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %indvars.iv5, 3
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2000
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  %25 = add nuw nsw i64 %indvars.iv5, 4
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 2000
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 2.000000e+03, double 2.000000e+03>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  store double %32, double* %24, align 8
  %34 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %33, double* %34, align 8
  br i1 true, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 0
  store double 0.000000e+00, double* %35, align 8
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
  %36 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
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
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %.prol.loopexit...loopexit_crit_edge.us_crit_edge, %..loopexit_crit_edge.us.loopexit
  br i1 %10, label %._crit_edge.loopexit, label %..loopexit_crit_edge.us..lr.ph.us_crit_edge

..loopexit_crit_edge.us..lr.ph.us_crit_edge:      ; preds = %..loopexit_crit_edge.us
  br label %.lr.ph.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double*, double*, [2000 x double]*) unnamed_addr #2 {
  %7 = alloca double*, align 8
  %8 = alloca [2000 x double]*, align 8
  store double* %4, double** %7, align 8
  store [2000 x double]* %5, [2000 x double]** %8, align 8
  br i1 true, label %.preheader5.lr.ph, label %.._crit_edge7_crit_edge

.._crit_edge7_crit_edge:                          ; preds = %6
  br label %._crit_edge7

.preheader5.lr.ph:                                ; preds = %6
  %sunkaddr35 = ptrtoint double* %1 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge11.us..preheader5.us_crit_edge, %.preheader5.lr.ph
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge11.us..preheader5.us_crit_edge ], [ 0, %.preheader5.lr.ph ]
  br i1 true, label %.preheader5.us..prol.loopexit29_crit_edge, label %.prol.preheader28

.preheader5.us..prol.loopexit29_crit_edge:        ; preds = %.preheader5.us
  br label %.prol.loopexit29

.prol.preheader28:                                ; preds = %.preheader5.us
  %sunkaddr32 = shl i64 %indvars.iv24, 3
  %sunkaddr33 = add i64 %sunkaddr35, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %9 = load double, double* %sunkaddr34, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv24, i64 0
  %11 = load double, double* %10, align 8
  %12 = load double, double* %3, align 8
  %13 = fmul double %11, %12
  %14 = fadd double %9, %13
  store double %14, double* %sunkaddr34, align 8
  br label %.prol.loopexit29

.prol.loopexit29:                                 ; preds = %.preheader5.us..prol.loopexit29_crit_edge, %.prol.preheader28
  %indvars.iv20.unr.ph = phi i64 [ 1, %.prol.preheader28 ], [ 0, %.preheader5.us..prol.loopexit29_crit_edge ]
  br i1 false, label %.prol.loopexit29.._crit_edge11.us_crit_edge, label %.preheader5.us.new.preheader

.prol.loopexit29.._crit_edge11.us_crit_edge:      ; preds = %.prol.loopexit29
  br label %._crit_edge11.us

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit29
  %sunkaddr36 = shl i64 %indvars.iv24, 3
  %sunkaddr37 = add i64 %sunkaddr35, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  %.pre = load double, double* %sunkaddr38, align 8
  br label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %.preheader5.us.new..preheader5.us.new_crit_edge, %.preheader5.us.new.preheader
  %15 = phi double [ %27, %.preheader5.us.new..preheader5.us.new_crit_edge ], [ %.pre, %.preheader5.us.new.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %.preheader5.us.new..preheader5.us.new_crit_edge ], [ %indvars.iv20.unr.ph, %.preheader5.us.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv20
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv20
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %sunkaddr38, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next21
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr38, align 8
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next21.1, 2000
  br i1 %exitcond23.1, label %._crit_edge11.us.loopexit, label %.preheader5.us.new..preheader5.us.new_crit_edge

.preheader5.us.new..preheader5.us.new_crit_edge:  ; preds = %.preheader5.us.new
  br label %.preheader5.us.new

._crit_edge11.us.loopexit:                        ; preds = %.preheader5.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %.prol.loopexit29.._crit_edge11.us_crit_edge, %._crit_edge11.us.loopexit
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond27, label %.preheader.lr.ph, label %._crit_edge11.us..preheader5.us_crit_edge

._crit_edge11.us..preheader5.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %.preheader5.us

.preheader.lr.ph:                                 ; preds = %._crit_edge11.us
  %28 = load [2000 x double]*, [2000 x double]** %8, align 8
  %29 = load double*, double** %7, align 8
  %sunkaddr43 = ptrtoint double* %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  br i1 true, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %sunkaddr40 = shl nuw nsw i64 %indvars.iv16, 3
  %sunkaddr41 = add i64 %sunkaddr43, %sunkaddr40
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  %30 = load double, double* %sunkaddr42, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %28, i64 0, i64 %indvars.iv16
  %32 = load double, double* %31, align 8
  %33 = load double, double* %29, align 8
  %34 = fmul double %32, %33
  %35 = fadd double %30, %34
  store double %35, double* %sunkaddr42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %sunkaddr44 = shl nuw nsw i64 %indvars.iv16, 3
  %sunkaddr45 = add i64 %sunkaddr43, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %.pre47 = load double, double* %sunkaddr46, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %36 = phi double [ %48, %.preheader.us.new..preheader.us.new_crit_edge ], [ %.pre47, %.preheader.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %28, i64 %indvars.iv, i64 %indvars.iv16
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds double, double* %29, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %sunkaddr46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %28, i64 %indvars.iv.next, i64 %indvars.iv16
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %29, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %sunkaddr46, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond19, label %._crit_edge7.loopexit, label %._crit_edge.us..preheader.us_crit_edge

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
  br i1 true, label %.lr.ph6.preheader, label %._crit_edge.critedge

.lr.ph6.preheader:                                ; preds = %3
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %..lr.ph6_crit_edge, %.lr.ph6.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %..lr.ph6_crit_edge ], [ 0, %.lr.ph6.preheader ]
  %8 = trunc i64 %indvars.iv9 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph6._crit_edge

.lr.ph6._crit_edge:                               ; preds = %.lr.ph6
  br label %13

; <label>:11:                                     ; preds = %.lr.ph6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %.lr.ph6._crit_edge, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond12, label %._crit_edge7, label %..lr.ph6_crit_edge

..lr.ph6_crit_edge:                               ; preds = %13
  br label %.lr.ph6

._crit_edge7:                                     ; preds = %13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge7.._crit_edge_crit_edge

._crit_edge7.._crit_edge_crit_edge:               ; preds = %._crit_edge7
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge7
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

._crit_edge:                                      ; preds = %._crit_edge7.._crit_edge_crit_edge, %._crit_edge.loopexit, %._crit_edge.critedge
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
