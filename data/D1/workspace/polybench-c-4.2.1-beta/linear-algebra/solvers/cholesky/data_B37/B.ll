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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader62.lr.ph:
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %.lr.ph84.backedge, %.preheader62.lr.ph
  %indvars.iv123 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next124, %.lr.ph84.backedge ]
  %indvars.iv121 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv121.be, %.lr.ph84.backedge ]
  %2 = mul nuw nsw i64 %indvars.iv123, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %scevgep120 = bitcast double* %scevgep to i8*
  %4 = sub i64 1998, %indvars.iv123
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %9

.preheader61:                                     ; preds = %9
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %8 = icmp slt i64 %indvars.iv.next124, 2000
  br i1 %8, label %._crit_edge88.thread, label %._crit_edge88

; <label>:9:                                      ; preds = %9, %.lr.ph84
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %9 ], [ 0, %.lr.ph84 ]
  %10 = sub nsw i64 0, %indvars.iv110
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv110
  store double %15, double* %16, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next111, %indvars.iv121
  br i1 %exitcond114, label %.preheader61, label %9

._crit_edge88.thread:                             ; preds = %.preheader61
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep120, i8 0, i64 %7, i32 8, i1 false)
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %17, align 8
  br label %.lr.ph84.backedge

._crit_edge88:                                    ; preds = %.preheader61
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %18, align 8
  %exitcond125 = icmp eq i64 %indvars.iv.next124, 2000
  br i1 %exitcond125, label %.preheader58.lr.ph, label %.lr.ph84.backedge

.lr.ph84.backedge:                                ; preds = %._crit_edge88, %._crit_edge88.thread
  %indvars.iv121.be = add nuw nsw i64 %indvars.iv121, 1
  br label %.lr.ph84

.preheader58.lr.ph:                               ; preds = %._crit_edge88
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 32000000, i32 8, i1 false)
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %.preheader58.lr.ph, %._crit_edge70.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge70.us ], [ 0, %.preheader58.lr.ph ]
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next102, 2000
  br i1 %exitcond103, label %.preheader.lr.ph, label %.preheader57.us.us.preheader

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv98 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next99, %._crit_edge68.us.us ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv101
  br label %22

._crit_edge68.us.us:                              ; preds = %22
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next99, 2000
  br i1 %exitcond100, label %._crit_edge70.us, label %.preheader57.us.us

; <label>:22:                                     ; preds = %22, %.preheader57.us.us
  %indvars.iv95 = phi i64 [ 0, %.preheader57.us.us ], [ %indvars.iv.next96.1, %22 ]
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv101
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv98, i64 %indvars.iv95
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %27, align 8
  %indvars.iv.next96 = or i64 %indvars.iv95, 1
  %30 = load double, double* %21, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96, i64 %indvars.iv101
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next96
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %exitcond97.1 = icmp eq i64 %indvars.iv.next96.1, 2000
  br i1 %exitcond97.1, label %._crit_edge68.us.us, label %22

.preheader.lr.ph:                                 ; preds = %._crit_edge70.us
  %37 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %38

; <label>:38:                                     ; preds = %38, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.4, %38 ]
  %39 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %40 = bitcast double* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %45 = bitcast double* %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %50 = bitcast double* %49 to i64*
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge.us, label %38

._crit_edge.us:                                   ; preds = %38
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond, label %._crit_edge65, label %.preheader.us

._crit_edge65:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %19) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]*) unnamed_addr #0 {
.preheader33.preheader:
  br label %.preheader33

.preheader33:                                     ; preds = %._crit_edge39, %.preheader33.preheader
  %indvars.iv63 = phi i64 [ 0, %.preheader33.preheader ], [ %indvars.iv.next64, %._crit_edge39 ]
  %2 = add i64 %indvars.iv63, -2
  %3 = add i64 %indvars.iv63, 4294967295
  %4 = icmp sgt i64 %indvars.iv63, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge39

.preheader.preheader:                             ; preds = %.preheader33
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 0
  br label %.preheader

.preheader32:                                     ; preds = %._crit_edge
  %6 = icmp sgt i64 %indvars.iv63, 0
  br i1 %6, label %.lr.ph38, label %._crit_edge39

.lr.ph38:                                         ; preds = %.preheader32
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv63
  %xtraiter5966 = and i64 %indvars.iv63, 1
  %lcmp.mod60 = icmp eq i64 %xtraiter5966, 0
  br i1 %lcmp.mod60, label %.prol.loopexit58, label %.prol.preheader57

.prol.preheader57:                                ; preds = %.lr.ph38
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 0
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = load double, double* %7, align 8
  %12 = fsub double %11, %10
  store double %12, double* %7, align 8
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.preheader57, %.lr.ph38
  %indvars.iv52.unr.ph = phi i64 [ 1, %.prol.preheader57 ], [ 0, %.lr.ph38 ]
  %13 = trunc i64 %3 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge39, label %.lr.ph38.new.preheader

.lr.ph38.new.preheader:                           ; preds = %.prol.loopexit58
  %15 = sub i64 %2, %indvars.iv52.unr.ph
  %16 = lshr i64 %15, 1
  %17 = and i64 %16, 1
  %lcmp.mod68 = icmp eq i64 %17, 0
  br i1 %lcmp.mod68, label %.lr.ph38.new.prol.preheader, label %.lr.ph38.new.prol.loopexit.unr-lcssa

.lr.ph38.new.prol.preheader:                      ; preds = %.lr.ph38.new.preheader
  br label %.lr.ph38.new.prol

.lr.ph38.new.prol:                                ; preds = %.lr.ph38.new.prol.preheader
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv52.unr.ph
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = load double, double* %7, align 8
  %22 = fsub double %21, %20
  store double %22, double* %7, align 8
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.unr.ph, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next53.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %24
  %26 = fsub double %22, %25
  store double %26, double* %7, align 8
  %indvars.iv.next53.1.prol = or i64 %indvars.iv52.unr.ph, 2
  br label %.lr.ph38.new.prol.loopexit.unr-lcssa

.lr.ph38.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph38.new.preheader, %.lr.ph38.new.prol
  %indvars.iv52.unr.ph69 = phi i64 [ %indvars.iv.next53.1.prol, %.lr.ph38.new.prol ], [ %indvars.iv52.unr.ph, %.lr.ph38.new.preheader ]
  br label %.lr.ph38.new.prol.loopexit

.lr.ph38.new.prol.loopexit:                       ; preds = %.lr.ph38.new.prol.loopexit.unr-lcssa
  %27 = icmp eq i64 %16, 0
  br i1 %27, label %._crit_edge39.loopexit, label %.lr.ph38.new.preheader.new

.lr.ph38.new.preheader.new:                       ; preds = %.lr.ph38.new.prol.loopexit
  br label %.lr.ph38.new

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge ], [ 0, %.preheader.preheader ]
  %28 = add i64 %indvars.iv47, 4294967295
  %29 = icmp sgt i64 %indvars.iv47, 0
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv47
  %xtraiter67 = and i64 %indvars.iv47, 1
  %lcmp.mod = icmp eq i64 %xtraiter67, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %31 = load double, double* %5, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 0
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %30, align 8
  %36 = fsub double %35, %34
  store double %36, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %37 = trunc i64 %28 to i32
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = load double, double* %30, align 8
  %45 = fsub double %44, %43
  store double %45, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %30, align 8
  %52 = fsub double %51, %50
  store double %52, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv47
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv47
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv47
  %56 = load double, double* %55, align 8
  %57 = fdiv double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, %indvars.iv63
  br i1 %exitcond, label %.preheader32, label %.preheader

.lr.ph38.new:                                     ; preds = %.lr.ph38.new, %.lr.ph38.new.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph69, %.lr.ph38.new.preheader.new ], [ %indvars.iv.next53.1.1, %.lr.ph38.new ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv52
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %59
  %61 = load double, double* %7, align 8
  %62 = fsub double %61, %60
  store double %62, double* %7, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next53
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fsub double %62, %65
  store double %66, double* %7, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next53.1
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fsub double %66, %69
  store double %70, double* %7, align 8
  %indvars.iv.next53.170 = add nsw i64 %indvars.iv52, 3
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next53.170
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %72
  %74 = fsub double %70, %73
  store double %74, double* %7, align 8
  %indvars.iv.next53.1.1 = add nsw i64 %indvars.iv52, 4
  %exitcond56.1.1 = icmp eq i64 %indvars.iv.next53.1.1, %indvars.iv63
  br i1 %exitcond56.1.1, label %._crit_edge39.loopexit.unr-lcssa, label %.lr.ph38.new

._crit_edge39.loopexit.unr-lcssa:                 ; preds = %.lr.ph38.new
  br label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %.lr.ph38.new.prol.loopexit, %._crit_edge39.loopexit.unr-lcssa
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33, %.prol.loopexit58, %.preheader32
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv63
  %76 = load double, double* %75, align 8
  %77 = tail call double @sqrt(double %76) #3
  store double %77, double* %75, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond65, label %._crit_edge42, label %.preheader33

._crit_edge42:                                    ; preds = %._crit_edge39
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv17 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next18, %._crit_edge ]
  %indvars.iv15 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next16, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv17, 2000
  br label %7

; <label>:7:                                      ; preds = %14, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv15
  br i1 %exitcond, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %14
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond19, label %._crit_edge12, label %.lr.ph

._crit_edge12:                                    ; preds = %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
