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
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
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
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.backedge, %1
  %indvars.iv31 = phi i64 [ 0, %1 ], [ %indvars.iv.next32, %.lr.ph21.backedge ]
  %indvars.iv29 = phi i64 [ 1, %1 ], [ %indvars.iv29.be, %.lr.ph21.backedge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph21
  %indvars.iv19 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next20, %._crit_edge ]
  %2 = sub nsw i64 0, %indvars.iv19
  %3 = trunc i64 %2 to i32
  %4 = srem i32 %3, 2000
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.000000e+03
  %7 = fadd double %6, 1.000000e+00
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv19
  store double %7, double* %8, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next20, %indvars.iv29
  br i1 %exitcond23, label %._crit_edge22, label %._crit_edge

._crit_edge22:                                    ; preds = %._crit_edge
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %9 = icmp slt i64 %indvars.iv.next32, 2000
  br i1 %9, label %._crit_edge26.thread, label %._crit_edge26

._crit_edge26.thread:                             ; preds = %._crit_edge22
  %10 = mul i64 %indvars.iv31, 2001
  %11 = add i64 %10, 1
  %12 = mul i64 %indvars.iv31, -8
  %13 = add i64 %12, 15992
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %11
  %14 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %14, i8 0, i64 %13, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %15, align 8
  br label %.lr.ph21.backedge

._crit_edge26:                                    ; preds = %._crit_edge22
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %16, align 8
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 2000
  br i1 %exitcond33, label %.preheader1.lr.ph, label %.lr.ph21.backedge

.lr.ph21.backedge:                                ; preds = %._crit_edge26, %._crit_edge26.thread
  %indvars.iv29.be = add nuw nsw i64 %indvars.iv29, 1
  br label %.lr.ph21

.preheader1.lr.ph:                                ; preds = %._crit_edge26
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %18 = bitcast i8* %17 to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 32000000, i32 8, i1 false)
  br label %.lr.ph10.us.us.preheader

.lr.ph10.us.us.preheader:                         ; preds = %._crit_edge13.us, %.preheader1.lr.ph
  %indvars.iv10 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next11, %._crit_edge13.us ]
  br label %.lr.ph10.us.us

._crit_edge13.us:                                 ; preds = %._crit_edge11.us.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.lr.ph7.split.us.preheader, label %.lr.ph10.us.us.preheader

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge13.us
  br label %.lr.ph7.split.us

.lr.ph10.us.us:                                   ; preds = %._crit_edge11.us.us, %.lr.ph10.us.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.lr.ph10.us.us.preheader ], [ %indvars.iv.next8, %._crit_edge11.us.us ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv10
  br label %._crit_edge40

._crit_edge11.us.us:                              ; preds = %._crit_edge40
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %._crit_edge13.us, label %.lr.ph10.us.us

._crit_edge40:                                    ; preds = %._crit_edge40, %.lr.ph10.us.us
  %indvars.iv4 = phi i64 [ 0, %.lr.ph10.us.us ], [ %indvars.iv.next5.1, %._crit_edge40 ]
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv10
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %25 = load double, double* %24, align 8
  %26 = fadd double %23, %25
  store double %26, double* %24, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %27 = load double, double* %19, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv10
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  store double %33, double* %31, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %._crit_edge11.us.us, label %._crit_edge40

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.4, %._crit_edge41 ]
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1, i64 %indvars.iv
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next
  %40 = bitcast double* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.1
  %45 = bitcast double* %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.1
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.2
  %50 = bitcast double* %49 to i64*
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.2
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.3
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.3
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge.us, label %._crit_edge41

._crit_edge.us:                                   ; preds = %._crit_edge41
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge8, label %.lr.ph7.split.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %17) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
  br label %._crit_edge5._crit_edge

._crit_edge5._crit_edge:                          ; preds = %._crit_edge5, %1
  %indvars.iv14 = phi i64 [ 0, %1 ], [ %indvars.iv.next15, %._crit_edge5 ]
  %2 = add i64 %indvars.iv14, -2
  %3 = icmp sgt i64 %indvars.iv14, 0
  br i1 %3, label %.preheader.preheader, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %._crit_edge5._crit_edge
  %.pre23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv14
  br label %._crit_edge5

.preheader.preheader:                             ; preds = %._crit_edge5._crit_edge
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 0
  br label %.preheader

.lr.ph4:                                          ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv14
  %xtraiter19 = and i64 %indvars.iv14, 1
  %lcmp.mod20 = icmp eq i64 %xtraiter19, 0
  br i1 %lcmp.mod20, label %.prol.loopexit18, label %.prol.preheader17

.prol.preheader17:                                ; preds = %.lr.ph4
  %6 = load double, double* %4, align 8
  %7 = fmul double %6, %6
  %8 = load double, double* %5, align 8
  %9 = fsub double %8, %7
  store double %9, double* %5, align 8
  br label %.prol.loopexit18

.prol.loopexit18:                                 ; preds = %.lr.ph4, %.prol.preheader17
  %indvars.iv9.unr.ph = phi i64 [ 1, %.prol.preheader17 ], [ 0, %.lr.ph4 ]
  %10 = icmp eq i64 %indvars.iv14, 1
  br i1 %10, label %._crit_edge5, label %.lr.ph4.new.preheader

.lr.ph4.new.preheader:                            ; preds = %.prol.loopexit18
  %.pre21 = load double, double* %5, align 8
  %11 = sub i64 %2, %indvars.iv9.unr.ph
  %12 = lshr i64 %11, 1
  %13 = and i64 %12, 1
  %lcmp.mod26 = icmp eq i64 %13, 0
  br i1 %lcmp.mod26, label %.lr.ph4.new.prol.preheader, label %.lr.ph4.new.prol.loopexit.unr-lcssa

.lr.ph4.new.prol.preheader:                       ; preds = %.lr.ph4.new.preheader
  br label %.lr.ph4.new.prol

.lr.ph4.new.prol:                                 ; preds = %.lr.ph4.new.prol.preheader
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv9.unr.ph
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fsub double %.pre21, %16
  store double %17, double* %5, align 8
  %indvars.iv.next10.prol = add nuw nsw i64 %indvars.iv9.unr.ph, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next10.prol
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fsub double %17, %20
  store double %21, double* %5, align 8
  %indvars.iv.next10.1.prol = or i64 %indvars.iv9.unr.ph, 2
  br label %.lr.ph4.new.prol.loopexit.unr-lcssa

.lr.ph4.new.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph4.new.preheader, %.lr.ph4.new.prol
  %.unr.ph = phi double [ %21, %.lr.ph4.new.prol ], [ %.pre21, %.lr.ph4.new.preheader ]
  %indvars.iv9.unr.ph27 = phi i64 [ %indvars.iv.next10.1.prol, %.lr.ph4.new.prol ], [ %indvars.iv9.unr.ph, %.lr.ph4.new.preheader ]
  br label %.lr.ph4.new.prol.loopexit

.lr.ph4.new.prol.loopexit:                        ; preds = %.lr.ph4.new.prol.loopexit.unr-lcssa
  %22 = icmp eq i64 %12, 0
  br i1 %22, label %._crit_edge5.loopexit, label %.lr.ph4.new.preheader.new

.lr.ph4.new.preheader.new:                        ; preds = %.lr.ph4.new.prol.loopexit
  br label %.lr.ph4.new

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next4, %._crit_edge ]
  %23 = icmp sgt i64 %indvars.iv3, 0
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv3
  br i1 %23, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv3, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %25 = load double, double* %4, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 0
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = load double, double* %24, align 8
  %30 = fsub double %29, %28
  store double %30, double* %24, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %31 = icmp eq i64 %indvars.iv3, 1
  br i1 %31, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %.pre = load double, double* %24, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %32 = phi double [ %.pre, %.lr.ph.new.preheader ], [ %44, %.lr.ph.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  store double %38, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %24, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv3
  %46 = load double, double* %45, align 8
  %47 = load double, double* %24, align 8
  %48 = fdiv double %47, %46
  store double %48, double* %24, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, %indvars.iv14
  br i1 %exitcond8, label %.lr.ph4, label %.preheader

.lr.ph4.new:                                      ; preds = %.lr.ph4.new, %.lr.ph4.new.preheader.new
  %49 = phi double [ %.unr.ph, %.lr.ph4.new.preheader.new ], [ %65, %.lr.ph4.new ]
  %indvars.iv9 = phi i64 [ %indvars.iv9.unr.ph27, %.lr.ph4.new.preheader.new ], [ %indvars.iv.next10.1.1, %.lr.ph4.new ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv9
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %5, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next10
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fsub double %53, %56
  store double %57, double* %5, align 8
  %indvars.iv.next10.1 = add nuw nsw i64 %indvars.iv9, 2
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next10.1
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %59
  %61 = fsub double %57, %60
  store double %61, double* %5, align 8
  %indvars.iv.next10.128 = add nsw i64 %indvars.iv9, 3
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next10.128
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %63
  %65 = fsub double %61, %64
  store double %65, double* %5, align 8
  %indvars.iv.next10.1.1 = add nsw i64 %indvars.iv9, 4
  %exitcond13.1.1 = icmp eq i64 %indvars.iv.next10.1.1, %indvars.iv14
  br i1 %exitcond13.1.1, label %._crit_edge5.loopexit.unr-lcssa, label %.lr.ph4.new

._crit_edge5.loopexit.unr-lcssa:                  ; preds = %.lr.ph4.new
  br label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %.lr.ph4.new.prol.loopexit, %._crit_edge5.loopexit.unr-lcssa
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %.prol.loopexit18, %.._crit_edge5_crit_edge
  %.pre-phi24 = phi double* [ %.pre23, %.._crit_edge5_crit_edge ], [ %5, %.prol.loopexit18 ], [ %5, %._crit_edge5.loopexit ]
  %66 = load double, double* %.pre-phi24, align 8
  %67 = tail call double @sqrt(double %66) #3
  store double %67, double* %.pre-phi24, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond16, label %68, label %._crit_edge5._crit_edge

; <label>:68:                                     ; preds = %._crit_edge5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge2..lr.ph_crit_edge, %1
  %indvars.iv5 = phi i64 [ 0, %1 ], [ %indvars.iv.next6, %._crit_edge2..lr.ph_crit_edge ]
  %indvars.iv3 = phi i64 [ 1, %1 ], [ %indvars.iv.next4, %._crit_edge2..lr.ph_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv5, 2000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv3
  br i1 %exitcond, label %._crit_edge2, label %._crit_edge._crit_edge

._crit_edge2:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond7, label %17, label %._crit_edge2..lr.ph_crit_edge

._crit_edge2..lr.ph_crit_edge:                    ; preds = %._crit_edge2
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  br label %.lr.ph

; <label>:17:                                     ; preds = %._crit_edge2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
