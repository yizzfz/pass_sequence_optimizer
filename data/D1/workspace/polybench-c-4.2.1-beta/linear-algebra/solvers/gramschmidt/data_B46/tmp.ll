; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
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
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader27.lr.ph:
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.lr.ph
  %indvars.iv45 = phi i64 [ 0, %.preheader27.lr.ph ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader27.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %3 ], [ 0, %.preheader27.us ]
  %4 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv41
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond, label %._crit_edge33.us, label %3

._crit_edge33.us:                                 ; preds = %3
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond54, label %._crit_edge.us.3.preheader, label %.preheader27.us

._crit_edge.us.3.preheader:                       ; preds = %._crit_edge33.us
  br label %._crit_edge.us.3

._crit_edge30:                                    ; preds = %._crit_edge.us.3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader
  %indvars.iv37 = phi i64 [ 0, %._crit_edge.us.3.preheader ], [ %indvars.iv.next38.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv37, i64 0
  %scevgep51 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38 = or i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38, i64 0
  %scevgep51.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.1 = or i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.1, i64 0
  %scevgep51.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.2 = or i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.2, i64 0
  %scevgep51.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.3 = or i64 %indvars.iv37, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.3, i64 0
  %scevgep51.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.13 = or i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.13, i64 0
  %scevgep51.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.1.1 = or i64 %indvars.iv37, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.1.1, i64 0
  %scevgep51.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.2.1 = or i64 %indvars.iv37, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.2.1, i64 0
  %scevgep51.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.3.1 = add nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge30, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader66.lr.ph:
  br label %.preheader66

.preheader66:                                     ; preds = %._crit_edge78, %.preheader66.lr.ph
  %indvars.iv114 = phi i64 [ 0, %.preheader66.lr.ph ], [ %indvars.iv.next115, %._crit_edge78 ]
  %indvars.iv108 = phi i64 [ 1, %.preheader66.lr.ph ], [ %indvars.iv.next109, %._crit_edge78 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader66, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader66 ]
  %.068 = phi double [ %18, %.lr.ph.new ], [ 0.000000e+00, %.preheader66 ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv114
  %4 = load double, double* %3, align 8
  %5 = fmul double %4, %4
  %6 = fadd double %.068, %5
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv114
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %6, %9
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv114
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv114
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond118.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond118.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %19 = tail call double @sqrt(double %18) #4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  store double %19, double* %20, align 8
  br label %.lr.ph71

.preheader65:                                     ; preds = %.lr.ph71
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %21 = icmp slt i64 %indvars.iv.next115, 1200
  br i1 %21, label %.lr.ph77.split.us.preheader, label %._crit_edge78

.lr.ph77.split.us.preheader:                      ; preds = %.preheader65
  br label %.lr.ph77.split.us

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %.loopexit.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %.loopexit.us ], [ %indvars.iv108, %.lr.ph77.split.us.preheader ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %22, align 8
  br label %.lr.ph77.split.us.new

.lr.ph77.split.us.new:                            ; preds = %.lr.ph77.split.us, %.lr.ph77.split.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph77.split.us.new ], [ 0, %.lr.ph77.split.us ]
  %23 = phi double [ %35, %.lr.ph77.split.us.new ], [ 0.000000e+00, %.lr.ph77.split.us ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv114
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv100, i64 %indvars.iv110
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %22, align 8
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next101, i64 %indvars.iv114
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next101, i64 %indvars.iv110
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %29, %34
  store double %35, double* %22, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond.1127 = icmp eq i64 %indvars.iv.next101.1, 1000
  br i1 %exitcond.1127, label %.lr.ph76.us.preheader, label %.lr.ph77.split.us.new

.lr.ph76.us.preheader:                            ; preds = %.lr.ph77.split.us.new
  br label %.lr.ph76.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader, %.lr.ph76.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph76.us ], [ 0, %.lr.ph76.us.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv110
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv114
  %39 = load double, double* %38, align 8
  %40 = load double, double* %22, align 8
  %41 = fmul double %39, %40
  %42 = fsub double %37, %41
  store double %42, double* %36, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next105, i64 %indvars.iv110
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv114
  %46 = load double, double* %45, align 8
  %47 = load double, double* %22, align 8
  %48 = fmul double %46, %47
  %49 = fsub double %44, %48
  store double %49, double* %43, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond.1131 = icmp eq i64 %indvars.iv.next105.1, 1000
  br i1 %exitcond.1131, label %.loopexit.us, label %.lr.ph76.us

.loopexit.us:                                     ; preds = %.lr.ph76.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond = icmp eq i64 %indvars.iv.next111, 1200
  br i1 %exitcond, label %._crit_edge78.loopexit, label %.lr.ph77.split.us

.lr.ph71:                                         ; preds = %._crit_edge, %.lr.ph71
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph71 ], [ 0, %._crit_edge ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv90, i64 %indvars.iv114
  %51 = load double, double* %50, align 8
  %52 = load double, double* %20, align 8
  %53 = fdiv double %51, %52
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv90, i64 %indvars.iv114
  store double %53, double* %54, align 8
  %indvars.iv.next91 = or i64 %indvars.iv90, 1
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next91, i64 %indvars.iv114
  %56 = load double, double* %55, align 8
  %57 = load double, double* %20, align 8
  %58 = fdiv double %56, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next91, i64 %indvars.iv114
  store double %58, double* %59, align 8
  %indvars.iv.next91.1 = add nuw nsw i64 %indvars.iv90, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next91.1, 1000
  br i1 %exitcond.1, label %.preheader65, label %.lr.ph71

._crit_edge78.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit, %.preheader65
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next115, 1200
  br i1 %exitcond134, label %._crit_edge80, label %.preheader66

._crit_edge80:                                    ; preds = %._crit_edge78
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader29.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader29.us

.preheader29.us:                                  ; preds = %._crit_edge37.us, %.preheader29.us.preheader
  %indvars.iv51 = phi i64 [ 0, %.preheader29.us.preheader ], [ %indvars.iv.next52, %._crit_edge37.us ]
  %6 = mul nuw nsw i64 %indvars.iv51, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge.us, %.preheader29.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us ], [ 0, %.preheader29.us ]
  %8 = add nuw nsw i64 %indvars.iv47, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc28.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv47
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond56, label %._crit_edge37.us, label %7

._crit_edge37.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next52, 1200
  br i1 %exitcond57, label %._crit_edge40, label %.preheader29.us

._crit_edge40:                                    ; preds = %._crit_edge37.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge31.us, %._crit_edge40
  %indvars.iv42 = phi i64 [ 0, %._crit_edge40 ], [ %indvars.iv.next43, %._crit_edge31.us ]
  %22 = mul nuw nsw i64 %indvars.iv42, 1200
  br label %23

; <label>:23:                                     ; preds = %._crit_edge25.us, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge25.us ], [ 0, %.preheader.us ]
  %24 = add nuw nsw i64 %indvars.iv, %22
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %._crit_edge25.us

; <label>:28:                                     ; preds = %23
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %29) #6
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %28, %23
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond55, label %._crit_edge31.us, label %23

._crit_edge31.us:                                 ; preds = %._crit_edge25.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, 1000
  br i1 %exitcond, label %._crit_edge34, label %.preheader.us

._crit_edge34:                                    ; preds = %._crit_edge31.us
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
