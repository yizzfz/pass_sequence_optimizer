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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next14, %._crit_edge._crit_edge.us ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge.us ], [ 0, %._crit_edge.preheader.us ]
  %3 = mul nuw nsw i64 %indvars.iv9, %indvars.iv13
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 1000
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = fmul double %7, 1.000000e+02
  %9 = fadd double %8, 1.000000e+01
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv9
  store double %9, double* %10, align 8
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv9
  store double 0.000000e+00, double* %11, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond22, label %._crit_edge1.us.3.preheader, label %._crit_edge.preheader.us

._crit_edge1.us.3.preheader:                      ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge1.us.3

._crit_edge1._crit_edge:                          ; preds = %._crit_edge1.us.3
  ret void

._crit_edge1.us.3:                                ; preds = %._crit_edge1.us.3, %._crit_edge1.us.3.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge1.us.3.preheader ], [ %indvars.iv.next6.3.1, %._crit_edge1.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 0
  %scevgep19 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6 = or i64 %indvars.iv5, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next6, i64 0
  %scevgep19.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6.1 = or i64 %indvars.iv5, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next6.1, i64 0
  %scevgep19.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6.2 = or i64 %indvars.iv5, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next6.2, i64 0
  %scevgep19.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6.3 = or i64 %indvars.iv5, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next6.3, i64 0
  %scevgep19.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6.13 = or i64 %indvars.iv5, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next6.13, i64 0
  %scevgep19.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6.1.1 = or i64 %indvars.iv5, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next6.1.1, i64 0
  %scevgep19.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6.2.1 = or i64 %indvars.iv5, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next6.2.1, i64 0
  %scevgep19.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep19.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next6.3.1 = add nsw i64 %indvars.iv5, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next6.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge1._crit_edge, label %._crit_edge1.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge7._crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv66 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next67, %._crit_edge7._crit_edge ]
  %indvars.iv60 = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next61, %._crit_edge7._crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge ], [ 0, %._crit_edge.preheader ]
  %3 = phi double [ %19, %._crit_edge ], [ 0.000000e+00, %._crit_edge.preheader ]
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv66
  %5 = load double, double* %4, align 8
  %6 = fmul double %5, %5
  %7 = fadd double %3, %6
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv66
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fadd double %7, %10
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv66
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %13
  %15 = fadd double %11, %14
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv66
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %17
  %19 = fadd double %15, %18
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond71.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond71.3, label %._crit_edge._crit_edge, label %._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %20 = tail call double @sqrt(double %19) #4
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv66
  store double %20, double* %21, align 8
  br label %.lr.ph18.new

._crit_edge7.preheader:                           ; preds = %.lr.ph18.new
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %22 = icmp slt i64 %indvars.iv.next67, 1200
  br i1 %22, label %.lr.ph26.split.us.preheader, label %._crit_edge7._crit_edge

.lr.ph26.split.us.preheader:                      ; preds = %._crit_edge7.preheader
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %.lr.ph26.split.us.preheader, %._crit_edge7.loopexit.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge7.loopexit.us ], [ %indvars.iv60, %.lr.ph26.split.us.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv62
  store double 0.000000e+00, double* %23, align 8
  br label %.lr.ph26.split.us.new

.lr.ph26.split.us.new:                            ; preds = %.lr.ph26.split.us, %.lr.ph26.split.us.new
  %24 = phi double [ %36, %.lr.ph26.split.us.new ], [ 0.000000e+00, %.lr.ph26.split.us ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.lr.ph26.split.us.new ], [ 0, %.lr.ph26.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv52, i64 %indvars.iv66
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv52, i64 %indvars.iv62
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %23, align 8
  %indvars.iv.next53 = or i64 %indvars.iv52, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next53, i64 %indvars.iv66
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next53, i64 %indvars.iv62
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %23, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond.180 = icmp eq i64 %indvars.iv.next53.1, 1000
  br i1 %exitcond.180, label %._crit_edge8.us.preheader, label %.lr.ph26.split.us.new

._crit_edge8.us.preheader:                        ; preds = %.lr.ph26.split.us.new
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge8.us.preheader, %._crit_edge8.us.._crit_edge8.us_crit_edge
  %37 = phi double [ %.pre3, %._crit_edge8.us.._crit_edge8.us_crit_edge ], [ %36, %._crit_edge8.us.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %._crit_edge8.us.._crit_edge8.us_crit_edge ], [ 0, %._crit_edge8.us.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv62
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv56, i64 %indvars.iv66
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %37
  %43 = fsub double %39, %42
  store double %43, double* %38, align 8
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next57, i64 %indvars.iv62
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next57, i64 %indvars.iv66
  %47 = load double, double* %46, align 8
  %48 = load double, double* %23, align 8
  %49 = fmul double %47, %48
  %50 = fsub double %45, %49
  store double %50, double* %44, align 8
  %indvars.iv.next57.1 = add nuw nsw i64 %indvars.iv56, 2
  %exitcond.184 = icmp eq i64 %indvars.iv.next57.1, 1000
  br i1 %exitcond.184, label %._crit_edge7.loopexit.us, label %._crit_edge8.us.._crit_edge8.us_crit_edge

._crit_edge8.us.._crit_edge8.us_crit_edge:        ; preds = %._crit_edge8.us
  %.pre3 = load double, double* %23, align 8
  br label %._crit_edge8.us

._crit_edge7.loopexit.us:                         ; preds = %._crit_edge8.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond = icmp eq i64 %indvars.iv.next63, 1200
  br i1 %exitcond, label %._crit_edge7._crit_edge.loopexit, label %.lr.ph26.split.us

.lr.ph18.new:                                     ; preds = %.lr.ph18.new..lr.ph18.new_crit_edge, %._crit_edge._crit_edge
  %51 = phi double [ %.pre, %.lr.ph18.new..lr.ph18.new_crit_edge ], [ %20, %._crit_edge._crit_edge ]
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %.lr.ph18.new..lr.ph18.new_crit_edge ], [ 0, %._crit_edge._crit_edge ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv66
  %53 = load double, double* %52, align 8
  %54 = fdiv double %53, %51
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv42, i64 %indvars.iv66
  store double %54, double* %55, align 8
  %indvars.iv.next43 = or i64 %indvars.iv42, 1
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next43, i64 %indvars.iv66
  %57 = load double, double* %56, align 8
  %58 = load double, double* %21, align 8
  %59 = fdiv double %57, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next43, i64 %indvars.iv66
  store double %59, double* %60, align 8
  %indvars.iv.next43.1 = add nuw nsw i64 %indvars.iv42, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next43.1, 1000
  br i1 %exitcond.1, label %._crit_edge7.preheader, label %.lr.ph18.new..lr.ph18.new_crit_edge

.lr.ph18.new..lr.ph18.new_crit_edge:              ; preds = %.lr.ph18.new
  %.pre = load double, double* %21, align 8
  br label %.lr.ph18.new

._crit_edge7._crit_edge.loopexit:                 ; preds = %._crit_edge7.loopexit.us
  br label %._crit_edge7._crit_edge

._crit_edge7._crit_edge:                          ; preds = %._crit_edge7._crit_edge.loopexit, %._crit_edge7.preheader
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next67, 1200
  br i1 %exitcond87, label %._crit_edge30, label %._crit_edge.preheader

._crit_edge30:                                    ; preds = %._crit_edge7._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv19 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next20, %._crit_edge._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv19, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge1.us, %._crit_edge.preheader.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge1.us ], [ 0, %._crit_edge.preheader.us ]
  %8 = add nuw nsw i64 %indvars.iv15, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge1.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv15
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond2, label %._crit_edge._crit_edge.us, label %7

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge1.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond3, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge2.preheader.us

._crit_edge2.preheader.us:                        ; preds = %._crit_edge2._crit_edge.us, %._crit_edge
  %indvars.iv10 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next11, %._crit_edge2._crit_edge.us ]
  %22 = mul nuw nsw i64 %indvars.iv10, 1200
  br label %23

; <label>:23:                                     ; preds = %._crit_edge3.us, %._crit_edge2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge3.us ], [ 0, %._crit_edge2.preheader.us ]
  %24 = add nuw nsw i64 %indvars.iv, %22
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %._crit_edge3.us

; <label>:28:                                     ; preds = %23
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %29) #6
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %28, %23
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond1, label %._crit_edge2._crit_edge.us, label %23

._crit_edge2._crit_edge.us:                       ; preds = %._crit_edge3.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond, label %._crit_edge4, label %._crit_edge2.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge2._crit_edge.us
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #6
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
