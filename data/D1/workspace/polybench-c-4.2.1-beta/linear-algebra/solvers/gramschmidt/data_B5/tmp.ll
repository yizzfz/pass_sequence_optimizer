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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = sext i32 %1 to i64
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader22.lr.ph, label %.preheader21

.preheader22.lr.ph:                               ; preds = %5
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader22.us.preheader, label %._crit_edge33

.preheader22.us.preheader:                        ; preds = %.preheader22.lr.ph
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %.preheader22.us.preheader, %._crit_edge36.us
  %indvars.iv2737.us = phi i64 [ %indvars.iv.next28.us, %._crit_edge36.us ], [ 0, %.preheader22.us.preheader ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader22.us
  %indvars.iv2534.us = phi i64 [ 0, %.preheader22.us ], [ %indvars.iv.next26.us, %11 ]
  %12 = mul nuw nsw i64 %indvars.iv2534.us, %indvars.iv2737.us
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %10
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2737.us, i64 %indvars.iv2534.us
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv2737.us, i64 %indvars.iv2534.us
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2534.us, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next26.us, %6
  br i1 %exitcond41, label %._crit_edge36.us, label %11

._crit_edge36.us:                                 ; preds = %11
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv2737.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next28.us, %7
  br i1 %exitcond42, label %.preheader21.loopexit, label %.preheader22.us

.preheader21.loopexit:                            ; preds = %._crit_edge36.us
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %5
  %21 = sext i32 %1 to i64
  %22 = icmp sgt i32 %1, 0
  br i1 %22, label %.preheader.lr.ph, label %._crit_edge33

.preheader.lr.ph:                                 ; preds = %.preheader21
  %wide.trip.count = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %wide.trip.count, 3
  %24 = add nsw i64 %21, -1
  %xtraiter = and i64 %21, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv2331.prol = phi i64 [ %indvars.iv.next24.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.prol ], [ %xtraiter, %._crit_edge.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv2331.prol, i64 0
  %scevgep44.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.prol = add nuw nsw i64 %indvars.iv2331.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !1

.preheader.prol.loopexit.loopexit:                ; preds = %._crit_edge.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.lr.ph
  %indvars.iv2331.unr = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next24.prol, %.preheader.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %24, 3
  br i1 %25, label %._crit_edge33, label %._crit_edge.3.preheader

._crit_edge.3.preheader:                          ; preds = %.preheader.prol.loopexit
  %26 = add nsw i64 %21, -4
  %27 = sub i64 %26, %indvars.iv2331.unr
  %28 = lshr i64 %27, 2
  %29 = and i64 %28, 1
  %lcmp.mod48 = icmp eq i64 %29, 0
  br i1 %lcmp.mod48, label %._crit_edge.3.prol.preheader, label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol.preheader:                     ; preds = %._crit_edge.3.preheader
  br label %._crit_edge.3.prol

._crit_edge.3.prol:                               ; preds = %._crit_edge.3.prol.preheader
  %scevgep.prol50 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv2331.unr, i64 0
  %scevgep44.prol51 = bitcast double* %scevgep.prol50 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.prol51, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.prol52 = add nuw nsw i64 %indvars.iv2331.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.prol52, i64 0
  %scevgep44.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.1.prol = add nsw i64 %indvars.iv2331.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.1.prol, i64 0
  %scevgep44.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.2.prol = add nsw i64 %indvars.iv2331.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.2.prol, i64 0
  %scevgep44.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.3.prol = add nsw i64 %indvars.iv2331.unr, 4
  br label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol.loopexit:                      ; preds = %._crit_edge.3.prol, %._crit_edge.3.preheader
  %indvars.iv2331.unr53 = phi i64 [ %indvars.iv2331.unr, %._crit_edge.3.preheader ], [ %indvars.iv.next24.3.prol, %._crit_edge.3.prol ]
  %30 = icmp eq i64 %28, 0
  br i1 %30, label %._crit_edge33.loopexit, label %._crit_edge.3.preheader.new

._crit_edge.3.preheader.new:                      ; preds = %._crit_edge.3.prol.loopexit
  br label %._crit_edge.3

._crit_edge33.loopexit.unr-lcssa:                 ; preds = %._crit_edge.3
  br label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge.3.prol.loopexit, %._crit_edge33.loopexit.unr-lcssa
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader22.lr.ph, %.preheader.prol.loopexit, %.preheader21
  ret void

._crit_edge.3:                                    ; preds = %._crit_edge.3, %._crit_edge.3.preheader.new
  %indvars.iv2331 = phi i64 [ %indvars.iv2331.unr53, %._crit_edge.3.preheader.new ], [ %indvars.iv.next24.3.1, %._crit_edge.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv2331, i64 0
  %scevgep44 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2331, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24, i64 0
  %scevgep44.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv2331, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.1, i64 0
  %scevgep44.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.2 = add nsw i64 %indvars.iv2331, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.2, i64 0
  %scevgep44.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.3 = add nsw i64 %indvars.iv2331, 4
  %scevgep.154 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.3, i64 0
  %scevgep44.155 = bitcast double* %scevgep.154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.155, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.156 = add nsw i64 %indvars.iv2331, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.156, i64 0
  %scevgep44.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.1.1 = add nsw i64 %indvars.iv2331, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.1.1, i64 0
  %scevgep44.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.2.1 = add nsw i64 %indvars.iv2331, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next24.2.1, i64 0
  %scevgep44.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep44.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next24.3.1 = add nsw i64 %indvars.iv2331, 8
  %exitcond40.3.1 = icmp eq i64 %indvars.iv.next24.3.1, %21
  br i1 %exitcond40.3.1, label %._crit_edge33.loopexit.unr-lcssa, label %._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = sext i32 %0 to i64
  %7 = sext i32 %1 to i64
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader58.lr.ph, label %._crit_edge88

.preheader58.lr.ph:                               ; preds = %5
  %9 = add i32 %1, -1
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %0, 0
  %wide.trip.count = zext i32 %9 to i64
  %12 = icmp sgt i32 %0, 0
  %13 = icmp sgt i32 %0, 0
  %14 = add nsw i64 %6, -1
  %15 = shl nuw nsw i64 %wide.trip.count, 3
  %xtraiter = and i64 %6, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %16 = icmp ult i64 %14, 3
  %xtraiter108 = and i64 %6, 1
  %lcmp.mod109 = icmp eq i64 %xtraiter108, 0
  %17 = icmp eq i64 %14, 0
  %xtraiter111 = and i64 %6, 1
  %lcmp.mod112 = icmp eq i64 %xtraiter111, 0
  %18 = icmp eq i64 %14, 0
  %xtraiter113 = and i64 %6, 1
  %lcmp.mod114 = icmp eq i64 %xtraiter113, 0
  %19 = icmp eq i64 %14, 0
  br label %.preheader58

.preheader58:                                     ; preds = %._crit_edge85, %.preheader58.lr.ph
  %indvars.iv6986 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next70, %._crit_edge85 ]
  %20 = mul i64 %indvars.iv6986, 1201
  %21 = add i64 %20, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %21
  %scevgep110 = bitcast double* %scevgep to i8*
  %22 = mul i64 %indvars.iv6986, -8
  %23 = add i64 %15, %22
  br i1 %10, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader58
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.072.prol = phi double [ %27, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.prol.preheader ]
  %indvars.iv71.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv71.prol, i64 %indvars.iv6986
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %25
  %27 = fadd double %.072.prol, %26
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv71.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %27, %.lr.ph.prol.loopexit.loopexit ]
  %.072.unr = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %27, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv71.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  br i1 %16, label %._crit_edge, label %.lr.ph.preheader127

.lr.ph.preheader127:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader127, %.lr.ph
  %.072 = phi double [ %43, %.lr.ph ], [ %.072.unr, %.lr.ph.preheader127 ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ %indvars.iv71.unr, %.lr.ph.preheader127 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv71, i64 %indvars.iv6986
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %29
  %31 = fadd double %.072, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv71, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv6986
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %31, %34
  %indvars.iv.next.1 = add nsw i64 %indvars.iv71, 2
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv6986
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fadd double %35, %38
  %indvars.iv.next.2 = add nsw i64 %indvars.iv71, 3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv6986
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fadd double %39, %42
  %indvars.iv.next.3 = add nsw i64 %indvars.iv71, 4
  %exitcond103.3 = icmp eq i64 %indvars.iv.next.3, %6
  br i1 %exitcond103.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader58
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader58 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %43, %._crit_edge.loopexit ]
  %44 = tail call double @sqrt(double %.0.lcssa) #4
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6986, i64 %indvars.iv6986
  store double %44, double* %45, align 8
  br i1 %11, label %.lr.ph75.preheader, label %.preheader57

.lr.ph75.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod109, label %.lr.ph75.prol.loopexit, label %.lr.ph75.prol

.lr.ph75.prol:                                    ; preds = %.lr.ph75.preheader
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv6986
  %47 = load double, double* %46, align 8
  %48 = load double, double* %45, align 8
  %49 = fdiv double %47, %48
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv6986
  store double %49, double* %50, align 8
  br label %.lr.ph75.prol.loopexit

.lr.ph75.prol.loopexit:                           ; preds = %.lr.ph75.prol, %.lr.ph75.preheader
  %indvars.iv5973.unr.ph = phi i64 [ 1, %.lr.ph75.prol ], [ 0, %.lr.ph75.preheader ]
  br i1 %17, label %.preheader57, label %.lr.ph75.preheader126

.lr.ph75.preheader126:                            ; preds = %.lr.ph75.prol.loopexit
  br label %.lr.ph75

.preheader57.loopexit:                            ; preds = %.lr.ph75
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.lr.ph75.prol.loopexit, %._crit_edge
  %exitcond82 = icmp eq i64 %indvars.iv6986, %wide.trip.count
  br i1 %exitcond82, label %._crit_edge85, label %.lr.ph84

.lr.ph84:                                         ; preds = %.preheader57
  br i1 %12, label %.lr.ph84.split.us.preheader, label %._crit_edge85.loopexit102

.lr.ph84.split.us.preheader:                      ; preds = %.lr.ph84
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv6986
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv6986
  br label %.lr.ph84.split.us

.lr.ph84.split.us:                                ; preds = %.lr.ph84.split.us.preheader, %.loopexit.us
  %indvars.iv.next6883.in.us = phi i64 [ %indvars.iv.next6883.us, %.loopexit.us ], [ %indvars.iv6986, %.lr.ph84.split.us.preheader ]
  %indvars.iv.next6883.us = add nuw nsw i64 %indvars.iv.next6883.in.us, 1
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6986, i64 %indvars.iv.next6883.us
  store double 0.000000e+00, double* %53, align 8
  br i1 %lcmp.mod112, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph84.split.us
  %54 = load double, double* %52, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv.next6883.us
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %57, 0.000000e+00
  store double %58, double* %53, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph84.split.us
  %.unr.ph = phi double [ %58, %.prol.preheader ], [ 0.000000e+00, %.lr.ph84.split.us ]
  %indvars.iv6176.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph84.split.us ]
  br i1 %18, label %..preheader_crit_edge.us, label %.lr.ph84.split.us.new.preheader

.lr.ph84.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph84.split.us.new

.lr.ph80.us:                                      ; preds = %.lr.ph80.us.preheader125, %.lr.ph80.us
  %indvars.iv6379.us = phi i64 [ %indvars.iv.next64.us.1, %.lr.ph80.us ], [ %indvars.iv6379.us.unr.ph, %.lr.ph80.us.preheader125 ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6379.us, i64 %indvars.iv.next6883.us
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6379.us, i64 %indvars.iv6986
  %62 = load double, double* %61, align 8
  %63 = load double, double* %53, align 8
  %64 = fmul double %62, %63
  %65 = fsub double %60, %64
  store double %65, double* %59, align 8
  %indvars.iv.next64.us = add nuw nsw i64 %indvars.iv6379.us, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next64.us, i64 %indvars.iv.next6883.us
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next64.us, i64 %indvars.iv6986
  %69 = load double, double* %68, align 8
  %70 = load double, double* %53, align 8
  %71 = fmul double %69, %70
  %72 = fsub double %67, %71
  store double %72, double* %66, align 8
  %indvars.iv.next64.us.1 = add nsw i64 %indvars.iv6379.us, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next64.us.1, %6
  br i1 %exitcond106.1, label %.loopexit.us.loopexit, label %.lr.ph80.us

.lr.ph84.split.us.new:                            ; preds = %.lr.ph84.split.us.new.preheader, %.lr.ph84.split.us.new
  %73 = phi double [ %85, %.lr.ph84.split.us.new ], [ %.unr.ph, %.lr.ph84.split.us.new.preheader ]
  %indvars.iv6176.us = phi i64 [ %indvars.iv.next62.us.1, %.lr.ph84.split.us.new ], [ %indvars.iv6176.us.unr.ph, %.lr.ph84.split.us.new.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6176.us, i64 %indvars.iv6986
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6176.us, i64 %indvars.iv.next6883.us
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %73, %78
  store double %79, double* %53, align 8
  %indvars.iv.next62.us = add nuw nsw i64 %indvars.iv6176.us, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next62.us, i64 %indvars.iv6986
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next62.us, i64 %indvars.iv.next6883.us
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %79, %84
  store double %85, double* %53, align 8
  %indvars.iv.next62.us.1 = add nsw i64 %indvars.iv6176.us, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next62.us.1, %6
  br i1 %exitcond105.1, label %..preheader_crit_edge.us.loopexit, label %.lr.ph84.split.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph80.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph80.us.prol.loopexit, %..preheader_crit_edge.us
  %exitcond.us = icmp eq i64 %indvars.iv.next6883.us, %wide.trip.count
  br i1 %exitcond.us, label %._crit_edge85.loopexit, label %.lr.ph84.split.us

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph84.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %13, label %.lr.ph80.us.preheader, label %.loopexit.us

.lr.ph80.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod114, label %.lr.ph80.us.prol.loopexit, label %.lr.ph80.us.prol

.lr.ph80.us.prol:                                 ; preds = %.lr.ph80.us.preheader
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv.next6883.us
  %87 = load double, double* %86, align 8
  %88 = load double, double* %51, align 8
  %89 = load double, double* %53, align 8
  %90 = fmul double %88, %89
  %91 = fsub double %87, %90
  store double %91, double* %86, align 8
  br label %.lr.ph80.us.prol.loopexit

.lr.ph80.us.prol.loopexit:                        ; preds = %.lr.ph80.us.prol, %.lr.ph80.us.preheader
  %indvars.iv6379.us.unr.ph = phi i64 [ 1, %.lr.ph80.us.prol ], [ 0, %.lr.ph80.us.preheader ]
  br i1 %19, label %.loopexit.us, label %.lr.ph80.us.preheader125

.lr.ph80.us.preheader125:                         ; preds = %.lr.ph80.us.prol.loopexit
  br label %.lr.ph80.us

.lr.ph75:                                         ; preds = %.lr.ph75.preheader126, %.lr.ph75
  %indvars.iv5973 = phi i64 [ %indvars.iv.next60.1, %.lr.ph75 ], [ %indvars.iv5973.unr.ph, %.lr.ph75.preheader126 ]
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5973, i64 %indvars.iv6986
  %93 = load double, double* %92, align 8
  %94 = load double, double* %45, align 8
  %95 = fdiv double %93, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv5973, i64 %indvars.iv6986
  store double %95, double* %96, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv5973, 1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next60, i64 %indvars.iv6986
  %98 = load double, double* %97, align 8
  %99 = load double, double* %45, align 8
  %100 = fdiv double %98, %99
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next60, i64 %indvars.iv6986
  store double %100, double* %101, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv5973, 2
  %exitcond104.1 = icmp eq i64 %indvars.iv.next60.1, %6
  br i1 %exitcond104.1, label %.preheader57.loopexit, label %.lr.ph75

._crit_edge85.loopexit102:                        ; preds = %.lr.ph84
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep110, i8 0, i64 %23, i32 8, i1 false)
  br label %._crit_edge85

._crit_edge85.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85.loopexit, %._crit_edge85.loopexit102, %.preheader57
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv6986, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next70, %7
  br i1 %exitcond107, label %._crit_edge88.loopexit, label %.preheader58

._crit_edge88.loopexit:                           ; preds = %._crit_edge85
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.loopexit, %5
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
  %9 = sext i32 %1 to i64
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader24.lr.ph, label %._crit_edge42

.preheader24.lr.ph:                               ; preds = %4
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader24

.preheader24:                                     ; preds = %._crit_edge39, %.preheader24.lr.ph
  %indvars.iv2940 = phi i64 [ 0, %.preheader24.lr.ph ], [ %indvars.iv.next30, %._crit_edge39 ]
  %11 = mul nsw i64 %indvars.iv2940, %9
  br label %12

; <label>:12:                                     ; preds = %._crit_edge, %.preheader24
  %indvars.iv2737 = phi i64 [ 0, %.preheader24 ], [ %indvars.iv.next28, %._crit_edge ]
  %13 = add nsw i64 %indvars.iv2737, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc7 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2940, i64 %indvars.iv2737
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2737, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count
  br i1 %exitcond, label %._crit_edge39, label %12

._crit_edge39:                                    ; preds = %._crit_edge
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv2940, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next30, %9
  br i1 %exitcond47, label %._crit_edge42.loopexit, label %.preheader24

._crit_edge42.loopexit:                           ; preds = %._crit_edge39
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %27 = sext i32 %1 to i64
  %28 = sext i32 %0 to i64
  %29 = sext i32 %1 to i64
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge35

.preheader.us.preheader:                          ; preds = %._crit_edge42
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge32.us
  %indvars.iv2533.us = phi i64 [ %indvars.iv.next26.us, %._crit_edge32.us ], [ 0, %.preheader.us.preheader ]
  %32 = mul nsw i64 %indvars.iv2533.us, %29
  br label %33

; <label>:33:                                     ; preds = %._crit_edge1.us, %.preheader.us
  %indvars.iv31.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge1.us ]
  %34 = add nsw i64 %indvars.iv31.us, %32
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 20
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %._crit_edge1.us

; <label>:38:                                     ; preds = %33
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %39) #6
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %38, %33
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2533.us, i64 %indvars.iv31.us
  %42 = load double, double* %41, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %42) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv31.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next.us, %27
  br i1 %exitcond44, label %._crit_edge32.us, label %33

._crit_edge32.us:                                 ; preds = %._crit_edge1.us
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2533.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next26.us, %28
  br i1 %exitcond45, label %._crit_edge35.loopexit, label %.preheader.us

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %._crit_edge42
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %46) #6
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
