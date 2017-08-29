; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv4258 = phi i64 [ 0, %4 ], [ %indvars.iv.next43.1, %5 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv4258
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv4258
  %9 = bitcast double* %8 to <2 x double>*
  %10 = trunc i64 %indvars.iv4258 to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv4258
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next43.1 = add nuw nsw i64 %indvars.iv4258, 2
  %14 = trunc i64 %indvars.iv.next43.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond44.1 = icmp eq i64 %indvars.iv.next43.1, 2000
  br i1 %exitcond44.1, label %.preheader7.preheader, label %5

.preheader7.preheader:                            ; preds = %5
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.preheader, %._crit_edge
  %indvars.iv3757 = phi i64 [ %indvars.iv.next38, %._crit_edge ], [ 1, %.preheader7.preheader ]
  %indvars.iv3956 = phi i64 [ %indvars.iv.next40, %._crit_edge ], [ 0, %.preheader7.preheader ]
  %22 = mul nuw nsw i64 %indvars.iv3956, 2001
  %23 = add nuw nsw i64 %22, 1
  %24 = mul nsw i64 %indvars.iv3956, -8
  br label %26

.preheader6:                                      ; preds = %26
  %exitcond3654 = icmp eq i64 %indvars.iv3956, 1999
  br i1 %exitcond3654, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %.preheader6
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 1999, i64 1999
  store double 1.000000e+00, double* %25, align 8
  br label %.preheader4

; <label>:26:                                     ; preds = %26, %.preheader7
  %indvars.iv2752 = phi i64 [ 0, %.preheader7 ], [ %indvars.iv.next28, %26 ]
  %27 = sub nsw i64 0, %indvars.iv2752
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3956, i64 %indvars.iv2752
  store double %32, double* %33, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2752, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next28, %indvars.iv3757
  br i1 %exitcond31, label %.preheader6, label %26

._crit_edge:                                      ; preds = %.preheader6
  %34 = add nsw i64 %24, 15992
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %23
  %35 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %35, i8 0, i64 %34, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3956, i64 %indvars.iv3956
  store double 1.000000e+00, double* %36, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv3956, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next40, 2000
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv3757, 1
  br i1 %exitcond41, label %.preheader4.loopexit, label %.preheader7

.preheader4.loopexit:                             ; preds = %._crit_edge
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %._crit_edge.thread
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 32000000, i32 8, i1 false)
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %.preheader3

.preheader3:                                      ; preds = %56, %.preheader4
  %indvars.iv1849 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next19, %56 ]
  br label %.preheader2

.preheader2:                                      ; preds = %55, %.preheader3
  %indvars.iv1548 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next16, %55 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1548, i64 %indvars.iv1849
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader2
  %indvars.iv1247 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next13.1, %40 ]
  %41 = load double, double* %39, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1247, i64 %indvars.iv1849
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv1548, i64 %indvars.iv1247
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next13 = or i64 %indvars.iv1247, 1
  %48 = load double, double* %39, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next13, i64 %indvars.iv1849
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv1548, i64 %indvars.iv.next13
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next13.1 = add nuw nsw i64 %indvars.iv1247, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next13.1, 2000
  br i1 %exitcond14.1, label %55, label %40

; <label>:55:                                     ; preds = %40
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1548, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %56, label %.preheader2

; <label>:56:                                     ; preds = %55
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1849, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond20, label %.preheader.preheader, label %.preheader3

.preheader.preheader:                             ; preds = %56
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %83
  %indvars.iv946 = phi i64 [ %indvars.iv.next10, %83 ], [ 0, %.preheader.preheader ]
  br label %57

; <label>:57:                                     ; preds = %57, %.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %57 ]
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv946, i64 %indvars.iv45
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv946, i64 %indvars.iv45
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv45, 1
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv946, i64 %indvars.iv.next
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv946, i64 %indvars.iv.next
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv45, 2
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv946, i64 %indvars.iv.next.1
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv946, i64 %indvars.iv.next.1
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv45, 3
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv946, i64 %indvars.iv.next.2
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv946, i64 %indvars.iv.next.2
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv45, 4
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv946, i64 %indvars.iv.next.3
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv946, i64 %indvars.iv.next.3
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv45, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %83, label %57

; <label>:83:                                     ; preds = %57
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv946, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond11, label %84, label %.preheader

; <label>:84:                                     ; preds = %83
  tail call void @free(i8* nonnull %37) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge78, %4
  %indvars.iv = phi i2 [ %indvars.iv.next, %._crit_edge78 ], [ 0, %4 ]
  %indvars.iv3779 = phi i64 [ %indvars.iv.next38, %._crit_edge78 ], [ 0, %4 ]
  %5 = zext i2 %indvars.iv to i64
  %6 = sub nuw nsw i64 1999, %indvars.iv3779
  %exitcond2665 = icmp eq i64 %indvars.iv3779, 0
  br i1 %exitcond2665, label %.lr.ph77..lr.ph77.split_crit_edge, label %.lr.ph67.preheader

.lr.ph67.preheader:                               ; preds = %.preheader3
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3779, i64 0
  br label %.lr.ph67

.lr.ph77:                                         ; preds = %._crit_edge63
  br i1 false, label %.lr.ph77..lr.ph77..lr.ph77.split_crit_edge_crit_edge, label %.lr.ph77.split.us.preheader

.lr.ph77..lr.ph77..lr.ph77.split_crit_edge_crit_edge: ; preds = %.lr.ph77
  br label %.lr.ph77..lr.ph77.split_crit_edge

.lr.ph77.split.us.preheader:                      ; preds = %.lr.ph77
  %xtraiter93 = and i64 %indvars.iv3779, 1
  %8 = icmp eq i64 %xtraiter93, 0
  %9 = icmp eq i64 %indvars.iv3779, 1
  br label %.lr.ph77.split.us

.lr.ph77..lr.ph77.split_crit_edge:                ; preds = %.lr.ph77..lr.ph77..lr.ph77.split_crit_edge_crit_edge, %.preheader3
  %10 = sub nsw i64 0, %indvars.iv3779
  %xtraiter96 = and i64 %10, 3
  %lcmp.mod97 = icmp eq i64 %xtraiter96, 0
  br i1 %lcmp.mod97, label %.lr.ph77.split.prol.loopexit, label %.lr.ph77.split.prol.preheader

.lr.ph77.split.prol.preheader:                    ; preds = %.lr.ph77..lr.ph77.split_crit_edge
  br label %.lr.ph77.split.prol

.lr.ph77.split.prol:                              ; preds = %.lr.ph77.split.prol.preheader, %.lr.ph77.split.prol
  %prol.iter98 = phi i64 [ %prol.iter98.sub, %.lr.ph77.split.prol ], [ %xtraiter96, %.lr.ph77.split.prol.preheader ]
  %prol.iter98.sub = add nsw i64 %prol.iter98, -1
  %prol.iter98.cmp = icmp eq i64 %prol.iter98.sub, 0
  br i1 %prol.iter98.cmp, label %.lr.ph77.split.prol.loopexit.loopexit, label %.lr.ph77.split.prol, !llvm.loop !1

.lr.ph77.split.prol.loopexit.loopexit:            ; preds = %.lr.ph77.split.prol
  br label %.lr.ph77.split.prol.loopexit

.lr.ph77.split.prol.loopexit:                     ; preds = %.lr.ph77.split.prol.loopexit.loopexit, %.lr.ph77..lr.ph77.split_crit_edge
  %indvars.iv3476.unr = phi i64 [ 0, %.lr.ph77..lr.ph77.split_crit_edge ], [ %5, %.lr.ph77.split.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %6, 3
  br i1 %11, label %._crit_edge78, label %.lr.ph77.split.preheader

.lr.ph77.split.preheader:                         ; preds = %.lr.ph77.split.prol.loopexit
  %12 = sub nsw i64 1996, %indvars.iv3476.unr
  %13 = and i64 %12, 4
  %lcmp.mod129 = icmp eq i64 %13, 0
  br i1 %lcmp.mod129, label %.lr.ph77.split.prol.preheader126, label %.lr.ph77.split.prol.loopexit127.unr-lcssa

.lr.ph77.split.prol.preheader126:                 ; preds = %.lr.ph77.split.preheader
  br label %.lr.ph77.split.prol130

.lr.ph77.split.prol130:                           ; preds = %.lr.ph77.split.prol.preheader126
  %indvars.iv.next35.3.prol = or i64 %indvars.iv3476.unr, 4
  br label %.lr.ph77.split.prol.loopexit127.unr-lcssa

.lr.ph77.split.prol.loopexit127.unr-lcssa:        ; preds = %.lr.ph77.split.preheader, %.lr.ph77.split.prol130
  %indvars.iv3476.unr132.ph = phi i64 [ %indvars.iv.next35.3.prol, %.lr.ph77.split.prol130 ], [ %indvars.iv3476.unr, %.lr.ph77.split.preheader ]
  br label %.lr.ph77.split.prol.loopexit127

.lr.ph77.split.prol.loopexit127:                  ; preds = %.lr.ph77.split.prol.loopexit127.unr-lcssa
  br i1 false, label %._crit_edge78.loopexit, label %.lr.ph77.split.preheader.new

.lr.ph77.split.preheader.new:                     ; preds = %.lr.ph77.split.prol.loopexit127
  br label %.lr.ph77.split

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %._crit_edge73.us
  %indvars.iv3476.us = phi i64 [ %indvars.iv.next35.us, %._crit_edge73.us ], [ %indvars.iv3779, %.lr.ph77.split.us.preheader ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3779, i64 %indvars.iv3476.us
  %15 = load double, double* %14, align 8
  br i1 %8, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph77.split.us
  %16 = load double, double* %7, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv3476.us
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %15, %19
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph77.split.us
  %.lcssa88.unr.ph = phi double [ %20, %.prol.preheader ], [ undef, %.lr.ph77.split.us ]
  %.170.us.unr.ph = phi double [ %20, %.prol.preheader ], [ %15, %.lr.ph77.split.us ]
  %indvars.iv2769.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph77.split.us ]
  br i1 %9, label %._crit_edge73.us, label %.lr.ph77.split.us.new.preheader

.lr.ph77.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph77.split.us.new

.lr.ph77.split.us.new:                            ; preds = %.lr.ph77.split.us.new.preheader, %.lr.ph77.split.us.new
  %.170.us = phi double [ %34, %.lr.ph77.split.us.new ], [ %.170.us.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %indvars.iv2769.us = phi i64 [ %indvars.iv.next28.us.1, %.lr.ph77.split.us.new ], [ %indvars.iv2769.us.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3779, i64 %indvars.iv2769.us
  %22 = bitcast double* %21 to <2 x double>*
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2769.us, i64 %indvars.iv3476.us
  %24 = load double, double* %23, align 8
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv2769.us, 1
  %25 = load <2 x double>, <2 x double>* %22, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next28.us, i64 %indvars.iv3476.us
  %27 = load double, double* %26, align 8
  %28 = insertelement <2 x double> undef, double %24, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %25, %29
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fsub double %.170.us, %31
  %34 = fsub double %33, %32
  %indvars.iv.next28.us.1 = add nuw nsw i64 %indvars.iv2769.us, 2
  %exitcond31.us.1 = icmp eq i64 %indvars.iv.next28.us.1, %indvars.iv3779
  br i1 %exitcond31.us.1, label %._crit_edge73.us.loopexit, label %.lr.ph77.split.us.new

._crit_edge73.us.loopexit:                        ; preds = %.lr.ph77.split.us.new
  br label %._crit_edge73.us

._crit_edge73.us:                                 ; preds = %._crit_edge73.us.loopexit, %.prol.loopexit
  %.lcssa88 = phi double [ %.lcssa88.unr.ph, %.prol.loopexit ], [ %34, %._crit_edge73.us.loopexit ]
  store double %.lcssa88, double* %14, align 8
  %indvars.iv.next35.us = add nuw nsw i64 %indvars.iv3476.us, 1
  %exitcond36.us = icmp eq i64 %indvars.iv.next35.us, 2000
  br i1 %exitcond36.us, label %._crit_edge78.loopexit117, label %.lr.ph77.split.us

.lr.ph67:                                         ; preds = %.lr.ph67.preheader, %._crit_edge63
  %indvars.iv2166 = phi i64 [ %indvars.iv.next22, %._crit_edge63 ], [ 0, %.lr.ph67.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3779, i64 %indvars.iv2166
  %36 = load double, double* %35, align 8
  %exitcond2058 = icmp eq i64 %indvars.iv2166, 0
  br i1 %exitcond2058, label %._crit_edge63, label %.lr.ph67..lr.ph62_crit_edge

.lr.ph67..lr.ph62_crit_edge:                      ; preds = %.lr.ph67
  %xtraiter91 = and i64 %indvars.iv2166, 1
  %lcmp.mod92 = icmp eq i64 %xtraiter91, 0
  br i1 %lcmp.mod92, label %.lr.ph62.prol.loopexit, label %.lr.ph62.prol

.lr.ph62.prol:                                    ; preds = %.lr.ph67..lr.ph62_crit_edge
  %37 = load double, double* %7, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv2166
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %36, %40
  br label %.lr.ph62.prol.loopexit

.lr.ph62.prol.loopexit:                           ; preds = %.lr.ph62.prol, %.lr.ph67..lr.ph62_crit_edge
  %.lcssa87.unr.ph = phi double [ %41, %.lr.ph62.prol ], [ undef, %.lr.ph67..lr.ph62_crit_edge ]
  %.060.unr.ph = phi double [ %41, %.lr.ph62.prol ], [ %36, %.lr.ph67..lr.ph62_crit_edge ]
  %indvars.iv1659.unr.ph = phi i64 [ 1, %.lr.ph62.prol ], [ 0, %.lr.ph67..lr.ph62_crit_edge ]
  %42 = icmp eq i64 %indvars.iv2166, 1
  br i1 %42, label %._crit_edge63, label %.lr.ph62.preheader

.lr.ph62.preheader:                               ; preds = %.lr.ph62.prol.loopexit
  br label %.lr.ph62

.lr.ph62:                                         ; preds = %.lr.ph62.preheader, %.lr.ph62
  %.060 = phi double [ %56, %.lr.ph62 ], [ %.060.unr.ph, %.lr.ph62.preheader ]
  %indvars.iv1659 = phi i64 [ %indvars.iv.next17.1, %.lr.ph62 ], [ %indvars.iv1659.unr.ph, %.lr.ph62.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3779, i64 %indvars.iv1659
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1659, i64 %indvars.iv2166
  %46 = load double, double* %45, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1659, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next17, i64 %indvars.iv2166
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.060, %53
  %56 = fsub double %55, %54
  %indvars.iv.next17.1 = add nuw nsw i64 %indvars.iv1659, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next17.1, %indvars.iv2166
  br i1 %exitcond20.1, label %._crit_edge63.loopexit, label %.lr.ph62

._crit_edge63.loopexit:                           ; preds = %.lr.ph62
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.loopexit, %.lr.ph62.prol.loopexit, %.lr.ph67
  %.0.lcssa = phi double [ %36, %.lr.ph67 ], [ %.lcssa87.unr.ph, %.lr.ph62.prol.loopexit ], [ %56, %._crit_edge63.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2166, i64 %indvars.iv2166
  %58 = load double, double* %57, align 8
  %59 = fdiv double %.0.lcssa, %58
  store double %59, double* %35, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2166, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv3779
  br i1 %exitcond26, label %.lr.ph77, label %.lr.ph67

.lr.ph77.split:                                   ; preds = %.lr.ph77.split, %.lr.ph77.split.preheader.new
  %indvars.iv3476 = phi i64 [ %indvars.iv3476.unr132.ph, %.lr.ph77.split.preheader.new ], [ %indvars.iv.next35.3.1, %.lr.ph77.split ]
  %indvars.iv.next35.3.1 = add nsw i64 %indvars.iv3476, 8
  %exitcond36.3.1 = icmp eq i64 %indvars.iv.next35.3.1, 2000
  br i1 %exitcond36.3.1, label %._crit_edge78.loopexit.unr-lcssa, label %.lr.ph77.split

._crit_edge78.loopexit.unr-lcssa:                 ; preds = %.lr.ph77.split
  br label %._crit_edge78.loopexit

._crit_edge78.loopexit:                           ; preds = %.lr.ph77.split.prol.loopexit127, %._crit_edge78.loopexit.unr-lcssa
  br label %._crit_edge78

._crit_edge78.loopexit117:                        ; preds = %._crit_edge73.us
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit117, %._crit_edge78.loopexit, %.lr.ph77.split.prol.loopexit
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv3779, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 2000
  %indvars.iv.next = add i2 %indvars.iv, -1
  br i1 %exitcond39, label %.preheader1.preheader, label %.preheader3

.preheader1.preheader:                            ; preds = %._crit_edge78
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.backedge, %.preheader1.preheader
  %indvars.iv1357 = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv1357.be, %.preheader1.backedge ]
  %60 = add nsw i64 %indvars.iv1357, -1
  %61 = getelementptr inbounds double, double* %1, i64 %indvars.iv1357
  %62 = load double, double* %61, align 8
  %exitcond1250 = icmp eq i64 %indvars.iv1357, 0
  br i1 %exitcond1250, label %._crit_edge55.thread, label %.preheader1..lr.ph54_crit_edge

._crit_edge55.thread:                             ; preds = %.preheader1
  store double %62, double* %3, align 8
  br label %.preheader1.backedge

.preheader1..lr.ph54_crit_edge:                   ; preds = %.preheader1
  %xtraiter89 = and i64 %indvars.iv1357, 3
  %lcmp.mod90 = icmp eq i64 %xtraiter89, 0
  br i1 %lcmp.mod90, label %.lr.ph54.prol.loopexit, label %.lr.ph54.prol.preheader

.lr.ph54.prol.preheader:                          ; preds = %.preheader1..lr.ph54_crit_edge
  br label %.lr.ph54.prol

.lr.ph54.prol:                                    ; preds = %.lr.ph54.prol.preheader, %.lr.ph54.prol
  %.252.prol = phi double [ %68, %.lr.ph54.prol ], [ %62, %.lr.ph54.prol.preheader ]
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph54.prol ], [ 0, %.lr.ph54.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph54.prol ], [ %xtraiter89, %.lr.ph54.prol.preheader ]
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1357, i64 %indvars.iv51.prol
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %3, i64 %indvars.iv51.prol
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fsub double %.252.prol, %67
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph54.prol.loopexit.loopexit, label %.lr.ph54.prol, !llvm.loop !3

.lr.ph54.prol.loopexit.loopexit:                  ; preds = %.lr.ph54.prol
  br label %.lr.ph54.prol.loopexit

.lr.ph54.prol.loopexit:                           ; preds = %.lr.ph54.prol.loopexit.loopexit, %.preheader1..lr.ph54_crit_edge
  %.lcssa86.unr = phi double [ undef, %.preheader1..lr.ph54_crit_edge ], [ %68, %.lr.ph54.prol.loopexit.loopexit ]
  %.252.unr = phi double [ %62, %.preheader1..lr.ph54_crit_edge ], [ %68, %.lr.ph54.prol.loopexit.loopexit ]
  %indvars.iv51.unr = phi i64 [ 0, %.preheader1..lr.ph54_crit_edge ], [ %xtraiter89, %.lr.ph54.prol.loopexit.loopexit ]
  %69 = icmp ult i64 %60, 3
  br i1 %69, label %._crit_edge55, label %.lr.ph54.preheader

.lr.ph54.preheader:                               ; preds = %.lr.ph54.prol.loopexit
  br label %.lr.ph54

.lr.ph54:                                         ; preds = %.lr.ph54.preheader, %.lr.ph54
  %.252 = phi double [ %91, %.lr.ph54 ], [ %.252.unr, %.lr.ph54.preheader ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next.3, %.lr.ph54 ], [ %indvars.iv51.unr, %.lr.ph54.preheader ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1357, i64 %indvars.iv51
  %71 = bitcast double* %70 to <2 x double>*
  %72 = getelementptr inbounds double, double* %3, i64 %indvars.iv51
  %73 = bitcast double* %72 to <2 x double>*
  %74 = load <2 x double>, <2 x double>* %71, align 8
  %75 = load <2 x double>, <2 x double>* %73, align 8
  %76 = fmul <2 x double> %74, %75
  %77 = extractelement <2 x double> %76, i32 0
  %78 = extractelement <2 x double> %76, i32 1
  %79 = fsub double %.252, %77
  %80 = fsub double %79, %78
  %indvars.iv.next.1 = add nsw i64 %indvars.iv51, 2
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1357, i64 %indvars.iv.next.1
  %82 = bitcast double* %81 to <2 x double>*
  %83 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %84 = bitcast double* %83 to <2 x double>*
  %85 = load <2 x double>, <2 x double>* %82, align 8
  %86 = load <2 x double>, <2 x double>* %84, align 8
  %87 = fmul <2 x double> %85, %86
  %88 = extractelement <2 x double> %87, i32 0
  %89 = extractelement <2 x double> %87, i32 1
  %90 = fsub double %80, %88
  %91 = fsub double %90, %89
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv51, 4
  %exitcond12.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1357
  br i1 %exitcond12.3, label %._crit_edge55.loopexit, label %.lr.ph54

._crit_edge55.loopexit:                           ; preds = %.lr.ph54
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %.lr.ph54.prol.loopexit
  %.2.lcssa = phi double [ %.lcssa86.unr, %.lr.ph54.prol.loopexit ], [ %91, %._crit_edge55.loopexit ]
  %92 = getelementptr inbounds double, double* %3, i64 %indvars.iv1357
  store double %.2.lcssa, double* %92, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1357, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond15, label %.preheader.preheader, label %.preheader1.backedge

.preheader1.backedge:                             ; preds = %._crit_edge55, %._crit_edge55.thread
  %indvars.iv1357.be = phi i64 [ %indvars.iv.next14, %._crit_edge55 ], [ 1, %._crit_edge55.thread ]
  br label %.preheader1

.preheader.preheader:                             ; preds = %._crit_edge55
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 1999, i64 1999
  %94 = getelementptr inbounds double, double* %2, i64 1999
  %95 = ptrtoint double* %2 to i64
  %96 = ptrtoint double* %2 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge._crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv849 = phi i64 [ %indvars.iv.next9, %._crit_edge._crit_edge ], [ 1999, %.preheader.preheader ]
  %97 = getelementptr inbounds double, double* %3, i64 %indvars.iv849
  %98 = load double, double* %97, align 8
  %exitcond45 = icmp eq i64 %indvars.iv849, 1999
  br i1 %exitcond45, label %._crit_edge.thread, label %..lr.ph_crit_edge

._crit_edge.thread:                               ; preds = %.preheader
  %99 = load double, double* %93, align 8
  %100 = fdiv double %98, %99
  store double %100, double* %94, align 8
  br label %._crit_edge._crit_edge

..lr.ph_crit_edge:                                ; preds = %.preheader
  %xtraiter = and i64 %indvar, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %..lr.ph_crit_edge
  %indvars.iv.next748.prol = add nsw i64 %indvars.iv849, 1
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv849, i64 %indvars.iv.next748.prol
  %102 = load double, double* %101, align 8
  %sunkaddr40.prol = shl i64 %indvars.iv849, 3
  %sunkaddr41.prol = add i64 %96, %sunkaddr40.prol
  %sunkaddr42.prol = add i64 %sunkaddr41.prol, 8
  %sunkaddr43.prol = inttoptr i64 %sunkaddr42.prol to double*
  %103 = load double, double* %sunkaddr43.prol, align 8
  %104 = fmul double %102, %103
  %105 = fsub double %98, %104
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %..lr.ph_crit_edge
  %.lcssa.unr.ph = phi double [ %105, %.lr.ph.prol ], [ undef, %..lr.ph_crit_edge ]
  %indvars.iv.next748.in.unr.ph = phi i64 [ %indvars.iv.next748.prol, %.lr.ph.prol ], [ %indvars.iv849, %..lr.ph_crit_edge ]
  %.347.unr.ph = phi double [ %105, %.lr.ph.prol ], [ %98, %..lr.ph_crit_edge ]
  %106 = icmp eq i64 %indvar, 1
  br i1 %106, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv.next748.in = phi i64 [ %indvars.iv.next748.1, %.lr.ph ], [ %indvars.iv.next748.in.unr.ph, %.lr.ph.preheader ]
  %.347 = phi double [ %118, %.lr.ph ], [ %.347.unr.ph, %.lr.ph.preheader ]
  %indvars.iv.next748 = add nsw i64 %indvars.iv.next748.in, 1
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv849, i64 %indvars.iv.next748
  %108 = bitcast double* %107 to <2 x double>*
  %sunkaddr40 = shl i64 %indvars.iv.next748.in, 3
  %sunkaddr41 = add i64 %95, %sunkaddr40
  %sunkaddr42 = add i64 %sunkaddr41, 8
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  %109 = load double, double* %sunkaddr43, align 8
  %indvars.iv.next748.1 = add nsw i64 %indvars.iv.next748.in, 2
  %110 = load <2 x double>, <2 x double>* %108, align 8
  %sunkaddr40.1 = shl i64 %indvars.iv.next748, 3
  %sunkaddr41.1 = add i64 %95, %sunkaddr40.1
  %sunkaddr42.1 = add i64 %sunkaddr41.1, 8
  %sunkaddr43.1 = inttoptr i64 %sunkaddr42.1 to double*
  %111 = load double, double* %sunkaddr43.1, align 8
  %112 = insertelement <2 x double> undef, double %109, i32 0
  %113 = insertelement <2 x double> %112, double %111, i32 1
  %114 = fmul <2 x double> %110, %113
  %115 = extractelement <2 x double> %114, i32 0
  %116 = extractelement <2 x double> %114, i32 1
  %117 = fsub double %.347, %115
  %118 = fsub double %117, %116
  %exitcond.1 = icmp eq i64 %indvars.iv.next748.1, 1999
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  %.3.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %118, %._crit_edge.loopexit ]
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv849, i64 %indvars.iv849
  %120 = load double, double* %119, align 8
  %121 = fdiv double %.3.lcssa, %120
  %122 = getelementptr inbounds double, double* %2, i64 %indvars.iv849
  store double %121, double* %122, align 8
  %123 = icmp sgt i64 %indvars.iv849, 0
  br i1 %123, label %._crit_edge._crit_edge, label %124

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next9 = add nsw i64 %indvars.iv849, -1
  %indvar.next = add i64 %indvar, 1
  br label %.preheader

; <label>:124:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %12, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv1 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %6, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
