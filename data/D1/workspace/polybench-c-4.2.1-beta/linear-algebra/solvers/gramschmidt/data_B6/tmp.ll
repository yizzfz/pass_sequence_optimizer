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
  br i1 %6, label %.preheader26.lr.ph, label %.preheader25

.preheader26.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader26.us.preheader, label %._crit_edge29

.preheader26.us.preheader:                        ; preds = %.preheader26.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge32.us, %.preheader26.us.preheader
  %indvars.iv44 = phi i64 [ 0, %.preheader26.us.preheader ], [ %indvars.iv.next45, %._crit_edge32.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader26.us
  %indvars.iv40 = phi i64 [ 0, %.preheader26.us ], [ %indvars.iv.next41, %11 ]
  %12 = mul nuw nsw i64 %indvars.iv40, %indvars.iv44
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv40
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv40
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %9
  br i1 %exitcond, label %._crit_edge32.us, label %11

._crit_edge32.us:                                 ; preds = %11
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next45, %10
  br i1 %exitcond53, label %.preheader25.loopexit, label %.preheader26.us

.preheader25.loopexit:                            ; preds = %._crit_edge32.us
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader25
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
  %indvars.iv36.prol = phi i64 [ %indvars.iv.next37.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv36.prol, i64 0
  %scevgep50.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.prol = add nuw nsw i64 %indvars.iv36.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv36.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next37.prol, %.preheader.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %25, 3
  br i1 %26, label %._crit_edge29, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %27 = add nsw i64 %24, -4
  %28 = sub i64 %27, %indvars.iv36.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod55 = icmp eq i64 %30, 0
  br i1 %lcmp.mod55, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol57 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv36.unr, i64 0
  %scevgep50.prol58 = bitcast double* %scevgep.prol57 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.prol58, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.prol59 = add nuw nsw i64 %indvars.iv36.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.prol59, i64 0
  %scevgep50.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.1.prol = add nsw i64 %indvars.iv36.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.1.prol, i64 0
  %scevgep50.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.2.prol = add nsw i64 %indvars.iv36.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.2.prol, i64 0
  %scevgep50.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.3.prol = add nsw i64 %indvars.iv36.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv36.unr60 = phi i64 [ %indvars.iv36.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next37.3.prol, %._crit_edge.us.3.prol ]
  %31 = icmp eq i64 %29, 0
  br i1 %31, label %._crit_edge29.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge29.loopexit.unr-lcssa:                 ; preds = %._crit_edge.us.3
  br label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge29.loopexit.unr-lcssa
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.preheader26.lr.ph, %.preheader.us.prol.loopexit, %.preheader25
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv36 = phi i64 [ %indvars.iv36.unr60, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next37.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv36, i64 0
  %scevgep50 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37, i64 0
  %scevgep50.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.1, i64 0
  %scevgep50.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.2 = add nsw i64 %indvars.iv36, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.2, i64 0
  %scevgep50.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.3 = add nsw i64 %indvars.iv36, 4
  %scevgep.161 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.3, i64 0
  %scevgep50.162 = bitcast double* %scevgep.161 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.162, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.163 = add nsw i64 %indvars.iv36, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.163, i64 0
  %scevgep50.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.1.1 = add nsw i64 %indvars.iv36, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.1.1, i64 0
  %scevgep50.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.2.1 = add nsw i64 %indvars.iv36, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.2.1, i64 0
  %scevgep50.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep50.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next37.3.1 = add nsw i64 %indvars.iv36, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next37.3.1, %24
  br i1 %exitcond.3.1, label %._crit_edge29.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader65.lr.ph, label %._crit_edge82

.preheader65.lr.ph:                               ; preds = %5
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
  %xtraiter121 = and i64 %12, 1
  %lcmp.mod122 = icmp eq i64 %xtraiter121, 0
  %19 = icmp eq i64 %13, 0
  %xtraiter126 = and i64 %12, 1
  %lcmp.mod127 = icmp eq i64 %xtraiter126, 0
  %20 = icmp eq i64 %13, 0
  %xtraiter130 = and i64 %12, 1
  %lcmp.mod131 = icmp eq i64 %xtraiter130, 0
  %21 = icmp eq i64 %13, 0
  br label %.preheader65

.loopexit.loopexit91:                             ; preds = %.lr.ph80
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep123, i8 0, i64 %25, i32 8, i1 false)
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge77.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit.loopexit91, %._crit_edge71
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next117, %14
  br i1 %exitcond136, label %._crit_edge82.loopexit, label %.preheader65

.preheader65:                                     ; preds = %.loopexit, %.preheader65.lr.ph
  %indvars.iv116 = phi i64 [ 0, %.preheader65.lr.ph ], [ %indvars.iv.next117, %.loopexit ]
  %indvars.iv110 = phi i64 [ 1, %.preheader65.lr.ph ], [ %indvars.iv.next111, %.loopexit ]
  %22 = mul i64 %indvars.iv116, 1201
  %23 = add i64 %22, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %23
  %scevgep123 = bitcast double* %scevgep to i8*
  %24 = mul i64 %indvars.iv116, -8
  %25 = add i64 %16, %24
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader65
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.067.prol = phi double [ %29, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv116
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %.067.prol, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.067.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  br i1 %18, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.067 = phi double [ %45, %.lr.ph.new ], [ %.067.unr, %.lr.ph.new.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv116
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %31
  %33 = fadd double %.067, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv116
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %35
  %37 = fadd double %33, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv116
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv116
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fadd double %41, %44
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond120.3 = icmp eq i64 %indvars.iv.next.3, %12
  br i1 %exitcond120.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader65
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader65 ], [ %.lcssa.unr, %.prol.loopexit ], [ %45, %._crit_edge.loopexit ]
  %46 = tail call double @sqrt(double %.0.lcssa) #4
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv116
  store double %46, double* %47, align 8
  br i1 %8, label %.lr.ph70.preheader, label %._crit_edge71

.lr.ph70.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod122, label %.lr.ph70.prol.loopexit, label %.lr.ph70.prol

.lr.ph70.prol:                                    ; preds = %.lr.ph70.preheader
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv116
  %49 = load double, double* %48, align 8
  %50 = load double, double* %47, align 8
  %51 = fdiv double %49, %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv116
  store double %51, double* %52, align 8
  br label %.lr.ph70.prol.loopexit

.lr.ph70.prol.loopexit:                           ; preds = %.lr.ph70.prol, %.lr.ph70.preheader
  %indvars.iv92.unr.ph = phi i64 [ 1, %.lr.ph70.prol ], [ 0, %.lr.ph70.preheader ]
  br i1 %19, label %._crit_edge71, label %.lr.ph70.preheader144

.lr.ph70.preheader144:                            ; preds = %.lr.ph70.prol.loopexit
  br label %.lr.ph70

.lr.ph70:                                         ; preds = %.lr.ph70.preheader144, %.lr.ph70
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.lr.ph70 ], [ %indvars.iv92.unr.ph, %.lr.ph70.preheader144 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv116
  %54 = load double, double* %53, align 8
  %55 = load double, double* %47, align 8
  %56 = fdiv double %54, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv92, i64 %indvars.iv116
  store double %56, double* %57, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next93, i64 %indvars.iv116
  %59 = load double, double* %58, align 8
  %60 = load double, double* %47, align 8
  %61 = fdiv double %59, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next93, i64 %indvars.iv116
  store double %61, double* %62, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, %12
  br i1 %exitcond.1, label %._crit_edge71.loopexit, label %.lr.ph70

._crit_edge71.loopexit:                           ; preds = %.lr.ph70
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %.lr.ph70.prol.loopexit, %._crit_edge
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %63 = icmp slt i64 %indvars.iv.next117, %11
  br i1 %63, label %.lr.ph80, label %.loopexit

.lr.ph80:                                         ; preds = %._crit_edge71
  br i1 %9, label %.lr.ph80.split.us.preheader, label %.loopexit.loopexit91

.lr.ph80.split.us.preheader:                      ; preds = %.lr.ph80
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv116
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv116
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %.lr.ph80.split.us.preheader, %._crit_edge77.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge77.us ], [ %indvars.iv110, %.lr.ph80.split.us.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv116, i64 %indvars.iv112
  store double 0.000000e+00, double* %66, align 8
  br i1 %lcmp.mod127, label %.prol.loopexit125, label %.prol.preheader124

.prol.preheader124:                               ; preds = %.lr.ph80.split.us
  %67 = load double, double* %65, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv112
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %70, 0.000000e+00
  store double %71, double* %66, align 8
  br label %.prol.loopexit125

.prol.loopexit125:                                ; preds = %.prol.preheader124, %.lr.ph80.split.us
  %indvars.iv102.unr.ph = phi i64 [ 1, %.prol.preheader124 ], [ 0, %.lr.ph80.split.us ]
  %.unr.ph = phi double [ %71, %.prol.preheader124 ], [ 0.000000e+00, %.lr.ph80.split.us ]
  br i1 %20, label %..preheader_crit_edge.us, label %.lr.ph80.split.us.new.preheader

.lr.ph80.split.us.new.preheader:                  ; preds = %.prol.loopexit125
  br label %.lr.ph80.split.us.new

._crit_edge77.us.loopexit:                        ; preds = %.lr.ph76.us
  br label %._crit_edge77.us

._crit_edge77.us:                                 ; preds = %._crit_edge77.us.loopexit, %.lr.ph76.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond = icmp eq i64 %indvars.iv.next113, %17
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph80.split.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader143, %.lr.ph76.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.lr.ph76.us ], [ %indvars.iv106.unr.ph, %.lr.ph76.us.preheader143 ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv106, i64 %indvars.iv112
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv106, i64 %indvars.iv116
  %75 = load double, double* %74, align 8
  %76 = load double, double* %66, align 8
  %77 = fmul double %75, %76
  %78 = fsub double %73, %77
  store double %78, double* %72, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next107, i64 %indvars.iv112
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next107, i64 %indvars.iv116
  %82 = load double, double* %81, align 8
  %83 = load double, double* %66, align 8
  %84 = fmul double %82, %83
  %85 = fsub double %80, %84
  store double %85, double* %79, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond.1133 = icmp eq i64 %indvars.iv.next107.1, %12
  br i1 %exitcond.1133, label %._crit_edge77.us.loopexit, label %.lr.ph76.us

.lr.ph80.split.us.new:                            ; preds = %.lr.ph80.split.us.new.preheader, %.lr.ph80.split.us.new
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.lr.ph80.split.us.new ], [ %indvars.iv102.unr.ph, %.lr.ph80.split.us.new.preheader ]
  %86 = phi double [ %98, %.lr.ph80.split.us.new ], [ %.unr.ph, %.lr.ph80.split.us.new.preheader ]
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv102, i64 %indvars.iv116
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv102, i64 %indvars.iv112
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fadd double %86, %91
  store double %92, double* %66, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next103, i64 %indvars.iv116
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next103, i64 %indvars.iv112
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fadd double %92, %97
  store double %98, double* %66, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %exitcond.1129 = icmp eq i64 %indvars.iv.next103.1, %12
  br i1 %exitcond.1129, label %..preheader_crit_edge.us.loopexit, label %.lr.ph80.split.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph80.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit125
  br i1 %10, label %.lr.ph76.us.preheader, label %._crit_edge77.us

.lr.ph76.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod131, label %.lr.ph76.us.prol.loopexit, label %.lr.ph76.us.prol

.lr.ph76.us.prol:                                 ; preds = %.lr.ph76.us.preheader
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv112
  %100 = load double, double* %99, align 8
  %101 = load double, double* %64, align 8
  %102 = load double, double* %66, align 8
  %103 = fmul double %101, %102
  %104 = fsub double %100, %103
  store double %104, double* %99, align 8
  br label %.lr.ph76.us.prol.loopexit

.lr.ph76.us.prol.loopexit:                        ; preds = %.lr.ph76.us.prol, %.lr.ph76.us.preheader
  %indvars.iv106.unr.ph = phi i64 [ 1, %.lr.ph76.us.prol ], [ 0, %.lr.ph76.us.preheader ]
  br i1 %21, label %._crit_edge77.us, label %.lr.ph76.us.preheader143

.lr.ph76.us.preheader143:                         ; preds = %.lr.ph76.us.prol.loopexit
  br label %.lr.ph76.us

._crit_edge82.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader4.us.preheader, label %._crit_edge14

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next26, %._crit_edge11.us ]
  %13 = mul nsw i64 %indvars.iv25, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader4.us
  %indvars.iv21 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next22, %21 ]
  %15 = add nsw i64 %indvars.iv21, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #7
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next22, %11
  br i1 %exitcond30, label %._crit_edge11.us, label %14

._crit_edge11.us:                                 ; preds = %21
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next26, %12
  br i1 %exitcond31, label %._crit_edge14.loopexit, label %.preheader4.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge8

.preheader.us.preheader:                          ; preds = %._crit_edge14
  %32 = sext i32 %1 to i64
  %33 = zext i32 %1 to i64
  %34 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv16, %32
  br label %36

; <label>:36:                                     ; preds = %43, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %43 ]
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
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %33
  br i1 %exitcond29, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %34
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge14
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %50) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
