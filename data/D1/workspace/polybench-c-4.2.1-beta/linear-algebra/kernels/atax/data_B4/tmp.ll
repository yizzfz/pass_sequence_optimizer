; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2100, double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = sitofp i32 %1 to double
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph9.preheader, label %.preheader2

.lr.ph9.preheader:                                ; preds = %4
  %xtraiter21 = and i32 %1, 1
  %lcmp.mod22 = icmp eq i32 %xtraiter21, 0
  br i1 %lcmp.mod22, label %.lr.ph9.prol.loopexit, label %.lr.ph9.prol

.lr.ph9.prol:                                     ; preds = %.lr.ph9.preheader
  %7 = fdiv double 0.000000e+00, %5
  %8 = fadd double %7, 1.000000e+00
  store double %8, double* %3, align 8
  br label %.lr.ph9.prol.loopexit

.lr.ph9.prol.loopexit:                            ; preds = %.lr.ph9.preheader, %.lr.ph9.prol
  %indvars.iv17.unr = phi i64 [ 0, %.lr.ph9.preheader ], [ 1, %.lr.ph9.prol ]
  %9 = icmp eq i32 %1, 1
  br i1 %9, label %.preheader2, label %.lr.ph9.preheader23

.lr.ph9.preheader23:                              ; preds = %.lr.ph9.prol.loopexit
  %wide.trip.count19.1 = zext i32 %1 to i64
  br label %.lr.ph9

.preheader2.loopexit:                             ; preds = %.lr.ph9
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.lr.ph9.prol.loopexit, %4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader.lr.ph, label %._crit_edge6

.preheader.lr.ph:                                 ; preds = %.preheader2
  %11 = icmp sgt i32 %1, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader.us.preheader, label %._crit_edge6

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %wide.trip.count15 = zext i32 %0 to i64
  %wide.trip.count11.1 = zext i32 %1 to i64
  %14 = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %14, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %16 = trunc i64 %indvars.iv13 to i32
  %17 = srem i32 %16, %1
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv13, i64 0
  store double %19, double* %20, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %15, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %21 = add nuw nsw i64 %indvars.iv, %indvars.iv13
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %13
  %26 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = add nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %1
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %13
  %32 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %31, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond12.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count11.1
  br i1 %exitcond12.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge6.loopexit, label %.preheader.us

.lr.ph9:                                          ; preds = %.lr.ph9.preheader23, %.lr.ph9
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.lr.ph9 ], [ %indvars.iv17.unr, %.lr.ph9.preheader23 ]
  %33 = trunc i64 %indvars.iv17 to i32
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %5
  %36 = fadd double %35, 1.000000e+00
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv17
  store double %36, double* %37, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %38 = trunc i64 %indvars.iv.next18 to i32
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %5
  %41 = fadd double %40, 1.000000e+00
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next18
  store double %41, double* %42, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next18.1, %wide.trip.count19.1
  br i1 %exitcond20.1, label %.preheader2.loopexit, label %.lr.ph9

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader.lr.ph, %.preheader2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.preheader3.loopexit, label %.preheader3

.preheader3.loopexit:                             ; preds = %6
  %8 = bitcast double* %4 to i8*
  %9 = add i32 %1, -1
  %10 = zext i32 %9 to i64
  %11 = shl nuw nsw i64 %10, 3
  %12 = add nuw nsw i64 %11, 8
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %12, i32 8, i1 false)
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %6
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %.preheader3
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph8.split.us.preheader, label %._crit_edge9.loopexit21

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %15 = add i32 %1, -1
  %xtraiter = and i32 %1, 1
  %xtraiter28 = and i32 %1, 1
  %wide.trip.count26.1 = zext i32 %1 to i64
  %wide.trip.count32 = zext i32 %0 to i64
  %wide.trip.count22.1 = zext i32 %1 to i64
  %16 = icmp eq i32 %xtraiter, 0
  %17 = icmp eq i32 %15, 0
  %18 = icmp sgt i32 %1, 0
  %19 = icmp eq i32 %xtraiter28, 0
  %20 = icmp eq i32 %15, 0
  %sunkaddr43 = ptrtoint double* %5 to i64
  %sunkaddr51 = ptrtoint double* %5 to i64
  %sunkaddr47 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv30
  store double 0.000000e+00, double* %21, align 8
  br i1 %16, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph8.split.us
  %sunkaddr40 = shl i64 %indvars.iv30, 3
  %sunkaddr41 = add i64 %sunkaddr, %sunkaddr40
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  %22 = load double, double* %sunkaddr42, align 8
  %23 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv30, i64 0
  %24 = load double, double* %23, align 8
  %25 = load double, double* %3, align 8
  %26 = fmul double %24, %25
  %27 = fadd double %22, %26
  store double %27, double* %sunkaddr42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph8.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph8.split.us ]
  br i1 %17, label %..preheader_crit_edge.us, label %.lr.ph8.split.us.new.preheader

.lr.ph8.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %sunkaddr48 = shl i64 %indvars.iv30, 3
  %sunkaddr49 = add i64 %sunkaddr47, %sunkaddr48
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  br label %.lr.ph8.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph6.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader55, %.lr.ph6.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %.lr.ph6.us ], [ %indvars.iv24.unr.ph, %.lr.ph6.us.preheader55 ]
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv24
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv24
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr46, align 8
  %33 = fmul double %31, %32
  %34 = fadd double %29, %33
  store double %34, double* %28, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next25
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv.next25
  %38 = load double, double* %37, align 8
  %39 = load double, double* %sunkaddr46, align 8
  %40 = fmul double %38, %39
  %41 = fadd double %36, %40
  store double %41, double* %35, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, %wide.trip.count26.1
  br i1 %exitcond27.1, label %._crit_edge.us.loopexit, label %.lr.ph6.us

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us.new.preheader, %.lr.ph8.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph8.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph8.split.us.new.preheader ]
  %42 = load double, double* %sunkaddr50, align 8
  %43 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %sunkaddr50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %sunkaddr50, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count22.1
  br i1 %exitcond23.1, label %..preheader_crit_edge.us.loopexit, label %.lr.ph8.split.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph8.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %18, label %.lr.ph6.us.preheader, label %._crit_edge.us

.lr.ph6.us.preheader:                             ; preds = %..preheader_crit_edge.us
  br i1 %19, label %.lr.ph6.us.prol.loopexit, label %.lr.ph6.us.prol

.lr.ph6.us.prol:                                  ; preds = %.lr.ph6.us.preheader
  %55 = load double, double* %4, align 8
  %56 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv30, i64 0
  %57 = load double, double* %56, align 8
  %sunkaddr52 = shl i64 %indvars.iv30, 3
  %sunkaddr53 = add i64 %sunkaddr51, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  %58 = load double, double* %sunkaddr54, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %55, %59
  store double %60, double* %4, align 8
  br label %.lr.ph6.us.prol.loopexit

.lr.ph6.us.prol.loopexit:                         ; preds = %.lr.ph6.us.prol, %.lr.ph6.us.preheader
  %indvars.iv24.unr.ph = phi i64 [ 1, %.lr.ph6.us.prol ], [ 0, %.lr.ph6.us.preheader ]
  br i1 %20, label %._crit_edge.us, label %.lr.ph6.us.preheader55

.lr.ph6.us.preheader55:                           ; preds = %.lr.ph6.us.prol.loopexit
  %sunkaddr44 = shl i64 %indvars.iv30, 3
  %sunkaddr45 = add i64 %sunkaddr43, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  br label %.lr.ph6.us

._crit_edge9.loopexit21:                          ; preds = %.lr.ph8
  %61 = bitcast double* %5 to i8*
  %62 = add i32 %0, -1
  %63 = zext i32 %62 to i64
  %64 = shl nuw nsw i64 %63, 3
  %65 = add nuw nsw i64 %64, 8
  call void @llvm.memset.p0i8.i64(i8* %61, i8 0, i64 %65, i32 8, i1 false)
  br label %._crit_edge9

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge9.loopexit21, %.preheader3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count2 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %wide.trip.count2
  br i1 %exitcond3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
