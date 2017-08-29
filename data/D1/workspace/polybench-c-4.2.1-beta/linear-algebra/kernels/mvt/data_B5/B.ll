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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to double*
  %19 = bitcast i8* %4 to double*
  tail call void @print_array(i32 2000, double* %19, double* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  %10 = fdiv double 0.000000e+00, %8
  %11 = icmp eq i32 %xtraiter, 0
  %12 = icmp eq i32 %0, 1
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us, %.lr.ph4
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %..loopexit_crit_edge.us ]
  %13 = trunc i64 %indvars.iv5 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  store double %15, double* %16, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %17 = icmp eq i64 %indvars.iv.next6, %9
  %18 = trunc i64 %indvars.iv.next6 to i32
  %19 = sitofp i32 %18 to double
  %20 = select i1 %17, double 0.000000e+00, double %19
  %21 = fdiv double %20, %8
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double %21, double* %22, align 8
  %23 = add nuw nsw i64 %indvars.iv5, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %0
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %8
  %28 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  store double %27, double* %28, align 8
  %29 = add nuw nsw i64 %indvars.iv5, 4
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %0
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %8
  %34 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %33, double* %34, align 8
  br i1 %11, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 0
  store double %10, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  br i1 %12, label %..loopexit_crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %36 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %0
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %46, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %9
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %48 = icmp eq i64 %indvars.iv.next6, %9
  br i1 %48, label %._crit_edge.loopexit, label %.lr.ph.us

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
  %wide.trip.count25 = zext i32 %0 to i64
  %8 = icmp eq i32 %xtraiter21, 0
  %9 = icmp eq i32 %0, 1
  %sunkaddr31 = ptrtoint double* %1 to i64
  %sunkaddr35 = ptrtoint double* %1 to i64
  %sunkaddr = ptrtoint double* %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge10.us ]
  br i1 %8, label %.prol.loopexit20, label %.prol.preheader19

.prol.preheader19:                                ; preds = %.preheader4.us
  %sunkaddr28 = shl i64 %indvars.iv23, 3
  %sunkaddr29 = add i64 %sunkaddr, %sunkaddr28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  %10 = load double, double* %sunkaddr30, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 0
  %12 = load double, double* %11, align 8
  %13 = load double, double* %3, align 8
  %14 = fmul double %12, %13
  %15 = fadd double %10, %14
  store double %15, double* %sunkaddr30, align 8
  br label %.prol.loopexit20

.prol.loopexit20:                                 ; preds = %.preheader4.us, %.prol.preheader19
  %indvars.iv15.unr.ph = phi i64 [ 1, %.prol.preheader19 ], [ 0, %.preheader4.us ]
  br i1 %9, label %._crit_edge10.us, label %.prol.loopexit20..preheader4.us.new_crit_edge

.prol.loopexit20..preheader4.us.new_crit_edge:    ; preds = %.prol.loopexit20
  %sunkaddr32 = shl i64 %indvars.iv23, 3
  %sunkaddr33 = add i64 %sunkaddr31, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %.pre = load double, double* %sunkaddr34, align 8
  %sunkaddr36 = shl i64 %indvars.iv23, 3
  %sunkaddr37 = add i64 %sunkaddr35, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new, %.prol.loopexit20..preheader4.us.new_crit_edge
  %16 = phi double [ %.pre, %.prol.loopexit20..preheader4.us.new_crit_edge ], [ %28, %.preheader4.us.new ]
  %indvars.iv15 = phi i64 [ %indvars.iv15.unr.ph, %.prol.loopexit20..preheader4.us.new_crit_edge ], [ %indvars.iv.next16.1, %.preheader4.us.new ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv15
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %16, %21
  store double %22, double* %sunkaddr38, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv.next16
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %sunkaddr38, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, %wide.trip.count25
  br i1 %exitcond18.1, label %._crit_edge10.us.loopexit, label %.preheader4.us.new

._crit_edge10.us.loopexit:                        ; preds = %.preheader4.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.prol.loopexit20
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  %29 = icmp eq i32 %xtraiter21, 0
  %30 = icmp eq i32 %0, 1
  %sunkaddr43 = ptrtoint double* %2 to i64
  %sunkaddr47 = ptrtoint double* %2 to i64
  %sunkaddr39 = ptrtoint double* %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %29, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %sunkaddr40 = shl i64 %indvars.iv12, 3
  %sunkaddr41 = add i64 %sunkaddr39, %sunkaddr40
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  %31 = load double, double* %sunkaddr42, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv12
  %33 = load double, double* %32, align 8
  %34 = load double, double* %4, align 8
  %35 = fmul double %33, %34
  %36 = fadd double %31, %35
  store double %36, double* %sunkaddr42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %30, label %._crit_edge.us, label %.prol.loopexit..preheader.us.new_crit_edge

.prol.loopexit..preheader.us.new_crit_edge:       ; preds = %.prol.loopexit
  %sunkaddr44 = shl i64 %indvars.iv12, 3
  %sunkaddr45 = add i64 %sunkaddr43, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %.pre27 = load double, double* %sunkaddr46, align 8
  %sunkaddr48 = shl i64 %indvars.iv12, 3
  %sunkaddr49 = add i64 %sunkaddr47, %sunkaddr48
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.prol.loopexit..preheader.us.new_crit_edge
  %37 = phi double [ %.pre27, %.prol.loopexit..preheader.us.new_crit_edge ], [ %49, %.preheader.us.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.prol.loopexit..preheader.us.new_crit_edge ], [ %indvars.iv.next.1, %.preheader.us.new ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv12
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %sunkaddr50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv12
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %43, %48
  store double %49, double* %sunkaddr50, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count25
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, %wide.trip.count25
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %6
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
  br i1 %8, label %.lr.ph7.preheader, label %._crit_edge8.._crit_edge_crit_edge.critedge

.lr.ph7.preheader:                                ; preds = %3
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7._crit_edge, %.lr.ph7.preheader
  %indvars.iv9 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next10, %.lr.ph7._crit_edge ]
  %9 = trunc i64 %indvars.iv9 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.lr.ph7._crit_edge

; <label>:12:                                     ; preds = %.lr.ph7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.lr.ph7._crit_edge

.lr.ph7._crit_edge:                               ; preds = %.lr.ph7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge8, label %.lr.ph7

._crit_edge8:                                     ; preds = %.lr.ph7._crit_edge
  %18 = icmp sgt i32 %0, 0
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  br i1 %18, label %.lr.ph.preheader, label %._crit_edge

._crit_edge8.._crit_edge_crit_edge.critedge:      ; preds = %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge8
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %27 = trunc i64 %indvars.iv to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %.lr.ph._crit_edge

; <label>:30:                                     ; preds = %.lr.ph
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %30
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge8, %._crit_edge8.._crit_edge_crit_edge.critedge
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
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
