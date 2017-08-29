; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
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
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* nonnull %17) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge9._crit_edge

._crit_edge9._crit_edge:                          ; preds = %._crit_edge9, %1
  %indvars.iv27 = phi i64 [ 0, %1 ], [ %indvars.iv.next28, %._crit_edge9 ]
  %2 = icmp sgt i64 %indvars.iv27, 0
  br i1 %2, label %.lr.ph2.preheader, label %._crit_edge9

.lr.ph2.preheader:                                ; preds = %._crit_edge9._crit_edge
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 0
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv6 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next7, %._crit_edge ]
  %4 = icmp sgt i64 %indvars.iv6, 0
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv6
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph2
  %xtraiter = and i64 %indvars.iv6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %6 = load double, double* %3, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv6
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = load double, double* %5, align 8
  %11 = fsub double %10, %9
  store double %11, double* %5, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %12 = icmp eq i64 %indvars.iv6, 1
  br i1 %12, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %.pre = load double, double* %5, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %13 = phi double [ %.pre, %.lr.ph.new.preheader ], [ %25, %.lr.ph.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv6
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %13, %18
  store double %19, double* %5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv6
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %5, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv6
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.lr.ph2
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv6
  %27 = load double, double* %26, align 8
  %28 = load double, double* %5, align 8
  %29 = fdiv double %28, %27
  store double %29, double* %5, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, %indvars.iv27
  br i1 %exitcond11, label %.lr.ph8.split.us.preheader, label %.lr.ph2

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge
  %xtraiter32 = and i64 %indvars.iv27, 1
  %30 = icmp eq i64 %xtraiter32, 0
  %31 = icmp eq i64 %indvars.iv27, 1
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv22 = phi i64 [ %indvars.iv27, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next23, %._crit_edge6.us ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv22
  br i1 %30, label %.prol.loopexit31, label %.prol.preheader30

.prol.preheader30:                                ; preds = %.lr.ph8.split.us
  %33 = load double, double* %3, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv22
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %32, align 8
  %38 = fsub double %37, %36
  store double %38, double* %32, align 8
  br label %.prol.loopexit31

.prol.loopexit31:                                 ; preds = %.lr.ph8.split.us, %.prol.preheader30
  %indvars.iv13.unr.ph = phi i64 [ 1, %.prol.preheader30 ], [ 0, %.lr.ph8.split.us ]
  br i1 %31, label %._crit_edge6.us, label %.lr.ph8.split.us.new.preheader

.lr.ph8.split.us.new.preheader:                   ; preds = %.prol.loopexit31
  %.pre34 = load double, double* %32, align 8
  br label %.lr.ph8.split.us.new

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us.new, %.lr.ph8.split.us.new.preheader
  %39 = phi double [ %.pre34, %.lr.ph8.split.us.new.preheader ], [ %51, %.lr.ph8.split.us.new ]
  %indvars.iv13 = phi i64 [ %indvars.iv13.unr.ph, %.lr.ph8.split.us.new.preheader ], [ %indvars.iv.next14.1, %.lr.ph8.split.us.new ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv13
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv22
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %39, %44
  store double %45, double* %32, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next14
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next14, i64 %indvars.iv22
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %45, %50
  store double %51, double* %32, align 8
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next14.1, %indvars.iv27
  br i1 %exitcond19.1, label %._crit_edge6.us.loopexit, label %.lr.ph8.split.us.new

._crit_edge6.us.loopexit:                         ; preds = %.lr.ph8.split.us.new
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.prol.loopexit31
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond26, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge9._crit_edge
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 2000
  br i1 %exitcond29, label %52, label %._crit_edge9._crit_edge

; <label>:52:                                     ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 2000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %._crit_edge5
  %indvars.iv = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %18, label %._crit_edge5

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
