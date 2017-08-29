; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) #0 {
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41, %4
  %indvars.iv36 = phi i64 [ 0, %4 ], [ %indvars.iv.next37.1, %._crit_edge41 ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv36
  store double 0.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv36
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %7 = trunc i64 %indvars.iv.next37 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv36
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next37
  store double 0.000000e+00, double* %13, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next37
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %15 = trunc i64 %indvars.iv.next37.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next37
  store double %19, double* %20, align 8
  %exitcond38.1 = icmp eq i64 %indvars.iv.next37.1, 2000
  br i1 %exitcond38.1, label %.lr.ph.preheader, label %._crit_edge41

.lr.ph.preheader:                                 ; preds = %._crit_edge41
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph.backedge
  %indvars.iv33 = phi i64 [ %21, %.lr.ph.backedge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv31.be, %.lr.ph.backedge ], [ 1, %.lr.ph.preheader ]
  %21 = add nuw nsw i64 %indvars.iv33, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %21
  %22 = sub i64 1998, %indvars.iv33
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %._crit_edge42

.preheader86:                                     ; preds = %._crit_edge42
  %26 = icmp slt i64 %21, 2000
  br i1 %26, label %._crit_edge.thread, label %._crit_edge

._crit_edge42:                                    ; preds = %._crit_edge42, %.lr.ph
  %indvars.iv19 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next20, %._crit_edge42 ]
  %27 = sub nsw i64 0, %indvars.iv19
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv19
  store double %32, double* %33, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next20, %indvars.iv31
  br i1 %exitcond23, label %.preheader86, label %._crit_edge42

._crit_edge.thread:                               ; preds = %.preheader86
  %34 = mul nuw nsw i64 %indvars.iv33, 2000
  %scevgep29 = getelementptr double, double* %scevgep, i64 %34
  %scevgep2930 = bitcast double* %scevgep29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2930, i8 0, i64 %25, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv33
  store double 1.000000e+00, double* %35, align 8
  br label %.lr.ph.backedge

._crit_edge:                                      ; preds = %.preheader86
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv33
  store double 1.000000e+00, double* %36, align 8
  %exitcond35 = icmp eq i64 %21, 2000
  br i1 %exitcond35, label %.preheader83.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv31.be = add nuw nsw i64 %indvars.iv31, 1
  br label %.lr.ph

.preheader83.preheader:                           ; preds = %._crit_edge
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 32000000, i32 8, i1 false)
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %.preheader83

.preheader83:                                     ; preds = %55, %.preheader83.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader83.preheader ], [ %indvars.iv.next11, %55 ]
  br label %.preheader82

.preheader82:                                     ; preds = %54, %.preheader83
  %indvars.iv7 = phi i64 [ 0, %.preheader83 ], [ %indvars.iv.next8, %54 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv10
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43, %.preheader82
  %indvars.iv4 = phi i64 [ 0, %.preheader82 ], [ %indvars.iv.next5.1, %._crit_edge43 ]
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv10
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %47 = load double, double* %39, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv10
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %54, label %._crit_edge43

; <label>:54:                                     ; preds = %._crit_edge43
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %55, label %.preheader82

; <label>:55:                                     ; preds = %54
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader.preheader, label %.preheader83

.preheader.preheader:                             ; preds = %55
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %81
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %81 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %._crit_edge44 ]
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv2, i64 %indvars.iv
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %67 = bitcast double* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %81, label %._crit_edge44

; <label>:81:                                     ; preds = %._crit_edge44
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %82, label %.preheader

; <label>:82:                                     ; preds = %81
  tail call void @free(i8* nonnull %37) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_ludcmp([2000 x double]*, double* nocapture readonly, double* nocapture, double* nocapture) #2 {
  br label %.preheader94

.preheader94:                                     ; preds = %._crit_edge125, %4
  %indvars.iv50 = phi i64 [ 0, %4 ], [ %indvars.iv.next51, %._crit_edge125 ]
  %5 = add i64 %indvars.iv50, 4294967295
  %6 = icmp sgt i64 %indvars.iv50, 0
  br i1 %6, label %.lr.ph115.preheader, label %._crit_edge125

.lr.ph115.preheader:                              ; preds = %.preheader94
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 0
  br label %.lr.ph115

.lr.ph124.split.us.preheader:                     ; preds = %._crit_edge112
  %xtraiter4153 = and i64 %indvars.iv50, 1
  %lcmp.mod42 = icmp eq i64 %xtraiter4153, 0
  %8 = trunc i64 %5 to i32
  %9 = icmp eq i32 %8, 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %._crit_edge120.us, %.lr.ph124.split.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv50, %.lr.ph124.split.us.preheader ], [ %indvars.iv.next46, %._crit_edge120.us ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv45
  %11 = load double, double* %10, align 8
  br i1 %lcmp.mod42, label %.prol.loopexit40, label %.prol.preheader39

.prol.preheader39:                                ; preds = %.lr.ph124.split.us
  %12 = load double, double* %7, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv45
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %11, %15
  br label %.prol.loopexit40

.prol.loopexit40:                                 ; preds = %.lr.ph124.split.us, %.prol.preheader39
  %indvars.iv34.unr.ph = phi i64 [ 1, %.prol.preheader39 ], [ 0, %.lr.ph124.split.us ]
  %.1117.us.unr.ph = phi double [ %16, %.prol.preheader39 ], [ %11, %.lr.ph124.split.us ]
  %.lcssa133.unr.ph = phi double [ %16, %.prol.preheader39 ], [ undef, %.lr.ph124.split.us ]
  br i1 %9, label %._crit_edge120.us, label %.lr.ph124.split.us.new.preheader

.lr.ph124.split.us.new.preheader:                 ; preds = %.prol.loopexit40
  br label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.lr.ph124.split.us.new.preheader, %.lr.ph124.split.us.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.lr.ph124.split.us.new ], [ %indvars.iv34.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %.1117.us = phi double [ %28, %.lr.ph124.split.us.new ], [ %.1117.us.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv34
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv45
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %.1117.us, %21
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv.next35
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next35, i64 %indvars.iv45
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next35.1, %indvars.iv50
  br i1 %exitcond38.1, label %._crit_edge120.us.loopexit, label %.lr.ph124.split.us.new

._crit_edge120.us.loopexit:                       ; preds = %.lr.ph124.split.us.new
  br label %._crit_edge120.us

._crit_edge120.us:                                ; preds = %._crit_edge120.us.loopexit, %.prol.loopexit40
  %.lcssa133 = phi double [ %.lcssa133.unr.ph, %.prol.loopexit40 ], [ %28, %._crit_edge120.us.loopexit ]
  store double %.lcssa133, double* %10, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond47, label %._crit_edge125.loopexit, label %.lr.ph124.split.us

.lr.ph115:                                        ; preds = %._crit_edge112, %.lr.ph115.preheader
  %indvars.iv27 = phi i64 [ 0, %.lr.ph115.preheader ], [ %indvars.iv.next28, %._crit_edge112 ]
  %29 = add i64 %indvars.iv27, 4294967295
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv27
  %31 = load double, double* %30, align 8
  %32 = icmp sgt i64 %indvars.iv27, 0
  br i1 %32, label %.lr.ph111, label %._crit_edge112

.lr.ph111:                                        ; preds = %.lr.ph115
  %xtraiter2354 = and i64 %indvars.iv27, 1
  %lcmp.mod24 = icmp eq i64 %xtraiter2354, 0
  br i1 %lcmp.mod24, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph111
  %33 = load double, double* %7, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv27
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %31, %36
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph111, %.prol.preheader
  %indvars.iv18.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph111 ]
  %.0109.unr.ph = phi double [ %37, %.prol.preheader ], [ %31, %.lr.ph111 ]
  %.lcssa132.unr.ph = phi double [ %37, %.prol.preheader ], [ undef, %.lr.ph111 ]
  %38 = trunc i64 %29 to i32
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %._crit_edge112, label %.lr.ph111.new.preheader

.lr.ph111.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph111.new

.lr.ph111.new:                                    ; preds = %.lr.ph111.new.preheader, %.lr.ph111.new
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.1, %.lr.ph111.new ], [ %indvars.iv18.unr.ph, %.lr.ph111.new.preheader ]
  %.0109 = phi double [ %51, %.lr.ph111.new ], [ %.0109.unr.ph, %.lr.ph111.new.preheader ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv18
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv27
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %.0109, %44
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv.next19
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next19, i64 %indvars.iv27
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %45, %50
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next19.1, %indvars.iv27
  br i1 %exitcond22.1, label %._crit_edge112.loopexit, label %.lr.ph111.new

._crit_edge112.loopexit:                          ; preds = %.lr.ph111.new
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.prol.loopexit, %.lr.ph115
  %.0.lcssa = phi double [ %31, %.lr.ph115 ], [ %.lcssa132.unr.ph, %.prol.loopexit ], [ %51, %._crit_edge112.loopexit ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv27
  %53 = load double, double* %52, align 8
  %54 = fdiv double %.0.lcssa, %53
  store double %54, double* %30, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next28, %indvars.iv50
  br i1 %exitcond32, label %.lr.ph124.split.us.preheader, label %.lr.ph115

._crit_edge125.loopexit:                          ; preds = %._crit_edge120.us
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit, %.preheader94
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond52, label %.preheader.preheader, label %.preheader94

.preheader.preheader:                             ; preds = %._crit_edge125
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge104
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge104 ], [ 0, %.preheader.preheader ]
  %55 = add i64 %indvars.iv15, 4294967295
  %56 = getelementptr inbounds double, double* %1, i64 %indvars.iv15
  %57 = load double, double* %56, align 8
  %58 = icmp sgt i64 %indvars.iv15, 0
  br i1 %58, label %.lr.ph103.preheader, label %._crit_edge104

.lr.ph103.preheader:                              ; preds = %.preheader
  %59 = trunc i64 %indvars.iv15 to i32
  %xtraiter10 = and i32 %59, 3
  %lcmp.mod11 = icmp eq i32 %xtraiter10, 0
  br i1 %lcmp.mod11, label %.lr.ph103.prol.loopexit, label %.lr.ph103.prol.preheader

.lr.ph103.prol.preheader:                         ; preds = %.lr.ph103.preheader
  br label %.lr.ph103.prol

.lr.ph103.prol:                                   ; preds = %.lr.ph103.prol.preheader, %.lr.ph103.prol
  %indvars.iv5.prol = phi i64 [ %indvars.iv.next6.prol, %.lr.ph103.prol ], [ 0, %.lr.ph103.prol.preheader ]
  %.2101.prol = phi double [ %65, %.lr.ph103.prol ], [ %57, %.lr.ph103.prol.preheader ]
  %prol.iter12 = phi i32 [ %prol.iter12.sub, %.lr.ph103.prol ], [ %xtraiter10, %.lr.ph103.prol.preheader ]
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv5.prol
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.prol
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %.2101.prol, %64
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv5.prol, 1
  %prol.iter12.sub = add i32 %prol.iter12, -1
  %prol.iter12.cmp = icmp eq i32 %prol.iter12.sub, 0
  br i1 %prol.iter12.cmp, label %.lr.ph103.prol.loopexit.loopexit, label %.lr.ph103.prol, !llvm.loop !1

.lr.ph103.prol.loopexit.loopexit:                 ; preds = %.lr.ph103.prol
  br label %.lr.ph103.prol.loopexit

.lr.ph103.prol.loopexit:                          ; preds = %.lr.ph103.prol.loopexit.loopexit, %.lr.ph103.preheader
  %indvars.iv5.unr = phi i64 [ 0, %.lr.ph103.preheader ], [ %indvars.iv.next6.prol, %.lr.ph103.prol.loopexit.loopexit ]
  %.2101.unr = phi double [ %57, %.lr.ph103.preheader ], [ %65, %.lr.ph103.prol.loopexit.loopexit ]
  %.lcssa131.unr = phi double [ undef, %.lr.ph103.preheader ], [ %65, %.lr.ph103.prol.loopexit.loopexit ]
  %66 = trunc i64 %55 to i32
  %67 = icmp ult i32 %66, 3
  br i1 %67, label %._crit_edge104, label %.lr.ph103.preheader70

.lr.ph103.preheader70:                            ; preds = %.lr.ph103.prol.loopexit
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103.preheader70, %.lr.ph103
  %indvars.iv5 = phi i64 [ %indvars.iv.next6.3, %.lr.ph103 ], [ %indvars.iv5.unr, %.lr.ph103.preheader70 ]
  %.2101 = phi double [ %91, %.lr.ph103 ], [ %.2101.unr, %.lr.ph103.preheader70 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv5
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %.2101, %72
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv.next6
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fsub double %73, %78
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv5, 2
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv.next6.1
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6.1
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fsub double %79, %84
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv5, 3
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv.next6.2
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6.2
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = fsub double %85, %90
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv5, 4
  %exitcond9.3 = icmp eq i64 %indvars.iv.next6.3, %indvars.iv15
  br i1 %exitcond9.3, label %._crit_edge104.loopexit, label %.lr.ph103

._crit_edge104.loopexit:                          ; preds = %.lr.ph103
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %.lr.ph103.prol.loopexit, %.preheader
  %.2.lcssa = phi double [ %57, %.preheader ], [ %.lcssa131.unr, %.lr.ph103.prol.loopexit ], [ %91, %._crit_edge104.loopexit ]
  %92 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  store double %.2.lcssa, double* %92, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %.preheader129.preheader, label %.preheader

.preheader129.preheader:                          ; preds = %._crit_edge104
  br label %.preheader129

.preheader129:                                    ; preds = %.preheader129.preheader, %._crit_edge..preheader129_crit_edge
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge..preheader129_crit_edge ], [ 1999, %.preheader129.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge..preheader129_crit_edge ], [ 0, %.preheader129.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge..preheader129_crit_edge ], [ 2000, %.preheader129.preheader ]
  %93 = add nsw i32 %indvar, -1
  %94 = getelementptr inbounds double, double* %3, i64 %indvars.iv3
  %95 = load double, double* %94, align 8
  %96 = add nuw nsw i64 %indvars.iv3, 1
  %97 = icmp slt i64 %96, 2000
  br i1 %97, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader129
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv1.prol = phi i64 [ %indvars.iv.next2.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %103, %.lr.ph.prol ], [ %95, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv1.prol
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds double, double* %2, i64 %indvars.iv1.prol
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = fsub double %.397.prol, %102
  %indvars.iv.next2.prol = add nuw nsw i64 %indvars.iv1.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv1.unr = phi i64 [ %indvars.iv, %.lr.ph.preheader ], [ %indvars.iv.next2.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.397.unr = phi double [ %95, %.lr.ph.preheader ], [ %103, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %103, %.lr.ph.prol.loopexit.loopexit ]
  %104 = icmp ult i32 %93, 3
  br i1 %104, label %._crit_edge, label %.lr.ph.preheader69

.lr.ph.preheader69:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader69, %.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next2.3, %.lr.ph ], [ %indvars.iv1.unr, %.lr.ph.preheader69 ]
  %.397 = phi double [ %128, %.lr.ph ], [ %.397.unr, %.lr.ph.preheader69 ]
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv1
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fsub double %.397, %109
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next2
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next2
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fsub double %110, %115
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, 2
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next2.1
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next2.1
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = fsub double %116, %121
  %indvars.iv.next2.2 = add nsw i64 %indvars.iv1, 3
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next2.2
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next2.2
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fsub double %122, %127
  %indvars.iv.next2.3 = add nsw i64 %indvars.iv1, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next2.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader129
  %.3.lcssa = phi double [ %95, %.preheader129 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %128, %._crit_edge.loopexit ]
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv3
  %130 = load double, double* %129, align 8
  %131 = fdiv double %.3.lcssa, %130
  %132 = getelementptr inbounds double, double* %2, i64 %indvars.iv3
  store double %131, double* %132, align 8
  %indvar.next = add nuw nsw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  br i1 %exitcond, label %133, label %._crit_edge..preheader129_crit_edge

._crit_edge..preheader129_crit_edge:              ; preds = %._crit_edge
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvars.iv.next4 = add nsw i64 %indvars.iv3, -1
  br label %.preheader129

; <label>:133:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
