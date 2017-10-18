; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  tail call void @init_array(i32 2000, double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_mvt(i32 2000, double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to double*
  %19 = bitcast i8* %4 to double*
  tail call void @print_array(i32 2000, double* %19, double* %18)
  br label %20

; <label>:20:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph4, label %._crit_edge

.lr.ph4:                                          ; preds = %6
  %8 = sitofp i32 %0 to double
  %9 = zext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %10 = icmp eq i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %11 = fdiv double 0.000000e+00, %8
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us, %.lr.ph4
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us ], [ 0, %.lr.ph4 ]
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
  br i1 %10, label %..loopexit_crit_edge.us, label %.lr.ph.us.new.preheader

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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader4.us.preheader, label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %6
  %xtraiter21 = and i32 %0, 1
  %lcmp.mod22 = icmp eq i32 %xtraiter21, 0
  %8 = icmp eq i32 %0, 1
  %wide.trip.count25 = zext i32 %0 to i64
  %sunkaddr30 = ptrtoint double* %1 to i64
  %wide.trip.count17.1 = zext i32 %0 to i64
  %sunkaddr = ptrtoint double* %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge10.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge10.us ], [ 0, %.preheader4.us.preheader ]
  br i1 %lcmp.mod22, label %.prol.loopexit20, label %.prol.preheader19

.prol.preheader19:                                ; preds = %.preheader4.us
  %sunkaddr27 = shl i64 %indvars.iv23, 3
  %sunkaddr28 = add i64 %sunkaddr, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %9 = load double, double* %sunkaddr29, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 0
  %11 = load double, double* %10, align 8
  %12 = load double, double* %3, align 8
  %13 = fmul double %11, %12
  %14 = fadd double %9, %13
  store double %14, double* %sunkaddr29, align 8
  br label %.prol.loopexit20

.prol.loopexit20:                                 ; preds = %.prol.preheader19, %.preheader4.us
  %indvars.iv15.unr.ph = phi i64 [ 1, %.prol.preheader19 ], [ 0, %.preheader4.us ]
  br i1 %8, label %._crit_edge10.us, label %.preheader4.us.new.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit20
  %sunkaddr31 = shl i64 %indvars.iv23, 3
  %sunkaddr32 = add i64 %sunkaddr30, %sunkaddr31
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new.preheader, %.preheader4.us.new
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.preheader4.us.new ], [ %indvars.iv15.unr.ph, %.preheader4.us.new.preheader ]
  %15 = load double, double* %sunkaddr33, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %sunkaddr33, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv.next16
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr33, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, %wide.trip.count17.1
  br i1 %exitcond18.1, label %._crit_edge10.us.loopexit, label %.preheader4.us.new

._crit_edge10.us.loopexit:                        ; preds = %.preheader4.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.prol.loopexit20
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader3, label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge10.us
  %28 = icmp sgt i32 %0, 0
  br i1 %28, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader3
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %29 = icmp eq i32 %0, 1
  %wide.trip.count14 = zext i32 %0 to i64
  %sunkaddr38 = ptrtoint double* %2 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %sunkaddr34 = ptrtoint double* %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %sunkaddr35 = shl i64 %indvars.iv12, 3
  %sunkaddr36 = add i64 %sunkaddr34, %sunkaddr35
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %30 = load double, double* %sunkaddr37, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv12
  %32 = load double, double* %31, align 8
  %33 = load double, double* %4, align 8
  %34 = fmul double %32, %33
  %35 = fadd double %30, %34
  store double %35, double* %sunkaddr37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %29, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %sunkaddr39 = shl i64 %indvars.iv12, 3
  %sunkaddr40 = add i64 %sunkaddr38, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %36 = load double, double* %sunkaddr41, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv12
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %sunkaddr41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv12
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %sunkaddr41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %6, %.preheader3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double* nocapture readonly, double* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %3
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %14
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %14 ], [ 0, %.lr.ph7.preheader ]
  %9 = trunc i64 %indvars.iv9 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %.lr.ph7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge8.loopexit, label %.lr.ph7

._crit_edge8.loopexit:                            ; preds = %14
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %23 = icmp sgt i32 %0, 0
  br i1 %23, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge8
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %29
  %indvars.iv = phi i64 [ %indvars.iv.next, %29 ], [ 0, %.lr.ph.preheader ]
  %24 = trunc i64 %indvars.iv to i32
  %25 = srem i32 %24, 20
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %.lr.ph
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %28) #5
  br label %29

; <label>:29:                                     ; preds = %.lr.ph, %27
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %29
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge8
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
