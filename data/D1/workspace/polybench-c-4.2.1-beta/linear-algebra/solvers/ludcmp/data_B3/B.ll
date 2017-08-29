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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
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
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %6

; <label>:6:                                      ; preds = %6, %5
  %indvars.iv64 = phi i64 [ 0, %5 ], [ %indvars.iv.next65.1, %6 ]
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv64
  store double 0.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv64
  store double 0.000000e+00, double* %8, align 8
  %indvars.iv.next65 = or i64 %indvars.iv64, 1
  %9 = trunc i64 %indvars.iv.next65 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fmul double %11, 5.000000e-01
  %13 = fadd double %12, 4.000000e+00
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv64
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next65
  store double 0.000000e+00, double* %15, align 8
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next65
  store double 0.000000e+00, double* %16, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %17 = trunc i64 %indvars.iv.next65.1 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.000000e+03
  %20 = fmul double %19, 5.000000e-01
  %21 = fadd double %20, 4.000000e+00
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next65
  store double %21, double* %22, align 8
  %exitcond66.1 = icmp eq i64 %indvars.iv.next65.1, 2000
  br i1 %exitcond66.1, label %.lr.ph.preheader, label %6

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph.backedge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %.lr.ph.backedge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv59 = phi i64 [ %indvars.iv59.be, %.lr.ph.backedge ], [ 1, %.lr.ph.preheader ]
  %23 = mul nuw nsw i64 %indvars.iv61, 2001
  %24 = add nuw nsw i64 %23, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %24
  %scevgep58 = bitcast double* %scevgep to i8*
  %25 = sub i64 1998, %indvars.iv61
  %26 = shl i64 %25, 3
  %27 = and i64 %26, 34359738360
  %28 = add nuw nsw i64 %27, 8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9, %.lr.ph
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge9 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv48
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv48
  store double %34, double* %35, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next49, %indvars.iv59
  br i1 %exitcond52, label %._crit_edge9._crit_edge, label %._crit_edge9

._crit_edge9._crit_edge:                          ; preds = %._crit_edge9
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %36 = icmp slt i64 %indvars.iv.next62, 2000
  br i1 %36, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %._crit_edge9._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep58, i8 0, i64 %28, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv61
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph.backedge

._crit_edge:                                      ; preds = %._crit_edge9._crit_edge
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv61
  store double 1.000000e+00, double* %38, align 8
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 2000
  br i1 %exitcond63, label %._crit_edge12.preheader.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv59.be = add nuw nsw i64 %indvars.iv59, 1
  br label %.lr.ph

._crit_edge12.preheader.preheader:                ; preds = %._crit_edge
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 32000000, i32 8, i1 false)
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge12.preheader

._crit_edge12.preheader:                          ; preds = %._crit_edge11, %._crit_edge12.preheader.preheader
  %indvars.iv39 = phi i64 [ 0, %._crit_edge12.preheader.preheader ], [ %indvars.iv.next40, %._crit_edge11 ]
  br label %._crit_edge14.preheader

._crit_edge14.preheader:                          ; preds = %._crit_edge12, %._crit_edge12.preheader
  %indvars.iv36 = phi i64 [ 0, %._crit_edge12.preheader ], [ %indvars.iv.next37, %._crit_edge12 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv39
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14, %._crit_edge14.preheader
  %indvars.iv33 = phi i64 [ 0, %._crit_edge14.preheader ], [ %indvars.iv.next34.1, %._crit_edge14 ]
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv39
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv36, i64 %indvars.iv33
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %49 = load double, double* %41, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next34, i64 %indvars.iv39
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv36, i64 %indvars.iv.next34
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next34.1, 2000
  br i1 %exitcond35.1, label %._crit_edge12, label %._crit_edge14

._crit_edge12:                                    ; preds = %._crit_edge14
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond38, label %._crit_edge11, label %._crit_edge14.preheader

._crit_edge11:                                    ; preds = %._crit_edge12
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond41, label %._crit_edge15.preheader.preheader, label %._crit_edge12.preheader

._crit_edge15.preheader.preheader:                ; preds = %._crit_edge11
  br label %._crit_edge15.preheader

._crit_edge15.preheader:                          ; preds = %._crit_edge15.preheader.preheader, %._crit_edge13
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge13 ], [ 0, %._crit_edge15.preheader.preheader ]
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %._crit_edge15.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge15.preheader ], [ %indvars.iv.next.4, %._crit_edge15 ]
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv31, i64 %indvars.iv
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv.next
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %67 = bitcast double* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.3
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv.next.3
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge13, label %._crit_edge15

._crit_edge13:                                    ; preds = %._crit_edge15
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, 2000
  br i1 %exitcond, label %81, label %._crit_edge15.preheader

; <label>:81:                                     ; preds = %._crit_edge13
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge11._crit_edge, %5
  %indvars.iv93 = phi i64 [ 0, %5 ], [ %indvars.iv.next94, %._crit_edge11._crit_edge ]
  %6 = add i64 %indvars.iv93, 4294967295
  %7 = icmp sgt i64 %indvars.iv93, 0
  br i1 %7, label %.lr.ph30.preheader, label %._crit_edge11._crit_edge

.lr.ph30.preheader:                               ; preds = %._crit_edge.preheader
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 0
  br label %.lr.ph30

.lr.ph38:                                         ; preds = %._crit_edge
  br i1 true, label %.lr.ph38.split.us.preheader, label %.lr.ph38.._crit_edge11._crit_edge_crit_edge

.lr.ph38.._crit_edge11._crit_edge_crit_edge:      ; preds = %.lr.ph38
  br label %._crit_edge11._crit_edge

.lr.ph38.split.us.preheader:                      ; preds = %.lr.ph38
  %xtraiter8496 = and i64 %indvars.iv93, 1
  %lcmp.mod85 = icmp eq i64 %xtraiter8496, 0
  %9 = trunc i64 %6 to i32
  %10 = icmp eq i32 %9, 0
  br label %.lr.ph38.split.us

.lr.ph38.split.us:                                ; preds = %.lr.ph38.split.us.preheader, %._crit_edge35.us
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge35.us ], [ %indvars.iv93, %.lr.ph38.split.us.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv88
  %12 = load double, double* %11, align 8
  br i1 %lcmp.mod85, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph38.split.us
  %13 = load double, double* %8, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv88
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %12, %16
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph38.split.us
  %indvars.iv79.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph38.split.us ]
  %.132.us.unr.ph = phi double [ %17, %.prol.preheader ], [ %12, %.lr.ph38.split.us ]
  %.lcssa45.unr.ph = phi double [ %17, %.prol.preheader ], [ undef, %.lr.ph38.split.us ]
  br i1 %10, label %._crit_edge35.us, label %.lr.ph38.split.us.new.preheader

.lr.ph38.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph38.split.us.new

.lr.ph38.split.us.new:                            ; preds = %.lr.ph38.split.us.new.preheader, %.lr.ph38.split.us.new
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %.lr.ph38.split.us.new ], [ %indvars.iv79.unr.ph, %.lr.ph38.split.us.new.preheader ]
  %.132.us = phi double [ %29, %.lr.ph38.split.us.new ], [ %.132.us.unr.ph, %.lr.ph38.split.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv79
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv79, i64 %indvars.iv88
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %.132.us, %22
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next80
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next80, i64 %indvars.iv88
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  %exitcond83.1 = icmp eq i64 %indvars.iv.next80.1, %indvars.iv93
  br i1 %exitcond83.1, label %._crit_edge35.us.loopexit, label %.lr.ph38.split.us.new

._crit_edge35.us.loopexit:                        ; preds = %.lr.ph38.split.us.new
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us.loopexit, %.prol.loopexit
  %.lcssa45 = phi double [ %.lcssa45.unr.ph, %.prol.loopexit ], [ %29, %._crit_edge35.us.loopexit ]
  store double %.lcssa45, double* %11, align 8
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next89, 2000
  br i1 %exitcond90, label %._crit_edge11._crit_edge.loopexit, label %.lr.ph38.split.us

.lr.ph30:                                         ; preds = %.lr.ph30.preheader, %._crit_edge
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge ], [ 0, %.lr.ph30.preheader ]
  %30 = add i64 %indvars.iv72, 4294967295
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv72
  %32 = load double, double* %31, align 8
  %33 = icmp sgt i64 %indvars.iv72, 0
  br i1 %33, label %.lr.ph26.preheader, label %._crit_edge

.lr.ph26.preheader:                               ; preds = %.lr.ph30
  %xtraiter6897 = and i64 %indvars.iv72, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter6897, 0
  br i1 %lcmp.mod69, label %.lr.ph26.prol.loopexit, label %.lr.ph26.prol

.lr.ph26.prol:                                    ; preds = %.lr.ph26.preheader
  %34 = load double, double* %8, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv72
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol, %.lr.ph26.preheader
  %indvars.iv63.unr.ph = phi i64 [ 1, %.lr.ph26.prol ], [ 0, %.lr.ph26.preheader ]
  %.024.unr.ph = phi double [ %38, %.lr.ph26.prol ], [ %32, %.lr.ph26.preheader ]
  %.lcssa44.unr.ph = phi double [ %38, %.lr.ph26.prol ], [ undef, %.lr.ph26.preheader ]
  %39 = trunc i64 %30 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge, label %.lr.ph26.preheader116

.lr.ph26.preheader116:                            ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26.preheader116, %.lr.ph26
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %.lr.ph26 ], [ %indvars.iv63.unr.ph, %.lr.ph26.preheader116 ]
  %.024 = phi double [ %52, %.lr.ph26 ], [ %.024.unr.ph, %.lr.ph26.preheader116 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv63
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv72
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %.024, %45
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next64
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next64, i64 %indvars.iv72
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next64.1, %indvars.iv72
  br i1 %exitcond67.1, label %._crit_edge.loopexit, label %.lr.ph26

._crit_edge.loopexit:                             ; preds = %.lr.ph26
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph26.prol.loopexit, %.lr.ph30
  %.0.lcssa = phi double [ %32, %.lr.ph30 ], [ %.lcssa44.unr.ph, %.lr.ph26.prol.loopexit ], [ %52, %._crit_edge.loopexit ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv72
  %54 = load double, double* %53, align 8
  %55 = fdiv double %.0.lcssa, %54
  store double %55, double* %31, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv93
  br i1 %exitcond77, label %.lr.ph38, label %.lr.ph30

._crit_edge11._crit_edge.loopexit:                ; preds = %._crit_edge35.us
  br label %._crit_edge11._crit_edge

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11._crit_edge.loopexit, %.lr.ph38.._crit_edge11._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond95, label %._crit_edge10.preheader.preheader, label %._crit_edge.preheader

._crit_edge10.preheader.preheader:                ; preds = %._crit_edge11._crit_edge
  br label %._crit_edge10.preheader

._crit_edge10.preheader:                          ; preds = %._crit_edge10.preheader.preheader, %._crit_edge10
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge10 ], [ 0, %._crit_edge10.preheader.preheader ]
  %56 = add i64 %indvars.iv60, 4294967295
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv60
  %58 = load double, double* %57, align 8
  %59 = icmp sgt i64 %indvars.iv60, 0
  br i1 %59, label %.lr.ph19.preheader, label %._crit_edge10

.lr.ph19.preheader:                               ; preds = %._crit_edge10.preheader
  %60 = trunc i64 %indvars.iv60 to i32
  %xtraiter55 = and i32 %60, 3
  %lcmp.mod56 = icmp eq i32 %xtraiter55, 0
  br i1 %lcmp.mod56, label %.lr.ph19.prol.loopexit, label %.lr.ph19.prol.preheader

.lr.ph19.prol.preheader:                          ; preds = %.lr.ph19.preheader
  br label %.lr.ph19.prol

.lr.ph19.prol:                                    ; preds = %.lr.ph19.prol.preheader, %.lr.ph19.prol
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.lr.ph19.prol ], [ 0, %.lr.ph19.prol.preheader ]
  %.217.prol = phi double [ %66, %.lr.ph19.prol ], [ %58, %.lr.ph19.prol.preheader ]
  %prol.iter57 = phi i32 [ %prol.iter57.sub, %.lr.ph19.prol ], [ %xtraiter55, %.lr.ph19.prol.preheader ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv50.prol
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %4, i64 %indvars.iv50.prol
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %.217.prol, %65
  %indvars.iv.next51.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter57.sub = add i32 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i32 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %.lr.ph19.prol.loopexit.loopexit, label %.lr.ph19.prol, !llvm.loop !1

.lr.ph19.prol.loopexit.loopexit:                  ; preds = %.lr.ph19.prol
  br label %.lr.ph19.prol.loopexit

.lr.ph19.prol.loopexit:                           ; preds = %.lr.ph19.prol.loopexit.loopexit, %.lr.ph19.preheader
  %indvars.iv50.unr = phi i64 [ 0, %.lr.ph19.preheader ], [ %indvars.iv.next51.prol, %.lr.ph19.prol.loopexit.loopexit ]
  %.217.unr = phi double [ %58, %.lr.ph19.preheader ], [ %66, %.lr.ph19.prol.loopexit.loopexit ]
  %.lcssa43.unr = phi double [ undef, %.lr.ph19.preheader ], [ %66, %.lr.ph19.prol.loopexit.loopexit ]
  %67 = trunc i64 %56 to i32
  %68 = icmp ult i32 %67, 3
  br i1 %68, label %._crit_edge10, label %.lr.ph19.preheader115

.lr.ph19.preheader115:                            ; preds = %.lr.ph19.prol.loopexit
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19.preheader115, %.lr.ph19
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %.lr.ph19 ], [ %indvars.iv50.unr, %.lr.ph19.preheader115 ]
  %.217 = phi double [ %92, %.lr.ph19 ], [ %.217.unr, %.lr.ph19.preheader115 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv50
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %4, i64 %indvars.iv50
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fsub double %.217, %73
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv.next51
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next51
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %74, %79
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv.next51.1
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next51.1
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %80, %85
  %indvars.iv.next51.2 = add nsw i64 %indvars.iv50, 3
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv.next51.2
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next51.2
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fsub double %86, %91
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %exitcond54.3 = icmp eq i64 %indvars.iv.next51.3, %indvars.iv60
  br i1 %exitcond54.3, label %._crit_edge10.loopexit, label %.lr.ph19

._crit_edge10.loopexit:                           ; preds = %.lr.ph19
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.lr.ph19.prol.loopexit, %._crit_edge10.preheader
  %.2.lcssa = phi double [ %58, %._crit_edge10.preheader ], [ %.lcssa43.unr, %.lr.ph19.prol.loopexit ], [ %92, %._crit_edge10.loopexit ]
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv60
  store double %.2.lcssa, double* %93, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond62, label %.preheader.preheader, label %._crit_edge10.preheader

.preheader.preheader:                             ; preds = %._crit_edge10
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge14
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge14 ], [ 1999, %.preheader.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge14 ], [ 0, %.preheader.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge14 ], [ 2000, %.preheader.preheader ]
  %94 = add nsw i32 %indvar, -1
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv48
  %96 = load double, double* %95, align 8
  %97 = add nuw nsw i64 %indvars.iv48, 1
  %98 = icmp slt i64 %97, 2000
  br i1 %98, label %.lr.ph.preheader, label %._crit_edge14

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.prol.preheader ]
  %.312.prol = phi double [ %104, %.lr.ph.prol ], [ %96, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv46.prol
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv46.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fsub double %.312.prol, %103
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv46.unr = phi i64 [ %indvars.iv, %.lr.ph.preheader ], [ %indvars.iv.next47.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.312.unr = phi double [ %96, %.lr.ph.preheader ], [ %104, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %104, %.lr.ph.prol.loopexit.loopexit ]
  %105 = icmp ult i32 %94, 3
  br i1 %105, label %._crit_edge14, label %.lr.ph.preheader114

.lr.ph.preheader114:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader114, %.lr.ph
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph ], [ %indvars.iv46.unr, %.lr.ph.preheader114 ]
  %.312 = phi double [ %129, %.lr.ph ], [ %.312.unr, %.lr.ph.preheader114 ]
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv46
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv46
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fsub double %.312, %110
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next47
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next47
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %111, %116
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next47.1
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next47.1
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fsub double %117, %122
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next47.2
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next47.2
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fsub double %123, %128
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next47.3, 2000
  br i1 %exitcond.3, label %._crit_edge14.loopexit, label %.lr.ph

._crit_edge14.loopexit:                           ; preds = %.lr.ph
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %.3.lcssa = phi double [ %96, %.preheader ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %129, %._crit_edge14.loopexit ]
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv48
  %131 = load double, double* %130, align 8
  %132 = fdiv double %.3.lcssa, %131
  %133 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  store double %132, double* %133, align 8
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, -1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  br i1 %exitcond, label %134, label %.preheader

; <label>:134:                                    ; preds = %._crit_edge14
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %7

; <label>:17:                                     ; preds = %._crit_edge
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
