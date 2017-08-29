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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  %13 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %8, double* %11, double* %12, double* %10, double* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %21

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to double*
  %20 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %20, double* %19)
  br label %21

; <label>:21:                                     ; preds = %15, %18, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1900 x double]*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph27, label %.preheader

.lr.ph27:                                         ; preds = %5
  %7 = sitofp i32 %0 to double
  %xtraiter44 = and i32 %0, 1
  %lcmp.mod45 = icmp eq i32 %xtraiter44, 0
  br i1 %lcmp.mod45, label %.prol.loopexit43, label %.prol.preheader42

.prol.preheader42:                                ; preds = %.lr.ph27
  %8 = fdiv double 0.000000e+00, %7
  store double %8, double* %4, align 8
  br label %.prol.loopexit43

.prol.loopexit43:                                 ; preds = %.lr.ph27, %.prol.preheader42
  %indvars.iv38.unr = phi i64 [ 0, %.lr.ph27 ], [ 1, %.prol.preheader42 ]
  %9 = icmp eq i32 %0, 1
  br i1 %9, label %.preheader, label %.lr.ph27.new.preheader

.lr.ph27.new.preheader:                           ; preds = %.prol.loopexit43
  %wide.trip.count40.1 = zext i32 %0 to i64
  br label %.lr.ph27.new

.preheader.loopexit:                              ; preds = %.lr.ph27.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit43, %5
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.lr.ph23, label %._crit_edge24

.lr.ph23:                                         ; preds = %.preheader
  %11 = sitofp i32 %1 to double
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %xtraiter = and i32 %0, 1
  %wide.trip.count31 = zext i32 %1 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %13 = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %0, 1
  br label %.lr.ph23.split.us

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %xtraiter36 = and i32 %1, 1
  %lcmp.mod37 = icmp eq i32 %xtraiter36, 0
  br i1 %lcmp.mod37, label %.lr.ph23.split.prol.loopexit, label %.lr.ph23.split.prol

.lr.ph23.split.prol:                              ; preds = %.lr.ph23.split.preheader
  %15 = fdiv double 0.000000e+00, %11
  store double %15, double* %3, align 8
  br label %.lr.ph23.split.prol.loopexit

.lr.ph23.split.prol.loopexit:                     ; preds = %.lr.ph23.split.preheader, %.lr.ph23.split.prol
  %indvars.iv32.unr = phi i64 [ 0, %.lr.ph23.split.preheader ], [ 1, %.lr.ph23.split.prol ]
  %16 = icmp eq i32 %1, 1
  br i1 %16, label %._crit_edge24, label %.lr.ph23.split.preheader46

.lr.ph23.split.preheader46:                       ; preds = %.lr.ph23.split.prol.loopexit
  %wide.trip.count34.1 = zext i32 %1 to i64
  br label %.lr.ph23.split

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %._crit_edge.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge.us ], [ 0, %.lr.ph23.split.us.preheader ]
  %17 = trunc i64 %indvars.iv29 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %11
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  store double %19, double* %20, align 8
  br i1 %13, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph23.split.us
  %21 = trunc i64 %indvars.iv29 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %11
  %25 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv29, i64 0
  store double %24, double* %25, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph23.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph23.split.us ]
  br i1 %14, label %._crit_edge.us, label %.lr.ph23.split.us.new.preheader

.lr.ph23.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph23.split.us.new

.lr.ph23.split.us.new:                            ; preds = %.lr.ph23.split.us.new.preheader, %.lr.ph23.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph23.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph23.split.us.new.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv29
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %11
  %31 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv29
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %11
  %37 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next
  store double %36, double* %37, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph23.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph23.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %wide.trip.count31
  br i1 %exitcond, label %._crit_edge24.loopexit, label %.lr.ph23.split.us

.lr.ph27.new:                                     ; preds = %.lr.ph27.new.preheader, %.lr.ph27.new
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.lr.ph27.new ], [ %indvars.iv38.unr, %.lr.ph27.new.preheader ]
  %38 = trunc i64 %indvars.iv38 to i32
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %7
  %41 = getelementptr inbounds double, double* %4, i64 %indvars.iv38
  store double %40, double* %41, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %42 = trunc i64 %indvars.iv.next39 to i32
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %7
  %45 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next39
  store double %44, double* %45, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next39.1, %wide.trip.count40.1
  br i1 %exitcond41.1, label %.preheader.loopexit, label %.lr.ph27.new

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader46, %.lr.ph23.split
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %.lr.ph23.split ], [ %indvars.iv32.unr, %.lr.ph23.split.preheader46 ]
  %46 = trunc i64 %indvars.iv32 to i32
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %11
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv32
  store double %48, double* %49, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %50 = trunc i64 %indvars.iv.next33 to i32
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %11
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next33
  store double %52, double* %53, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next33.1, %wide.trip.count34.1
  br i1 %exitcond35.1, label %._crit_edge24.loopexit49, label %.lr.ph23.split

._crit_edge24.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge24

._crit_edge24.loopexit49:                         ; preds = %.lr.ph23.split
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit49, %._crit_edge24.loopexit, %.lr.ph23.split.prol.loopexit, %.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32, i32, [1900 x double]*, double*, double*, double*, double*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.loopexit, label %.preheader

.preheader.loopexit:                              ; preds = %7
  %9 = bitcast double* %3 to i8*
  %10 = add i32 %0, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %13, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %.preheader
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph28.split.us.preheader, label %._crit_edge29.loopexit33

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph28
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count36 = zext i32 %1 to i64
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr49 = ptrtoint double* %4 to i64
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %.lr.ph28.split.us.preheader, %._crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.lr.ph28.split.us.preheader ]
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv34
  store double 0.000000e+00, double* %16, align 8
  %sunkaddr46 = shl i64 %indvars.iv34, 3
  %sunkaddr47 = add i64 %sunkaddr, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  %sunkaddr50 = shl i64 %indvars.iv34, 3
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph28.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %17 ], [ 0, %.lr.ph28.split.us ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = load double, double* %sunkaddr48, align 8
  %21 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %19, %23
  store double %24, double* %18, align 8
  %25 = load double, double* %sunkaddr52, align 8
  %26 = load double, double* %21, align 8
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %25, %29
  store double %30, double* %sunkaddr52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge29.loopexit, label %.lr.ph28.split.us

._crit_edge29.loopexit33:                         ; preds = %.lr.ph28
  %31 = bitcast double* %4 to i8*
  %32 = add i32 %1, -1
  %33 = zext i32 %32 to i64
  %34 = shl nuw nsw i64 %33, 3
  %35 = add nuw nsw i64 %34, 8
  call void @llvm.memset.p0i8.i64(i8* %31, i8 0, i64 %35, i32 8, i1 false)
  br label %._crit_edge29

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge29.loopexit33, %.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, double*, double*) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %4
  %wide.trip.count20 = zext i32 %0 to i64
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16.preheader, %15
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %15 ], [ 0, %.lr.ph16.preheader ]
  %10 = trunc i64 %indvars.iv18 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %.lr.ph16
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %.lr.ph16
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv18
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge17.loopexit, label %.lr.ph16

._crit_edge17.loopexit:                           ; preds = %15
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %24 = icmp sgt i32 %1, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge17
  %wide.trip.count = zext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %30
  %indvars.iv = phi i64 [ %indvars.iv.next, %30 ], [ 0, %.lr.ph.preheader ]
  %25 = trunc i64 %indvars.iv to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %.lr.ph
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %29) #6
  br label %30

; <label>:30:                                     ; preds = %28, %.lr.ph
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %30
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge17
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
