; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br i1 true, label %.preheader3.lr.ph, label %._crit_edge7

.preheader3.lr.ph:                                ; preds = %3
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge5.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge5.us ], [ 0, %.preheader3.lr.ph ]
  %4 = trunc i64 %indvars.iv20 to i32
  %5 = add i32 %4, 120
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond23, label %._crit_edge7.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us.us ]
  %6 = trunc i64 %indvars.iv16 to i32
  %7 = add i32 %5, %6
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 120
  br i1 %exitcond19, label %._crit_edge5.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sub i32 %7, %8
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 1.000000e+01
  %12 = fdiv double %11, 1.200000e+02
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  store double %12, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sub i32 %7, %15
  %17 = sitofp i32 %16 to double
  %18 = fmul double %17, 1.000000e+01
  %19 = fdiv double %18, 1.200000e+02
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv.next
  store double %19, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge7.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge15, %3
  %storemerge16 = phi i32 [ 1, %3 ], [ %86, %._crit_edge15 ]
  br i1 true, label %.preheader4.preheader, label %._crit_edge15

.preheader4.preheader:                            ; preds = %.preheader6
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge8
  %indvars.iv21 = phi i64 [ %4, %._crit_edge8 ], [ 1, %.preheader4.preheader ]
  %4 = add nuw nsw i64 %indvars.iv21, 1
  %5 = add nsw i64 %indvars.iv21, -1
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader4
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.us ], [ 1, %.preheader4 ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %6 = add nsw i64 %indvars.iv17, -1
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader2.us
  %indvars.iv = phi i64 [ 1, %.preheader2.us ], [ %indvars.iv.next, %7 ]
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %indvars.iv17, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv17, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, 2.000000e+00
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %indvars.iv17, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv.next18, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x double> undef, double %9, i32 0
  %20 = insertelement <2 x double> %19, double %16, i32 1
  %21 = fsub <2 x double> %20, %18
  %22 = extractelement <2 x double> %21, i32 0
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = insertelement <2 x double> undef, double %14, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> %21, <2 x i32> <i32 0, i32 3>
  %29 = fadd <2 x double> %28, %26
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fadd double %31, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv17, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fsub double %35, %12
  %37 = add nsw i64 %indvars.iv, -1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv17, i64 %37
  %39 = load double, double* %38, align 8
  %40 = fadd double %36, %39
  %41 = fmul double %40, 1.250000e-01
  %42 = fadd double %33, %41
  %43 = fadd double %11, %42
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv17, i64 %indvars.iv
  store double %43, double* %44, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %7
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 119
  br i1 %exitcond20, label %._crit_edge8, label %.preheader2.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  %exitcond24 = icmp eq i64 %4, 119
  br i1 %exitcond24, label %.preheader.lr.ph.preheader, label %.preheader4

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge8
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge13
  %indvars.iv33 = phi i64 [ %45, %._crit_edge13 ], [ 1, %.preheader.lr.ph.preheader ]
  %45 = add nuw nsw i64 %indvars.iv33, 1
  %46 = add nsw i64 %indvars.iv33, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.lr.ph
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge11.us ], [ 1, %.preheader.lr.ph ]
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %47 = add nsw i64 %indvars.iv29, -1
  br label %48

; <label>:48:                                     ; preds = %48, %.preheader.us
  %indvars.iv25 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next26, %48 ]
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %45, i64 %indvars.iv29, i64 %indvars.iv25
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv25
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, 2.000000e+00
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %46, i64 %indvars.iv29, i64 %indvars.iv25
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv33, i64 %indvars.iv.next30, i64 %indvars.iv25
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = insertelement <2 x double> undef, double %50, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = fsub <2 x double> %61, %59
  %63 = extractelement <2 x double> %62, i32 0
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv33, i64 %47, i64 %indvars.iv25
  %65 = load double, double* %64, align 8
  %66 = insertelement <2 x double> undef, double %63, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = insertelement <2 x double> undef, double %55, i32 0
  %69 = shufflevector <2 x double> %68, <2 x double> %62, <2 x i32> <i32 0, i32 3>
  %70 = fadd <2 x double> %69, %67
  %71 = fmul <2 x double> %70, <double 1.250000e-01, double 1.250000e-01>
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %74 = fadd double %72, %73
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv.next26
  %76 = load double, double* %75, align 8
  %77 = fsub double %76, %53
  %78 = add nsw i64 %indvars.iv25, -1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv33, i64 %indvars.iv29, i64 %78
  %80 = load double, double* %79, align 8
  %81 = fadd double %77, %80
  %82 = fmul double %81, 1.250000e-01
  %83 = fadd double %74, %82
  %84 = fadd double %52, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv25
  store double %84, double* %85, align 8
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 119
  br i1 %exitcond28, label %._crit_edge11.us, label %48

._crit_edge11.us:                                 ; preds = %48
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 119
  br i1 %exitcond32, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %exitcond36 = icmp eq i64 %45, 119
  br i1 %exitcond36, label %._crit_edge15.loopexit, label %.preheader.lr.ph

._crit_edge15.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader6
  %86 = add nuw nsw i32 %storemerge16, 1
  %exitcond37 = icmp eq i32 %86, 501
  br i1 %exitcond37, label %87, label %.preheader6

; <label>:87:                                     ; preds = %._crit_edge15
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader3.lr.ph, label %._crit_edge7

.preheader3.lr.ph:                                ; preds = %2
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge5.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge5.us ], [ 0, %.preheader3.lr.ph ]
  %7 = mul nsw i64 %indvars.iv20, 120
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond23, label %._crit_edge7.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us.us ]
  %8 = add i64 %indvars.iv16, %7
  %9 = mul i64 %8, 120
  br label %10

._crit_edge.us.us:                                ; preds = %17
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 120
  br i1 %exitcond19, label %._crit_edge5.us, label %.preheader.us.us

; <label>:10:                                     ; preds = %17, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %17 ], [ 0, %.preheader.us.us ]
  %11 = add i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %10

._crit_edge7.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
