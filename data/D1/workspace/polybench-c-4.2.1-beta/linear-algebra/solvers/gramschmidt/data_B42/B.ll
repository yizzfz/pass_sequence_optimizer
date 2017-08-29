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
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
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

.lr.ph.new:                                       ; preds = %.preheader65, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader65 ]
  %.067 = phi double [ %18, %.lr.ph.new ], [ 0.000000e+00, %.preheader65 ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv116
  %4 = load double, double* %3, align 8
  %5 = fmul double %4, %4
  %6 = fadd double %.067, %5
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv116
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %6, %9
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv116
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv116
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond120.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond120.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %19 = tail call double @sqrt(double %18) #4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv116, i64 %indvars.iv116
  store double %19, double* %20, align 8
  br label %.lr.ph70

.lr.ph70:                                         ; preds = %._crit_edge, %.lr.ph70
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.lr.ph70 ], [ 0, %._crit_edge ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv116
  %22 = load double, double* %21, align 8
  %23 = load double, double* %20, align 8
  %24 = fdiv double %22, %23
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv116
  store double %24, double* %25, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next93, i64 %indvars.iv116
  %27 = load double, double* %26, align 8
  %28 = load double, double* %20, align 8
  %29 = fdiv double %27, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next93, i64 %indvars.iv116
  store double %29, double* %30, align 8
  %indvars.iv.next93.1 = add nuw nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, 1000
  br i1 %exitcond.1, label %._crit_edge71, label %.lr.ph70

._crit_edge71:                                    ; preds = %.lr.ph70
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %31 = icmp slt i64 %indvars.iv.next117, 1200
  br i1 %31, label %.lr.ph80.split.us.preheader, label %.loopexit

.lr.ph80.split.us.preheader:                      ; preds = %._crit_edge71
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %.lr.ph80.split.us.preheader, %._crit_edge77.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge77.us ], [ %indvars.iv110, %.lr.ph80.split.us.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv116, i64 %indvars.iv112
  store double 0.000000e+00, double* %32, align 8
  br label %.lr.ph80.split.us.new

.lr.ph80.split.us.new:                            ; preds = %.lr.ph80.split.us, %.lr.ph80.split.us.new
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.lr.ph80.split.us.new ], [ 0, %.lr.ph80.split.us ]
  %33 = phi double [ %45, %.lr.ph80.split.us.new ], [ 0.000000e+00, %.lr.ph80.split.us ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv102, i64 %indvars.iv116
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv112
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %32, align 8
  %indvars.iv.next103 = or i64 %indvars.iv102, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next103, i64 %indvars.iv116
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next103, i64 %indvars.iv112
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %39, %44
  store double %45, double* %32, align 8
  %indvars.iv.next103.1 = add nuw nsw i64 %indvars.iv102, 2
  %exitcond.1129 = icmp eq i64 %indvars.iv.next103.1, 1000
  br i1 %exitcond.1129, label %.lr.ph76.us.preheader, label %.lr.ph80.split.us.new

.lr.ph76.us.preheader:                            ; preds = %.lr.ph80.split.us.new
  br label %.lr.ph76.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader, %.lr.ph76.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.lr.ph76.us ], [ 0, %.lr.ph76.us.preheader ]
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv112
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv106, i64 %indvars.iv116
  %49 = load double, double* %48, align 8
  %50 = load double, double* %32, align 8
  %51 = fmul double %49, %50
  %52 = fsub double %47, %51
  store double %52, double* %46, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next107, i64 %indvars.iv112
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next107, i64 %indvars.iv116
  %56 = load double, double* %55, align 8
  %57 = load double, double* %32, align 8
  %58 = fmul double %56, %57
  %59 = fsub double %54, %58
  store double %59, double* %53, align 8
  %indvars.iv.next107.1 = add nuw nsw i64 %indvars.iv106, 2
  %exitcond.1133 = icmp eq i64 %indvars.iv.next107.1, 1000
  br i1 %exitcond.1133, label %._crit_edge77.us, label %.lr.ph76.us

._crit_edge77.us:                                 ; preds = %.lr.ph76.us
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond = icmp eq i64 %indvars.iv.next113, 1200
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph80.split.us

._crit_edge82:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader28.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next50, %._crit_edge35.us ]
  %6 = mul nuw nsw i64 %indvars.iv49, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader28.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %14 ], [ 0, %.preheader28.us ]
  %8 = add nuw nsw i64 %indvars.iv45, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv45
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond54, label %._crit_edge35.us, label %7

._crit_edge35.us:                                 ; preds = %14
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond55, label %._crit_edge38, label %.preheader28.us

._crit_edge38:                                    ; preds = %._crit_edge35.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge38
  %indvars.iv40 = phi i64 [ 0, %._crit_edge38 ], [ %indvars.iv.next41, %._crit_edge.us ]
  %23 = mul nuw nsw i64 %indvars.iv40, 1200
  br label %24

; <label>:24:                                     ; preds = %31, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %31 ], [ 0, %.preheader.us ]
  %25 = add nuw nsw i64 %indvars.iv, %23
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6
  br label %31

; <label>:31:                                     ; preds = %29, %24
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv40, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond53, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %31
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond, label %._crit_edge32, label %.preheader.us

._crit_edge32:                                    ; preds = %._crit_edge.us
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
