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
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader2.us.preheader:
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %.loopexit7.us..preheader2.us_crit_edge, %.preheader2.us.preheader
  %indvars.iv17 = phi i64 [ 0, %.preheader2.us.preheader ], [ %indvars.iv.next18, %.loopexit7.us..preheader2.us_crit_edge ]
  br label %3

; <label>:3:                                      ; preds = %._crit_edge, %.preheader2.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge ], [ 0, %.preheader2.us ]
  %4 = mul nuw nsw i64 %indvars.iv13, %indvars.iv17
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv13
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv13
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond, label %.loopexit7.us, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %3

.loopexit7.us:                                    ; preds = %3
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond26, label %.preheader.us.preheader, label %.loopexit7.us..preheader2.us_crit_edge

.loopexit7.us..preheader2.us_crit_edge:           ; preds = %.loopexit7.us
  br label %.preheader2.us

.preheader.us.preheader:                          ; preds = %.loopexit7.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10.3.1, %.preheader.us..preheader.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 0
  %scevgep23 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next10, i64 0
  %scevgep23.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10.1 = or i64 %indvars.iv9, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next10.1, i64 0
  %scevgep23.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10.2 = or i64 %indvars.iv9, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next10.2, i64 0
  %scevgep23.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10.3 = or i64 %indvars.iv9, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next10.3, i64 0
  %scevgep23.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10.13 = or i64 %indvars.iv9, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next10.13, i64 0
  %scevgep23.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10.1.1 = or i64 %indvars.iv9, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next10.1.1, i64 0
  %scevgep23.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10.2.1 = or i64 %indvars.iv9, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next10.2.1, i64 0
  %scevgep23.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next10.3.1 = add nsw i64 %indvars.iv9, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next10.3.1, 1200
  br i1 %exitcond.3.1, label %.loopexit6, label %.preheader.us..preheader.us_crit_edge

.preheader.us..preheader.us_crit_edge:            ; preds = %.preheader.us
  br label %.preheader.us

.loopexit6:                                       ; preds = %.preheader.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader2.lr.ph:
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.loopexit16..lr.ph.new_crit_edge, %.preheader2.lr.ph
  %indvars.iv69 = phi i32 [ %indvars.iv.next70, %.loopexit16..lr.ph.new_crit_edge ], [ 1, %.preheader2.lr.ph ]
  %indvars.iv41 = phi i64 [ %4, %.loopexit16..lr.ph.new_crit_edge ], [ 0, %.preheader2.lr.ph ]
  %3 = sext i32 %indvars.iv69 to i64
  %4 = add nuw i64 %indvars.iv41, 1
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.lr.ph.new
  %indvars.iv = phi i64 [ 0, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge ]
  %6 = phi double [ 0.000000e+00, %.lr.ph.new ], [ %22, %._crit_edge ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv41
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %6, %9
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv41
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv41
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv41
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = fadd double %18, %21
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond46.3, label %.lr.ph6.new, label %._crit_edge

._crit_edge:                                      ; preds = %5
  br label %5

.lr.ph6.new:                                      ; preds = %5
  %23 = tail call double @sqrt(double %22) #4
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv41
  store double %23, double* %24, align 8
  br label %56

.preheader1:                                      ; preds = %56
  %25 = icmp slt i64 %4, 1200
  br i1 %25, label %.lr.ph11.split.us.new.preheader, label %.preheader1..loopexit16_crit_edge

.preheader1..loopexit16_crit_edge:                ; preds = %.preheader1
  br label %.loopexit16

.lr.ph11.split.us.new.preheader:                  ; preds = %.preheader1
  br label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.loopexit.us..lr.ph11.split.us.new_crit_edge, %.lr.ph11.split.us.new.preheader
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %.loopexit.us..lr.ph11.split.us.new_crit_edge ], [ %3, %.lr.ph11.split.us.new.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv71
  store double 0.000000e+00, double* %26, align 8
  br label %27

; <label>:27:                                     ; preds = %._crit_edge3, %.lr.ph11.split.us.new
  %28 = phi double [ 0.000000e+00, %.lr.ph11.split.us.new ], [ %40, %._crit_edge3 ]
  %indvars.iv33 = phi i64 [ 0, %.lr.ph11.split.us.new ], [ %indvars.iv.next34.1, %._crit_edge3 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv41
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv71
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %26, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv41
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv71
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %26, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.162 = icmp eq i64 %indvars.iv.next34.1, 1000
  br i1 %exitcond.162, label %.lr.ph10.us.new.preheader, label %._crit_edge3

._crit_edge3:                                     ; preds = %27
  br label %27

.lr.ph10.us.new.preheader:                        ; preds = %27
  br label %.lr.ph10.us.new

.lr.ph10.us.new:                                  ; preds = %.lr.ph10.us.new..lr.ph10.us.new_crit_edge, %.lr.ph10.us.new.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph10.us.new..lr.ph10.us.new_crit_edge ], [ 0, %.lr.ph10.us.new.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv71
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv41
  %44 = load double, double* %43, align 8
  %45 = load double, double* %26, align 8
  %46 = fmul double %44, %45
  %47 = fsub double %42, %46
  store double %47, double* %41, align 8
  %indvars.iv.next38 = or i64 %indvars.iv37, 1
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next38, i64 %indvars.iv71
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next38, i64 %indvars.iv41
  %51 = load double, double* %50, align 8
  %52 = load double, double* %26, align 8
  %53 = fmul double %51, %52
  %54 = fsub double %49, %53
  store double %54, double* %48, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.168 = icmp eq i64 %indvars.iv.next38.1, 1000
  br i1 %exitcond.168, label %.loopexit.us, label %.lr.ph10.us.new..lr.ph10.us.new_crit_edge

.lr.ph10.us.new..lr.ph10.us.new_crit_edge:        ; preds = %.lr.ph10.us.new
  br label %.lr.ph10.us.new

.loopexit.us:                                     ; preds = %.lr.ph10.us.new
  %indvars.iv.next72 = add nsw i64 %indvars.iv71, 1
  %55 = icmp slt i64 %indvars.iv.next72, 1200
  br i1 %55, label %.loopexit.us..lr.ph11.split.us.new_crit_edge, label %.loopexit16.loopexit

.loopexit.us..lr.ph11.split.us.new_crit_edge:     ; preds = %.loopexit.us
  br label %.lr.ph11.split.us.new

; <label>:56:                                     ; preds = %._crit_edge4, %.lr.ph6.new
  %indvars.iv29 = phi i64 [ 0, %.lr.ph6.new ], [ %indvars.iv.next30.1, %._crit_edge4 ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv41
  %58 = load double, double* %57, align 8
  %59 = load double, double* %24, align 8
  %60 = fdiv double %58, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv41
  store double %60, double* %61, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next30, i64 %indvars.iv41
  %63 = load double, double* %62, align 8
  %64 = load double, double* %24, align 8
  %65 = fdiv double %63, %64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next30, i64 %indvars.iv41
  store double %65, double* %66, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next30.1, 1000
  br i1 %exitcond.1, label %.preheader1, label %._crit_edge4

._crit_edge4:                                     ; preds = %56
  br label %56

.loopexit16.loopexit:                             ; preds = %.loopexit.us
  br label %.loopexit16

.loopexit16:                                      ; preds = %.preheader1..loopexit16_crit_edge, %.loopexit16.loopexit
  %indvars.iv.next70 = add i32 %indvars.iv69, 1
  %exitcond = icmp eq i64 %4, 1200
  br i1 %exitcond, label %.loopexit18, label %.loopexit16..lr.ph.new_crit_edge

.loopexit16..lr.ph.new_crit_edge:                 ; preds = %.loopexit16
  br label %.lr.ph.new

.loopexit18:                                      ; preds = %.loopexit16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader4.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.loopexit10.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next23, %.loopexit10.us..preheader4.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv22, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge._crit_edge, %.preheader4.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge._crit_edge ], [ 0, %.preheader4.us ]
  %8 = add nsw i64 %indvars.iv18, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv18
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond27, label %.loopexit10.us, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %7

.loopexit10.us:                                   ; preds = %._crit_edge
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond28, label %.preheader.us.preheader, label %.loopexit10.us..preheader4.us_crit_edge

.loopexit10.us..preheader4.us_crit_edge:          ; preds = %.loopexit10.us
  br label %.preheader4.us

.preheader.us.preheader:                          ; preds = %.loopexit10.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %.loopexit.us..preheader.us_crit_edge ]
  %22 = mul nsw i64 %indvars.iv13, 1200
  br label %23

; <label>:23:                                     ; preds = %._crit_edge2._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2._crit_edge ], [ 0, %.preheader.us ]
  %24 = add nsw i64 %indvars.iv, %22
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %.._crit_edge2_crit_edge

.._crit_edge2_crit_edge:                          ; preds = %23
  br label %._crit_edge2

; <label>:28:                                     ; preds = %23
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %29) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %.._crit_edge2_crit_edge, %28
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond26, label %.loopexit.us, label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2
  br label %23

.loopexit.us:                                     ; preds = %._crit_edge2
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond, label %.loopexit9, label %.loopexit.us..preheader.us_crit_edge

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit9:                                       ; preds = %.loopexit.us
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
