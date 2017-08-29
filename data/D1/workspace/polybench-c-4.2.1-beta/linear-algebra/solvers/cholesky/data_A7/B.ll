; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %2
  %indvars.iv58 = phi i64 [ 0, %2 ], [ %indvars.iv.next59, %.lr.ph.backedge ]
  %indvars.iv56 = phi i64 [ 1, %2 ], [ %indvars.iv56.be, %.lr.ph.backedge ]
  %3 = mul nuw nsw i64 %indvars.iv58, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %scevgep55 = bitcast double* %scevgep to i8*
  %5 = sub i64 1998, %indvars.iv58
  %6 = shl i64 %5, 3
  %7 = and i64 %6, 34359738360
  %8 = add nuw nsw i64 %7, 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge ], [ 0, %.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv45
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv45
  store double %14, double* %15, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next46, %indvars.iv56
  br i1 %exitcond49, label %._crit_edge._crit_edge, label %._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %16 = icmp slt i64 %indvars.iv.next59, 2000
  br i1 %16, label %._crit_edge25.thread, label %._crit_edge25

._crit_edge25.thread:                             ; preds = %._crit_edge._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep55, i8 0, i64 %8, i32 8, i1 false)
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv58
  store double 1.000000e+00, double* %17, align 8
  br label %.lr.ph.backedge

._crit_edge25:                                    ; preds = %._crit_edge._crit_edge
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv58
  store double 1.000000e+00, double* %18, align 8
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond60, label %._crit_edge10.preheader.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge25, %._crit_edge25.thread
  %indvars.iv56.be = add nuw nsw i64 %indvars.iv56, 1
  br label %.lr.ph

._crit_edge10.preheader.preheader:                ; preds = %._crit_edge25
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 32000000, i32 8, i1 false)
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %._crit_edge10.preheader

._crit_edge10.preheader:                          ; preds = %._crit_edge9, %._crit_edge10.preheader.preheader
  %indvars.iv36 = phi i64 [ 0, %._crit_edge10.preheader.preheader ], [ %indvars.iv.next37, %._crit_edge9 ]
  br label %._crit_edge12.preheader

._crit_edge12.preheader:                          ; preds = %._crit_edge10, %._crit_edge10.preheader
  %indvars.iv33 = phi i64 [ 0, %._crit_edge10.preheader ], [ %indvars.iv.next34, %._crit_edge10 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv36
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12, %._crit_edge12.preheader
  %indvars.iv30 = phi i64 [ 0, %._crit_edge12.preheader ], [ %indvars.iv.next31.1, %._crit_edge12 ]
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv30, i64 %indvars.iv36
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv33, i64 %indvars.iv30
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %29 = load double, double* %21, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next31, i64 %indvars.iv36
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv33, i64 %indvars.iv.next31
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next31.1, 2000
  br i1 %exitcond32.1, label %._crit_edge10, label %._crit_edge12

._crit_edge10:                                    ; preds = %._crit_edge12
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond35, label %._crit_edge9, label %._crit_edge12.preheader

._crit_edge9:                                     ; preds = %._crit_edge10
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond38, label %._crit_edge13.preheader.preheader, label %._crit_edge10.preheader

._crit_edge13.preheader.preheader:                ; preds = %._crit_edge9
  br label %._crit_edge13.preheader

._crit_edge13.preheader:                          ; preds = %._crit_edge13.preheader.preheader, %._crit_edge11
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge11 ], [ 0, %._crit_edge13.preheader.preheader ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13, %._crit_edge13.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge13.preheader ], [ %indvars.iv.next.4, %._crit_edge13 ]
  %36 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %47 = bitcast double* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %52 = bitcast double* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge11, label %._crit_edge13

._crit_edge11:                                    ; preds = %._crit_edge13
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond, label %61, label %._crit_edge13.preheader

; <label>:61:                                     ; preds = %._crit_edge11
  tail call void @free(i8* nonnull %19) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4._crit_edge, %2
  %indvars.iv28 = phi i64 [ 0, %2 ], [ %indvars.iv.next29, %._crit_edge4._crit_edge ]
  %3 = add i64 %indvars.iv28, -2
  %4 = add i64 %indvars.iv28, 4294967295
  %5 = icmp sgt i64 %indvars.iv28, 0
  br i1 %5, label %._crit_edge3.preheader.preheader, label %._crit_edge4._crit_edge

._crit_edge3.preheader.preheader:                 ; preds = %._crit_edge.preheader
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 0
  br label %._crit_edge3.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge
  br i1 true, label %.lr.ph8, label %._crit_edge4.preheader.._crit_edge4._crit_edge_crit_edge

._crit_edge4.preheader.._crit_edge4._crit_edge_crit_edge: ; preds = %._crit_edge4.preheader
  br label %._crit_edge4._crit_edge

.lr.ph8:                                          ; preds = %._crit_edge4.preheader
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv28
  %xtraiter2431 = and i64 %indvars.iv28, 1
  %lcmp.mod25 = icmp eq i64 %xtraiter2431, 0
  br i1 %lcmp.mod25, label %._crit_edge4.prol.loopexit, label %._crit_edge4.prol

._crit_edge4.prol:                                ; preds = %.lr.ph8
  %8 = load double, double* %6, align 8
  %9 = fmul double %8, %8
  %10 = load double, double* %7, align 8
  %11 = fsub double %10, %9
  store double %11, double* %7, align 8
  br label %._crit_edge4.prol.loopexit

._crit_edge4.prol.loopexit:                       ; preds = %._crit_edge4.prol, %.lr.ph8
  %indvars.iv19.unr.ph = phi i64 [ 1, %._crit_edge4.prol ], [ 0, %.lr.ph8 ]
  %12 = trunc i64 %4 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %._crit_edge4._crit_edge, label %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge

._crit_edge4.prol.loopexit.._crit_edge4_crit_edge: ; preds = %._crit_edge4.prol.loopexit
  %.pre37 = load double, double* %7, align 8
  %14 = sub i64 %3, %indvars.iv19.unr.ph
  %15 = lshr i64 %14, 1
  %16 = and i64 %15, 1
  %lcmp.mod40 = icmp eq i64 %16, 0
  br i1 %lcmp.mod40, label %._crit_edge4.prol.preheader, label %._crit_edge4.prol.loopexit39.unr-lcssa

._crit_edge4.prol.preheader:                      ; preds = %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge
  br label %._crit_edge4.prol41

._crit_edge4.prol41:                              ; preds = %._crit_edge4.prol.preheader
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv19.unr.ph
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fsub double %.pre37, %19
  store double %20, double* %7, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.unr.ph, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next20.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %22
  %24 = fsub double %20, %23
  store double %24, double* %7, align 8
  %indvars.iv.next20.1.prol = or i64 %indvars.iv19.unr.ph, 2
  br label %._crit_edge4.prol.loopexit39.unr-lcssa

._crit_edge4.prol.loopexit39.unr-lcssa:           ; preds = %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge, %._crit_edge4.prol41
  %.unr.ph = phi double [ %24, %._crit_edge4.prol41 ], [ %.pre37, %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge ]
  %indvars.iv19.unr.ph42 = phi i64 [ %indvars.iv.next20.1.prol, %._crit_edge4.prol41 ], [ %indvars.iv19.unr.ph, %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge ]
  br label %._crit_edge4.prol.loopexit39

._crit_edge4.prol.loopexit39:                     ; preds = %._crit_edge4.prol.loopexit39.unr-lcssa
  %25 = icmp eq i64 %15, 0
  br i1 %25, label %._crit_edge4._crit_edge.loopexit, label %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge.new

._crit_edge4.prol.loopexit.._crit_edge4_crit_edge.new: ; preds = %._crit_edge4.prol.loopexit39
  br label %._crit_edge4

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.preheader, %._crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge ], [ 0, %._crit_edge3.preheader.preheader ]
  %26 = add i64 %indvars.iv14, 4294967295
  %27 = icmp sgt i64 %indvars.iv14, 0
  br i1 %27, label %.lr.ph, label %._crit_edge3.preheader.._crit_edge_crit_edge

._crit_edge3.preheader.._crit_edge_crit_edge:     ; preds = %._crit_edge3.preheader
  %.pre38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv14
  br label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge3.preheader
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv14
  %xtraiter32 = and i64 %indvars.iv14, 1
  %lcmp.mod = icmp eq i64 %xtraiter32, 0
  br i1 %lcmp.mod, label %._crit_edge3.prol.loopexit, label %._crit_edge3.prol

._crit_edge3.prol:                                ; preds = %.lr.ph
  %29 = load double, double* %6, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 0
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = load double, double* %28, align 8
  %34 = fsub double %33, %32
  store double %34, double* %28, align 8
  br label %._crit_edge3.prol.loopexit

._crit_edge3.prol.loopexit:                       ; preds = %._crit_edge3.prol, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge3.prol ], [ 0, %.lr.ph ]
  %35 = trunc i64 %26 to i32
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %._crit_edge, label %._crit_edge3.prol.loopexit.._crit_edge3_crit_edge

._crit_edge3.prol.loopexit.._crit_edge3_crit_edge: ; preds = %._crit_edge3.prol.loopexit
  %.pre = load double, double* %28, align 8
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.prol.loopexit.._crit_edge3_crit_edge, %._crit_edge3
  %37 = phi double [ %49, %._crit_edge3 ], [ %.pre, %._crit_edge3.prol.loopexit.._crit_edge3_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge3 ], [ %indvars.iv.unr.ph, %._crit_edge3.prol.loopexit.._crit_edge3_crit_edge ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %37, %42
  store double %43, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv14
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %._crit_edge3

._crit_edge.loopexit:                             ; preds = %._crit_edge3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge3.preheader.._crit_edge_crit_edge, %._crit_edge3.prol.loopexit
  %.pre-phi = phi double* [ %.pre38, %._crit_edge3.preheader.._crit_edge_crit_edge ], [ %28, %._crit_edge3.prol.loopexit ], [ %28, %._crit_edge.loopexit ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv14
  %51 = load double, double* %50, align 8
  %52 = load double, double* %.pre-phi, align 8
  %53 = fdiv double %52, %51
  store double %53, double* %.pre-phi, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %indvars.iv28
  br i1 %exitcond, label %._crit_edge4.preheader, label %._crit_edge3.preheader

._crit_edge4:                                     ; preds = %._crit_edge4, %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge.new
  %54 = phi double [ %.unr.ph, %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge.new ], [ %70, %._crit_edge4 ]
  %indvars.iv19 = phi i64 [ %indvars.iv19.unr.ph42, %._crit_edge4.prol.loopexit.._crit_edge4_crit_edge.new ], [ %indvars.iv.next20.1.1, %._crit_edge4 ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv19
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %56
  %58 = fsub double %54, %57
  store double %58, double* %7, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next20
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %60
  %62 = fsub double %58, %61
  store double %62, double* %7, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next20.1
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fsub double %62, %65
  store double %66, double* %7, align 8
  %indvars.iv.next20.143 = add nsw i64 %indvars.iv19, 3
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next20.143
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fsub double %66, %69
  store double %70, double* %7, align 8
  %indvars.iv.next20.1.1 = add nsw i64 %indvars.iv19, 4
  %exitcond23.1.1 = icmp eq i64 %indvars.iv.next20.1.1, %indvars.iv28
  br i1 %exitcond23.1.1, label %._crit_edge4._crit_edge.loopexit.unr-lcssa, label %._crit_edge4

._crit_edge4._crit_edge.loopexit.unr-lcssa:       ; preds = %._crit_edge4
  br label %._crit_edge4._crit_edge.loopexit

._crit_edge4._crit_edge.loopexit:                 ; preds = %._crit_edge4.prol.loopexit39, %._crit_edge4._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge4._crit_edge

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4._crit_edge.loopexit, %._crit_edge4.preheader.._crit_edge4._crit_edge_crit_edge, %._crit_edge.preheader, %._crit_edge4.prol.loopexit
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv28
  %72 = load double, double* %71, align 8
  %73 = tail call double @sqrt(double %72) #3
  store double %73, double* %71, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond30, label %74, label %._crit_edge.preheader

; <label>:74:                                     ; preds = %._crit_edge4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %2, %._crit_edge._crit_edge
  %indvars.iv9 = phi i64 [ 0, %2 ], [ %indvars.iv.next10, %._crit_edge._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %2 ], [ %indvars.iv.next8, %._crit_edge._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv9, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge._crit_edge, label %8

._crit_edge._crit_edge:                           ; preds = %._crit_edge2
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond11, label %19, label %.lr.ph

; <label>:19:                                     ; preds = %._crit_edge._crit_edge
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
