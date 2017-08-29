; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
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
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %19, double* %18)
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
define internal fastcc void @init_array(i32, i32, [1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph32, label %.preheader

.lr.ph32:                                         ; preds = %5
  %7 = sitofp i32 %0 to double
  %8 = add i32 %0, -1
  %wide.trip.count45 = zext i32 %8 to i64
  br label %38

.preheader.loopexit:                              ; preds = %38
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %5
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %.preheader
  %10 = sitofp i32 %1 to double
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.lr.ph28..lr.ph28.split.us_crit_edge, label %.lr.ph28..lr.ph28.split_crit_edge

.lr.ph28..lr.ph28.split_crit_edge:                ; preds = %.lr.ph28
  %12 = add i32 %1, -1
  %wide.trip.count41 = zext i32 %12 to i64
  br label %.lr.ph28.split

.lr.ph28..lr.ph28.split.us_crit_edge:             ; preds = %.lr.ph28
  %13 = add i32 %0, -1
  %14 = sext i32 %1 to i64
  %wide.trip.count35 = zext i32 %13 to i64
  %15 = and i64 %wide.trip.count35, 1
  %lcmp.mod = icmp eq i64 %15, 0
  %16 = icmp eq i32 %13, 0
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %._crit_edge.us, %.lr.ph28..lr.ph28.split.us_crit_edge
  %indvars.iv37 = phi i64 [ 0, %.lr.ph28..lr.ph28.split.us_crit_edge ], [ %indvars.iv.next38, %._crit_edge.us ]
  %17 = trunc i64 %indvars.iv37 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %10
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv37
  store double %19, double* %20, align 8
  br i1 %lcmp.mod, label %._crit_edge.prol.preheader, label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.preheader:                       ; preds = %.lr.ph28.split.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %21 = trunc i64 %indvars.iv37 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv37, i64 0
  store double %24, double* %25, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph28.split.us, %._crit_edge.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.lr.ph28.split.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %16, label %._crit_edge.us, label %.lr.ph28.split.us.new

.lr.ph28.split.us.new:                            ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph28.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph28.split.us.new ], [ %indvars.iv.next.1, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv37
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %10
  %31 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv37
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %10
  %37 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %36, double* %37, align 8
  %exitcond36.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count35
  br i1 %exitcond36.1, label %._crit_edge.us.unr-lcssa, label %._crit_edge

._crit_edge.us.unr-lcssa:                         ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.unr-lcssa
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %14
  br i1 %exitcond, label %._crit_edge29.loopexit, label %.lr.ph28.split.us

; <label>:38:                                     ; preds = %._crit_edge50, %.lr.ph32
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge50 ], [ 0, %.lr.ph32 ]
  %39 = trunc i64 %indvars.iv43 to i32
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %7
  %42 = getelementptr inbounds double, double* %4, i64 %indvars.iv43
  store double %41, double* %42, align 8
  %exitcond46 = icmp eq i64 %indvars.iv43, %wide.trip.count45
  br i1 %exitcond46, label %.preheader.loopexit, label %._crit_edge50

._crit_edge50:                                    ; preds = %38
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  br label %38

.lr.ph28.split:                                   ; preds = %.lr.ph28.split..lr.ph28.split_crit_edge, %.lr.ph28..lr.ph28.split_crit_edge
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %.lr.ph28.split..lr.ph28.split_crit_edge ], [ 0, %.lr.ph28..lr.ph28.split_crit_edge ]
  %43 = trunc i64 %indvars.iv39 to i32
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, %10
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv39
  store double %45, double* %46, align 8
  %exitcond42 = icmp eq i64 %indvars.iv39, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge29.loopexit51, label %.lr.ph28.split..lr.ph28.split_crit_edge

.lr.ph28.split..lr.ph28.split_crit_edge:          ; preds = %.lr.ph28.split
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  br label %.lr.ph28.split

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29.loopexit51:                         ; preds = %.lr.ph28.split
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit51, %._crit_edge29.loopexit, %.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32, i32, [1900 x double]* nocapture readonly, double* nocapture, double*, double* nocapture readonly, double*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph37..preheader_crit_edge, label %.preheader

.preheader:                                       ; preds = %7, %.lr.ph37..preheader_crit_edge
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph33, label %._crit_edge34

.lr.ph33:                                         ; preds = %.preheader
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph33..lr.ph33.split.us_crit_edge, label %.lr.ph33.split.._crit_edge34_crit_edge

.lr.ph33..lr.ph33.split.us_crit_edge:             ; preds = %.lr.ph33
  %11 = add i32 %0, -1
  %12 = sext i32 %1 to i64
  %wide.trip.count38 = zext i32 %11 to i64
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr53 = ptrtoint double* %4 to i64
  br label %.lr.ph33.split.us

.lr.ph33.split.us:                                ; preds = %._crit_edge.us, %.lr.ph33..lr.ph33.split.us_crit_edge
  %indvars.iv40 = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %indvars.iv.next41, %._crit_edge.us ]
  %13 = getelementptr inbounds double, double* %4, i64 %indvars.iv40
  store double 0.000000e+00, double* %13, align 8
  %sunkaddr50 = shl i64 %indvars.iv40, 3
  %sunkaddr51 = add i64 %sunkaddr, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  %sunkaddr54 = shl i64 %indvars.iv40, 3
  %sunkaddr55 = add i64 %sunkaddr53, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.lr.ph33.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph33.split.us ]
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = load double, double* %sunkaddr52, align 8
  %18 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %16, %20
  store double %21, double* %15, align 8
  %22 = load double, double* %sunkaddr56, align 8
  %23 = load double, double* %18, align 8
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %22, %26
  store double %27, double* %sunkaddr56, align 8
  %exitcond39 = icmp eq i64 %indvars.iv, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %12
  br i1 %exitcond, label %._crit_edge34.loopexit, label %.lr.ph33.split.us

.lr.ph37..preheader_crit_edge:                    ; preds = %7
  %28 = bitcast double* %3 to i8*
  %29 = add i32 %0, -1
  %30 = zext i32 %29 to i64
  %31 = shl nuw nsw i64 %30, 3
  %32 = add nuw nsw i64 %31, 8
  call void @llvm.memset.p0i8.i64(i8* %28, i8 0, i64 %32, i32 8, i1 false)
  br label %.preheader

.lr.ph33.split.._crit_edge34_crit_edge:           ; preds = %.lr.ph33
  %33 = bitcast double* %4 to i8*
  %34 = add i32 %1, -1
  %35 = zext i32 %34 to i64
  %36 = shl nuw nsw i64 %35, 3
  %37 = add nuw nsw i64 %36, 8
  call void @llvm.memset.p0i8.i64(i8* %33, i8 0, i64 %37, i32 8, i1 false)
  br label %._crit_edge34

._crit_edge34.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader, %.lr.ph33.split.._crit_edge34_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %..lr.ph17_crit_edge, label %._crit_edge18

..lr.ph17_crit_edge:                              ; preds = %4
  %10 = sext i32 %0 to i64
  br label %.lr.ph17

.lr.ph17:                                         ; preds = %.lr.ph17._crit_edge, %..lr.ph17_crit_edge
  %indvars.iv21 = phi i64 [ 0, %..lr.ph17_crit_edge ], [ %indvars.iv.next22, %.lr.ph17._crit_edge ]
  %11 = trunc i64 %indvars.iv21 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.lr.ph17._crit_edge

; <label>:14:                                     ; preds = %.lr.ph17
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc13 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %.lr.ph17._crit_edge

.lr.ph17._crit_edge:                              ; preds = %.lr.ph17, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, %10
  br i1 %exitcond23, label %._crit_edge18.loopexit, label %.lr.ph17

._crit_edge18.loopexit:                           ; preds = %.lr.ph17._crit_edge
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %24 = icmp sgt i32 %1, 0
  br i1 %24, label %._crit_edge18..lr.ph_crit_edge, label %._crit_edge

._crit_edge18..lr.ph_crit_edge:                   ; preds = %._crit_edge18
  %25 = sext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %._crit_edge18..lr.ph_crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge18..lr.ph_crit_edge ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %26 = trunc i64 %indvars.iv to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %.lr.ph._crit_edge

; <label>:29:                                     ; preds = %.lr.ph
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %25
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge18
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %37) #6
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
