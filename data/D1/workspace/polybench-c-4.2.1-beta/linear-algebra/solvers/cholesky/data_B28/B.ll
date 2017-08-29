; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_cholesky(i32 2000, [2000 x double]* %4)
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
  tail call void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*) #0 {
.preheader64.lr.ph:
  br label %.lr.ph86

.lr.ph86:                                         ; preds = %.preheader64.lr.ph, %._crit_edge90
  %indvars.iv141 = phi i64 [ 0, %.preheader64.lr.ph ], [ %indvars.iv.next142, %._crit_edge90 ]
  %indvars.iv139 = phi i64 [ 1, %.preheader64.lr.ph ], [ %indvars.iv.next140, %._crit_edge90 ]
  %2 = mul nuw nsw i64 %indvars.iv141, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %scevgep137138 = bitcast double* %scevgep137 to i8*
  %4 = sub i64 1998, %indvars.iv141
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %9

.preheader63:                                     ; preds = %9
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %8 = icmp slt i64 %indvars.iv.next142, 2000
  br i1 %8, label %._crit_edge90.loopexit, label %._crit_edge90

; <label>:9:                                      ; preds = %9, %.lr.ph86
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %9 ], [ 0, %.lr.ph86 ]
  %10 = sub nsw i64 0, %indvars.iv125
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv125
  store double %15, double* %16, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next126, %indvars.iv139
  br i1 %exitcond130, label %.preheader63, label %9

._crit_edge90.loopexit:                           ; preds = %.preheader63
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep137138, i8 0, i64 %7, i32 8, i1 false)
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit, %.preheader63
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %17, align 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 2000
  br i1 %exitcond144, label %._crit_edge92, label %.lr.ph86

._crit_edge92:                                    ; preds = %._crit_edge90
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %._crit_edge83.us.3

.preheader59.us.us.preheader:                     ; preds = %.preheader59.us.us.preheader.preheader, %._crit_edge72.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge72.us ], [ 0, %.preheader59.us.us.preheader.preheader ]
  br label %.preheader59.us.us

._crit_edge72.us:                                 ; preds = %._crit_edge70.us.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, 2000
  br i1 %exitcond113, label %.preheader.us.preheader, label %.preheader59.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge72.us
  br label %.preheader.us

.preheader59.us.us:                               ; preds = %._crit_edge70.us.us, %.preheader59.us.us.preheader
  %indvars.iv106 = phi i64 [ 0, %.preheader59.us.us.preheader ], [ %indvars.iv.next107, %._crit_edge70.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv110
  br label %.preheader59.us.us.new

._crit_edge70.us.us:                              ; preds = %.preheader59.us.us.new
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, 2000
  br i1 %exitcond109, label %._crit_edge72.us, label %.preheader59.us.us

.preheader59.us.us.new:                           ; preds = %.preheader59.us.us, %.preheader59.us.us.new
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %.preheader59.us.us.new ], [ 0, %.preheader59.us.us ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv110
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv106, i64 %indvars.iv98
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next99 = or i64 %indvars.iv98, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next99, i64 %indvars.iv110
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next99
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99.1, 2000
  br i1 %exitcond101.1, label %._crit_edge70.us.us, label %.preheader59.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ 0, %.preheader.us ]
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond, label %._crit_edge67, label %.preheader.us

._crit_edge67:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #3
  ret void

._crit_edge83.us.3:                               ; preds = %._crit_edge83.us.3, %._crit_edge92
  %indvars.iv118 = phi i64 [ 0, %._crit_edge92 ], [ %indvars.iv.next119.3.1, %._crit_edge83.us.3 ]
  %55 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = mul nuw nsw i64 %indvars.iv118, 16000
  %57 = add nuw nsw i64 %56, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul nuw nsw i64 %indvars.iv118, 16000
  %59 = add nuw nsw i64 %58, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %60 = mul nuw nsw i64 %indvars.iv118, 16000
  %61 = add nuw nsw i64 %60, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %62 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.1162 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1162, i8 0, i64 16000, i32 8, i1 false)
  %63 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %64 = add nuw nsw i64 %63, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %65 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %66 = add nuw nsw i64 %65, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %67 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %68 = add nuw nsw i64 %67, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3.1 = add nsw i64 %indvars.iv118, 8
  %exitcond121.3.1 = icmp eq i64 %indvars.iv.next119.3.1, 2000
  br i1 %exitcond121.3.1, label %.preheader59.us.us.preheader.preheader, label %._crit_edge83.us.3

.preheader59.us.us.preheader.preheader:           ; preds = %._crit_edge83.us.3
  br label %.preheader59.us.us.preheader
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky(i32, [2000 x double]*) #0 {
.preheader36.preheader:
  br label %.preheader36

.preheader36:                                     ; preds = %.preheader36.preheader, %._crit_edge42
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge42 ], [ 0, %.preheader36.preheader ]
  %2 = add i64 %indvars.iv66, -2
  %3 = add i64 %indvars.iv66, 4294967295
  %4 = icmp sgt i64 %indvars.iv66, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge42

.preheader.preheader:                             ; preds = %.preheader36
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 0
  br label %.preheader

.preheader35:                                     ; preds = %._crit_edge
  %6 = icmp sgt i64 %indvars.iv66, 0
  br i1 %6, label %.lr.ph41, label %._crit_edge42

.lr.ph41:                                         ; preds = %.preheader35
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv66
  %xtraiter6270 = and i64 %indvars.iv66, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter6270, 0
  br i1 %lcmp.mod63, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph41
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 0
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = load double, double* %7, align 8
  %12 = fsub double %11, %10
  store double %12, double* %7, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.prol.preheader60, %.lr.ph41
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph41 ]
  %13 = trunc i64 %3 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge42, label %.lr.ph41.new.preheader

.lr.ph41.new.preheader:                           ; preds = %.prol.loopexit61
  %15 = sub i64 %2, %indvars.iv55.unr.ph
  %16 = lshr i64 %15, 1
  %17 = and i64 %16, 1
  %lcmp.mod72 = icmp eq i64 %17, 0
  br i1 %lcmp.mod72, label %.lr.ph41.new.prol.preheader, label %.lr.ph41.new.prol.loopexit.unr-lcssa

.lr.ph41.new.prol.preheader:                      ; preds = %.lr.ph41.new.preheader
  br label %.lr.ph41.new.prol

.lr.ph41.new.prol:                                ; preds = %.lr.ph41.new.prol.preheader
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv55.unr.ph
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = load double, double* %7, align 8
  %22 = fsub double %21, %20
  store double %22, double* %7, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.unr.ph, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv.next56.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %24
  %26 = fsub double %22, %25
  store double %26, double* %7, align 8
  %indvars.iv.next56.1.prol = or i64 %indvars.iv55.unr.ph, 2
  br label %.lr.ph41.new.prol.loopexit.unr-lcssa

.lr.ph41.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph41.new.preheader, %.lr.ph41.new.prol
  %indvars.iv55.unr.ph73 = phi i64 [ %indvars.iv.next56.1.prol, %.lr.ph41.new.prol ], [ %indvars.iv55.unr.ph, %.lr.ph41.new.preheader ]
  br label %.lr.ph41.new.prol.loopexit

.lr.ph41.new.prol.loopexit:                       ; preds = %.lr.ph41.new.prol.loopexit.unr-lcssa
  %27 = icmp eq i64 %16, 0
  br i1 %27, label %._crit_edge42.loopexit, label %.lr.ph41.new.preheader.new

.lr.ph41.new.preheader.new:                       ; preds = %.lr.ph41.new.prol.loopexit
  br label %.lr.ph41.new

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge ], [ 0, %.preheader.preheader ]
  %28 = add i64 %indvars.iv50, 4294967295
  %29 = icmp sgt i64 %indvars.iv50, 0
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv50
  %xtraiter71 = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter71, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %31 = load double, double* %5, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 0
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
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = load double, double* %30, align 8
  %45 = fsub double %44, %43
  store double %45, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %30, align 8
  %52 = fsub double %51, %50
  store double %52, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv50
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv50
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv50
  %56 = load double, double* %55, align 8
  %57 = fdiv double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %indvars.iv66
  br i1 %exitcond, label %.preheader35, label %.preheader

.lr.ph41.new:                                     ; preds = %.lr.ph41.new, %.lr.ph41.new.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph73, %.lr.ph41.new.preheader.new ], [ %indvars.iv.next56.1.1, %.lr.ph41.new ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv55
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %59
  %61 = load double, double* %7, align 8
  %62 = fsub double %61, %60
  store double %62, double* %7, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv.next56
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fsub double %62, %65
  store double %66, double* %7, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv.next56.1
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fsub double %66, %69
  store double %70, double* %7, align 8
  %indvars.iv.next56.174 = add nsw i64 %indvars.iv55, 3
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv.next56.174
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %72
  %74 = fsub double %70, %73
  store double %74, double* %7, align 8
  %indvars.iv.next56.1.1 = add nsw i64 %indvars.iv55, 4
  %exitcond59.1.1 = icmp eq i64 %indvars.iv.next56.1.1, %indvars.iv66
  br i1 %exitcond59.1.1, label %._crit_edge42.loopexit.unr-lcssa, label %.lr.ph41.new

._crit_edge42.loopexit.unr-lcssa:                 ; preds = %.lr.ph41.new
  br label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %.lr.ph41.new.prol.loopexit, %._crit_edge42.loopexit.unr-lcssa
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader36, %.prol.loopexit61, %.preheader35
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv66
  %76 = load double, double* %75, align 8
  %77 = tail call double @sqrt(double %76) #3
  store double %77, double* %75, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 2000
  br i1 %exitcond69, label %._crit_edge45, label %.preheader36

._crit_edge45:                                    ; preds = %._crit_edge42
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]*) #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next19, %._crit_edge ]
  %indvars.iv16 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next17, %._crit_edge ]
  %6 = mul nsw i64 %indvars.iv18, 2000
  br label %7

; <label>:7:                                      ; preds = %14, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %14
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond21, label %._crit_edge13, label %.lr.ph

._crit_edge13:                                    ; preds = %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
