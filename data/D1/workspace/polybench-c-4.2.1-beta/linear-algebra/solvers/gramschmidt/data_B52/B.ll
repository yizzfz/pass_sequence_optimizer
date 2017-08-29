; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
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
define internal void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) #2 {
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
  %24 = add nsw i32 %xtraiter, -1
  %25 = zext i32 %24 to i64
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.prol, i64 0
  %scevgep14.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  %26 = add nuw nsw i64 %25, 1
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %26, %.preheader.us.prol.loopexit.loopexit ]
  %27 = icmp ult i32 %20, 3
  br i1 %27, label %._crit_edge7, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %1 to i64
  %28 = add nsw i64 %wide.trip.count.3, -4
  %29 = sub nsw i64 %28, %indvars.iv.unr
  %30 = lshr i64 %29, 2
  %31 = and i64 %30, 1
  %lcmp.mod26 = icmp eq i64 %31, 0
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
  %32 = icmp eq i64 %30, 0
  br i1 %32, label %._crit_edge7.loopexit, label %._crit_edge.us.3.preheader.new

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

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader5.lr.ph, label %._crit_edge27

.preheader5.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = add i32 %0, -1
  %9 = add i32 %1, -2
  %10 = zext i32 %9 to i64
  %11 = sext i32 %1 to i64
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %wide.trip.count.3 = zext i32 %0 to i64
  %xtraiter32 = and i32 %0, 1
  %lcmp.mod33 = icmp eq i32 %xtraiter32, 0
  %13 = icmp eq i32 %8, 0
  %wide.trip.count61 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge17, %.preheader5.lr.ph
  %indvars.iv64 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next65, %._crit_edge17 ]
  %indvars.iv57 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next58, %._crit_edge17 ]
  %17 = mul nuw nsw i64 %indvars.iv64, 1201
  %18 = add nuw nsw i64 %17, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %18
  %scevgep40 = bitcast double* %scevgep to i8*
  %19 = sub i64 %10, %indvars.iv64
  %20 = shl i64 %19, 3
  %21 = and i64 %20, 34359738360
  %22 = add nuw nsw i64 %21, 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.07.prol = phi double [ %26, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv64
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %24
  %26 = fadd double %.07.prol, %25
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %16, %.prol.loopexit.loopexit ]
  %.07.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %26, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %26, %.prol.loopexit.loopexit ]
  br i1 %12, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.07 = phi double [ %42, %.lr.ph.new ], [ %.07.unr, %.lr.ph.new.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv64
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %28
  %30 = fadd double %.07, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv64
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %32
  %34 = fadd double %30, %33
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv64
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %36
  %38 = fadd double %34, %37
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv64
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fadd double %38, %41
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader5
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader5 ], [ %.lcssa.unr, %.prol.loopexit ], [ %42, %._crit_edge.loopexit ]
  %43 = tail call double @sqrt(double %.0.lcssa) #5
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv64
  store double %43, double* %44, align 8
  br i1 %7, label %.lr.ph10.preheader, label %.preheader4

.lr.ph10.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod33, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.preheader
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv64
  %46 = load double, double* %45, align 8
  %47 = fdiv double %46, %43
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv64
  store double %47, double* %48, align 8
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol, %.lr.ph10.preheader
  %indvars.iv29.unr.ph = phi i64 [ 1, %.lr.ph10.prol ], [ 0, %.lr.ph10.preheader ]
  br i1 %13, label %.preheader4, label %.lr.ph10.preheader77

.lr.ph10.preheader77:                             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.preheader4.loopexit:                             ; preds = %.lr.ph10
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.lr.ph10.prol.loopexit, %._crit_edge
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %49 = icmp slt i64 %indvars.iv.next65, %11
  br i1 %49, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %.preheader4
  br i1 %7, label %.lr.ph16.split.us.preheader, label %._crit_edge17.loopexit28

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv64
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %.lr.ph16.split.us.preheader, %.loopexit.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %.loopexit.us ], [ %indvars.iv57, %.lr.ph16.split.us.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv59
  store double 0.000000e+00, double* %51, align 8
  br i1 %lcmp.mod33, label %.prol.loopexit45, label %.prol.preheader44

.prol.preheader44:                                ; preds = %.lr.ph16.split.us
  %52 = load double, double* %50, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv59
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, 0.000000e+00
  store double %56, double* %51, align 8
  br label %.prol.loopexit45

.prol.loopexit45:                                 ; preds = %.prol.preheader44, %.lr.ph16.split.us
  %57 = phi double [ %56, %.prol.preheader44 ], [ 0.000000e+00, %.lr.ph16.split.us ]
  %indvars.iv41.unr.ph = phi i64 [ 1, %.prol.preheader44 ], [ 0, %.lr.ph16.split.us ]
  br i1 %13, label %.lr.ph15.us.preheader, label %.lr.ph16.split.us.new.preheader

.lr.ph16.split.us.new.preheader:                  ; preds = %.prol.loopexit45
  br label %.lr.ph16.split.us.new

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader76, %.lr.ph15.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph15.us ], [ %indvars.iv50.unr.ph, %.lr.ph15.us.preheader76 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvars.iv59
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv64
  %61 = load double, double* %60, align 8
  %62 = load double, double* %51, align 8
  %63 = fmul double %61, %62
  %64 = fsub double %59, %63
  store double %64, double* %58, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next51, i64 %indvars.iv59
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next51, i64 %indvars.iv64
  %68 = load double, double* %67, align 8
  %69 = load double, double* %51, align 8
  %70 = fmul double %68, %69
  %71 = fsub double %66, %70
  store double %71, double* %65, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond.156 = icmp eq i64 %indvars.iv.next51.1, %wide.trip.count.3
  br i1 %exitcond.156, label %.loopexit.us.loopexit, label %.lr.ph15.us

.lr.ph16.split.us.new:                            ; preds = %.lr.ph16.split.us.new.preheader, %.lr.ph16.split.us.new
  %72 = phi double [ %84, %.lr.ph16.split.us.new ], [ %57, %.lr.ph16.split.us.new.preheader ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %.lr.ph16.split.us.new ], [ %indvars.iv41.unr.ph, %.lr.ph16.split.us.new.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv64
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv41, i64 %indvars.iv59
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %72, %77
  store double %78, double* %51, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next42, i64 %indvars.iv64
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next42, i64 %indvars.iv59
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double %78, %83
  store double %84, double* %51, align 8
  %indvars.iv.next42.1 = add nuw nsw i64 %indvars.iv41, 2
  %exitcond.149 = icmp eq i64 %indvars.iv.next42.1, %wide.trip.count.3
  br i1 %exitcond.149, label %.lr.ph15.us.preheader.loopexit, label %.lr.ph16.split.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph15.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph15.us.prol.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.lr.ph16.split.us

.lr.ph15.us.preheader.loopexit:                   ; preds = %.lr.ph16.split.us.new
  br label %.lr.ph15.us.preheader

.lr.ph15.us.preheader:                            ; preds = %.lr.ph15.us.preheader.loopexit, %.prol.loopexit45
  %85 = phi double [ %57, %.prol.loopexit45 ], [ %84, %.lr.ph15.us.preheader.loopexit ]
  br i1 %lcmp.mod33, label %.lr.ph15.us.prol.loopexit, label %.lr.ph15.us.prol

.lr.ph15.us.prol:                                 ; preds = %.lr.ph15.us.preheader
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv59
  %87 = load double, double* %86, align 8
  %88 = load double, double* %50, align 8
  %89 = fmul double %88, %85
  %90 = fsub double %87, %89
  store double %90, double* %86, align 8
  br label %.lr.ph15.us.prol.loopexit

.lr.ph15.us.prol.loopexit:                        ; preds = %.lr.ph15.us.prol, %.lr.ph15.us.preheader
  %indvars.iv50.unr.ph = phi i64 [ 1, %.lr.ph15.us.prol ], [ 0, %.lr.ph15.us.preheader ]
  br i1 %13, label %.loopexit.us, label %.lr.ph15.us.preheader76

.lr.ph15.us.preheader76:                          ; preds = %.lr.ph15.us.prol.loopexit
  br label %.lr.ph15.us

.lr.ph10:                                         ; preds = %.lr.ph10.preheader77, %.lr.ph10
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.lr.ph10 ], [ %indvars.iv29.unr.ph, %.lr.ph10.preheader77 ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv64
  %92 = load double, double* %91, align 8
  %93 = load double, double* %44, align 8
  %94 = fdiv double %92, %93
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv64
  store double %94, double* %95, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next30, i64 %indvars.iv64
  %97 = load double, double* %96, align 8
  %98 = load double, double* %44, align 8
  %99 = fdiv double %97, %98
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next30, i64 %indvars.iv64
  store double %99, double* %100, align 8
  %indvars.iv.next30.1 = add nuw nsw i64 %indvars.iv29, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next30.1, %wide.trip.count.3
  br i1 %exitcond.1, label %.preheader4.loopexit, label %.lr.ph10

._crit_edge17.loopexit28:                         ; preds = %.lr.ph16
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep40, i8 0, i64 %22, i32 8, i1 false)
  br label %._crit_edge17

._crit_edge17.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge17.loopexit28, %.preheader4
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count61
  br i1 %exitcond67, label %._crit_edge27.loopexit, label %.preheader5

._crit_edge27.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readnone, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader6.us.preheader, label %._crit_edge14

.preheader6.us.preheader:                         ; preds = %5
  %11 = sext i32 %1 to i64
  %wide.trip.count23 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge12.us, %.preheader6.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next26, %._crit_edge12.us ]
  %12 = mul nsw i64 %indvars.iv25, %11
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader6.us
  %indvars.iv21 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next22, %20 ]
  %14 = add nsw i64 %indvars.iv21, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc5.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv21
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge12.us, label %13

._crit_edge12.us:                                 ; preds = %20
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count23
  br i1 %exitcond28, label %._crit_edge14.loopexit, label %.preheader6.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %29 = icmp sgt i32 %0, 0
  %or.cond = and i1 %29, %10
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge9

.preheader.us.preheader:                          ; preds = %._crit_edge14
  %30 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %31 = mul nsw i64 %indvars.iv16, %30
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
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv16, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %42) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %32

._crit_edge.us:                                   ; preds = %39
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge14
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %46) #6
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
