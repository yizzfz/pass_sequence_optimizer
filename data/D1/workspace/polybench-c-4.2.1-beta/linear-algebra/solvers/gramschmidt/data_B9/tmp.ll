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
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader26.lr.ph:
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge32.us, %.preheader26.lr.ph
  %indvars.iv44 = phi i64 [ 0, %.preheader26.lr.ph ], [ %indvars.iv.next45, %._crit_edge32.us ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader26.us
  %indvars.iv40 = phi i64 [ 0, %.preheader26.us ], [ %indvars.iv.next41, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv40, %indvars.iv44
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv40
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv40
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond, label %._crit_edge32.us, label %5

._crit_edge32.us:                                 ; preds = %5
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond53, label %._crit_edge.us.3.preheader, label %.preheader26.us

._crit_edge.us.3.preheader:                       ; preds = %._crit_edge32.us
  br label %._crit_edge.us.3

._crit_edge29:                                    ; preds = %._crit_edge.us.3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader
  %indvars.iv36 = phi i64 [ 0, %._crit_edge.us.3.preheader ], [ %indvars.iv.next37.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv36, i64 0
  %scevgep50 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37, i64 0
  %scevgep50.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.1 = or i64 %indvars.iv36, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.1, i64 0
  %scevgep50.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.2 = or i64 %indvars.iv36, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.2, i64 0
  %scevgep50.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.3 = or i64 %indvars.iv36, 4
  %scevgep.154 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.3, i64 0
  %scevgep50.155 = bitcast double* %scevgep.154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.155, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.156 = or i64 %indvars.iv36, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.156, i64 0
  %scevgep50.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.1.1 = or i64 %indvars.iv36, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.1.1, i64 0
  %scevgep50.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.2.1 = or i64 %indvars.iv36, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.2.1, i64 0
  %scevgep50.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.3.1 = add nsw i64 %indvars.iv36, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next37.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge29, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader65.lr.ph:
  br label %.preheader65

.loopexit.loopexit:                               ; preds = %._crit_edge77.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge71
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next117, 1200
  br i1 %exitcond136, label %._crit_edge82, label %.preheader65

.preheader65:                                     ; preds = %.loopexit, %.preheader65.lr.ph
  %indvars.iv116 = phi i64 [ 0, %.preheader65.lr.ph ], [ %indvars.iv.next117, %.loopexit ]
  %indvars.iv110 = phi i64 [ 1, %.preheader65.lr.ph ], [ %indvars.iv.next111, %.loopexit ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.preheader65
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader65 ]
  %.067 = phi double [ %20, %.lr.ph.new ], [ 0.000000e+00, %.preheader65 ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv116
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %6
  %8 = fadd double %.067, %7
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv116
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fadd double %8, %11
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv116
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %14
  %16 = fadd double %12, %15
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv116
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fadd double %16, %19
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond120.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond120.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %21 = tail call double @sqrt(double %20) #4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv116
  store double %21, double* %22, align 8
  br label %.lr.ph70

.lr.ph70:                                         ; preds = %.lr.ph70, %._crit_edge
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.lr.ph70 ], [ 0, %._crit_edge ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv116
  %24 = load double, double* %23, align 8
  %25 = load double, double* %22, align 8
  %26 = fdiv double %24, %25
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv92, i64 %indvars.iv116
  store double %26, double* %27, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next93, i64 %indvars.iv116
  %29 = load double, double* %28, align 8
  %30 = load double, double* %22, align 8
  %31 = fdiv double %29, %30
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next93, i64 %indvars.iv116
  store double %31, double* %32, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, 1000
  br i1 %exitcond.1, label %._crit_edge71, label %.lr.ph70

._crit_edge71:                                    ; preds = %.lr.ph70
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %33 = icmp slt i64 %indvars.iv.next117, 1200
  br i1 %33, label %.lr.ph80.split.us.preheader, label %.loopexit

.lr.ph80.split.us.preheader:                      ; preds = %._crit_edge71
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %.lr.ph80.split.us.preheader, %._crit_edge77.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge77.us ], [ %indvars.iv110, %.lr.ph80.split.us.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv112
  store double 0.000000e+00, double* %34, align 8
  br label %.lr.ph80.split.us.new

._crit_edge77.us:                                 ; preds = %.lr.ph76.us
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond = icmp eq i64 %indvars.iv.next113, 1200
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph80.split.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader, %.lr.ph76.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.lr.ph76.us ], [ 0, %.lr.ph76.us.preheader ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv106, i64 %indvars.iv112
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv106, i64 %indvars.iv116
  %38 = load double, double* %37, align 8
  %39 = load double, double* %34, align 8
  %40 = fmul double %38, %39
  %41 = fsub double %36, %40
  store double %41, double* %35, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next107, i64 %indvars.iv112
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next107, i64 %indvars.iv116
  %45 = load double, double* %44, align 8
  %46 = load double, double* %34, align 8
  %47 = fmul double %45, %46
  %48 = fsub double %43, %47
  store double %48, double* %42, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond.1133 = icmp eq i64 %indvars.iv.next107.1, 1000
  br i1 %exitcond.1133, label %._crit_edge77.us, label %.lr.ph76.us

.lr.ph80.split.us.new:                            ; preds = %.lr.ph80.split.us.new, %.lr.ph80.split.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.lr.ph80.split.us.new ], [ 0, %.lr.ph80.split.us ]
  %49 = phi double [ %61, %.lr.ph80.split.us.new ], [ 0.000000e+00, %.lr.ph80.split.us ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv116
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv102, i64 %indvars.iv112
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %34, align 8
  %indvars.iv.next103 = or i64 %indvars.iv102, 1
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next103, i64 %indvars.iv116
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next103, i64 %indvars.iv112
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %55, %60
  store double %61, double* %34, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %exitcond.1129 = icmp eq i64 %indvars.iv.next103.1, 1000
  br i1 %exitcond.1129, label %.lr.ph76.us.preheader, label %.lr.ph80.split.us.new

.lr.ph76.us.preheader:                            ; preds = %.lr.ph80.split.us.new
  br label %.lr.ph76.us

._crit_edge82:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader27.us.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge34.us, %.preheader27.us.preheader
  %indvars.iv48 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next49, %._crit_edge34.us ]
  %8 = mul nsw i64 %indvars.iv48, 1200
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader27.us
  %indvars.iv44 = phi i64 [ 0, %.preheader27.us ], [ %indvars.iv.next45, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv44, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc26.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv44
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next45, 1200
  br i1 %exitcond53, label %._crit_edge34.us, label %9

._crit_edge34.us:                                 ; preds = %._crit_edge
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next49, 1200
  br i1 %exitcond54, label %._crit_edge37, label %.preheader27.us

._crit_edge37:                                    ; preds = %._crit_edge34.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge37
  %indvars.iv39 = phi i64 [ 0, %._crit_edge37 ], [ %indvars.iv.next40, %._crit_edge.us ]
  %24 = mul nsw i64 %indvars.iv39, 1200
  br label %25

; <label>:25:                                     ; preds = %._crit_edge57, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge57 ]
  %26 = add nsw i64 %indvars.iv, %24
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %._crit_edge57

; <label>:30:                                     ; preds = %25
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %25, %30
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond52, label %._crit_edge.us, label %25

._crit_edge.us:                                   ; preds = %._crit_edge57
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 1000
  br i1 %exitcond, label %._crit_edge31, label %.preheader.us

._crit_edge31:                                    ; preds = %._crit_edge.us
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #6
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
