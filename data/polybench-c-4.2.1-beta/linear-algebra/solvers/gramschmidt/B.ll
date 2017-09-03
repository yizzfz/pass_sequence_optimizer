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
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.lr.ph, %._crit_edge11.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %._crit_edge.lr.ph ]
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %5 ], [ 0, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv19
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond32, label %._crit_edge11.us, label %5

._crit_edge11.us:                                 ; preds = %5
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond36, label %._crit_edge6.us.3.preheader, label %._crit_edge.us

._crit_edge6.us.3.preheader:                      ; preds = %._crit_edge11.us
  br label %._crit_edge6.us.3

._crit_edge8:                                     ; preds = %._crit_edge6.us.3
  ret void

._crit_edge6.us.3:                                ; preds = %._crit_edge6.us.3, %._crit_edge6.us.3.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge6.us.3.preheader ], [ %indvars.iv.next16.3.1, %._crit_edge6.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv15, i64 0
  %scevgep30 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16, i64 0
  %scevgep30.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.1 = or i64 %indvars.iv15, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.1, i64 0
  %scevgep30.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.2 = or i64 %indvars.iv15, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.2, i64 0
  %scevgep30.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.3 = or i64 %indvars.iv15, 4
  %scevgep.137 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.3, i64 0
  %scevgep30.138 = bitcast double* %scevgep.137 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30.138, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.139 = or i64 %indvars.iv15, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.139, i64 0
  %scevgep30.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.1.1 = or i64 %indvars.iv15, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.1.1, i64 0
  %scevgep30.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.2.1 = or i64 %indvars.iv15, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.2.1, i64 0
  %scevgep30.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep30.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next16.3.1 = add nsw i64 %indvars.iv15, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next16.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge8, label %._crit_edge6.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %._crit_edge.lr.ph
  %indvars.iv55 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next56, %._crit_edge19 ]
  %indvars.iv49 = phi i64 [ 1, %._crit_edge.lr.ph ], [ %indvars.iv.next50, %._crit_edge19 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %._crit_edge ]
  %.08 = phi double [ %20, %.lr.ph.new ], [ 0.000000e+00, %._crit_edge ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv55
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %6
  %8 = fadd double %.08, %7
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv55
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fadd double %8, %11
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv55
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %14
  %16 = fadd double %12, %15
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv55
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fadd double %16, %19
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond60.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond60.3, label %._crit_edge9, label %.lr.ph.new

._crit_edge9:                                     ; preds = %.lr.ph.new
  %21 = tail call double @sqrt(double %20) #4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv55, i64 %indvars.iv55
  store double %21, double* %22, align 8
  br label %.lr.ph12

._crit_edge4:                                     ; preds = %.lr.ph12
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %23 = icmp slt i64 %indvars.iv.next56, 1200
  br i1 %23, label %.lr.ph18.split.us.preheader, label %._crit_edge19

.lr.ph18.split.us.preheader:                      ; preds = %._crit_edge4
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %._crit_edge6.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge6.us ], [ %indvars.iv49, %.lr.ph18.split.us.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv55, i64 %indvars.iv51
  store double 0.000000e+00, double* %24, align 8
  br label %.lr.ph18.split.us.new

.lr.ph18.split.us.new:                            ; preds = %.lr.ph18.split.us, %.lr.ph18.split.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %.lr.ph18.split.us.new ], [ 0, %.lr.ph18.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv55
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv41, i64 %indvars.iv51
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %24, align 8
  %31 = fadd double %30, %29
  store double %31, double* %24, align 8
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next42, i64 %indvars.iv55
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next42, i64 %indvars.iv51
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %24, align 8
  %38 = fadd double %37, %36
  store double %38, double* %24, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next42.1, 1000
  br i1 %exitcond65.1, label %.lr.ph17.us.preheader, label %.lr.ph18.split.us.new

.lr.ph17.us.preheader:                            ; preds = %.lr.ph18.split.us.new
  br label %.lr.ph17.us

.lr.ph17.us:                                      ; preds = %.lr.ph17.us.preheader, %.lr.ph17.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %.lr.ph17.us ], [ 0, %.lr.ph17.us.preheader ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv51
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv55
  %42 = load double, double* %41, align 8
  %43 = load double, double* %24, align 8
  %44 = fmul double %42, %43
  %45 = fsub double %40, %44
  store double %45, double* %39, align 8
  %indvars.iv.next46 = or i64 %indvars.iv45, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next46, i64 %indvars.iv51
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next46, i64 %indvars.iv55
  %49 = load double, double* %48, align 8
  %50 = load double, double* %24, align 8
  %51 = fmul double %49, %50
  %52 = fsub double %47, %51
  store double %52, double* %46, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next46.1, 1000
  br i1 %exitcond67.1, label %._crit_edge6.us, label %.lr.ph17.us

._crit_edge6.us:                                  ; preds = %.lr.ph17.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next52, 1200
  br i1 %exitcond69, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

.lr.ph12:                                         ; preds = %._crit_edge9, %.lr.ph12
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %.lr.ph12 ], [ 0, %._crit_edge9 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv55
  %54 = load double, double* %53, align 8
  %55 = load double, double* %22, align 8
  %56 = fdiv double %54, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv55
  store double %56, double* %57, align 8
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next32, i64 %indvars.iv55
  %59 = load double, double* %58, align 8
  %60 = load double, double* %22, align 8
  %61 = fdiv double %59, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next32, i64 %indvars.iv55
  store double %61, double* %62, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next32.1, 1000
  br i1 %exitcond.1, label %._crit_edge4, label %.lr.ph12

._crit_edge19.loopexit:                           ; preds = %._crit_edge6.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge4
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond73, label %._crit_edge21, label %._crit_edge

._crit_edge21:                                    ; preds = %._crit_edge19
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge13.us, %._crit_edge.us.preheader
  %indvars.iv26 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next27, %._crit_edge13.us ]
  %8 = mul nsw i64 %indvars.iv26, 1200
  br label %9

; <label>:9:                                      ; preds = %._crit_edge4.us, %._crit_edge.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge4.us ], [ 0, %._crit_edge.us ]
  %10 = add nsw i64 %indvars.iv22, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge4.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv22
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond33, label %._crit_edge13.us, label %9

._crit_edge13.us:                                 ; preds = %._crit_edge4.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond35, label %._crit_edge15, label %._crit_edge.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge8.us, %._crit_edge15
  %indvars.iv17 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next18, %._crit_edge8.us ]
  %24 = mul nsw i64 %indvars.iv17, 1200
  br label %25

; <label>:25:                                     ; preds = %._crit_edge6.us, %._crit_edge5.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge6.us ], [ 0, %._crit_edge5.us ]
  %26 = add nsw i64 %indvars.iv, %24
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %._crit_edge6.us

; <label>:30:                                     ; preds = %25
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %25, %30
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond31, label %._crit_edge8.us, label %25

._crit_edge8.us:                                  ; preds = %._crit_edge6.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond, label %._crit_edge10, label %._crit_edge5.us

._crit_edge10:                                    ; preds = %._crit_edge8.us
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
