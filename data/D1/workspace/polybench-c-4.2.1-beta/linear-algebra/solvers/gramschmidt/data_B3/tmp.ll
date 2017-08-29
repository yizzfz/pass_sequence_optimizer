; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.lr.ph, %._crit_edge10.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge10.us ], [ 0, %.preheader4.lr.ph ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader4.us
  %indvars.iv15 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next16, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv15, %indvars.iv20
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv15
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv15
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond, label %._crit_edge10.us, label %5

._crit_edge10.us:                                 ; preds = %5
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond23, label %._crit_edge.us.3.preheader, label %.preheader4.us

._crit_edge.us.3.preheader:                       ; preds = %._crit_edge10.us
  br label %._crit_edge.us.3

._crit_edge7:                                     ; preds = %._crit_edge.us.3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.us.3.preheader ], [ %indvars.iv.next.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 0
  %scevgep14 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next = or i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 0
  %scevgep14.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1, i64 0
  %scevgep14.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2, i64 0
  %scevgep14.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %scevgep.125 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.3, i64 0
  %scevgep14.126 = bitcast double* %scevgep.125 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.126, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.127 = or i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.127, i64 0
  %scevgep14.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.1, i64 0
  %scevgep14.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2.1 = or i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.1, i64 0
  %scevgep14.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge7, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader5.lr.ph:
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge19, %.preheader5.lr.ph
  %indvars.iv68 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next69, %._crit_edge19 ]
  %indvars.iv61 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next62, %._crit_edge19 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader5, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader5 ]
  %.07 = phi double [ %20, %.lr.ph.new ], [ 0.000000e+00, %.preheader5 ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv68
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %6
  %8 = fadd double %.07, %7
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv68
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fadd double %8, %11
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv68
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %14
  %16 = fadd double %12, %15
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv68
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fadd double %16, %19
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %21 = tail call double @sqrt(double %20) #4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv68
  store double %21, double* %22, align 8
  br label %.lr.ph10

.preheader4:                                      ; preds = %.lr.ph10
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %23 = icmp slt i64 %indvars.iv.next69, 1200
  br i1 %23, label %.lr.ph18.split.us.preheader, label %._crit_edge19

.lr.ph18.split.us.preheader:                      ; preds = %.preheader4
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %.loopexit.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.loopexit.us ], [ %indvars.iv61, %.lr.ph18.split.us.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv63
  store double 0.000000e+00, double* %24, align 8
  br label %.lr.ph18.split.us.new

.loopexit.us:                                     ; preds = %.lr.ph15.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader, %.lr.ph15.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.lr.ph15.us ], [ 0, %.lr.ph15.us.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv63
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv68
  %28 = load double, double* %27, align 8
  %29 = load double, double* %24, align 8
  %30 = fmul double %28, %29
  %31 = fsub double %26, %30
  store double %31, double* %25, align 8
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next55, i64 %indvars.iv63
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next55, i64 %indvars.iv68
  %35 = load double, double* %34, align 8
  %36 = load double, double* %24, align 8
  %37 = fmul double %35, %36
  %38 = fsub double %33, %37
  store double %38, double* %32, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond.160 = icmp eq i64 %indvars.iv.next55.1, 1000
  br i1 %exitcond.160, label %.loopexit.us, label %.lr.ph15.us

.lr.ph18.split.us.new:                            ; preds = %.lr.ph18.split.us, %.lr.ph18.split.us.new
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %.lr.ph18.split.us.new ], [ 0, %.lr.ph18.split.us ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv68
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv63
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = load double, double* %24, align 8
  %45 = fadd double %44, %43
  store double %45, double* %24, align 8
  %indvars.iv.next46 = or i64 %indvars.iv45, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next46, i64 %indvars.iv68
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next46, i64 %indvars.iv63
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %24, align 8
  %52 = fadd double %51, %50
  store double %52, double* %24, align 8
  %indvars.iv.next46.1 = add nuw nsw i64 %indvars.iv45, 2
  %exitcond.153 = icmp eq i64 %indvars.iv.next46.1, 1000
  br i1 %exitcond.153, label %.lr.ph15.us.preheader, label %.lr.ph18.split.us.new

.lr.ph15.us.preheader:                            ; preds = %.lr.ph18.split.us.new
  br label %.lr.ph15.us

.lr.ph10:                                         ; preds = %._crit_edge, %.lr.ph10
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.lr.ph10 ], [ 0, %._crit_edge ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv68
  %54 = load double, double* %53, align 8
  %55 = load double, double* %22, align 8
  %56 = fdiv double %54, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33, i64 %indvars.iv68
  store double %56, double* %57, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv68
  %59 = load double, double* %58, align 8
  %60 = load double, double* %22, align 8
  %61 = fdiv double %59, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next34, i64 %indvars.iv68
  store double %61, double* %62, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next34.1, 1000
  br i1 %exitcond.1, label %.preheader4, label %.lr.ph10

._crit_edge19.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 1200
  br i1 %exitcond71, label %._crit_edge31, label %.preheader5

._crit_edge31:                                    ; preds = %._crit_edge19
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader4.us.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge10.us ]
  %8 = mul nuw nsw i64 %indvars.iv23, 1200
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %16 ]
  %10 = add nuw nsw i64 %indvars.iv19, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond22, label %._crit_edge10.us, label %9

._crit_edge10.us:                                 ; preds = %16
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond26, label %._crit_edge12, label %.preheader4.us

._crit_edge12:                                    ; preds = %._crit_edge10.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge12
  %indvars.iv14 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next15, %._crit_edge.us ]
  %25 = mul nuw nsw i64 %indvars.iv14, 1200
  br label %26

; <label>:26:                                     ; preds = %33, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %33 ]
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
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %26

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond17, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %40) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
