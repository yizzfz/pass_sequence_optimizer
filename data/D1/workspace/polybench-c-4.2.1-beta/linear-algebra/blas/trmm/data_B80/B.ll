; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %42, %5
  %indvars.iv13 = phi i64 [ 0, %5 ], [ %indvars.iv.next14, %42 ]
  %6 = add i64 %indvars.iv13, 4294967295
  %7 = icmp sgt i64 %indvars.iv13, 0
  br i1 %7, label %.lr.ph, label %._crit_edge._crit_edge

.lr.ph:                                           ; preds = %._crit_edge.preheader
  %xtraiter15 = and i64 %indvars.iv13, 1
  %lcmp.mod = icmp eq i64 %xtraiter15, 0
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit, label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %.lr.ph
  %8 = trunc i64 %indvars.iv13 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv13, i64 0
  store double %11, double* %12, align 8
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.lr.ph ]
  %13 = trunc i64 %6 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge._crit_edge, label %._crit_edge.preheader18

._crit_edge.preheader18:                          ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader18, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge ], [ %indvars.iv.unr.ph, %._crit_edge.preheader18 ]
  %15 = add nuw nsw i64 %indvars.iv, %indvars.iv13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv
  store double %19, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = add nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1000
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %25, double* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv13
  br i1 %exitcond.1, label %._crit_edge._crit_edge.loopexit, label %._crit_edge

._crit_edge._crit_edge.loopexit:                  ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge._crit_edge.loopexit, %._crit_edge.prol.loopexit, %._crit_edge.preheader
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv13
  store double 1.000000e+00, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv13, 1200
  br label %29

; <label>:29:                                     ; preds = %29, %._crit_edge._crit_edge
  %indvars.iv8 = phi i64 [ 0, %._crit_edge._crit_edge ], [ %indvars.iv.next9.1, %29 ]
  %30 = sub nuw nsw i64 %28, %indvars.iv8
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 1200
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.200000e+03
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv8
  store double %34, double* %35, align 8
  %indvars.iv.next9 = or i64 %indvars.iv8, 1
  %36 = sub nuw nsw i64 %28, %indvars.iv.next9
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 1200
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 1.200000e+03
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv.next9
  store double %40, double* %41, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %exitcond.110 = icmp eq i64 %indvars.iv.next9.1, 1200
  br i1 %exitcond.110, label %42, label %29

; <label>:42:                                     ; preds = %29
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond, label %43, label %._crit_edge.preheader

; <label>:43:                                     ; preds = %42
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge4.loopexit.loopexit:                   ; preds = %._crit_edge3._crit_edge.us
  br label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge4.loopexit.loopexit, %._crit_edge3.preheader.._crit_edge4.loopexit_crit_edge
  %indvars.iv.next10.pre-phi = phi i64 [ %.pre22, %._crit_edge3.preheader.._crit_edge4.loopexit_crit_edge ], [ %indvars.iv.next12.prol, %._crit_edge4.loopexit.loopexit ]
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %49, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4.loopexit, %5
  %indvars.iv15 = phi i64 [ 0, %5 ], [ %indvars.iv.next16, %._crit_edge4.loopexit ]
  %indvars.iv9 = phi i64 [ 1, %5 ], [ %indvars.iv.next10.pre-phi, %._crit_edge4.loopexit ]
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %6 = icmp slt i64 %indvars.iv.next16, 1000
  br i1 %6, label %._crit_edge3.preheader.us.preheader, label %._crit_edge3.preheader.preheader

._crit_edge3.preheader.preheader:                 ; preds = %._crit_edge.preheader
  br label %._crit_edge3.preheader

._crit_edge3.preheader.us.preheader:              ; preds = %._crit_edge.preheader
  %7 = sub i64 998, %indvars.iv15
  %8 = sub i64 999, %indvars.iv15
  %xtraiter18 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %xtraiter18, 0
  %9 = trunc i64 %7 to i32
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv15
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv9, 1
  br label %._crit_edge3.preheader.us

._crit_edge3.preheader.us:                        ; preds = %._crit_edge3.preheader.us.preheader, %._crit_edge3._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge3._crit_edge.us ], [ 0, %._crit_edge3.preheader.us.preheader ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv13
  br i1 %lcmp.mod, label %._crit_edge3.us.prol.loopexit, label %._crit_edge3.us.prol

._crit_edge3.us.prol:                             ; preds = %._crit_edge3.preheader.us
  %13 = load double, double* %11, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv13
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = load double, double* %12, align 8
  %18 = fadd double %17, %16
  store double %18, double* %12, align 8
  br label %._crit_edge3.us.prol.loopexit

._crit_edge3.us.prol.loopexit:                    ; preds = %._crit_edge3.us.prol, %._crit_edge3.preheader.us
  %indvars.iv11.unr.ph = phi i64 [ %indvars.iv.next12.prol, %._crit_edge3.us.prol ], [ %indvars.iv9, %._crit_edge3.preheader.us ]
  br i1 %10, label %._crit_edge3.us.prol.loopexit.._crit_edge3._crit_edge.us_crit_edge, label %._crit_edge3.us.prol.loopexit.._crit_edge3.us_crit_edge

._crit_edge3.us.prol.loopexit.._crit_edge3._crit_edge.us_crit_edge: ; preds = %._crit_edge3.us.prol.loopexit
  %.pre21 = load double, double* %12, align 8
  br label %._crit_edge3._crit_edge.us

._crit_edge3.us.prol.loopexit.._crit_edge3.us_crit_edge: ; preds = %._crit_edge3.us.prol.loopexit
  %.pre = load double, double* %12, align 8
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.prol.loopexit.._crit_edge3.us_crit_edge, %._crit_edge3.us
  %19 = phi double [ %31, %._crit_edge3.us ], [ %.pre, %._crit_edge3.us.prol.loopexit.._crit_edge3.us_crit_edge ]
  %indvars.iv11 = phi i64 [ %indvars.iv.next12.1, %._crit_edge3.us ], [ %indvars.iv11.unr.ph, %._crit_edge3.us.prol.loopexit.._crit_edge3.us_crit_edge ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv15
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv11, i64 %indvars.iv13
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next12, i64 %indvars.iv15
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next12, i64 %indvars.iv13
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next12.1, 1000
  br i1 %exitcond.1, label %._crit_edge3._crit_edge.us.loopexit, label %._crit_edge3.us

._crit_edge3._crit_edge.us.loopexit:              ; preds = %._crit_edge3.us
  br label %._crit_edge3._crit_edge.us

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge3._crit_edge.us.loopexit, %._crit_edge3.us.prol.loopexit.._crit_edge3._crit_edge.us_crit_edge
  %32 = phi double [ %.pre21, %._crit_edge3.us.prol.loopexit.._crit_edge3._crit_edge.us_crit_edge ], [ %31, %._crit_edge3._crit_edge.us.loopexit ]
  %33 = fmul double %32, %2
  store double %33, double* %12, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond, label %._crit_edge4.loopexit.loopexit, label %._crit_edge3.preheader.us

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.preheader, %._crit_edge3.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.4, %._crit_edge3.preheader ], [ 0, %._crit_edge3.preheader.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  store double %36, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %2
  store double %39, double* %37, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  store double %42, double* %40, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv.next.2
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %2
  store double %45, double* %43, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv.next.3
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %2
  store double %48, double* %46, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %._crit_edge3.preheader.._crit_edge4.loopexit_crit_edge, label %._crit_edge3.preheader

._crit_edge3.preheader.._crit_edge4.loopexit_crit_edge: ; preds = %._crit_edge3.preheader
  %.pre22 = add nuw nsw i64 %indvars.iv9, 1
  br label %._crit_edge4.loopexit

; <label>:49:                                     ; preds = %._crit_edge4.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %20, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %9

; <label>:9:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge2

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %21, label %._crit_edge.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
