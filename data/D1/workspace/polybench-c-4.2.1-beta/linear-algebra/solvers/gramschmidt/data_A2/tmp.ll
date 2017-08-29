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

._crit_edge.us:                                   ; preds = %._crit_edge.lr.ph, %._crit_edge17.us
  %indvars.iv518.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge17.us ], [ 0, %._crit_edge.lr.ph ]
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge.us
  %indvars.iv315.us = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next4.us, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv315.us, %indvars.iv518.us
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv518.us, i64 %indvars.iv315.us
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv518.us, i64 %indvars.iv315.us
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv315.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond, label %._crit_edge17.us, label %5

._crit_edge17.us:                                 ; preds = %5
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv518.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond25, label %._crit_edge11.3.preheader, label %._crit_edge.us

._crit_edge11.3.preheader:                        ; preds = %._crit_edge17.us
  br label %._crit_edge11.3

._crit_edge14:                                    ; preds = %._crit_edge11.3
  ret void

._crit_edge11.3:                                  ; preds = %._crit_edge11.3, %._crit_edge11.3.preheader
  %indvars.iv112 = phi i64 [ 0, %._crit_edge11.3.preheader ], [ %indvars.iv.next2.3.1, %._crit_edge11.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 0
  %scevgep22 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2 = or i64 %indvars.iv112, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next2, i64 0
  %scevgep22.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.1 = or i64 %indvars.iv112, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next2.1, i64 0
  %scevgep22.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.2 = or i64 %indvars.iv112, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next2.2, i64 0
  %scevgep22.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.3 = or i64 %indvars.iv112, 4
  %scevgep.127 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next2.3, i64 0
  %scevgep22.128 = bitcast double* %scevgep.127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.128, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.129 = or i64 %indvars.iv112, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next2.129, i64 0
  %scevgep22.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.1.1 = or i64 %indvars.iv112, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next2.1.1, i64 0
  %scevgep22.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.2.1 = or i64 %indvars.iv112, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next2.2.1, i64 0
  %scevgep22.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.3.1 = add nsw i64 %indvars.iv112, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next2.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge14, label %._crit_edge11.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge31, %._crit_edge.lr.ph
  %indvars.iv = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next68, %._crit_edge31 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge, %.lr.ph.new
  %5 = phi double [ %21, %.lr.ph.new ], [ 0.000000e+00, %._crit_edge ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %._crit_edge ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fadd double %5, %8
  %indvars.iv.next = or i64 %indvars.iv16, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %9, %12
  %indvars.iv.next.1 = or i64 %indvars.iv16, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %13, %16
  %indvars.iv.next.2 = or i64 %indvars.iv16, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv16, 4
  %exitcond51.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond51.3, label %._crit_edge17, label %.lr.ph.new

._crit_edge17:                                    ; preds = %.lr.ph.new
  %22 = tail call double @sqrt(double %21) #4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv
  store double %22, double* %23, align 8
  br label %.lr.ph20

._crit_edge11:                                    ; preds = %.lr.ph20
  %exitcond28 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond28, label %._crit_edge31, label %.lr.ph30.split.us.preheader

.lr.ph30.split.us.preheader:                      ; preds = %._crit_edge11
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge13.us
  %indvars.iv.next1029.us.in = phi i64 [ %indvars.iv.next1029.us, %._crit_edge13.us ], [ %indvars.iv, %.lr.ph30.split.us.preheader ]
  %indvars.iv.next1029.us = add nuw nsw i64 %indvars.iv.next1029.us.in, 1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv.next1029.us
  store double 0.000000e+00, double* %24, align 8
  br label %.lr.ph30.split.us.new

._crit_edge13.us:                                 ; preds = %.lr.ph26.us.new
  %exitcond.us = icmp eq i64 %indvars.iv.next1029.us, 1199
  br i1 %exitcond.us, label %._crit_edge31.loopexit, label %.lr.ph30.split.us

.lr.ph26.us.new:                                  ; preds = %.lr.ph26.us.new..lr.ph26.us.new_crit_edge, %.lr.ph26.us
  %25 = phi double [ %.pre74, %.lr.ph26.us.new..lr.ph26.us.new_crit_edge ], [ %51, %.lr.ph26.us ]
  %indvars.iv725.us = phi i64 [ %indvars.iv.next8.us.1, %.lr.ph26.us.new..lr.ph26.us.new_crit_edge ], [ 0, %.lr.ph26.us ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv725.us, i64 %indvars.iv.next1029.us
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv725.us, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %25
  %31 = fsub double %27, %30
  store double %31, double* %26, align 8
  %indvars.iv.next8.us = or i64 %indvars.iv725.us, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next8.us, i64 %indvars.iv.next1029.us
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next8.us, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = load double, double* %24, align 8
  %37 = fmul double %35, %36
  %38 = fsub double %33, %37
  store double %38, double* %32, align 8
  %indvars.iv.next8.us.1 = add nuw nsw i64 %indvars.iv725.us, 2
  %exitcond.165 = icmp eq i64 %indvars.iv.next8.us.1, 1000
  br i1 %exitcond.165, label %._crit_edge13.us, label %.lr.ph26.us.new..lr.ph26.us.new_crit_edge

.lr.ph26.us.new..lr.ph26.us.new_crit_edge:        ; preds = %.lr.ph26.us.new
  %.pre74 = load double, double* %24, align 8
  br label %.lr.ph26.us.new

.lr.ph30.split.us.new:                            ; preds = %.lr.ph30.split.us, %.lr.ph30.split.us.new
  %39 = phi double [ %51, %.lr.ph30.split.us.new ], [ 0.000000e+00, %.lr.ph30.split.us ]
  %indvars.iv521.us = phi i64 [ %indvars.iv.next6.us.1, %.lr.ph30.split.us.new ], [ 0, %.lr.ph30.split.us ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv521.us, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv521.us, i64 %indvars.iv.next1029.us
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %39, %44
  store double %45, double* %24, align 8
  %indvars.iv.next6.us = or i64 %indvars.iv521.us, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next6.us, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next6.us, i64 %indvars.iv.next1029.us
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %45, %50
  store double %51, double* %24, align 8
  %indvars.iv.next6.us.1 = add nuw nsw i64 %indvars.iv521.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next6.us.1, 1000
  br i1 %exitcond.1, label %.lr.ph26.us, label %.lr.ph30.split.us.new

.lr.ph26.us:                                      ; preds = %.lr.ph30.split.us.new
  br label %.lr.ph26.us.new

.lr.ph20:                                         ; preds = %.lr.ph20..lr.ph20_crit_edge, %._crit_edge17
  %52 = phi double [ %.pre, %.lr.ph20..lr.ph20_crit_edge ], [ %22, %._crit_edge17 ]
  %indvars.iv318 = phi i64 [ %indvars.iv.next4.1, %.lr.ph20..lr.ph20_crit_edge ], [ 0, %._crit_edge17 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv318, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fdiv double %54, %52
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv318, i64 %indvars.iv
  store double %55, double* %56, align 8
  %indvars.iv.next4 = or i64 %indvars.iv318, 1
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next4, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = load double, double* %23, align 8
  %60 = fdiv double %58, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next4, i64 %indvars.iv
  store double %60, double* %61, align 8
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv318, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next4.1, 1000
  br i1 %exitcond52.1, label %._crit_edge11, label %.lr.ph20..lr.ph20_crit_edge

.lr.ph20..lr.ph20_crit_edge:                      ; preds = %.lr.ph20
  %.pre = load double, double* %23, align 8
  br label %.lr.ph20

._crit_edge31.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %._crit_edge11
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next68, 1200
  br i1 %exitcond, label %._crit_edge48, label %._crit_edge

._crit_edge48:                                    ; preds = %._crit_edge31
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %._crit_edge.preheader
  %indvars.iv822 = phi i64 [ %indvars.iv.next9, %._crit_edge21 ], [ 0, %._crit_edge.preheader ]
  %8 = mul nuw nsw i64 %indvars.iv822, 1200
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %._crit_edge10
  %indvars.iv619 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next7, %._crit_edge10 ]
  %10 = add nuw nsw i64 %indvars.iv619, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge10

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv822, i64 %indvars.iv619
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv619, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond, label %._crit_edge21, label %9

._crit_edge21:                                    ; preds = %._crit_edge10
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv822, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond30, label %._crit_edge24, label %._crit_edge

._crit_edge24:                                    ; preds = %._crit_edge21
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge24, %._crit_edge14.us
  %indvars.iv415.us = phi i64 [ %indvars.iv.next5.us, %._crit_edge14.us ], [ 0, %._crit_edge24 ]
  %24 = mul nuw nsw i64 %indvars.iv415.us, 1200
  br label %25

; <label>:25:                                     ; preds = %._crit_edge12.us, %._crit_edge11.us
  %indvars.iv13.us = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next.us, %._crit_edge12.us ]
  %26 = add nuw nsw i64 %indvars.iv13.us, %24
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %._crit_edge12.us

; <label>:30:                                     ; preds = %25
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %25, %30
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv415.us, i64 %indvars.iv13.us
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond27, label %._crit_edge14.us, label %25

._crit_edge14.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv415.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next5.us, 1000
  br i1 %exitcond28, label %._crit_edge17, label %._crit_edge11.us

._crit_edge17:                                    ; preds = %._crit_edge14.us
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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
