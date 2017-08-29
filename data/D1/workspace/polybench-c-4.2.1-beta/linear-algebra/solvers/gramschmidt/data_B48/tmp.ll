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
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %3 to [1200 x double]*
  %10 = bitcast i8* %4 to [1200 x double]*
  %11 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %9, [1200 x double]* %10, [1200 x double]* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %17, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %13, %16, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader27.lr.ph:
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.lr.ph
  %indvars.iv45 = phi i64 [ 0, %.preheader27.lr.ph ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader27.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %5 ], [ 0, %.preheader27.us ]
  %6 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond, label %._crit_edge33.us, label %5

._crit_edge33.us:                                 ; preds = %5
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond54, label %._crit_edge.us.3.preheader, label %.preheader27.us

._crit_edge.us.3.preheader:                       ; preds = %._crit_edge33.us
  br label %._crit_edge.us.3

._crit_edge30:                                    ; preds = %._crit_edge.us.3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader
  %indvars.iv37 = phi i64 [ 0, %._crit_edge.us.3.preheader ], [ %indvars.iv.next38.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 0
  %scevgep51 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38 = or i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38, i64 0
  %scevgep51.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.1 = or i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1, i64 0
  %scevgep51.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.2 = or i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2, i64 0
  %scevgep51.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.3 = or i64 %indvars.iv37, 4
  %scevgep.155 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.3, i64 0
  %scevgep51.156 = bitcast double* %scevgep.155 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.156, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.157 = or i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.157, i64 0
  %scevgep51.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.1.1 = or i64 %indvars.iv37, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.1, i64 0
  %scevgep51.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.2.1 = or i64 %indvars.iv37, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.1, i64 0
  %scevgep51.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.3.1 = add nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge30, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader66.lr.ph:
  br label %.preheader66

.preheader66:                                     ; preds = %._crit_edge80, %.preheader66.lr.ph
  %indvars.iv118 = phi i64 [ 0, %.preheader66.lr.ph ], [ %indvars.iv.next119, %._crit_edge80 ]
  %indvars.iv112 = phi i64 [ 1, %.preheader66.lr.ph ], [ %indvars.iv.next113, %._crit_edge80 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader66, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader66 ]
  %.068 = phi double [ %20, %.lr.ph.new ], [ 0.000000e+00, %.preheader66 ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv118
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %6
  %8 = fadd double %.068, %7
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv118
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fadd double %8, %11
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv118
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %14
  %16 = fadd double %12, %15
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv118
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fadd double %16, %19
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond122.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond122.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %21 = tail call double @sqrt(double %20) #4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv118
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv118
  br label %.lr.ph71.new

.preheader65:                                     ; preds = %.lr.ph71.new
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %24 = icmp slt i64 %indvars.iv.next119, 1200
  br i1 %24, label %.lr.ph79.split.us.preheader, label %._crit_edge80

.lr.ph79.split.us.preheader:                      ; preds = %.preheader65
  br label %.lr.ph79.split.us

.lr.ph79.split.us:                                ; preds = %.lr.ph79.split.us.preheader, %.loopexit.us
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %.loopexit.us ], [ %indvars.iv112, %.lr.ph79.split.us.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv114
  store double 0.000000e+00, double* %25, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv114
  br label %.lr.ph79.split.us.new

.lr.ph79.split.us.new:                            ; preds = %.lr.ph79.split.us, %.lr.ph79.split.us.new
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph79.split.us.new ], [ 0, %.lr.ph79.split.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv118
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv114
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = load double, double* %26, align 8
  %33 = fadd double %32, %31
  store double %33, double* %26, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv118
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv114
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = load double, double* %26, align 8
  %40 = fadd double %39, %38
  store double %40, double* %26, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond.1133 = icmp eq i64 %indvars.iv.next105.1, 1000
  br i1 %exitcond.1133, label %.lr.ph76.us, label %.lr.ph79.split.us.new

.lr.ph76.us:                                      ; preds = %.lr.ph79.split.us.new
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv114
  br label %.lr.ph76.us.new

.lr.ph76.us.new:                                  ; preds = %.lr.ph76.us, %.lr.ph76.us.new
  %indvars.iv108 = phi i64 [ %indvars.iv.next109.1, %.lr.ph76.us.new ], [ 0, %.lr.ph76.us ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv108, i64 %indvars.iv114
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv108, i64 %indvars.iv118
  %45 = load double, double* %44, align 8
  %46 = load double, double* %41, align 8
  %47 = fmul double %45, %46
  %48 = fsub double %43, %47
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv108, i64 %indvars.iv114
  store double %48, double* %49, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next109, i64 %indvars.iv114
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next109, i64 %indvars.iv118
  %53 = load double, double* %52, align 8
  %54 = load double, double* %41, align 8
  %55 = fmul double %53, %54
  %56 = fsub double %51, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next109, i64 %indvars.iv114
  store double %56, double* %57, align 8
  %indvars.iv.next109.1 = add nuw nsw i64 %indvars.iv108, 2
  %exitcond.1139 = icmp eq i64 %indvars.iv.next109.1, 1000
  br i1 %exitcond.1139, label %.loopexit.us, label %.lr.ph76.us.new

.loopexit.us:                                     ; preds = %.lr.ph76.us.new
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond = icmp eq i64 %indvars.iv.next115, 1200
  br i1 %exitcond, label %._crit_edge80.loopexit, label %.lr.ph79.split.us

.lr.ph71.new:                                     ; preds = %._crit_edge, %.lr.ph71.new
  %indvars.iv94 = phi i64 [ %indvars.iv.next95.1, %.lr.ph71.new ], [ 0, %._crit_edge ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv94, i64 %indvars.iv118
  %59 = load double, double* %58, align 8
  %60 = load double, double* %23, align 8
  %61 = fdiv double %59, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv94, i64 %indvars.iv118
  store double %61, double* %62, align 8
  %indvars.iv.next95 = or i64 %indvars.iv94, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next95, i64 %indvars.iv118
  %64 = load double, double* %63, align 8
  %65 = load double, double* %23, align 8
  %66 = fdiv double %64, %65
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next95, i64 %indvars.iv118
  store double %66, double* %67, align 8
  %indvars.iv.next95.1 = add nuw nsw i64 %indvars.iv94, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next95.1, 1000
  br i1 %exitcond.1, label %.preheader65, label %.lr.ph71.new

._crit_edge80.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %.preheader65
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next119, 1200
  br i1 %exitcond142, label %._crit_edge82, label %.preheader66

._crit_edge82:                                    ; preds = %._crit_edge80
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader28.us.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next50, %._crit_edge35.us ]
  %8 = mul nuw nsw i64 %indvars.iv49, 1200
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader28.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %16 ], [ 0, %.preheader28.us ]
  %10 = add nuw nsw i64 %indvars.iv45, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv45
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond2, label %._crit_edge35.us, label %9

._crit_edge35.us:                                 ; preds = %16
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond3, label %._crit_edge38, label %.preheader28.us

._crit_edge38:                                    ; preds = %._crit_edge35.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge38
  %indvars.iv40 = phi i64 [ 0, %._crit_edge38 ], [ %indvars.iv.next41, %._crit_edge.us ]
  %25 = mul nuw nsw i64 %indvars.iv40, 1200
  br label %26

; <label>:26:                                     ; preds = %33, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %33 ], [ 0, %.preheader.us ]
  %27 = add nuw nsw i64 %indvars.iv, %25
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %26
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #6
  br label %33

; <label>:33:                                     ; preds = %31, %26
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond1, label %._crit_edge.us, label %26

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond, label %._crit_edge32, label %.preheader.us

._crit_edge32:                                    ; preds = %._crit_edge.us
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %40) #6
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
