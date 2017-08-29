; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #5
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #5
  tail call void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader26.lr.ph, label %.preheader25

.preheader26.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader26.us.preheader, label %._crit_edge29

.preheader26.us.preheader:                        ; preds = %.preheader26.lr.ph
  %wide.trip.count39 = zext i32 %1 to i64
  %wide.trip.count44 = zext i32 %0 to i64
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %.preheader26.us.preheader, %._crit_edge32.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge32.us ], [ 0, %.preheader26.us.preheader ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader26.us
  %indvars.iv37 = phi i64 [ 0, %.preheader26.us ], [ %indvars.iv.next38, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv37, %indvars.iv42
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, %0
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, %8
  %15 = fmul double %14, 1.000000e+02
  %16 = fadd double %15, 1.000000e+01
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv42, i64 %indvars.iv37
  store double %16, double* %17, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv37
  store double 0.000000e+00, double* %18, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond, label %._crit_edge32.us, label %9

._crit_edge32.us:                                 ; preds = %9
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %.preheader25.loopexit, label %.preheader26.us

.preheader25.loopexit:                            ; preds = %._crit_edge32.us
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.loopexit, %5
  %19 = icmp sgt i32 %1, 0
  br i1 %19, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader25
  %20 = add i32 %1, -1
  %21 = zext i32 %20 to i64
  %22 = shl nuw nsw i64 %21, 3
  %23 = add nuw nsw i64 %22, 8
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.prol, i64 0
  %scevgep36.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next.prol, %.preheader.us.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %20, 3
  br i1 %24, label %._crit_edge29, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %1 to i64
  %25 = add nsw i64 %wide.trip.count.3, -4
  %26 = sub i64 %25, %indvars.iv.unr
  %27 = lshr i64 %26, 2
  %28 = and i64 %27, 1
  %lcmp.mod48 = icmp eq i64 %28, 0
  br i1 %lcmp.mod48, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol50 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.unr, i64 0
  %scevgep36.prol51 = bitcast double* %scevgep.prol50 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.prol51, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.prol52 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.prol52, i64 0
  %scevgep36.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep36.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep36.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv.unr53 = phi i64 [ %indvars.iv.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %._crit_edge.us.3.prol ]
  %29 = icmp eq i64 %27, 0
  br i1 %29, label %._crit_edge29.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge29.loopexit.unr-lcssa:                 ; preds = %._crit_edge.us.3
  br label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge29.loopexit.unr-lcssa
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.preheader26.lr.ph, %.preheader.us.prol.loopexit, %.preheader25
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr53, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 0
  %scevgep36 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 0
  %scevgep36.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1, i64 0
  %scevgep36.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2, i64 0
  %scevgep36.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.154 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.3, i64 0
  %scevgep36.155 = bitcast double* %scevgep.154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.155, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.156 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.156, i64 0
  %scevgep36.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.1, i64 0
  %scevgep36.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.1, i64 0
  %scevgep36.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep36.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %._crit_edge29.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader65.lr.ph, label %._crit_edge90

.preheader65.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %0, 0
  %11 = add i32 %0, -1
  %12 = add i32 %1, -2
  %13 = zext i32 %12 to i64
  %14 = sext i32 %1 to i64
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %11, 3
  %wide.trip.count.3 = zext i32 %0 to i64
  %xtraiter95 = and i32 %0, 1
  %lcmp.mod96 = icmp eq i32 %xtraiter95, 0
  %16 = icmp eq i32 %11, 0
  %wide.trip.count94.1 = zext i32 %0 to i64
  %xtraiter109 = and i32 %0, 1
  %lcmp.mod110 = icmp eq i32 %xtraiter109, 0
  %17 = icmp eq i32 %11, 0
  %xtraiter116 = and i32 %0, 1
  %lcmp.mod117 = icmp eq i32 %xtraiter116, 0
  %18 = icmp eq i32 %11, 0
  %wide.trip.count115.1 = zext i32 %0 to i64
  %wide.trip.count124 = zext i32 %1 to i64
  %wide.trip.count106.1 = zext i32 %0 to i64
  %wide.trip.count129 = zext i32 %1 to i64
  br label %.preheader65

.loopexit.loopexit91:                             ; preds = %.lr.ph80
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep103, i8 0, i64 %24, i32 8, i1 false)
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge77.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit.loopexit91, %._crit_edge71
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next128, %wide.trip.count129
  br i1 %exitcond130, label %._crit_edge90.loopexit, label %.preheader65

.preheader65:                                     ; preds = %.loopexit, %.preheader65.lr.ph
  %indvars.iv127 = phi i64 [ 0, %.preheader65.lr.ph ], [ %indvars.iv.next128, %.loopexit ]
  %indvars.iv120 = phi i64 [ 1, %.preheader65.lr.ph ], [ %indvars.iv.next121, %.loopexit ]
  %19 = mul nuw nsw i64 %indvars.iv127, 1201
  %20 = add nuw nsw i64 %19, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %20
  %scevgep103 = bitcast double* %scevgep to i8*
  %21 = sub i64 %13, %indvars.iv127
  %22 = shl i64 %21, 3
  %23 = and i64 %22, 34359738360
  %24 = add nuw nsw i64 %23, 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader65
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.067.prol = phi double [ %28, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv127
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %26
  %28 = fadd double %.067.prol, %27
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.067.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  br i1 %15, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.067 = phi double [ %44, %.lr.ph.new ], [ %.067.unr, %.lr.ph.new.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv127
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %30
  %32 = fadd double %.067, %31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv127
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %34
  %36 = fadd double %32, %35
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv127
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fadd double %36, %39
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv127
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %42
  %44 = fadd double %40, %43
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader65
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader65 ], [ %.lcssa.unr, %.prol.loopexit ], [ %44, %._crit_edge.loopexit ]
  %45 = tail call double @sqrt(double %.0.lcssa) #5
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv127, i64 %indvars.iv127
  store double %45, double* %46, align 8
  br i1 %8, label %.lr.ph70.preheader, label %._crit_edge71

.lr.ph70.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod96, label %.lr.ph70.prol.loopexit, label %.lr.ph70.prol

.lr.ph70.prol:                                    ; preds = %.lr.ph70.preheader
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv127
  %48 = load double, double* %47, align 8
  %49 = load double, double* %46, align 8
  %50 = fdiv double %48, %49
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv127
  store double %50, double* %51, align 8
  br label %.lr.ph70.prol.loopexit

.lr.ph70.prol.loopexit:                           ; preds = %.lr.ph70.prol, %.lr.ph70.preheader
  %indvars.iv92.unr.ph = phi i64 [ 1, %.lr.ph70.prol ], [ 0, %.lr.ph70.preheader ]
  br i1 %16, label %._crit_edge71, label %.lr.ph70.preheader138

.lr.ph70.preheader138:                            ; preds = %.lr.ph70.prol.loopexit
  br label %.lr.ph70

.lr.ph70:                                         ; preds = %.lr.ph70.preheader138, %.lr.ph70
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.lr.ph70 ], [ %indvars.iv92.unr.ph, %.lr.ph70.preheader138 ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv127
  %53 = load double, double* %52, align 8
  %54 = load double, double* %46, align 8
  %55 = fdiv double %53, %54
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv92, i64 %indvars.iv127
  store double %55, double* %56, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next93, i64 %indvars.iv127
  %58 = load double, double* %57, align 8
  %59 = load double, double* %46, align 8
  %60 = fdiv double %58, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next93, i64 %indvars.iv127
  store double %60, double* %61, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, %wide.trip.count94.1
  br i1 %exitcond.1, label %._crit_edge71.loopexit, label %.lr.ph70

._crit_edge71.loopexit:                           ; preds = %.lr.ph70
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %.lr.ph70.prol.loopexit, %._crit_edge
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %62 = icmp slt i64 %indvars.iv.next128, %14
  br i1 %62, label %.lr.ph80, label %.loopexit

.lr.ph80:                                         ; preds = %._crit_edge71
  br i1 %9, label %.lr.ph80.split.us.preheader, label %.loopexit.loopexit91

.lr.ph80.split.us.preheader:                      ; preds = %.lr.ph80
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv127
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv127
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %.lr.ph80.split.us.preheader, %._crit_edge77.us
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge77.us ], [ %indvars.iv120, %.lr.ph80.split.us.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv127, i64 %indvars.iv122
  store double 0.000000e+00, double* %65, align 8
  br i1 %lcmp.mod110, label %.prol.loopexit108, label %.prol.preheader107

.prol.preheader107:                               ; preds = %.lr.ph80.split.us
  %66 = load double, double* %64, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv122
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = load double, double* %65, align 8
  %71 = fadd double %70, %69
  store double %71, double* %65, align 8
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.prol.preheader107, %.lr.ph80.split.us
  %indvars.iv104.unr.ph = phi i64 [ 1, %.prol.preheader107 ], [ 0, %.lr.ph80.split.us ]
  br i1 %17, label %..preheader_crit_edge.us, label %.lr.ph80.split.us.new.preheader

.lr.ph80.split.us.new.preheader:                  ; preds = %.prol.loopexit108
  br label %.lr.ph80.split.us.new

._crit_edge77.us.loopexit:                        ; preds = %.lr.ph76.us
  br label %._crit_edge77.us

._crit_edge77.us:                                 ; preds = %._crit_edge77.us.loopexit, %.lr.ph76.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond = icmp eq i64 %indvars.iv.next123, %wide.trip.count124
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph80.split.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader137, %.lr.ph76.us
  %indvars.iv113 = phi i64 [ %indvars.iv.next114.1, %.lr.ph76.us ], [ %indvars.iv113.unr.ph, %.lr.ph76.us.preheader137 ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv113, i64 %indvars.iv122
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv113, i64 %indvars.iv127
  %75 = load double, double* %74, align 8
  %76 = load double, double* %65, align 8
  %77 = fmul double %75, %76
  %78 = fsub double %73, %77
  store double %78, double* %72, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next114, i64 %indvars.iv122
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next114, i64 %indvars.iv127
  %82 = load double, double* %81, align 8
  %83 = load double, double* %65, align 8
  %84 = fmul double %82, %83
  %85 = fsub double %80, %84
  store double %85, double* %79, align 8
  %indvars.iv.next114.1 = add nsw i64 %indvars.iv113, 2
  %exitcond.1119 = icmp eq i64 %indvars.iv.next114.1, %wide.trip.count115.1
  br i1 %exitcond.1119, label %._crit_edge77.us.loopexit, label %.lr.ph76.us

.lr.ph80.split.us.new:                            ; preds = %.lr.ph80.split.us.new.preheader, %.lr.ph80.split.us.new
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph80.split.us.new ], [ %indvars.iv104.unr.ph, %.lr.ph80.split.us.new.preheader ]
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv127
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv122
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = load double, double* %65, align 8
  %92 = fadd double %91, %90
  store double %92, double* %65, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv127
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv122
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = load double, double* %65, align 8
  %99 = fadd double %98, %97
  store double %99, double* %65, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %exitcond.1112 = icmp eq i64 %indvars.iv.next105.1, %wide.trip.count106.1
  br i1 %exitcond.1112, label %..preheader_crit_edge.us.loopexit, label %.lr.ph80.split.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph80.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit108
  br i1 %10, label %.lr.ph76.us.preheader, label %._crit_edge77.us

.lr.ph76.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod117, label %.lr.ph76.us.prol.loopexit, label %.lr.ph76.us.prol

.lr.ph76.us.prol:                                 ; preds = %.lr.ph76.us.preheader
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv122
  %101 = load double, double* %100, align 8
  %102 = load double, double* %63, align 8
  %103 = load double, double* %65, align 8
  %104 = fmul double %102, %103
  %105 = fsub double %101, %104
  store double %105, double* %100, align 8
  br label %.lr.ph76.us.prol.loopexit

.lr.ph76.us.prol.loopexit:                        ; preds = %.lr.ph76.us.prol, %.lr.ph76.us.preheader
  %indvars.iv113.unr.ph = phi i64 [ 1, %.lr.ph76.us.prol ], [ 0, %.lr.ph76.us.preheader ]
  br i1 %18, label %._crit_edge77.us, label %.lr.ph76.us.preheader137

.lr.ph76.us.preheader137:                         ; preds = %.lr.ph76.us.prol.loopexit
  br label %.lr.ph76.us

._crit_edge90.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader26.us.preheader, label %._crit_edge34

.preheader26.us.preheader:                        ; preds = %5
  %11 = sext i32 %1 to i64
  %wide.trip.count43 = zext i32 %1 to i64
  %wide.trip.count47 = zext i32 %1 to i64
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge32.us, %.preheader26.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader26.us.preheader ], [ %indvars.iv.next46, %._crit_edge32.us ]
  %12 = mul nsw i64 %indvars.iv45, %11
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader26.us
  %indvars.iv41 = phi i64 [ 0, %.preheader26.us ], [ %indvars.iv.next42, %20 ]
  %14 = add nsw i64 %indvars.iv41, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc25.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv41
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge32.us, label %13

._crit_edge32.us:                                 ; preds = %20
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %._crit_edge34.loopexit, label %.preheader26.us

._crit_edge34.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %29 = icmp sgt i32 %0, 0
  %30 = icmp sgt i32 %1, 0
  %or.cond = and i1 %29, %30
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %._crit_edge34
  %31 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count38 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next37, %._crit_edge.us ]
  %32 = mul nsw i64 %indvars.iv36, %31
  br label %33

; <label>:33:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %40 ]
  %34 = add nsw i64 %indvars.iv, %32
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 20
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %33
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %39) #6
  br label %40

; <label>:40:                                     ; preds = %38, %33
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %43) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge29.loopexit, label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge34
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %47) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
