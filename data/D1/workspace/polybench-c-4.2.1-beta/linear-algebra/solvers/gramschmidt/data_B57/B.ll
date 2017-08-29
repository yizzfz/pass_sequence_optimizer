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
  %scevgep.155 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.3, i64 0
  %scevgep51.156 = bitcast double* %scevgep.155 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.156, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next38.157 = or i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.157, i64 0
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
  %indvars.iv.next38.3.1 = add nuw nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge30, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]*, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader77.lr.ph:
  br label %.preheader77

.preheader77:                                     ; preds = %._crit_edge89, %.preheader77.lr.ph
  %indvars.iv131 = phi i64 [ 0, %.preheader77.lr.ph ], [ %indvars.iv.next132, %._crit_edge89 ]
  %indvars.iv125 = phi i64 [ 1, %.preheader77.lr.ph ], [ %indvars.iv.next126, %._crit_edge89 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader77, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader77 ]
  %.079 = phi double [ %18, %.lr.ph.new ], [ 0.000000e+00, %.preheader77 ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv131
  %4 = load double, double* %3, align 8
  %5 = fmul double %4, %4
  %6 = fadd double %.079, %5
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv131
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %6, %9
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv131
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv131
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond135.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond135.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %19 = tail call double @sqrt(double %18) #4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv131
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv131
  store double %19, double* %21, align 8
  %sunkaddr185 = ptrtoint [1200 x double]* %20 to i64
  %sunkaddr186 = shl i64 %indvars.iv131, 3
  %sunkaddr187 = add i64 %sunkaddr185, %sunkaddr186
  %sunkaddr188 = inttoptr i64 %sunkaddr187 to double*
  br label %.lr.ph82.new

.preheader76:                                     ; preds = %.lr.ph82.new
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %22 = icmp slt i64 %indvars.iv.next132, 1200
  br i1 %22, label %.lr.ph88.split.us.preheader, label %._crit_edge89

.lr.ph88.split.us.preheader:                      ; preds = %.preheader76
  %sunkaddr169 = ptrtoint [1200 x double]* %20 to i64
  %sunkaddr181 = ptrtoint [1200 x double]* %20 to i64
  br label %.lr.ph88.split.us

.lr.ph88.split.us:                                ; preds = %.lr.ph88.split.us.preheader, %.loopexit.us
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %.loopexit.us ], [ %indvars.iv125, %.lr.ph88.split.us.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv127
  store double 0.000000e+00, double* %23, align 8
  %sunkaddr170 = shl i64 %indvars.iv127, 3
  %sunkaddr171 = add i64 %sunkaddr169, %sunkaddr170
  %sunkaddr172 = inttoptr i64 %sunkaddr171 to double*
  br label %.lr.ph88.split.us.new

.lr.ph88.split.us.new:                            ; preds = %.lr.ph88.split.us, %.lr.ph88.split.us.new
  %indvars.iv117 = phi i64 [ %indvars.iv.next118.1, %.lr.ph88.split.us.new ], [ 0, %.lr.ph88.split.us ]
  %24 = phi double [ %36, %.lr.ph88.split.us.new ], [ 0.000000e+00, %.lr.ph88.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv117, i64 %indvars.iv131
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv117, i64 %indvars.iv127
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %sunkaddr172, align 8
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next118, i64 %indvars.iv131
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next118, i64 %indvars.iv127
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %sunkaddr172, align 8
  %indvars.iv.next118.1 = add nuw nsw i64 %indvars.iv117, 2
  %exitcond.1146 = icmp eq i64 %indvars.iv.next118.1, 1000
  br i1 %exitcond.1146, label %.lr.ph87.us.new.preheader, label %.lr.ph88.split.us.new

.lr.ph87.us.new.preheader:                        ; preds = %.lr.ph88.split.us.new
  %sunkaddr182 = shl i64 %indvars.iv127, 3
  %sunkaddr183 = add i64 %sunkaddr181, %sunkaddr182
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to double*
  br label %.lr.ph87.us.new

.lr.ph87.us.new:                                  ; preds = %.lr.ph87.us.new.preheader, %.lr.ph87.us.new
  %indvars.iv121 = phi i64 [ %indvars.iv.next122.1, %.lr.ph87.us.new ], [ 0, %.lr.ph87.us.new.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv121, i64 %indvars.iv127
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv121, i64 %indvars.iv131
  %40 = load double, double* %39, align 8
  %41 = load double, double* %sunkaddr184, align 8
  %42 = fmul double %40, %41
  %43 = fsub double %38, %42
  store double %43, double* %37, align 8
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next122, i64 %indvars.iv127
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next122, i64 %indvars.iv131
  %47 = load double, double* %46, align 8
  %48 = load double, double* %sunkaddr184, align 8
  %49 = fmul double %47, %48
  %50 = fsub double %45, %49
  store double %50, double* %44, align 8
  %indvars.iv.next122.1 = add nuw nsw i64 %indvars.iv121, 2
  %exitcond.1152 = icmp eq i64 %indvars.iv.next122.1, 1000
  br i1 %exitcond.1152, label %.loopexit.us, label %.lr.ph87.us.new

.loopexit.us:                                     ; preds = %.lr.ph87.us.new
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond = icmp eq i64 %indvars.iv.next128, 1200
  br i1 %exitcond, label %._crit_edge89.loopexit, label %.lr.ph88.split.us

.lr.ph82.new:                                     ; preds = %._crit_edge, %.lr.ph82.new
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %.lr.ph82.new ], [ 0, %._crit_edge ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv131
  %52 = load double, double* %51, align 8
  %53 = load double, double* %sunkaddr188, align 8
  %54 = fdiv double %52, %53
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv107, i64 %indvars.iv131
  store double %54, double* %55, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next108, i64 %indvars.iv131
  %57 = load double, double* %56, align 8
  %58 = load double, double* %sunkaddr188, align 8
  %59 = fdiv double %57, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next108, i64 %indvars.iv131
  store double %59, double* %60, align 8
  %indvars.iv.next108.1 = add nuw nsw i64 %indvars.iv107, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next108.1, 1000
  br i1 %exitcond.1, label %.preheader76, label %.lr.ph82.new

._crit_edge89.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit, %.preheader76
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond155 = icmp eq i64 %indvars.iv.next132, 1200
  br i1 %exitcond155, label %._crit_edge91, label %.preheader77

._crit_edge91:                                    ; preds = %._crit_edge89
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader25.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %._crit_edge32.us, %.preheader25.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader25.us.preheader ], [ %indvars.iv.next50, %._crit_edge32.us ]
  %6 = mul nuw nsw i64 %indvars.iv49, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader25.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %14 ], [ 0, %.preheader25.us ]
  %8 = add nuw nsw i64 %indvars.iv45, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc38.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv45
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond54, label %._crit_edge32.us, label %7

._crit_edge32.us:                                 ; preds = %14
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond55, label %._crit_edge35, label %.preheader25.us

._crit_edge35:                                    ; preds = %._crit_edge32.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge35
  %indvars.iv40 = phi i64 [ 0, %._crit_edge35 ], [ %indvars.iv.next41, %._crit_edge.us ]
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
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6
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
  br i1 %exitcond, label %._crit_edge29, label %.preheader.us

._crit_edge29:                                    ; preds = %._crit_edge.us
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #6
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
