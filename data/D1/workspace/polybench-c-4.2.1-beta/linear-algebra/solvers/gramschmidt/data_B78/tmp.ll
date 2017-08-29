; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader27.us.preheader, label %._crit_edge30

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader27.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %11 ], [ 0, %.preheader27.us ]
  %12 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, %9
  br i1 %exitcond, label %._crit_edge33.us, label %11

._crit_edge33.us:                                 ; preds = %11
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, %10
  br i1 %exitcond54, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge33.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.preheader.us.preheader, label %._crit_edge30

.preheader.us.preheader:                          ; preds = %.preheader26
  %22 = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = zext i32 %1 to i64
  %25 = add nsw i64 %24, -1
  %xtraiter = and i64 %24, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.prol, i64 0
  %scevgep51.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv37.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %xtraiter, %.preheader.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %25, 3
  br i1 %26, label %._crit_edge30, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %27 = add nsw i64 %24, -4
  %28 = sub nsw i64 %27, %indvars.iv37.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod56 = icmp eq i64 %30, 0
  br i1 %lcmp.mod56, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol58 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.unr, i64 0
  %scevgep51.prol59 = bitcast double* %scevgep.prol58 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.prol59, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.prol60 = add nuw nsw i64 %indvars.iv37.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.prol60, i64 0
  %scevgep51.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1.prol = add nuw nsw i64 %indvars.iv37.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.prol, i64 0
  %scevgep51.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2.prol = add nuw nsw i64 %indvars.iv37.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.prol, i64 0
  %scevgep51.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3.prol = or i64 %indvars.iv37.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv37.unr61 = phi i64 [ %indvars.iv37.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next38.3.prol, %._crit_edge.us.3.prol ]
  %31 = icmp eq i64 %29, 0
  br i1 %31, label %._crit_edge30.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge30.loopexit.unr-lcssa:                 ; preds = %._crit_edge.us.3
  br label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge30.loopexit.unr-lcssa
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader27.lr.ph, %.preheader.us.prol.loopexit, %.preheader26
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr61, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next38.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 0
  %scevgep51 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38, i64 0
  %scevgep51.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1, i64 0
  %scevgep51.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2, i64 0
  %scevgep51.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %scevgep.162 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.3, i64 0
  %scevgep51.163 = bitcast double* %scevgep.162 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.163, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.164 = add nsw i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.164, i64 0
  %scevgep51.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1.1 = add nsw i64 %indvars.iv37, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.1, i64 0
  %scevgep51.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2.1 = add nsw i64 %indvars.iv37, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.1, i64 0
  %scevgep51.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3.1 = add nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, %24
  br i1 %exitcond.3.1, label %._crit_edge30.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader66.lr.ph, label %._crit_edge80

.preheader66.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %0, 0
  %11 = sext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %13 = add nsw i64 %12, -1
  %14 = zext i32 %1 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nsw i64 %15, -8
  %17 = zext i32 %1 to i64
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %13, 3
  %xtraiter119 = and i64 %12, 1
  %lcmp.mod120 = icmp eq i64 %xtraiter119, 0
  %19 = icmp eq i64 %13, 0
  %xtraiter124 = and i64 %12, 1
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  %20 = icmp eq i64 %13, 0
  %xtraiter128 = and i64 %12, 1
  %lcmp.mod129 = icmp eq i64 %xtraiter128, 0
  %21 = icmp eq i64 %13, 0
  br label %.preheader66

.preheader66:                                     ; preds = %._crit_edge78, %.preheader66.lr.ph
  %indvars.iv114 = phi i64 [ 0, %.preheader66.lr.ph ], [ %indvars.iv.next115, %._crit_edge78 ]
  %indvars.iv108 = phi i64 [ 1, %.preheader66.lr.ph ], [ %indvars.iv.next109, %._crit_edge78 ]
  %22 = mul i64 %indvars.iv114, 1201
  %23 = add i64 %22, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %23
  %scevgep121 = bitcast double* %scevgep to i8*
  %24 = mul i64 %indvars.iv114, -8
  %25 = add i64 %16, %24
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader66
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.068.prol = phi double [ %29, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv114
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %.068.prol, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.068.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  br i1 %18, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.068 = phi double [ %45, %.lr.ph.new ], [ %.068.unr, %.lr.ph.new.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv114
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %31
  %33 = fadd double %.068, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv114
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %35
  %37 = fadd double %33, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv114
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv114
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fadd double %41, %44
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond118.3 = icmp eq i64 %indvars.iv.next.3, %12
  br i1 %exitcond118.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader66
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader66 ], [ %.lcssa.unr, %.prol.loopexit ], [ %45, %._crit_edge.loopexit ]
  %46 = tail call double @sqrt(double %.0.lcssa) #4
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv114
  store double %46, double* %47, align 8
  br i1 %8, label %.lr.ph71.preheader, label %.preheader65

.lr.ph71.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod120, label %.lr.ph71.prol.loopexit, label %.lr.ph71.prol

.lr.ph71.prol:                                    ; preds = %.lr.ph71.preheader
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv114
  %49 = load double, double* %48, align 8
  %50 = load double, double* %47, align 8
  %51 = fdiv double %49, %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  store double %51, double* %52, align 8
  br label %.lr.ph71.prol.loopexit

.lr.ph71.prol.loopexit:                           ; preds = %.lr.ph71.prol, %.lr.ph71.preheader
  %indvars.iv90.unr.ph = phi i64 [ 1, %.lr.ph71.prol ], [ 0, %.lr.ph71.preheader ]
  br i1 %19, label %.preheader65, label %.lr.ph71.preheader142

.lr.ph71.preheader142:                            ; preds = %.lr.ph71.prol.loopexit
  br label %.lr.ph71

.preheader65.loopexit:                            ; preds = %.lr.ph71
  br label %.preheader65

.preheader65:                                     ; preds = %.preheader65.loopexit, %.lr.ph71.prol.loopexit, %._crit_edge
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %53 = icmp slt i64 %indvars.iv.next115, %11
  br i1 %53, label %.lr.ph77, label %._crit_edge78

.lr.ph77:                                         ; preds = %.preheader65
  br i1 %9, label %.lr.ph77.split.us.preheader, label %._crit_edge78.loopexit89

.lr.ph77.split.us.preheader:                      ; preds = %.lr.ph77
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  br label %.lr.ph77.split.us

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %.loopexit.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %.loopexit.us ], [ %indvars.iv108, %.lr.ph77.split.us.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %56, align 8
  br i1 %lcmp.mod125, label %.prol.loopexit123, label %.prol.preheader122

.prol.preheader122:                               ; preds = %.lr.ph77.split.us
  %57 = load double, double* %55, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %60, 0.000000e+00
  store double %61, double* %56, align 8
  br label %.prol.loopexit123

.prol.loopexit123:                                ; preds = %.prol.preheader122, %.lr.ph77.split.us
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader122 ], [ 0, %.lr.ph77.split.us ]
  %.unr.ph = phi double [ %61, %.prol.preheader122 ], [ 0.000000e+00, %.lr.ph77.split.us ]
  br i1 %20, label %.preheader.us, label %.lr.ph77.split.us.new.preheader

.lr.ph77.split.us.new.preheader:                  ; preds = %.prol.loopexit123
  br label %.lr.ph77.split.us.new

.lr.ph77.split.us.new:                            ; preds = %.lr.ph77.split.us.new.preheader, %.lr.ph77.split.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph77.split.us.new ], [ %indvars.iv100.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %62 = phi double [ %74, %.lr.ph77.split.us.new ], [ %.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv114
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv110
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %56, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101, i64 %indvars.iv114
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next101, i64 %indvars.iv110
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %68, %73
  store double %74, double* %56, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond.1127 = icmp eq i64 %indvars.iv.next101.1, %12
  br i1 %exitcond.1127, label %.preheader.us.loopexit, label %.lr.ph77.split.us.new

.preheader.us.loopexit:                           ; preds = %.lr.ph77.split.us.new
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.prol.loopexit123
  br i1 %10, label %.lr.ph76.us.preheader, label %.loopexit.us

.lr.ph76.us.preheader:                            ; preds = %.preheader.us
  br i1 %lcmp.mod129, label %.lr.ph76.us.prol.loopexit, label %.lr.ph76.us.prol

.lr.ph76.us.prol:                                 ; preds = %.lr.ph76.us.preheader
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %76 = load double, double* %75, align 8
  %77 = load double, double* %54, align 8
  %78 = load double, double* %56, align 8
  %79 = fmul double %77, %78
  %80 = fsub double %76, %79
  store double %80, double* %75, align 8
  br label %.lr.ph76.us.prol.loopexit

.lr.ph76.us.prol.loopexit:                        ; preds = %.lr.ph76.us.prol, %.lr.ph76.us.preheader
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph76.us.prol ], [ 0, %.lr.ph76.us.preheader ]
  br i1 %21, label %.loopexit.us, label %.lr.ph76.us.preheader141

.lr.ph76.us.preheader141:                         ; preds = %.lr.ph76.us.prol.loopexit
  br label %.lr.ph76.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader141, %.lr.ph76.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph76.us ], [ %indvars.iv104.unr.ph, %.lr.ph76.us.preheader141 ]
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv110
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv114
  %84 = load double, double* %83, align 8
  %85 = load double, double* %56, align 8
  %86 = fmul double %84, %85
  %87 = fsub double %82, %86
  store double %87, double* %81, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv110
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv114
  %91 = load double, double* %90, align 8
  %92 = load double, double* %56, align 8
  %93 = fmul double %91, %92
  %94 = fsub double %89, %93
  store double %94, double* %88, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond.1131 = icmp eq i64 %indvars.iv.next105.1, %12
  br i1 %exitcond.1131, label %.loopexit.us.loopexit, label %.lr.ph76.us

.loopexit.us.loopexit:                            ; preds = %.lr.ph76.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph76.us.prol.loopexit, %.preheader.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond = icmp eq i64 %indvars.iv.next111, %17
  br i1 %exitcond, label %._crit_edge78.loopexit, label %.lr.ph77.split.us

.lr.ph71:                                         ; preds = %.lr.ph71.preheader142, %.lr.ph71
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph71 ], [ %indvars.iv90.unr.ph, %.lr.ph71.preheader142 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv90, i64 %indvars.iv114
  %96 = load double, double* %95, align 8
  %97 = load double, double* %47, align 8
  %98 = fdiv double %96, %97
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv90, i64 %indvars.iv114
  store double %98, double* %99, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next91, i64 %indvars.iv114
  %101 = load double, double* %100, align 8
  %102 = load double, double* %47, align 8
  %103 = fdiv double %101, %102
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next91, i64 %indvars.iv114
  store double %103, double* %104, align 8
  %indvars.iv.next91.1 = add nuw nsw i64 %indvars.iv90, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next91.1, %12
  br i1 %exitcond.1, label %.preheader65.loopexit, label %.lr.ph71

._crit_edge78.loopexit89:                         ; preds = %.lr.ph77
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep121, i8 0, i64 %25, i32 8, i1 false)
  br label %._crit_edge78

._crit_edge78.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit, %._crit_edge78.loopexit89, %.preheader65
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next115, %14
  br i1 %exitcond134, label %._crit_edge80.loopexit, label %.preheader66

._crit_edge80.loopexit:                           ; preds = %._crit_edge78
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader28.us.preheader, label %._crit_edge38

.preheader28.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next50, %._crit_edge35.us ]
  %13 = mul nsw i64 %indvars.iv49, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader28.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %21 ], [ 0, %.preheader28.us ]
  %15 = add nsw i64 %indvars.iv45, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv45
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, %11
  br i1 %exitcond54, label %._crit_edge35.us, label %14

._crit_edge35.us:                                 ; preds = %21
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next50, %12
  br i1 %exitcond55, label %._crit_edge38.loopexit, label %.preheader28.us

._crit_edge38.loopexit:                           ; preds = %._crit_edge35.us
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge32

.preheader.us.preheader:                          ; preds = %._crit_edge38
  %32 = sext i32 %1 to i64
  %33 = zext i32 %1 to i64
  %34 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv40, %32
  br label %36

; <label>:36:                                     ; preds = %43, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %43 ], [ 0, %.preheader.us ]
  %37 = add nsw i64 %indvars.iv, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #6
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, %33
  br i1 %exitcond53, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %34
  br i1 %exitcond, label %._crit_edge32.loopexit, label %.preheader.us

._crit_edge32.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %._crit_edge38
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %50) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
