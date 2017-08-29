; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_cholesky([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2000 x double]* nocapture) #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %1
  %indvars.iv33 = phi i64 [ 0, %1 ], [ %2, %.lr.ph.backedge ]
  %indvars.iv31 = phi i64 [ 1, %1 ], [ %indvars.iv31.be, %.lr.ph.backedge ]
  %2 = add nuw nsw i64 %indvars.iv33, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  %3 = sub i64 1998, %indvars.iv33
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  %6 = add nuw nsw i64 %5, 8
  br label %._crit_edge38

.preheader73:                                     ; preds = %._crit_edge38
  %7 = icmp slt i64 %2, 2000
  br i1 %7, label %._crit_edge.thread, label %._crit_edge

._crit_edge38:                                    ; preds = %._crit_edge38, %.lr.ph
  %indvars.iv19 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next20, %._crit_edge38 ]
  %8 = sub nsw i64 0, %indvars.iv19
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv19
  store double %13, double* %14, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next20, %indvars.iv31
  br i1 %exitcond23, label %.preheader73, label %._crit_edge38

._crit_edge.thread:                               ; preds = %.preheader73
  %15 = mul nuw nsw i64 %indvars.iv33, 2000
  %scevgep29 = getelementptr double, double* %scevgep, i64 %15
  %scevgep2930 = bitcast double* %scevgep29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2930, i8 0, i64 %6, i32 8, i1 false)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv33
  store double 1.000000e+00, double* %16, align 8
  br label %.lr.ph.backedge

._crit_edge:                                      ; preds = %.preheader73
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv33
  store double 1.000000e+00, double* %17, align 8
  %exitcond35 = icmp eq i64 %2, 2000
  br i1 %exitcond35, label %.preheader70.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv31.be = add nuw nsw i64 %indvars.iv31, 1
  br label %.lr.ph

.preheader70.preheader:                           ; preds = %._crit_edge
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 32000000, i32 8, i1 false)
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader70

.preheader70:                                     ; preds = %36, %.preheader70.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader70.preheader ], [ %indvars.iv.next11, %36 ]
  br label %.preheader69

.preheader69:                                     ; preds = %35, %.preheader70
  %indvars.iv7 = phi i64 [ 0, %.preheader70 ], [ %indvars.iv.next8, %35 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv10
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39, %.preheader69
  %indvars.iv4 = phi i64 [ 0, %.preheader69 ], [ %indvars.iv.next5.1, %._crit_edge39 ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv10
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv10
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %35, label %._crit_edge39

; <label>:35:                                     ; preds = %._crit_edge39
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %36, label %.preheader69

; <label>:36:                                     ; preds = %35
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader.preheader, label %.preheader70

.preheader.preheader:                             ; preds = %36
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %62
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %62 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %._crit_edge40 ]
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv2, i64 %indvars.iv
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %53 = bitcast double* %52 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %62, label %._crit_edge40

; <label>:62:                                     ; preds = %._crit_edge40
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %63, label %.preheader

; <label>:63:                                     ; preds = %62
  tail call void @free(i8* nonnull %18) #3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky([2000 x double]* nocapture) #0 {
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge49, %1
  %indvars.iv22 = phi i64 [ 0, %1 ], [ %indvars.iv.next23, %._crit_edge49 ]
  %2 = add i64 %indvars.iv22, 4294967295
  %3 = icmp sgt i64 %indvars.iv22, 0
  br i1 %3, label %.preheader.preheader, label %.preheader43.._crit_edge49_crit_edge

.preheader.preheader:                             ; preds = %.preheader44
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 0
  br label %.preheader

.preheader43.._crit_edge49_crit_edge:             ; preds = %.preheader44
  %.phi.trans.insert54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv22
  %.pre55 = load double, double* %.phi.trans.insert54, align 8
  br label %._crit_edge49

.lr.ph48:                                         ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv22
  %.pre53 = load double, double* %5, align 8
  %6 = trunc i64 %indvars.iv22 to i32
  %xtraiter17 = and i32 %6, 3
  %lcmp.mod18 = icmp eq i32 %xtraiter17, 0
  br i1 %lcmp.mod18, label %.prol.loopexit16, label %.prol.preheader15.preheader

.prol.preheader15.preheader:                      ; preds = %.lr.ph48
  br label %.prol.preheader15

.prol.preheader15:                                ; preds = %.prol.preheader15.preheader, %.prol.preheader15
  %indvars.iv10.prol = phi i64 [ %indvars.iv.next11.prol, %.prol.preheader15 ], [ 0, %.prol.preheader15.preheader ]
  %7 = phi double [ %11, %.prol.preheader15 ], [ %.pre53, %.prol.preheader15.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader15 ], [ %xtraiter17, %.prol.preheader15.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv10.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %5, align 8
  %indvars.iv.next11.prol = add nuw nsw i64 %indvars.iv10.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit16.loopexit, label %.prol.preheader15, !llvm.loop !1

.prol.loopexit16.loopexit:                        ; preds = %.prol.preheader15
  br label %.prol.loopexit16

.prol.loopexit16:                                 ; preds = %.prol.loopexit16.loopexit, %.lr.ph48
  %indvars.iv10.unr = phi i64 [ 0, %.lr.ph48 ], [ %indvars.iv.next11.prol, %.prol.loopexit16.loopexit ]
  %.unr19 = phi double [ %.pre53, %.lr.ph48 ], [ %11, %.prol.loopexit16.loopexit ]
  %.lcssa60.unr = phi double [ undef, %.lr.ph48 ], [ %11, %.prol.loopexit16.loopexit ]
  %12 = trunc i64 %2 to i32
  %13 = icmp ult i32 %12, 3
  br i1 %13, label %._crit_edge49, label %.lr.ph48.new.preheader

.lr.ph48.new.preheader:                           ; preds = %.prol.loopexit16
  br label %.lr.ph48.new

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next6, %._crit_edge ]
  %14 = add i64 %indvars.iv5, 4294967295
  %15 = icmp sgt i64 %indvars.iv5, 0
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv5
  %.pre = load double, double* %16, align 8
  br i1 %15, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter25 = and i64 %indvars.iv5, 1
  %lcmp.mod = icmp eq i64 %xtraiter25, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %17 = load double, double* %4, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 0
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %.pre, %20
  store double %21, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %21, %.prol.preheader ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %21, %.prol.preheader ], [ undef, %.lr.ph ]
  %22 = trunc i64 %14 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %24 = phi double [ %36, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %30, %35
  store double %36, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv5
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %37 = phi double [ %.pre, %.preheader ], [ %.lcssa.unr.ph, %.prol.loopexit ], [ %36, %._crit_edge.loopexit ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv5
  %39 = load double, double* %38, align 8
  %40 = fdiv double %37, %39
  store double %40, double* %16, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %indvars.iv22
  br i1 %exitcond, label %.lr.ph48, label %.preheader

.lr.ph48.new:                                     ; preds = %.lr.ph48.new.preheader, %.lr.ph48.new
  %indvars.iv10 = phi i64 [ %indvars.iv.next11.3, %.lr.ph48.new ], [ %indvars.iv10.unr, %.lr.ph48.new.preheader ]
  %41 = phi double [ %57, %.lr.ph48.new ], [ %.unr19, %.lr.ph48.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv10
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %5, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next11
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %5, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next11.1
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %5, align 8
  %indvars.iv.next11.2 = add nsw i64 %indvars.iv10, 3
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next11.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fsub double %53, %56
  store double %57, double* %5, align 8
  %indvars.iv.next11.3 = add nsw i64 %indvars.iv10, 4
  %exitcond14.3 = icmp eq i64 %indvars.iv.next11.3, %indvars.iv22
  br i1 %exitcond14.3, label %._crit_edge49.loopexit, label %.lr.ph48.new

._crit_edge49.loopexit:                           ; preds = %.lr.ph48.new
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.prol.loopexit16, %.preheader43.._crit_edge49_crit_edge
  %.pre-phi57 = phi double* [ %.phi.trans.insert54, %.preheader43.._crit_edge49_crit_edge ], [ %5, %.prol.loopexit16 ], [ %5, %._crit_edge49.loopexit ]
  %58 = phi double [ %.pre55, %.preheader43.._crit_edge49_crit_edge ], [ %.lcssa60.unr, %.prol.loopexit16 ], [ %57, %._crit_edge49.loopexit ]
  %59 = tail call double @sqrt(double %58) #3
  store double %59, double* %.pre-phi57, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond24, label %60, label %.preheader44

; <label>:60:                                     ; preds = %._crit_edge49
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2000 x double]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %1
  %indvars.iv5 = phi i64 [ 0, %1 ], [ %indvars.iv.next6, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv3 = phi i64 [ 1, %1 ], [ %indvars.iv.next4, %._crit_edge..lr.ph_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv5, 2000
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge8, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge8 ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge8

; <label>:11:                                     ; preds = %._crit_edge9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge9, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv3
  br i1 %exitcond, label %._crit_edge, label %._crit_edge9

._crit_edge:                                      ; preds = %._crit_edge8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond7, label %17, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  br label %.lr.ph

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
