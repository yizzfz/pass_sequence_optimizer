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
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
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

.lr.ph:                                           ; preds = %.lr.ph.backedge, %.lr.ph.preheader
  %indvars.iv48 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next49, %.lr.ph.backedge ]
  %22 = mul nuw nsw i64 %indvars.iv48, 2001
  %23 = add nuw nsw i64 %22, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %23
  %24 = sub i64 1998, %indvars.iv48
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %28

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
  %exitcond39 = icmp eq i64 %indvars.iv31, %indvars.iv48
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  br i1 %exitcond39, label %._crit_edge9, label %28

._crit_edge9:                                     ; preds = %28
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %36 = icmp slt i64 %indvars.iv.next49, 2000
  br i1 %36, label %._crit_edge13.thread, label %._crit_edge13

._crit_edge13.thread:                             ; preds = %._crit_edge9
  %37 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %37, i8 0, i64 %27, i32 8, i1 false)
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %38, align 8
  br label %.lr.ph.backedge

._crit_edge13:                                    ; preds = %._crit_edge9
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %39, align 8
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond50, label %.preheader81, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge13, %._crit_edge13.thread
  br label %.lr.ph

.preheader81:                                     ; preds = %._crit_edge13
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %40, i8 0, i64 32000000, i32 8, i1 false)
  %41 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %62, %.preheader81
  %.0725 = phi i32 [ 0, %.preheader81 ], [ %63, %62 ]
  %42 = sext i32 %.0725 to i64
  br label %.preheader80

.preheader80:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %.1764 = phi i32 [ 0, %._crit_edge.preheader ], [ %60, %._crit_edge ]
  %43 = sext i32 %.1764 to i64
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %42
  br label %45

; <label>:45:                                     ; preds = %45, %.preheader80
  %indvars.iv22 = phi i64 [ 0, %.preheader80 ], [ %indvars.iv.next23.1, %45 ]
  %46 = load double, double* %44, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %42
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %43, i64 %indvars.iv22
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next23 = or i64 %indvars.iv22, 1
  %53 = load double, double* %44, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next23, i64 %42
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %43, i64 %indvars.iv.next23
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond24.1 = icmp eq i64 %indvars.iv.next23.1, 2000
  br i1 %exitcond24.1, label %._crit_edge, label %45

._crit_edge:                                      ; preds = %45
  %60 = add nsw i32 %.1764, 1
  %61 = icmp slt i32 %60, 2000
  br i1 %61, label %.preheader80, label %62

; <label>:62:                                     ; preds = %._crit_edge
  %63 = add nsw i32 %.0725, 1
  %64 = icmp slt i32 %63, 2000
  br i1 %64, label %._crit_edge.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %62
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge1
  %indvar = phi i64 [ %indvar.next, %._crit_edge1 ], [ 0, %.preheader.preheader ]
  %.2772 = phi i64 [ %92, %._crit_edge1 ], [ 0, %.preheader.preheader ]
  %sext = shl i64 %.2772, 32
  %65 = ashr exact i64 %sext, 32
  br label %66

; <label>:66:                                     ; preds = %66, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %66 ]
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %65, i64 %indvars.iv
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %65, i64 %indvars.iv
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %65, i64 %indvars.iv.next
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %65, i64 %indvars.iv.next
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %65, i64 %indvars.iv.next.1
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %65, i64 %indvars.iv.next.1
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %65, i64 %indvars.iv.next.2
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %65, i64 %indvars.iv.next.2
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %65, i64 %indvars.iv.next.3
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %65, i64 %indvars.iv.next.3
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge1, label %66

._crit_edge1:                                     ; preds = %66
  %92 = add nsw i64 %65, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %93, label %.preheader

; <label>:93:                                     ; preds = %._crit_edge1
  tail call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge28, %4
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge28 ], [ 0, %4 ]
  %5 = add i64 %indvars.iv70, 4294967295
  %6 = icmp sgt i64 %indvars.iv70, 0
  br i1 %6, label %.lr.ph19.preheader, label %._crit_edge28

.lr.ph19.preheader:                               ; preds = %.preheader95
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 0
  br label %.lr.ph19

.lr.ph27:                                         ; preds = %._crit_edge16
  br i1 true, label %.lr.ph27..lr.ph27.split.us_crit_edge, label %.lr.ph27.._crit_edge28_crit_edge

.lr.ph27.._crit_edge28_crit_edge:                 ; preds = %.lr.ph27
  br label %._crit_edge28

.lr.ph27..lr.ph27.split.us_crit_edge:             ; preds = %.lr.ph27
  %8 = trunc i64 %indvars.iv70 to i32
  %xtraiter6673 = and i64 %indvars.iv70, 1
  %9 = trunc i64 %5 to i32
  %10 = icmp eq i64 %xtraiter6673, 0
  %11 = icmp eq i32 %9, 0
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %._crit_edge24.us, %.lr.ph27..lr.ph27.split.us_crit_edge
  %.18726.us = phi i32 [ %8, %.lr.ph27..lr.ph27.split.us_crit_edge ], [ %34, %._crit_edge24.us ]
  %12 = sext i32 %.18726.us to i64
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %12
  %14 = load double, double* %13, align 8
  br i1 %10, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph27.split.us
  %15 = load double, double* %7, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %12
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %14, %18
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph27.split.us
  %indvars.iv61.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph27.split.us ]
  %.121.us.unr.ph = phi double [ %19, %.prol.preheader ], [ %14, %.lr.ph27.split.us ]
  %.lcssa.unr.ph = phi double [ %19, %.prol.preheader ], [ undef, %.lr.ph27.split.us ]
  br i1 %11, label %._crit_edge24.us, label %.lr.ph27.split.us.new.preheader

.lr.ph27.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph27.split.us.new

.lr.ph27.split.us.new:                            ; preds = %.lr.ph27.split.us.new.preheader, %.lr.ph27.split.us.new
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %.lr.ph27.split.us.new ], [ %indvars.iv61.unr.ph, %.lr.ph27.split.us.new.preheader ]
  %.121.us = phi double [ %33, %.lr.ph27.split.us.new ], [ %.121.us.unr.ph, %.lr.ph27.split.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv61
  %21 = bitcast double* %20 to <2 x double>*
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %12
  %23 = load double, double* %22, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %24 = load <2 x double>, <2 x double>* %21, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next62, i64 %12
  %26 = load double, double* %25, align 8
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %24, %28
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fsub double %.121.us, %30
  %33 = fsub double %32, %31
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next62.1, %indvars.iv70
  br i1 %exitcond65.1, label %._crit_edge24.us.loopexit, label %.lr.ph27.split.us.new

._crit_edge24.us.loopexit:                        ; preds = %.lr.ph27.split.us.new
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %33, %._crit_edge24.us.loopexit ]
  store double %.lcssa, double* %13, align 8
  %34 = add nsw i32 %.18726.us, 1
  %35 = icmp slt i32 %34, 2000
  br i1 %35, label %.lr.ph27.split.us, label %._crit_edge28.loopexit

.lr.ph19:                                         ; preds = %.lr.ph19.preheader, %._crit_edge16
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge16 ], [ 0, %.lr.ph19.preheader ]
  %36 = add i64 %indvars.iv58, 4294967295
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv58
  %38 = load double, double* %37, align 8
  %39 = icmp sgt i64 %indvars.iv58, 0
  br i1 %39, label %..lr.ph15_crit_edge, label %._crit_edge16

..lr.ph15_crit_edge:                              ; preds = %.lr.ph19
  %xtraiter5374 = and i64 %indvars.iv58, 1
  %lcmp.mod54 = icmp eq i64 %xtraiter5374, 0
  br i1 %lcmp.mod54, label %.lr.ph15.prol.loopexit, label %.lr.ph15.prol

.lr.ph15.prol:                                    ; preds = %..lr.ph15_crit_edge
  %40 = load double, double* %7, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv58
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  br label %.lr.ph15.prol.loopexit

.lr.ph15.prol.loopexit:                           ; preds = %.lr.ph15.prol, %..lr.ph15_crit_edge
  %indvars.iv48.unr.ph = phi i64 [ 1, %.lr.ph15.prol ], [ 0, %..lr.ph15_crit_edge ]
  %.013.unr.ph = phi double [ %44, %.lr.ph15.prol ], [ %38, %..lr.ph15_crit_edge ]
  %.lcssa34.unr.ph = phi double [ %44, %.lr.ph15.prol ], [ undef, %..lr.ph15_crit_edge ]
  %45 = trunc i64 %36 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %._crit_edge16, label %.lr.ph15.preheader

.lr.ph15.preheader:                               ; preds = %.lr.ph15.prol.loopexit
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %.lr.ph15.preheader, %.lr.ph15
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.lr.ph15 ], [ %indvars.iv48.unr.ph, %.lr.ph15.preheader ]
  %.013 = phi double [ %60, %.lr.ph15 ], [ %.013.unr.ph, %.lr.ph15.preheader ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv48
  %48 = bitcast double* %47 to <2 x double>*
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv58
  %50 = load double, double* %49, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %51 = load <2 x double>, <2 x double>* %48, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next49, i64 %indvars.iv58
  %53 = load double, double* %52, align 8
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fmul <2 x double> %51, %55
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  %59 = fsub double %.013, %57
  %60 = fsub double %59, %58
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next49.1, %indvars.iv58
  br i1 %exitcond50.1, label %._crit_edge16.loopexit, label %.lr.ph15

._crit_edge16.loopexit:                           ; preds = %.lr.ph15
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.lr.ph15.prol.loopexit, %.lr.ph19
  %.0.lcssa = phi double [ %38, %.lr.ph19 ], [ %.lcssa34.unr.ph, %.lr.ph15.prol.loopexit ], [ %60, %._crit_edge16.loopexit ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv58, i64 %indvars.iv58
  %62 = load double, double* %61, align 8
  %63 = fdiv double %.0.lcssa, %62
  store double %63, double* %37, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next59, %indvars.iv70
  br i1 %exitcond57, label %.lr.ph27, label %.lr.ph19

._crit_edge28.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %.lr.ph27.._crit_edge28_crit_edge, %._crit_edge28.loopexit, %.preheader95
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000
  br i1 %exitcond72, label %.preheader93.preheader, label %.preheader95

.preheader93.preheader:                           ; preds = %._crit_edge28
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge9
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge9 ], [ 0, %.preheader93.preheader ]
  %64 = add i64 %indvars.iv46, 4294967295
  %65 = getelementptr inbounds double, double* %1, i64 %indvars.iv46
  %66 = load double, double* %65, align 8
  %67 = icmp sgt i64 %indvars.iv46, 0
  br i1 %67, label %.preheader93..lr.ph8_crit_edge, label %._crit_edge9

.preheader93..lr.ph8_crit_edge:                   ; preds = %.preheader93
  %68 = trunc i64 %indvars.iv46 to i32
  %xtraiter41 = and i32 %68, 3
  %lcmp.mod42 = icmp eq i32 %xtraiter41, 0
  br i1 %lcmp.mod42, label %.lr.ph8.prol.loopexit, label %.lr.ph8.prol.preheader

.lr.ph8.prol.preheader:                           ; preds = %.preheader93..lr.ph8_crit_edge
  br label %.lr.ph8.prol

.lr.ph8.prol:                                     ; preds = %.lr.ph8.prol.preheader, %.lr.ph8.prol
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.lr.ph8.prol ], [ 0, %.lr.ph8.prol.preheader ]
  %.26.prol = phi double [ %74, %.lr.ph8.prol ], [ %66, %.lr.ph8.prol.preheader ]
  %prol.iter44 = phi i32 [ %prol.iter44.sub, %.lr.ph8.prol ], [ %xtraiter41, %.lr.ph8.prol.preheader ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv37.prol
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %3, i64 %indvars.iv37.prol
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fsub double %.26.prol, %73
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter44.sub = add i32 %prol.iter44, -1
  %prol.iter44.cmp = icmp eq i32 %prol.iter44.sub, 0
  br i1 %prol.iter44.cmp, label %.lr.ph8.prol.loopexit.loopexit, label %.lr.ph8.prol, !llvm.loop !1

.lr.ph8.prol.loopexit.loopexit:                   ; preds = %.lr.ph8.prol
  br label %.lr.ph8.prol.loopexit

.lr.ph8.prol.loopexit:                            ; preds = %.lr.ph8.prol.loopexit.loopexit, %.preheader93..lr.ph8_crit_edge
  %indvars.iv37.unr = phi i64 [ 0, %.preheader93..lr.ph8_crit_edge ], [ %indvars.iv.next38.prol, %.lr.ph8.prol.loopexit.loopexit ]
  %.26.unr = phi double [ %66, %.preheader93..lr.ph8_crit_edge ], [ %74, %.lr.ph8.prol.loopexit.loopexit ]
  %.lcssa33.unr = phi double [ undef, %.preheader93..lr.ph8_crit_edge ], [ %74, %.lr.ph8.prol.loopexit.loopexit ]
  %75 = trunc i64 %64 to i32
  %76 = icmp ult i32 %75, 3
  br i1 %76, label %._crit_edge9, label %.lr.ph8.preheader

.lr.ph8.preheader:                                ; preds = %.lr.ph8.prol.loopexit
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %.lr.ph8
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.3, %.lr.ph8 ], [ %indvars.iv37.unr, %.lr.ph8.preheader ]
  %.26 = phi double [ %98, %.lr.ph8 ], [ %.26.unr, %.lr.ph8.preheader ]
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv37
  %78 = bitcast double* %77 to <2 x double>*
  %79 = getelementptr inbounds double, double* %3, i64 %indvars.iv37
  %80 = bitcast double* %79 to <2 x double>*
  %81 = load <2 x double>, <2 x double>* %78, align 8
  %82 = load <2 x double>, <2 x double>* %80, align 8
  %83 = fmul <2 x double> %81, %82
  %84 = extractelement <2 x double> %83, i32 0
  %85 = extractelement <2 x double> %83, i32 1
  %86 = fsub double %.26, %84
  %87 = fsub double %86, %85
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next38.1
  %89 = bitcast double* %88 to <2 x double>*
  %90 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next38.1
  %91 = bitcast double* %90 to <2 x double>*
  %92 = load <2 x double>, <2 x double>* %89, align 8
  %93 = load <2 x double>, <2 x double>* %91, align 8
  %94 = fmul <2 x double> %92, %93
  %95 = extractelement <2 x double> %94, i32 0
  %96 = extractelement <2 x double> %94, i32 1
  %97 = fsub double %87, %95
  %98 = fsub double %97, %96
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %exitcond.345 = icmp eq i64 %indvars.iv.next38.3, %indvars.iv46
  br i1 %exitcond.345, label %._crit_edge9.loopexit, label %.lr.ph8

._crit_edge9.loopexit:                            ; preds = %.lr.ph8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.lr.ph8.prol.loopexit, %.preheader93
  %.2.lcssa = phi double [ %66, %.preheader93 ], [ %.lcssa33.unr, %.lr.ph8.prol.loopexit ], [ %98, %._crit_edge9.loopexit ]
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv46
  store double %.2.lcssa, double* %99, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond, label %.preheader.preheader, label %.preheader93

.preheader.preheader:                             ; preds = %._crit_edge9
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ %indvar.next, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ], [ 2000, %.preheader.preheader ]
  %.2924 = phi i64 [ %.292, %._crit_edge..preheader_crit_edge ], [ 1999, %.preheader.preheader ]
  %100 = add i32 %indvar, -1
  %101 = sext i32 %indvars.iv to i64
  %sext = shl i64 %.2924, 32
  %102 = ashr exact i64 %sext, 32
  %103 = getelementptr inbounds double, double* %3, i64 %102
  %104 = load double, double* %103, align 8
  %105 = icmp slt i32 %indvars.iv, 2000
  br i1 %105, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv35.prol = phi i64 [ %indvars.iv.next36.prol, %.lr.ph.prol ], [ %101, %.lr.ph.prol.preheader ]
  %.32.prol = phi double [ %111, %.lr.ph.prol ], [ %104, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %102, i64 %indvars.iv35.prol
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %2, i64 %indvars.iv35.prol
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fsub double %.32.prol, %110
  %indvars.iv.next36.prol = add nsw i64 %indvars.iv35.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.preheader..lr.ph_crit_edge
  %indvars.iv35.unr = phi i64 [ %101, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next36.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.32.unr = phi double [ %104, %.preheader..lr.ph_crit_edge ], [ %111, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa32.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %111, %.lr.ph.prol.loopexit.loopexit ]
  %112 = icmp ult i32 %100, 3
  br i1 %112, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.3, %.lr.ph ], [ %indvars.iv35.unr, %.lr.ph.preheader ]
  %.32 = phi double [ %134, %.lr.ph ], [ %.32.unr, %.lr.ph.preheader ]
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %102, i64 %indvars.iv35
  %114 = bitcast double* %113 to <2 x double>*
  %115 = getelementptr inbounds double, double* %2, i64 %indvars.iv35
  %116 = bitcast double* %115 to <2 x double>*
  %117 = load <2 x double>, <2 x double>* %114, align 8
  %118 = load <2 x double>, <2 x double>* %116, align 8
  %119 = fmul <2 x double> %117, %118
  %120 = extractelement <2 x double> %119, i32 0
  %121 = extractelement <2 x double> %119, i32 1
  %122 = fsub double %.32, %120
  %123 = fsub double %122, %121
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %102, i64 %indvars.iv.next36.1
  %125 = bitcast double* %124 to <2 x double>*
  %126 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next36.1
  %127 = bitcast double* %126 to <2 x double>*
  %128 = load <2 x double>, <2 x double>* %125, align 8
  %129 = load <2 x double>, <2 x double>* %127, align 8
  %130 = fmul <2 x double> %128, %129
  %131 = extractelement <2 x double> %130, i32 0
  %132 = extractelement <2 x double> %130, i32 1
  %133 = fsub double %123, %131
  %134 = fsub double %133, %132
  %indvars.iv.next36.3 = add nsw i64 %indvars.iv35, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next36.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %.3.lcssa = phi double [ %104, %.preheader ], [ %.lcssa32.unr, %.lr.ph.prol.loopexit ], [ %134, %._crit_edge.loopexit ]
  %135 = trunc i64 %102 to i32
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %102, i64 %102
  %137 = load double, double* %136, align 8
  %138 = fdiv double %.3.lcssa, %137
  %139 = getelementptr inbounds double, double* %2, i64 %102
  store double %138, double* %139, align 8
  %140 = icmp sgt i32 %135, 0
  br i1 %140, label %._crit_edge..preheader_crit_edge, label %141

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %.292 = add nsw i64 %102, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:141:                                    ; preds = %._crit_edge
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
  %indvars.iv = phi i64 [ %indvars.iv.next, %12 ], [ 0, %1 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %6, %10
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
