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
.preheader13.lr.ph:
  br label %.lr.ph35.preheader

.lr.ph35.preheader:                               ; preds = %.preheader13.lr.ph, %._crit_edge40..preheader13_crit_edge
  %indvars.iv92 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next93, %._crit_edge40..preheader13_crit_edge ]
  %indvars.iv90 = phi i64 [ 1, %.preheader13.lr.ph ], [ %indvars.iv.next91, %._crit_edge40..preheader13_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv92, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep88 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %scevgep8889 = bitcast double* %scevgep88 to i8*
  %4 = sub i64 1998, %indvars.iv92
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %.lr.ph35

.lr.ph35:                                         ; preds = %.lr.ph35, %.lr.ph35.preheader
  %indvars.iv76 = phi i64 [ 0, %.lr.ph35.preheader ], [ %indvars.iv.next77, %.lr.ph35 ]
  %8 = sub nsw i64 0, %indvars.iv76
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv76
  store double %13, double* %14, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next77, %indvars.iv90
  br i1 %exitcond81, label %.preheader13._crit_edge, label %.lr.ph35

.preheader13._crit_edge:                          ; preds = %.lr.ph35
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %15 = icmp slt i64 %indvars.iv.next93, 2000
  br i1 %15, label %._crit_edge40..preheader13_crit_edge, label %._crit_edge42

._crit_edge40..preheader13_crit_edge:             ; preds = %.preheader13._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8889, i8 0, i64 %7, i32 8, i1 false)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv92
  store double 1.000000e+00, double* %16, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  br label %.lr.ph35.preheader

._crit_edge42:                                    ; preds = %.preheader13._crit_edge
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv92
  store double 1.000000e+00, double* %17, align 8
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %._crit_edge32.us.3

.preheader10.us:                                  ; preds = %.preheader10.us.preheader, %._crit_edge21.us-lcssa.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge21.us-lcssa.us.us ], [ 0, %.preheader10.us.preheader ]
  br label %.preheader9.us.us

.preheader9.us.us:                                ; preds = %._crit_edge19.us.us, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge19.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv61
  br label %.preheader9.us.us.new

._crit_edge19.us.us:                              ; preds = %.preheader9.us.us.new
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond60, label %._crit_edge21.us-lcssa.us.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us, %.preheader9.us.us.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader9.us.us.new ], [ 0, %.preheader9.us.us ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv61
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv57, i64 %indvars.iv49
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv61
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv57, i64 %indvars.iv.next50
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond52.1, label %._crit_edge19.us.us, label %.preheader9.us.us.new

._crit_edge21.us-lcssa.us.us:                     ; preds = %._crit_edge19.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 2000
  br i1 %exitcond64, label %.preheader.us.preheader, label %.preheader10.us

.preheader.us.preheader:                          ; preds = %._crit_edge21.us-lcssa.us.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ 0, %.preheader.us ]
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond, label %._crit_edge16, label %.preheader.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #3
  ret void

._crit_edge32.us.3:                               ; preds = %._crit_edge32.us.3, %._crit_edge42
  %indvars.iv69 = phi i64 [ 0, %._crit_edge42 ], [ %indvars.iv.next70.3.1, %._crit_edge32.us.3 ]
  %55 = mul nuw nsw i64 %indvars.iv69, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = add nuw nsw i64 %55, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %57 = add nuw nsw i64 %55, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %58 = add nuw nsw i64 %55, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next70.3 = or i64 %indvars.iv69, 4
  %59 = mul nuw nsw i64 %indvars.iv.next70.3, 16000
  %scevgep.1109 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1109, i8 0, i64 16000, i32 8, i1 false)
  %60 = add nuw nsw i64 %59, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %60
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %61 = add nuw nsw i64 %59, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %62 = add nuw nsw i64 %59, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next70.3.1 = add nsw i64 %indvars.iv69, 8
  %exitcond72.3.1 = icmp eq i64 %indvars.iv.next70.3.1, 2000
  br i1 %exitcond72.3.1, label %.preheader10.us.preheader, label %._crit_edge32.us.3

.preheader10.us.preheader:                        ; preds = %._crit_edge32.us.3
  br label %.preheader10.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader4.preheader:
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %.preheader3._crit_edge
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %.preheader3._crit_edge ], [ 0, %.preheader4.preheader ]
  %2 = add i64 %indvars.iv41, 4294967295
  %3 = icmp sgt i64 %indvars.iv41, 0
  br i1 %3, label %.preheader.preheader, label %.preheader3.thread

.preheader.preheader:                             ; preds = %.preheader4
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 0
  br label %.preheader

.preheader3.thread:                               ; preds = %.preheader4
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv41
  %.pre1446 = load double, double* %5, align 8
  br label %.preheader3._crit_edge

.preheader3:                                      ; preds = %.preheader._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv41
  %.pre14 = load double, double* %6, align 8
  br i1 true, label %.lr.ph8.preheader, label %.preheader3..preheader3._crit_edge_crit_edge

.preheader3..preheader3._crit_edge_crit_edge:     ; preds = %.preheader3
  br label %.preheader3._crit_edge

.lr.ph8.preheader:                                ; preds = %.preheader3
  %7 = trunc i64 %indvars.iv41 to i32
  %xtraiter36 = and i32 %7, 3
  %lcmp.mod37 = icmp eq i32 %xtraiter36, 0
  br i1 %lcmp.mod37, label %.lr.ph8.prol.loopexit, label %.lr.ph8.prol.preheader

.lr.ph8.prol.preheader:                           ; preds = %.lr.ph8.preheader
  br label %.lr.ph8.prol

.lr.ph8.prol:                                     ; preds = %.lr.ph8.prol.preheader, %.lr.ph8.prol
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next32.prol, %.lr.ph8.prol ], [ 0, %.lr.ph8.prol.preheader ]
  %8 = phi double [ %12, %.lr.ph8.prol ], [ %.pre14, %.lr.ph8.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph8.prol ], [ %xtraiter36, %.lr.ph8.prol.preheader ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv31.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %6, align 8
  %indvars.iv.next32.prol = add nuw nsw i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph8.prol.loopexit.loopexit, label %.lr.ph8.prol, !llvm.loop !1

.lr.ph8.prol.loopexit.loopexit:                   ; preds = %.lr.ph8.prol
  br label %.lr.ph8.prol.loopexit

.lr.ph8.prol.loopexit:                            ; preds = %.lr.ph8.prol.loopexit.loopexit, %.lr.ph8.preheader
  %indvars.iv31.unr = phi i64 [ 0, %.lr.ph8.preheader ], [ %indvars.iv.next32.prol, %.lr.ph8.prol.loopexit.loopexit ]
  %.unr38 = phi double [ %.pre14, %.lr.ph8.preheader ], [ %12, %.lr.ph8.prol.loopexit.loopexit ]
  %.lcssa21.unr = phi double [ undef, %.lr.ph8.preheader ], [ %12, %.lr.ph8.prol.loopexit.loopexit ]
  %13 = trunc i64 %2 to i32
  %14 = icmp ult i32 %13, 3
  br i1 %14, label %.preheader3._crit_edge, label %.lr.ph8.preheader57

.lr.ph8.preheader57:                              ; preds = %.lr.ph8.prol.loopexit
  br label %.lr.ph8

.preheader:                                       ; preds = %.preheader.preheader, %.preheader._crit_edge
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %.preheader._crit_edge ], [ 0, %.preheader.preheader ]
  %15 = add i64 %indvars.iv26, 4294967295
  %16 = icmp sgt i64 %indvars.iv26, 0
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv26
  %.pre = load double, double* %17, align 8
  br i1 %16, label %.lr.ph.preheader, label %.preheader._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter45 = and i64 %indvars.iv26, 1
  %lcmp.mod = icmp eq i64 %xtraiter45, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %18 = load double, double* %4, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %.pre, %21
  store double %22, double* %17, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %22, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %.lcssa.unr.ph = phi double [ %22, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %23 = trunc i64 %15 to i32
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %.preheader._crit_edge, label %.lr.ph.preheader56

.lr.ph.preheader56:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader56, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader56 ]
  %25 = phi double [ %37, %.lr.ph ], [ %.unr.ph, %.lr.ph.preheader56 ]
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %31, %36
  store double %37, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv26
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.lr.ph

.preheader._crit_edge.loopexit:                   ; preds = %.lr.ph
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %38 = phi double [ %.pre, %.preheader ], [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %37, %.preheader._crit_edge.loopexit ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv26
  %40 = load double, double* %39, align 8
  %41 = fdiv double %38, %40
  store double %41, double* %17, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %indvars.iv41
  br i1 %exitcond, label %.preheader3, label %.preheader

.lr.ph8:                                          ; preds = %.lr.ph8.preheader57, %.lr.ph8
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.3, %.lr.ph8 ], [ %indvars.iv31.unr, %.lr.ph8.preheader57 ]
  %42 = phi double [ %58, %.lr.ph8 ], [ %.unr38, %.lr.ph8.preheader57 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv31
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %6, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next32
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %6, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next32.1
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %6, align 8
  %indvars.iv.next32.2 = add nsw i64 %indvars.iv31, 3
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next32.2
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %56
  %58 = fsub double %54, %57
  store double %58, double* %6, align 8
  %indvars.iv.next32.3 = add nsw i64 %indvars.iv31, 4
  %exitcond35.3 = icmp eq i64 %indvars.iv.next32.3, %indvars.iv41
  br i1 %exitcond35.3, label %.preheader3._crit_edge.loopexit, label %.lr.ph8

.preheader3._crit_edge.loopexit:                  ; preds = %.lr.ph8
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3..preheader3._crit_edge_crit_edge, %.preheader3._crit_edge.loopexit, %.lr.ph8.prol.loopexit, %.preheader3.thread
  %59 = phi double* [ %5, %.preheader3.thread ], [ undef, %.preheader3..preheader3._crit_edge_crit_edge ], [ %6, %.lr.ph8.prol.loopexit ], [ %6, %.preheader3._crit_edge.loopexit ]
  %60 = phi double [ %.pre1446, %.preheader3.thread ], [ undef, %.preheader3..preheader3._crit_edge_crit_edge ], [ %.lcssa21.unr, %.lr.ph8.prol.loopexit ], [ %58, %.preheader3._crit_edge.loopexit ]
  %61 = tail call double @sqrt(double %60) #3
  store double %61, double* %59, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 2000
  br i1 %exitcond44, label %._crit_edge11, label %.preheader4

._crit_edge11:                                    ; preds = %.preheader3._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %6 = mul nsw i64 %indvars.iv9, 2000
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge13 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge13

; <label>:11:                                     ; preds = %._crit_edge14
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %._crit_edge14

._crit_edge:                                      ; preds = %._crit_edge13
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 2000
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  br i1 %exitcond12, label %._crit_edge4, label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
