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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
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
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader27.us.preheader, label %._crit_edge30

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %wide.trip.count40 = zext i32 %1 to i64
  %wide.trip.count45 = zext i32 %0 to i64
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next44, %._crit_edge33.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader27.us
  %indvars.iv38 = phi i64 [ 0, %.preheader27.us ], [ %indvars.iv.next39, %._crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv38, %indvars.iv43
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, %0
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, %8
  %14 = fmul double %13, 1.000000e+02
  %15 = fadd double %14, 1.000000e+01
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv38
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv38
  store double 0.000000e+00, double* %17, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond, label %._crit_edge33.us, label %._crit_edge

._crit_edge33.us:                                 ; preds = %._crit_edge
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge33.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  %18 = icmp sgt i32 %1, 0
  br i1 %18, label %.preheader.us.preheader, label %._crit_edge30

.preheader.us.preheader:                          ; preds = %.preheader26
  %19 = add i32 %1, -1
  %20 = zext i32 %19 to i64
  %21 = shl nuw nsw i64 %20, 3
  %22 = add nuw nsw i64 %21, 8
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  %23 = add nsw i32 %xtraiter, -1
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, %._crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.prol, i64 0
  %scevgep37.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.prol, i8 0, i64 %22, i32 8, i1 false)
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, !llvm.loop !1

._crit_edge.us.prol.._crit_edge.us.prol_crit_edge: ; preds = %._crit_edge.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %._crit_edge.us.prol

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  %24 = zext i32 %23 to i64
  %25 = add nuw nsw i64 %24, 1
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ %25, %.preheader.us.prol.loopexit.loopexit ], [ 0, %.preheader.us.preheader ]
  %26 = icmp ult i32 %19, 3
  br i1 %26, label %._crit_edge30, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %1 to i64
  %27 = add nsw i64 %wide.trip.count.3, -4
  %28 = sub nsw i64 %27, %indvars.iv.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod49 = icmp eq i64 %30, 0
  br i1 %lcmp.mod49, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol51 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.unr, i64 0
  %scevgep37.prol52 = bitcast double* %scevgep.prol51 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.prol52, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.prol53 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.prol53, i64 0
  %scevgep37.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.1.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep37.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.2.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep37.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.3.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv.unr54 = phi i64 [ %indvars.iv.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %._crit_edge.us.3.prol ]
  %31 = icmp eq i64 %29, 0
  br i1 %31, label %._crit_edge30.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge30.loopexit.unr-lcssa:                 ; preds = %._crit_edge.us.3
  br label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge30.loopexit.unr-lcssa
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader.us.prol.loopexit, %.preheader26, %.preheader27.lr.ph
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr54, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 0
  %scevgep37 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 0
  %scevgep37.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1, i64 0
  %scevgep37.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.2, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2, i64 0
  %scevgep37.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.3, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.155 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.3, i64 0
  %scevgep37.156 = bitcast double* %scevgep.155 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.156, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.157 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.157, i64 0
  %scevgep37.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.1.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.1, i64 0
  %scevgep37.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.2.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.1, i64 0
  %scevgep37.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.3.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %._crit_edge30.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader65.lr.ph, label %._crit_edge90

.preheader65.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = add i32 %0, -1
  %9 = add i32 %1, -2
  %10 = zext i32 %9 to i64
  %11 = sext i32 %1 to i64
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %wide.trip.count.3 = zext i32 %0 to i64
  %xtraiter95 = and i32 %0, 1
  %lcmp.mod96 = icmp eq i32 %xtraiter95, 0
  %13 = icmp eq i32 %8, 0
  %wide.trip.count124 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  br label %.preheader65

.loopexit.loopexit91:                             ; preds = %.lr.ph80
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep103, i8 0, i64 %22, i32 8, i1 false)
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge77.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge71, %.loopexit.loopexit91
  %exitcond130 = icmp eq i64 %indvars.iv.next128, %wide.trip.count124
  br i1 %exitcond130, label %._crit_edge90.loopexit, label %.loopexit..preheader65_crit_edge

.loopexit..preheader65_crit_edge:                 ; preds = %.loopexit
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br label %.preheader65

.preheader65:                                     ; preds = %.loopexit..preheader65_crit_edge, %.preheader65.lr.ph
  %indvars.iv127 = phi i64 [ 0, %.preheader65.lr.ph ], [ %indvars.iv.next128, %.loopexit..preheader65_crit_edge ]
  %indvars.iv120 = phi i64 [ 1, %.preheader65.lr.ph ], [ %indvars.iv.next121, %.loopexit..preheader65_crit_edge ]
  %17 = mul nuw nsw i64 %indvars.iv127, 1201
  %18 = add nuw nsw i64 %17, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %18
  %scevgep103 = bitcast double* %scevgep to i8*
  %19 = sub i64 %10, %indvars.iv127
  %20 = shl i64 %19, 3
  %21 = and i64 %20, 34359738360
  %22 = add nuw nsw i64 %21, 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader65
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %.067.prol = phi double [ %26, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv127
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %24
  %26 = fadd double %.067.prol, %25
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %16, %.prol.loopexit.loopexit ]
  %.067.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %26, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %26, %.prol.loopexit.loopexit ]
  br i1 %12, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.067 = phi double [ %42, %.lr.ph.new ], [ %.067.unr, %.lr.ph.new.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv127
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %28
  %30 = fadd double %.067, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv127
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %32
  %34 = fadd double %30, %33
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv127
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %36
  %38 = fadd double %34, %37
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv127
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fadd double %38, %41
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader65
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader65 ], [ %.lcssa.unr, %.prol.loopexit ], [ %42, %._crit_edge.loopexit ]
  %43 = tail call double @sqrt(double %.0.lcssa) #4
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv127, i64 %indvars.iv127
  store double %43, double* %44, align 8
  br i1 %7, label %.lr.ph70.preheader, label %._crit_edge71

.lr.ph70.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod96, label %.lr.ph70.prol.loopexit, label %.lr.ph70.prol

.lr.ph70.prol:                                    ; preds = %.lr.ph70.preheader
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv127
  %46 = load double, double* %45, align 8
  %47 = fdiv double %46, %43
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv127
  store double %47, double* %48, align 8
  br label %.lr.ph70.prol.loopexit

.lr.ph70.prol.loopexit:                           ; preds = %.lr.ph70.preheader, %.lr.ph70.prol
  %indvars.iv92.unr.ph = phi i64 [ 1, %.lr.ph70.prol ], [ 0, %.lr.ph70.preheader ]
  br i1 %13, label %._crit_edge71, label %.lr.ph70.preheader141

.lr.ph70.preheader141:                            ; preds = %.lr.ph70.prol.loopexit
  br label %.lr.ph70

.lr.ph70:                                         ; preds = %.lr.ph70.preheader141, %.lr.ph70
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.lr.ph70 ], [ %indvars.iv92.unr.ph, %.lr.ph70.preheader141 ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv127
  %50 = load double, double* %49, align 8
  %51 = load double, double* %44, align 8
  %52 = fdiv double %50, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv92, i64 %indvars.iv127
  store double %52, double* %53, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next93, i64 %indvars.iv127
  %55 = load double, double* %54, align 8
  %56 = load double, double* %44, align 8
  %57 = fdiv double %55, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next93, i64 %indvars.iv127
  store double %57, double* %58, align 8
  %indvars.iv.next93.1 = add nuw nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, %wide.trip.count.3
  br i1 %exitcond.1, label %._crit_edge71.loopexit, label %.lr.ph70

._crit_edge71.loopexit:                           ; preds = %.lr.ph70
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %.lr.ph70.prol.loopexit, %._crit_edge
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %59 = icmp slt i64 %indvars.iv.next128, %11
  br i1 %59, label %.lr.ph80, label %.loopexit

.lr.ph80:                                         ; preds = %._crit_edge71
  br i1 %7, label %.lr.ph80.split.us.preheader, label %.loopexit.loopexit91

.lr.ph80.split.us.preheader:                      ; preds = %.lr.ph80
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv127
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %._crit_edge77.us, %.lr.ph80.split.us.preheader
  %indvars.iv122 = phi i64 [ %indvars.iv120, %.lr.ph80.split.us.preheader ], [ %indvars.iv.next123, %._crit_edge77.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv127, i64 %indvars.iv122
  store double 0.000000e+00, double* %61, align 8
  br i1 %lcmp.mod96, label %.prol.loopexit108, label %.prol.preheader107

.prol.preheader107:                               ; preds = %.lr.ph80.split.us
  %62 = load double, double* %60, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv122
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %65, 0.000000e+00
  store double %66, double* %61, align 8
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.lr.ph80.split.us, %.prol.preheader107
  %67 = phi double [ %66, %.prol.preheader107 ], [ 0.000000e+00, %.lr.ph80.split.us ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.prol.preheader107 ], [ 0, %.lr.ph80.split.us ]
  br i1 %13, label %.lr.ph76.us.preheader, label %.lr.ph80.split.us.new.preheader

.lr.ph80.split.us.new.preheader:                  ; preds = %.prol.loopexit108
  br label %.lr.ph80.split.us.new

._crit_edge77.us.loopexit:                        ; preds = %.lr.ph76.us
  br label %._crit_edge77.us

._crit_edge77.us:                                 ; preds = %._crit_edge77.us.loopexit, %.lr.ph76.us.prol.loopexit
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond = icmp eq i64 %indvars.iv.next123, %wide.trip.count124
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph80.split.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader140, %.lr.ph76.us
  %indvars.iv113 = phi i64 [ %indvars.iv.next114.1, %.lr.ph76.us ], [ %indvars.iv113.unr.ph, %.lr.ph76.us.preheader140 ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv113, i64 %indvars.iv122
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv113, i64 %indvars.iv127
  %71 = load double, double* %70, align 8
  %72 = load double, double* %61, align 8
  %73 = fmul double %71, %72
  %74 = fsub double %69, %73
  store double %74, double* %68, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next114, i64 %indvars.iv122
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next114, i64 %indvars.iv127
  %78 = load double, double* %77, align 8
  %79 = load double, double* %61, align 8
  %80 = fmul double %78, %79
  %81 = fsub double %76, %80
  store double %81, double* %75, align 8
  %indvars.iv.next114.1 = add nuw nsw i64 %indvars.iv113, 2
  %exitcond.1119 = icmp eq i64 %indvars.iv.next114.1, %wide.trip.count.3
  br i1 %exitcond.1119, label %._crit_edge77.us.loopexit, label %.lr.ph76.us

.lr.ph80.split.us.new:                            ; preds = %.lr.ph80.split.us.new.preheader, %.lr.ph80.split.us.new
  %82 = phi double [ %94, %.lr.ph80.split.us.new ], [ %67, %.lr.ph80.split.us.new.preheader ]
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph80.split.us.new ], [ %indvars.iv104.unr.ph, %.lr.ph80.split.us.new.preheader ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv127
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv122
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  store double %88, double* %61, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv127
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv122
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = fadd double %88, %93
  store double %94, double* %61, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond.1112 = icmp eq i64 %indvars.iv.next105.1, %wide.trip.count.3
  br i1 %exitcond.1112, label %.lr.ph76.us.preheader.loopexit, label %.lr.ph80.split.us.new

.lr.ph76.us.preheader.loopexit:                   ; preds = %.lr.ph80.split.us.new
  br label %.lr.ph76.us.preheader

.lr.ph76.us.preheader:                            ; preds = %.lr.ph76.us.preheader.loopexit, %.prol.loopexit108
  %95 = phi double [ %67, %.prol.loopexit108 ], [ %94, %.lr.ph76.us.preheader.loopexit ]
  br i1 %lcmp.mod96, label %.lr.ph76.us.prol.loopexit, label %.lr.ph76.us.prol

.lr.ph76.us.prol:                                 ; preds = %.lr.ph76.us.preheader
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv122
  %97 = load double, double* %96, align 8
  %98 = load double, double* %60, align 8
  %99 = fmul double %98, %95
  %100 = fsub double %97, %99
  store double %100, double* %96, align 8
  br label %.lr.ph76.us.prol.loopexit

.lr.ph76.us.prol.loopexit:                        ; preds = %.lr.ph76.us.preheader, %.lr.ph76.us.prol
  %indvars.iv113.unr.ph = phi i64 [ 1, %.lr.ph76.us.prol ], [ 0, %.lr.ph76.us.preheader ]
  br i1 %13, label %._crit_edge77.us, label %.lr.ph76.us.preheader140

.lr.ph76.us.preheader140:                         ; preds = %.lr.ph76.us.prol.loopexit
  br label %.lr.ph76.us

._crit_edge90.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit, %5
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
  br i1 %9, label %.preheader28.us.preheader, label %._crit_edge36

.preheader28.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge34.us, %.preheader28.us.preheader
  %indvars.iv47 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next48, %._crit_edge34.us ]
  %11 = mul nsw i64 %indvars.iv47, %10
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader28.us
  %indvars.iv43 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv43, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv43
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge34.us, label %._crit_edge1

._crit_edge34.us:                                 ; preds = %._crit_edge
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count45
  br i1 %exitcond50, label %._crit_edge36.loopexit, label %.preheader28.us

._crit_edge36.loopexit:                           ; preds = %._crit_edge34.us
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit, %4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %26 = icmp sgt i32 %0, 0
  %or.cond = and i1 %26, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge31

.preheader.us.preheader:                          ; preds = %._crit_edge36
  %27 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count40 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us ]
  %28 = mul nsw i64 %indvars.iv38, %27
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge2 ]
  %29 = add nsw i64 %indvars.iv, %28
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %._crit_edge2

; <label>:33:                                     ; preds = %._crit_edge3
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %33
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge2
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge31.loopexit, label %.preheader.us

._crit_edge31.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %._crit_edge36
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #6
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
