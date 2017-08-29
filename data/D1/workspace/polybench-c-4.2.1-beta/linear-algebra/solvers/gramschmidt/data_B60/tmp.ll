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
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]*) unnamed_addr #2 {
  %6 = alloca [1200 x double]*, align 8
  store [1200 x double]* %4, [1200 x double]** %6, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %5
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  %10 = load [1200 x double]*, [1200 x double]** %6, align 8
  br i1 %8, label %.lr.ph8.split.us.preheader, label %._crit_edge3

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next20, %._crit_edge6.us ]
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph8.split.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %13 ], [ 0, %.lr.ph8.split.us ]
  %14 = mul nuw nsw i64 %indvars.iv15, %indvars.iv19
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %9
  %19 = fmul double %18, 1.000000e+02
  %20 = fadd double %19, 1.000000e+01
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv15
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv19, i64 %indvars.iv15
  store double 0.000000e+00, double* %22, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %11
  br i1 %exitcond, label %._crit_edge6.us, label %13

._crit_edge6.us:                                  ; preds = %13
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next20, %12
  br i1 %exitcond28, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %5
  %23 = icmp sgt i32 %1, 0
  br i1 %23, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge9
  %24 = zext i32 %1 to i64
  %25 = shl nuw nsw i64 %24, 3
  %26 = zext i32 %1 to i64
  %27 = add nsw i64 %26, -1
  %xtraiter = and i64 %26, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph2.split.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph2.split.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv11.prol, i64 0
  %scevgep25.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph2.split.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.lr.ph2.split.us.prol.loopexit.loopexit:          ; preds = %._crit_edge.us.prol
  br label %.lr.ph2.split.us.prol.loopexit

.lr.ph2.split.us.prol.loopexit:                   ; preds = %.lr.ph2.split.us.prol.loopexit.loopexit, %.lr.ph2.split.us.preheader
  %indvars.iv11.unr = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %xtraiter, %.lr.ph2.split.us.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %27, 3
  br i1 %28, label %._crit_edge3, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.lr.ph2.split.us.prol.loopexit
  %29 = add nsw i64 %26, -4
  %30 = sub nsw i64 %29, %indvars.iv11.unr
  %31 = lshr i64 %30, 2
  %32 = and i64 %31, 1
  %lcmp.mod30 = icmp eq i64 %32, 0
  br i1 %lcmp.mod30, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol32 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv11.unr, i64 0
  %scevgep25.prol33 = bitcast double* %scevgep.prol32 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol33, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.prol34 = add nuw nsw i64 %indvars.iv11.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.prol34, i64 0
  %scevgep25.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.1.prol = add nuw nsw i64 %indvars.iv11.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1.prol, i64 0
  %scevgep25.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.2.prol = add nuw nsw i64 %indvars.iv11.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2.prol, i64 0
  %scevgep25.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.3.prol = or i64 %indvars.iv11.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv11.unr35 = phi i64 [ %indvars.iv11.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next12.3.prol, %._crit_edge.us.3.prol ]
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %._crit_edge3.loopexit, label %._crit_edge.us.3.preheader.new

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
  call void @llvm.memset.p0i8.i64(i8* %scevgep25, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12, i64 0
  %scevgep25.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1, i64 0
  %scevgep25.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2, i64 0
  %scevgep25.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %scevgep.136 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.3, i64 0
  %scevgep25.137 = bitcast double* %scevgep.136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.137, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.138 = add nsw i64 %indvars.iv11, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.138, i64 0
  %scevgep25.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.1.1 = add nsw i64 %indvars.iv11, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.1.1, i64 0
  %scevgep25.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.2.1 = add nsw i64 %indvars.iv11, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next12.2.1, i64 0
  %scevgep25.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next12.3.1 = add nsw i64 %indvars.iv11, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next12.3.1, %26
  br i1 %exitcond.3.1, label %._crit_edge3.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]* nocapture, [1200 x double]*) unnamed_addr #0 {
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  store [1200 x double]* %4, [1200 x double]** %7, align 8
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %5
  %9 = icmp sgt i32 %0, 0
  %10 = load [1200 x double]*, [1200 x double]** %6, align 8
  %11 = icmp sgt i32 %0, 0
  %12 = load [1200 x double]*, [1200 x double]** %7, align 8
  %13 = icmp sgt i32 %0, 0
  %14 = icmp sgt i32 %0, 0
  %15 = sext i32 %1 to i64
  %16 = zext i32 %0 to i64
  %17 = add nsw i64 %16, -1
  %18 = zext i32 %1 to i64
  %19 = shl nuw nsw i64 %18, 3
  %20 = add nsw i64 %19, -8
  %21 = zext i32 %1 to i64
  %xtraiter = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %22 = icmp ult i64 %17, 3
  %xtraiter70 = and i64 %16, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  %23 = icmp eq i64 %17, 0
  %xtraiter75 = and i64 %16, 1
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  %24 = icmp eq i64 %17, 0
  %xtraiter81 = and i64 %16, 1
  %lcmp.mod82 = icmp eq i64 %xtraiter81, 0
  %25 = icmp eq i64 %17, 0
  br label %26

; <label>:26:                                     ; preds = %._crit_edge23, %.lr.ph28
  %indvars.iv62 = phi i64 [ 0, %.lr.ph28 ], [ %indvars.iv.next63, %._crit_edge23 ]
  %indvars.iv56 = phi i64 [ 1, %.lr.ph28 ], [ %indvars.iv.next57, %._crit_edge23 ]
  %27 = mul i64 %indvars.iv62, 1201
  %28 = add i64 %27, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %28
  %scevgep72 = bitcast double* %scevgep to i8*
  %29 = mul i64 %indvars.iv62, -8
  %30 = add i64 %20, %29
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %26
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %31 = phi double [ %35, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.prol, i64 %indvars.iv62
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %31, %34
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa66.unr = phi double [ undef, %.lr.ph ], [ %35, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %35, %.prol.loopexit.loopexit ]
  br i1 %22, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %36 = phi double [ %52, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv, i64 %indvars.iv62
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fadd double %36, %39
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next, i64 %indvars.iv62
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %42
  %44 = fadd double %40, %43
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next.1, i64 %indvars.iv62
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fadd double %44, %47
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next.2, i64 %indvars.iv62
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %50
  %52 = fadd double %48, %51
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next.3, %16
  br i1 %exitcond67.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %26
  %.lcssa = phi double [ 0.000000e+00, %26 ], [ %.lcssa66.unr, %.prol.loopexit ], [ %52, %._crit_edge.loopexit ]
  %53 = tail call double @sqrt(double %.lcssa) #4
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv62
  store double %53, double* %54, align 8
  br i1 %11, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %._crit_edge
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv62
  br i1 %lcmp.mod71, label %.prol.loopexit69, label %.prol.preheader68

.prol.preheader68:                                ; preds = %.lr.ph9
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv62
  %57 = load double, double* %56, align 8
  %58 = load double, double* %55, align 8
  %59 = fdiv double %57, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv62
  store double %59, double* %60, align 8
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.prol.preheader68, %.lr.ph9
  %indvars.iv38.unr.ph = phi i64 [ 1, %.prol.preheader68 ], [ 0, %.lr.ph9 ]
  br i1 %23, label %._crit_edge10, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit69
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader, %.lr.ph9.new
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.lr.ph9.new ], [ %indvars.iv38.unr.ph, %.lr.ph9.new.preheader ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv38, i64 %indvars.iv62
  %62 = load double, double* %61, align 8
  %63 = load double, double* %55, align 8
  %64 = fdiv double %62, %63
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv38, i64 %indvars.iv62
  store double %64, double* %65, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next39, i64 %indvars.iv62
  %67 = load double, double* %66, align 8
  %68 = load double, double* %55, align 8
  %69 = fdiv double %67, %68
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next39, i64 %indvars.iv62
  store double %69, double* %70, align 8
  %indvars.iv.next39.1 = add nuw nsw i64 %indvars.iv38, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next39.1, %16
  br i1 %exitcond.1, label %._crit_edge10.loopexit, label %.lr.ph9.new

._crit_edge10.loopexit:                           ; preds = %.lr.ph9.new
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.prol.loopexit69, %._crit_edge
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %71 = icmp slt i64 %indvars.iv.next63, %15
  br i1 %71, label %.lr.ph22, label %._crit_edge23

.lr.ph22:                                         ; preds = %._crit_edge10
  br i1 %13, label %.lr.ph22.split.us.preheader, label %._crit_edge23.loopexit36

.lr.ph22.split.us.preheader:                      ; preds = %.lr.ph22
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv62
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv62
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %.lr.ph22.split.us.preheader, %._crit_edge20.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge20.us ], [ %indvars.iv56, %.lr.ph22.split.us.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv58
  store double 0.000000e+00, double* %74, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv58
  br i1 %lcmp.mod76, label %.prol.loopexit74, label %.prol.preheader73

.prol.preheader73:                                ; preds = %.lr.ph22.split.us
  %76 = load double, double* %73, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv58
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = load double, double* %75, align 8
  %81 = fadd double %80, %79
  store double %81, double* %75, align 8
  br label %.prol.loopexit74

.prol.loopexit74:                                 ; preds = %.prol.preheader73, %.lr.ph22.split.us
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader73 ], [ 0, %.lr.ph22.split.us ]
  br i1 %24, label %._crit_edge15.us, label %.lr.ph22.split.us.new.preheader

.lr.ph22.split.us.new.preheader:                  ; preds = %.prol.loopexit74
  br label %.lr.ph22.split.us.new

.lr.ph22.split.us.new:                            ; preds = %.lr.ph22.split.us.new.preheader, %.lr.ph22.split.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.lr.ph22.split.us.new ], [ %indvars.iv48.unr.ph, %.lr.ph22.split.us.new.preheader ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv48, i64 %indvars.iv62
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv48, i64 %indvars.iv58
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = load double, double* %75, align 8
  %88 = fadd double %87, %86
  store double %88, double* %75, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next49, i64 %indvars.iv62
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next49, i64 %indvars.iv58
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = load double, double* %75, align 8
  %95 = fadd double %94, %93
  store double %95, double* %75, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond.178 = icmp eq i64 %indvars.iv.next49.1, %16
  br i1 %exitcond.178, label %._crit_edge15.us.loopexit, label %.lr.ph22.split.us.new

._crit_edge15.us.loopexit:                        ; preds = %.lr.ph22.split.us.new
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %.prol.loopexit74
  br i1 %14, label %.lr.ph19.us, label %._crit_edge20.us

.lr.ph19.us:                                      ; preds = %._crit_edge15.us
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv58
  br i1 %lcmp.mod82, label %.prol.loopexit80, label %.prol.preheader79

.prol.preheader79:                                ; preds = %.lr.ph19.us
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv58
  %98 = load double, double* %97, align 8
  %99 = load double, double* %72, align 8
  %100 = load double, double* %96, align 8
  %101 = fmul double %99, %100
  %102 = fsub double %98, %101
  store double %102, double* %97, align 8
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.prol.preheader79, %.lr.ph19.us
  %indvars.iv52.unr.ph = phi i64 [ 1, %.prol.preheader79 ], [ 0, %.lr.ph19.us ]
  br i1 %25, label %._crit_edge20.us, label %.lr.ph19.us.new.preheader

.lr.ph19.us.new.preheader:                        ; preds = %.prol.loopexit80
  br label %.lr.ph19.us.new

.lr.ph19.us.new:                                  ; preds = %.lr.ph19.us.new.preheader, %.lr.ph19.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.lr.ph19.us.new ], [ %indvars.iv52.unr.ph, %.lr.ph19.us.new.preheader ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv52, i64 %indvars.iv58
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv52, i64 %indvars.iv62
  %106 = load double, double* %105, align 8
  %107 = load double, double* %96, align 8
  %108 = fmul double %106, %107
  %109 = fsub double %104, %108
  store double %109, double* %103, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next53, i64 %indvars.iv58
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next53, i64 %indvars.iv62
  %113 = load double, double* %112, align 8
  %114 = load double, double* %96, align 8
  %115 = fmul double %113, %114
  %116 = fsub double %111, %115
  store double %116, double* %110, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond.184 = icmp eq i64 %indvars.iv.next53.1, %16
  br i1 %exitcond.184, label %._crit_edge20.us.loopexit, label %.lr.ph19.us.new

._crit_edge20.us.loopexit:                        ; preds = %.lr.ph19.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %.prol.loopexit80, %._crit_edge15.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, %21
  br i1 %exitcond, label %._crit_edge23.loopexit, label %.lr.ph22.split.us

._crit_edge23.loopexit36:                         ; preds = %.lr.ph22
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep72, i8 0, i64 %30, i32 8, i1 false)
  br label %._crit_edge23

._crit_edge23.loopexit:                           ; preds = %._crit_edge20.us
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %._crit_edge23.loopexit36, %._crit_edge10
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next63, %18
  br i1 %exitcond87, label %._crit_edge29.loopexit, label %26

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
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph8.split.us.preheader, label %._crit_edge9

.lr.ph8.split.us.preheader:                       ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next24, %._crit_edge6.us ]
  %13 = mul nsw i64 %indvars.iv23, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.lr.ph8.split.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %21 ], [ 0, %.lr.ph8.split.us ]
  %15 = add nsw i64 %indvars.iv19, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc12.us = call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #7
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next20, %11
  br i1 %exitcond28, label %._crit_edge6.us, label %14

._crit_edge6.us:                                  ; preds = %21
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next24, %12
  br i1 %exitcond29, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge9
  %32 = sext i32 %1 to i64
  %33 = zext i32 %1 to i64
  %34 = zext i32 %0 to i64
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv14, %32
  br label %36

; <label>:36:                                     ; preds = %43, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %43 ], [ 0, %.lr.ph2.split.us ]
  %37 = add nsw i64 %indvars.iv, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %42) #6
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next, %33
  br i1 %exitcond27, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %34
  br i1 %exitcond, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %._crit_edge9
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %50) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
