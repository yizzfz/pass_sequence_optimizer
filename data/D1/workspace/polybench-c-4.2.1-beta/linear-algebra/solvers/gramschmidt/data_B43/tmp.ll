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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.lr.ph8:
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8
  %indvars.iv19 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next20, %._crit_edge6.us ]
  br label %5

; <label>:5:                                      ; preds = %5, %.lr.ph8.split.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %5 ], [ 0, %.lr.ph8.split.us ]
  %6 = mul nuw nsw i64 %indvars.iv15, %indvars.iv19
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv15
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv15
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond26, label %._crit_edge6.us, label %5

._crit_edge6.us:                                  ; preds = %5
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond29, label %._crit_edge.us.3.preheader, label %.lr.ph8.split.us

._crit_edge.us.3.preheader:                       ; preds = %._crit_edge6.us
  br label %._crit_edge.us.3

._crit_edge3:                                     ; preds = %._crit_edge.us.3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader
  %indvars.iv11 = phi i64 [ 0, %._crit_edge.us.3.preheader ], [ %indvars.iv.next12.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv11, i64 0
  %scevgep25 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12 = or i64 %indvars.iv11, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12, i64 0
  %scevgep25.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.1 = or i64 %indvars.iv11, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1, i64 0
  %scevgep25.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.2 = or i64 %indvars.iv11, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2, i64 0
  %scevgep25.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.3 = or i64 %indvars.iv11, 4
  %scevgep.130 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.3, i64 0
  %scevgep25.131 = bitcast double* %scevgep.130 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.131, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.132 = or i64 %indvars.iv11, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.132, i64 0
  %scevgep25.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.1.1 = or i64 %indvars.iv11, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1.1, i64 0
  %scevgep25.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.2.1 = or i64 %indvars.iv11, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2.1, i64 0
  %scevgep25.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.3.1 = add nsw i64 %indvars.iv11, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next12.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge3, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.lr.ph28:
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge23, %.lr.ph28
  %indvars.iv62 = phi i64 [ 0, %.lr.ph28 ], [ %indvars.iv.next63, %._crit_edge23 ]
  %indvars.iv56 = phi i64 [ 1, %.lr.ph28 ], [ %indvars.iv.next57, %._crit_edge23 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.lr.ph ]
  %5 = phi double [ %21, %.lr.ph.new ], [ 0.000000e+00, %.lr.ph ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv62
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fadd double %5, %8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv62
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %9, %12
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv62
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %13, %16
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv62
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond67.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %22 = tail call double @sqrt(double %21) #4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv62
  store double %22, double* %23, align 8
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new..lr.ph9.new_crit_edge, %._crit_edge
  %24 = phi double [ %.pre, %.lr.ph9.new..lr.ph9.new_crit_edge ], [ %22, %._crit_edge ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.lr.ph9.new..lr.ph9.new_crit_edge ], [ 0, %._crit_edge ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv62
  %26 = load double, double* %25, align 8
  %27 = fdiv double %26, %24
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv62
  store double %27, double* %28, align 8
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next39, i64 %indvars.iv62
  %30 = load double, double* %29, align 8
  %31 = load double, double* %23, align 8
  %32 = fdiv double %30, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next39, i64 %indvars.iv62
  store double %32, double* %33, align 8
  %indvars.iv.next39.1 = add nuw nsw i64 %indvars.iv38, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next39.1, 1000
  br i1 %exitcond.1, label %._crit_edge10, label %.lr.ph9.new..lr.ph9.new_crit_edge

.lr.ph9.new..lr.ph9.new_crit_edge:                ; preds = %.lr.ph9.new
  %.pre = load double, double* %23, align 8
  br label %.lr.ph9.new

._crit_edge10:                                    ; preds = %.lr.ph9.new
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %34 = icmp slt i64 %indvars.iv.next63, 1200
  br i1 %34, label %.lr.ph22.split.us.preheader, label %._crit_edge23

.lr.ph22.split.us.preheader:                      ; preds = %._crit_edge10
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %.lr.ph22.split.us.preheader, %._crit_edge20.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge20.us ], [ %indvars.iv56, %.lr.ph22.split.us.preheader ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv58
  store double 0.000000e+00, double* %35, align 8
  br label %.lr.ph22.split.us.new

.lr.ph22.split.us.new:                            ; preds = %.lr.ph22.split.us, %.lr.ph22.split.us.new
  %36 = phi double [ %48, %.lr.ph22.split.us.new ], [ 0.000000e+00, %.lr.ph22.split.us ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.lr.ph22.split.us.new ], [ 0, %.lr.ph22.split.us ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv62
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv58
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %35, align 8
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next49, i64 %indvars.iv62
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next49, i64 %indvars.iv58
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %35, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond70.1 = icmp eq i64 %indvars.iv.next49.1, 1000
  br i1 %exitcond70.1, label %.lr.ph19.us.new.preheader, label %.lr.ph22.split.us.new

.lr.ph19.us.new.preheader:                        ; preds = %.lr.ph22.split.us.new
  br label %.lr.ph19.us.new

.lr.ph19.us.new:                                  ; preds = %.lr.ph19.us.new.preheader, %.lr.ph19.us.new..lr.ph19.us.new_crit_edge
  %49 = phi double [ %.pre92, %.lr.ph19.us.new..lr.ph19.us.new_crit_edge ], [ %48, %.lr.ph19.us.new.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.lr.ph19.us.new..lr.ph19.us.new_crit_edge ], [ 0, %.lr.ph19.us.new.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv52, i64 %indvars.iv58
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv62
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %49
  %55 = fsub double %51, %54
  store double %55, double* %50, align 8
  %indvars.iv.next53 = or i64 %indvars.iv52, 1
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next53, i64 %indvars.iv58
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next53, i64 %indvars.iv62
  %59 = load double, double* %58, align 8
  %60 = load double, double* %35, align 8
  %61 = fmul double %59, %60
  %62 = fsub double %57, %61
  store double %62, double* %56, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next53.1, 1000
  br i1 %exitcond71.1, label %._crit_edge20.us, label %.lr.ph19.us.new..lr.ph19.us.new_crit_edge

.lr.ph19.us.new..lr.ph19.us.new_crit_edge:        ; preds = %.lr.ph19.us.new
  %.pre92 = load double, double* %35, align 8
  br label %.lr.ph19.us.new

._crit_edge20.us:                                 ; preds = %.lr.ph19.us.new
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next59, 1200
  br i1 %exitcond72, label %._crit_edge23.loopexit, label %.lr.ph22.split.us

._crit_edge23.loopexit:                           ; preds = %._crit_edge20.us
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %._crit_edge10
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next63, 1200
  br i1 %exitcond75, label %._crit_edge29, label %.lr.ph

._crit_edge29:                                    ; preds = %._crit_edge23
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph8.split.us.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next24, %._crit_edge6.us ]
  %8 = mul nsw i64 %indvars.iv23, 1200
  br label %9

; <label>:9:                                      ; preds = %16, %.lr.ph8.split.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %16 ], [ 0, %.lr.ph8.split.us ]
  %10 = add nsw i64 %indvars.iv19, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc12.us = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond28, label %._crit_edge6.us, label %9

._crit_edge6.us:                                  ; preds = %16
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond29, label %._crit_edge9, label %.lr.ph8.split.us

._crit_edge9:                                     ; preds = %._crit_edge6.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %._crit_edge9
  %indvars.iv14 = phi i64 [ 0, %._crit_edge9 ], [ %indvars.iv.next15, %._crit_edge.us ]
  %25 = mul nsw i64 %indvars.iv14, 1200
  br label %26

; <label>:26:                                     ; preds = %33, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %33 ], [ 0, %.lr.ph2.split.us ]
  %27 = add nsw i64 %indvars.iv, %25
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %26
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %32) #6
  br label %33

; <label>:33:                                     ; preds = %31, %26
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond27, label %._crit_edge.us, label %26

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph2.split.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %40) #6
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
