; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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

; <label>:16:                                     ; preds = %12, %15, %2
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
  %indvars.iv51 = phi i64 [ 0, %4 ], [ %indvars.iv.next52.1, %5 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv51
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv51
  %9 = bitcast double* %8 to <2 x double>*
  %10 = trunc i64 %indvars.iv51 to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv51
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %14 = trunc i64 %indvars.iv.next52.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond53.1 = icmp eq i64 %indvars.iv.next52.1, 2000
  br i1 %exitcond53.1, label %.lr.ph.preheader, label %5

.lr.ph.preheader:                                 ; preds = %5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph.backedge
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %.lr.ph.backedge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv46 = phi i64 [ %indvars.iv46.be, %.lr.ph.backedge ], [ 1, %.lr.ph.preheader ]
  %22 = mul nuw nsw i64 %indvars.iv48, 2001
  %23 = add nuw nsw i64 %22, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %23
  %24 = sub i64 1998, %indvars.iv48
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  br label %28

.preheader14:                                     ; preds = %28
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %27 = icmp slt i64 %indvars.iv.next49, 2000
  br i1 %27, label %._crit_edge.thread, label %._crit_edge

; <label>:28:                                     ; preds = %28, %.lr.ph
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %28 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv31
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv31
  store double %34, double* %35, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next32, %indvars.iv46
  br i1 %exitcond39, label %.preheader14, label %28

._crit_edge.thread:                               ; preds = %.preheader14
  %36 = add nuw nsw i64 %26, 8
  %scevgep45 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep45, i8 0, i64 %36, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph.backedge

._crit_edge:                                      ; preds = %.preheader14
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %38, align 8
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond50, label %.preheader11.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv46.be = add nuw nsw i64 %indvars.iv46, 1
  br label %.lr.ph

.preheader11.preheader:                           ; preds = %._crit_edge
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 32000000, i32 8, i1 false)
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader11

.preheader11:                                     ; preds = %58, %.preheader11.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader11.preheader ], [ %indvars.iv.next23, %58 ]
  br label %.preheader10

.preheader10:                                     ; preds = %57, %.preheader11
  %indvars.iv19 = phi i64 [ 0, %.preheader11 ], [ %indvars.iv.next20, %57 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv22
  br label %42

; <label>:42:                                     ; preds = %42, %.preheader10
  %indvars.iv16 = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next17.1, %42 ]
  %43 = load double, double* %41, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv22
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv19, i64 %indvars.iv16
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next17 = or i64 %indvars.iv16, 1
  %50 = load double, double* %41, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next17, i64 %indvars.iv22
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next17
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next17.1 = add nuw nsw i64 %indvars.iv16, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next17.1, 2000
  br i1 %exitcond18.1, label %57, label %42

; <label>:57:                                     ; preds = %42
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond21, label %58, label %.preheader10

; <label>:58:                                     ; preds = %57
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond24, label %.preheader.preheader, label %.preheader11

.preheader.preheader:                             ; preds = %58
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %85
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %85 ], [ 0, %.preheader.preheader ]
  br label %59

; <label>:59:                                     ; preds = %59, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %59 ]
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv14, i64 %indvars.iv
  %61 = bitcast double* %60 to i64*
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv14, i64 %indvars.iv.next
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv14, i64 %indvars.iv.next.1
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next.1
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv14, i64 %indvars.iv.next.2
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next.2
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv14, i64 %indvars.iv.next.3
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next.3
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %85, label %59

; <label>:85:                                     ; preds = %59
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond, label %86, label %.preheader

; <label>:86:                                     ; preds = %85
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge26, %4
  %indvars.iv85 = phi i64 [ 0, %4 ], [ %indvars.iv.next86, %._crit_edge26 ]
  %5 = add nuw nsw i64 %indvars.iv85, 4294967295
  %6 = icmp sgt i64 %indvars.iv85, 0
  br i1 %6, label %.lr.ph17.preheader, label %._crit_edge26

.lr.ph17.preheader:                               ; preds = %.preheader12
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv85, i64 0
  br label %.lr.ph17

.lr.ph25:                                         ; preds = %._crit_edge14
  %8 = icmp sgt i64 %indvars.iv85, 0
  br i1 %8, label %.lr.ph25.split.us.preheader, label %._crit_edge26

.lr.ph25.split.us.preheader:                      ; preds = %.lr.ph25
  %xtraiter7688 = and i64 %indvars.iv85, 1
  %lcmp.mod77 = icmp eq i64 %xtraiter7688, 0
  %9 = trunc i64 %5 to i32
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv85, i64 0
  br label %.lr.ph25.split.us

.lr.ph25.split.us:                                ; preds = %.lr.ph25.split.us.preheader, %._crit_edge22.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge22.us ], [ %indvars.iv85, %.lr.ph25.split.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv85, i64 %indvars.iv80
  %13 = load double, double* %12, align 8
  br i1 %lcmp.mod77, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph25.split.us
  %14 = load double, double* %11, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv80
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %13, %17
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph25.split.us
  %indvars.iv70.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph25.split.us ]
  %.119.us.unr.ph = phi double [ %18, %.prol.preheader ], [ %13, %.lr.ph25.split.us ]
  %.lcssa33.unr.ph = phi double [ %18, %.prol.preheader ], [ undef, %.lr.ph25.split.us ]
  br i1 %10, label %._crit_edge22.us, label %.lr.ph25.split.us.new.preheader

.lr.ph25.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph25.split.us.new

.lr.ph25.split.us.new:                            ; preds = %.lr.ph25.split.us.new.preheader, %.lr.ph25.split.us.new
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.1, %.lr.ph25.split.us.new ], [ %indvars.iv70.unr.ph, %.lr.ph25.split.us.new.preheader ]
  %.119.us = phi double [ %32, %.lr.ph25.split.us.new ], [ %.119.us.unr.ph, %.lr.ph25.split.us.new.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv85, i64 %indvars.iv70
  %20 = bitcast double* %19 to <2 x double>*
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv80
  %22 = load double, double* %21, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %23 = load <2 x double>, <2 x double>* %20, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next71, i64 %indvars.iv80
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %22, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %23, %27
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %31 = fsub double %.119.us, %29
  %32 = fsub double %31, %30
  %indvars.iv.next71.1 = add nuw nsw i64 %indvars.iv70, 2
  %exitcond75.1 = icmp eq i64 %indvars.iv.next71.1, %indvars.iv85
  br i1 %exitcond75.1, label %._crit_edge22.us.loopexit, label %.lr.ph25.split.us.new

._crit_edge22.us.loopexit:                        ; preds = %.lr.ph25.split.us.new
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %.prol.loopexit
  %.lcssa33 = phi double [ %.lcssa33.unr.ph, %.prol.loopexit ], [ %32, %._crit_edge22.us.loopexit ]
  store double %.lcssa33, double* %12, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond82, label %._crit_edge26.loopexit, label %.lr.ph25.split.us

.lr.ph17:                                         ; preds = %.lr.ph17.preheader, %._crit_edge14
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge14 ], [ 0, %.lr.ph17.preheader ]
  %33 = add nuw nsw i64 %indvars.iv60, 4294967295
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv85, i64 %indvars.iv60
  %35 = load double, double* %34, align 8
  %36 = icmp sgt i64 %indvars.iv60, 0
  br i1 %36, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %.lr.ph17
  %xtraiter5689 = and i64 %indvars.iv60, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5689, 0
  br i1 %lcmp.mod57, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.preheader
  %37 = load double, double* %7, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv60
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.prol, %.lr.ph13.preheader
  %indvars.iv51.unr.ph = phi i64 [ 1, %.lr.ph13.prol ], [ 0, %.lr.ph13.preheader ]
  %.011.unr.ph = phi double [ %41, %.lr.ph13.prol ], [ %35, %.lr.ph13.preheader ]
  %.lcssa32.unr.ph = phi double [ %41, %.lr.ph13.prol ], [ undef, %.lr.ph13.preheader ]
  %42 = trunc i64 %33 to i32
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %._crit_edge14, label %.lr.ph13.preheader114

.lr.ph13.preheader114:                            ; preds = %.lr.ph13.prol.loopexit
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.preheader114, %.lr.ph13
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %.lr.ph13 ], [ %indvars.iv51.unr.ph, %.lr.ph13.preheader114 ]
  %.011 = phi double [ %57, %.lr.ph13 ], [ %.011.unr.ph, %.lr.ph13.preheader114 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv85, i64 %indvars.iv51
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv60
  %47 = load double, double* %46, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next52, i64 %indvars.iv60
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %.011, %54
  %57 = fsub double %56, %55
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next52.1, %indvars.iv60
  br i1 %exitcond55.1, label %._crit_edge14.loopexit, label %.lr.ph13

._crit_edge14.loopexit:                           ; preds = %.lr.ph13
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.lr.ph13.prol.loopexit, %.lr.ph17
  %.0.lcssa = phi double [ %35, %.lr.ph17 ], [ %.lcssa32.unr.ph, %.lr.ph13.prol.loopexit ], [ %57, %._crit_edge14.loopexit ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv60
  %59 = load double, double* %58, align 8
  %60 = fdiv double %.0.lcssa, %59
  store double %60, double* %34, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next61, %indvars.iv85
  br i1 %exitcond68, label %.lr.ph25, label %.lr.ph17

._crit_edge26.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader12, %.lr.ph25
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond87, label %.preheader10.preheader, label %.preheader12

.preheader10.preheader:                           ; preds = %._crit_edge26
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.preheader, %._crit_edge7
  %indvars.iv110 = phi i2 [ %indvars.iv.next111, %._crit_edge7 ], [ 0, %.preheader10.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge7 ], [ 0, %.preheader10.preheader ]
  %61 = zext i2 %indvars.iv110 to i64
  %62 = add nuw nsw i64 %61, 4294967295
  %63 = and i64 %62, 4294967295
  %64 = add nuw nsw i64 %63, 1
  %65 = add nuw nsw i64 %indvars.iv48, 4294967295
  %66 = getelementptr inbounds double, double* %1, i64 %indvars.iv48
  %67 = load double, double* %66, align 8
  %68 = icmp sgt i64 %indvars.iv48, 0
  br i1 %68, label %.lr.ph6.preheader, label %._crit_edge7

.lr.ph6.preheader:                                ; preds = %.preheader10
  %69 = trunc i64 %indvars.iv48 to i32
  %xtraiter43 = and i32 %69, 3
  %lcmp.mod44 = icmp eq i32 %xtraiter43, 0
  br i1 %lcmp.mod44, label %.lr.ph6.prol.loopexit, label %.lr.ph6.prol.preheader

.lr.ph6.prol.preheader:                           ; preds = %.lr.ph6.preheader
  br label %.lr.ph6.prol

.lr.ph6.prol:                                     ; preds = %.lr.ph6.prol.preheader, %.lr.ph6.prol
  %indvars.iv38.prol = phi i64 [ %indvars.iv.next39.prol, %.lr.ph6.prol ], [ 0, %.lr.ph6.prol.preheader ]
  %.24.prol = phi double [ %75, %.lr.ph6.prol ], [ %67, %.lr.ph6.prol.preheader ]
  %prol.iter45 = phi i32 [ %prol.iter45.sub, %.lr.ph6.prol ], [ %xtraiter43, %.lr.ph6.prol.preheader ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv38.prol
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %3, i64 %indvars.iv38.prol
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %.24.prol, %74
  %indvars.iv.next39.prol = add nuw nsw i64 %indvars.iv38.prol, 1
  %prol.iter45.sub = add nsw i32 %prol.iter45, -1
  %prol.iter45.cmp = icmp eq i32 %prol.iter45.sub, 0
  br i1 %prol.iter45.cmp, label %.lr.ph6.prol.loopexit.loopexit, label %.lr.ph6.prol, !llvm.loop !1

.lr.ph6.prol.loopexit.loopexit:                   ; preds = %.lr.ph6.prol
  br label %.lr.ph6.prol.loopexit

.lr.ph6.prol.loopexit:                            ; preds = %.lr.ph6.prol.loopexit.loopexit, %.lr.ph6.preheader
  %indvars.iv38.unr = phi i64 [ 0, %.lr.ph6.preheader ], [ %64, %.lr.ph6.prol.loopexit.loopexit ]
  %.24.unr = phi double [ %67, %.lr.ph6.preheader ], [ %75, %.lr.ph6.prol.loopexit.loopexit ]
  %.lcssa31.unr = phi double [ undef, %.lr.ph6.preheader ], [ %75, %.lr.ph6.prol.loopexit.loopexit ]
  %76 = trunc i64 %65 to i32
  %77 = icmp ult i32 %76, 3
  br i1 %77, label %._crit_edge7, label %.lr.ph6.preheader113

.lr.ph6.preheader113:                             ; preds = %.lr.ph6.prol.loopexit
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %.lr.ph6.preheader113, %.lr.ph6
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.3, %.lr.ph6 ], [ %indvars.iv38.unr, %.lr.ph6.preheader113 ]
  %.24 = phi double [ %99, %.lr.ph6 ], [ %.24.unr, %.lr.ph6.preheader113 ]
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv38
  %79 = bitcast double* %78 to <2 x double>*
  %80 = getelementptr inbounds double, double* %3, i64 %indvars.iv38
  %81 = bitcast double* %80 to <2 x double>*
  %82 = load <2 x double>, <2 x double>* %79, align 8
  %83 = load <2 x double>, <2 x double>* %81, align 8
  %84 = fmul <2 x double> %82, %83
  %85 = extractelement <2 x double> %84, i32 0
  %86 = extractelement <2 x double> %84, i32 1
  %87 = fsub double %.24, %85
  %88 = fsub double %87, %86
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next39.1
  %90 = bitcast double* %89 to <2 x double>*
  %91 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next39.1
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %90, align 8
  %94 = load <2 x double>, <2 x double>* %92, align 8
  %95 = fmul <2 x double> %93, %94
  %96 = extractelement <2 x double> %95, i32 0
  %97 = extractelement <2 x double> %95, i32 1
  %98 = fsub double %88, %96
  %99 = fsub double %98, %97
  %indvars.iv.next39.3 = add nsw i64 %indvars.iv38, 4
  %exitcond42.3 = icmp eq i64 %indvars.iv.next39.3, %indvars.iv48
  br i1 %exitcond42.3, label %._crit_edge7.loopexit, label %.lr.ph6

._crit_edge7.loopexit:                            ; preds = %.lr.ph6
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.lr.ph6.prol.loopexit, %.preheader10
  %.2.lcssa = phi double [ %67, %.preheader10 ], [ %.lcssa31.unr, %.lr.ph6.prol.loopexit ], [ %99, %._crit_edge7.loopexit ]
  %100 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  store double %.2.lcssa, double* %100, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 2000
  %indvars.iv.next111 = add i2 %indvars.iv110, 1
  br i1 %exitcond50, label %.preheader.preheader, label %.preheader10

.preheader.preheader:                             ; preds = %._crit_edge7
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv108 = phi i2 [ %indvars.iv.next109, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge ], [ 2001, %.preheader.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge ], [ 1999, %.preheader.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 2000, %.preheader.preheader ]
  %101 = zext i2 %indvars.iv108 to i64
  %102 = add nuw nsw i64 %101, 4294967295
  %103 = and i64 %102, 4294967295
  %104 = add i64 %indvars.iv106, %103
  %105 = add nsw i32 %indvar, -1
  %106 = getelementptr inbounds double, double* %3, i64 %indvars.iv36
  %107 = load double, double* %106, align 8
  %108 = add nuw nsw i64 %indvars.iv36, 1
  %109 = icmp slt i64 %108, 2000
  br i1 %109, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv34.prol = phi i64 [ %indvars.iv.next35.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.prol.preheader ]
  %.31.prol = phi double [ %115, %.lr.ph.prol ], [ %107, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv34.prol
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds double, double* %2, i64 %indvars.iv34.prol
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fsub double %.31.prol, %114
  %indvars.iv.next35.prol = add nuw nsw i64 %indvars.iv34.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv34.unr = phi i64 [ %indvars.iv, %.lr.ph.preheader ], [ %104, %.lr.ph.prol.loopexit.loopexit ]
  %.31.unr = phi double [ %107, %.lr.ph.preheader ], [ %115, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %115, %.lr.ph.prol.loopexit.loopexit ]
  %116 = icmp ult i32 %105, 3
  br i1 %116, label %._crit_edge, label %.lr.ph.preheader112

.lr.ph.preheader112:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader112, %.lr.ph
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.3, %.lr.ph ], [ %indvars.iv34.unr, %.lr.ph.preheader112 ]
  %.31 = phi double [ %138, %.lr.ph ], [ %.31.unr, %.lr.ph.preheader112 ]
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv34
  %118 = bitcast double* %117 to <2 x double>*
  %119 = getelementptr inbounds double, double* %2, i64 %indvars.iv34
  %120 = bitcast double* %119 to <2 x double>*
  %121 = load <2 x double>, <2 x double>* %118, align 8
  %122 = load <2 x double>, <2 x double>* %120, align 8
  %123 = fmul <2 x double> %121, %122
  %124 = extractelement <2 x double> %123, i32 0
  %125 = extractelement <2 x double> %123, i32 1
  %126 = fsub double %.31, %124
  %127 = fsub double %126, %125
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next35.1
  %129 = bitcast double* %128 to <2 x double>*
  %130 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next35.1
  %131 = bitcast double* %130 to <2 x double>*
  %132 = load <2 x double>, <2 x double>* %129, align 8
  %133 = load <2 x double>, <2 x double>* %131, align 8
  %134 = fmul <2 x double> %132, %133
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  %137 = fsub double %127, %135
  %138 = fsub double %137, %136
  %indvars.iv.next35.3 = add nsw i64 %indvars.iv34, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next35.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %.3.lcssa = phi double [ %107, %.preheader ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %138, %._crit_edge.loopexit ]
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv36
  %140 = load double, double* %139, align 8
  %141 = fdiv double %.3.lcssa, %140
  %142 = getelementptr inbounds double, double* %2, i64 %indvars.iv36
  store double %141, double* %142, align 8
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  %indvars.iv.next107 = add nsw i64 %indvars.iv106, -1
  %indvars.iv.next109 = add i2 %indvars.iv108, 1
  br i1 %exitcond, label %143, label %.preheader

; <label>:143:                                    ; preds = %._crit_edge
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
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %10, %6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
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
