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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader9.lr.ph:
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.lr.ph, %._crit_edge17.us
  %indvars.iv718.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge17.us ], [ 0, %.preheader9.lr.ph ]
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader9.us
  %indvars.iv515.us = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next6.us, %3 ]
  %4 = mul nuw nsw i64 %indvars.iv515.us, %indvars.iv718.us
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv718.us, i64 %indvars.iv515.us
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv718.us, i64 %indvars.iv515.us
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv515.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next6.us, 1200
  br i1 %exitcond25, label %._crit_edge17.us, label %3

._crit_edge17.us:                                 ; preds = %3
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv718.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next8.us, 1000
  br i1 %exitcond26, label %.preheader.preheader, label %.preheader9.us

.preheader.preheader:                             ; preds = %._crit_edge17.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv312 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next4.3.1, %.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv312, i64 0
  %scevgep28 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4 = or i64 %indvars.iv312, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next4, i64 0
  %scevgep28.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4.1 = or i64 %indvars.iv312, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next4.1, i64 0
  %scevgep28.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4.2 = or i64 %indvars.iv312, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next4.2, i64 0
  %scevgep28.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4.3 = or i64 %indvars.iv312, 4
  %scevgep.132 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next4.3, i64 0
  %scevgep28.133 = bitcast double* %scevgep.132 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.133, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4.134 = or i64 %indvars.iv312, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next4.134, i64 0
  %scevgep28.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4.1.1 = or i64 %indvars.iv312, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next4.1.1, i64 0
  %scevgep28.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4.2.1 = or i64 %indvars.iv312, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next4.2.1, i64 0
  %scevgep28.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next4.3.1 = add nsw i64 %indvars.iv312, 8
  %exitcond24.3.1 = icmp eq i64 %indvars.iv.next4.3.1, 1200
  br i1 %exitcond24.3.1, label %._crit_edge14, label %.preheader

._crit_edge14:                                    ; preds = %.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader17.lr.ph:
  br label %.preheader17

.preheader17:                                     ; preds = %._crit_edge33, %.preheader17.lr.ph
  %indvars.iv = phi i64 [ 1, %.preheader17.lr.ph ], [ %indvars.iv.next60, %._crit_edge33 ]
  %indvars.iv1434 = phi i64 [ 0, %.preheader17.lr.ph ], [ %indvars.iv.next15, %._crit_edge33 ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader17, %.lr.ph
  %.019 = phi double [ %18, %.lr.ph ], [ 0.000000e+00, %.preheader17 ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ 0, %.preheader17 ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv1434
  %4 = load double, double* %3, align 8
  %5 = fmul double %4, %4
  %6 = fadd double %.019, %5
  %indvars.iv.next = or i64 %indvars.iv18, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv1434
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %6, %9
  %indvars.iv.next.1 = or i64 %indvars.iv18, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv1434
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.2 = or i64 %indvars.iv18, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv1434
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.3 = add nsw i64 %indvars.iv18, 4
  %exitcond55.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond55.3, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph
  %19 = tail call double @sqrt(double %18) #4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1434, i64 %indvars.iv1434
  store double %19, double* %20, align 8
  br label %.lr.ph22.new

.preheader16:                                     ; preds = %.lr.ph22.new
  %exitcond29 = icmp eq i64 %indvars.iv, 1200
  br i1 %exitcond29, label %._crit_edge33, label %.lr.ph32.split.us.preheader

.lr.ph32.split.us.preheader:                      ; preds = %.preheader16
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge28.us
  %indvars.iv1230.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge28.us ], [ %indvars.iv, %.lr.ph32.split.us.preheader ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1434, i64 %indvars.iv1230.us
  store double 0.000000e+00, double* %21, align 8
  br label %.lr.ph32.split.us.new

.lr.ph32.split.us.new:                            ; preds = %.lr.ph32.split.us, %.lr.ph32.split.us.new
  %22 = phi double [ %34, %.lr.ph32.split.us.new ], [ 0.000000e+00, %.lr.ph32.split.us ]
  %indvars.iv623.us = phi i64 [ %indvars.iv.next7.us.1, %.lr.ph32.split.us.new ], [ 0, %.lr.ph32.split.us ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv623.us, i64 %indvars.iv1434
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv623.us, i64 %indvars.iv1230.us
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %21, align 8
  %indvars.iv.next7.us = or i64 %indvars.iv623.us, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next7.us, i64 %indvars.iv1434
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next7.us, i64 %indvars.iv1230.us
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %21, align 8
  %indvars.iv.next7.us.1 = add nsw i64 %indvars.iv623.us, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next7.us.1, 1000
  br i1 %exitcond58.1, label %.lr.ph27.us.new.preheader, label %.lr.ph32.split.us.new

.lr.ph27.us.new.preheader:                        ; preds = %.lr.ph32.split.us.new
  br label %.lr.ph27.us.new

.lr.ph27.us.new:                                  ; preds = %.lr.ph27.us.new.preheader, %.lr.ph27.us.new..lr.ph27.us.new_crit_edge
  %35 = phi double [ %.pre82, %.lr.ph27.us.new..lr.ph27.us.new_crit_edge ], [ %34, %.lr.ph27.us.new.preheader ]
  %indvars.iv826.us = phi i64 [ %indvars.iv.next9.us.1, %.lr.ph27.us.new..lr.ph27.us.new_crit_edge ], [ 0, %.lr.ph27.us.new.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv826.us, i64 %indvars.iv1230.us
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv826.us, i64 %indvars.iv1434
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %35
  %41 = fsub double %37, %40
  store double %41, double* %36, align 8
  %indvars.iv.next9.us = or i64 %indvars.iv826.us, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next9.us, i64 %indvars.iv1230.us
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next9.us, i64 %indvars.iv1434
  %45 = load double, double* %44, align 8
  %46 = load double, double* %21, align 8
  %47 = fmul double %45, %46
  %48 = fsub double %43, %47
  store double %48, double* %42, align 8
  %indvars.iv.next9.us.1 = add nsw i64 %indvars.iv826.us, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next9.us.1, 1000
  br i1 %exitcond59.1, label %._crit_edge28.us, label %.lr.ph27.us.new..lr.ph27.us.new_crit_edge

.lr.ph27.us.new..lr.ph27.us.new_crit_edge:        ; preds = %.lr.ph27.us.new
  %.pre82 = load double, double* %21, align 8
  br label %.lr.ph27.us.new

._crit_edge28.us:                                 ; preds = %.lr.ph27.us.new
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1230.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next13.us, 1200
  br i1 %exitcond.us, label %._crit_edge33.loopexit, label %.lr.ph32.split.us

.lr.ph22.new:                                     ; preds = %.lr.ph22.new..lr.ph22.new_crit_edge, %._crit_edge
  %49 = phi double [ %.pre, %.lr.ph22.new..lr.ph22.new_crit_edge ], [ %19, %._crit_edge ]
  %indvars.iv420 = phi i64 [ %indvars.iv.next5.1, %.lr.ph22.new..lr.ph22.new_crit_edge ], [ 0, %._crit_edge ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv420, i64 %indvars.iv1434
  %51 = load double, double* %50, align 8
  %52 = fdiv double %51, %49
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv420, i64 %indvars.iv1434
  store double %52, double* %53, align 8
  %indvars.iv.next5 = or i64 %indvars.iv420, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv1434
  %55 = load double, double* %54, align 8
  %56 = load double, double* %20, align 8
  %57 = fdiv double %55, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next5, i64 %indvars.iv1434
  store double %57, double* %58, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv420, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next5.1, 1000
  br i1 %exitcond56.1, label %.preheader16, label %.lr.ph22.new..lr.ph22.new_crit_edge

.lr.ph22.new..lr.ph22.new_crit_edge:              ; preds = %.lr.ph22.new
  %.pre = load double, double* %20, align 8
  br label %.lr.ph22.new

._crit_edge33.loopexit:                           ; preds = %._crit_edge28.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader16
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1434, 1
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond61, label %._crit_edge37, label %.preheader17

._crit_edge37:                                    ; preds = %._crit_edge33
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader4.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge13, %.preheader4.preheader
  %indvars.iv714 = phi i64 [ %indvars.iv.next8, %._crit_edge13 ], [ 0, %.preheader4.preheader ]
  %6 = mul nsw i64 %indvars.iv714, 1200
  br label %7

; <label>:7:                                      ; preds = %.preheader4, %14
  %indvars.iv511 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next6, %14 ]
  %8 = add nsw i64 %indvars.iv511, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv714, i64 %indvars.iv511
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %._crit_edge13, label %7

._crit_edge13:                                    ; preds = %14
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv714, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond23, label %._crit_edge16, label %.preheader4

._crit_edge16:                                    ; preds = %._crit_edge13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge16, %._crit_edge.us
  %indvars.iv37.us = phi i64 [ %indvars.iv.next4.us, %._crit_edge.us ], [ 0, %._crit_edge16 ]
  %23 = mul nsw i64 %indvars.iv37.us, 1200
  br label %24

; <label>:24:                                     ; preds = %31, %.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %31 ]
  %25 = add nsw i64 %indvars.iv6.us, %23
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
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv37.us, i64 %indvars.iv6.us
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond20, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %31
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv37.us, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond21, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
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
