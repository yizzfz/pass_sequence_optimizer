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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph4, label %._crit_edge

.lr.ph4:                                          ; preds = %6
  %8 = sitofp i32 %0 to double
  %9 = zext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %10 = icmp eq i32 %0, 1
  %wide.trip.count.1 = zext i32 %0 to i64
  %11 = fdiv double 0.000000e+00, %8
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.loopexit.us, %.lr.ph4
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %.loopexit.us ], [ 0, %.lr.ph4 ]
  %12 = trunc i64 %indvars.iv5 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, %8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  store double %14, double* %15, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %16 = icmp eq i64 %indvars.iv.next6, %9
  %17 = trunc i64 %indvars.iv.next6 to i32
  %18 = sitofp i32 %17 to double
  %19 = select i1 %16, double 0.000000e+00, double %18
  %20 = fdiv double %19, %8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double %20, double* %21, align 8
  %22 = add nuw nsw i64 %indvars.iv5, 3
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %0
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %8
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  store double %26, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv5, 4
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %0
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %8
  %33 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %32, double* %33, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 0
  store double %11, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  br i1 %10, label %.loopexit.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %35 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %0
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %0
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, %8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %45, double* %46, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.loopexit.us.loopexit, label %.lr.ph.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.prol.loopexit
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %9
  br i1 %exitcond8, label %._crit_edge.loopexit, label %.lr.ph.us

._crit_edge.loopexit:                             ; preds = %.loopexit.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader4.us.preheader, label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %6
  %8 = zext i32 %0 to i64
  %xtraiter21 = and i32 %0, 1
  %lcmp.mod22 = icmp eq i32 %xtraiter21, 0
  %9 = icmp eq i32 %0, 1
  %wide.trip.count17.1 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge10.us ]
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv23
  br i1 %lcmp.mod22, label %.prol.loopexit20, label %.prol.preheader19

.prol.preheader19:                                ; preds = %.preheader4.us
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 0
  %13 = load double, double* %12, align 8
  %14 = load double, double* %3, align 8
  %15 = fmul double %13, %14
  %16 = fadd double %11, %15
  store double %16, double* %10, align 8
  br label %.prol.loopexit20

.prol.loopexit20:                                 ; preds = %.prol.preheader19, %.preheader4.us
  %indvars.iv15.unr.ph = phi i64 [ 1, %.prol.preheader19 ], [ 0, %.preheader4.us ]
  br i1 %9, label %._crit_edge10.us, label %.preheader4.us.new.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit20
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new.preheader, %.preheader4.us.new
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.preheader4.us.new ], [ %indvars.iv15.unr.ph, %.preheader4.us.new.preheader ]
  %17 = load double, double* %10, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv15
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %10, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv.next16
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %10, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, %wide.trip.count17.1
  br i1 %exitcond18.1, label %._crit_edge10.us.loopexit, label %.preheader4.us.new

._crit_edge10.us.loopexit:                        ; preds = %.preheader4.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.prol.loopexit20
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, %8
  br i1 %exitcond, label %.preheader3, label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge10.us
  %30 = icmp sgt i32 %0, 0
  br i1 %30, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader3
  %31 = zext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %32 = icmp eq i32 %0, 1
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv12
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv12
  %36 = load double, double* %35, align 8
  %37 = load double, double* %4, align 8
  %38 = fmul double %36, %37
  %39 = fadd double %34, %38
  store double %39, double* %33, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %32, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %40 = load double, double* %33, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv12
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv12
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %46, %51
  store double %52, double* %33, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next13, %31
  br i1 %exitcond27, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %6, %.preheader3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %3
  %9 = zext i32 %0 to i64
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %15, %.lr.ph7.preheader
  %indvars.iv9 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next10, %15 ]
  %10 = trunc i64 %indvars.iv9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %.lr.ph7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %.lr.ph7, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, %9
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.lr.ph7

._crit_edge8.loopexit:                            ; preds = %15
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %24 = icmp sgt i32 %0, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge8
  %25 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %31, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %31 ]
  %26 = trunc i64 %indvars.iv to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %.lr.ph
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %31

; <label>:31:                                     ; preds = %.lr.ph, %29
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %25
  br i1 %exitcond13, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %31
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge8
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
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
