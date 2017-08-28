; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %6, label %.preheader4.lr.ph, label %.preheader3

.preheader4.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader4.us.preheader, label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count17 = zext i32 %1 to i64
  %wide.trip.count22 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge10.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge10.us ], [ 0, %.preheader4.us.preheader ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader4.us
  %indvars.iv15 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next16, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv15, %indvars.iv20
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, %0
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, %8
  %15 = fmul double %14, 1.000000e+02
  %16 = fadd double %15, 1.000000e+01
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv15
  store double %16, double* %17, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv15
  store double 0.000000e+00, double* %18, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond, label %._crit_edge10.us, label %9

._crit_edge10.us:                                 ; preds = %9
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %.preheader3.loopexit, label %.preheader4.us

.preheader3.loopexit:                             ; preds = %._crit_edge10.us
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %5
  %19 = icmp sgt i32 %1, 0
  br i1 %19, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader3
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
  %scevgep14.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next.prol, %.preheader.us.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %20, 3
  br i1 %24, label %._crit_edge7, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %1 to i64
  %25 = add nsw i64 %wide.trip.count.3, -4
  %26 = sub i64 %25, %indvars.iv.unr
  %27 = lshr i64 %26, 2
  %28 = and i64 %27, 1
  %lcmp.mod26 = icmp eq i64 %28, 0
  br i1 %lcmp.mod26, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol28 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.unr, i64 0
  %scevgep14.prol29 = bitcast double* %scevgep.prol28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol29, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.prol30 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.prol30, i64 0
  %scevgep14.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep14.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep14.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv.unr31 = phi i64 [ %indvars.iv.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %._crit_edge.us.3.prol ]
  %29 = icmp eq i64 %27, 0
  br i1 %29, label %._crit_edge7.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge7.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us.3
  br label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge7.loopexit.unr-lcssa
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader4.lr.ph, %.preheader.us.prol.loopexit, %.preheader3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr31, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 0
  %scevgep14 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 0
  %scevgep14.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1, i64 0
  %scevgep14.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2, i64 0
  %scevgep14.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.132 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.3, i64 0
  %scevgep14.133 = bitcast double* %scevgep.132 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.133, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.134 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.134, i64 0
  %scevgep14.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.1, i64 0
  %scevgep14.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.1, i64 0
  %scevgep14.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %._crit_edge7.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader5.lr.ph, label %._crit_edge31

.preheader5.lr.ph:                                ; preds = %5
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
  %xtraiter36 = and i32 %0, 1
  %lcmp.mod37 = icmp eq i32 %xtraiter36, 0
  %16 = icmp eq i32 %11, 0
  %wide.trip.count35.1 = zext i32 %0 to i64
  %xtraiter50 = and i32 %0, 1
  %lcmp.mod51 = icmp eq i32 %xtraiter50, 0
  %17 = icmp eq i32 %11, 0
  %xtraiter57 = and i32 %0, 1
  %lcmp.mod58 = icmp eq i32 %xtraiter57, 0
  %18 = icmp eq i32 %11, 0
  %wide.trip.count56.1 = zext i32 %0 to i64
  %wide.trip.count65 = zext i32 %1 to i64
  %wide.trip.count47.1 = zext i32 %0 to i64
  %wide.trip.count70 = zext i32 %1 to i64
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge19, %.preheader5.lr.ph
  %indvars.iv68 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next69, %._crit_edge19 ]
  %indvars.iv61 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next62, %._crit_edge19 ]
  %19 = mul nuw nsw i64 %indvars.iv68, 1201
  %20 = add nuw nsw i64 %19, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %20
  %scevgep44 = bitcast double* %scevgep to i8*
  %21 = sub i64 %13, %indvars.iv68
  %22 = shl i64 %21, 3
  %23 = and i64 %22, 34359738360
  %24 = add nuw nsw i64 %23, 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.07.prol = phi double [ %28, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv68
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %26
  %28 = fadd double %.07.prol, %27
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.07.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  br i1 %15, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.07 = phi double [ %44, %.lr.ph.new ], [ %.07.unr, %.lr.ph.new.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv68
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %30
  %32 = fadd double %.07, %31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv68
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %34
  %36 = fadd double %32, %35
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv68
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fadd double %36, %39
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv68
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %42
  %44 = fadd double %40, %43
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader5
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader5 ], [ %.lcssa.unr, %.prol.loopexit ], [ %44, %._crit_edge.loopexit ]
  %45 = tail call double @sqrt(double %.0.lcssa) #4
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv68
  store double %45, double* %46, align 8
  br i1 %8, label %.lr.ph10.preheader, label %.preheader4

.lr.ph10.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod37, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.preheader
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv68
  %48 = load double, double* %47, align 8
  %49 = load double, double* %46, align 8
  %50 = fdiv double %48, %49
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv68
  store double %50, double* %51, align 8
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol, %.lr.ph10.preheader
  %indvars.iv33.unr.ph = phi i64 [ 1, %.lr.ph10.prol ], [ 0, %.lr.ph10.preheader ]
  br i1 %16, label %.preheader4, label %.lr.ph10.preheader79

.lr.ph10.preheader79:                             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.preheader4.loopexit:                             ; preds = %.lr.ph10
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.lr.ph10.prol.loopexit, %._crit_edge
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %52 = icmp slt i64 %indvars.iv.next69, %14
  br i1 %52, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.preheader4
  br i1 %9, label %.lr.ph18.split.us.preheader, label %._crit_edge19.loopexit32

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv68
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv68
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %.loopexit.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.loopexit.us ], [ %indvars.iv61, %.lr.ph18.split.us.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv63
  store double 0.000000e+00, double* %55, align 8
  br i1 %lcmp.mod51, label %.prol.loopexit49, label %.prol.preheader48

.prol.preheader48:                                ; preds = %.lr.ph18.split.us
  %56 = load double, double* %54, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv63
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = load double, double* %55, align 8
  %61 = fadd double %60, %59
  store double %61, double* %55, align 8
  br label %.prol.loopexit49

.prol.loopexit49:                                 ; preds = %.prol.preheader48, %.lr.ph18.split.us
  %indvars.iv45.unr.ph = phi i64 [ 1, %.prol.preheader48 ], [ 0, %.lr.ph18.split.us ]
  br i1 %17, label %..preheader_crit_edge.us, label %.lr.ph18.split.us.new.preheader

.lr.ph18.split.us.new.preheader:                  ; preds = %.prol.loopexit49
  br label %.lr.ph18.split.us.new

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader78, %.lr.ph15.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.lr.ph15.us ], [ %indvars.iv54.unr.ph, %.lr.ph15.us.preheader78 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv63
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv68
  %65 = load double, double* %64, align 8
  %66 = load double, double* %55, align 8
  %67 = fmul double %65, %66
  %68 = fsub double %63, %67
  store double %68, double* %62, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next55, i64 %indvars.iv63
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next55, i64 %indvars.iv68
  %72 = load double, double* %71, align 8
  %73 = load double, double* %55, align 8
  %74 = fmul double %72, %73
  %75 = fsub double %70, %74
  store double %75, double* %69, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %exitcond.160 = icmp eq i64 %indvars.iv.next55.1, %wide.trip.count56.1
  br i1 %exitcond.160, label %.loopexit.us.loopexit, label %.lr.ph15.us

.lr.ph18.split.us.new:                            ; preds = %.lr.ph18.split.us.new.preheader, %.lr.ph18.split.us.new
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %.lr.ph18.split.us.new ], [ %indvars.iv45.unr.ph, %.lr.ph18.split.us.new.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv68
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv63
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = load double, double* %55, align 8
  %82 = fadd double %81, %80
  store double %82, double* %55, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next46, i64 %indvars.iv68
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next46, i64 %indvars.iv63
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = load double, double* %55, align 8
  %89 = fadd double %88, %87
  store double %89, double* %55, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %exitcond.153 = icmp eq i64 %indvars.iv.next46.1, %wide.trip.count47.1
  br i1 %exitcond.153, label %..preheader_crit_edge.us.loopexit, label %.lr.ph18.split.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph15.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph15.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph18.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit49
  br i1 %10, label %.lr.ph15.us.preheader, label %.loopexit.us

.lr.ph15.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod58, label %.lr.ph15.us.prol.loopexit, label %.lr.ph15.us.prol

.lr.ph15.us.prol:                                 ; preds = %.lr.ph15.us.preheader
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv63
  %91 = load double, double* %90, align 8
  %92 = load double, double* %53, align 8
  %93 = load double, double* %55, align 8
  %94 = fmul double %92, %93
  %95 = fsub double %91, %94
  store double %95, double* %90, align 8
  br label %.lr.ph15.us.prol.loopexit

.lr.ph15.us.prol.loopexit:                        ; preds = %.lr.ph15.us.prol, %.lr.ph15.us.preheader
  %indvars.iv54.unr.ph = phi i64 [ 1, %.lr.ph15.us.prol ], [ 0, %.lr.ph15.us.preheader ]
  br i1 %18, label %.loopexit.us, label %.lr.ph15.us.preheader78

.lr.ph15.us.preheader78:                          ; preds = %.lr.ph15.us.prol.loopexit
  br label %.lr.ph15.us

.lr.ph10:                                         ; preds = %.lr.ph10.preheader79, %.lr.ph10
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.lr.ph10 ], [ %indvars.iv33.unr.ph, %.lr.ph10.preheader79 ]
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv68
  %97 = load double, double* %96, align 8
  %98 = load double, double* %46, align 8
  %99 = fdiv double %97, %98
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33, i64 %indvars.iv68
  store double %99, double* %100, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv68
  %102 = load double, double* %101, align 8
  %103 = load double, double* %46, align 8
  %104 = fdiv double %102, %103
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next34, i64 %indvars.iv68
  store double %104, double* %105, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next34.1, %wide.trip.count35.1
  br i1 %exitcond.1, label %.preheader4.loopexit, label %.lr.ph10

._crit_edge19.loopexit32:                         ; preds = %.lr.ph18
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep44, i8 0, i64 %24, i32 8, i1 false)
  br label %._crit_edge19

._crit_edge19.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge19.loopexit32, %.preheader4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge31.loopexit, label %.preheader5

._crit_edge31.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %5
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
  br i1 %9, label %.preheader4.us.preheader, label %._crit_edge12

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count25 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge10.us ]
  %11 = mul nsw i64 %indvars.iv23, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %19 ]
  %13 = add nsw i64 %indvars.iv19, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge10.us, label %12

._crit_edge10.us:                                 ; preds = %19
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %._crit_edge12.loopexit, label %.preheader4.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %28 = icmp sgt i32 %0, 0
  %29 = icmp sgt i32 %1, 0
  %or.cond = and i1 %28, %29
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %._crit_edge12
  %30 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %31 = mul nsw i64 %indvars.iv14, %30
  br label %32

; <label>:32:                                     ; preds = %39, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %39 ]
  %33 = add nsw i64 %indvars.iv, %31
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 20
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %32
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %38) #6
  br label %39

; <label>:39:                                     ; preds = %37, %32
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %42) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %32

._crit_edge.us:                                   ; preds = %39
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge12
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
