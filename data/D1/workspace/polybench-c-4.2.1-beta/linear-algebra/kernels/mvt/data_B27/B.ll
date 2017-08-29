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

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to double*
  %19 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %19, double* %18)
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
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph4, label %._crit_edge

.lr.ph4:                                          ; preds = %6
  %7 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us, %.lr.ph4
  %indvars.iv6 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next7, %..loopexit_crit_edge.us ]
  %8 = trunc i64 %indvars.iv6 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %11 = trunc i64 %indvars.iv.next7 to i32
  %12 = icmp eq i32 %11, 2000
  %13 = sitofp i32 %11 to double
  %14 = select i1 %12, double 0.000000e+00, double %13
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv6
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv6, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv6
  %26 = add nuw nsw i64 %indvars.iv6, 4
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 2.000000e+03, double 2.000000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv6
  store double %34, double* %35, align 8
  br i1 false, label %36, label %.prol.loopexit

; <label>:36:                                     ; preds = %.lr.ph.us
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv6, i64 0
  store double %7, double* %37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %36, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph.us ]
  br i1 false, label %..loopexit_crit_edge.us, label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.prol.loopexit
  br label %38

; <label>:38:                                     ; preds = %38, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.new ], [ %indvars.iv.next.1, %38 ]
  %39 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 2000
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, 2000
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fdiv <2 x double> %49, <double 2.000000e+03, double 2.000000e+03>
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %38

..loopexit_crit_edge.us.loopexit:                 ; preds = %38
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %._crit_edge.loopexit, label %.lr.ph.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %..preheader4.us_crit_edge, label %._crit_edge7

..preheader4.us_crit_edge:                        ; preds = %6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %..preheader4.us_crit_edge
  %indvars.iv19 = phi i64 [ 0, %..preheader4.us_crit_edge ], [ %indvars.iv.next20, %._crit_edge10.us ]
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv19
  %.pre = load double, double* %7, align 8
  br i1 false, label %8, label %.prol.loopexit25

; <label>:8:                                      ; preds = %.preheader4.us
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv19, i64 0
  %10 = load double, double* %9, align 8
  %11 = load double, double* %3, align 8
  %12 = fmul double %10, %11
  %13 = fadd double %.pre, %12
  %sunkaddr = ptrtoint double* %1 to i64
  %sunkaddr29 = mul nuw nsw i64 %indvars.iv19, 8
  %sunkaddr30 = add i64 %sunkaddr, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  store double %13, double* %sunkaddr31, align 8
  br label %.prol.loopexit25

.prol.loopexit25:                                 ; preds = %8, %.preheader4.us
  %.unr28.ph = phi double [ %13, %8 ], [ %.pre, %.preheader4.us ]
  %indvars.iv15.unr.ph = phi i64 [ 1, %8 ], [ 0, %.preheader4.us ]
  br i1 false, label %._crit_edge10.us, label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.prol.loopexit25
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader4.us.new
  %15 = phi double [ %.unr28.ph, %.preheader4.us.new ], [ %27, %14 ]
  %indvars.iv15 = phi i64 [ %indvars.iv15.unr.ph, %.preheader4.us.new ], [ %indvars.iv.next16.1, %14 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  %sunkaddr32 = ptrtoint double* %1 to i64
  %sunkaddr33 = mul nuw nsw i64 %indvars.iv19, 8
  %sunkaddr34 = add i64 %sunkaddr32, %sunkaddr33
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to double*
  store double %21, double* %sunkaddr35, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next16
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr35, align 8
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16, 1999
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  br i1 %exitcond18.1, label %._crit_edge10.us.loopexit, label %14

._crit_edge10.us.loopexit:                        ; preds = %14
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.prol.loopexit25
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond22, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv13
  %.pre23 = load double, double* %28, align 8
  br i1 false, label %29, label %.prol.loopexit

; <label>:29:                                     ; preds = %.preheader.us
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv13
  %31 = load double, double* %30, align 8
  %32 = load double, double* %4, align 8
  %33 = fmul double %31, %32
  %34 = fadd double %.pre23, %33
  %sunkaddr36 = ptrtoint double* %2 to i64
  %sunkaddr37 = mul nuw nsw i64 %indvars.iv13, 8
  %sunkaddr38 = add i64 %sunkaddr36, %sunkaddr37
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to double*
  store double %34, double* %sunkaddr39, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %29, %.preheader.us
  %.unr.ph = phi double [ %34, %29 ], [ %.pre23, %.preheader.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %29 ], [ 0, %.preheader.us ]
  br i1 false, label %._crit_edge.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %35

; <label>:35:                                     ; preds = %35, %.preheader.us.new
  %36 = phi double [ %.unr.ph, %.preheader.us.new ], [ %48, %35 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new ], [ %indvars.iv.next.1, %35 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv13
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  %sunkaddr40 = ptrtoint double* %2 to i64
  %sunkaddr41 = mul nuw nsw i64 %indvars.iv13, 8
  %sunkaddr42 = add i64 %sunkaddr40, %sunkaddr41
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  store double %42, double* %sunkaddr43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv13
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %sunkaddr43, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %35

._crit_edge.us.loopexit:                          ; preds = %35
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond21, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %6
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
  br i1 true, label %..lr.ph7_crit_edge, label %._crit_edge.critedge

..lr.ph7_crit_edge:                               ; preds = %3
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7._crit_edge, %..lr.ph7_crit_edge
  %indvars.iv11 = phi i64 [ 0, %..lr.ph7_crit_edge ], [ %indvars.iv.next12, %.lr.ph7._crit_edge ]
  %8 = trunc i64 %indvars.iv11 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph7._crit_edge

; <label>:11:                                     ; preds = %.lr.ph7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %.lr.ph7._crit_edge

.lr.ph7._crit_edge:                               ; preds = %.lr.ph7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv11
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond13, label %._crit_edge8..lr.ph_crit_edge, label %.lr.ph7

._crit_edge8..lr.ph_crit_edge:                    ; preds = %.lr.ph7._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %._crit_edge8..lr.ph_crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge8..lr.ph_crit_edge ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %.lr.ph._crit_edge

; <label>:24:                                     ; preds = %.lr.ph
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %24
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.critedge:                             ; preds = %3
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge.critedge
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #5
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
