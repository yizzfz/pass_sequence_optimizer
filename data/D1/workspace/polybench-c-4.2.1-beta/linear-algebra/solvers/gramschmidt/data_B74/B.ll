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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.lr.ph8.split.us.preheader, label %._crit_edge3

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next20, %._crit_edge6.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.lr.ph8.split.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %11 ], [ 0, %.lr.ph8.split.us ]
  %12 = mul nuw nsw i64 %indvars.iv15, %indvars.iv19
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv15
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv15
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %9
  br i1 %exitcond, label %._crit_edge6.us, label %11

._crit_edge6.us:                                  ; preds = %11
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next20, %10
  br i1 %exitcond28, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge9
  %22 = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = add nsw i64 %22, -1
  %xtraiter = and i64 %22, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph2.split.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph2.split.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv11.prol, i64 0
  %scevgep25.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph2.split.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.lr.ph2.split.us.prol.loopexit.loopexit:          ; preds = %._crit_edge.us.prol
  br label %.lr.ph2.split.us.prol.loopexit

.lr.ph2.split.us.prol.loopexit:                   ; preds = %.lr.ph2.split.us.prol.loopexit.loopexit, %.lr.ph2.split.us.preheader
  %indvars.iv11.unr = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %xtraiter, %.lr.ph2.split.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %24, 3
  br i1 %25, label %._crit_edge3, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.lr.ph2.split.us.prol.loopexit
  %26 = add nsw i64 %22, -4
  %27 = sub nsw i64 %26, %indvars.iv11.unr
  %28 = lshr i64 %27, 2
  %29 = and i64 %28, 1
  %lcmp.mod30 = icmp eq i64 %29, 0
  br i1 %lcmp.mod30, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol32 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv11.unr, i64 0
  %scevgep25.prol33 = bitcast double* %scevgep.prol32 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol33, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.prol34 = add nuw nsw i64 %indvars.iv11.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.prol34, i64 0
  %scevgep25.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.1.prol = add nuw nsw i64 %indvars.iv11.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1.prol, i64 0
  %scevgep25.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.2.prol = add nuw nsw i64 %indvars.iv11.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2.prol, i64 0
  %scevgep25.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.3.prol = or i64 %indvars.iv11.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv11.unr35 = phi i64 [ %indvars.iv11.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next12.3.prol, %._crit_edge.us.3.prol ]
  %30 = icmp eq i64 %28, 0
  br i1 %30, label %._crit_edge3.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge3.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us.3
  br label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge3.loopexit.unr-lcssa
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.lr.ph8, %.lr.ph2.split.us.prol.loopexit, %._crit_edge9
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv11 = phi i64 [ %indvars.iv11.unr35, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next12.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv11, i64 0
  %scevgep25 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12, i64 0
  %scevgep25.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1, i64 0
  %scevgep25.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2, i64 0
  %scevgep25.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %scevgep.136 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.3, i64 0
  %scevgep25.137 = bitcast double* %scevgep.136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.137, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.138 = add nsw i64 %indvars.iv11, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.138, i64 0
  %scevgep25.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.1.1 = add nsw i64 %indvars.iv11, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1.1, i64 0
  %scevgep25.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.2.1 = add nsw i64 %indvars.iv11, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2.1, i64 0
  %scevgep25.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next12.3.1 = add nsw i64 %indvars.iv11, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next12.3.1, %22
  br i1 %exitcond.3.1, label %._crit_edge3.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = sext i32 %1 to i64
  %9 = zext i32 %0 to i64
  %10 = add nsw i64 %9, -1
  %11 = zext i32 %1 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nsw i64 %12, -8
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %10, 3
  %xtraiter70 = and i64 %9, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  %15 = icmp eq i64 %10, 0
  br label %16

; <label>:16:                                     ; preds = %._crit_edge23, %.lr.ph28
  %indvars.iv62 = phi i64 [ 0, %.lr.ph28 ], [ %indvars.iv.next63, %._crit_edge23 ]
  %indvars.iv56 = phi i64 [ 1, %.lr.ph28 ], [ %indvars.iv.next57, %._crit_edge23 ]
  %17 = mul i64 %indvars.iv62, 1201
  %18 = add i64 %17, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %18
  %scevgep72 = bitcast double* %scevgep to i8*
  %19 = mul i64 %indvars.iv62, -8
  %20 = add i64 %13, %19
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %16
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %21 = phi double [ %25, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv62
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fadd double %21, %24
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa66.unr = phi double [ undef, %.lr.ph ], [ %25, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %25, %.prol.loopexit.loopexit ]
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %26 = phi double [ %42, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv62
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %28
  %30 = fadd double %26, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv62
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %32
  %34 = fadd double %30, %33
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv62
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %36
  %38 = fadd double %34, %37
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv62
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fadd double %38, %41
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next.3, %9
  br i1 %exitcond67.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %16
  %.lcssa = phi double [ 0.000000e+00, %16 ], [ %.lcssa66.unr, %.prol.loopexit ], [ %42, %._crit_edge.loopexit ]
  %43 = tail call double @sqrt(double %.lcssa) #4
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv62
  store double %43, double* %44, align 8
  br i1 %7, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %._crit_edge
  br i1 %lcmp.mod71, label %.prol.loopexit69, label %.prol.preheader68

.prol.preheader68:                                ; preds = %.lr.ph9
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv62
  %46 = load double, double* %45, align 8
  %47 = fdiv double %46, %43
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv62
  store double %47, double* %48, align 8
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.prol.preheader68, %.lr.ph9
  %indvars.iv38.unr.ph = phi i64 [ 1, %.prol.preheader68 ], [ 0, %.lr.ph9 ]
  br i1 %15, label %._crit_edge10, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit69
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader, %.lr.ph9.new
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.lr.ph9.new ], [ %indvars.iv38.unr.ph, %.lr.ph9.new.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv62
  %50 = load double, double* %49, align 8
  %51 = load double, double* %44, align 8
  %52 = fdiv double %50, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv62
  store double %52, double* %53, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next39, i64 %indvars.iv62
  %55 = load double, double* %54, align 8
  %56 = load double, double* %44, align 8
  %57 = fdiv double %55, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next39, i64 %indvars.iv62
  store double %57, double* %58, align 8
  %indvars.iv.next39.1 = add nuw nsw i64 %indvars.iv38, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next39.1, %9
  br i1 %exitcond.1, label %._crit_edge10.loopexit, label %.lr.ph9.new

._crit_edge10.loopexit:                           ; preds = %.lr.ph9.new
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.prol.loopexit69, %._crit_edge
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %59 = icmp slt i64 %indvars.iv.next63, %8
  br i1 %59, label %.lr.ph22, label %._crit_edge23

.lr.ph22:                                         ; preds = %._crit_edge10
  br i1 %7, label %.lr.ph22.split.us.preheader, label %._crit_edge23.loopexit36

.lr.ph22.split.us.preheader:                      ; preds = %.lr.ph22
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv62
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %.lr.ph22.split.us.preheader, %._crit_edge20.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge20.us ], [ %indvars.iv56, %.lr.ph22.split.us.preheader ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv58
  store double 0.000000e+00, double* %61, align 8
  br i1 %lcmp.mod71, label %.prol.loopexit74, label %.prol.preheader73

.prol.preheader73:                                ; preds = %.lr.ph22.split.us
  %62 = load double, double* %60, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv58
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %65, 0.000000e+00
  store double %66, double* %61, align 8
  br label %.prol.loopexit74

.prol.loopexit74:                                 ; preds = %.prol.preheader73, %.lr.ph22.split.us
  %67 = phi double [ %66, %.prol.preheader73 ], [ 0.000000e+00, %.lr.ph22.split.us ]
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader73 ], [ 0, %.lr.ph22.split.us ]
  br i1 %15, label %.lr.ph19.us, label %.lr.ph22.split.us.new.preheader

.lr.ph22.split.us.new.preheader:                  ; preds = %.prol.loopexit74
  br label %.lr.ph22.split.us.new

.lr.ph22.split.us.new:                            ; preds = %.lr.ph22.split.us.new.preheader, %.lr.ph22.split.us.new
  %68 = phi double [ %80, %.lr.ph22.split.us.new ], [ %67, %.lr.ph22.split.us.new.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.lr.ph22.split.us.new ], [ %indvars.iv48.unr.ph, %.lr.ph22.split.us.new.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv62
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv58
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %68, %73
  store double %74, double* %61, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next49, i64 %indvars.iv62
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next49, i64 %indvars.iv58
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %74, %79
  store double %80, double* %61, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond.178 = icmp eq i64 %indvars.iv.next49.1, %9
  br i1 %exitcond.178, label %.lr.ph19.us.loopexit, label %.lr.ph22.split.us.new

.lr.ph19.us.loopexit:                             ; preds = %.lr.ph22.split.us.new
  br label %.lr.ph19.us

.lr.ph19.us:                                      ; preds = %.lr.ph19.us.loopexit, %.prol.loopexit74
  %81 = phi double [ %67, %.prol.loopexit74 ], [ %80, %.lr.ph19.us.loopexit ]
  br i1 %lcmp.mod71, label %.prol.loopexit80, label %.prol.preheader79

.prol.preheader79:                                ; preds = %.lr.ph19.us
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv58
  %83 = load double, double* %82, align 8
  %84 = load double, double* %60, align 8
  %85 = fmul double %84, %81
  %86 = fsub double %83, %85
  store double %86, double* %82, align 8
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.prol.preheader79, %.lr.ph19.us
  %indvars.iv52.unr.ph = phi i64 [ 1, %.prol.preheader79 ], [ 0, %.lr.ph19.us ]
  br i1 %15, label %._crit_edge20.us, label %.lr.ph19.us.new.preheader

.lr.ph19.us.new.preheader:                        ; preds = %.prol.loopexit80
  br label %.lr.ph19.us.new

.lr.ph19.us.new:                                  ; preds = %.lr.ph19.us.new.preheader, %.lr.ph19.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.lr.ph19.us.new ], [ %indvars.iv52.unr.ph, %.lr.ph19.us.new.preheader ]
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv52, i64 %indvars.iv58
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv62
  %90 = load double, double* %89, align 8
  %91 = load double, double* %61, align 8
  %92 = fmul double %90, %91
  %93 = fsub double %88, %92
  store double %93, double* %87, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next53, i64 %indvars.iv58
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next53, i64 %indvars.iv62
  %97 = load double, double* %96, align 8
  %98 = load double, double* %61, align 8
  %99 = fmul double %97, %98
  %100 = fsub double %95, %99
  store double %100, double* %94, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond.184 = icmp eq i64 %indvars.iv.next53.1, %9
  br i1 %exitcond.184, label %._crit_edge20.us.loopexit, label %.lr.ph19.us.new

._crit_edge20.us.loopexit:                        ; preds = %.lr.ph19.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %.prol.loopexit80
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, %11
  br i1 %exitcond, label %._crit_edge23.loopexit, label %.lr.ph22.split.us

._crit_edge23.loopexit36:                         ; preds = %.lr.ph22
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep72, i8 0, i64 %20, i32 8, i1 false)
  br label %._crit_edge23

._crit_edge23.loopexit:                           ; preds = %._crit_edge20.us
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %._crit_edge23.loopexit36, %._crit_edge10
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next63, %11
  br i1 %exitcond87, label %._crit_edge29.loopexit, label %16

._crit_edge29.loopexit:                           ; preds = %._crit_edge23
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph8.split.us.preheader, label %._crit_edge9

.lr.ph8.split.us.preheader:                       ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next24, %._crit_edge6.us ]
  %12 = mul nsw i64 %indvars.iv23, %10
  br label %13

; <label>:13:                                     ; preds = %20, %.lr.ph8.split.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %20 ], [ 0, %.lr.ph8.split.us ]
  %14 = add nsw i64 %indvars.iv19, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc12.us = call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next20, %11
  br i1 %exitcond28, label %._crit_edge6.us, label %13

._crit_edge6.us:                                  ; preds = %20
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next24, %11
  br i1 %exitcond29, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %4
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %29 = icmp sgt i32 %0, 0
  %or.cond = and i1 %29, %9
  br i1 %or.cond, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge9
  %30 = sext i32 %1 to i64
  %31 = zext i32 %1 to i64
  %32 = zext i32 %0 to i64
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %33 = mul nsw i64 %indvars.iv14, %30
  br label %34

; <label>:34:                                     ; preds = %41, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %41 ], [ 0, %.lr.ph2.split.us ]
  %35 = add nsw i64 %indvars.iv, %33
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 20
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %34
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %40) #6
  br label %41

; <label>:41:                                     ; preds = %39, %34
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %44) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next, %31
  br i1 %exitcond27, label %._crit_edge.us, label %34

._crit_edge.us:                                   ; preds = %41
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %32
  br i1 %exitcond, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %._crit_edge9
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %48) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
